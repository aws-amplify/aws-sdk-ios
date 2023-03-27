//
// Copyright 2010-2023 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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
#import "AWSChimeSDKIdentityService.h"

static id mockNetworking = nil;

@interface AWSGeneralChimeSDKIdentityTests : XCTestCase

@end

@implementation AWSGeneralChimeSDKIdentityTests

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
    NSString *key = @"testChimeSDKIdentityConstructors";
    XCTAssertNotNil([AWSChimeSDKIdentity defaultChimeSDKIdentity]);
    XCTAssertEqual([[AWSChimeSDKIdentity defaultChimeSDKIdentity] class], [AWSChimeSDKIdentity class]);
    XCTAssertNil([AWSChimeSDKIdentity ChimeSDKIdentityForKey:key]);

    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionSAEast1 credentialsProvider:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration.credentialsProvider];
    [AWSChimeSDKIdentity registerChimeSDKIdentityWithConfiguration:configuration forKey:key];
    XCTAssertNotNil([AWSChimeSDKIdentity ChimeSDKIdentityForKey:key]);
    XCTAssertEqual([[AWSChimeSDKIdentity ChimeSDKIdentityForKey:key] class], [AWSChimeSDKIdentity class]);
    XCTAssertEqual([AWSChimeSDKIdentity ChimeSDKIdentityForKey:key].configuration.regionType, AWSRegionSAEast1);

    [AWSChimeSDKIdentity removeChimeSDKIdentityForKey:key];
    XCTAssertNil([AWSChimeSDKIdentity ChimeSDKIdentityForKey:key]);

}

- (void)testCreateAppInstance {
    NSString *key = @"testCreateAppInstance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKIdentity registerChimeSDKIdentityWithConfiguration:configuration forKey:key];

    AWSChimeSDKIdentity *awsClient = [AWSChimeSDKIdentity ChimeSDKIdentityForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSChimeSDKIdentity ChimeSDKIdentityForKey:key] createAppInstance:[AWSChimeSDKIdentityCreateAppInstanceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKIdentity removeChimeSDKIdentityForKey:key];
}

- (void)testCreateAppInstanceCompletionHandler {
    NSString *key = @"testCreateAppInstance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKIdentity registerChimeSDKIdentityWithConfiguration:configuration forKey:key];

    AWSChimeSDKIdentity *awsClient = [AWSChimeSDKIdentity ChimeSDKIdentityForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSChimeSDKIdentity ChimeSDKIdentityForKey:key] createAppInstance:[AWSChimeSDKIdentityCreateAppInstanceRequest new] completionHandler:^(AWSChimeSDKIdentityCreateAppInstanceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKIdentity removeChimeSDKIdentityForKey:key];
}

- (void)testCreateAppInstanceAdmin {
    NSString *key = @"testCreateAppInstanceAdmin";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKIdentity registerChimeSDKIdentityWithConfiguration:configuration forKey:key];

    AWSChimeSDKIdentity *awsClient = [AWSChimeSDKIdentity ChimeSDKIdentityForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSChimeSDKIdentity ChimeSDKIdentityForKey:key] createAppInstanceAdmin:[AWSChimeSDKIdentityCreateAppInstanceAdminRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKIdentity removeChimeSDKIdentityForKey:key];
}

- (void)testCreateAppInstanceAdminCompletionHandler {
    NSString *key = @"testCreateAppInstanceAdmin";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKIdentity registerChimeSDKIdentityWithConfiguration:configuration forKey:key];

    AWSChimeSDKIdentity *awsClient = [AWSChimeSDKIdentity ChimeSDKIdentityForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSChimeSDKIdentity ChimeSDKIdentityForKey:key] createAppInstanceAdmin:[AWSChimeSDKIdentityCreateAppInstanceAdminRequest new] completionHandler:^(AWSChimeSDKIdentityCreateAppInstanceAdminResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKIdentity removeChimeSDKIdentityForKey:key];
}

- (void)testCreateAppInstanceBot {
    NSString *key = @"testCreateAppInstanceBot";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKIdentity registerChimeSDKIdentityWithConfiguration:configuration forKey:key];

    AWSChimeSDKIdentity *awsClient = [AWSChimeSDKIdentity ChimeSDKIdentityForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSChimeSDKIdentity ChimeSDKIdentityForKey:key] createAppInstanceBot:[AWSChimeSDKIdentityCreateAppInstanceBotRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKIdentity removeChimeSDKIdentityForKey:key];
}

