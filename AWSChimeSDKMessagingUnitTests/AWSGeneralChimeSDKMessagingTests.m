//
// Copyright 2010-2022 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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
#import "AWSChimeSDKMessagingService.h"

static id mockNetworking = nil;

@interface AWSGeneralChimeSDKMessagingTests : XCTestCase

@end

@implementation AWSGeneralChimeSDKMessagingTests

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
    NSString *key = @"testChimeSDKMessagingConstructors";
    XCTAssertNotNil([AWSChimeSDKMessaging defaultChimeSDKMessaging]);
    XCTAssertEqual([[AWSChimeSDKMessaging defaultChimeSDKMessaging] class], [AWSChimeSDKMessaging class]);
    XCTAssertNil([AWSChimeSDKMessaging ChimeSDKMessagingForKey:key]);

    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionSAEast1 credentialsProvider:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration.credentialsProvider];
    [AWSChimeSDKMessaging registerChimeSDKMessagingWithConfiguration:configuration forKey:key];
    XCTAssertNotNil([AWSChimeSDKMessaging ChimeSDKMessagingForKey:key]);
    XCTAssertEqual([[AWSChimeSDKMessaging ChimeSDKMessagingForKey:key] class], [AWSChimeSDKMessaging class]);
    XCTAssertEqual([AWSChimeSDKMessaging ChimeSDKMessagingForKey:key].configuration.regionType, AWSRegionSAEast1);

    [AWSChimeSDKMessaging removeChimeSDKMessagingForKey:key];
    XCTAssertNil([AWSChimeSDKMessaging ChimeSDKMessagingForKey:key]);

}

- (void)testAssociateChannelFlow {
    NSString *key = @"testAssociateChannelFlow";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKMessaging registerChimeSDKMessagingWithConfiguration:configuration forKey:key];

    AWSChimeSDKMessaging *awsClient = [AWSChimeSDKMessaging ChimeSDKMessagingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSChimeSDKMessaging ChimeSDKMessagingForKey:key] associateChannelFlow:[AWSChimeSDKMessagingAssociateChannelFlowRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKMessaging removeChimeSDKMessagingForKey:key];
}

- (void)testAssociateChannelFlowCompletionHandler {
    NSString *key = @"testAssociateChannelFlow";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKMessaging registerChimeSDKMessagingWithConfiguration:configuration forKey:key];

    AWSChimeSDKMessaging *awsClient = [AWSChimeSDKMessaging ChimeSDKMessagingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSChimeSDKMessaging ChimeSDKMessagingForKey:key] associateChannelFlow:[AWSChimeSDKMessagingAssociateChannelFlowRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKMessaging removeChimeSDKMessagingForKey:key];
}

- (void)testBatchCreateChannelMembership {
    NSString *key = @"testBatchCreateChannelMembership";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKMessaging registerChimeSDKMessagingWithConfiguration:configuration forKey:key];

    AWSChimeSDKMessaging *awsClient = [AWSChimeSDKMessaging ChimeSDKMessagingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSChimeSDKMessaging ChimeSDKMessagingForKey:key] batchCreateChannelMembership:[AWSChimeSDKMessagingBatchCreateChannelMembershipRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKMessaging removeChimeSDKMessagingForKey:key];
}

- (void)testBatchCreateChannelMembershipCompletionHandler {
    NSString *key = @"testBatchCreateChannelMembership";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKMessaging registerChimeSDKMessagingWithConfiguration:configuration forKey:key];

    AWSChimeSDKMessaging *awsClient = [AWSChimeSDKMessaging ChimeSDKMessagingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSChimeSDKMessaging ChimeSDKMessagingForKey:key] batchCreateChannelMembership:[AWSChimeSDKMessagingBatchCreateChannelMembershipRequest new] completionHandler:^(AWSChimeSDKMessagingBatchCreateChannelMembershipResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKMessaging removeChimeSDKMessagingForKey:key];
}

- (void)testChannelFlowCallback {
    NSString *key = @"testChannelFlowCallback";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKMessaging registerChimeSDKMessagingWithConfiguration:configuration forKey:key];

    AWSChimeSDKMessaging *awsClient = [AWSChimeSDKMessaging ChimeSDKMessagingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSChimeSDKMessaging ChimeSDKMessagingForKey:key] channelFlowCallback:[AWSChimeSDKMessagingChannelFlowCallbackRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKMessaging removeChimeSDKMessagingForKey:key];
}

- (void)testChannelFlowCallbackCompletionHandler {
    NSString *key = @"testChannelFlowCallback";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKMessaging registerChimeSDKMessagingWithConfiguration:configuration forKey:key];

    AWSChimeSDKMessaging *awsClient = [AWSChimeSDKMessaging ChimeSDKMessagingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSChimeSDKMessaging ChimeSDKMessagingForKey:key] channelFlowCallback:[AWSChimeSDKMessagingChannelFlowCallbackRequest new] completionHandler:^(AWSChimeSDKMessagingChannelFlowCallbackResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKMessaging removeChimeSDKMessagingForKey:key];
}

- (void)testCreateChannel {
    NSString *key = @"testCreateChannel";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKMessaging registerChimeSDKMessagingWithConfiguration:configuration forKey:key];

    AWSChimeSDKMessaging *awsClient = [AWSChimeSDKMessaging ChimeSDKMessagingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSChimeSDKMessaging ChimeSDKMessagingForKey:key] createChannel:[AWSChimeSDKMessagingCreateChannelRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKMessaging removeChimeSDKMessagingForKey:key];
}

- (void)testCreateChannelCompletionHandler {
    NSString *key = @"testCreateChannel";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKMessaging registerChimeSDKMessagingWithConfiguration:configuration forKey:key];

    AWSChimeSDKMessaging *awsClient = [AWSChimeSDKMessaging ChimeSDKMessagingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSChimeSDKMessaging ChimeSDKMessagingForKey:key] createChannel:[AWSChimeSDKMessagingCreateChannelRequest new] completionHandler:^(AWSChimeSDKMessagingCreateChannelResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKMessaging removeChimeSDKMessagingForKey:key];
}

- (void)testCreateChannelBan {
    NSString *key = @"testCreateChannelBan";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKMessaging registerChimeSDKMessagingWithConfiguration:configuration forKey:key];

    AWSChimeSDKMessaging *awsClient = [AWSChimeSDKMessaging ChimeSDKMessagingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSChimeSDKMessaging ChimeSDKMessagingForKey:key] createChannelBan:[AWSChimeSDKMessagingCreateChannelBanRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKMessaging removeChimeSDKMessagingForKey:key];
}

