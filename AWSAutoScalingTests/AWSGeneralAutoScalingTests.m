//
// Copyright 2010-2016 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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
#import <OCMock/OCMock.h>
#import "AWSTestUtility.h"
#import "AWSAutoScaling.h"

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAutoScaling removeAutoScalingForKey:key];
}

@end
