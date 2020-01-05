//
// Copyright 2010-2020 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "OCMock.h"
#import "AWSTestUtility.h"
#import "AWSConnectParticipantService.h"

static id mockNetworking = nil;

@interface AWSGeneralConnectParticipantTests : XCTestCase

@end

@implementation AWSGeneralConnectParticipantTests

- (void)setUp {
    [super setUp];
    [AWSTestUtility setupFakeCognitoCredentialsProvider];

    mockNetworking = OCMClassMock([AWSNetworking class]);
    AWSTask *errorTask = [AWSTask taskWithError:[NSError errorWithDomain:@"OCMockExpectedNetworkingError" code:8848 userInfo:nil]];
    OCMStub([mockNetworking sendRequest:[OCMArg isKindOfClass:[AWSNetworkingRequest class]]]).andReturn(errorTask);
}

- (void)tearDown {
    [super tearDown];
}

- (void)testConstructors {
    NSString *key = @"testConnectParticipantConstructors";
    XCTAssertNotNil([AWSConnectParticipant defaultConnectParticipant]);
    XCTAssertEqual([[AWSConnectParticipant defaultConnectParticipant] class], [AWSConnectParticipant class]);
    XCTAssertNil([AWSConnectParticipant ConnectParticipantForKey:key]);

    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionSAEast1 credentialsProvider:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration.credentialsProvider];
    [AWSConnectParticipant registerConnectParticipantWithConfiguration:configuration forKey:key];
    XCTAssertNotNil([AWSConnectParticipant ConnectParticipantForKey:key]);
    XCTAssertEqual([[AWSConnectParticipant ConnectParticipantForKey:key] class], [AWSConnectParticipant class]);
    XCTAssertEqual([AWSConnectParticipant ConnectParticipantForKey:key].configuration.regionType, AWSRegionSAEast1);

    [AWSConnectParticipant removeConnectParticipantForKey:key];
    XCTAssertNil([AWSConnectParticipant ConnectParticipantForKey:key]);

}

- (void)testCreateParticipantConnection {
    NSString *key = @"testCreateParticipantConnection";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSConnectParticipant registerConnectParticipantWithConfiguration:configuration forKey:key];

    AWSConnectParticipant *awsClient = [AWSConnectParticipant ConnectParticipantForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSConnectParticipant ConnectParticipantForKey:key] createParticipantConnection:[AWSConnectParticipantCreateParticipantConnectionRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSConnectParticipant removeConnectParticipantForKey:key];
}

- (void)testCreateParticipantConnectionCompletionHandler {
    NSString *key = @"testCreateParticipantConnection";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSConnectParticipant registerConnectParticipantWithConfiguration:configuration forKey:key];

    AWSConnectParticipant *awsClient = [AWSConnectParticipant ConnectParticipantForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSConnectParticipant ConnectParticipantForKey:key] createParticipantConnection:[AWSConnectParticipantCreateParticipantConnectionRequest new] completionHandler:^(AWSConnectParticipantCreateParticipantConnectionResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSConnectParticipant removeConnectParticipantForKey:key];
}

- (void)testDisconnectParticipant {
    NSString *key = @"testDisconnectParticipant";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSConnectParticipant registerConnectParticipantWithConfiguration:configuration forKey:key];

    AWSConnectParticipant *awsClient = [AWSConnectParticipant ConnectParticipantForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSConnectParticipant ConnectParticipantForKey:key] disconnectParticipant:[AWSConnectParticipantDisconnectParticipantRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSConnectParticipant removeConnectParticipantForKey:key];
}

- (void)testDisconnectParticipantCompletionHandler {
    NSString *key = @"testDisconnectParticipant";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSConnectParticipant registerConnectParticipantWithConfiguration:configuration forKey:key];

    AWSConnectParticipant *awsClient = [AWSConnectParticipant ConnectParticipantForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSConnectParticipant ConnectParticipantForKey:key] disconnectParticipant:[AWSConnectParticipantDisconnectParticipantRequest new] completionHandler:^(AWSConnectParticipantDisconnectParticipantResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSConnectParticipant removeConnectParticipantForKey:key];
}

- (void)testGetTranscript {
    NSString *key = @"testGetTranscript";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSConnectParticipant registerConnectParticipantWithConfiguration:configuration forKey:key];

    AWSConnectParticipant *awsClient = [AWSConnectParticipant ConnectParticipantForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSConnectParticipant ConnectParticipantForKey:key] getTranscript:[AWSConnectParticipantGetTranscriptRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSConnectParticipant removeConnectParticipantForKey:key];
}

- (void)testGetTranscriptCompletionHandler {
    NSString *key = @"testGetTranscript";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSConnectParticipant registerConnectParticipantWithConfiguration:configuration forKey:key];

    AWSConnectParticipant *awsClient = [AWSConnectParticipant ConnectParticipantForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSConnectParticipant ConnectParticipantForKey:key] getTranscript:[AWSConnectParticipantGetTranscriptRequest new] completionHandler:^(AWSConnectParticipantGetTranscriptResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSConnectParticipant removeConnectParticipantForKey:key];
}

- (void)testSendEvent {
    NSString *key = @"testSendEvent";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSConnectParticipant registerConnectParticipantWithConfiguration:configuration forKey:key];

    AWSConnectParticipant *awsClient = [AWSConnectParticipant ConnectParticipantForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSConnectParticipant ConnectParticipantForKey:key] sendEvent:[AWSConnectParticipantSendEventRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSConnectParticipant removeConnectParticipantForKey:key];
}

- (void)testSendEventCompletionHandler {
    NSString *key = @"testSendEvent";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSConnectParticipant registerConnectParticipantWithConfiguration:configuration forKey:key];

    AWSConnectParticipant *awsClient = [AWSConnectParticipant ConnectParticipantForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSConnectParticipant ConnectParticipantForKey:key] sendEvent:[AWSConnectParticipantSendEventRequest new] completionHandler:^(AWSConnectParticipantSendEventResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSConnectParticipant removeConnectParticipantForKey:key];
}

- (void)testSendMessage {
    NSString *key = @"testSendMessage";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSConnectParticipant registerConnectParticipantWithConfiguration:configuration forKey:key];

    AWSConnectParticipant *awsClient = [AWSConnectParticipant ConnectParticipantForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSConnectParticipant ConnectParticipantForKey:key] sendMessage:[AWSConnectParticipantSendMessageRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSConnectParticipant removeConnectParticipantForKey:key];
}

- (void)testSendMessageCompletionHandler {
    NSString *key = @"testSendMessage";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSConnectParticipant registerConnectParticipantWithConfiguration:configuration forKey:key];

    AWSConnectParticipant *awsClient = [AWSConnectParticipant ConnectParticipantForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSConnectParticipant ConnectParticipantForKey:key] sendMessage:[AWSConnectParticipantSendMessageRequest new] completionHandler:^(AWSConnectParticipantSendMessageResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSConnectParticipant removeConnectParticipantForKey:key];
}

@end