- (void)testCreateChannelBanCompletionHandler {
    NSString *key = @"testCreateChannelBan";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKMessaging registerChimeSDKMessagingWithConfiguration:configuration forKey:key];

    AWSChimeSDKMessaging *awsClient = [AWSChimeSDKMessaging ChimeSDKMessagingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSChimeSDKMessaging ChimeSDKMessagingForKey:key] createChannelBan:[AWSChimeSDKMessagingCreateChannelBanRequest new] completionHandler:^(AWSChimeSDKMessagingCreateChannelBanResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKMessaging removeChimeSDKMessagingForKey:key];
}

- (void)testCreateChannelFlow {
    NSString *key = @"testCreateChannelFlow";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKMessaging registerChimeSDKMessagingWithConfiguration:configuration forKey:key];

    AWSChimeSDKMessaging *awsClient = [AWSChimeSDKMessaging ChimeSDKMessagingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSChimeSDKMessaging ChimeSDKMessagingForKey:key] createChannelFlow:[AWSChimeSDKMessagingCreateChannelFlowRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKMessaging removeChimeSDKMessagingForKey:key];
}

- (void)testCreateChannelFlowCompletionHandler {
    NSString *key = @"testCreateChannelFlow";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKMessaging registerChimeSDKMessagingWithConfiguration:configuration forKey:key];

    AWSChimeSDKMessaging *awsClient = [AWSChimeSDKMessaging ChimeSDKMessagingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSChimeSDKMessaging ChimeSDKMessagingForKey:key] createChannelFlow:[AWSChimeSDKMessagingCreateChannelFlowRequest new] completionHandler:^(AWSChimeSDKMessagingCreateChannelFlowResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKMessaging removeChimeSDKMessagingForKey:key];
}

- (void)testCreateChannelMembership {
    NSString *key = @"testCreateChannelMembership";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKMessaging registerChimeSDKMessagingWithConfiguration:configuration forKey:key];

    AWSChimeSDKMessaging *awsClient = [AWSChimeSDKMessaging ChimeSDKMessagingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSChimeSDKMessaging ChimeSDKMessagingForKey:key] createChannelMembership:[AWSChimeSDKMessagingCreateChannelMembershipRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKMessaging removeChimeSDKMessagingForKey:key];
}

- (void)testCreateChannelMembershipCompletionHandler {
    NSString *key = @"testCreateChannelMembership";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKMessaging registerChimeSDKMessagingWithConfiguration:configuration forKey:key];

    AWSChimeSDKMessaging *awsClient = [AWSChimeSDKMessaging ChimeSDKMessagingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSChimeSDKMessaging ChimeSDKMessagingForKey:key] createChannelMembership:[AWSChimeSDKMessagingCreateChannelMembershipRequest new] completionHandler:^(AWSChimeSDKMessagingCreateChannelMembershipResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKMessaging removeChimeSDKMessagingForKey:key];
}

- (void)testCreateChannelModerator {
    NSString *key = @"testCreateChannelModerator";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKMessaging registerChimeSDKMessagingWithConfiguration:configuration forKey:key];

    AWSChimeSDKMessaging *awsClient = [AWSChimeSDKMessaging ChimeSDKMessagingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSChimeSDKMessaging ChimeSDKMessagingForKey:key] createChannelModerator:[AWSChimeSDKMessagingCreateChannelModeratorRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKMessaging removeChimeSDKMessagingForKey:key];
}

- (void)testCreateChannelModeratorCompletionHandler {
    NSString *key = @"testCreateChannelModerator";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKMessaging registerChimeSDKMessagingWithConfiguration:configuration forKey:key];

    AWSChimeSDKMessaging *awsClient = [AWSChimeSDKMessaging ChimeSDKMessagingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSChimeSDKMessaging ChimeSDKMessagingForKey:key] createChannelModerator:[AWSChimeSDKMessagingCreateChannelModeratorRequest new] completionHandler:^(AWSChimeSDKMessagingCreateChannelModeratorResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKMessaging removeChimeSDKMessagingForKey:key];
}

- (void)testDeleteChannel {
    NSString *key = @"testDeleteChannel";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKMessaging registerChimeSDKMessagingWithConfiguration:configuration forKey:key];

    AWSChimeSDKMessaging *awsClient = [AWSChimeSDKMessaging ChimeSDKMessagingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSChimeSDKMessaging ChimeSDKMessagingForKey:key] deleteChannel:[AWSChimeSDKMessagingDeleteChannelRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKMessaging removeChimeSDKMessagingForKey:key];
}

- (void)testDeleteChannelCompletionHandler {
    NSString *key = @"testDeleteChannel";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKMessaging registerChimeSDKMessagingWithConfiguration:configuration forKey:key];

    AWSChimeSDKMessaging *awsClient = [AWSChimeSDKMessaging ChimeSDKMessagingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSChimeSDKMessaging ChimeSDKMessagingForKey:key] deleteChannel:[AWSChimeSDKMessagingDeleteChannelRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKMessaging removeChimeSDKMessagingForKey:key];
}

- (void)testDeleteChannelBan {
    NSString *key = @"testDeleteChannelBan";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKMessaging registerChimeSDKMessagingWithConfiguration:configuration forKey:key];

    AWSChimeSDKMessaging *awsClient = [AWSChimeSDKMessaging ChimeSDKMessagingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSChimeSDKMessaging ChimeSDKMessagingForKey:key] deleteChannelBan:[AWSChimeSDKMessagingDeleteChannelBanRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKMessaging removeChimeSDKMessagingForKey:key];
}

- (void)testDeleteChannelBanCompletionHandler {
    NSString *key = @"testDeleteChannelBan";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKMessaging registerChimeSDKMessagingWithConfiguration:configuration forKey:key];

    AWSChimeSDKMessaging *awsClient = [AWSChimeSDKMessaging ChimeSDKMessagingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSChimeSDKMessaging ChimeSDKMessagingForKey:key] deleteChannelBan:[AWSChimeSDKMessagingDeleteChannelBanRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKMessaging removeChimeSDKMessagingForKey:key];
}

- (void)testDeleteChannelFlow {
    NSString *key = @"testDeleteChannelFlow";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKMessaging registerChimeSDKMessagingWithConfiguration:configuration forKey:key];

    AWSChimeSDKMessaging *awsClient = [AWSChimeSDKMessaging ChimeSDKMessagingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSChimeSDKMessaging ChimeSDKMessagingForKey:key] deleteChannelFlow:[AWSChimeSDKMessagingDeleteChannelFlowRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKMessaging removeChimeSDKMessagingForKey:key];
}

- (void)testDeleteChannelFlowCompletionHandler {
    NSString *key = @"testDeleteChannelFlow";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKMessaging registerChimeSDKMessagingWithConfiguration:configuration forKey:key];

    AWSChimeSDKMessaging *awsClient = [AWSChimeSDKMessaging ChimeSDKMessagingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSChimeSDKMessaging ChimeSDKMessagingForKey:key] deleteChannelFlow:[AWSChimeSDKMessagingDeleteChannelFlowRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKMessaging removeChimeSDKMessagingForKey:key];
}

