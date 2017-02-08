//
// Copyright 2010-2017 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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
#import "AWSAutoScalingService.h"

static id mockNetworking = nil;

@interface AWSGeneralAutoScalingTests : XCTestCase

@end

@implementation AWSGeneralAutoScalingTests

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
    NSString *key = @"testAutoScalingConstructors";
    XCTAssertNotNil([AWSAutoScaling defaultAutoScaling]);
    XCTAssertEqual([[AWSAutoScaling defaultAutoScaling] class], [AWSAutoScaling class]);
    XCTAssertNil([AWSAutoScaling AutoScalingForKey:key]);

    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionSAEast1 credentialsProvider:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration.credentialsProvider];
    [AWSAutoScaling registerAutoScalingWithConfiguration:configuration forKey:key];
    XCTAssertNotNil([AWSAutoScaling AutoScalingForKey:key]);
    XCTAssertEqual([[AWSAutoScaling AutoScalingForKey:key] class], [AWSAutoScaling class]);
    XCTAssertEqual([AWSAutoScaling AutoScalingForKey:key].configuration.regionType, AWSRegionSAEast1);

    [AWSAutoScaling removeAutoScalingForKey:key];
    XCTAssertNil([AWSAutoScaling AutoScalingForKey:key]);

}

- (void)testAttachInstances {
    NSString *key = @"testAttachInstances";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAutoScaling registerAutoScalingWithConfiguration:configuration forKey:key];

    AWSAutoScaling *awsClient = [AWSAutoScaling AutoScalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAutoScaling AutoScalingForKey:key] attachInstances:[AWSAutoScalingAttachInstancesQuery new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAutoScaling removeAutoScalingForKey:key];
}

- (void)testAttachInstancesCompletionHandler {
    NSString *key = @"testAttachInstances";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAutoScaling registerAutoScalingWithConfiguration:configuration forKey:key];

    AWSAutoScaling *awsClient = [AWSAutoScaling AutoScalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAutoScaling AutoScalingForKey:key] attachInstances:[AWSAutoScalingAttachInstancesQuery new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAutoScaling removeAutoScalingForKey:key];
}

- (void)testAttachLoadBalancerTargetGroups {
    NSString *key = @"testAttachLoadBalancerTargetGroups";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAutoScaling registerAutoScalingWithConfiguration:configuration forKey:key];

    AWSAutoScaling *awsClient = [AWSAutoScaling AutoScalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAutoScaling AutoScalingForKey:key] attachLoadBalancerTargetGroups:[AWSAutoScalingAttachLoadBalancerTargetGroupsType new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAutoScaling removeAutoScalingForKey:key];
}

- (void)testAttachLoadBalancerTargetGroupsCompletionHandler {
    NSString *key = @"testAttachLoadBalancerTargetGroups";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAutoScaling registerAutoScalingWithConfiguration:configuration forKey:key];

    AWSAutoScaling *awsClient = [AWSAutoScaling AutoScalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAutoScaling AutoScalingForKey:key] attachLoadBalancerTargetGroups:[AWSAutoScalingAttachLoadBalancerTargetGroupsType new] completionHandler:^(AWSAutoScalingAttachLoadBalancerTargetGroupsResultType* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAutoScaling removeAutoScalingForKey:key];
}

- (void)testAttachLoadBalancers {
    NSString *key = @"testAttachLoadBalancers";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAutoScaling registerAutoScalingWithConfiguration:configuration forKey:key];

    AWSAutoScaling *awsClient = [AWSAutoScaling AutoScalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAutoScaling AutoScalingForKey:key] attachLoadBalancers:[AWSAutoScalingAttachLoadBalancersType new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAutoScaling removeAutoScalingForKey:key];
}

- (void)testAttachLoadBalancersCompletionHandler {
    NSString *key = @"testAttachLoadBalancers";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAutoScaling registerAutoScalingWithConfiguration:configuration forKey:key];

    AWSAutoScaling *awsClient = [AWSAutoScaling AutoScalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAutoScaling AutoScalingForKey:key] attachLoadBalancers:[AWSAutoScalingAttachLoadBalancersType new] completionHandler:^(AWSAutoScalingAttachLoadBalancersResultType* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAutoScaling removeAutoScalingForKey:key];
}

- (void)testCompleteLifecycleAction {
    NSString *key = @"testCompleteLifecycleAction";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAutoScaling registerAutoScalingWithConfiguration:configuration forKey:key];

    AWSAutoScaling *awsClient = [AWSAutoScaling AutoScalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAutoScaling AutoScalingForKey:key] completeLifecycleAction:[AWSAutoScalingCompleteLifecycleActionType new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAutoScaling removeAutoScalingForKey:key];
}

- (void)testCompleteLifecycleActionCompletionHandler {
    NSString *key = @"testCompleteLifecycleAction";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAutoScaling registerAutoScalingWithConfiguration:configuration forKey:key];

    AWSAutoScaling *awsClient = [AWSAutoScaling AutoScalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAutoScaling AutoScalingForKey:key] completeLifecycleAction:[AWSAutoScalingCompleteLifecycleActionType new] completionHandler:^(AWSAutoScalingCompleteLifecycleActionAnswer* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAutoScaling removeAutoScalingForKey:key];
}

- (void)testCreateAutoScalingGroup {
    NSString *key = @"testCreateAutoScalingGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAutoScaling registerAutoScalingWithConfiguration:configuration forKey:key];

    AWSAutoScaling *awsClient = [AWSAutoScaling AutoScalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAutoScaling AutoScalingForKey:key] createAutoScalingGroup:[AWSAutoScalingCreateAutoScalingGroupType new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAutoScaling removeAutoScalingForKey:key];
}

- (void)testCreateAutoScalingGroupCompletionHandler {
    NSString *key = @"testCreateAutoScalingGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAutoScaling registerAutoScalingWithConfiguration:configuration forKey:key];

    AWSAutoScaling *awsClient = [AWSAutoScaling AutoScalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAutoScaling AutoScalingForKey:key] createAutoScalingGroup:[AWSAutoScalingCreateAutoScalingGroupType new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAutoScaling removeAutoScalingForKey:key];
}

- (void)testCreateLaunchConfiguration {
    NSString *key = @"testCreateLaunchConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAutoScaling registerAutoScalingWithConfiguration:configuration forKey:key];

    AWSAutoScaling *awsClient = [AWSAutoScaling AutoScalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAutoScaling AutoScalingForKey:key] createLaunchConfiguration:[AWSAutoScalingCreateLaunchConfigurationType new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAutoScaling removeAutoScalingForKey:key];
}

