//
// Copyright 2010-2024 Amazon.com, Inc. or its affiliates. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License").
// You may not use this file except in compliance with the License.
// A copy of the License is located at
//
// http://aws.amazon.com/apache2.0
//
// or in the "license" file accompanying this file. This file is distributed
// on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
// express or implied. See the License for the specific language governing
// permissions and limitations under the License.
//

#import "AWSIoTStreamThread.h"
#import <AWSCore/AWSDDLogMacros.h>

@interface AWSIoTStreamThread()

@property(nonatomic, strong, nullable) AWSMQTTSession *session;
@property(nonatomic, strong, nullable) NSOutputStream *encoderOutputStream;
@property(nonatomic, strong, nullable) NSInputStream  *decoderInputStream;
@property(nonatomic, strong, nullable) NSOutputStream *outputStream;
@property(nonatomic, strong, nullable) NSTimer *defaultRunLoopTimer;
@property(nonatomic, strong, nullable) NSRunLoop *runLoopForStreamsThread;
@property(nonatomic, assign) NSTimeInterval defaultRunLoopTimeInterval;
@property(nonatomic, assign) BOOL isRunning;
@property(nonatomic, assign) BOOL shouldDisconnect;

// Add synchronization primitives
@property(nonatomic, strong) dispatch_queue_t cleanupQueue;
@property(nonatomic, strong) dispatch_semaphore_t cleanupSemaphore;
@property(nonatomic, assign) BOOL isCleaningUp;
@end

@implementation AWSIoTStreamThread

- (nonnull instancetype)initWithSession:(nonnull AWSMQTTSession *)session 
                     decoderInputStream:(nonnull NSInputStream *)decoderInputStream
                    encoderOutputStream:(nonnull NSOutputStream *)encoderOutputStream {
    return [self initWithSession:session
              decoderInputStream:decoderInputStream
             encoderOutputStream:encoderOutputStream
                    outputStream:nil];
}

- (instancetype)initWithSession:(nonnull AWSMQTTSession *)session
             decoderInputStream:(nonnull NSInputStream *)decoderInputStream
            encoderOutputStream:(nonnull NSOutputStream *)encoderOutputStream
                   outputStream:(nullable NSOutputStream *)outputStream {
    if (self = [super init]) {
        _session = session;
        _decoderInputStream = decoderInputStream;
        _encoderOutputStream = encoderOutputStream;
        _outputStream = outputStream;
        _defaultRunLoopTimeInterval = 10;
        _shouldDisconnect = NO;
        _isCleaningUp = NO;
        
        // Initialize synchronization primitives
        _cleanupQueue = dispatch_queue_create("com.amazonaws.iot.streamthread.cleanup", DISPATCH_QUEUE_SERIAL);
        _cleanupSemaphore = dispatch_semaphore_create(1);
    }
    return self;
}

- (void)main {
    @autoreleasepool {
        AWSDDLogVerbose(@"Started execution of Thread: [%@]", self);
        
        if (![self setupRunLoop]) {
            AWSDDLogError(@"Failed to setup run loop for thread: [%@]", self);
            return;
        }
        
        [self startIOOperations];
        
        while ([self shouldContinueRunning]) {
            @autoreleasepool {
                [self.runLoopForStreamsThread runMode:NSDefaultRunLoopMode
                                           beforeDate:[NSDate dateWithTimeIntervalSinceNow:self.defaultRunLoopTimeInterval]];
            }
        }
        
        [self performCleanup];
        
        AWSDDLogVerbose(@"Finished execution of Thread: [%@]", self);
    }
}

- (BOOL)setupRunLoop {
    if (self.isRunning) {
        AWSDDLogError(@"Thread already running");
        return NO;
    }
    
    self.runLoopForStreamsThread = [NSRunLoop currentRunLoop];
    
    // Setup timer with weak reference to prevent retain cycles
    __weak typeof(self) weakSelf = self;
    self.defaultRunLoopTimer = [[NSTimer alloc] initWithFireDate:[NSDate dateWithTimeIntervalSinceNow:60.0]
                                                        interval:60.0
                                                          target:weakSelf
                                                        selector:@selector(timerHandler:)
                                                        userInfo:nil
                                                         repeats:YES];
    
    if (!self.defaultRunLoopTimer) {
        AWSDDLogError(@"Failed to create run loop timer");
        return NO;
    }
    [self.runLoopForStreamsThread addTimer:self.defaultRunLoopTimer
                                   forMode:NSDefaultRunLoopMode];
    self.isRunning = YES;
    return YES;
}

