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
#import "AWSApplicationautoscalingService.h"

static id mockNetworking = nil;

@interface AWSGeneralApplicationautoscalingTests : XCTestCase

@end

@implementation AWSGeneralApplicationautoscalingTests

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
    NSString *key = @"testApplicationautoscalingConstructors";
    XCTAssertNotNil([AWSApplicationautoscaling defaultApplicationautoscaling]);
    XCTAssertEqual([[AWSApplicationautoscaling defaultApplicationautoscaling] class], [AWSApplicationautoscaling class]);
    XCTAssertNil([AWSApplicationautoscaling ApplicationautoscalingForKey:key]);

    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionSAEast1 credentialsProvider:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration.credentialsProvider];
    [AWSApplicationautoscaling registerApplicationautoscalingWithConfiguration:configuration forKey:key];
    XCTAssertNotNil([AWSApplicationautoscaling ApplicationautoscalingForKey:key]);
    XCTAssertEqual([[AWSApplicationautoscaling ApplicationautoscalingForKey:key] class], [AWSApplicationautoscaling class]);
    XCTAssertEqual([AWSApplicationautoscaling ApplicationautoscalingForKey:key].configuration.regionType, AWSRegionSAEast1);

    [AWSApplicationautoscaling removeApplicationautoscalingForKey:key];
    XCTAssertNil([AWSApplicationautoscaling ApplicationautoscalingForKey:key]);

}

- (void)testDeleteScalingPolicy {
    NSString *key = @"testDeleteScalingPolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSApplicationautoscaling registerApplicationautoscalingWithConfiguration:configuration forKey:key];

    AWSApplicationautoscaling *awsClient = [AWSApplicationautoscaling ApplicationautoscalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSApplicationautoscaling ApplicationautoscalingForKey:key] deleteScalingPolicy:[AWSApplicationautoscalingDeleteScalingPolicyRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSApplicationautoscaling removeApplicationautoscalingForKey:key];
}

- (void)testDeleteScalingPolicyCompletionHandler {
    NSString *key = @"testDeleteScalingPolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSApplicationautoscaling registerApplicationautoscalingWithConfiguration:configuration forKey:key];

    AWSApplicationautoscaling *awsClient = [AWSApplicationautoscaling ApplicationautoscalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSApplicationautoscaling ApplicationautoscalingForKey:key] deleteScalingPolicy:[AWSApplicationautoscalingDeleteScalingPolicyRequest new] completionHandler:^(AWSApplicationautoscalingDeleteScalingPolicyResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSApplicationautoscaling removeApplicationautoscalingForKey:key];
}

- (void)testDeleteScheduledAction {
    NSString *key = @"testDeleteScheduledAction";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSApplicationautoscaling registerApplicationautoscalingWithConfiguration:configuration forKey:key];

    AWSApplicationautoscaling *awsClient = [AWSApplicationautoscaling ApplicationautoscalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSApplicationautoscaling ApplicationautoscalingForKey:key] deleteScheduledAction:[AWSApplicationautoscalingDeleteScheduledActionRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSApplicationautoscaling removeApplicationautoscalingForKey:key];
}

- (void)testDeleteScheduledActionCompletionHandler {
    NSString *key = @"testDeleteScheduledAction";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSApplicationautoscaling registerApplicationautoscalingWithConfiguration:configuration forKey:key];

    AWSApplicationautoscaling *awsClient = [AWSApplicationautoscaling ApplicationautoscalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSApplicationautoscaling ApplicationautoscalingForKey:key] deleteScheduledAction:[AWSApplicationautoscalingDeleteScheduledActionRequest new] completionHandler:^(AWSApplicationautoscalingDeleteScheduledActionResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSApplicationautoscaling removeApplicationautoscalingForKey:key];
}

- (void)testDeregisterScalableTarget {
    NSString *key = @"testDeregisterScalableTarget";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSApplicationautoscaling registerApplicationautoscalingWithConfiguration:configuration forKey:key];

    AWSApplicationautoscaling *awsClient = [AWSApplicationautoscaling ApplicationautoscalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSApplicationautoscaling ApplicationautoscalingForKey:key] deregisterScalableTarget:[AWSApplicationautoscalingDeregisterScalableTargetRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSApplicationautoscaling removeApplicationautoscalingForKey:key];
}

