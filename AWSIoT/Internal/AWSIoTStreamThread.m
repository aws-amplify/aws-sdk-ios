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
@property(nonatomic, strong) dispatch_queue_t serialQueue;
@property(nonatomic, assign) BOOL didCleanUp;
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
        _serialQueue = dispatch_queue_create("com.amazonaws.iot.streamthread.syncQueue", DISPATCH_QUEUE_SERIAL);
        _didCleanUp = NO;
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

    while ([self shouldContinueRunning]) {
        //This will continue run until the thread is cancelled
        //Run one cycle of the runloop. This will return after a input source event or timer event is processed
        [self.runLoopForStreamsThread runMode:NSDefaultRunLoopMode
                                   beforeDate:[NSDate dateWithTimeIntervalSinceNow:self.defaultRunLoopTimeInterval]];
    }

    [self cleanUp];

    AWSDDLogVerbose(@"Finished execution of Thread: [%@]", self);
}

- (BOOL)shouldContinueRunning {
    __block BOOL shouldRun;
    dispatch_sync(self.serialQueue, ^{
        shouldRun = self.isRunning && !self.isCancelled && self.defaultRunLoopTimer != nil;
    });
    return shouldRun;
}

- (void)cancel {
    AWSDDLogVerbose(@"Issued Cancel on thread [%@]", (NSThread *)self);
    dispatch_sync(self.serialQueue, ^{
        self.isRunning = NO;
        [super cancel];
    });
}

- (void)cancelAndDisconnect:(BOOL)shouldDisconnect {
    AWSDDLogVerbose(@"Issued Cancel and Disconnect = [%@] on thread [%@]", shouldDisconnect ? @"YES" : @"NO", (NSThread *)self);
    dispatch_sync(self.serialQueue, ^{
        self.shouldDisconnect = shouldDisconnect;
        self.isRunning = NO;
        [super cancel];
    });
}

- (void)cleanUp {
    dispatch_sync(self.serialQueue, ^{
        if (self.didCleanUp) {
            AWSDDLogVerbose(@"Clean up already called for thread: [%@]", (NSThread *)self);
            return;
        }

        self.didCleanUp = YES;
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
            AWSDDLogVerbose(@"Skipping disconnect for thread: [%@]", (NSThread *)self);
        }

        // Make sure onStop is called on the main thread to avoid UI issues
        void (^stopBlock)(void) = self.onStop;
        if (stopBlock) {
            self.onStop = nil;
            dispatch_async(dispatch_get_main_queue(), ^{
                stopBlock();
            });
        }
    });
}

@end