- (void)testCreateAppInstanceBotCompletionHandler {
    NSString *key = @"testCreateAppInstanceBot";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKIdentity registerChimeSDKIdentityWithConfiguration:configuration forKey:key];

    AWSChimeSDKIdentity *awsClient = [AWSChimeSDKIdentity ChimeSDKIdentityForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSChimeSDKIdentity ChimeSDKIdentityForKey:key] createAppInstanceBot:[AWSChimeSDKIdentityCreateAppInstanceBotRequest new] completionHandler:^(AWSChimeSDKIdentityCreateAppInstanceBotResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKIdentity removeChimeSDKIdentityForKey:key];
}

- (void)testCreateAppInstanceUser {
    NSString *key = @"testCreateAppInstanceUser";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKIdentity registerChimeSDKIdentityWithConfiguration:configuration forKey:key];

    AWSChimeSDKIdentity *awsClient = [AWSChimeSDKIdentity ChimeSDKIdentityForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSChimeSDKIdentity ChimeSDKIdentityForKey:key] createAppInstanceUser:[AWSChimeSDKIdentityCreateAppInstanceUserRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKIdentity removeChimeSDKIdentityForKey:key];
}

- (void)testCreateAppInstanceUserCompletionHandler {
    NSString *key = @"testCreateAppInstanceUser";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKIdentity registerChimeSDKIdentityWithConfiguration:configuration forKey:key];

    AWSChimeSDKIdentity *awsClient = [AWSChimeSDKIdentity ChimeSDKIdentityForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSChimeSDKIdentity ChimeSDKIdentityForKey:key] createAppInstanceUser:[AWSChimeSDKIdentityCreateAppInstanceUserRequest new] completionHandler:^(AWSChimeSDKIdentityCreateAppInstanceUserResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKIdentity removeChimeSDKIdentityForKey:key];
}

- (void)testDeleteAppInstance {
    NSString *key = @"testDeleteAppInstance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKIdentity registerChimeSDKIdentityWithConfiguration:configuration forKey:key];

    AWSChimeSDKIdentity *awsClient = [AWSChimeSDKIdentity ChimeSDKIdentityForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSChimeSDKIdentity ChimeSDKIdentityForKey:key] deleteAppInstance:[AWSChimeSDKIdentityDeleteAppInstanceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKIdentity removeChimeSDKIdentityForKey:key];
}

- (void)testDeleteAppInstanceCompletionHandler {
    NSString *key = @"testDeleteAppInstance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKIdentity registerChimeSDKIdentityWithConfiguration:configuration forKey:key];

    AWSChimeSDKIdentity *awsClient = [AWSChimeSDKIdentity ChimeSDKIdentityForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSChimeSDKIdentity ChimeSDKIdentityForKey:key] deleteAppInstance:[AWSChimeSDKIdentityDeleteAppInstanceRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKIdentity removeChimeSDKIdentityForKey:key];
}

- (void)testDeleteAppInstanceAdmin {
    NSString *key = @"testDeleteAppInstanceAdmin";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKIdentity registerChimeSDKIdentityWithConfiguration:configuration forKey:key];

    AWSChimeSDKIdentity *awsClient = [AWSChimeSDKIdentity ChimeSDKIdentityForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSChimeSDKIdentity ChimeSDKIdentityForKey:key] deleteAppInstanceAdmin:[AWSChimeSDKIdentityDeleteAppInstanceAdminRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKIdentity removeChimeSDKIdentityForKey:key];
}

- (void)testDeleteAppInstanceAdminCompletionHandler {
    NSString *key = @"testDeleteAppInstanceAdmin";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKIdentity registerChimeSDKIdentityWithConfiguration:configuration forKey:key];

    AWSChimeSDKIdentity *awsClient = [AWSChimeSDKIdentity ChimeSDKIdentityForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSChimeSDKIdentity ChimeSDKIdentityForKey:key] deleteAppInstanceAdmin:[AWSChimeSDKIdentityDeleteAppInstanceAdminRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKIdentity removeChimeSDKIdentityForKey:key];
}

- (void)testDeleteAppInstanceBot {
    NSString *key = @"testDeleteAppInstanceBot";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKIdentity registerChimeSDKIdentityWithConfiguration:configuration forKey:key];

    AWSChimeSDKIdentity *awsClient = [AWSChimeSDKIdentity ChimeSDKIdentityForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSChimeSDKIdentity ChimeSDKIdentityForKey:key] deleteAppInstanceBot:[AWSChimeSDKIdentityDeleteAppInstanceBotRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKIdentity removeChimeSDKIdentityForKey:key];
}