- (void)testDeleteChannelMembership {
    NSString *key = @"testDeleteChannelMembership";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKMessaging registerChimeSDKMessagingWithConfiguration:configuration forKey:key];

    AWSChimeSDKMessaging *awsClient = [AWSChimeSDKMessaging ChimeSDKMessagingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSChimeSDKMessaging ChimeSDKMessagingForKey:key] deleteChannelMembership:[AWSChimeSDKMessagingDeleteChannelMembershipRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKMessaging removeChimeSDKMessagingForKey:key];
}

- (void)testDeleteChannelMembershipCompletionHandler {
    NSString *key = @"testDeleteChannelMembership";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKMessaging registerChimeSDKMessagingWithConfiguration:configuration forKey:key];

    AWSChimeSDKMessaging *awsClient = [AWSChimeSDKMessaging ChimeSDKMessagingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSChimeSDKMessaging ChimeSDKMessagingForKey:key] deleteChannelMembership:[AWSChimeSDKMessagingDeleteChannelMembershipRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKMessaging removeChimeSDKMessagingForKey:key];
}

- (void)testDeleteChannelMessage {
    NSString *key = @"testDeleteChannelMessage";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKMessaging registerChimeSDKMessagingWithConfiguration:configuration forKey:key];

    AWSChimeSDKMessaging *awsClient = [AWSChimeSDKMessaging ChimeSDKMessagingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSChimeSDKMessaging ChimeSDKMessagingForKey:key] deleteChannelMessage:[AWSChimeSDKMessagingDeleteChannelMessageRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKMessaging removeChimeSDKMessagingForKey:key];
}

- (void)testDeleteChannelMessageCompletionHandler {
    NSString *key = @"testDeleteChannelMessage";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKMessaging registerChimeSDKMessagingWithConfiguration:configuration forKey:key];

    AWSChimeSDKMessaging *awsClient = [AWSChimeSDKMessaging ChimeSDKMessagingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSChimeSDKMessaging ChimeSDKMessagingForKey:key] deleteChannelMessage:[AWSChimeSDKMessagingDeleteChannelMessageRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKMessaging removeChimeSDKMessagingForKey:key];
}

- (void)testDeleteChannelModerator {
    NSString *key = @"testDeleteChannelModerator";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKMessaging registerChimeSDKMessagingWithConfiguration:configuration forKey:key];

    AWSChimeSDKMessaging *awsClient = [AWSChimeSDKMessaging ChimeSDKMessagingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSChimeSDKMessaging ChimeSDKMessagingForKey:key] deleteChannelModerator:[AWSChimeSDKMessagingDeleteChannelModeratorRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKMessaging removeChimeSDKMessagingForKey:key];
}

- (void)testDeleteChannelModeratorCompletionHandler {
    NSString *key = @"testDeleteChannelModerator";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKMessaging registerChimeSDKMessagingWithConfiguration:configuration forKey:key];

    AWSChimeSDKMessaging *awsClient = [AWSChimeSDKMessaging ChimeSDKMessagingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSChimeSDKMessaging ChimeSDKMessagingForKey:key] deleteChannelModerator:[AWSChimeSDKMessagingDeleteChannelModeratorRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKMessaging removeChimeSDKMessagingForKey:key];
}

- (void)testDescribeChannel {
    NSString *key = @"testDescribeChannel";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKMessaging registerChimeSDKMessagingWithConfiguration:configuration forKey:key];

    AWSChimeSDKMessaging *awsClient = [AWSChimeSDKMessaging ChimeSDKMessagingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSChimeSDKMessaging ChimeSDKMessagingForKey:key] describeChannel:[AWSChimeSDKMessagingDescribeChannelRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKMessaging removeChimeSDKMessagingForKey:key];
}

- (void)testDescribeChannelCompletionHandler {
    NSString *key = @"testDescribeChannel";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKMessaging registerChimeSDKMessagingWithConfiguration:configuration forKey:key];

    AWSChimeSDKMessaging *awsClient = [AWSChimeSDKMessaging ChimeSDKMessagingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSChimeSDKMessaging ChimeSDKMessagingForKey:key] describeChannel:[AWSChimeSDKMessagingDescribeChannelRequest new] completionHandler:^(AWSChimeSDKMessagingDescribeChannelResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKMessaging removeChimeSDKMessagingForKey:key];
}

- (void)testDescribeChannelBan {
    NSString *key = @"testDescribeChannelBan";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKMessaging registerChimeSDKMessagingWithConfiguration:configuration forKey:key];

    AWSChimeSDKMessaging *awsClient = [AWSChimeSDKMessaging ChimeSDKMessagingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSChimeSDKMessaging ChimeSDKMessagingForKey:key] describeChannelBan:[AWSChimeSDKMessagingDescribeChannelBanRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKMessaging removeChimeSDKMessagingForKey:key];
}

- (void)testDescribeChannelBanCompletionHandler {
    NSString *key = @"testDescribeChannelBan";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKMessaging registerChimeSDKMessagingWithConfiguration:configuration forKey:key];

    AWSChimeSDKMessaging *awsClient = [AWSChimeSDKMessaging ChimeSDKMessagingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSChimeSDKMessaging ChimeSDKMessagingForKey:key] describeChannelBan:[AWSChimeSDKMessagingDescribeChannelBanRequest new] completionHandler:^(AWSChimeSDKMessagingDescribeChannelBanResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKMessaging removeChimeSDKMessagingForKey:key];
}

- (void)testDescribeChannelFlow {
    NSString *key = @"testDescribeChannelFlow";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKMessaging registerChimeSDKMessagingWithConfiguration:configuration forKey:key];

    AWSChimeSDKMessaging *awsClient = [AWSChimeSDKMessaging ChimeSDKMessagingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSChimeSDKMessaging ChimeSDKMessagingForKey:key] describeChannelFlow:[AWSChimeSDKMessagingDescribeChannelFlowRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKMessaging removeChimeSDKMessagingForKey:key];
}

- (void)testDescribeChannelFlowCompletionHandler {
    NSString *key = @"testDescribeChannelFlow";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKMessaging registerChimeSDKMessagingWithConfiguration:configuration forKey:key];

    AWSChimeSDKMessaging *awsClient = [AWSChimeSDKMessaging ChimeSDKMessagingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSChimeSDKMessaging ChimeSDKMessagingForKey:key] describeChannelFlow:[AWSChimeSDKMessagingDescribeChannelFlowRequest new] completionHandler:^(AWSChimeSDKMessagingDescribeChannelFlowResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKMessaging removeChimeSDKMessagingForKey:key];
}