- (void)testDeregisterScalableTargetCompletionHandler {
    NSString *key = @"testDeregisterScalableTarget";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSApplicationautoscaling registerApplicationautoscalingWithConfiguration:configuration forKey:key];

    AWSApplicationautoscaling *awsClient = [AWSApplicationautoscaling ApplicationautoscalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSApplicationautoscaling ApplicationautoscalingForKey:key] deregisterScalableTarget:[AWSApplicationautoscalingDeregisterScalableTargetRequest new] completionHandler:^(AWSApplicationautoscalingDeregisterScalableTargetResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSApplicationautoscaling removeApplicationautoscalingForKey:key];
}

- (void)testDescribeScalableTargets {
    NSString *key = @"testDescribeScalableTargets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSApplicationautoscaling registerApplicationautoscalingWithConfiguration:configuration forKey:key];

    AWSApplicationautoscaling *awsClient = [AWSApplicationautoscaling ApplicationautoscalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSApplicationautoscaling ApplicationautoscalingForKey:key] describeScalableTargets:[AWSApplicationautoscalingDescribeScalableTargetsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSApplicationautoscaling removeApplicationautoscalingForKey:key];
}

- (void)testDescribeScalableTargetsCompletionHandler {
    NSString *key = @"testDescribeScalableTargets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSApplicationautoscaling registerApplicationautoscalingWithConfiguration:configuration forKey:key];

    AWSApplicationautoscaling *awsClient = [AWSApplicationautoscaling ApplicationautoscalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSApplicationautoscaling ApplicationautoscalingForKey:key] describeScalableTargets:[AWSApplicationautoscalingDescribeScalableTargetsRequest new] completionHandler:^(AWSApplicationautoscalingDescribeScalableTargetsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSApplicationautoscaling removeApplicationautoscalingForKey:key];
}

- (void)testDescribeScalingActivities {
    NSString *key = @"testDescribeScalingActivities";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSApplicationautoscaling registerApplicationautoscalingWithConfiguration:configuration forKey:key];

    AWSApplicationautoscaling *awsClient = [AWSApplicationautoscaling ApplicationautoscalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSApplicationautoscaling ApplicationautoscalingForKey:key] describeScalingActivities:[AWSApplicationautoscalingDescribeScalingActivitiesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSApplicationautoscaling removeApplicationautoscalingForKey:key];
}

- (void)testDescribeScalingActivitiesCompletionHandler {
    NSString *key = @"testDescribeScalingActivities";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSApplicationautoscaling registerApplicationautoscalingWithConfiguration:configuration forKey:key];

    AWSApplicationautoscaling *awsClient = [AWSApplicationautoscaling ApplicationautoscalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSApplicationautoscaling ApplicationautoscalingForKey:key] describeScalingActivities:[AWSApplicationautoscalingDescribeScalingActivitiesRequest new] completionHandler:^(AWSApplicationautoscalingDescribeScalingActivitiesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSApplicationautoscaling removeApplicationautoscalingForKey:key];
}

- (void)testDescribeScalingPolicies {
    NSString *key = @"testDescribeScalingPolicies";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSApplicationautoscaling registerApplicationautoscalingWithConfiguration:configuration forKey:key];

    AWSApplicationautoscaling *awsClient = [AWSApplicationautoscaling ApplicationautoscalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSApplicationautoscaling ApplicationautoscalingForKey:key] describeScalingPolicies:[AWSApplicationautoscalingDescribeScalingPoliciesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSApplicationautoscaling removeApplicationautoscalingForKey:key];
}

- (void)testDescribeScalingPoliciesCompletionHandler {
    NSString *key = @"testDescribeScalingPolicies";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSApplicationautoscaling registerApplicationautoscalingWithConfiguration:configuration forKey:key];

    AWSApplicationautoscaling *awsClient = [AWSApplicationautoscaling ApplicationautoscalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSApplicationautoscaling ApplicationautoscalingForKey:key] describeScalingPolicies:[AWSApplicationautoscalingDescribeScalingPoliciesRequest new] completionHandler:^(AWSApplicationautoscalingDescribeScalingPoliciesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSApplicationautoscaling removeApplicationautoscalingForKey:key];
}