- (void)testDeleteAppInstanceBotCompletionHandler {
    NSString *key = @"testDeleteAppInstanceBot";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKIdentity registerChimeSDKIdentityWithConfiguration:configuration forKey:key];

    AWSChimeSDKIdentity *awsClient = [AWSChimeSDKIdentity ChimeSDKIdentityForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSChimeSDKIdentity ChimeSDKIdentityForKey:key] deleteAppInstanceBot:[AWSChimeSDKIdentityDeleteAppInstanceBotRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKIdentity removeChimeSDKIdentityForKey:key];
}

- (void)testDeleteAppInstanceUser {
    NSString *key = @"testDeleteAppInstanceUser";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKIdentity registerChimeSDKIdentityWithConfiguration:configuration forKey:key];

    AWSChimeSDKIdentity *awsClient = [AWSChimeSDKIdentity ChimeSDKIdentityForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSChimeSDKIdentity ChimeSDKIdentityForKey:key] deleteAppInstanceUser:[AWSChimeSDKIdentityDeleteAppInstanceUserRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKIdentity removeChimeSDKIdentityForKey:key];
}

- (void)testDeleteAppInstanceUserCompletionHandler {
    NSString *key = @"testDeleteAppInstanceUser";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKIdentity registerChimeSDKIdentityWithConfiguration:configuration forKey:key];

    AWSChimeSDKIdentity *awsClient = [AWSChimeSDKIdentity ChimeSDKIdentityForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSChimeSDKIdentity ChimeSDKIdentityForKey:key] deleteAppInstanceUser:[AWSChimeSDKIdentityDeleteAppInstanceUserRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKIdentity removeChimeSDKIdentityForKey:key];
}

- (void)testDeregisterAppInstanceUserEndpoint {
    NSString *key = @"testDeregisterAppInstanceUserEndpoint";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKIdentity registerChimeSDKIdentityWithConfiguration:configuration forKey:key];

    AWSChimeSDKIdentity *awsClient = [AWSChimeSDKIdentity ChimeSDKIdentityForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSChimeSDKIdentity ChimeSDKIdentityForKey:key] deregisterAppInstanceUserEndpoint:[AWSChimeSDKIdentityDeregisterAppInstanceUserEndpointRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKIdentity removeChimeSDKIdentityForKey:key];
}

- (void)testDeregisterAppInstanceUserEndpointCompletionHandler {
    NSString *key = @"testDeregisterAppInstanceUserEndpoint";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKIdentity registerChimeSDKIdentityWithConfiguration:configuration forKey:key];

    AWSChimeSDKIdentity *awsClient = [AWSChimeSDKIdentity ChimeSDKIdentityForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSChimeSDKIdentity ChimeSDKIdentityForKey:key] deregisterAppInstanceUserEndpoint:[AWSChimeSDKIdentityDeregisterAppInstanceUserEndpointRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKIdentity removeChimeSDKIdentityForKey:key];
}

- (void)testDescribeAppInstance {
    NSString *key = @"testDescribeAppInstance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKIdentity registerChimeSDKIdentityWithConfiguration:configuration forKey:key];

    AWSChimeSDKIdentity *awsClient = [AWSChimeSDKIdentity ChimeSDKIdentityForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSChimeSDKIdentity ChimeSDKIdentityForKey:key] describeAppInstance:[AWSChimeSDKIdentityDescribeAppInstanceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKIdentity removeChimeSDKIdentityForKey:key];
}

- (void)testDescribeAppInstanceCompletionHandler {
    NSString *key = @"testDescribeAppInstance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKIdentity registerChimeSDKIdentityWithConfiguration:configuration forKey:key];

    AWSChimeSDKIdentity *awsClient = [AWSChimeSDKIdentity ChimeSDKIdentityForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSChimeSDKIdentity ChimeSDKIdentityForKey:key] describeAppInstance:[AWSChimeSDKIdentityDescribeAppInstanceRequest new] completionHandler:^(AWSChimeSDKIdentityDescribeAppInstanceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKIdentity removeChimeSDKIdentityForKey:key];
}

- (void)testDescribeAppInstanceAdmin {
    NSString *key = @"testDescribeAppInstanceAdmin";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKIdentity registerChimeSDKIdentityWithConfiguration:configuration forKey:key];

    AWSChimeSDKIdentity *awsClient = [AWSChimeSDKIdentity ChimeSDKIdentityForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSChimeSDKIdentity ChimeSDKIdentityForKey:key] describeAppInstanceAdmin:[AWSChimeSDKIdentityDescribeAppInstanceAdminRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKIdentity removeChimeSDKIdentityForKey:key];
}