- (void)testDescribeChannelMembership {
    NSString *key = @"testDescribeChannelMembership";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKMessaging registerChimeSDKMessagingWithConfiguration:configuration forKey:key];

    AWSChimeSDKMessaging *awsClient = [AWSChimeSDKMessaging ChimeSDKMessagingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSChimeSDKMessaging ChimeSDKMessagingForKey:key] describeChannelMembership:[AWSChimeSDKMessagingDescribeChannelMembershipRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKMessaging removeChimeSDKMessagingForKey:key];
}

- (void)testDescribeChannelMembershipCompletionHandler {
    NSString *key = @"testDescribeChannelMembership";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKMessaging registerChimeSDKMessagingWithConfiguration:configuration forKey:key];

    AWSChimeSDKMessaging *awsClient = [AWSChimeSDKMessaging ChimeSDKMessagingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSChimeSDKMessaging ChimeSDKMessagingForKey:key] describeChannelMembership:[AWSChimeSDKMessagingDescribeChannelMembershipRequest new] completionHandler:^(AWSChimeSDKMessagingDescribeChannelMembershipResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKMessaging removeChimeSDKMessagingForKey:key];
}

- (void)testDescribeChannelMembershipForAppInstanceUser {
    NSString *key = @"testDescribeChannelMembershipForAppInstanceUser";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKMessaging registerChimeSDKMessagingWithConfiguration:configuration forKey:key];

    AWSChimeSDKMessaging *awsClient = [AWSChimeSDKMessaging ChimeSDKMessagingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSChimeSDKMessaging ChimeSDKMessagingForKey:key] describeChannelMembershipForAppInstanceUser:[AWSChimeSDKMessagingDescribeChannelMembershipForAppInstanceUserRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKMessaging removeChimeSDKMessagingForKey:key];
}

- (void)testDescribeChannelMembershipForAppInstanceUserCompletionHandler {
    NSString *key = @"testDescribeChannelMembershipForAppInstanceUser";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKMessaging registerChimeSDKMessagingWithConfiguration:configuration forKey:key];

    AWSChimeSDKMessaging *awsClient = [AWSChimeSDKMessaging ChimeSDKMessagingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSChimeSDKMessaging ChimeSDKMessagingForKey:key] describeChannelMembershipForAppInstanceUser:[AWSChimeSDKMessagingDescribeChannelMembershipForAppInstanceUserRequest new] completionHandler:^(AWSChimeSDKMessagingDescribeChannelMembershipForAppInstanceUserResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKMessaging removeChimeSDKMessagingForKey:key];
}

- (void)testDescribeChannelModeratedByAppInstanceUser {
    NSString *key = @"testDescribeChannelModeratedByAppInstanceUser";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKMessaging registerChimeSDKMessagingWithConfiguration:configuration forKey:key];

    AWSChimeSDKMessaging *awsClient = [AWSChimeSDKMessaging ChimeSDKMessagingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSChimeSDKMessaging ChimeSDKMessagingForKey:key] describeChannelModeratedByAppInstanceUser:[AWSChimeSDKMessagingDescribeChannelModeratedByAppInstanceUserRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKMessaging removeChimeSDKMessagingForKey:key];
}

- (void)testDescribeChannelModeratedByAppInstanceUserCompletionHandler {
    NSString *key = @"testDescribeChannelModeratedByAppInstanceUser";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKMessaging registerChimeSDKMessagingWithConfiguration:configuration forKey:key];

    AWSChimeSDKMessaging *awsClient = [AWSChimeSDKMessaging ChimeSDKMessagingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSChimeSDKMessaging ChimeSDKMessagingForKey:key] describeChannelModeratedByAppInstanceUser:[AWSChimeSDKMessagingDescribeChannelModeratedByAppInstanceUserRequest new] completionHandler:^(AWSChimeSDKMessagingDescribeChannelModeratedByAppInstanceUserResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKMessaging removeChimeSDKMessagingForKey:key];
}

- (void)testDescribeChannelModerator {
    NSString *key = @"testDescribeChannelModerator";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKMessaging registerChimeSDKMessagingWithConfiguration:configuration forKey:key];

    AWSChimeSDKMessaging *awsClient = [AWSChimeSDKMessaging ChimeSDKMessagingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSChimeSDKMessaging ChimeSDKMessagingForKey:key] describeChannelModerator:[AWSChimeSDKMessagingDescribeChannelModeratorRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKMessaging removeChimeSDKMessagingForKey:key];
}

- (void)testDescribeChannelModeratorCompletionHandler {
    NSString *key = @"testDescribeChannelModerator";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKMessaging registerChimeSDKMessagingWithConfiguration:configuration forKey:key];

    AWSChimeSDKMessaging *awsClient = [AWSChimeSDKMessaging ChimeSDKMessagingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSChimeSDKMessaging ChimeSDKMessagingForKey:key] describeChannelModerator:[AWSChimeSDKMessagingDescribeChannelModeratorRequest new] completionHandler:^(AWSChimeSDKMessagingDescribeChannelModeratorResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKMessaging removeChimeSDKMessagingForKey:key];
}

- (void)testDisassociateChannelFlow {
    NSString *key = @"testDisassociateChannelFlow";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKMessaging registerChimeSDKMessagingWithConfiguration:configuration forKey:key];

    AWSChimeSDKMessaging *awsClient = [AWSChimeSDKMessaging ChimeSDKMessagingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSChimeSDKMessaging ChimeSDKMessagingForKey:key] disassociateChannelFlow:[AWSChimeSDKMessagingDisassociateChannelFlowRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKMessaging removeChimeSDKMessagingForKey:key];
}

- (void)testDisassociateChannelFlowCompletionHandler {
    NSString *key = @"testDisassociateChannelFlow";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKMessaging registerChimeSDKMessagingWithConfiguration:configuration forKey:key];

    AWSChimeSDKMessaging *awsClient = [AWSChimeSDKMessaging ChimeSDKMessagingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSChimeSDKMessaging ChimeSDKMessagingForKey:key] disassociateChannelFlow:[AWSChimeSDKMessagingDisassociateChannelFlowRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKMessaging removeChimeSDKMessagingForKey:key];
}

- (void)testGetChannelMembershipPreferences {
    NSString *key = @"testGetChannelMembershipPreferences";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKMessaging registerChimeSDKMessagingWithConfiguration:configuration forKey:key];

    AWSChimeSDKMessaging *awsClient = [AWSChimeSDKMessaging ChimeSDKMessagingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSChimeSDKMessaging ChimeSDKMessagingForKey:key] getChannelMembershipPreferences:[AWSChimeSDKMessagingGetChannelMembershipPreferencesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKMessaging removeChimeSDKMessagingForKey:key];
}

