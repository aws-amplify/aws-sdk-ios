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
#import "AWSapplication-autoscalingService.h"

static id mockNetworking = nil;

@interface AWSGeneralapplication-autoscalingTests : XCTestCase

@end

@implementation AWSGeneralapplication-autoscalingTests

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
    NSString *key = @"testapplication-autoscalingConstructors";
    XCTAssertNotNil([AWSapplication-autoscaling defaultapplication-autoscaling]);
    XCTAssertEqual([[AWSapplication-autoscaling defaultapplication-autoscaling] class], [AWSapplication-autoscaling class]);
    XCTAssertNil([AWSapplication-autoscaling application-autoscalingForKey:key]);

    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionSAEast1 credentialsProvider:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration.credentialsProvider];
    [AWSapplication-autoscaling registerapplication-autoscalingWithConfiguration:configuration forKey:key];
    XCTAssertNotNil([AWSapplication-autoscaling application-autoscalingForKey:key]);
    XCTAssertEqual([[AWSapplication-autoscaling application-autoscalingForKey:key] class], [AWSapplication-autoscaling class]);
    XCTAssertEqual([AWSapplication-autoscaling application-autoscalingForKey:key].configuration.regionType, AWSRegionSAEast1);

    [AWSapplication-autoscaling removeapplication-autoscalingForKey:key];
    XCTAssertNil([AWSapplication-autoscaling application-autoscalingForKey:key]);

}

- (void)testDeleteScalingPolicy {
    NSString *key = @"testDeleteScalingPolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapplication-autoscaling registerapplication-autoscalingWithConfiguration:configuration forKey:key];

    AWSapplication-autoscaling *awsClient = [AWSapplication-autoscaling application-autoscalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapplication-autoscaling application-autoscalingForKey:key] deleteScalingPolicy:[AWSapplication-autoscalingDeleteScalingPolicyRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapplication-autoscaling removeapplication-autoscalingForKey:key];
}

- (void)testDeleteScalingPolicyCompletionHandler {
    NSString *key = @"testDeleteScalingPolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapplication-autoscaling registerapplication-autoscalingWithConfiguration:configuration forKey:key];

    AWSapplication-autoscaling *awsClient = [AWSapplication-autoscaling application-autoscalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapplication-autoscaling application-autoscalingForKey:key] deleteScalingPolicy:[AWSapplication-autoscalingDeleteScalingPolicyRequest new] completionHandler:^(AWSapplication-autoscalingDeleteScalingPolicyResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapplication-autoscaling removeapplication-autoscalingForKey:key];
}

- (void)testDeleteScheduledAction {
    NSString *key = @"testDeleteScheduledAction";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapplication-autoscaling registerapplication-autoscalingWithConfiguration:configuration forKey:key];

    AWSapplication-autoscaling *awsClient = [AWSapplication-autoscaling application-autoscalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapplication-autoscaling application-autoscalingForKey:key] deleteScheduledAction:[AWSapplication-autoscalingDeleteScheduledActionRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapplication-autoscaling removeapplication-autoscalingForKey:key];
}

- (void)testDeleteScheduledActionCompletionHandler {
    NSString *key = @"testDeleteScheduledAction";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapplication-autoscaling registerapplication-autoscalingWithConfiguration:configuration forKey:key];

    AWSapplication-autoscaling *awsClient = [AWSapplication-autoscaling application-autoscalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapplication-autoscaling application-autoscalingForKey:key] deleteScheduledAction:[AWSapplication-autoscalingDeleteScheduledActionRequest new] completionHandler:^(AWSapplication-autoscalingDeleteScheduledActionResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapplication-autoscaling removeapplication-autoscalingForKey:key];
}

- (void)testDeregisterScalableTarget {
    NSString *key = @"testDeregisterScalableTarget";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapplication-autoscaling registerapplication-autoscalingWithConfiguration:configuration forKey:key];

    AWSapplication-autoscaling *awsClient = [AWSapplication-autoscaling application-autoscalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapplication-autoscaling application-autoscalingForKey:key] deregisterScalableTarget:[AWSapplication-autoscalingDeregisterScalableTargetRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapplication-autoscaling removeapplication-autoscalingForKey:key];
}