- (void)testCreateLaunchConfigurationCompletionHandler {
    NSString *key = @"testCreateLaunchConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAutoScaling registerAutoScalingWithConfiguration:configuration forKey:key];

    AWSAutoScaling *awsClient = [AWSAutoScaling AutoScalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAutoScaling AutoScalingForKey:key] createLaunchConfiguration:[AWSAutoScalingCreateLaunchConfigurationType new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAutoScaling removeAutoScalingForKey:key];
}

- (void)testCreateOrUpdateTags {
    NSString *key = @"testCreateOrUpdateTags";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAutoScaling registerAutoScalingWithConfiguration:configuration forKey:key];

    AWSAutoScaling *awsClient = [AWSAutoScaling AutoScalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAutoScaling AutoScalingForKey:key] createOrUpdateTags:[AWSAutoScalingCreateOrUpdateTagsType new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAutoScaling removeAutoScalingForKey:key];
}

- (void)testCreateOrUpdateTagsCompletionHandler {
    NSString *key = @"testCreateOrUpdateTags";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAutoScaling registerAutoScalingWithConfiguration:configuration forKey:key];

    AWSAutoScaling *awsClient = [AWSAutoScaling AutoScalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAutoScaling AutoScalingForKey:key] createOrUpdateTags:[AWSAutoScalingCreateOrUpdateTagsType new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAutoScaling removeAutoScalingForKey:key];
}

- (void)testDeleteAutoScalingGroup {
    NSString *key = @"testDeleteAutoScalingGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAutoScaling registerAutoScalingWithConfiguration:configuration forKey:key];

    AWSAutoScaling *awsClient = [AWSAutoScaling AutoScalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAutoScaling AutoScalingForKey:key] deleteAutoScalingGroup:[AWSAutoScalingDeleteAutoScalingGroupType new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAutoScaling removeAutoScalingForKey:key];
}

- (void)testDeleteAutoScalingGroupCompletionHandler {
    NSString *key = @"testDeleteAutoScalingGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAutoScaling registerAutoScalingWithConfiguration:configuration forKey:key];

    AWSAutoScaling *awsClient = [AWSAutoScaling AutoScalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAutoScaling AutoScalingForKey:key] deleteAutoScalingGroup:[AWSAutoScalingDeleteAutoScalingGroupType new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAutoScaling removeAutoScalingForKey:key];
}

- (void)testDeleteLaunchConfiguration {
    NSString *key = @"testDeleteLaunchConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAutoScaling registerAutoScalingWithConfiguration:configuration forKey:key];

    AWSAutoScaling *awsClient = [AWSAutoScaling AutoScalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAutoScaling AutoScalingForKey:key] deleteLaunchConfiguration:[AWSAutoScalingLaunchConfigurationNameType new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAutoScaling removeAutoScalingForKey:key];
}

- (void)testDeleteLaunchConfigurationCompletionHandler {
    NSString *key = @"testDeleteLaunchConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAutoScaling registerAutoScalingWithConfiguration:configuration forKey:key];

    AWSAutoScaling *awsClient = [AWSAutoScaling AutoScalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAutoScaling AutoScalingForKey:key] deleteLaunchConfiguration:[AWSAutoScalingLaunchConfigurationNameType new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAutoScaling removeAutoScalingForKey:key];
}

- (void)testDeleteLifecycleHook {
    NSString *key = @"testDeleteLifecycleHook";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAutoScaling registerAutoScalingWithConfiguration:configuration forKey:key];

    AWSAutoScaling *awsClient = [AWSAutoScaling AutoScalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAutoScaling AutoScalingForKey:key] deleteLifecycleHook:[AWSAutoScalingDeleteLifecycleHookType new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAutoScaling removeAutoScalingForKey:key];
}

- (void)testDeleteLifecycleHookCompletionHandler {
    NSString *key = @"testDeleteLifecycleHook";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAutoScaling registerAutoScalingWithConfiguration:configuration forKey:key];

    AWSAutoScaling *awsClient = [AWSAutoScaling AutoScalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAutoScaling AutoScalingForKey:key] deleteLifecycleHook:[AWSAutoScalingDeleteLifecycleHookType new] completionHandler:^(AWSAutoScalingDeleteLifecycleHookAnswer* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAutoScaling removeAutoScalingForKey:key];
}

- (void)testDeleteNotificationConfiguration {
    NSString *key = @"testDeleteNotificationConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAutoScaling registerAutoScalingWithConfiguration:configuration forKey:key];

    AWSAutoScaling *awsClient = [AWSAutoScaling AutoScalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAutoScaling AutoScalingForKey:key] deleteNotificationConfiguration:[AWSAutoScalingDeleteNotificationConfigurationType new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAutoScaling removeAutoScalingForKey:key];
}

- (void)testDeleteNotificationConfigurationCompletionHandler {
    NSString *key = @"testDeleteNotificationConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAutoScaling registerAutoScalingWithConfiguration:configuration forKey:key];

    AWSAutoScaling *awsClient = [AWSAutoScaling AutoScalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAutoScaling AutoScalingForKey:key] deleteNotificationConfiguration:[AWSAutoScalingDeleteNotificationConfigurationType new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAutoScaling removeAutoScalingForKey:key];
}

- (void)testDeletePolicy {
    NSString *key = @"testDeletePolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAutoScaling registerAutoScalingWithConfiguration:configuration forKey:key];

    AWSAutoScaling *awsClient = [AWSAutoScaling AutoScalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAutoScaling AutoScalingForKey:key] deletePolicy:[AWSAutoScalingDeletePolicyType new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAutoScaling removeAutoScalingForKey:key];
}

- (void)testDeletePolicyCompletionHandler {
    NSString *key = @"testDeletePolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAutoScaling registerAutoScalingWithConfiguration:configuration forKey:key];

    AWSAutoScaling *awsClient = [AWSAutoScaling AutoScalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAutoScaling AutoScalingForKey:key] deletePolicy:[AWSAutoScalingDeletePolicyType new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAutoScaling removeAutoScalingForKey:key];
}

