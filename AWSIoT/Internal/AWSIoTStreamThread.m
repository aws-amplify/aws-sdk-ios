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
#if TARGET_OS_IOS && !TARGET_OS_WATCH
#import <UIKit/UIKit.h>
#endif

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
@property(nonatomic, strong) dispatch_queue_t serialQueue;
@property(nonatomic, assign) BOOL didCleanUp;
@property(nonatomic, assign) BOOL isDeallocationInProgress;
@property(nonatomic, strong) NSDate *threadCreationTime;
@property(nonatomic, strong) NSDate *threadStartTime;
@property(nonatomic, assign) NSUInteger backgroundTransitionCount;

// Private helper methods
- (NSString *)safeAppStateString;
#if TARGET_OS_IOS && !TARGET_OS_WATCH
- (NSString *)stringForApplicationState:(UIApplicationState)state;
#endif

@end

@implementation AWSIoTStreamThread

#pragma mark - Helper Methods

/**
 * Returns a string representation of the current UIApplicationState.
 * This method safely handles App Extension contexts where UIApplication.sharedApplication is unavailable.
 * 
 * @return NSString representing the current app state:
 *         - "Active", "Background", "Inactive" for normal app states
 *         - "Extension" when running in an App Extension
 *         - "Unavailable" when UIApplication access fails
 *         - "N/A" on non-iOS platforms or when UIKit is unavailable
 */
- (NSString *)safeAppStateString {
#if TARGET_OS_IOS && !TARGET_OS_WATCH
    // Fast check for App Extension context - extensions have file extensions in their bundle path
    NSString *bundlePath = [NSBundle mainBundle].bundlePath;
    if (bundlePath.pathExtension.length > 0) {
        return @"Extension";
    }
    
    // Safe UIApplication access with exception handling
    @try {
        UIApplication *app = [UIApplication sharedApplication];
        if (app) {
            return [self stringForApplicationState:app.applicationState];
        }
    } @catch (NSException *exception) {
        // UIApplication.sharedApplication can throw in certain contexts
        return @"Unavailable";
    }
#endif
    return @"N/A";
}

/**
 * Converts UIApplicationState enum to string representation.
 * Separated into its own method for clarity and potential reuse.
 */
- (NSString *)stringForApplicationState:(UIApplicationState)state {
    switch (state) {
        case UIApplicationStateActive:
            return @"Active";
        case UIApplicationStateBackground:
            return @"Background";
        case UIApplicationStateInactive:
            return @"Inactive";
        default:
            return @"Unknown";
    }
}

- (void)dealloc {
    // Enhanced logging for crash analysis
    NSTimeInterval threadLifetime = self.threadCreationTime ? [[NSDate date] timeIntervalSinceDate:self.threadCreationTime] : 0;
    NSTimeInterval runtimeDuration = self.threadStartTime ? [[NSDate date] timeIntervalSinceDate:self.threadStartTime] : 0;
    
    AWSDDLogInfo(@"[CRASH-ANALYSIS] AWSIoTStreamThread dealloc - Thread: %@, Lifetime: %.2fs, Runtime: %.2fs, BackgroundTransitions: %lu, IsRunning: %@, DidCleanUp: %@, ShouldDisconnect: %@", 
                 self, threadLifetime, runtimeDuration, (unsigned long)self.backgroundTransitionCount,
                 self.isRunning ? @"YES" : @"NO", self.didCleanUp ? @"YES" : @"NO", self.shouldDisconnect ? @"YES" : @"NO");
    
    // Log current app state for context
    NSString *appStateString = [self safeAppStateString];
    AWSDDLogInfo(@"[CRASH-ANALYSIS] App state during dealloc: %@", appStateString);
    
    // Remove notification observers first
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
    // Mark deallocation in progress to prevent race conditions
    _isDeallocationInProgress = YES;
    
    // Ensure cleanup is called before deallocation
    // Use dispatch_sync with a timeout to prevent deadlocks
    if (_serialQueue && !_didCleanUp) {
        dispatch_queue_t queue = _serialQueue;
        dispatch_time_t timeout = dispatch_time(DISPATCH_TIME_NOW, 2 * NSEC_PER_SEC);
        
        dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
        dispatch_async(queue, ^{
            [self cleanUp];
            dispatch_semaphore_signal(semaphore);
        });
        
        // Wait with timeout to prevent hanging during deallocation
        dispatch_semaphore_wait(semaphore, timeout);
    }
    
    // Safely nullify properties to prevent access during ARC cleanup
    _session = nil;
    _encoderOutputStream = nil;
    _decoderInputStream = nil;
    _outputStream = nil;
    _defaultRunLoopTimer = nil;
    _runLoopForStreamsThread = nil;
    _onStop = nil;
}

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
        _serialQueue = dispatch_queue_create("com.amazonaws.iot.streamthread.syncQueue", DISPATCH_QUEUE_SERIAL);
        _didCleanUp = NO;
        _isDeallocationInProgress = NO;
        _threadCreationTime = [NSDate date];
        _backgroundTransitionCount = 0;
        
        // Log thread creation with context
        NSString *appStateString = [self safeAppStateString];
        AWSDDLogInfo(@"[CRASH-ANALYSIS] AWSIoTStreamThread created - Thread: %@, App State: %@, HasOutputStream: %@", 
                     self, appStateString, outputStream ? @"YES" : @"NO");
        
        // Register for app state change notifications to track background transitions (if available)
