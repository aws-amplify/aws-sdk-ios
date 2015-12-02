/*
 Copyright 2010-2015 Amazon.com, Inc. or its affiliates. All Rights Reserved.

 Licensed under the Apache License, Version 2.0 (the "License").
 You may not use this file except in compliance with the License.
 A copy of the License is located at

 http://aws.amazon.com/apache2.0

 or in the "license" file accompanying this file. This file is distributed
 on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 express or implied. See the License for the specific language governing
 permissions and limitations under the License.
 */

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "AWSTestUtility.h"
#import "AWSCloudWatch.h"

static id mockNetworking = nil;

@interface AWSGeneralCloudWatchTests : XCTestCase

@end

@implementation AWSGeneralCloudWatchTests

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
    NSString *key = @"testCloudWatchConstructors";
    XCTAssertNotNil([AWSCloudWatch defaultCloudWatch]);
    XCTAssertEqual([[AWSCloudWatch defaultCloudWatch] class], [AWSCloudWatch class]);
    XCTAssertNil([AWSCloudWatch CloudWatchForKey:key]);

    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionSAEast1 credentialsProvider:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration.credentialsProvider];
    [AWSCloudWatch registerCloudWatchWithConfiguration:configuration forKey:key];
    XCTAssertNotNil([AWSCloudWatch CloudWatchForKey:key]);
    XCTAssertEqual([[AWSCloudWatch CloudWatchForKey:key] class], [AWSCloudWatch class]);
    XCTAssertEqual([AWSCloudWatch CloudWatchForKey:key].configuration.regionType, AWSRegionSAEast1);

    [AWSCloudWatch removeCloudWatchForKey:key];
    XCTAssertNil([AWSCloudWatch CloudWatchForKey:key]);

}

- (void)testDeleteAlarms {
    NSString *key = @"testDeleteAlarms";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudWatch registerCloudWatchWithConfiguration:configuration forKey:key];

    AWSCloudWatch *awsClient = [AWSCloudWatch CloudWatchForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCloudWatch CloudWatchForKey:key] deleteAlarms:[AWSCloudWatchDeleteAlarmsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudWatch removeCloudWatchForKey:key];
}

- (void)testDescribeAlarmHistory {
    NSString *key = @"testDescribeAlarmHistory";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudWatch registerCloudWatchWithConfiguration:configuration forKey:key];

    AWSCloudWatch *awsClient = [AWSCloudWatch CloudWatchForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCloudWatch CloudWatchForKey:key] describeAlarmHistory:[AWSCloudWatchDescribeAlarmHistoryInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudWatch removeCloudWatchForKey:key];
}

- (void)testDescribeAlarms {
    NSString *key = @"testDescribeAlarms";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudWatch registerCloudWatchWithConfiguration:configuration forKey:key];

    AWSCloudWatch *awsClient = [AWSCloudWatch CloudWatchForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCloudWatch CloudWatchForKey:key] describeAlarms:[AWSCloudWatchDescribeAlarmsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudWatch removeCloudWatchForKey:key];
}

- (void)testDescribeAlarmsForMetric {
    NSString *key = @"testDescribeAlarmsForMetric";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudWatch registerCloudWatchWithConfiguration:configuration forKey:key];

    AWSCloudWatch *awsClient = [AWSCloudWatch CloudWatchForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCloudWatch CloudWatchForKey:key] describeAlarmsForMetric:[AWSCloudWatchDescribeAlarmsForMetricInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudWatch removeCloudWatchForKey:key];
}

- (void)testDisableAlarmActions {
    NSString *key = @"testDisableAlarmActions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudWatch registerCloudWatchWithConfiguration:configuration forKey:key];

    AWSCloudWatch *awsClient = [AWSCloudWatch CloudWatchForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCloudWatch CloudWatchForKey:key] disableAlarmActions:[AWSCloudWatchDisableAlarmActionsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudWatch removeCloudWatchForKey:key];
}

- (void)testEnableAlarmActions {
    NSString *key = @"testEnableAlarmActions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudWatch registerCloudWatchWithConfiguration:configuration forKey:key];

    AWSCloudWatch *awsClient = [AWSCloudWatch CloudWatchForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCloudWatch CloudWatchForKey:key] enableAlarmActions:[AWSCloudWatchEnableAlarmActionsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudWatch removeCloudWatchForKey:key];
}

- (void)testGetMetricStatistics {
    NSString *key = @"testGetMetricStatistics";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudWatch registerCloudWatchWithConfiguration:configuration forKey:key];

    AWSCloudWatch *awsClient = [AWSCloudWatch CloudWatchForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCloudWatch CloudWatchForKey:key] getMetricStatistics:[AWSCloudWatchGetMetricStatisticsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudWatch removeCloudWatchForKey:key];
}

- (void)testListMetrics {
    NSString *key = @"testListMetrics";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudWatch registerCloudWatchWithConfiguration:configuration forKey:key];

    AWSCloudWatch *awsClient = [AWSCloudWatch CloudWatchForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCloudWatch CloudWatchForKey:key] listMetrics:[AWSCloudWatchListMetricsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudWatch removeCloudWatchForKey:key];
}

- (void)testPutMetricAlarm {
    NSString *key = @"testPutMetricAlarm";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudWatch registerCloudWatchWithConfiguration:configuration forKey:key];

    AWSCloudWatch *awsClient = [AWSCloudWatch CloudWatchForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCloudWatch CloudWatchForKey:key] putMetricAlarm:[AWSCloudWatchPutMetricAlarmInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudWatch removeCloudWatchForKey:key];
}

- (void)testPutMetricData {
    NSString *key = @"testPutMetricData";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudWatch registerCloudWatchWithConfiguration:configuration forKey:key];

    AWSCloudWatch *awsClient = [AWSCloudWatch CloudWatchForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCloudWatch CloudWatchForKey:key] putMetricData:[AWSCloudWatchPutMetricDataInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudWatch removeCloudWatchForKey:key];
}

- (void)testSetAlarmState {
    NSString *key = @"testSetAlarmState";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudWatch registerCloudWatchWithConfiguration:configuration forKey:key];

    AWSCloudWatch *awsClient = [AWSCloudWatch CloudWatchForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCloudWatch CloudWatchForKey:key] setAlarmState:[AWSCloudWatchSetAlarmStateInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudWatch removeCloudWatchForKey:key];
}

@end