- (void)testGetChannelMembershipPreferencesCompletionHandler {
    NSString *key = @"testGetChannelMembershipPreferences";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKMessaging registerChimeSDKMessagingWithConfiguration:configuration forKey:key];

    AWSChimeSDKMessaging *awsClient = [AWSChimeSDKMessaging ChimeSDKMessagingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSChimeSDKMessaging ChimeSDKMessagingForKey:key] getChannelMembershipPreferences:[AWSChimeSDKMessagingGetChannelMembershipPreferencesRequest new] completionHandler:^(AWSChimeSDKMessagingGetChannelMembershipPreferencesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKMessaging removeChimeSDKMessagingForKey:key];
}

- (void)testGetChannelMessage {
    NSString *key = @"testGetChannelMessage";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKMessaging registerChimeSDKMessagingWithConfiguration:configuration forKey:key];

    AWSChimeSDKMessaging *awsClient = [AWSChimeSDKMessaging ChimeSDKMessagingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSChimeSDKMessaging ChimeSDKMessagingForKey:key] getChannelMessage:[AWSChimeSDKMessagingGetChannelMessageRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKMessaging removeChimeSDKMessagingForKey:key];
}

- (void)testGetChannelMessageCompletionHandler {
    NSString *key = @"testGetChannelMessage";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKMessaging registerChimeSDKMessagingWithConfiguration:configuration forKey:key];

    AWSChimeSDKMessaging *awsClient = [AWSChimeSDKMessaging ChimeSDKMessagingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSChimeSDKMessaging ChimeSDKMessagingForKey:key] getChannelMessage:[AWSChimeSDKMessagingGetChannelMessageRequest new] completionHandler:^(AWSChimeSDKMessagingGetChannelMessageResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKMessaging removeChimeSDKMessagingForKey:key];
}

- (void)testGetChannelMessageStatus {
    NSString *key = @"testGetChannelMessageStatus";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKMessaging registerChimeSDKMessagingWithConfiguration:configuration forKey:key];

    AWSChimeSDKMessaging *awsClient = [AWSChimeSDKMessaging ChimeSDKMessagingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSChimeSDKMessaging ChimeSDKMessagingForKey:key] getChannelMessageStatus:[AWSChimeSDKMessagingGetChannelMessageStatusRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKMessaging removeChimeSDKMessagingForKey:key];
}

- (void)testGetChannelMessageStatusCompletionHandler {
    NSString *key = @"testGetChannelMessageStatus";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKMessaging registerChimeSDKMessagingWithConfiguration:configuration forKey:key];

    AWSChimeSDKMessaging *awsClient = [AWSChimeSDKMessaging ChimeSDKMessagingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSChimeSDKMessaging ChimeSDKMessagingForKey:key] getChannelMessageStatus:[AWSChimeSDKMessagingGetChannelMessageStatusRequest new] completionHandler:^(AWSChimeSDKMessagingGetChannelMessageStatusResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKMessaging removeChimeSDKMessagingForKey:key];
}

- (void)testGetMessagingSessionEndpoint {
    NSString *key = @"testGetMessagingSessionEndpoint";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKMessaging registerChimeSDKMessagingWithConfiguration:configuration forKey:key];

    AWSChimeSDKMessaging *awsClient = [AWSChimeSDKMessaging ChimeSDKMessagingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSChimeSDKMessaging ChimeSDKMessagingForKey:key] getMessagingSessionEndpoint:[AWSChimeSDKMessagingGetMessagingSessionEndpointRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKMessaging removeChimeSDKMessagingForKey:key];
}

- (void)testGetMessagingSessionEndpointCompletionHandler {
    NSString *key = @"testGetMessagingSessionEndpoint";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKMessaging registerChimeSDKMessagingWithConfiguration:configuration forKey:key];

    AWSChimeSDKMessaging *awsClient = [AWSChimeSDKMessaging ChimeSDKMessagingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSChimeSDKMessaging ChimeSDKMessagingForKey:key] getMessagingSessionEndpoint:[AWSChimeSDKMessagingGetMessagingSessionEndpointRequest new] completionHandler:^(AWSChimeSDKMessagingGetMessagingSessionEndpointResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKMessaging removeChimeSDKMessagingForKey:key];
}

- (void)testListChannelBans {
    NSString *key = @"testListChannelBans";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKMessaging registerChimeSDKMessagingWithConfiguration:configuration forKey:key];

    AWSChimeSDKMessaging *awsClient = [AWSChimeSDKMessaging ChimeSDKMessagingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSChimeSDKMessaging ChimeSDKMessagingForKey:key] listChannelBans:[AWSChimeSDKMessagingListChannelBansRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKMessaging removeChimeSDKMessagingForKey:key];
}

- (void)testListChannelBansCompletionHandler {
    NSString *key = @"testListChannelBans";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKMessaging registerChimeSDKMessagingWithConfiguration:configuration forKey:key];

    AWSChimeSDKMessaging *awsClient = [AWSChimeSDKMessaging ChimeSDKMessagingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSChimeSDKMessaging ChimeSDKMessagingForKey:key] listChannelBans:[AWSChimeSDKMessagingListChannelBansRequest new] completionHandler:^(AWSChimeSDKMessagingListChannelBansResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKMessaging removeChimeSDKMessagingForKey:key];
}

- (void)testListChannelFlows {
    NSString *key = @"testListChannelFlows";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKMessaging registerChimeSDKMessagingWithConfiguration:configuration forKey:key];

    AWSChimeSDKMessaging *awsClient = [AWSChimeSDKMessaging ChimeSDKMessagingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSChimeSDKMessaging ChimeSDKMessagingForKey:key] listChannelFlows:[AWSChimeSDKMessagingListChannelFlowsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKMessaging removeChimeSDKMessagingForKey:key];
}

- (void)testListChannelFlowsCompletionHandler {
    NSString *key = @"testListChannelFlows";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKMessaging registerChimeSDKMessagingWithConfiguration:configuration forKey:key];

    AWSChimeSDKMessaging *awsClient = [AWSChimeSDKMessaging ChimeSDKMessagingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSChimeSDKMessaging ChimeSDKMessagingForKey:key] listChannelFlows:[AWSChimeSDKMessagingListChannelFlowsRequest new] completionHandler:^(AWSChimeSDKMessagingListChannelFlowsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKMessaging removeChimeSDKMessagingForKey:key];
}

- (void)testListChannelMemberships {
    NSString *key = @"testListChannelMemberships";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKMessaging registerChimeSDKMessagingWithConfiguration:configuration forKey:key];

    AWSChimeSDKMessaging *awsClient = [AWSChimeSDKMessaging ChimeSDKMessagingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSChimeSDKMessaging ChimeSDKMessagingForKey:key] listChannelMemberships:[AWSChimeSDKMessagingListChannelMembershipsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKMessaging removeChimeSDKMessagingForKey:key];
}