- (void)testDescribeAppInstanceAdminCompletionHandler {
    NSString *key = @"testDescribeAppInstanceAdmin";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKIdentity registerChimeSDKIdentityWithConfiguration:configuration forKey:key];

    AWSChimeSDKIdentity *awsClient = [AWSChimeSDKIdentity ChimeSDKIdentityForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSChimeSDKIdentity ChimeSDKIdentityForKey:key] describeAppInstanceAdmin:[AWSChimeSDKIdentityDescribeAppInstanceAdminRequest new] completionHandler:^(AWSChimeSDKIdentityDescribeAppInstanceAdminResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKIdentity removeChimeSDKIdentityForKey:key];
}

- (void)testDescribeAppInstanceBot {
    NSString *key = @"testDescribeAppInstanceBot";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKIdentity registerChimeSDKIdentityWithConfiguration:configuration forKey:key];

    AWSChimeSDKIdentity *awsClient = [AWSChimeSDKIdentity ChimeSDKIdentityForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSChimeSDKIdentity ChimeSDKIdentityForKey:key] describeAppInstanceBot:[AWSChimeSDKIdentityDescribeAppInstanceBotRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKIdentity removeChimeSDKIdentityForKey:key];
}

- (void)testDescribeAppInstanceBotCompletionHandler {
    NSString *key = @"testDescribeAppInstanceBot";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKIdentity registerChimeSDKIdentityWithConfiguration:configuration forKey:key];

    AWSChimeSDKIdentity *awsClient = [AWSChimeSDKIdentity ChimeSDKIdentityForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSChimeSDKIdentity ChimeSDKIdentityForKey:key] describeAppInstanceBot:[AWSChimeSDKIdentityDescribeAppInstanceBotRequest new] completionHandler:^(AWSChimeSDKIdentityDescribeAppInstanceBotResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKIdentity removeChimeSDKIdentityForKey:key];
}

- (void)testDescribeAppInstanceUser {
    NSString *key = @"testDescribeAppInstanceUser";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKIdentity registerChimeSDKIdentityWithConfiguration:configuration forKey:key];

    AWSChimeSDKIdentity *awsClient = [AWSChimeSDKIdentity ChimeSDKIdentityForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSChimeSDKIdentity ChimeSDKIdentityForKey:key] describeAppInstanceUser:[AWSChimeSDKIdentityDescribeAppInstanceUserRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKIdentity removeChimeSDKIdentityForKey:key];
}

- (void)testDescribeAppInstanceUserCompletionHandler {
    NSString *key = @"testDescribeAppInstanceUser";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKIdentity registerChimeSDKIdentityWithConfiguration:configuration forKey:key];

    AWSChimeSDKIdentity *awsClient = [AWSChimeSDKIdentity ChimeSDKIdentityForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSChimeSDKIdentity ChimeSDKIdentityForKey:key] describeAppInstanceUser:[AWSChimeSDKIdentityDescribeAppInstanceUserRequest new] completionHandler:^(AWSChimeSDKIdentityDescribeAppInstanceUserResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKIdentity removeChimeSDKIdentityForKey:key];
}

- (void)testDescribeAppInstanceUserEndpoint {
    NSString *key = @"testDescribeAppInstanceUserEndpoint";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKIdentity registerChimeSDKIdentityWithConfiguration:configuration forKey:key];

    AWSChimeSDKIdentity *awsClient = [AWSChimeSDKIdentity ChimeSDKIdentityForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSChimeSDKIdentity ChimeSDKIdentityForKey:key] describeAppInstanceUserEndpoint:[AWSChimeSDKIdentityDescribeAppInstanceUserEndpointRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKIdentity removeChimeSDKIdentityForKey:key];
}

- (void)testDescribeAppInstanceUserEndpointCompletionHandler {
    NSString *key = @"testDescribeAppInstanceUserEndpoint";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKIdentity registerChimeSDKIdentityWithConfiguration:configuration forKey:key];

    AWSChimeSDKIdentity *awsClient = [AWSChimeSDKIdentity ChimeSDKIdentityForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSChimeSDKIdentity ChimeSDKIdentityForKey:key] describeAppInstanceUserEndpoint:[AWSChimeSDKIdentityDescribeAppInstanceUserEndpointRequest new] completionHandler:^(AWSChimeSDKIdentityDescribeAppInstanceUserEndpointResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKIdentity removeChimeSDKIdentityForKey:key];
}

- (void)testGetAppInstanceRetentionSettings {
    NSString *key = @"testGetAppInstanceRetentionSettings";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKIdentity registerChimeSDKIdentityWithConfiguration:configuration forKey:key];

    AWSChimeSDKIdentity *awsClient = [AWSChimeSDKIdentity ChimeSDKIdentityForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSChimeSDKIdentity ChimeSDKIdentityForKey:key] getAppInstanceRetentionSettings:[AWSChimeSDKIdentityGetAppInstanceRetentionSettingsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKIdentity removeChimeSDKIdentityForKey:key];
}

