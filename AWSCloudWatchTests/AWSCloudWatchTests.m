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
#import "AWSCloudWatch.h"
#import "AWSTestUtility.h"

@interface AWSCloudWatchTests : XCTestCase

@end

@implementation AWSCloudWatchTests

+ (void)setUp {
    [super setUp];
    [AWSTestUtility setupCognitoCredentialsProvider];
}

- (void)setUp {
    [super setUp];
    // Put setup code here; it will be run once, before the first test case.
}

- (void)tearDown {
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
}

//CloudWatch Test
- (void)testClockSkewCW {
    [AWSTestUtility setupSwizzling];

    XCTAssertFalse([NSDate aws_getRuntimeClockSkew], @"current RunTimeClockSkew is not zero!");
    [AWSTestUtility setMockDate:[NSDate dateWithTimeIntervalSince1970:3600]];

    AWSCloudWatch *cloudWatch = [AWSCloudWatch defaultCloudWatch];
    XCTAssertNotNil(cloudWatch);

    [[[cloudWatch listMetrics:[AWSCloudWatchListMetricsInput new]] continueWithBlock:^id(AWSTask *task) {
        if (task.error) {
            XCTFail(@"Error: [%@]", task.error);
        }

        if (task.result) {
            XCTAssertTrue([task.result isKindOfClass:[AWSCloudWatchListMetricsOutput class]]);
            AWSCloudWatchListMetricsOutput *listMetricsOutput = task.result;
            XCTAssertNotNil(listMetricsOutput.metrics);
        }

        return nil;
    }] waitUntilFinished];

    [AWSTestUtility revertSwizzling];
}

- (void)testListMetrics {
    AWSCloudWatch *cloudWatch = [AWSCloudWatch defaultCloudWatch];

    [[[cloudWatch listMetrics:[AWSCloudWatchListMetricsInput new]] continueWithBlock:^id(AWSTask *task) {
        if (task.error) {
            XCTFail(@"Error: [%@]", task.error);
        }

        if (task.result) {
            XCTAssertTrue([task.result isKindOfClass:[AWSCloudWatchListMetricsOutput class]]);
            AWSCloudWatchListMetricsOutput *listMetricsOutput = task.result;
            XCTAssertNotNil(listMetricsOutput.metrics);
        }

        return nil;
    }] waitUntilFinished];
}

- (void)testDescribeAlarmHistory {
    AWSCloudWatch *cloudWatch = [AWSCloudWatch defaultCloudWatch];
    
    AWSCloudWatchDescribeAlarmHistoryInput *input = [AWSCloudWatchDescribeAlarmHistoryInput new];
    input.endDate = [NSDate date];
    
    [[[cloudWatch describeAlarmHistory:input] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNil(task.error);
        
        AWSCloudWatchDescribeAlarmHistoryOutput *output = task.result;
        XCTAssertTrue([output isKindOfClass:[AWSCloudWatchDescribeAlarmHistoryOutput class]]);
        NSArray *items = output.alarmHistoryItems;
        XCTAssertTrue([items isKindOfClass:[NSArray class]]);
        
        return nil;
    }] waitUntilFinished];
}

- (void)testGetMetricStatisticsFailed {
    AWSCloudWatch *cloudWatch = [AWSCloudWatch defaultCloudWatch];
    
    AWSCloudWatchGetMetricStatisticsInput *statisticsInput = [AWSCloudWatchGetMetricStatisticsInput new];
    statisticsInput.namespace = @""; //namespace is empty
    
    [[[cloudWatch getMetricStatistics:statisticsInput] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error, @"Expected InvalidParameterCombination error not found.");
        XCTAssertEqual(task.error.code, AWSCloudWatchErrorInvalidParameterCombination);
        XCTAssertTrue([@"InvalidParameterCombination" isEqualToString:task.error.userInfo[@"Code"]]);
        XCTAssertTrue([@"At least one of the parameters Statistics and ExtendedStatistics must be specified." isEqualToString:task.error.userInfo[@"Message"]]);
        return nil;
    }] waitUntilFinished];
    
}

@end
