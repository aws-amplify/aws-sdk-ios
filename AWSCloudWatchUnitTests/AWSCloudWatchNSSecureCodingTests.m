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

#import <XCTest/XCTest.h>
#import <AWSNSSecureCodingTestBase/AWSNSSecureCodingTestBase.h>
#import "AWSCloudWatchModel.h"

@interface AWSCloudWatchNSSecureCodingTests : AWSNSSecureCodingTest

- (void) test_AWSCloudWatchAlarmHistoryItem API_AVAILABLE(ios(11));
- (void) test_AWSCloudWatchDashboardEntry API_AVAILABLE(ios(11));
- (void) test_AWSCloudWatchDashboardValidationMessage API_AVAILABLE(ios(11));
- (void) test_AWSCloudWatchDatapoint API_AVAILABLE(ios(11));
- (void) test_AWSCloudWatchDeleteAlarmsInput API_AVAILABLE(ios(11));
- (void) test_AWSCloudWatchDeleteDashboardsInput API_AVAILABLE(ios(11));
- (void) test_AWSCloudWatchDeleteDashboardsOutput API_AVAILABLE(ios(11));
- (void) test_AWSCloudWatchDescribeAlarmHistoryInput API_AVAILABLE(ios(11));
- (void) test_AWSCloudWatchDescribeAlarmHistoryOutput API_AVAILABLE(ios(11));
- (void) test_AWSCloudWatchDescribeAlarmsForMetricInput API_AVAILABLE(ios(11));
- (void) test_AWSCloudWatchDescribeAlarmsForMetricOutput API_AVAILABLE(ios(11));
- (void) test_AWSCloudWatchDescribeAlarmsInput API_AVAILABLE(ios(11));
- (void) test_AWSCloudWatchDescribeAlarmsOutput API_AVAILABLE(ios(11));
- (void) test_AWSCloudWatchDimension API_AVAILABLE(ios(11));
- (void) test_AWSCloudWatchDimensionFilter API_AVAILABLE(ios(11));
- (void) test_AWSCloudWatchDisableAlarmActionsInput API_AVAILABLE(ios(11));
- (void) test_AWSCloudWatchEnableAlarmActionsInput API_AVAILABLE(ios(11));
- (void) test_AWSCloudWatchGetDashboardInput API_AVAILABLE(ios(11));
- (void) test_AWSCloudWatchGetDashboardOutput API_AVAILABLE(ios(11));
- (void) test_AWSCloudWatchGetMetricDataInput API_AVAILABLE(ios(11));
- (void) test_AWSCloudWatchGetMetricDataOutput API_AVAILABLE(ios(11));
- (void) test_AWSCloudWatchGetMetricStatisticsInput API_AVAILABLE(ios(11));
- (void) test_AWSCloudWatchGetMetricStatisticsOutput API_AVAILABLE(ios(11));
- (void) test_AWSCloudWatchGetMetricWidgetImageInput API_AVAILABLE(ios(11));
- (void) test_AWSCloudWatchGetMetricWidgetImageOutput API_AVAILABLE(ios(11));
- (void) test_AWSCloudWatchListDashboardsInput API_AVAILABLE(ios(11));
- (void) test_AWSCloudWatchListDashboardsOutput API_AVAILABLE(ios(11));
- (void) test_AWSCloudWatchListMetricsInput API_AVAILABLE(ios(11));
- (void) test_AWSCloudWatchListMetricsOutput API_AVAILABLE(ios(11));
- (void) test_AWSCloudWatchMessageData API_AVAILABLE(ios(11));
- (void) test_AWSCloudWatchMetric API_AVAILABLE(ios(11));
- (void) test_AWSCloudWatchMetricAlarm API_AVAILABLE(ios(11));
- (void) test_AWSCloudWatchMetricDataQuery API_AVAILABLE(ios(11));
- (void) test_AWSCloudWatchMetricDataResult API_AVAILABLE(ios(11));
- (void) test_AWSCloudWatchMetricDatum API_AVAILABLE(ios(11));
- (void) test_AWSCloudWatchMetricStat API_AVAILABLE(ios(11));
- (void) test_AWSCloudWatchPutDashboardInput API_AVAILABLE(ios(11));
- (void) test_AWSCloudWatchPutDashboardOutput API_AVAILABLE(ios(11));
- (void) test_AWSCloudWatchPutMetricAlarmInput API_AVAILABLE(ios(11));
- (void) test_AWSCloudWatchPutMetricDataInput API_AVAILABLE(ios(11));
- (void) test_AWSCloudWatchSetAlarmStateInput API_AVAILABLE(ios(11));
- (void) test_AWSCloudWatchStatisticSet API_AVAILABLE(ios(11));