- (void)testGetAppInstanceRetentionSettingsCompletionHandler {
    NSString *key = @"testGetAppInstanceRetentionSettings";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKIdentity registerChimeSDKIdentityWithConfiguration:configuration forKey:key];

    AWSChimeSDKIdentity *awsClient = [AWSChimeSDKIdentity ChimeSDKIdentityForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSChimeSDKIdentity ChimeSDKIdentityForKey:key] getAppInstanceRetentionSettings:[AWSChimeSDKIdentityGetAppInstanceRetentionSettingsRequest new] completionHandler:^(AWSChimeSDKIdentityGetAppInstanceRetentionSettingsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKIdentity removeChimeSDKIdentityForKey:key];
}

- (void)testListAppInstanceAdmins {
    NSString *key = @"testListAppInstanceAdmins";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKIdentity registerChimeSDKIdentityWithConfiguration:configuration forKey:key];

    AWSChimeSDKIdentity *awsClient = [AWSChimeSDKIdentity ChimeSDKIdentityForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSChimeSDKIdentity ChimeSDKIdentityForKey:key] listAppInstanceAdmins:[AWSChimeSDKIdentityListAppInstanceAdminsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKIdentity removeChimeSDKIdentityForKey:key];
}

- (void)testListAppInstanceAdminsCompletionHandler {
    NSString *key = @"testListAppInstanceAdmins";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKIdentity registerChimeSDKIdentityWithConfiguration:configuration forKey:key];

    AWSChimeSDKIdentity *awsClient = [AWSChimeSDKIdentity ChimeSDKIdentityForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSChimeSDKIdentity ChimeSDKIdentityForKey:key] listAppInstanceAdmins:[AWSChimeSDKIdentityListAppInstanceAdminsRequest new] completionHandler:^(AWSChimeSDKIdentityListAppInstanceAdminsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKIdentity removeChimeSDKIdentityForKey:key];
}

- (void)testListAppInstanceBots {
    NSString *key = @"testListAppInstanceBots";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKIdentity registerChimeSDKIdentityWithConfiguration:configuration forKey:key];

    AWSChimeSDKIdentity *awsClient = [AWSChimeSDKIdentity ChimeSDKIdentityForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSChimeSDKIdentity ChimeSDKIdentityForKey:key] listAppInstanceBots:[AWSChimeSDKIdentityListAppInstanceBotsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKIdentity removeChimeSDKIdentityForKey:key];
}

- (void)testListAppInstanceBotsCompletionHandler {
    NSString *key = @"testListAppInstanceBots";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKIdentity registerChimeSDKIdentityWithConfiguration:configuration forKey:key];

    AWSChimeSDKIdentity *awsClient = [AWSChimeSDKIdentity ChimeSDKIdentityForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSChimeSDKIdentity ChimeSDKIdentityForKey:key] listAppInstanceBots:[AWSChimeSDKIdentityListAppInstanceBotsRequest new] completionHandler:^(AWSChimeSDKIdentityListAppInstanceBotsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKIdentity removeChimeSDKIdentityForKey:key];
}

- (void)testListAppInstanceUserEndpoints {
    NSString *key = @"testListAppInstanceUserEndpoints";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKIdentity registerChimeSDKIdentityWithConfiguration:configuration forKey:key];

    AWSChimeSDKIdentity *awsClient = [AWSChimeSDKIdentity ChimeSDKIdentityForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSChimeSDKIdentity ChimeSDKIdentityForKey:key] listAppInstanceUserEndpoints:[AWSChimeSDKIdentityListAppInstanceUserEndpointsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKIdentity removeChimeSDKIdentityForKey:key];
}

- (void)testListAppInstanceUserEndpointsCompletionHandler {
    NSString *key = @"testListAppInstanceUserEndpoints";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKIdentity registerChimeSDKIdentityWithConfiguration:configuration forKey:key];

    AWSChimeSDKIdentity *awsClient = [AWSChimeSDKIdentity ChimeSDKIdentityForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSChimeSDKIdentity ChimeSDKIdentityForKey:key] listAppInstanceUserEndpoints:[AWSChimeSDKIdentityListAppInstanceUserEndpointsRequest new] completionHandler:^(AWSChimeSDKIdentityListAppInstanceUserEndpointsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKIdentity removeChimeSDKIdentityForKey:key];
}