#if TARGET_OS_IOS && !TARGET_OS_WATCH && !defined(NS_EXTENSION_UNAVAILABLE_IOS)
        if ([NSBundle mainBundle].bundlePath.pathExtension.length == 0) {
            // Only register for notifications in main app, not in extensions
            [[NSNotificationCenter defaultCenter] addObserver:self
                                                     selector:@selector(appDidEnterBackground:)
                                                         name:UIApplicationDidEnterBackgroundNotification
                                                       object:nil];
            
            [[NSNotificationCenter defaultCenter] addObserver:self
                                                     selector:@selector(appWillEnterForeground:)
                                                         name:UIApplicationWillEnterForegroundNotification
                                                       object:nil];
        }
#endif
    }
    return self;
}

- (void)main {
    if (self.isRunning) {
        AWSDDLogWarn(@"[CRASH-ANALYSIS] Attempted to start a thread that is already running: [%@]", self);
        return;
    }

    self.threadStartTime = [NSDate date];
    NSTimeInterval creationToStartDelay = [self.threadStartTime timeIntervalSinceDate:self.threadCreationTime];
    
    NSString *appStateString = [self safeAppStateString];
    
    AWSDDLogInfo(@"[CRASH-ANALYSIS] Started execution of Thread: [%@], App State: %@, Creation-to-Start Delay: %.3fs, Background Transitions: %lu", 
                 self, appStateString, creationToStartDelay, (unsigned long)self.backgroundTransitionCount);
    //This is invoked in a new thread by the webSocketDidOpen method or by the Connect method. Get the runLoop from the thread.
    self.runLoopForStreamsThread = [NSRunLoop currentRunLoop];

    //Setup a default timer to ensure that the RunLoop always has atleast one timer on it. This is to prevent the while loop
    //below to spin in tight loop when all input sources and session timers are shutdown during a reconnect sequence.
    __weak typeof(self) weakSelf = self;
    self.defaultRunLoopTimer = [[NSTimer alloc] initWithFireDate:[NSDate dateWithTimeIntervalSinceNow:60.0]
                                                        interval:60.0
                                                         repeats:YES
                                                           block:^(NSTimer * _Nonnull timer) {
        AWSDDLogVerbose(@"Default run loop timer executed on Thread: [%@]. isRunning = %@. isCancelled = %@", weakSelf, weakSelf.isRunning ? @"YES" : @"NO", weakSelf.isCancelled ? @"YES" : @"NO");
    }];
    [self.runLoopForStreamsThread addTimer:self.defaultRunLoopTimer
                                   forMode:NSDefaultRunLoopMode];

    self.isRunning = YES;
    if (self.outputStream) {
        [self.outputStream scheduleInRunLoop:self.runLoopForStreamsThread
                                        forMode:NSDefaultRunLoopMode];
        [self.outputStream open];
    }

    //Update the runLoop and runLoopMode in session.
    [self.session connectToInputStream:self.decoderInputStream
                          outputStream:self.encoderOutputStream];

    NSUInteger runLoopCycles = 0;
    NSDate *lastLogTime = [NSDate date];
    
    while ([self shouldContinueRunning]) {
        //This will continue run until the thread is cancelled
        //Run one cycle of the runloop. This will return after a input source event or timer event is processed
        [self.runLoopForStreamsThread runMode:NSDefaultRunLoopMode
                                   beforeDate:[NSDate dateWithTimeIntervalSinceNow:self.defaultRunLoopTimeInterval]];
        
        runLoopCycles++;
        
        // Log periodic status every 30 seconds to track thread health
        NSDate *now = [NSDate date];
        if ([now timeIntervalSinceDate:lastLogTime] >= 30.0) {
            NSString *appStateString = [self safeAppStateString];
            
            AWSDDLogInfo(@"[CRASH-ANALYSIS] Thread health check - Thread: %@, RunLoop Cycles: %lu, App State: %@, Background Transitions: %lu, IsRunning: %@, IsCancelled: %@", 
                         self, (unsigned long)runLoopCycles, appStateString, (unsigned long)self.backgroundTransitionCount,
                         self.isRunning ? @"YES" : @"NO", self.isCancelled ? @"YES" : @"NO");
            lastLogTime = now;
        }
    }

    NSTimeInterval totalRuntime = [[NSDate date] timeIntervalSinceDate:self.threadStartTime];
    AWSDDLogInfo(@"[CRASH-ANALYSIS] Thread exiting run loop - Thread: %@, Total Runtime: %.2fs, RunLoop Cycles: %lu, Background Transitions: %lu", 
                 self, totalRuntime, (unsigned long)runLoopCycles, (unsigned long)self.backgroundTransitionCount);

    [self cleanUp];

    AWSDDLogInfo(@"[CRASH-ANALYSIS] Finished execution of Thread: [%@]", self);
}