- (void)testListChannelMembershipsCompletionHandler {
    NSString *key = @"testListChannelMemberships";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKMessaging registerChimeSDKMessagingWithConfiguration:configuration forKey:key];

    AWSChimeSDKMessaging *awsClient = [AWSChimeSDKMessaging ChimeSDKMessagingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSChimeSDKMessaging ChimeSDKMessagingForKey:key] listChannelMemberships:[AWSChimeSDKMessagingListChannelMembershipsRequest new] completionHandler:^(AWSChimeSDKMessagingListChannelMembershipsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKMessaging removeChimeSDKMessagingForKey:key];
}

- (void)testListChannelMembershipsForAppInstanceUser {
    NSString *key = @"testListChannelMembershipsForAppInstanceUser";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKMessaging registerChimeSDKMessagingWithConfiguration:configuration forKey:key];

    AWSChimeSDKMessaging *awsClient = [AWSChimeSDKMessaging ChimeSDKMessagingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSChimeSDKMessaging ChimeSDKMessagingForKey:key] listChannelMembershipsForAppInstanceUser:[AWSChimeSDKMessagingListChannelMembershipsForAppInstanceUserRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKMessaging removeChimeSDKMessagingForKey:key];
}

- (void)testListChannelMembershipsForAppInstanceUserCompletionHandler {
    NSString *key = @"testListChannelMembershipsForAppInstanceUser";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKMessaging registerChimeSDKMessagingWithConfiguration:configuration forKey:key];

    AWSChimeSDKMessaging *awsClient = [AWSChimeSDKMessaging ChimeSDKMessagingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSChimeSDKMessaging ChimeSDKMessagingForKey:key] listChannelMembershipsForAppInstanceUser:[AWSChimeSDKMessagingListChannelMembershipsForAppInstanceUserRequest new] completionHandler:^(AWSChimeSDKMessagingListChannelMembershipsForAppInstanceUserResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKMessaging removeChimeSDKMessagingForKey:key];
}

- (void)testListChannelMessages {
    NSString *key = @"testListChannelMessages";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKMessaging registerChimeSDKMessagingWithConfiguration:configuration forKey:key];

    AWSChimeSDKMessaging *awsClient = [AWSChimeSDKMessaging ChimeSDKMessagingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSChimeSDKMessaging ChimeSDKMessagingForKey:key] listChannelMessages:[AWSChimeSDKMessagingListChannelMessagesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKMessaging removeChimeSDKMessagingForKey:key];
}

- (void)testListChannelMessagesCompletionHandler {
    NSString *key = @"testListChannelMessages";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKMessaging registerChimeSDKMessagingWithConfiguration:configuration forKey:key];

    AWSChimeSDKMessaging *awsClient = [AWSChimeSDKMessaging ChimeSDKMessagingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSChimeSDKMessaging ChimeSDKMessagingForKey:key] listChannelMessages:[AWSChimeSDKMessagingListChannelMessagesRequest new] completionHandler:^(AWSChimeSDKMessagingListChannelMessagesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKMessaging removeChimeSDKMessagingForKey:key];
}

- (void)testListChannelModerators {
    NSString *key = @"testListChannelModerators";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKMessaging registerChimeSDKMessagingWithConfiguration:configuration forKey:key];

    AWSChimeSDKMessaging *awsClient = [AWSChimeSDKMessaging ChimeSDKMessagingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSChimeSDKMessaging ChimeSDKMessagingForKey:key] listChannelModerators:[AWSChimeSDKMessagingListChannelModeratorsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKMessaging removeChimeSDKMessagingForKey:key];
}

- (void)testListChannelModeratorsCompletionHandler {
    NSString *key = @"testListChannelModerators";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKMessaging registerChimeSDKMessagingWithConfiguration:configuration forKey:key];

    AWSChimeSDKMessaging *awsClient = [AWSChimeSDKMessaging ChimeSDKMessagingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSChimeSDKMessaging ChimeSDKMessagingForKey:key] listChannelModerators:[AWSChimeSDKMessagingListChannelModeratorsRequest new] completionHandler:^(AWSChimeSDKMessagingListChannelModeratorsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKMessaging removeChimeSDKMessagingForKey:key];
}

- (void)testListChannels {
    NSString *key = @"testListChannels";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKMessaging registerChimeSDKMessagingWithConfiguration:configuration forKey:key];

    AWSChimeSDKMessaging *awsClient = [AWSChimeSDKMessaging ChimeSDKMessagingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSChimeSDKMessaging ChimeSDKMessagingForKey:key] listChannels:[AWSChimeSDKMessagingListChannelsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKMessaging removeChimeSDKMessagingForKey:key];
}

- (void)testListChannelsCompletionHandler {
    NSString *key = @"testListChannels";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKMessaging registerChimeSDKMessagingWithConfiguration:configuration forKey:key];

    AWSChimeSDKMessaging *awsClient = [AWSChimeSDKMessaging ChimeSDKMessagingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSChimeSDKMessaging ChimeSDKMessagingForKey:key] listChannels:[AWSChimeSDKMessagingListChannelsRequest new] completionHandler:^(AWSChimeSDKMessagingListChannelsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKMessaging removeChimeSDKMessagingForKey:key];
}

- (void)testListChannelsAssociatedWithChannelFlow {
    NSString *key = @"testListChannelsAssociatedWithChannelFlow";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKMessaging registerChimeSDKMessagingWithConfiguration:configuration forKey:key];

    AWSChimeSDKMessaging *awsClient = [AWSChimeSDKMessaging ChimeSDKMessagingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSChimeSDKMessaging ChimeSDKMessagingForKey:key] listChannelsAssociatedWithChannelFlow:[AWSChimeSDKMessagingListChannelsAssociatedWithChannelFlowRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKMessaging removeChimeSDKMessagingForKey:key];
}

- (void)testListChannelsAssociatedWithChannelFlowCompletionHandler {
    NSString *key = @"testListChannelsAssociatedWithChannelFlow";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKMessaging registerChimeSDKMessagingWithConfiguration:configuration forKey:key];

    AWSChimeSDKMessaging *awsClient = [AWSChimeSDKMessaging ChimeSDKMessagingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSChimeSDKMessaging ChimeSDKMessagingForKey:key] listChannelsAssociatedWithChannelFlow:[AWSChimeSDKMessagingListChannelsAssociatedWithChannelFlowRequest new] completionHandler:^(AWSChimeSDKMessagingListChannelsAssociatedWithChannelFlowResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKMessaging removeChimeSDKMessagingForKey:key];
}

