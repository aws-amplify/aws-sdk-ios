/*
 *  Copyright (c) 2014, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the BSD-style license found in the
 *  LICENSE file in the root directory of this source tree. An additional grant
 *  of patent rights can be found in the PATENTS file in the same directory.
 *
 */

#import "AWSTask.h"

#import <libkern/OSAtomic.h>

#import "AWSBolts.h"

__attribute__ ((noinline)) void awsbf_warnBlockingOperationOnMainThread() {
    NSLog(@"Warning: A long-running operation is being executed on the main thread. \n"
          " Break on awsbf_warnBlockingOperationOnMainThread() to debug.");
}

NSString *const AWSTaskErrorDomain = @"bolts";
NSInteger const kAWSMultipleErrorsError = 80175001;
NSString *const AWSTaskMultipleExceptionsException = @"AWSMultipleExceptionsException";

@interface AWSTask () {
    id _result;
    NSError *_error;
    NSException *_exception;
}

@property (nonatomic, assign, readwrite, getter=isCancelled) BOOL cancelled;
@property (nonatomic, assign, readwrite, getter=isFaulted) BOOL faulted;
@property (nonatomic, assign, readwrite, getter=isCompleted) BOOL completed;

@property (nonatomic, strong) NSObject *lock;
@property (nonatomic, strong) NSCondition *condition;
@property (nonatomic, strong) NSMutableArray *callbacks;

@end

@implementation AWSTask

#pragma mark - Initializer

- (instancetype)init {
    self = [super init];
    if (!self) return nil;

    _lock = [[NSObject alloc] init];
    _condition = [[NSCondition alloc] init];
    _callbacks = [NSMutableArray array];

    return self;
}

- (instancetype)initWithResult:(id)result {
    self = [super init];
    if (!self) return nil;

    [self trySetResult:result];

    return self;
}

- (instancetype)initWithError:(NSError *)error {
    self = [super init];
    if (!self) return nil;

    [self trySetError:error];

    return self;
}

- (instancetype)initWithException:(NSException *)exception {
    self = [super init];
    if (!self) return nil;

    [self trySetException:exception];

    return self;
}

- (instancetype)initCancelled {
    self = [super init];
    if (!self) return nil;

    [self trySetCancelled];

    return self;
}

#pragma mark - Task Class methods

+ (instancetype)taskWithResult:(id)result {
    return [[self alloc] initWithResult:result];
}

+ (instancetype)taskWithError:(NSError *)error {
    return [[self alloc] initWithError:error];
}

+ (instancetype)taskWithException:(NSException *)exception {
    return [[self alloc] initWithException:exception];
}

+ (instancetype)cancelledTask {
    return [[self alloc] initCancelled];
}

+ (instancetype)taskForCompletionOfAllTasks:(NSArray<AWSTask *> *)tasks {
    __block int32_t total = (int32_t)tasks.count;
    if (total == 0) {
        return [self taskWithResult:nil];
    }

    __block int32_t cancelled = 0;
    NSObject *lock = [[NSObject alloc] init];
    NSMutableArray *errors = [NSMutableArray array];
    NSMutableArray *exceptions = [NSMutableArray array];

    AWSTaskCompletionSource *tcs = [AWSTaskCompletionSource taskCompletionSource];
    for (AWSTask *task in tasks) {
        [task continueWithBlock:^id(AWSTask *task) {
            if (task.exception) {
                @synchronized (lock) {
                    [exceptions addObject:task.exception];
                }
            } else if (task.error) {
                @synchronized (lock) {
                    [errors addObject:task.error];
                }
            } else if (task.cancelled) {
                OSAtomicIncrement32(&cancelled);
            }

            if (OSAtomicDecrement32(&total) == 0) {
                if (exceptions.count > 0) {
                    if (exceptions.count == 1) {
                        tcs.exception = [exceptions firstObject];
                    } else {
                        NSException *exception =
                        [NSException exceptionWithName:AWSTaskMultipleExceptionsException
                                                reason:@"There were multiple exceptions."
                                              userInfo:@{ @"exceptions": exceptions }];
                        tcs.exception = exception;
                    }
                } else if (errors.count > 0) {
                    if (errors.count == 1) {
                        tcs.error = [errors firstObject];
                    } else {
                        NSError *error = [NSError errorWithDomain:AWSTaskErrorDomain
                                                             code:kAWSMultipleErrorsError
                                                         userInfo:@{ @"errors": errors }];
                        tcs.error = error;
                    }
                } else if (cancelled > 0) {
                    [tcs cancel];
                } else {
                    tcs.result = nil;
                }
            }
            return nil;
        }];
    }
    return tcs.task;
}

