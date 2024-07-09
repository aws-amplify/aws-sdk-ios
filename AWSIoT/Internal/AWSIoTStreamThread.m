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

-(instancetype)initWithSession:(nonnull AWSMQTTSession *)session
            decoderInputStream:(nonnull NSInputStream *)decoderInputStream
           encoderOutputStream:(nonnull NSOutputStream *)encoderOutputStream
                  outputStream:(nullable NSOutputStream *)outputStream; {
    if (self = [super init]) {
        _session = session;
        _decoderInputStream = decoderInputStream;
        _encoderOutputStream = encoderOutputStream;
        _outputStream = outputStream;
        _defaultRunLoopTimeInterval = 10;
        _shouldDisconnect = NO;
    }
    return self;
}

- (void)main {
    AWSDDLogVerbose(@"Started execution of Thread: [%@]", self);
    //This is invoked in a new thread by the webSocketDidOpen method or by the Connect method. Get the runLoop from the thread.
    self.runLoopForStreamsThread = [NSRunLoop currentRunLoop];

    //Setup a default timer to ensure that the RunLoop always has atleast one timer on it. This is to prevent the while loop
    //below to spin in tight loop when all input sources and session timers are shutdown during a reconnect sequence.
    self.defaultRunLoopTimer = [[NSTimer alloc] initWithFireDate:[NSDate dateWithTimeIntervalSinceNow:60.0]
                                                            interval:60.0
                                                              target:self
                                                            selector:@selector(timerHandler:)
                                                            userInfo:nil
                                                             repeats:YES];
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

    while (self.isRunning && !self.isCancelled) {
        //This will continue run until the thread is cancelled
        //Run one cycle of the runloop. This will return after a input source event or timer event is processed
        [self.runLoopForStreamsThread runMode:NSDefaultRunLoopMode
                                   beforeDate:[NSDate dateWithTimeIntervalSinceNow:self.defaultRunLoopTimeInterval]];
    }

    [self cleanUp];

    AWSDDLogVerbose(@"Finished execution of Thread: [%@]", self);
}

- (void)cancel {
    AWSDDLogVerbose(@"Issued Cancel on thread [%@]", (NSThread *)self);
    self.isRunning = NO;
    [super cancel];
}

- (void)cancelAndDisconnect:(BOOL)shouldDisconnect {
    AWSDDLogVerbose(@"Issued Cancel and Disconnect = [%@] on thread [%@]", shouldDisconnect ? @"YES" : @"NO", (NSThread *)self);
    self.shouldDisconnect = shouldDisconnect;
    self.isRunning = NO;
    [super cancel];
}

- (void)cleanUp {
    if (self.defaultRunLoopTimer) {
        [self.defaultRunLoopTimer invalidate];
        self.defaultRunLoopTimer = nil;
    }

    if (self.shouldDisconnect) {
        if (self.session) {
            [self.session close];
            self.session = nil;
        }

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
    } else {
        AWSDDLogVerbose(@"Skipping disconnect for thread: [%@]", (NSThread *)self);
    }

    if (self.onStop) {
        self.onStop();
        self.onStop = nil;
    }
}

- (void)timerHandler:(NSTimer*)theTimer {
    AWSDDLogVerbose(@"Default run loop timer executed on Thread: [%@]. isRunning = %@. isCancelled = %@", self, self.isRunning ? @"YES" : @"NO", self.isCancelled ? @"YES" : @"NO");
}

@end