- (BOOL)shouldContinueRunning {
    // Quick check without queue if deallocation is in progress
    if (self.isDeallocationInProgress) {
        AWSDDLogVerbose(@"[CRASH-ANALYSIS] shouldContinueRunning: NO - deallocation in progress for thread: %@", self);
        return NO;
    }
    
    __block BOOL shouldRun = NO;
    if (self.serialQueue) {
        dispatch_sync(self.serialQueue, ^{
            shouldRun = self.isRunning && !self.isCancelled && !self.isDeallocationInProgress && self.defaultRunLoopTimer != nil;
            
            // Log when thread is about to stop for analysis
            if (!shouldRun) {
                AWSDDLogInfo(@"[CRASH-ANALYSIS] shouldContinueRunning: NO - Thread: %@, isRunning: %@, isCancelled: %@, isDeallocationInProgress: %@, hasTimer: %@", 
                             self, self.isRunning ? @"YES" : @"NO", self.isCancelled ? @"YES" : @"NO", 
                             self.isDeallocationInProgress ? @"YES" : @"NO", self.defaultRunLoopTimer ? @"YES" : @"NO");
            }
        });
    } else {
        AWSDDLogWarn(@"[CRASH-ANALYSIS] shouldContinueRunning: NO - serialQueue is nil for thread: %@", self);
    }
    return shouldRun;
}

- (void)cancel {
    NSString *appStateString = [self safeAppStateString];
    
    AWSDDLogInfo(@"[CRASH-ANALYSIS] Issued Cancel on thread [%@], App State: %@, Background Transitions: %lu, HasSerialQueue: %@, IsDeallocationInProgress: %@", 
                 (NSThread *)self, appStateString, (unsigned long)self.backgroundTransitionCount,
                 self.serialQueue ? @"YES" : @"NO", self.isDeallocationInProgress ? @"YES" : @"NO");
    
    if (self.serialQueue && !self.isDeallocationInProgress) {
        dispatch_sync(self.serialQueue, ^{
            self.isRunning = NO;
            [super cancel];
        });
    } else {
        AWSDDLogWarn(@"[CRASH-ANALYSIS] Cancel called without serialQueue or during deallocation - Thread: %@", self);
        [super cancel];
    }
}