+ (instancetype)taskForCompletionOfAllTasksWithResults:(NSArray<AWSTask *> *)tasks {
    return [[self taskForCompletionOfAllTasks:tasks] continueWithSuccessBlock:^id(AWSTask *task) {
        return [tasks valueForKey:@"result"];
    }];
}

+ (instancetype)taskWithDelay:(int)millis {
    AWSTaskCompletionSource *tcs = [AWSTaskCompletionSource taskCompletionSource];
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, millis * NSEC_PER_MSEC);
    dispatch_after(popTime, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void){
        tcs.result = nil;
    });
    return tcs.task;
}

+ (instancetype)taskWithDelay:(int)millis
            cancellationToken:(AWSCancellationToken *)token {
    if (token.cancellationRequested) {
        return [AWSTask cancelledTask];
    }

    AWSTaskCompletionSource *tcs = [AWSTaskCompletionSource taskCompletionSource];
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, millis * NSEC_PER_MSEC);
    dispatch_after(popTime, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void){
        if (token.cancellationRequested) {
            [tcs cancel];
            return;
        }
        tcs.result = nil;
    });
    return tcs.task;
}

+ (instancetype)taskFromExecutor:(AWSExecutor *)executor withBlock:(nullable id (^)())block {
    return [[self taskWithResult:nil] continueWithExecutor:executor withBlock:^id(AWSTask *task) {
        return block();
    }];
}

#pragma mark - Custom Setters/Getters

- (id)result {
    @synchronized(self.lock) {
        return _result;
    }
}

- (BOOL)trySetResult:(id)result {
    @synchronized(self.lock) {
        if (self.completed) {
            return NO;
        }
        self.completed = YES;
        _result = result;
        [self runContinuations];
        return YES;
    }
}

- (NSError *)error {
    @synchronized(self.lock) {
        return _error;
    }
}

- (BOOL)trySetError:(NSError *)error {
    @synchronized(self.lock) {
        if (self.completed) {
            return NO;
        }
        self.completed = YES;
        self.faulted = YES;
        _error = error;
        [self runContinuations];
        return YES;
    }
}

- (NSException *)exception {
    @synchronized(self.lock) {
        return _exception;
    }
}

- (BOOL)trySetException:(NSException *)exception {
    @synchronized(self.lock) {
        if (self.completed) {
            return NO;
        }
        self.completed = YES;
        self.faulted = YES;
        _exception = exception;
        [self runContinuations];
        return YES;
    }
}

- (BOOL)isCancelled {
    @synchronized(self.lock) {
        return _cancelled;
    }
}

- (BOOL)isFaulted {
    @synchronized(self.lock) {
        return _faulted;
    }
}

- (BOOL)trySetCancelled {
    @synchronized(self.lock) {
        if (self.completed) {
            return NO;
        }
        self.completed = YES;
        self.cancelled = YES;
        [self runContinuations];
        return YES;
    }
}

- (BOOL)isCompleted {
    @synchronized(self.lock) {
        return _completed;
    }
}

- (void)setCompleted {
    @synchronized(self.lock) {
        _completed = YES;
    }
}

- (void)runContinuations {
    @synchronized(self.lock) {
        [self.condition lock];
        [self.condition broadcast];
        [self.condition unlock];
        for (void (^callback)() in self.callbacks) {
            callback();
        }
        [self.callbacks removeAllObjects];
    }
}

#pragma mark - Chaining methods

- (AWSTask *)continueWithExecutor:(AWSExecutor *)executor
                       withBlock:(AWSContinuationBlock)block {
    return [self continueWithExecutor:executor block:block cancellationToken:nil];
}