- (void)testDescribeScheduledActions {
    NSString *key = @"testDescribeScheduledActions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSApplicationautoscaling registerApplicationautoscalingWithConfiguration:configuration forKey:key];

    AWSApplicationautoscaling *awsClient = [AWSApplicationautoscaling ApplicationautoscalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSApplicationautoscaling ApplicationautoscalingForKey:key] describeScheduledActions:[AWSApplicationautoscalingDescribeScheduledActionsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSApplicationautoscaling removeApplicationautoscalingForKey:key];
}

- (void)testDescribeScheduledActionsCompletionHandler {
    NSString *key = @"testDescribeScheduledActions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSApplicationautoscaling registerApplicationautoscalingWithConfiguration:configuration forKey:key];

    AWSApplicationautoscaling *awsClient = [AWSApplicationautoscaling ApplicationautoscalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSApplicationautoscaling ApplicationautoscalingForKey:key] describeScheduledActions:[AWSApplicationautoscalingDescribeScheduledActionsRequest new] completionHandler:^(AWSApplicationautoscalingDescribeScheduledActionsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSApplicationautoscaling removeApplicationautoscalingForKey:key];
}

- (void)testPutScalingPolicy {
    NSString *key = @"testPutScalingPolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSApplicationautoscaling registerApplicationautoscalingWithConfiguration:configuration forKey:key];

    AWSApplicationautoscaling *awsClient = [AWSApplicationautoscaling ApplicationautoscalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSApplicationautoscaling ApplicationautoscalingForKey:key] putScalingPolicy:[AWSApplicationautoscalingPutScalingPolicyRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSApplicationautoscaling removeApplicationautoscalingForKey:key];
}

- (void)testPutScalingPolicyCompletionHandler {
    NSString *key = @"testPutScalingPolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSApplicationautoscaling registerApplicationautoscalingWithConfiguration:configuration forKey:key];

    AWSApplicationautoscaling *awsClient = [AWSApplicationautoscaling ApplicationautoscalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSApplicationautoscaling ApplicationautoscalingForKey:key] putScalingPolicy:[AWSApplicationautoscalingPutScalingPolicyRequest new] completionHandler:^(AWSApplicationautoscalingPutScalingPolicyResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSApplicationautoscaling removeApplicationautoscalingForKey:key];
}

- (void)testPutScheduledAction {
    NSString *key = @"testPutScheduledAction";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSApplicationautoscaling registerApplicationautoscalingWithConfiguration:configuration forKey:key];

    AWSApplicationautoscaling *awsClient = [AWSApplicationautoscaling ApplicationautoscalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSApplicationautoscaling ApplicationautoscalingForKey:key] putScheduledAction:[AWSApplicationautoscalingPutScheduledActionRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSApplicationautoscaling removeApplicationautoscalingForKey:key];
}

- (void)testPutScheduledActionCompletionHandler {
    NSString *key = @"testPutScheduledAction";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSApplicationautoscaling registerApplicationautoscalingWithConfiguration:configuration forKey:key];

    AWSApplicationautoscaling *awsClient = [AWSApplicationautoscaling ApplicationautoscalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSApplicationautoscaling ApplicationautoscalingForKey:key] putScheduledAction:[AWSApplicationautoscalingPutScheduledActionRequest new] completionHandler:^(AWSApplicationautoscalingPutScheduledActionResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSApplicationautoscaling removeApplicationautoscalingForKey:key];
}

- (void)testRegisterScalableTarget {
    NSString *key = @"testRegisterScalableTarget";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSApplicationautoscaling registerApplicationautoscalingWithConfiguration:configuration forKey:key];

    AWSApplicationautoscaling *awsClient = [AWSApplicationautoscaling ApplicationautoscalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSApplicationautoscaling ApplicationautoscalingForKey:key] registerScalableTarget:[AWSApplicationautoscalingRegisterScalableTargetRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSApplicationautoscaling removeApplicationautoscalingForKey:key];
}

- (void)testRegisterScalableTargetCompletionHandler {
    NSString *key = @"testRegisterScalableTarget";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSApplicationautoscaling registerApplicationautoscalingWithConfiguration:configuration forKey:key];

    AWSApplicationautoscaling *awsClient = [AWSApplicationautoscaling ApplicationautoscalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSApplicationautoscaling ApplicationautoscalingForKey:key] registerScalableTarget:[AWSApplicationautoscalingRegisterScalableTargetRequest new] completionHandler:^(AWSApplicationautoscalingRegisterScalableTargetResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSApplicationautoscaling removeApplicationautoscalingForKey:key];
}

@end