- (void)cancelAndDisconnect:(BOOL)shouldDisconnect {
    NSString *appStateString = [self safeAppStateString];
    
    AWSDDLogInfo(@"[CRASH-ANALYSIS] Issued Cancel and Disconnect = [%@] on thread [%@], App State: %@, Background Transitions: %lu, HasSerialQueue: %@, IsDeallocationInProgress: %@", 
                 shouldDisconnect ? @"YES" : @"NO", (NSThread *)self, appStateString, (unsigned long)self.backgroundTransitionCount,
                 self.serialQueue ? @"YES" : @"NO", self.isDeallocationInProgress ? @"YES" : @"NO");
    
    if (self.serialQueue && !self.isDeallocationInProgress) {
        dispatch_sync(self.serialQueue, ^{
            self.shouldDisconnect = shouldDisconnect;
            self.isRunning = NO;
            [super cancel];
        });
    } else {
        AWSDDLogWarn(@"[CRASH-ANALYSIS] CancelAndDisconnect called without serialQueue or during deallocation - Thread: %@", self);
        [super cancel];
    }
}

- (void)cleanUp {
    NSString *appStateString = [self safeAppStateString];
    
    AWSDDLogInfo(@"[CRASH-ANALYSIS] CleanUp called - Thread: %@, App State: %@, Background Transitions: %lu, HasSerialQueue: %@, IsDeallocationInProgress: %@, DidCleanUp: %@", 
                 self, appStateString, (unsigned long)self.backgroundTransitionCount,
                 self.serialQueue ? @"YES" : @"NO", self.isDeallocationInProgress ? @"YES" : @"NO", self.didCleanUp ? @"YES" : @"NO");
    
    // If no serial queue or deallocation in progress, do minimal cleanup
    if (!self.serialQueue || self.isDeallocationInProgress) {
        AWSDDLogInfo(@"[CRASH-ANALYSIS] Performing minimal cleanup - Thread: %@", self);
        [self performMinimalCleanup];
        return;
    }
    
    dispatch_sync(self.serialQueue, ^{
        if (self.didCleanUp) {
            AWSDDLogInfo(@"[CRASH-ANALYSIS] Clean up already called for thread: [%@]", (NSThread *)self);
            return;
        }

        AWSDDLogInfo(@"[CRASH-ANALYSIS] Starting full cleanup - Thread: %@, ShouldDisconnect: %@", self, self.shouldDisconnect ? @"YES" : @"NO");
        self.didCleanUp = YES;
        
        // Invalidate timer first to stop run loop
        if (self.defaultRunLoopTimer) {
            [self.defaultRunLoopTimer invalidate];
            self.defaultRunLoopTimer = nil;
        }

        if (self.shouldDisconnect) {
            // Properly handle session closure first
            if (self.session) {
                [self.session close];
                self.session = nil;
            }

            // Make sure we handle the streams in a thread-safe way
            if (self.outputStream) {
                // Remove from runLoop first before closing
                if (self.runLoopForStreamsThread) {
                    [self.outputStream removeFromRunLoop:self.runLoopForStreamsThread
                                                 forMode:NSDefaultRunLoopMode];
                }
                self.outputStream.delegate = nil;
                [self.outputStream close];
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
        } else {
            AWSDDLogInfo(@"[CRASH-ANALYSIS] Skipping disconnect for thread: [%@]", (NSThread *)self);
        }

        // Make sure onStop is called on the main thread to avoid UI issues
        void (^stopBlock)(void) = self.onStop;
        if (stopBlock) {
            AWSDDLogInfo(@"[CRASH-ANALYSIS] Calling onStop callback - Thread: %@", self);
            self.onStop = nil;
            dispatch_async(dispatch_get_main_queue(), ^{
                stopBlock();
            });
        }
        
        AWSDDLogInfo(@"[CRASH-ANALYSIS] Full cleanup completed - Thread: %@", self);
    });
}

- (void)performMinimalCleanup {
    // Minimal cleanup without using serial queue (for deallocation scenarios)
    AWSDDLogInfo(@"[CRASH-ANALYSIS] Starting minimal cleanup - Thread: %@, HasTimer: %@, HasOutputStream: %@, HasInputStream: %@, HasEncoderStream: %@, HasSession: %@", 
                 self, self.defaultRunLoopTimer ? @"YES" : @"NO", self.outputStream ? @"YES" : @"NO", 
                 self.decoderInputStream ? @"YES" : @"NO", self.encoderOutputStream ? @"YES" : @"NO", self.session ? @"YES" : @"NO");
    
    if (self.defaultRunLoopTimer) {
        [self.defaultRunLoopTimer invalidate];
        self.defaultRunLoopTimer = nil;
    }
    
    // Close streams without run loop operations
    if (self.outputStream) {
        self.outputStream.delegate = nil;
        [self.outputStream close];
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
    
    if (self.session) {
        [self.session close];
        self.session = nil;
    }
    
    self.onStop = nil;
    self.didCleanUp = YES;
    
    AWSDDLogInfo(@"[CRASH-ANALYSIS] Minimal cleanup completed - Thread: %@", self);
}

#pragma mark - App State Monitoring

- (void)appDidEnterBackground:(NSNotification *)notification {
    self.backgroundTransitionCount++;
    NSTimeInterval threadAge = self.threadCreationTime ? [[NSDate date] timeIntervalSinceDate:self.threadCreationTime] : 0;
    
    AWSDDLogInfo(@"[CRASH-ANALYSIS] App entered background - Thread: %@, Age: %.2fs, Background Transitions: %lu, IsRunning: %@, IsCancelled: %@, DidCleanUp: %@", 
                 self, threadAge, (unsigned long)self.backgroundTransitionCount,
                 self.isRunning ? @"YES" : @"NO", self.isCancelled ? @"YES" : @"NO", self.didCleanUp ? @"YES" : @"NO");
}

- (void)appWillEnterForeground:(NSNotification *)notification {
    NSTimeInterval threadAge = self.threadCreationTime ? [[NSDate date] timeIntervalSinceDate:self.threadCreationTime] : 0;
    
    AWSDDLogInfo(@"[CRASH-ANALYSIS] App entering foreground - Thread: %@, Age: %.2fs, Background Transitions: %lu, IsRunning: %@, IsCancelled: %@, DidCleanUp: %@", 
                 self, threadAge, (unsigned long)self.backgroundTransitionCount,
                 self.isRunning ? @"YES" : @"NO", self.isCancelled ? @"YES" : @"NO", self.didCleanUp ? @"YES" : @"NO");
}

#pragma mark - App State Monitoring

- (void)appDidEnterBackground:(NSNotification *)notification {
    self.backgroundTransitionCount++;
    NSTimeInterval threadAge = self.threadCreationTime ? [[NSDate date] timeIntervalSinceDate:self.threadCreationTime] : 0;
    
    AWSDDLogInfo(@"[CRASH-ANALYSIS] App entered background - Thread: %@, Age: %.2fs, Background Transitions: %lu, IsRunning: %@, IsCancelled: %@, DidCleanUp: %@", 
                 self, threadAge, (unsigned long)self.backgroundTransitionCount,
                 self.isRunning ? @"YES" : @"NO", self.isCancelled ? @"YES" : @"NO", self.didCleanUp ? @"YES" : @"NO");
}

- (void)appWillEnterForeground:(NSNotification *)notification {
    NSTimeInterval threadAge = self.threadCreationTime ? [[NSDate date] timeIntervalSinceDate:self.threadCreationTime] : 0;
    
    AWSDDLogInfo(@"[CRASH-ANALYSIS] App entering foreground - Thread: %@, Age: %.2fs, Background Transitions: %lu, IsRunning: %@, IsCancelled: %@, DidCleanUp: %@", 
                 self, threadAge, (unsigned long)self.backgroundTransitionCount,
                 self.isRunning ? @"YES" : @"NO", self.isCancelled ? @"YES" : @"NO", self.didCleanUp ? @"YES" : @"NO");
}



@end