- (void)testDeleteScheduledAction {
    NSString *key = @"testDeleteScheduledAction";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAutoScaling registerAutoScalingWithConfiguration:configuration forKey:key];

    AWSAutoScaling *awsClient = [AWSAutoScaling AutoScalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAutoScaling AutoScalingForKey:key] deleteScheduledAction:[AWSAutoScalingDeleteScheduledActionType new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAutoScaling removeAutoScalingForKey:key];
}

- (void)testDeleteScheduledActionCompletionHandler {
    NSString *key = @"testDeleteScheduledAction";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAutoScaling registerAutoScalingWithConfiguration:configuration forKey:key];

    AWSAutoScaling *awsClient = [AWSAutoScaling AutoScalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAutoScaling AutoScalingForKey:key] deleteScheduledAction:[AWSAutoScalingDeleteScheduledActionType new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAutoScaling removeAutoScalingForKey:key];
}

- (void)testDeleteTags {
    NSString *key = @"testDeleteTags";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAutoScaling registerAutoScalingWithConfiguration:configuration forKey:key];

    AWSAutoScaling *awsClient = [AWSAutoScaling AutoScalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAutoScaling AutoScalingForKey:key] deleteTags:[AWSAutoScalingDeleteTagsType new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAutoScaling removeAutoScalingForKey:key];
}

- (void)testDeleteTagsCompletionHandler {
    NSString *key = @"testDeleteTags";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAutoScaling registerAutoScalingWithConfiguration:configuration forKey:key];

    AWSAutoScaling *awsClient = [AWSAutoScaling AutoScalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAutoScaling AutoScalingForKey:key] deleteTags:[AWSAutoScalingDeleteTagsType new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAutoScaling removeAutoScalingForKey:key];
}

- (void)testDescribeAccountLimits {
    NSString *key = @"testDescribeAccountLimits";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAutoScaling registerAutoScalingWithConfiguration:configuration forKey:key];

    AWSAutoScaling *awsClient = [AWSAutoScaling AutoScalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAutoScaling AutoScalingForKey:key] describeAccountLimits:[AWSRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAutoScaling removeAutoScalingForKey:key];
}

- (void)testDescribeAccountLimitsCompletionHandler {
    NSString *key = @"testDescribeAccountLimits";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAutoScaling registerAutoScalingWithConfiguration:configuration forKey:key];

    AWSAutoScaling *awsClient = [AWSAutoScaling AutoScalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAutoScaling AutoScalingForKey:key] describeAccountLimits:[AWSRequest new] completionHandler:^(AWSAutoScalingDescribeAccountLimitsAnswer* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAutoScaling removeAutoScalingForKey:key];
}

- (void)testDescribeAdjustmentTypes {
    NSString *key = @"testDescribeAdjustmentTypes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAutoScaling registerAutoScalingWithConfiguration:configuration forKey:key];

    AWSAutoScaling *awsClient = [AWSAutoScaling AutoScalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAutoScaling AutoScalingForKey:key] describeAdjustmentTypes:[AWSRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAutoScaling removeAutoScalingForKey:key];
}

- (void)testDescribeAdjustmentTypesCompletionHandler {
    NSString *key = @"testDescribeAdjustmentTypes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAutoScaling registerAutoScalingWithConfiguration:configuration forKey:key];

    AWSAutoScaling *awsClient = [AWSAutoScaling AutoScalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAutoScaling AutoScalingForKey:key] describeAdjustmentTypes:[AWSRequest new] completionHandler:^(AWSAutoScalingDescribeAdjustmentTypesAnswer* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAutoScaling removeAutoScalingForKey:key];
}

- (void)testDescribeAutoScalingGroups {
    NSString *key = @"testDescribeAutoScalingGroups";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAutoScaling registerAutoScalingWithConfiguration:configuration forKey:key];

    AWSAutoScaling *awsClient = [AWSAutoScaling AutoScalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAutoScaling AutoScalingForKey:key] describeAutoScalingGroups:[AWSAutoScalingAutoScalingGroupNamesType new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAutoScaling removeAutoScalingForKey:key];
}

- (void)testDescribeAutoScalingGroupsCompletionHandler {
    NSString *key = @"testDescribeAutoScalingGroups";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAutoScaling registerAutoScalingWithConfiguration:configuration forKey:key];

    AWSAutoScaling *awsClient = [AWSAutoScaling AutoScalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAutoScaling AutoScalingForKey:key] describeAutoScalingGroups:[AWSAutoScalingAutoScalingGroupNamesType new] completionHandler:^(AWSAutoScalingAutoScalingGroupsType* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAutoScaling removeAutoScalingForKey:key];
}

- (void)testDescribeAutoScalingInstances {
    NSString *key = @"testDescribeAutoScalingInstances";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAutoScaling registerAutoScalingWithConfiguration:configuration forKey:key];

    AWSAutoScaling *awsClient = [AWSAutoScaling AutoScalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAutoScaling AutoScalingForKey:key] describeAutoScalingInstances:[AWSAutoScalingDescribeAutoScalingInstancesType new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAutoScaling removeAutoScalingForKey:key];
}

- (void)testDescribeAutoScalingInstancesCompletionHandler {
    NSString *key = @"testDescribeAutoScalingInstances";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAutoScaling registerAutoScalingWithConfiguration:configuration forKey:key];

    AWSAutoScaling *awsClient = [AWSAutoScaling AutoScalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAutoScaling AutoScalingForKey:key] describeAutoScalingInstances:[AWSAutoScalingDescribeAutoScalingInstancesType new] completionHandler:^(AWSAutoScalingAutoScalingInstancesType* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAutoScaling removeAutoScalingForKey:key];
}

- (void)testDescribeAutoScalingNotificationTypes {
    NSString *key = @"testDescribeAutoScalingNotificationTypes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAutoScaling registerAutoScalingWithConfiguration:configuration forKey:key];

    AWSAutoScaling *awsClient = [AWSAutoScaling AutoScalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAutoScaling AutoScalingForKey:key] describeAutoScalingNotificationTypes:[AWSRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAutoScaling removeAutoScalingForKey:key];
}

- (void)testDescribeAutoScalingNotificationTypesCompletionHandler {
    NSString *key = @"testDescribeAutoScalingNotificationTypes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAutoScaling registerAutoScalingWithConfiguration:configuration forKey:key];

    AWSAutoScaling *awsClient = [AWSAutoScaling AutoScalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAutoScaling AutoScalingForKey:key] describeAutoScalingNotificationTypes:[AWSRequest new] completionHandler:^(AWSAutoScalingDescribeAutoScalingNotificationTypesAnswer* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAutoScaling removeAutoScalingForKey:key];
}

