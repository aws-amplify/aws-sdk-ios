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

    // Capture values locally to prevent crashes if self is deallocated
    NSRunLoop *runLoop = self.runLoopForStreamsThread;
    NSTimeInterval interval = self.defaultRunLoopTimeInterval;
    
    while ([self shouldContinueRunning] && runLoop) {
        [runLoop runMode:NSDefaultRunLoopMode
              beforeDate:[NSDate dateWithTimeIntervalSinceNow:interval]];
    }

    [self cleanUp];

    AWSDDLogVerbose(@"Finished execution of Thread: [%@]", self);
}

- (BOOL)shouldContinueRunning {
    if (self.isDeallocationInProgress) {
        return NO;
    }
    
    if (!self.runLoopForStreamsThread || !self.defaultRunLoopTimer) {
        return NO;
    }
    
    return self.isRunning && !self.isCancelled;
}

- (void)cancel {
    AWSDDLogVerbose(@"Issued Cancel on thread [%@]", (NSThread *)self);
    
    if (self.isDeallocationInProgress) {
        return;
    }
    
    // Invalidate timer immediately to break retain cycle
    if (self.defaultRunLoopTimer) {
        [self.defaultRunLoopTimer invalidate];
        self.defaultRunLoopTimer = nil;
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
    
    // Invalidate timer immediately to break retain cycle
    if (self.defaultRunLoopTimer) {
        [self.defaultRunLoopTimer invalidate];
        self.defaultRunLoopTimer = nil;
    }
    
    // Set flags and cancel - properties are atomic
    self.shouldDisconnect = shouldDisconnect;
    self.isRunning = NO;
    [super cancel];
}

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
        if (self.outputStream) {
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

        if (self.session) {
            [self.session close];
            self.session = nil;
        }
        
        @synchronized(self.encoderOutputStream) {
            if (self.encoderOutputStream) {
                [self.encoderOutputStream close];
                self.encoderOutputStream = nil;
            }
        }
    } else {
        AWSDDLogVerbose(@"Skipping disconnect for thread: [%@]", (NSThread *)self);
    }

    self.runLoopForStreamsThread = nil;
    
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