- (void)testDeregisterScalableTargetCompletionHandler {
    NSString *key = @"testDeregisterScalableTarget";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapplication-autoscaling registerapplication-autoscalingWithConfiguration:configuration forKey:key];

    AWSapplication-autoscaling *awsClient = [AWSapplication-autoscaling application-autoscalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapplication-autoscaling application-autoscalingForKey:key] deregisterScalableTarget:[AWSapplication-autoscalingDeregisterScalableTargetRequest new] completionHandler:^(AWSapplication-autoscalingDeregisterScalableTargetResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapplication-autoscaling removeapplication-autoscalingForKey:key];
}

- (void)testDescribeScalableTargets {
    NSString *key = @"testDescribeScalableTargets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapplication-autoscaling registerapplication-autoscalingWithConfiguration:configuration forKey:key];

    AWSapplication-autoscaling *awsClient = [AWSapplication-autoscaling application-autoscalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapplication-autoscaling application-autoscalingForKey:key] describeScalableTargets:[AWSapplication-autoscalingDescribeScalableTargetsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapplication-autoscaling removeapplication-autoscalingForKey:key];
}

- (void)testDescribeScalableTargetsCompletionHandler {
    NSString *key = @"testDescribeScalableTargets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapplication-autoscaling registerapplication-autoscalingWithConfiguration:configuration forKey:key];

    AWSapplication-autoscaling *awsClient = [AWSapplication-autoscaling application-autoscalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapplication-autoscaling application-autoscalingForKey:key] describeScalableTargets:[AWSapplication-autoscalingDescribeScalableTargetsRequest new] completionHandler:^(AWSapplication-autoscalingDescribeScalableTargetsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapplication-autoscaling removeapplication-autoscalingForKey:key];
}

- (void)testDescribeScalingActivities {
    NSString *key = @"testDescribeScalingActivities";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapplication-autoscaling registerapplication-autoscalingWithConfiguration:configuration forKey:key];

    AWSapplication-autoscaling *awsClient = [AWSapplication-autoscaling application-autoscalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapplication-autoscaling application-autoscalingForKey:key] describeScalingActivities:[AWSapplication-autoscalingDescribeScalingActivitiesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapplication-autoscaling removeapplication-autoscalingForKey:key];
}

- (void)testDescribeScalingActivitiesCompletionHandler {
    NSString *key = @"testDescribeScalingActivities";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapplication-autoscaling registerapplication-autoscalingWithConfiguration:configuration forKey:key];

    AWSapplication-autoscaling *awsClient = [AWSapplication-autoscaling application-autoscalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapplication-autoscaling application-autoscalingForKey:key] describeScalingActivities:[AWSapplication-autoscalingDescribeScalingActivitiesRequest new] completionHandler:^(AWSapplication-autoscalingDescribeScalingActivitiesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapplication-autoscaling removeapplication-autoscalingForKey:key];
}

- (void)testDescribeScalingPolicies {
    NSString *key = @"testDescribeScalingPolicies";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapplication-autoscaling registerapplication-autoscalingWithConfiguration:configuration forKey:key];

    AWSapplication-autoscaling *awsClient = [AWSapplication-autoscaling application-autoscalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapplication-autoscaling application-autoscalingForKey:key] describeScalingPolicies:[AWSapplication-autoscalingDescribeScalingPoliciesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapplication-autoscaling removeapplication-autoscalingForKey:key];
}

- (void)testDescribeScalingPoliciesCompletionHandler {
    NSString *key = @"testDescribeScalingPolicies";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapplication-autoscaling registerapplication-autoscalingWithConfiguration:configuration forKey:key];

    AWSapplication-autoscaling *awsClient = [AWSapplication-autoscaling application-autoscalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapplication-autoscaling application-autoscalingForKey:key] describeScalingPolicies:[AWSapplication-autoscalingDescribeScalingPoliciesRequest new] completionHandler:^(AWSapplication-autoscalingDescribeScalingPoliciesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapplication-autoscaling removeapplication-autoscalingForKey:key];
}