- (void)testDescribeLaunchConfigurations {
    NSString *key = @"testDescribeLaunchConfigurations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAutoScaling registerAutoScalingWithConfiguration:configuration forKey:key];

    AWSAutoScaling *awsClient = [AWSAutoScaling AutoScalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAutoScaling AutoScalingForKey:key] describeLaunchConfigurations:[AWSAutoScalingLaunchConfigurationNamesType new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAutoScaling removeAutoScalingForKey:key];
}

- (void)testDescribeLaunchConfigurationsCompletionHandler {
    NSString *key = @"testDescribeLaunchConfigurations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAutoScaling registerAutoScalingWithConfiguration:configuration forKey:key];

    AWSAutoScaling *awsClient = [AWSAutoScaling AutoScalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAutoScaling AutoScalingForKey:key] describeLaunchConfigurations:[AWSAutoScalingLaunchConfigurationNamesType new] completionHandler:^(AWSAutoScalingLaunchConfigurationsType* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAutoScaling removeAutoScalingForKey:key];
}

- (void)testDescribeLifecycleHookTypes {
    NSString *key = @"testDescribeLifecycleHookTypes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAutoScaling registerAutoScalingWithConfiguration:configuration forKey:key];

    AWSAutoScaling *awsClient = [AWSAutoScaling AutoScalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAutoScaling AutoScalingForKey:key] describeLifecycleHookTypes:[AWSRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAutoScaling removeAutoScalingForKey:key];
}

- (void)testDescribeLifecycleHookTypesCompletionHandler {
    NSString *key = @"testDescribeLifecycleHookTypes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAutoScaling registerAutoScalingWithConfiguration:configuration forKey:key];

    AWSAutoScaling *awsClient = [AWSAutoScaling AutoScalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAutoScaling AutoScalingForKey:key] describeLifecycleHookTypes:[AWSRequest new] completionHandler:^(AWSAutoScalingDescribeLifecycleHookTypesAnswer* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAutoScaling removeAutoScalingForKey:key];
}

- (void)testDescribeLifecycleHooks {
    NSString *key = @"testDescribeLifecycleHooks";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAutoScaling registerAutoScalingWithConfiguration:configuration forKey:key];

    AWSAutoScaling *awsClient = [AWSAutoScaling AutoScalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAutoScaling AutoScalingForKey:key] describeLifecycleHooks:[AWSAutoScalingDescribeLifecycleHooksType new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAutoScaling removeAutoScalingForKey:key];
}

- (void)testDescribeLifecycleHooksCompletionHandler {
    NSString *key = @"testDescribeLifecycleHooks";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAutoScaling registerAutoScalingWithConfiguration:configuration forKey:key];

    AWSAutoScaling *awsClient = [AWSAutoScaling AutoScalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAutoScaling AutoScalingForKey:key] describeLifecycleHooks:[AWSAutoScalingDescribeLifecycleHooksType new] completionHandler:^(AWSAutoScalingDescribeLifecycleHooksAnswer* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAutoScaling removeAutoScalingForKey:key];
}

- (void)testDescribeLoadBalancerTargetGroups {
    NSString *key = @"testDescribeLoadBalancerTargetGroups";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAutoScaling registerAutoScalingWithConfiguration:configuration forKey:key];

    AWSAutoScaling *awsClient = [AWSAutoScaling AutoScalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAutoScaling AutoScalingForKey:key] describeLoadBalancerTargetGroups:[AWSAutoScalingDescribeLoadBalancerTargetGroupsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAutoScaling removeAutoScalingForKey:key];
}

- (void)testDescribeLoadBalancerTargetGroupsCompletionHandler {
    NSString *key = @"testDescribeLoadBalancerTargetGroups";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAutoScaling registerAutoScalingWithConfiguration:configuration forKey:key];

    AWSAutoScaling *awsClient = [AWSAutoScaling AutoScalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAutoScaling AutoScalingForKey:key] describeLoadBalancerTargetGroups:[AWSAutoScalingDescribeLoadBalancerTargetGroupsRequest new] completionHandler:^(AWSAutoScalingDescribeLoadBalancerTargetGroupsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAutoScaling removeAutoScalingForKey:key];
}

- (void)testDescribeLoadBalancers {
    NSString *key = @"testDescribeLoadBalancers";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAutoScaling registerAutoScalingWithConfiguration:configuration forKey:key];

    AWSAutoScaling *awsClient = [AWSAutoScaling AutoScalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAutoScaling AutoScalingForKey:key] describeLoadBalancers:[AWSAutoScalingDescribeLoadBalancersRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAutoScaling removeAutoScalingForKey:key];
}

- (void)testDescribeLoadBalancersCompletionHandler {
    NSString *key = @"testDescribeLoadBalancers";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAutoScaling registerAutoScalingWithConfiguration:configuration forKey:key];

    AWSAutoScaling *awsClient = [AWSAutoScaling AutoScalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAutoScaling AutoScalingForKey:key] describeLoadBalancers:[AWSAutoScalingDescribeLoadBalancersRequest new] completionHandler:^(AWSAutoScalingDescribeLoadBalancersResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAutoScaling removeAutoScalingForKey:key];
}

- (void)testDescribeMetricCollectionTypes {
    NSString *key = @"testDescribeMetricCollectionTypes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAutoScaling registerAutoScalingWithConfiguration:configuration forKey:key];

    AWSAutoScaling *awsClient = [AWSAutoScaling AutoScalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAutoScaling AutoScalingForKey:key] describeMetricCollectionTypes:[AWSRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAutoScaling removeAutoScalingForKey:key];
}

- (void)testDescribeMetricCollectionTypesCompletionHandler {
    NSString *key = @"testDescribeMetricCollectionTypes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAutoScaling registerAutoScalingWithConfiguration:configuration forKey:key];

    AWSAutoScaling *awsClient = [AWSAutoScaling AutoScalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAutoScaling AutoScalingForKey:key] describeMetricCollectionTypes:[AWSRequest new] completionHandler:^(AWSAutoScalingDescribeMetricCollectionTypesAnswer* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAutoScaling removeAutoScalingForKey:key];
}