@end

@implementation AWSCloudWatchNSSecureCodingTests

- (void) test_AWSCloudWatchAlarmHistoryItem {
    [self validateSecureCodingForClass:[AWSCloudWatchAlarmHistoryItem class]];
}

- (void) test_AWSCloudWatchDashboardEntry {
    [self validateSecureCodingForClass:[AWSCloudWatchDashboardEntry class]];
}

- (void) test_AWSCloudWatchDashboardValidationMessage {
    [self validateSecureCodingForClass:[AWSCloudWatchDashboardValidationMessage class]];
}

- (void) test_AWSCloudWatchDatapoint {
    [self validateSecureCodingForClass:[AWSCloudWatchDatapoint class]];
}

- (void) test_AWSCloudWatchDeleteAlarmsInput {
    [self validateSecureCodingForClass:[AWSCloudWatchDeleteAlarmsInput class]];
}

- (void) test_AWSCloudWatchDeleteDashboardsInput {
    [self validateSecureCodingForClass:[AWSCloudWatchDeleteDashboardsInput class]];
}

- (void) test_AWSCloudWatchDeleteDashboardsOutput {
    [self validateSecureCodingForClass:[AWSCloudWatchDeleteDashboardsOutput class]];
}

- (void) test_AWSCloudWatchDescribeAlarmHistoryInput {
    [self validateSecureCodingForClass:[AWSCloudWatchDescribeAlarmHistoryInput class]];
}

- (void) test_AWSCloudWatchDescribeAlarmHistoryOutput {
    [self validateSecureCodingForClass:[AWSCloudWatchDescribeAlarmHistoryOutput class]];
}

- (void) test_AWSCloudWatchDescribeAlarmsForMetricInput {
    [self validateSecureCodingForClass:[AWSCloudWatchDescribeAlarmsForMetricInput class]];
}

- (void) test_AWSCloudWatchDescribeAlarmsForMetricOutput {
    [self validateSecureCodingForClass:[AWSCloudWatchDescribeAlarmsForMetricOutput class]];
}

- (void) test_AWSCloudWatchDescribeAlarmsInput {
    [self validateSecureCodingForClass:[AWSCloudWatchDescribeAlarmsInput class]];
}

- (void) test_AWSCloudWatchDescribeAlarmsOutput {
    [self validateSecureCodingForClass:[AWSCloudWatchDescribeAlarmsOutput class]];
}

- (void) test_AWSCloudWatchDimension {
    [self validateSecureCodingForClass:[AWSCloudWatchDimension class]];
}

- (void) test_AWSCloudWatchDimensionFilter {
    [self validateSecureCodingForClass:[AWSCloudWatchDimensionFilter class]];
}

- (void) test_AWSCloudWatchDisableAlarmActionsInput {
    [self validateSecureCodingForClass:[AWSCloudWatchDisableAlarmActionsInput class]];
}

- (void) test_AWSCloudWatchEnableAlarmActionsInput {
    [self validateSecureCodingForClass:[AWSCloudWatchEnableAlarmActionsInput class]];
}

- (void) test_AWSCloudWatchGetDashboardInput {
    [self validateSecureCodingForClass:[AWSCloudWatchGetDashboardInput class]];
}

