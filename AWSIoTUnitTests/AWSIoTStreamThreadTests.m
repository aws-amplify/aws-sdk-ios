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

@interface AWSIoTStreamThreadTests : XCTestCase

@property (nonatomic, strong) AWSIoTStreamThread *thread;
@property (nonatomic, strong) AWSMQTTSession *session;
@property (nonatomic, strong) NSInputStream *decoderInputStream;
@property (nonatomic, strong) NSOutputStream *encoderOutputStream;
@property (nonatomic, strong) NSOutputStream *outputStream;
@property (nonatomic, strong) XCTestExpectation *startExpectation;

@end

@implementation AWSIoTStreamThreadTests

- (void)setUp {
    self.decoderInputStream = OCMClassMock([NSInputStream class]);
    self.encoderOutputStream = OCMClassMock([NSOutputStream class]);
    self.outputStream = OCMClassMock([NSOutputStream class]);
    self.startExpectation = [self expectationWithDescription:@"AWSIoTStreamThread.start expectation"];
    self.session = OCMClassMock([AWSMQTTSession class]);
    OCMStub([self.session connectToInputStream:[OCMArg any] outputStream:[OCMArg any]])
        .andCall(self.startExpectation, @selector(fulfill));
    self.thread = [[AWSIoTStreamThread alloc] initWithSession:self.session
                                           decoderInputStream:self.decoderInputStream
                                          encoderOutputStream:self.encoderOutputStream
                                                 outputStream:self.outputStream];
    [self.thread start];
}

- (void)tearDown {
    self.thread = nil;
    self.session = nil;
    self.decoderInputStream = nil;
    self.encoderOutputStream = nil;
    self.outputStream = nil;
}

/// Given: A AWSIoTStreamThread
/// When: The thread is started
/// Then: The output stream is opened and the session is connected to the decoder and encoder streams
- (void)testStart_shouldCloseStreams_andInvokeOnStop {
    [self waitForExpectationsWithTimeout:1 handler:nil];
    OCMVerify([self.outputStream open]);
    OCMVerify([self.session connectToInputStream:[OCMArg any] outputStream:[OCMArg any]]);
}

/// Given: A running AWSIoTStreamThread
/// When: The thread is cancelled
/// Then: The session is closed and all streams are closed
- (void)testCancel_shouldCloseStreams_andInvokeOnStop {
    XCTestExpectation *stopExpectation = [self expectationWithDescription:@"AWSIoTStreamThread.onStop expectation"];
    self.thread.onStop = ^{
        [stopExpectation fulfill];
    };

    [self.thread cancel];
    [self waitForExpectationsWithTimeout:1 handler:nil];

    OCMVerify([self.decoderInputStream close]);
    OCMVerify([self.encoderOutputStream close]);
    OCMVerify([self.outputStream close]);
    OCMVerify([self.session close]);
}

@end