- (void)testDescribeNotificationConfigurations {
    NSString *key = @"testDescribeNotificationConfigurations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAutoScaling registerAutoScalingWithConfiguration:configuration forKey:key];

    AWSAutoScaling *awsClient = [AWSAutoScaling AutoScalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAutoScaling AutoScalingForKey:key] describeNotificationConfigurations:[AWSAutoScalingDescribeNotificationConfigurationsType new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAutoScaling removeAutoScalingForKey:key];
}

- (void)testDescribeNotificationConfigurationsCompletionHandler {
    NSString *key = @"testDescribeNotificationConfigurations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAutoScaling registerAutoScalingWithConfiguration:configuration forKey:key];

    AWSAutoScaling *awsClient = [AWSAutoScaling AutoScalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAutoScaling AutoScalingForKey:key] describeNotificationConfigurations:[AWSAutoScalingDescribeNotificationConfigurationsType new] completionHandler:^(AWSAutoScalingDescribeNotificationConfigurationsAnswer* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAutoScaling removeAutoScalingForKey:key];
}

- (void)testDescribePolicies {
    NSString *key = @"testDescribePolicies";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAutoScaling registerAutoScalingWithConfiguration:configuration forKey:key];

    AWSAutoScaling *awsClient = [AWSAutoScaling AutoScalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAutoScaling AutoScalingForKey:key] describePolicies:[AWSAutoScalingDescribePoliciesType new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAutoScaling removeAutoScalingForKey:key];
}

- (void)testDescribePoliciesCompletionHandler {
    NSString *key = @"testDescribePolicies";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAutoScaling registerAutoScalingWithConfiguration:configuration forKey:key];

    AWSAutoScaling *awsClient = [AWSAutoScaling AutoScalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAutoScaling AutoScalingForKey:key] describePolicies:[AWSAutoScalingDescribePoliciesType new] completionHandler:^(AWSAutoScalingPoliciesType* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAutoScaling removeAutoScalingForKey:key];
}

- (void)testDescribeScalingActivities {
    NSString *key = @"testDescribeScalingActivities";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAutoScaling registerAutoScalingWithConfiguration:configuration forKey:key];

    AWSAutoScaling *awsClient = [AWSAutoScaling AutoScalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAutoScaling AutoScalingForKey:key] describeScalingActivities:[AWSAutoScalingDescribeScalingActivitiesType new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAutoScaling removeAutoScalingForKey:key];
}

- (void)testDescribeScalingActivitiesCompletionHandler {
    NSString *key = @"testDescribeScalingActivities";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAutoScaling registerAutoScalingWithConfiguration:configuration forKey:key];

    AWSAutoScaling *awsClient = [AWSAutoScaling AutoScalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAutoScaling AutoScalingForKey:key] describeScalingActivities:[AWSAutoScalingDescribeScalingActivitiesType new] completionHandler:^(AWSAutoScalingActivitiesType* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAutoScaling removeAutoScalingForKey:key];
}

- (void)testDescribeScalingProcessTypes {
    NSString *key = @"testDescribeScalingProcessTypes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAutoScaling registerAutoScalingWithConfiguration:configuration forKey:key];

    AWSAutoScaling *awsClient = [AWSAutoScaling AutoScalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAutoScaling AutoScalingForKey:key] describeScalingProcessTypes:[AWSRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAutoScaling removeAutoScalingForKey:key];
}

- (void)testDescribeScalingProcessTypesCompletionHandler {
    NSString *key = @"testDescribeScalingProcessTypes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAutoScaling registerAutoScalingWithConfiguration:configuration forKey:key];

    AWSAutoScaling *awsClient = [AWSAutoScaling AutoScalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAutoScaling AutoScalingForKey:key] describeScalingProcessTypes:[AWSRequest new] completionHandler:^(AWSAutoScalingProcessesType* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAutoScaling removeAutoScalingForKey:key];
}

- (void)testDescribeScheduledActions {
    NSString *key = @"testDescribeScheduledActions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAutoScaling registerAutoScalingWithConfiguration:configuration forKey:key];

    AWSAutoScaling *awsClient = [AWSAutoScaling AutoScalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAutoScaling AutoScalingForKey:key] describeScheduledActions:[AWSAutoScalingDescribeScheduledActionsType new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAutoScaling removeAutoScalingForKey:key];
}

- (void)testDescribeScheduledActionsCompletionHandler {
    NSString *key = @"testDescribeScheduledActions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAutoScaling registerAutoScalingWithConfiguration:configuration forKey:key];

    AWSAutoScaling *awsClient = [AWSAutoScaling AutoScalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAutoScaling AutoScalingForKey:key] describeScheduledActions:[AWSAutoScalingDescribeScheduledActionsType new] completionHandler:^(AWSAutoScalingScheduledActionsType* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAutoScaling removeAutoScalingForKey:key];
}

- (void)testDescribeTags {
    NSString *key = @"testDescribeTags";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAutoScaling registerAutoScalingWithConfiguration:configuration forKey:key];

    AWSAutoScaling *awsClient = [AWSAutoScaling AutoScalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAutoScaling AutoScalingForKey:key] describeTags:[AWSAutoScalingDescribeTagsType new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAutoScaling removeAutoScalingForKey:key];
}

- (void)testDescribeTagsCompletionHandler {
    NSString *key = @"testDescribeTags";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAutoScaling registerAutoScalingWithConfiguration:configuration forKey:key];

    AWSAutoScaling *awsClient = [AWSAutoScaling AutoScalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAutoScaling AutoScalingForKey:key] describeTags:[AWSAutoScalingDescribeTagsType new] completionHandler:^(AWSAutoScalingTagsType* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAutoScaling removeAutoScalingForKey:key];
}

- (void)testDescribeTerminationPolicyTypes {
    NSString *key = @"testDescribeTerminationPolicyTypes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAutoScaling registerAutoScalingWithConfiguration:configuration forKey:key];

    AWSAutoScaling *awsClient = [AWSAutoScaling AutoScalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAutoScaling AutoScalingForKey:key] describeTerminationPolicyTypes:[AWSRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAutoScaling removeAutoScalingForKey:key];
}

- (void)testDescribeTerminationPolicyTypesCompletionHandler {
    NSString *key = @"testDescribeTerminationPolicyTypes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAutoScaling registerAutoScalingWithConfiguration:configuration forKey:key];

    AWSAutoScaling *awsClient = [AWSAutoScaling AutoScalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAutoScaling AutoScalingForKey:key] describeTerminationPolicyTypes:[AWSRequest new] completionHandler:^(AWSAutoScalingDescribeTerminationPolicyTypesAnswer* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAutoScaling removeAutoScalingForKey:key];
}

