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

#import <XCTest/XCTest.h>
#import "OCMock.h"
#import "AWSIoTStreamThread.h"

@interface AWSIoTStreamThread()

@property(nonatomic, assign) NSTimeInterval defaultRunLoopTimeInterval;
@property (nonatomic, assign) BOOL isRunning;
@property (nonatomic, strong) dispatch_queue_t cleanupQueue;
@property (nonatomic, assign) BOOL isCleaningUp;
@property (nonatomic, strong, nullable) NSTimer *defaultRunLoopTimer;
@property (nonatomic, strong, nullable) NSRunLoop *runLoopForStreamsThread;

- (void)invalidateTimer;


@end


@interface AWSIoTStreamThreadTests : XCTestCase

@property (nonatomic, strong) AWSIoTStreamThread *thread;
@property (nonatomic, strong) AWSMQTTSession *session;
@property (nonatomic, strong) NSInputStream *decoderInputStream;
@property (nonatomic, strong) NSOutputStream *encoderOutputStream;
@property (nonatomic, strong) NSOutputStream *outputStream;

@end

@implementation AWSIoTStreamThreadTests

- (void)setUp {
    // Mock the dependencies
    self.decoderInputStream = OCMClassMock([NSInputStream class]);
    self.encoderOutputStream = OCMClassMock([NSOutputStream class]);
    self.outputStream = OCMClassMock([NSOutputStream class]);
    self.session = OCMClassMock([AWSMQTTSession class]);

    // Create an expectation and fulfill it when session.connectToInputStream:outputStream is invoked
    XCTestExpectation *startExpectation = [self expectationWithDescription:@"AWSIoTStreamThread.start expectation"];
    OCMStub([self.session connectToInputStream:[OCMArg any] outputStream:[OCMArg any]])
        .andCall(startExpectation, @selector(fulfill));
    
    self.thread = [[AWSIoTStreamThread alloc] initWithSession:self.session
                                           decoderInputStream:self.decoderInputStream
                                          encoderOutputStream:self.encoderOutputStream
                                                 outputStream:self.outputStream];
    self.thread.defaultRunLoopTimeInterval = 0.1;

    [self.thread start];
    [self waitForExpectations:@[startExpectation] timeout:1];
}

- (void)tearDown {
    [self.thread cancelAndDisconnect:YES];
    self.thread = nil;
    self.session = nil;
    self.decoderInputStream = nil;
    self.encoderOutputStream = nil;
    self.outputStream = nil;
}

/// Given: A AWSIoTStreamThread
/// When: The thread is started
/// Then: The output stream is opened and the session is connected to the decoder and encoder streams
- (void)testStart_shouldOpenStream_andInvokeConnectOnSession {
    OCMVerify([self.outputStream scheduleInRunLoop:[OCMArg any] forMode:NSDefaultRunLoopMode]);
    OCMVerify([self.outputStream open]);
    OCMVerify([self.session connectToInputStream:[OCMArg any] outputStream:[OCMArg any]]);
}

/// Given: A running AWSIoTStreamThread
/// When: The thread is cancelled with disconnect set to YES
/// Then: The session is closed and all streams are closed
- (void)testCancelAndDisconnect_shouldCloseStreams_andInvokeOnStop {
    XCTestExpectation *stopExpectation = [self expectationWithDescription:@"AWSIoTStreamThread.onStop expectation"];
    self.thread.onStop = ^{
        [stopExpectation fulfill];
    };

    [self.thread cancelAndDisconnect:YES];
    [self waitForExpectations:@[stopExpectation] timeout:1];

    OCMVerify([self.decoderInputStream close]);
    OCMVerify([self.encoderOutputStream close]);
    OCMVerify([self.outputStream close]);
    OCMVerify([self.session close]);
    XCTAssertFalse(self.thread.isRunning);
}