- (void)testListAppInstanceUsers {
    NSString *key = @"testListAppInstanceUsers";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKIdentity registerChimeSDKIdentityWithConfiguration:configuration forKey:key];

    AWSChimeSDKIdentity *awsClient = [AWSChimeSDKIdentity ChimeSDKIdentityForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSChimeSDKIdentity ChimeSDKIdentityForKey:key] listAppInstanceUsers:[AWSChimeSDKIdentityListAppInstanceUsersRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKIdentity removeChimeSDKIdentityForKey:key];
}

- (void)testListAppInstanceUsersCompletionHandler {
    NSString *key = @"testListAppInstanceUsers";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKIdentity registerChimeSDKIdentityWithConfiguration:configuration forKey:key];

    AWSChimeSDKIdentity *awsClient = [AWSChimeSDKIdentity ChimeSDKIdentityForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSChimeSDKIdentity ChimeSDKIdentityForKey:key] listAppInstanceUsers:[AWSChimeSDKIdentityListAppInstanceUsersRequest new] completionHandler:^(AWSChimeSDKIdentityListAppInstanceUsersResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKIdentity removeChimeSDKIdentityForKey:key];
}

- (void)testListAppInstances {
    NSString *key = @"testListAppInstances";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKIdentity registerChimeSDKIdentityWithConfiguration:configuration forKey:key];

    AWSChimeSDKIdentity *awsClient = [AWSChimeSDKIdentity ChimeSDKIdentityForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSChimeSDKIdentity ChimeSDKIdentityForKey:key] listAppInstances:[AWSChimeSDKIdentityListAppInstancesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKIdentity removeChimeSDKIdentityForKey:key];
}

- (void)testListAppInstancesCompletionHandler {
    NSString *key = @"testListAppInstances";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKIdentity registerChimeSDKIdentityWithConfiguration:configuration forKey:key];

    AWSChimeSDKIdentity *awsClient = [AWSChimeSDKIdentity ChimeSDKIdentityForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSChimeSDKIdentity ChimeSDKIdentityForKey:key] listAppInstances:[AWSChimeSDKIdentityListAppInstancesRequest new] completionHandler:^(AWSChimeSDKIdentityListAppInstancesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKIdentity removeChimeSDKIdentityForKey:key];
}

- (void)testListTagsForResource {
    NSString *key = @"testListTagsForResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKIdentity registerChimeSDKIdentityWithConfiguration:configuration forKey:key];

    AWSChimeSDKIdentity *awsClient = [AWSChimeSDKIdentity ChimeSDKIdentityForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSChimeSDKIdentity ChimeSDKIdentityForKey:key] listTagsForResource:[AWSChimeSDKIdentityListTagsForResourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKIdentity removeChimeSDKIdentityForKey:key];
}

- (void)testListTagsForResourceCompletionHandler {
    NSString *key = @"testListTagsForResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKIdentity registerChimeSDKIdentityWithConfiguration:configuration forKey:key];

    AWSChimeSDKIdentity *awsClient = [AWSChimeSDKIdentity ChimeSDKIdentityForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSChimeSDKIdentity ChimeSDKIdentityForKey:key] listTagsForResource:[AWSChimeSDKIdentityListTagsForResourceRequest new] completionHandler:^(AWSChimeSDKIdentityListTagsForResourceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKIdentity removeChimeSDKIdentityForKey:key];
}

- (void)testPutAppInstanceRetentionSettings {
    NSString *key = @"testPutAppInstanceRetentionSettings";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKIdentity registerChimeSDKIdentityWithConfiguration:configuration forKey:key];

    AWSChimeSDKIdentity *awsClient = [AWSChimeSDKIdentity ChimeSDKIdentityForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSChimeSDKIdentity ChimeSDKIdentityForKey:key] putAppInstanceRetentionSettings:[AWSChimeSDKIdentityPutAppInstanceRetentionSettingsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKIdentity removeChimeSDKIdentityForKey:key];
}

- (void)testPutAppInstanceRetentionSettingsCompletionHandler {
    NSString *key = @"testPutAppInstanceRetentionSettings";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKIdentity registerChimeSDKIdentityWithConfiguration:configuration forKey:key];

    AWSChimeSDKIdentity *awsClient = [AWSChimeSDKIdentity ChimeSDKIdentityForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSChimeSDKIdentity ChimeSDKIdentityForKey:key] putAppInstanceRetentionSettings:[AWSChimeSDKIdentityPutAppInstanceRetentionSettingsRequest new] completionHandler:^(AWSChimeSDKIdentityPutAppInstanceRetentionSettingsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKIdentity removeChimeSDKIdentityForKey:key];
}