- (void)testDetachInstances {
    NSString *key = @"testDetachInstances";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAutoScaling registerAutoScalingWithConfiguration:configuration forKey:key];

    AWSAutoScaling *awsClient = [AWSAutoScaling AutoScalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAutoScaling AutoScalingForKey:key] detachInstances:[AWSAutoScalingDetachInstancesQuery new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAutoScaling removeAutoScalingForKey:key];
}

- (void)testDetachInstancesCompletionHandler {
    NSString *key = @"testDetachInstances";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAutoScaling registerAutoScalingWithConfiguration:configuration forKey:key];

    AWSAutoScaling *awsClient = [AWSAutoScaling AutoScalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAutoScaling AutoScalingForKey:key] detachInstances:[AWSAutoScalingDetachInstancesQuery new] completionHandler:^(AWSAutoScalingDetachInstancesAnswer* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAutoScaling removeAutoScalingForKey:key];
}

- (void)testDetachLoadBalancerTargetGroups {
    NSString *key = @"testDetachLoadBalancerTargetGroups";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAutoScaling registerAutoScalingWithConfiguration:configuration forKey:key];

    AWSAutoScaling *awsClient = [AWSAutoScaling AutoScalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAutoScaling AutoScalingForKey:key] detachLoadBalancerTargetGroups:[AWSAutoScalingDetachLoadBalancerTargetGroupsType new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAutoScaling removeAutoScalingForKey:key];
}

- (void)testDetachLoadBalancerTargetGroupsCompletionHandler {
    NSString *key = @"testDetachLoadBalancerTargetGroups";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAutoScaling registerAutoScalingWithConfiguration:configuration forKey:key];

    AWSAutoScaling *awsClient = [AWSAutoScaling AutoScalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAutoScaling AutoScalingForKey:key] detachLoadBalancerTargetGroups:[AWSAutoScalingDetachLoadBalancerTargetGroupsType new] completionHandler:^(AWSAutoScalingDetachLoadBalancerTargetGroupsResultType* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAutoScaling removeAutoScalingForKey:key];
}

- (void)testDetachLoadBalancers {
    NSString *key = @"testDetachLoadBalancers";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAutoScaling registerAutoScalingWithConfiguration:configuration forKey:key];

    AWSAutoScaling *awsClient = [AWSAutoScaling AutoScalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAutoScaling AutoScalingForKey:key] detachLoadBalancers:[AWSAutoScalingDetachLoadBalancersType new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAutoScaling removeAutoScalingForKey:key];
}

- (void)testDetachLoadBalancersCompletionHandler {
    NSString *key = @"testDetachLoadBalancers";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAutoScaling registerAutoScalingWithConfiguration:configuration forKey:key];

    AWSAutoScaling *awsClient = [AWSAutoScaling AutoScalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAutoScaling AutoScalingForKey:key] detachLoadBalancers:[AWSAutoScalingDetachLoadBalancersType new] completionHandler:^(AWSAutoScalingDetachLoadBalancersResultType* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAutoScaling removeAutoScalingForKey:key];
}

- (void)testDisableMetricsCollection {
    NSString *key = @"testDisableMetricsCollection";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAutoScaling registerAutoScalingWithConfiguration:configuration forKey:key];

    AWSAutoScaling *awsClient = [AWSAutoScaling AutoScalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAutoScaling AutoScalingForKey:key] disableMetricsCollection:[AWSAutoScalingDisableMetricsCollectionQuery new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAutoScaling removeAutoScalingForKey:key];
}

- (void)testDisableMetricsCollectionCompletionHandler {
    NSString *key = @"testDisableMetricsCollection";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAutoScaling registerAutoScalingWithConfiguration:configuration forKey:key];

    AWSAutoScaling *awsClient = [AWSAutoScaling AutoScalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAutoScaling AutoScalingForKey:key] disableMetricsCollection:[AWSAutoScalingDisableMetricsCollectionQuery new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAutoScaling removeAutoScalingForKey:key];
}

- (void)testEnableMetricsCollection {
    NSString *key = @"testEnableMetricsCollection";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAutoScaling registerAutoScalingWithConfiguration:configuration forKey:key];

    AWSAutoScaling *awsClient = [AWSAutoScaling AutoScalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAutoScaling AutoScalingForKey:key] enableMetricsCollection:[AWSAutoScalingEnableMetricsCollectionQuery new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAutoScaling removeAutoScalingForKey:key];
}

- (void)testEnableMetricsCollectionCompletionHandler {
    NSString *key = @"testEnableMetricsCollection";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAutoScaling registerAutoScalingWithConfiguration:configuration forKey:key];

    AWSAutoScaling *awsClient = [AWSAutoScaling AutoScalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAutoScaling AutoScalingForKey:key] enableMetricsCollection:[AWSAutoScalingEnableMetricsCollectionQuery new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAutoScaling removeAutoScalingForKey:key];
}

- (void)testEnterStandby {
    NSString *key = @"testEnterStandby";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAutoScaling registerAutoScalingWithConfiguration:configuration forKey:key];

    AWSAutoScaling *awsClient = [AWSAutoScaling AutoScalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAutoScaling AutoScalingForKey:key] enterStandby:[AWSAutoScalingEnterStandbyQuery new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAutoScaling removeAutoScalingForKey:key];
}

- (void)testEnterStandbyCompletionHandler {
    NSString *key = @"testEnterStandby";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAutoScaling registerAutoScalingWithConfiguration:configuration forKey:key];

    AWSAutoScaling *awsClient = [AWSAutoScaling AutoScalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAutoScaling AutoScalingForKey:key] enterStandby:[AWSAutoScalingEnterStandbyQuery new] completionHandler:^(AWSAutoScalingEnterStandbyAnswer* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAutoScaling removeAutoScalingForKey:key];
}

- (void)testExecutePolicy {
    NSString *key = @"testExecutePolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAutoScaling registerAutoScalingWithConfiguration:configuration forKey:key];

    AWSAutoScaling *awsClient = [AWSAutoScaling AutoScalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAutoScaling AutoScalingForKey:key] executePolicy:[AWSAutoScalingExecutePolicyType new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAutoScaling removeAutoScalingForKey:key];
}