- (void)testListChannelsModeratedByAppInstanceUser {
    NSString *key = @"testListChannelsModeratedByAppInstanceUser";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKMessaging registerChimeSDKMessagingWithConfiguration:configuration forKey:key];

    AWSChimeSDKMessaging *awsClient = [AWSChimeSDKMessaging ChimeSDKMessagingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSChimeSDKMessaging ChimeSDKMessagingForKey:key] listChannelsModeratedByAppInstanceUser:[AWSChimeSDKMessagingListChannelsModeratedByAppInstanceUserRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKMessaging removeChimeSDKMessagingForKey:key];
}

- (void)testListChannelsModeratedByAppInstanceUserCompletionHandler {
    NSString *key = @"testListChannelsModeratedByAppInstanceUser";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKMessaging registerChimeSDKMessagingWithConfiguration:configuration forKey:key];

    AWSChimeSDKMessaging *awsClient = [AWSChimeSDKMessaging ChimeSDKMessagingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSChimeSDKMessaging ChimeSDKMessagingForKey:key] listChannelsModeratedByAppInstanceUser:[AWSChimeSDKMessagingListChannelsModeratedByAppInstanceUserRequest new] completionHandler:^(AWSChimeSDKMessagingListChannelsModeratedByAppInstanceUserResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKMessaging removeChimeSDKMessagingForKey:key];
}

- (void)testListTagsForResource {
    NSString *key = @"testListTagsForResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKMessaging registerChimeSDKMessagingWithConfiguration:configuration forKey:key];

    AWSChimeSDKMessaging *awsClient = [AWSChimeSDKMessaging ChimeSDKMessagingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSChimeSDKMessaging ChimeSDKMessagingForKey:key] listTagsForResource:[AWSChimeSDKMessagingListTagsForResourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKMessaging removeChimeSDKMessagingForKey:key];
}

- (void)testListTagsForResourceCompletionHandler {
    NSString *key = @"testListTagsForResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKMessaging registerChimeSDKMessagingWithConfiguration:configuration forKey:key];

    AWSChimeSDKMessaging *awsClient = [AWSChimeSDKMessaging ChimeSDKMessagingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSChimeSDKMessaging ChimeSDKMessagingForKey:key] listTagsForResource:[AWSChimeSDKMessagingListTagsForResourceRequest new] completionHandler:^(AWSChimeSDKMessagingListTagsForResourceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKMessaging removeChimeSDKMessagingForKey:key];
}

- (void)testPutChannelMembershipPreferences {
    NSString *key = @"testPutChannelMembershipPreferences";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKMessaging registerChimeSDKMessagingWithConfiguration:configuration forKey:key];

    AWSChimeSDKMessaging *awsClient = [AWSChimeSDKMessaging ChimeSDKMessagingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSChimeSDKMessaging ChimeSDKMessagingForKey:key] putChannelMembershipPreferences:[AWSChimeSDKMessagingPutChannelMembershipPreferencesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKMessaging removeChimeSDKMessagingForKey:key];
}

- (void)testPutChannelMembershipPreferencesCompletionHandler {
    NSString *key = @"testPutChannelMembershipPreferences";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKMessaging registerChimeSDKMessagingWithConfiguration:configuration forKey:key];

    AWSChimeSDKMessaging *awsClient = [AWSChimeSDKMessaging ChimeSDKMessagingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSChimeSDKMessaging ChimeSDKMessagingForKey:key] putChannelMembershipPreferences:[AWSChimeSDKMessagingPutChannelMembershipPreferencesRequest new] completionHandler:^(AWSChimeSDKMessagingPutChannelMembershipPreferencesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKMessaging removeChimeSDKMessagingForKey:key];
}

- (void)testRedactChannelMessage {
    NSString *key = @"testRedactChannelMessage";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKMessaging registerChimeSDKMessagingWithConfiguration:configuration forKey:key];

    AWSChimeSDKMessaging *awsClient = [AWSChimeSDKMessaging ChimeSDKMessagingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSChimeSDKMessaging ChimeSDKMessagingForKey:key] redactChannelMessage:[AWSChimeSDKMessagingRedactChannelMessageRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKMessaging removeChimeSDKMessagingForKey:key];
}

- (void)testRedactChannelMessageCompletionHandler {
    NSString *key = @"testRedactChannelMessage";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKMessaging registerChimeSDKMessagingWithConfiguration:configuration forKey:key];

    AWSChimeSDKMessaging *awsClient = [AWSChimeSDKMessaging ChimeSDKMessagingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSChimeSDKMessaging ChimeSDKMessagingForKey:key] redactChannelMessage:[AWSChimeSDKMessagingRedactChannelMessageRequest new] completionHandler:^(AWSChimeSDKMessagingRedactChannelMessageResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKMessaging removeChimeSDKMessagingForKey:key];
}

- (void)testSearchChannels {
    NSString *key = @"testSearchChannels";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKMessaging registerChimeSDKMessagingWithConfiguration:configuration forKey:key];

    AWSChimeSDKMessaging *awsClient = [AWSChimeSDKMessaging ChimeSDKMessagingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSChimeSDKMessaging ChimeSDKMessagingForKey:key] searchChannels:[AWSChimeSDKMessagingSearchChannelsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKMessaging removeChimeSDKMessagingForKey:key];
}

- (void)testSearchChannelsCompletionHandler {
    NSString *key = @"testSearchChannels";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKMessaging registerChimeSDKMessagingWithConfiguration:configuration forKey:key];

    AWSChimeSDKMessaging *awsClient = [AWSChimeSDKMessaging ChimeSDKMessagingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSChimeSDKMessaging ChimeSDKMessagingForKey:key] searchChannels:[AWSChimeSDKMessagingSearchChannelsRequest new] completionHandler:^(AWSChimeSDKMessagingSearchChannelsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKMessaging removeChimeSDKMessagingForKey:key];
}

- (void)testSendChannelMessage {
    NSString *key = @"testSendChannelMessage";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKMessaging registerChimeSDKMessagingWithConfiguration:configuration forKey:key];

    AWSChimeSDKMessaging *awsClient = [AWSChimeSDKMessaging ChimeSDKMessagingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSChimeSDKMessaging ChimeSDKMessagingForKey:key] sendChannelMessage:[AWSChimeSDKMessagingSendChannelMessageRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKMessaging removeChimeSDKMessagingForKey:key];
}

- (void)testSendChannelMessageCompletionHandler {
    NSString *key = @"testSendChannelMessage";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKMessaging registerChimeSDKMessagingWithConfiguration:configuration forKey:key];

    AWSChimeSDKMessaging *awsClient = [AWSChimeSDKMessaging ChimeSDKMessagingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSChimeSDKMessaging ChimeSDKMessagingForKey:key] sendChannelMessage:[AWSChimeSDKMessagingSendChannelMessageRequest new] completionHandler:^(AWSChimeSDKMessagingSendChannelMessageResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKMessaging removeChimeSDKMessagingForKey:key];
}