- (AWSTask *)continueWithExecutor:(AWSExecutor *)executor
                           block:(AWSContinuationBlock)block
               cancellationToken:(AWSCancellationToken *)cancellationToken {
    AWSTaskCompletionSource *tcs = [AWSTaskCompletionSource taskCompletionSource];

    // Capture all of the state that needs to used when the continuation is complete.
    void (^wrappedBlock)() = ^() {
        [executor execute:^{
            if (cancellationToken.cancellationRequested) {
                [tcs cancel];
                return;
            }

            id result = nil;
            @try {
                result = block(self);
            } @catch (NSException *exception) {
                tcs.exception = exception;
                return;
            }

            if ([result isKindOfClass:[AWSTask class]]) {

                id (^setupWithTask) (AWSTask *) = ^id(AWSTask *task) {
                    if (cancellationToken.cancellationRequested || task.cancelled) {
                        [tcs cancel];
                    } else if (task.exception) {
                        tcs.exception = task.exception;
                    } else if (task.error) {
                        tcs.error = task.error;
                    } else {
                        tcs.result = task.result;
                    }
                    return nil;
                };

                AWSTask *resultTask = (AWSTask *)result;

                if (resultTask.completed) {
                    setupWithTask(resultTask);
                } else {
                    [resultTask continueWithBlock:setupWithTask];
                }

            } else {
                tcs.result = result;
            }
        }];
    };

    BOOL completed;
    @synchronized(self.lock) {
        completed = self.completed;
        if (!completed) {
            [self.callbacks addObject:[wrappedBlock copy]];
        }
    }
    if (completed) {
        wrappedBlock();
    }

    return tcs.task;
}

- (AWSTask *)continueWithBlock:(AWSContinuationBlock)block {
    return [self continueWithExecutor:[AWSExecutor defaultExecutor] block:block cancellationToken:nil];
}

- (AWSTask *)continueWithBlock:(AWSContinuationBlock)block
            cancellationToken:(AWSCancellationToken *)cancellationToken {
    return [self continueWithExecutor:[AWSExecutor defaultExecutor] block:block cancellationToken:cancellationToken];
}

- (AWSTask *)continueWithExecutor:(AWSExecutor *)executor
                withSuccessBlock:(AWSContinuationBlock)block {
    return [self continueWithExecutor:executor successBlock:block cancellationToken:nil];
}

- (AWSTask *)continueWithExecutor:(AWSExecutor *)executor
                    successBlock:(AWSContinuationBlock)block
               cancellationToken:(AWSCancellationToken *)cancellationToken {
    if (cancellationToken.cancellationRequested) {
        return [AWSTask cancelledTask];
    }

    return [self continueWithExecutor:executor block:^id(AWSTask *task) {
        if (task.faulted || task.cancelled) {
            return task;
        } else {
            return block(task);
        }
    } cancellationToken:cancellationToken];
}

- (AWSTask *)continueWithSuccessBlock:(AWSContinuationBlock)block {
    return [self continueWithExecutor:[AWSExecutor defaultExecutor] successBlock:block cancellationToken:nil];
}

- (AWSTask *)continueWithSuccessBlock:(AWSContinuationBlock)block
                   cancellationToken:(AWSCancellationToken *)cancellationToken {
    return [self continueWithExecutor:[AWSExecutor defaultExecutor] successBlock:block cancellationToken:cancellationToken];
}

#pragma mark - Syncing Task (Avoid it)

- (void)warnOperationOnMainThread {
    awsbf_warnBlockingOperationOnMainThread();
}

- (void)waitUntilFinished {
    if ([NSThread isMainThread]) {
        [self warnOperationOnMainThread];
    }

    @synchronized(self.lock) {
        if (self.completed) {
            return;
        }
        [self.condition lock];
    }
    [self.condition wait];
    [self.condition unlock];
}

#pragma mark - NSObject

- (NSString *)description {
    // Acquire the data from the locked properties
    BOOL completed;
    BOOL cancelled;
    BOOL faulted;
    NSString *resultDescription = nil;

    @synchronized(self.lock) {
        completed = self.completed;
        cancelled = self.cancelled;
        faulted = self.faulted;
        resultDescription = completed ? [NSString stringWithFormat:@" result = %@", self.result] : @"";
    }

    // Description string includes status information and, if available, the
    // result since in some ways this is what a promise actually "is".
    return [NSString stringWithFormat:@"<%@: %p; completed = %@; cancelled = %@; faulted = %@;%@>",
            NSStringFromClass([self class]),
            self,
            completed ? @"YES" : @"NO",
            cancelled ? @"YES" : @"NO",
            faulted ? @"YES" : @"NO",
            resultDescription];
}

@end