- (void)testExecutePolicyCompletionHandler {
    NSString *key = @"testExecutePolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAutoScaling registerAutoScalingWithConfiguration:configuration forKey:key];

    AWSAutoScaling *awsClient = [AWSAutoScaling AutoScalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAutoScaling AutoScalingForKey:key] executePolicy:[AWSAutoScalingExecutePolicyType new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAutoScaling removeAutoScalingForKey:key];
}

- (void)testExitStandby {
    NSString *key = @"testExitStandby";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAutoScaling registerAutoScalingWithConfiguration:configuration forKey:key];

    AWSAutoScaling *awsClient = [AWSAutoScaling AutoScalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAutoScaling AutoScalingForKey:key] exitStandby:[AWSAutoScalingExitStandbyQuery new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAutoScaling removeAutoScalingForKey:key];
}

- (void)testExitStandbyCompletionHandler {
    NSString *key = @"testExitStandby";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAutoScaling registerAutoScalingWithConfiguration:configuration forKey:key];

    AWSAutoScaling *awsClient = [AWSAutoScaling AutoScalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAutoScaling AutoScalingForKey:key] exitStandby:[AWSAutoScalingExitStandbyQuery new] completionHandler:^(AWSAutoScalingExitStandbyAnswer* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAutoScaling removeAutoScalingForKey:key];
}

- (void)testPutLifecycleHook {
    NSString *key = @"testPutLifecycleHook";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAutoScaling registerAutoScalingWithConfiguration:configuration forKey:key];

    AWSAutoScaling *awsClient = [AWSAutoScaling AutoScalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAutoScaling AutoScalingForKey:key] putLifecycleHook:[AWSAutoScalingPutLifecycleHookType new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAutoScaling removeAutoScalingForKey:key];
}

- (void)testPutLifecycleHookCompletionHandler {
    NSString *key = @"testPutLifecycleHook";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAutoScaling registerAutoScalingWithConfiguration:configuration forKey:key];

    AWSAutoScaling *awsClient = [AWSAutoScaling AutoScalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAutoScaling AutoScalingForKey:key] putLifecycleHook:[AWSAutoScalingPutLifecycleHookType new] completionHandler:^(AWSAutoScalingPutLifecycleHookAnswer* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAutoScaling removeAutoScalingForKey:key];
}

- (void)testPutNotificationConfiguration {
    NSString *key = @"testPutNotificationConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAutoScaling registerAutoScalingWithConfiguration:configuration forKey:key];

    AWSAutoScaling *awsClient = [AWSAutoScaling AutoScalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAutoScaling AutoScalingForKey:key] putNotificationConfiguration:[AWSAutoScalingPutNotificationConfigurationType new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAutoScaling removeAutoScalingForKey:key];
}

- (void)testPutNotificationConfigurationCompletionHandler {
    NSString *key = @"testPutNotificationConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAutoScaling registerAutoScalingWithConfiguration:configuration forKey:key];

    AWSAutoScaling *awsClient = [AWSAutoScaling AutoScalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAutoScaling AutoScalingForKey:key] putNotificationConfiguration:[AWSAutoScalingPutNotificationConfigurationType new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAutoScaling removeAutoScalingForKey:key];
}

- (void)testPutScalingPolicy {
    NSString *key = @"testPutScalingPolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAutoScaling registerAutoScalingWithConfiguration:configuration forKey:key];

    AWSAutoScaling *awsClient = [AWSAutoScaling AutoScalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAutoScaling AutoScalingForKey:key] putScalingPolicy:[AWSAutoScalingPutScalingPolicyType new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAutoScaling removeAutoScalingForKey:key];
}

- (void)testPutScalingPolicyCompletionHandler {
    NSString *key = @"testPutScalingPolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAutoScaling registerAutoScalingWithConfiguration:configuration forKey:key];

    AWSAutoScaling *awsClient = [AWSAutoScaling AutoScalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAutoScaling AutoScalingForKey:key] putScalingPolicy:[AWSAutoScalingPutScalingPolicyType new] completionHandler:^(AWSAutoScalingPolicyARNType* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAutoScaling removeAutoScalingForKey:key];
}

- (void)testPutScheduledUpdateGroupAction {
    NSString *key = @"testPutScheduledUpdateGroupAction";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAutoScaling registerAutoScalingWithConfiguration:configuration forKey:key];

    AWSAutoScaling *awsClient = [AWSAutoScaling AutoScalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAutoScaling AutoScalingForKey:key] putScheduledUpdateGroupAction:[AWSAutoScalingPutScheduledUpdateGroupActionType new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAutoScaling removeAutoScalingForKey:key];
}

- (void)testPutScheduledUpdateGroupActionCompletionHandler {
    NSString *key = @"testPutScheduledUpdateGroupAction";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAutoScaling registerAutoScalingWithConfiguration:configuration forKey:key];

    AWSAutoScaling *awsClient = [AWSAutoScaling AutoScalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAutoScaling AutoScalingForKey:key] putScheduledUpdateGroupAction:[AWSAutoScalingPutScheduledUpdateGroupActionType new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAutoScaling removeAutoScalingForKey:key];
}

- (void)testRecordLifecycleActionHeartbeat {
    NSString *key = @"testRecordLifecycleActionHeartbeat";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAutoScaling registerAutoScalingWithConfiguration:configuration forKey:key];

    AWSAutoScaling *awsClient = [AWSAutoScaling AutoScalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAutoScaling AutoScalingForKey:key] recordLifecycleActionHeartbeat:[AWSAutoScalingRecordLifecycleActionHeartbeatType new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAutoScaling removeAutoScalingForKey:key];
}

- (void)testRecordLifecycleActionHeartbeatCompletionHandler {
    NSString *key = @"testRecordLifecycleActionHeartbeat";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAutoScaling registerAutoScalingWithConfiguration:configuration forKey:key];

    AWSAutoScaling *awsClient = [AWSAutoScaling AutoScalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAutoScaling AutoScalingForKey:key] recordLifecycleActionHeartbeat:[AWSAutoScalingRecordLifecycleActionHeartbeatType new] completionHandler:^(AWSAutoScalingRecordLifecycleActionHeartbeatAnswer* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAutoScaling removeAutoScalingForKey:key];
}