- (void)testTagResource {
    NSString *key = @"testTagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKMessaging registerChimeSDKMessagingWithConfiguration:configuration forKey:key];

    AWSChimeSDKMessaging *awsClient = [AWSChimeSDKMessaging ChimeSDKMessagingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSChimeSDKMessaging ChimeSDKMessagingForKey:key] tagResource:[AWSChimeSDKMessagingTagResourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKMessaging removeChimeSDKMessagingForKey:key];
}

- (void)testTagResourceCompletionHandler {
    NSString *key = @"testTagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKMessaging registerChimeSDKMessagingWithConfiguration:configuration forKey:key];

    AWSChimeSDKMessaging *awsClient = [AWSChimeSDKMessaging ChimeSDKMessagingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSChimeSDKMessaging ChimeSDKMessagingForKey:key] tagResource:[AWSChimeSDKMessagingTagResourceRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKMessaging removeChimeSDKMessagingForKey:key];
}

- (void)testUntagResource {
    NSString *key = @"testUntagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKMessaging registerChimeSDKMessagingWithConfiguration:configuration forKey:key];

    AWSChimeSDKMessaging *awsClient = [AWSChimeSDKMessaging ChimeSDKMessagingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSChimeSDKMessaging ChimeSDKMessagingForKey:key] untagResource:[AWSChimeSDKMessagingUntagResourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKMessaging removeChimeSDKMessagingForKey:key];
}

- (void)testUntagResourceCompletionHandler {
    NSString *key = @"testUntagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKMessaging registerChimeSDKMessagingWithConfiguration:configuration forKey:key];

    AWSChimeSDKMessaging *awsClient = [AWSChimeSDKMessaging ChimeSDKMessagingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSChimeSDKMessaging ChimeSDKMessagingForKey:key] untagResource:[AWSChimeSDKMessagingUntagResourceRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKMessaging removeChimeSDKMessagingForKey:key];
}

- (void)testUpdateChannel {
    NSString *key = @"testUpdateChannel";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKMessaging registerChimeSDKMessagingWithConfiguration:configuration forKey:key];

    AWSChimeSDKMessaging *awsClient = [AWSChimeSDKMessaging ChimeSDKMessagingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSChimeSDKMessaging ChimeSDKMessagingForKey:key] updateChannel:[AWSChimeSDKMessagingUpdateChannelRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKMessaging removeChimeSDKMessagingForKey:key];
}

- (void)testUpdateChannelCompletionHandler {
    NSString *key = @"testUpdateChannel";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKMessaging registerChimeSDKMessagingWithConfiguration:configuration forKey:key];

    AWSChimeSDKMessaging *awsClient = [AWSChimeSDKMessaging ChimeSDKMessagingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSChimeSDKMessaging ChimeSDKMessagingForKey:key] updateChannel:[AWSChimeSDKMessagingUpdateChannelRequest new] completionHandler:^(AWSChimeSDKMessagingUpdateChannelResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKMessaging removeChimeSDKMessagingForKey:key];
}

- (void)testUpdateChannelFlow {
    NSString *key = @"testUpdateChannelFlow";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKMessaging registerChimeSDKMessagingWithConfiguration:configuration forKey:key];

    AWSChimeSDKMessaging *awsClient = [AWSChimeSDKMessaging ChimeSDKMessagingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSChimeSDKMessaging ChimeSDKMessagingForKey:key] updateChannelFlow:[AWSChimeSDKMessagingUpdateChannelFlowRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKMessaging removeChimeSDKMessagingForKey:key];
}

- (void)testUpdateChannelFlowCompletionHandler {
    NSString *key = @"testUpdateChannelFlow";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKMessaging registerChimeSDKMessagingWithConfiguration:configuration forKey:key];

    AWSChimeSDKMessaging *awsClient = [AWSChimeSDKMessaging ChimeSDKMessagingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSChimeSDKMessaging ChimeSDKMessagingForKey:key] updateChannelFlow:[AWSChimeSDKMessagingUpdateChannelFlowRequest new] completionHandler:^(AWSChimeSDKMessagingUpdateChannelFlowResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKMessaging removeChimeSDKMessagingForKey:key];
}

- (void)testUpdateChannelMessage {
    NSString *key = @"testUpdateChannelMessage";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKMessaging registerChimeSDKMessagingWithConfiguration:configuration forKey:key];

    AWSChimeSDKMessaging *awsClient = [AWSChimeSDKMessaging ChimeSDKMessagingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSChimeSDKMessaging ChimeSDKMessagingForKey:key] updateChannelMessage:[AWSChimeSDKMessagingUpdateChannelMessageRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKMessaging removeChimeSDKMessagingForKey:key];
}

- (void)testUpdateChannelMessageCompletionHandler {
    NSString *key = @"testUpdateChannelMessage";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKMessaging registerChimeSDKMessagingWithConfiguration:configuration forKey:key];

    AWSChimeSDKMessaging *awsClient = [AWSChimeSDKMessaging ChimeSDKMessagingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSChimeSDKMessaging ChimeSDKMessagingForKey:key] updateChannelMessage:[AWSChimeSDKMessagingUpdateChannelMessageRequest new] completionHandler:^(AWSChimeSDKMessagingUpdateChannelMessageResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKMessaging removeChimeSDKMessagingForKey:key];
}

- (void)testUpdateChannelReadMarker {
    NSString *key = @"testUpdateChannelReadMarker";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKMessaging registerChimeSDKMessagingWithConfiguration:configuration forKey:key];

    AWSChimeSDKMessaging *awsClient = [AWSChimeSDKMessaging ChimeSDKMessagingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSChimeSDKMessaging ChimeSDKMessagingForKey:key] updateChannelReadMarker:[AWSChimeSDKMessagingUpdateChannelReadMarkerRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKMessaging removeChimeSDKMessagingForKey:key];
}

- (void)testUpdateChannelReadMarkerCompletionHandler {
    NSString *key = @"testUpdateChannelReadMarker";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKMessaging registerChimeSDKMessagingWithConfiguration:configuration forKey:key];

    AWSChimeSDKMessaging *awsClient = [AWSChimeSDKMessaging ChimeSDKMessagingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSChimeSDKMessaging ChimeSDKMessagingForKey:key] updateChannelReadMarker:[AWSChimeSDKMessagingUpdateChannelReadMarkerRequest new] completionHandler:^(AWSChimeSDKMessagingUpdateChannelReadMarkerResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKMessaging removeChimeSDKMessagingForKey:key];
}

@end
