//
// Copyright 2010-2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

@end