- (void) test_AWSCloudWatchGetDashboardOutput {
    [self validateSecureCodingForClass:[AWSCloudWatchGetDashboardOutput class]];
}

- (void) test_AWSCloudWatchGetMetricDataInput {
    [self validateSecureCodingForClass:[AWSCloudWatchGetMetricDataInput class]];
}

- (void) test_AWSCloudWatchGetMetricDataOutput {
    [self validateSecureCodingForClass:[AWSCloudWatchGetMetricDataOutput class]];
}

- (void) test_AWSCloudWatchGetMetricStatisticsInput {
    [self validateSecureCodingForClass:[AWSCloudWatchGetMetricStatisticsInput class]];
}

- (void) test_AWSCloudWatchGetMetricStatisticsOutput {
    [self validateSecureCodingForClass:[AWSCloudWatchGetMetricStatisticsOutput class]];
}

- (void) test_AWSCloudWatchGetMetricWidgetImageInput {
    [self validateSecureCodingForClass:[AWSCloudWatchGetMetricWidgetImageInput class]];
}

- (void) test_AWSCloudWatchGetMetricWidgetImageOutput {
    [self validateSecureCodingForClass:[AWSCloudWatchGetMetricWidgetImageOutput class]];
}

- (void) test_AWSCloudWatchListDashboardsInput {
    [self validateSecureCodingForClass:[AWSCloudWatchListDashboardsInput class]];
}

- (void) test_AWSCloudWatchListDashboardsOutput {
    [self validateSecureCodingForClass:[AWSCloudWatchListDashboardsOutput class]];
}

- (void) test_AWSCloudWatchListMetricsInput {
    [self validateSecureCodingForClass:[AWSCloudWatchListMetricsInput class]];
}

- (void) test_AWSCloudWatchListMetricsOutput {
    [self validateSecureCodingForClass:[AWSCloudWatchListMetricsOutput class]];
}

- (void) test_AWSCloudWatchMessageData {
    [self validateSecureCodingForClass:[AWSCloudWatchMessageData class]];
}

- (void) test_AWSCloudWatchMetric {
    [self validateSecureCodingForClass:[AWSCloudWatchMetric class]];
}

- (void) test_AWSCloudWatchMetricAlarm {
    [self validateSecureCodingForClass:[AWSCloudWatchMetricAlarm class]];
}

- (void) test_AWSCloudWatchMetricDataQuery {
    [self validateSecureCodingForClass:[AWSCloudWatchMetricDataQuery class]];
}

- (void) test_AWSCloudWatchMetricDataResult {
    [self validateSecureCodingForClass:[AWSCloudWatchMetricDataResult class]];
}

- (void) test_AWSCloudWatchMetricDatum {
    [self validateSecureCodingForClass:[AWSCloudWatchMetricDatum class]];
}

- (void) test_AWSCloudWatchMetricStat {
    [self validateSecureCodingForClass:[AWSCloudWatchMetricStat class]];
}

- (void) test_AWSCloudWatchPutDashboardInput {
    [self validateSecureCodingForClass:[AWSCloudWatchPutDashboardInput class]];
}

- (void) test_AWSCloudWatchPutDashboardOutput {
    [self validateSecureCodingForClass:[AWSCloudWatchPutDashboardOutput class]];
}

- (void) test_AWSCloudWatchPutMetricAlarmInput {
    [self validateSecureCodingForClass:[AWSCloudWatchPutMetricAlarmInput class]];
}

- (void) test_AWSCloudWatchPutMetricDataInput {
    [self validateSecureCodingForClass:[AWSCloudWatchPutMetricDataInput class]];
}

- (void) test_AWSCloudWatchSetAlarmStateInput {
    [self validateSecureCodingForClass:[AWSCloudWatchSetAlarmStateInput class]];
}

- (void) test_AWSCloudWatchStatisticSet {
    [self validateSecureCodingForClass:[AWSCloudWatchStatisticSet class]];
}


@end