- (void)testPutAppInstanceUserExpirationSettings {
    NSString *key = @"testPutAppInstanceUserExpirationSettings";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKIdentity registerChimeSDKIdentityWithConfiguration:configuration forKey:key];

    AWSChimeSDKIdentity *awsClient = [AWSChimeSDKIdentity ChimeSDKIdentityForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSChimeSDKIdentity ChimeSDKIdentityForKey:key] putAppInstanceUserExpirationSettings:[AWSChimeSDKIdentityPutAppInstanceUserExpirationSettingsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKIdentity removeChimeSDKIdentityForKey:key];
}

- (void)testPutAppInstanceUserExpirationSettingsCompletionHandler {
    NSString *key = @"testPutAppInstanceUserExpirationSettings";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKIdentity registerChimeSDKIdentityWithConfiguration:configuration forKey:key];

    AWSChimeSDKIdentity *awsClient = [AWSChimeSDKIdentity ChimeSDKIdentityForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSChimeSDKIdentity ChimeSDKIdentityForKey:key] putAppInstanceUserExpirationSettings:[AWSChimeSDKIdentityPutAppInstanceUserExpirationSettingsRequest new] completionHandler:^(AWSChimeSDKIdentityPutAppInstanceUserExpirationSettingsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKIdentity removeChimeSDKIdentityForKey:key];
}

- (void)testRegisterAppInstanceUserEndpoint {
    NSString *key = @"testRegisterAppInstanceUserEndpoint";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKIdentity registerChimeSDKIdentityWithConfiguration:configuration forKey:key];

    AWSChimeSDKIdentity *awsClient = [AWSChimeSDKIdentity ChimeSDKIdentityForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSChimeSDKIdentity ChimeSDKIdentityForKey:key] registerAppInstanceUserEndpoint:[AWSChimeSDKIdentityRegisterAppInstanceUserEndpointRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKIdentity removeChimeSDKIdentityForKey:key];
}

- (void)testRegisterAppInstanceUserEndpointCompletionHandler {
    NSString *key = @"testRegisterAppInstanceUserEndpoint";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKIdentity registerChimeSDKIdentityWithConfiguration:configuration forKey:key];

    AWSChimeSDKIdentity *awsClient = [AWSChimeSDKIdentity ChimeSDKIdentityForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSChimeSDKIdentity ChimeSDKIdentityForKey:key] registerAppInstanceUserEndpoint:[AWSChimeSDKIdentityRegisterAppInstanceUserEndpointRequest new] completionHandler:^(AWSChimeSDKIdentityRegisterAppInstanceUserEndpointResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKIdentity removeChimeSDKIdentityForKey:key];
}

- (void)testTagResource {
    NSString *key = @"testTagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKIdentity registerChimeSDKIdentityWithConfiguration:configuration forKey:key];

    AWSChimeSDKIdentity *awsClient = [AWSChimeSDKIdentity ChimeSDKIdentityForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSChimeSDKIdentity ChimeSDKIdentityForKey:key] tagResource:[AWSChimeSDKIdentityTagResourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKIdentity removeChimeSDKIdentityForKey:key];
}

- (void)testTagResourceCompletionHandler {
    NSString *key = @"testTagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKIdentity registerChimeSDKIdentityWithConfiguration:configuration forKey:key];

    AWSChimeSDKIdentity *awsClient = [AWSChimeSDKIdentity ChimeSDKIdentityForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSChimeSDKIdentity ChimeSDKIdentityForKey:key] tagResource:[AWSChimeSDKIdentityTagResourceRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKIdentity removeChimeSDKIdentityForKey:key];
}

- (void)testUntagResource {
    NSString *key = @"testUntagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKIdentity registerChimeSDKIdentityWithConfiguration:configuration forKey:key];

    AWSChimeSDKIdentity *awsClient = [AWSChimeSDKIdentity ChimeSDKIdentityForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSChimeSDKIdentity ChimeSDKIdentityForKey:key] untagResource:[AWSChimeSDKIdentityUntagResourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKIdentity removeChimeSDKIdentityForKey:key];
}

- (void)testUntagResourceCompletionHandler {
    NSString *key = @"testUntagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKIdentity registerChimeSDKIdentityWithConfiguration:configuration forKey:key];

    AWSChimeSDKIdentity *awsClient = [AWSChimeSDKIdentity ChimeSDKIdentityForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSChimeSDKIdentity ChimeSDKIdentityForKey:key] untagResource:[AWSChimeSDKIdentityUntagResourceRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKIdentity removeChimeSDKIdentityForKey:key];
}

- (void)testUpdateAppInstance {
    NSString *key = @"testUpdateAppInstance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKIdentity registerChimeSDKIdentityWithConfiguration:configuration forKey:key];

    AWSChimeSDKIdentity *awsClient = [AWSChimeSDKIdentity ChimeSDKIdentityForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSChimeSDKIdentity ChimeSDKIdentityForKey:key] updateAppInstance:[AWSChimeSDKIdentityUpdateAppInstanceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKIdentity removeChimeSDKIdentityForKey:key];
}

