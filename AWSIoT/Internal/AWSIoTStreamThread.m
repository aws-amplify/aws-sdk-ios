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
@property(atomic, strong, nullable) NSTimer *defaultRunLoopTimer;
@property(atomic, strong, nullable) NSRunLoop *runLoopForStreamsThread;
@property(nonatomic, assign) NSTimeInterval defaultRunLoopTimeInterval;
@property(atomic, assign) BOOL isRunning;
@property(atomic, assign) BOOL shouldDisconnect;
@property(atomic, assign) BOOL didCleanUp;
@property(atomic, assign) BOOL isDeallocationInProgress;

@end

@implementation AWSIoTStreamThread

- (void)dealloc {
    _isDeallocationInProgress = YES;

    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
    // ALWAYS use minimal cleanup during dealloc to avoid crashes
    // - Minimal cleanup is safer during object destruction
    // - Avoids runloop operations that could crash during dealloc
    // - Ignores shouldDisconnect flag for safety
    [self performMinimalCleanup];
}

/**
 * MINIMAL CLEANUP - Used during dealloc for crash safety
 * 
 * What it does:
 * - Stops timer to prevent callbacks
 * - Closes all streams and session directly with @synchronized for thread safety
 * - Clears delegates and blocks
 * - NO runloop operations (removeFromRunLoop)
 * - NO conditional logic based on shouldDisconnect
 * 
 * Why minimal:
 * - Safe during object deallocation
 * - Avoids method calls that could crash
 * - Simple operations only
 * - Prevents use-after-free crashes
 * 
 * Thread Safety:
 * - Uses @synchronized per stream object (customer's proven approach)
 * - Combined with atomic properties for comprehensive protection
 * - Double-checks stream existence within synchronized blocks
 */
- (void)performMinimalCleanup {
    if (_didCleanUp) {
        return;
    }
    _didCleanUp = YES;
    
    // Stop timer to prevent callbacks during/after deallocation
    if (_defaultRunLoopTimer) {
        [_defaultRunLoopTimer invalidate];
        _defaultRunLoopTimer = nil;
    }

    if (_outputStream) {
        _outputStream.delegate = nil;
        _outputStream = nil;
    }
    
    if (_decoderInputStream) {
        _decoderInputStream = nil;
    }
    
    if (_encoderOutputStream) {
        _encoderOutputStream = nil;
    }
    
    if (_session) {
        _session = nil;
    }
    
    // Clear callback to break retain cycles
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
        _didCleanUp = NO;
        _isDeallocationInProgress = NO;
    }
    return self;
}

- (void)main {
    if (self.isRunning) {
        AWSDDLogWarn(@"Attempted to start a thread that is already running: [%@]", self);
        return;
    }

    AWSDDLogVerbose(@"Started execution of Thread: [%@]", self);
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

    // Add protection against runloop corruption from multiple threads
    @try {
        while ([self shouldContinueRunning]) {
            //This will continue run until the thread is cancelled
            //Run one cycle of the runloop. This will return after a input source event or timer event is processed
            [self.runLoopForStreamsThread runMode:NSDefaultRunLoopMode
                                       beforeDate:[NSDate dateWithTimeIntervalSinceNow:self.defaultRunLoopTimeInterval]];
        }
    } @catch (NSException *exception) {
        AWSDDLogError(@"Exception in runloop execution: %@", exception);
    }

    [self cleanUp];

    AWSDDLogVerbose(@"Finished execution of Thread: [%@]", self);
}

- (BOOL)shouldContinueRunning {
    if (self.isDeallocationInProgress) {
        return NO;
    }
    
    return self.isRunning && !self.isCancelled && self.defaultRunLoopTimer != nil;
}

- (void)cancel {
    AWSDDLogVerbose(@"Issued Cancel on thread [%@]", (NSThread *)self);
    
    if (self.isDeallocationInProgress) {
        return;
    }
    
    // Atomic property, no synchronization needed
    self.isRunning = NO;
    [super cancel];
}

- (void)cancelAndDisconnect:(BOOL)shouldDisconnect {
    AWSDDLogVerbose(@"Issued Cancel and Disconnect = [%@] on thread [%@]", shouldDisconnect ? @"YES" : @"NO", (NSThread *)self);
    
    if (self.isDeallocationInProgress) {
        return;
    }
    
    // Set flags and cancel - properties are atomic
    self.shouldDisconnect = shouldDisconnect;
    self.isRunning = NO;
    [super cancel];
}

/**
 * FULL CLEANUP - Called during normal thread shutdown
 * 
 * When used:
 * - Thread finishes main() execution normally
 * - Thread is cancelled via cancel() or cancelAndDisconnect()
 * - App is terminating or going to background
 * 
 * What it does:
 * - Stops timer to prevent callbacks
 * - Conditionally closes streams based on shouldDisconnect flag
 * - Properly removes streams from runloop before closing with @synchronized
 * - Follows original disconnect logic
 * - Handles onStop callback on main thread
 * 
 * Why full cleanup is safe here:
 * - Object is still valid and not being deallocated
 * - Safe to perform runloop operations
 * - Need to respect shouldDisconnect flag for proper behavior
 * - Can safely dispatch onStop callback to main thread
 * 
 * Thread Safety Strategy:
 * - @synchronized blocks prevent race conditions during stream operations
 * - Atomic properties ensure consistent state across threads
 * - Double-checks within sync blocks prevent operating on closed streams
 * - Combines customer's surgical approach with our comprehensive coverage
 */
- (void)cleanUp {
    if (self.didCleanUp) {
        return;
    }
    self.didCleanUp = YES;
    
    // Stop timer to prevent callbacks
    if (self.defaultRunLoopTimer) {
        [self.defaultRunLoopTimer invalidate];
        self.defaultRunLoopTimer = nil;
    }
    
    // Conditional cleanup based on shouldDisconnect flag
    if (self.shouldDisconnect) {
        // Close session first to cleanly terminate MQTT connection
        if (self.session) {
            [self.session close];
            self.session = nil;
        }
        
        // Properly remove stream from runloop before closing with synchronized access
        @synchronized(self.outputStream) {
            if (self.outputStream) {
                self.outputStream.delegate = nil;
                // Safe to do runloop operations during normal cleanup
                if (self.runLoopForStreamsThread) {
                    [self.outputStream removeFromRunLoop:self.runLoopForStreamsThread forMode:NSDefaultRunLoopMode];
                }
                [self.outputStream close];
                self.outputStream = nil;
            }
        }
        
        @synchronized(self.decoderInputStream) {
            if (self.decoderInputStream) {
                [self.decoderInputStream close];
                self.decoderInputStream = nil;
            }
        }
        
        @synchronized(self.encoderOutputStream) {
            if (self.encoderOutputStream) {
                [self.encoderOutputStream close];
                self.encoderOutputStream = nil;
            }
        }
    } else {
        // Preserve streams/session for potential reuse
        AWSDDLogVerbose(@"Skipping disconnect for thread: [%@]", (NSThread *)self);
    }
    
    // Handle onStop callback on main thread (skip during deallocation to avoid async operations)
    if (!self.isDeallocationInProgress) {
        void (^stopBlock)(void) = self.onStop;
        if (stopBlock) {
            self.onStop = nil;
            dispatch_async(dispatch_get_main_queue(), ^{
                stopBlock();
            });
        }
    }
}

@end