- (void)startIOOperations {
    if (self.outputStream) {
        [self.outputStream scheduleInRunLoop:self.runLoopForStreamsThread
                                     forMode:NSDefaultRunLoopMode];
        [self.outputStream open];
    }
    [self.session connectToInputStream:self.decoderInputStream
                          outputStream:self.encoderOutputStream];
}

- (BOOL)shouldContinueRunning {
    __block BOOL shouldRun;
    dispatch_sync(self.cleanupQueue, ^{
        shouldRun = self.isRunning && !self.isCancelled && self.defaultRunLoopTimer != nil;
    });
    return shouldRun;
}

- (void)invalidateTimer {
    dispatch_sync(self.cleanupQueue, ^{
        if (self.defaultRunLoopTimer) {
            [self.defaultRunLoopTimer invalidate];
            self.defaultRunLoopTimer = nil;
        }
    });
}

- (void)cancel {
    AWSDDLogVerbose(@"Issued Cancel on thread [%@]", (NSThread *)self);
    [self cancelWithDisconnect:NO];
}

- (void)cancelAndDisconnect:(BOOL)shouldDisconnect {
    AWSDDLogVerbose(@"Issued Cancel and Disconnect = [%@] on thread [%@]",
                    shouldDisconnect ? @"YES" : @"NO", (NSThread *)self);
    [self cancelWithDisconnect:shouldDisconnect];
}

- (void)cancelWithDisconnect:(BOOL)shouldDisconnect {
    // Ensure thread-safe property updates
    dispatch_sync(self.cleanupQueue, ^{
        if (!self.isCleaningUp) {
            self.shouldDisconnect = shouldDisconnect;
            self.isRunning = NO;
            [super cancel];
            
            // Invalidate timer to trigger run loop exit
            [self invalidateTimer];
        }
    });
}

- (void)performCleanup {
    dispatch_semaphore_wait(self.cleanupSemaphore, DISPATCH_TIME_FOREVER);
    
    if (self.isCleaningUp) {
        dispatch_semaphore_signal(self.cleanupSemaphore);
        return;
    }
    
    self.isCleaningUp = YES;
    dispatch_semaphore_signal(self.cleanupSemaphore);
    
    dispatch_sync(self.cleanupQueue, ^{
        [self cleanupResources];
    });
}

- (void)cleanupResources {
    if (self.shouldDisconnect) {
        [self closeSession];
        [self closeStreams];
    } else {
        AWSDDLogVerbose(@"Skipping disconnect for thread: [%@]", (NSThread *)self);
    }
    
    // Handle onStop callback
    dispatch_block_t stopBlock = self.onStop;
    if (stopBlock) {
        self.onStop = nil;
        stopBlock();
    }
}

- (void)closeSession {
    if (self.session) {
        [self.session close];
        self.session = nil;
    }
}

- (void)closeStreams {
    if (self.outputStream) {
        self.outputStream.delegate = nil;
        [self.outputStream close];
        [self.outputStream removeFromRunLoop:self.runLoopForStreamsThread
                                     forMode:NSDefaultRunLoopMode];
        self.outputStream = nil;
    }
    
    if (self.decoderInputStream) {
        [self.decoderInputStream close];
        self.decoderInputStream = nil;
    }
    
    if (self.encoderOutputStream) {
        [self.encoderOutputStream close];
        self.encoderOutputStream = nil;
    }
}

- (void)timerHandler:(NSTimer*)theTimer {
    AWSDDLogVerbose(@"Default run loop timer executed on Thread: [%@]. isRunning = %@. isCancelled = %@",
                    self, self.isRunning ? @"YES" : @"NO", self.isCancelled ? @"YES" : @"NO");
}

- (void)dealloc {
    AWSDDLogVerbose(@"Deallocating AWSIoTStreamThread: [%@]", self);
}

@end