- (void)testUpdateAppInstanceCompletionHandler {
    NSString *key = @"testUpdateAppInstance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKIdentity registerChimeSDKIdentityWithConfiguration:configuration forKey:key];

    AWSChimeSDKIdentity *awsClient = [AWSChimeSDKIdentity ChimeSDKIdentityForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSChimeSDKIdentity ChimeSDKIdentityForKey:key] updateAppInstance:[AWSChimeSDKIdentityUpdateAppInstanceRequest new] completionHandler:^(AWSChimeSDKIdentityUpdateAppInstanceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKIdentity removeChimeSDKIdentityForKey:key];
}

- (void)testUpdateAppInstanceBot {
    NSString *key = @"testUpdateAppInstanceBot";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKIdentity registerChimeSDKIdentityWithConfiguration:configuration forKey:key];

    AWSChimeSDKIdentity *awsClient = [AWSChimeSDKIdentity ChimeSDKIdentityForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSChimeSDKIdentity ChimeSDKIdentityForKey:key] updateAppInstanceBot:[AWSChimeSDKIdentityUpdateAppInstanceBotRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKIdentity removeChimeSDKIdentityForKey:key];
}

- (void)testUpdateAppInstanceBotCompletionHandler {
    NSString *key = @"testUpdateAppInstanceBot";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKIdentity registerChimeSDKIdentityWithConfiguration:configuration forKey:key];

    AWSChimeSDKIdentity *awsClient = [AWSChimeSDKIdentity ChimeSDKIdentityForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSChimeSDKIdentity ChimeSDKIdentityForKey:key] updateAppInstanceBot:[AWSChimeSDKIdentityUpdateAppInstanceBotRequest new] completionHandler:^(AWSChimeSDKIdentityUpdateAppInstanceBotResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKIdentity removeChimeSDKIdentityForKey:key];
}

- (void)testUpdateAppInstanceUser {
    NSString *key = @"testUpdateAppInstanceUser";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKIdentity registerChimeSDKIdentityWithConfiguration:configuration forKey:key];

    AWSChimeSDKIdentity *awsClient = [AWSChimeSDKIdentity ChimeSDKIdentityForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSChimeSDKIdentity ChimeSDKIdentityForKey:key] updateAppInstanceUser:[AWSChimeSDKIdentityUpdateAppInstanceUserRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKIdentity removeChimeSDKIdentityForKey:key];
}

- (void)testUpdateAppInstanceUserCompletionHandler {
    NSString *key = @"testUpdateAppInstanceUser";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKIdentity registerChimeSDKIdentityWithConfiguration:configuration forKey:key];

    AWSChimeSDKIdentity *awsClient = [AWSChimeSDKIdentity ChimeSDKIdentityForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSChimeSDKIdentity ChimeSDKIdentityForKey:key] updateAppInstanceUser:[AWSChimeSDKIdentityUpdateAppInstanceUserRequest new] completionHandler:^(AWSChimeSDKIdentityUpdateAppInstanceUserResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKIdentity removeChimeSDKIdentityForKey:key];
}

- (void)testUpdateAppInstanceUserEndpoint {
    NSString *key = @"testUpdateAppInstanceUserEndpoint";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKIdentity registerChimeSDKIdentityWithConfiguration:configuration forKey:key];

    AWSChimeSDKIdentity *awsClient = [AWSChimeSDKIdentity ChimeSDKIdentityForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSChimeSDKIdentity ChimeSDKIdentityForKey:key] updateAppInstanceUserEndpoint:[AWSChimeSDKIdentityUpdateAppInstanceUserEndpointRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKIdentity removeChimeSDKIdentityForKey:key];
}

- (void)testUpdateAppInstanceUserEndpointCompletionHandler {
    NSString *key = @"testUpdateAppInstanceUserEndpoint";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSChimeSDKIdentity registerChimeSDKIdentityWithConfiguration:configuration forKey:key];

    AWSChimeSDKIdentity *awsClient = [AWSChimeSDKIdentity ChimeSDKIdentityForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSChimeSDKIdentity ChimeSDKIdentityForKey:key] updateAppInstanceUserEndpoint:[AWSChimeSDKIdentityUpdateAppInstanceUserEndpointRequest new] completionHandler:^(AWSChimeSDKIdentityUpdateAppInstanceUserEndpointResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSChimeSDKIdentity removeChimeSDKIdentityForKey:key];
}

@end