- (void)testDescribeScheduledActions {
    NSString *key = @"testDescribeScheduledActions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapplication-autoscaling registerapplication-autoscalingWithConfiguration:configuration forKey:key];

    AWSapplication-autoscaling *awsClient = [AWSapplication-autoscaling application-autoscalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapplication-autoscaling application-autoscalingForKey:key] describeScheduledActions:[AWSapplication-autoscalingDescribeScheduledActionsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapplication-autoscaling removeapplication-autoscalingForKey:key];
}

- (void)testDescribeScheduledActionsCompletionHandler {
    NSString *key = @"testDescribeScheduledActions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapplication-autoscaling registerapplication-autoscalingWithConfiguration:configuration forKey:key];

    AWSapplication-autoscaling *awsClient = [AWSapplication-autoscaling application-autoscalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapplication-autoscaling application-autoscalingForKey:key] describeScheduledActions:[AWSapplication-autoscalingDescribeScheduledActionsRequest new] completionHandler:^(AWSapplication-autoscalingDescribeScheduledActionsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapplication-autoscaling removeapplication-autoscalingForKey:key];
}

- (void)testPutScalingPolicy {
    NSString *key = @"testPutScalingPolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapplication-autoscaling registerapplication-autoscalingWithConfiguration:configuration forKey:key];

    AWSapplication-autoscaling *awsClient = [AWSapplication-autoscaling application-autoscalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapplication-autoscaling application-autoscalingForKey:key] putScalingPolicy:[AWSapplication-autoscalingPutScalingPolicyRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapplication-autoscaling removeapplication-autoscalingForKey:key];
}

- (void)testPutScalingPolicyCompletionHandler {
    NSString *key = @"testPutScalingPolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapplication-autoscaling registerapplication-autoscalingWithConfiguration:configuration forKey:key];

    AWSapplication-autoscaling *awsClient = [AWSapplication-autoscaling application-autoscalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapplication-autoscaling application-autoscalingForKey:key] putScalingPolicy:[AWSapplication-autoscalingPutScalingPolicyRequest new] completionHandler:^(AWSapplication-autoscalingPutScalingPolicyResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapplication-autoscaling removeapplication-autoscalingForKey:key];
}

- (void)testPutScheduledAction {
    NSString *key = @"testPutScheduledAction";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapplication-autoscaling registerapplication-autoscalingWithConfiguration:configuration forKey:key];

    AWSapplication-autoscaling *awsClient = [AWSapplication-autoscaling application-autoscalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapplication-autoscaling application-autoscalingForKey:key] putScheduledAction:[AWSapplication-autoscalingPutScheduledActionRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapplication-autoscaling removeapplication-autoscalingForKey:key];
}

- (void)testPutScheduledActionCompletionHandler {
    NSString *key = @"testPutScheduledAction";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapplication-autoscaling registerapplication-autoscalingWithConfiguration:configuration forKey:key];

    AWSapplication-autoscaling *awsClient = [AWSapplication-autoscaling application-autoscalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapplication-autoscaling application-autoscalingForKey:key] putScheduledAction:[AWSapplication-autoscalingPutScheduledActionRequest new] completionHandler:^(AWSapplication-autoscalingPutScheduledActionResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapplication-autoscaling removeapplication-autoscalingForKey:key];
}

- (void)testRegisterScalableTarget {
    NSString *key = @"testRegisterScalableTarget";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapplication-autoscaling registerapplication-autoscalingWithConfiguration:configuration forKey:key];

    AWSapplication-autoscaling *awsClient = [AWSapplication-autoscaling application-autoscalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapplication-autoscaling application-autoscalingForKey:key] registerScalableTarget:[AWSapplication-autoscalingRegisterScalableTargetRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapplication-autoscaling removeapplication-autoscalingForKey:key];
}

- (void)testRegisterScalableTargetCompletionHandler {
    NSString *key = @"testRegisterScalableTarget";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapplication-autoscaling registerapplication-autoscalingWithConfiguration:configuration forKey:key];

    AWSapplication-autoscaling *awsClient = [AWSapplication-autoscaling application-autoscalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapplication-autoscaling application-autoscalingForKey:key] registerScalableTarget:[AWSapplication-autoscalingRegisterScalableTargetRequest new] completionHandler:^(AWSapplication-autoscalingRegisterScalableTargetResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapplication-autoscaling removeapplication-autoscalingForKey:key];
}

@end