/// Given: A running AWSIoTStreamThread
/// When: The thread is cancelled with disconnect set to NO
/// Then: Neither the session nor the streams are closed
- (void)testCancel_shouldNotCloseStreams_andInvokeOnStop {
   XCTestExpectation *stopExpectation = [self expectationWithDescription:@"AWSIoTStreamThread.onStop expectation"];
   self.thread.onStop = ^{
       [stopExpectation fulfill];
   };

   __block BOOL didInvokeSessionClose = NO;
   OCMStub([self.session close]).andDo(^(NSInvocation *invocation) {
       didInvokeSessionClose = YES;
   });

   __block BOOL didInvokeDecoderInputStreamClose = NO;
   OCMStub([self.decoderInputStream close]).andDo(^(NSInvocation *invocation) {
       didInvokeDecoderInputStreamClose = YES;
   });

   __block BOOL didInvokeEncoderOutputStreamClose = NO;
   OCMStub([self.encoderOutputStream close]).andDo(^(NSInvocation *invocation) {
       didInvokeEncoderOutputStreamClose = YES;
   });

   __block BOOL didInvokeOutputStreamClose = NO;
   OCMStub([self.outputStream close]).andDo(^(NSInvocation *invocation) {
       didInvokeOutputStreamClose = YES;
   });

   [self.thread cancelAndDisconnect:NO];
   [self waitForExpectations:@[stopExpectation] timeout:1];

   XCTAssertFalse(didInvokeSessionClose, @"The `close` method on `session` should not be invoked");
   XCTAssertFalse(didInvokeDecoderInputStreamClose, @"The `close` method on `decoderInputStream` should not be invoked");
   XCTAssertFalse(didInvokeEncoderOutputStreamClose, @"The `close` method on `encoderOutputStream` should not be invoked");
   XCTAssertFalse(didInvokeOutputStreamClose, @"The `close` method on `outputStream` should not be invoked");
}

- (void)testCancelAndDisconnect_shouldSetIsCleaningUp {
    XCTestExpectation *stopExpectation = [self expectationWithDescription:@"AWSIoTStreamThread.onStop expectation"];
    self.thread.onStop = ^{
        [stopExpectation fulfill];
    };

    [self.thread cancelAndDisconnect:YES];

    __block BOOL isCleaningUp;
    dispatch_sync(self.thread.cleanupQueue, ^{
        isCleaningUp = self.thread.isCleaningUp;
    });

    XCTAssertTrue(isCleaningUp, @"isCleaningUp should be YES during cleanup");
    [self waitForExpectations:@[stopExpectation] timeout:1];
}

- (void)testInvalidateTimer_shouldInvalidateAndSetTimerToNil {
    [self.thread invalidateTimer];

    __block BOOL isTimerInvalidated = NO;
    OCMStub([self.thread.defaultRunLoopTimer invalidate]).andDo(^(NSInvocation *invocation) {
        isTimerInvalidated = YES;
    });

    XCTAssertNil(self.thread.defaultRunLoopTimer, @"defaultRunLoopTimer should be nil after invalidation");
    XCTAssertTrue(isTimerInvalidated, @"Timer invalidate method should have been called");
}

- (void)testRunLoop_shouldInvokeRunModeBeforeDate {
    id mockRunLoop = OCMClassMock([NSRunLoop class]);
    OCMStub([mockRunLoop runMode:NSDefaultRunLoopMode beforeDate:[OCMArg any]]);

    // Replace the real run loop with the mock
    self.thread.runLoopForStreamsThread = mockRunLoop;

    // Let the thread run for a brief moment
    XCTestExpectation *runLoopExpectation = [self expectationWithDescription:@"RunLoop expectation"];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.thread cancelAndDisconnect:YES];
        [runLoopExpectation fulfill];
    });

    [self waitForExpectations:@[runLoopExpectation] timeout:1];

    OCMVerify([mockRunLoop runMode:NSDefaultRunLoopMode beforeDate:[OCMArg any]]);
    [mockRunLoop stopMocking];
}

- (void)testCancelAndDisconnect_shouldSynchronizeOnCleanupQueue {
    XCTestExpectation *stopExpectation = [self expectationWithDescription:@"AWSIoTStreamThread.onStop expectation"];
    self.thread.onStop = ^{
        [stopExpectation fulfill];
    };

    [self.thread cancelAndDisconnect:YES];

    // Validate synchronization
    __block BOOL didSynchronize = NO;
    dispatch_sync(self.thread.cleanupQueue, ^{
        didSynchronize = YES;
    });

    XCTAssertTrue(didSynchronize, @"The cleanupQueue should synchronize the operations");
    [self waitForExpectations:@[stopExpectation] timeout:1];
}

@end