- (void)testResumeProcesses {
    NSString *key = @"testResumeProcesses";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAutoScaling registerAutoScalingWithConfiguration:configuration forKey:key];

    AWSAutoScaling *awsClient = [AWSAutoScaling AutoScalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAutoScaling AutoScalingForKey:key] resumeProcesses:[AWSAutoScalingScalingProcessQuery new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAutoScaling removeAutoScalingForKey:key];
}

- (void)testResumeProcessesCompletionHandler {
    NSString *key = @"testResumeProcesses";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAutoScaling registerAutoScalingWithConfiguration:configuration forKey:key];

    AWSAutoScaling *awsClient = [AWSAutoScaling AutoScalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAutoScaling AutoScalingForKey:key] resumeProcesses:[AWSAutoScalingScalingProcessQuery new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAutoScaling removeAutoScalingForKey:key];
}

- (void)testSetDesiredCapacity {
    NSString *key = @"testSetDesiredCapacity";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAutoScaling registerAutoScalingWithConfiguration:configuration forKey:key];

    AWSAutoScaling *awsClient = [AWSAutoScaling AutoScalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAutoScaling AutoScalingForKey:key] setDesiredCapacity:[AWSAutoScalingSetDesiredCapacityType new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAutoScaling removeAutoScalingForKey:key];
}

- (void)testSetDesiredCapacityCompletionHandler {
    NSString *key = @"testSetDesiredCapacity";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAutoScaling registerAutoScalingWithConfiguration:configuration forKey:key];

    AWSAutoScaling *awsClient = [AWSAutoScaling AutoScalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAutoScaling AutoScalingForKey:key] setDesiredCapacity:[AWSAutoScalingSetDesiredCapacityType new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAutoScaling removeAutoScalingForKey:key];
}

- (void)testSetInstanceHealth {
    NSString *key = @"testSetInstanceHealth";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAutoScaling registerAutoScalingWithConfiguration:configuration forKey:key];

    AWSAutoScaling *awsClient = [AWSAutoScaling AutoScalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAutoScaling AutoScalingForKey:key] setInstanceHealth:[AWSAutoScalingSetInstanceHealthQuery new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAutoScaling removeAutoScalingForKey:key];
}

- (void)testSetInstanceHealthCompletionHandler {
    NSString *key = @"testSetInstanceHealth";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAutoScaling registerAutoScalingWithConfiguration:configuration forKey:key];

    AWSAutoScaling *awsClient = [AWSAutoScaling AutoScalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAutoScaling AutoScalingForKey:key] setInstanceHealth:[AWSAutoScalingSetInstanceHealthQuery new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAutoScaling removeAutoScalingForKey:key];
}

- (void)testSetInstanceProtection {
    NSString *key = @"testSetInstanceProtection";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAutoScaling registerAutoScalingWithConfiguration:configuration forKey:key];

    AWSAutoScaling *awsClient = [AWSAutoScaling AutoScalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAutoScaling AutoScalingForKey:key] setInstanceProtection:[AWSAutoScalingSetInstanceProtectionQuery new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAutoScaling removeAutoScalingForKey:key];
}

- (void)testSetInstanceProtectionCompletionHandler {
    NSString *key = @"testSetInstanceProtection";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAutoScaling registerAutoScalingWithConfiguration:configuration forKey:key];

    AWSAutoScaling *awsClient = [AWSAutoScaling AutoScalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAutoScaling AutoScalingForKey:key] setInstanceProtection:[AWSAutoScalingSetInstanceProtectionQuery new] completionHandler:^(AWSAutoScalingSetInstanceProtectionAnswer* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAutoScaling removeAutoScalingForKey:key];
}

- (void)testSuspendProcesses {
    NSString *key = @"testSuspendProcesses";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAutoScaling registerAutoScalingWithConfiguration:configuration forKey:key];

    AWSAutoScaling *awsClient = [AWSAutoScaling AutoScalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAutoScaling AutoScalingForKey:key] suspendProcesses:[AWSAutoScalingScalingProcessQuery new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAutoScaling removeAutoScalingForKey:key];
}

- (void)testSuspendProcessesCompletionHandler {
    NSString *key = @"testSuspendProcesses";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAutoScaling registerAutoScalingWithConfiguration:configuration forKey:key];

    AWSAutoScaling *awsClient = [AWSAutoScaling AutoScalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAutoScaling AutoScalingForKey:key] suspendProcesses:[AWSAutoScalingScalingProcessQuery new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAutoScaling removeAutoScalingForKey:key];
}

- (void)testTerminateInstanceInAutoScalingGroup {
    NSString *key = @"testTerminateInstanceInAutoScalingGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAutoScaling registerAutoScalingWithConfiguration:configuration forKey:key];

    AWSAutoScaling *awsClient = [AWSAutoScaling AutoScalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAutoScaling AutoScalingForKey:key] terminateInstanceInAutoScalingGroup:[AWSAutoScalingTerminateInstanceInAutoScalingGroupType new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAutoScaling removeAutoScalingForKey:key];
}

- (void)testTerminateInstanceInAutoScalingGroupCompletionHandler {
    NSString *key = @"testTerminateInstanceInAutoScalingGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAutoScaling registerAutoScalingWithConfiguration:configuration forKey:key];

    AWSAutoScaling *awsClient = [AWSAutoScaling AutoScalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAutoScaling AutoScalingForKey:key] terminateInstanceInAutoScalingGroup:[AWSAutoScalingTerminateInstanceInAutoScalingGroupType new] completionHandler:^(AWSAutoScalingActivityType* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAutoScaling removeAutoScalingForKey:key];
}

- (void)testUpdateAutoScalingGroup {
    NSString *key = @"testUpdateAutoScalingGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAutoScaling registerAutoScalingWithConfiguration:configuration forKey:key];

    AWSAutoScaling *awsClient = [AWSAutoScaling AutoScalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAutoScaling AutoScalingForKey:key] updateAutoScalingGroup:[AWSAutoScalingUpdateAutoScalingGroupType new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAutoScaling removeAutoScalingForKey:key];
}

- (void)testUpdateAutoScalingGroupCompletionHandler {
    NSString *key = @"testUpdateAutoScalingGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAutoScaling registerAutoScalingWithConfiguration:configuration forKey:key];

    AWSAutoScaling *awsClient = [AWSAutoScaling AutoScalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAutoScaling AutoScalingForKey:key] updateAutoScalingGroup:[AWSAutoScalingUpdateAutoScalingGroupType new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAutoScaling removeAutoScalingForKey:key];
}

@end
