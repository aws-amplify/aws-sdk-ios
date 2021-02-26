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

#import <Foundation/Foundation.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSModel.h>

NS_ASSUME_NONNULL_BEGIN

FOUNDATION_EXPORT NSString *const AWSCloudWatchErrorDomain;

typedef NS_ENUM(NSInteger, AWSCloudWatchErrorType) {
    AWSCloudWatchErrorUnknown,
    AWSCloudWatchErrorDashboardInvalidInput,
    AWSCloudWatchErrorDashboardNotFound,
    AWSCloudWatchErrorInternalService,
    AWSCloudWatchErrorInvalidFormat,
    AWSCloudWatchErrorInvalidNextToken,
    AWSCloudWatchErrorInvalidParameterCombination,
    AWSCloudWatchErrorInvalidParameterValue,
    AWSCloudWatchErrorLimitExceeded,
    AWSCloudWatchErrorMissingRequiredParameter,
    AWSCloudWatchErrorResourceNotFound,
};

typedef NS_ENUM(NSInteger, AWSCloudWatchComparisonOperator) {
    AWSCloudWatchComparisonOperatorUnknown,
    AWSCloudWatchComparisonOperatorGreaterThanOrEqualToThreshold,
    AWSCloudWatchComparisonOperatorGreaterThanThreshold,
    AWSCloudWatchComparisonOperatorLessThanThreshold,
    AWSCloudWatchComparisonOperatorLessThanOrEqualToThreshold,
};

typedef NS_ENUM(NSInteger, AWSCloudWatchHistoryItemType) {
    AWSCloudWatchHistoryItemTypeUnknown,
    AWSCloudWatchHistoryItemTypeConfigurationUpdate,
    AWSCloudWatchHistoryItemTypeStateUpdate,
    AWSCloudWatchHistoryItemTypeAction,
};

typedef NS_ENUM(NSInteger, AWSCloudWatchScanBy) {
    AWSCloudWatchScanByUnknown,
    AWSCloudWatchScanByTimestampDescending,
    AWSCloudWatchScanByTimestampAscending,
};

typedef NS_ENUM(NSInteger, AWSCloudWatchStandardUnit) {
    AWSCloudWatchStandardUnitUnknown,
    AWSCloudWatchStandardUnitSeconds,
    AWSCloudWatchStandardUnitMicroseconds,
    AWSCloudWatchStandardUnitMilliseconds,
    AWSCloudWatchStandardUnitBytes,
    AWSCloudWatchStandardUnitKilobytes,
    AWSCloudWatchStandardUnitMegabytes,
    AWSCloudWatchStandardUnitGigabytes,
    AWSCloudWatchStandardUnitTerabytes,
    AWSCloudWatchStandardUnitBits,
    AWSCloudWatchStandardUnitKilobits,
    AWSCloudWatchStandardUnitMegabits,
    AWSCloudWatchStandardUnitGigabits,
    AWSCloudWatchStandardUnitTerabits,
    AWSCloudWatchStandardUnitPercent,
    AWSCloudWatchStandardUnitCount,
    AWSCloudWatchStandardUnitBytesSecond,
    AWSCloudWatchStandardUnitKilobytesSecond,
    AWSCloudWatchStandardUnitMegabytesSecond,
    AWSCloudWatchStandardUnitGigabytesSecond,
    AWSCloudWatchStandardUnitTerabytesSecond,
    AWSCloudWatchStandardUnitBitsSecond,
    AWSCloudWatchStandardUnitKilobitsSecond,
    AWSCloudWatchStandardUnitMegabitsSecond,
    AWSCloudWatchStandardUnitGigabitsSecond,
    AWSCloudWatchStandardUnitTerabitsSecond,
    AWSCloudWatchStandardUnitCountSecond,
    AWSCloudWatchStandardUnitNone,
};

typedef NS_ENUM(NSInteger, AWSCloudWatchStateValue) {
    AWSCloudWatchStateValueUnknown,
    AWSCloudWatchStateValueOK,
    AWSCloudWatchStateValueAlarm,
    AWSCloudWatchStateValueInsufficientData,
};

typedef NS_ENUM(NSInteger, AWSCloudWatchStatistic) {
    AWSCloudWatchStatisticUnknown,
    AWSCloudWatchStatisticSampleCount,
    AWSCloudWatchStatisticAverage,
    AWSCloudWatchStatisticSum,
    AWSCloudWatchStatisticMinimum,
    AWSCloudWatchStatisticMaximum,
};

typedef NS_ENUM(NSInteger, AWSCloudWatchStatusCode) {
    AWSCloudWatchStatusCodeUnknown,
    AWSCloudWatchStatusCodeComplete,
    AWSCloudWatchStatusCodeInternalError,
    AWSCloudWatchStatusCodePartialData,
};

@class AWSCloudWatchAlarmHistoryItem;
@class AWSCloudWatchDashboardEntry;
@class AWSCloudWatchDashboardValidationMessage;
@class AWSCloudWatchDatapoint;
@class AWSCloudWatchDeleteAlarmsInput;
@class AWSCloudWatchDeleteDashboardsInput;
@class AWSCloudWatchDeleteDashboardsOutput;
@class AWSCloudWatchDescribeAlarmHistoryInput;
@class AWSCloudWatchDescribeAlarmHistoryOutput;
@class AWSCloudWatchDescribeAlarmsForMetricInput;
@class AWSCloudWatchDescribeAlarmsForMetricOutput;
@class AWSCloudWatchDescribeAlarmsInput;
@class AWSCloudWatchDescribeAlarmsOutput;
@class AWSCloudWatchDimension;
@class AWSCloudWatchDimensionFilter;
@class AWSCloudWatchDisableAlarmActionsInput;
@class AWSCloudWatchEnableAlarmActionsInput;
@class AWSCloudWatchGetDashboardInput;
@class AWSCloudWatchGetDashboardOutput;
@class AWSCloudWatchGetMetricDataInput;
@class AWSCloudWatchGetMetricDataOutput;
@class AWSCloudWatchGetMetricStatisticsInput;
@class AWSCloudWatchGetMetricStatisticsOutput;
@class AWSCloudWatchGetMetricWidgetImageInput;
@class AWSCloudWatchGetMetricWidgetImageOutput;
@class AWSCloudWatchListDashboardsInput;
@class AWSCloudWatchListDashboardsOutput;
@class AWSCloudWatchListMetricsInput;
@class AWSCloudWatchListMetricsOutput;
@class AWSCloudWatchMessageData;
@class AWSCloudWatchMetric;
@class AWSCloudWatchMetricAlarm;
@class AWSCloudWatchMetricDataQuery;
@class AWSCloudWatchMetricDataResult;
@class AWSCloudWatchMetricDatum;
@class AWSCloudWatchMetricStat;
@class AWSCloudWatchPutDashboardInput;
@class AWSCloudWatchPutDashboardOutput;
@class AWSCloudWatchPutMetricAlarmInput;
@class AWSCloudWatchPutMetricDataInput;
@class AWSCloudWatchSetAlarmStateInput;
@class AWSCloudWatchStatisticSet;

/**
 <p>Represents the history of a specific alarm.</p>
 */
@interface AWSCloudWatchAlarmHistoryItem : AWSModel


/**
 <p>The descriptive name for the alarm.</p>
 */
@property (nonatomic, strong) NSString * _Nullable alarmName;

/**
 <p>Data about the alarm, in JSON format.</p>
 */
@property (nonatomic, strong) NSString * _Nullable historyData;

/**
 <p>The type of alarm history item.</p>
 */
@property (nonatomic, assign) AWSCloudWatchHistoryItemType historyItemType;

/**
 <p>A summary of the alarm history, in text format.</p>
 */
@property (nonatomic, strong) NSString * _Nullable historySummary;

/**
 <p>The time stamp for the alarm history item.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable timestamp;

@end

/**
 <p>Represents a specific dashboard.</p>
 */
@interface AWSCloudWatchDashboardEntry : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the dashboard.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dashboardArn;

/**
 <p>The name of the dashboard.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dashboardName;

/**
 <p>The time stamp of when the dashboard was last modified, either by an API call or through the console. This number is expressed as the number of milliseconds since Jan 1, 1970 00:00:00 UTC.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModified;

/**
 <p>The size of the dashboard, in bytes.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable size;

@end

/**
 <p>An error or warning for the operation.</p>
 */
@interface AWSCloudWatchDashboardValidationMessage : AWSModel


/**
 <p>The data path related to the message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataPath;

/**
 <p>A message describing the error or warning.</p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

@end

/**
 <p>Encapsulates the statistical data that CloudWatch computes from metric data.</p>
 */
@interface AWSCloudWatchDatapoint : AWSModel


/**
 <p>The average of the metric values that correspond to the data point.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable average;

/**
 <p>The percentile statistic for the data point.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSNumber *> * _Nullable extendedStatistics;

/**
 <p>The maximum metric value for the data point.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maximum;

/**
 <p>The minimum metric value for the data point.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable minimum;

/**
 <p>The number of metric values that contributed to the aggregate value of this data point.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable sampleCount;

/**
 <p>The sum of the metric values for the data point.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable sum;

/**
 <p>The time stamp used for the data point.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable timestamp;

/**
 <p>The standard unit for the data point.</p>
 */
@property (nonatomic, assign) AWSCloudWatchStandardUnit unit;

@end

/**
 
 */
@interface AWSCloudWatchDeleteAlarmsInput : AWSRequest


/**
 <p>The alarms to be deleted.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable alarmNames;

@end

/**
 
 */
@interface AWSCloudWatchDeleteDashboardsInput : AWSRequest


/**
 <p>The dashboards to be deleted. This parameter is required.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable dashboardNames;

@end

/**
 
 */
@interface AWSCloudWatchDeleteDashboardsOutput : AWSModel


@end

/**
 
 */
@interface AWSCloudWatchDescribeAlarmHistoryInput : AWSRequest


/**
 <p>The name of the alarm.</p>
 */
@property (nonatomic, strong) NSString * _Nullable alarmName;

/**
 <p>The ending date to retrieve alarm history.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable endDate;

/**
 <p>The type of alarm histories to retrieve.</p>
 */
@property (nonatomic, assign) AWSCloudWatchHistoryItemType historyItemType;

/**
 <p>The maximum number of alarm history records to retrieve.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxRecords;

/**
 <p>The token returned by a previous call to indicate that there is more data available.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The starting date to retrieve alarm history.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable startDate;

@end

/**
 
 */
@interface AWSCloudWatchDescribeAlarmHistoryOutput : AWSModel


/**
 <p>The alarm histories, in JSON format.</p>
 */
@property (nonatomic, strong) NSArray<AWSCloudWatchAlarmHistoryItem *> * _Nullable alarmHistoryItems;

/**
 <p>The token that marks the start of the next batch of returned results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSCloudWatchDescribeAlarmsForMetricInput : AWSRequest


/**
 <p>The dimensions associated with the metric. If the metric has any associated dimensions, you must specify them in order for the call to succeed.</p>
 */
@property (nonatomic, strong) NSArray<AWSCloudWatchDimension *> * _Nullable dimensions;

/**
 <p>The percentile statistic for the metric. Specify a value between p0.0 and p100.</p>
 */
@property (nonatomic, strong) NSString * _Nullable extendedStatistic;

/**
 <p>The name of the metric.</p>
 */
@property (nonatomic, strong) NSString * _Nullable metricName;

/**
 <p>The namespace of the metric.</p>
 */
@property (nonatomic, strong) NSString * _Nullable namespace;

/**
 <p>The period, in seconds, over which the statistic is applied.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable period;

/**
 <p>The statistic for the metric, other than percentiles. For percentile statistics, use <code>ExtendedStatistics</code>.</p>
 */
@property (nonatomic, assign) AWSCloudWatchStatistic statistic;

/**
 <p>The unit for the metric.</p>
 */
@property (nonatomic, assign) AWSCloudWatchStandardUnit unit;

@end

/**
 
 */
@interface AWSCloudWatchDescribeAlarmsForMetricOutput : AWSModel


/**
 <p>The information for each alarm with the specified metric.</p>
 */
@property (nonatomic, strong) NSArray<AWSCloudWatchMetricAlarm *> * _Nullable metricAlarms;

@end

/**
 
 */
@interface AWSCloudWatchDescribeAlarmsInput : AWSRequest


/**
 <p>The action name prefix.</p>
 */
@property (nonatomic, strong) NSString * _Nullable actionPrefix;

/**
 <p>The alarm name prefix. If this parameter is specified, you cannot specify <code>AlarmNames</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable alarmNamePrefix;

/**
 <p>The names of the alarms.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable alarmNames;

/**
 <p>The maximum number of alarm descriptions to retrieve.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxRecords;

/**
 <p>The token returned by a previous call to indicate that there is more data available.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The state value to be used in matching alarms.</p>
 */
@property (nonatomic, assign) AWSCloudWatchStateValue stateValue;

@end

/**
 
 */
@interface AWSCloudWatchDescribeAlarmsOutput : AWSModel


/**
 <p>The information for the specified alarms.</p>
 */
@property (nonatomic, strong) NSArray<AWSCloudWatchMetricAlarm *> * _Nullable metricAlarms;

/**
 <p>The token that marks the start of the next batch of returned results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>Expands the identity of a metric.</p>
 Required parameters: [Name, Value]
 */
@interface AWSCloudWatchDimension : AWSModel


/**
 <p>The name of the dimension.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The value representing the dimension measurement.</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 <p>Represents filters for a dimension.</p>
 Required parameters: [Name]
 */
@interface AWSCloudWatchDimensionFilter : AWSModel


/**
 <p>The dimension name to be matched.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The value of the dimension to be matched.</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 
 */
@interface AWSCloudWatchDisableAlarmActionsInput : AWSRequest


/**
 <p>The names of the alarms.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable alarmNames;

@end

/**
 
 */
@interface AWSCloudWatchEnableAlarmActionsInput : AWSRequest


/**
 <p>The names of the alarms.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable alarmNames;

@end

/**
 
 */
@interface AWSCloudWatchGetDashboardInput : AWSRequest


/**
 <p>The name of the dashboard to be described.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dashboardName;

@end

/**
 
 */
@interface AWSCloudWatchGetDashboardOutput : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the dashboard.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dashboardArn;

/**
 <p>The detailed information about the dashboard, including what widgets are included and their location on the dashboard. For more information about the <code>DashboardBody</code> syntax, see <a>CloudWatch-Dashboard-Body-Structure</a>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable dashboardBody;

/**
 <p>The name of the dashboard.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dashboardName;

@end

/**
 
 */
@interface AWSCloudWatchGetMetricDataInput : AWSRequest


/**
 <p>The time stamp indicating the latest data to be returned.</p><p>For better performance, specify <code>StartTime</code> and <code>EndTime</code> values that align with the value of the metric's <code>Period</code> and sync up with the beginning and end of an hour. For example, if the <code>Period</code> of a metric is 5 minutes, specifying 12:05 or 12:30 as <code>EndTime</code> can get a faster response from CloudWatch then setting 12:07 or 12:29 as the <code>EndTime</code>.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable endTime;

/**
 <p>The maximum number of data points the request should return before paginating. If you omit this, the default of 100,800 is used.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxDatapoints;

/**
 <p>The metric queries to be returned. A single <code>GetMetricData</code> call can include as many as 100 <code>MetricDataQuery</code> structures. Each of these structures can specify either a metric to retrieve, or a math expression to perform on retrieved data. </p>
 */
@property (nonatomic, strong) NSArray<AWSCloudWatchMetricDataQuery *> * _Nullable metricDataQueries;

/**
 <p>Include this value, if it was returned by the previous call, to get the next set of data points.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The order in which data points should be returned. <code>TimestampDescending</code> returns the newest data first and paginates when the <code>MaxDatapoints</code> limit is reached. <code>TimestampAscending</code> returns the oldest data first and paginates when the <code>MaxDatapoints</code> limit is reached.</p>
 */
@property (nonatomic, assign) AWSCloudWatchScanBy scanBy;

/**
 <p>The time stamp indicating the earliest data to be returned.</p><p>For better performance, specify <code>StartTime</code> and <code>EndTime</code> values that align with the value of the metric's <code>Period</code> and sync up with the beginning and end of an hour. For example, if the <code>Period</code> of a metric is 5 minutes, specifying 12:05 or 12:30 as <code>StartTime</code> can get a faster response from CloudWatch then setting 12:07 or 12:29 as the <code>StartTime</code>.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable startTime;

@end

/**
 
 */
@interface AWSCloudWatchGetMetricDataOutput : AWSModel


/**
 <p>The metrics that are returned, including the metric name, namespace, and dimensions.</p>
 */
@property (nonatomic, strong) NSArray<AWSCloudWatchMetricDataResult *> * _Nullable metricDataResults;

/**
 <p>A token that marks the next batch of returned results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSCloudWatchGetMetricStatisticsInput : AWSRequest


/**
 <p>The dimensions. If the metric contains multiple dimensions, you must include a value for each dimension. CloudWatch treats each unique combination of dimensions as a separate metric. If a specific combination of dimensions was not published, you can't retrieve statistics for it. You must specify the same dimensions that were used when the metrics were created. For an example, see <a href="http://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/cloudwatch_concepts.html#dimension-combinations">Dimension Combinations</a> in the <i>Amazon CloudWatch User Guide</i>. For more information about specifying dimensions, see <a href="http://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/publishingMetrics.html">Publishing Metrics</a> in the <i>Amazon CloudWatch User Guide</i>.</p>
 */
@property (nonatomic, strong) NSArray<AWSCloudWatchDimension *> * _Nullable dimensions;

/**
 <p>The time stamp that determines the last data point to return.</p><p>The value specified is exclusive; results include data points up to the specified time stamp. The time stamp must be in ISO 8601 UTC format (for example, 2016-10-10T23:00:00Z).</p>
 */
@property (nonatomic, strong) NSDate * _Nullable endTime;

/**
 <p>The percentile statistics. Specify values between p0.0 and p100. When calling <code>GetMetricStatistics</code>, you must specify either <code>Statistics</code> or <code>ExtendedStatistics</code>, but not both. Percentile statistics are not available for metrics when any of the metric values are negative numbers.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable extendedStatistics;

/**
 <p>The name of the metric, with or without spaces.</p>
 */
@property (nonatomic, strong) NSString * _Nullable metricName;

/**
 <p>The namespace of the metric, with or without spaces.</p>
 */
@property (nonatomic, strong) NSString * _Nullable namespace;

/**
 <p>The granularity, in seconds, of the returned data points. For metrics with regular resolution, a period can be as short as one minute (60 seconds) and must be a multiple of 60. For high-resolution metrics that are collected at intervals of less than one minute, the period can be 1, 5, 10, 30, 60, or any multiple of 60. High-resolution metrics are those metrics stored by a <code>PutMetricData</code> call that includes a <code>StorageResolution</code> of 1 second.</p><p>If the <code>StartTime</code> parameter specifies a time stamp that is greater than 3 hours ago, you must specify the period as follows or no data points in that time range is returned:</p><ul><li><p>Start time between 3 hours and 15 days ago - Use a multiple of 60 seconds (1 minute).</p></li><li><p>Start time between 15 and 63 days ago - Use a multiple of 300 seconds (5 minutes).</p></li><li><p>Start time greater than 63 days ago - Use a multiple of 3600 seconds (1 hour).</p></li></ul>
 */
@property (nonatomic, strong) NSNumber * _Nullable period;

/**
 <p>The time stamp that determines the first data point to return. Start times are evaluated relative to the time that CloudWatch receives the request.</p><p>The value specified is inclusive; results include data points with the specified time stamp. The time stamp must be in ISO 8601 UTC format (for example, 2016-10-03T23:00:00Z).</p><p>CloudWatch rounds the specified time stamp as follows:</p><ul><li><p>Start time less than 15 days ago - Round down to the nearest whole minute. For example, 12:32:34 is rounded down to 12:32:00.</p></li><li><p>Start time between 15 and 63 days ago - Round down to the nearest 5-minute clock interval. For example, 12:32:34 is rounded down to 12:30:00.</p></li><li><p>Start time greater than 63 days ago - Round down to the nearest 1-hour clock interval. For example, 12:32:34 is rounded down to 12:00:00.</p></li></ul><p>If you set <code>Period</code> to 5, 10, or 30, the start time of your request is rounded down to the nearest time that corresponds to even 5-, 10-, or 30-second divisions of a minute. For example, if you make a query at (HH:mm:ss) 01:05:23 for the previous 10-second period, the start time of your request is rounded down and you receive data from 01:05:10 to 01:05:20. If you make a query at 15:07:17 for the previous 5 minutes of data, using a period of 5 seconds, you receive data timestamped between 15:02:15 and 15:07:15. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable startTime;

/**
 <p>The metric statistics, other than percentile. For percentile statistics, use <code>ExtendedStatistics</code>. When calling <code>GetMetricStatistics</code>, you must specify either <code>Statistics</code> or <code>ExtendedStatistics</code>, but not both.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable statistics;

/**
 <p>The unit for a given metric. Metrics may be reported in multiple units. Not supplying a unit results in all units being returned. If you specify only a unit that the metric does not report, the results of the call are null.</p>
 */
@property (nonatomic, assign) AWSCloudWatchStandardUnit unit;

@end

/**
 
 */
@interface AWSCloudWatchGetMetricStatisticsOutput : AWSModel


/**
 <p>The data points for the specified metric.</p>
 */
@property (nonatomic, strong) NSArray<AWSCloudWatchDatapoint *> * _Nullable datapoints;

/**
 <p>A label for the specified metric.</p>
 */
@property (nonatomic, strong) NSString * _Nullable label;

@end

/**
 
 */
@interface AWSCloudWatchGetMetricWidgetImageInput : AWSRequest


/**
 <p>A JSON string that defines the bitmap graph to be retrieved. The string includes the metrics to include in the graph, statistics, annotations, title, axis limits, and so on. You can include only one <code>MetricWidget</code> parameter in each <code>GetMetricWidgetImage</code> call.</p><p>For more information about the syntax of <code>MetricWidget</code> see <a>CloudWatch-Metric-Widget-Structure</a>.</p><p>If any metric on the graph could not load all the requested data points, an orange triangle with an exclamation point appears next to the graph legend.</p>
 */
@property (nonatomic, strong) NSString * _Nullable metricWidget;

/**
 <p>The format of the resulting image. Only PNG images are supported.</p><p>The default is <code>png</code>. If you specify <code>png</code>, the API returns an HTTP response with the content-type set to <code>text/xml</code>. The image data is in a <code>MetricWidgetImage</code> field. For example:</p><p><code> &lt;GetMetricWidgetImageResponse xmlns="http://monitoring.amazonaws.com/doc/2010-08-01/"&gt;</code></p><p><code> &lt;GetMetricWidgetImageResult&gt;</code></p><p><code> &lt;MetricWidgetImage&gt;</code></p><p><code> iVBORw0KGgoAAAANSUhEUgAAAlgAAAGQEAYAAAAip...</code></p><p><code> &lt;/MetricWidgetImage&gt;</code></p><p><code> &lt;/GetMetricWidgetImageResult&gt;</code></p><p><code> &lt;ResponseMetadata&gt;</code></p><p><code> &lt;RequestId&gt;6f0d4192-4d42-11e8-82c1-f539a07e0e3b&lt;/RequestId&gt;</code></p><p><code> &lt;/ResponseMetadata&gt;</code></p><p><code>&lt;/GetMetricWidgetImageResponse&gt;</code></p><p>The <code>image/png</code> setting is intended only for custom HTTP requests. For most use cases, and all actions using an AWS SDK, you should use <code>png</code>. If you specify <code>image/png</code>, the HTTP response has a content-type set to <code>image/png</code>, and the body of the response is a PNG image. </p>
 */
@property (nonatomic, strong) NSString * _Nullable outputFormat;

@end

/**
 
 */
@interface AWSCloudWatchGetMetricWidgetImageOutput : AWSModel


/**
 <p>The image of the graph, in the output format specified.</p>
 */
@property (nonatomic, strong) NSData * _Nullable metricWidgetImage;

@end

/**
 
 */
@interface AWSCloudWatchListDashboardsInput : AWSRequest


/**
 <p>If you specify this parameter, only the dashboards with names starting with the specified string are listed. The maximum length is 255, and valid characters are A-Z, a-z, 0-9, ".", "-", and "_". </p>
 */
@property (nonatomic, strong) NSString * _Nullable dashboardNamePrefix;

/**
 <p>The token returned by a previous call to indicate that there is more data available.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSCloudWatchListDashboardsOutput : AWSModel


/**
 <p>The list of matching dashboards.</p>
 */
@property (nonatomic, strong) NSArray<AWSCloudWatchDashboardEntry *> * _Nullable dashboardEntries;

/**
 <p>The token that marks the start of the next batch of returned results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSCloudWatchListMetricsInput : AWSRequest


/**
 <p>The dimensions to filter against.</p>
 */
@property (nonatomic, strong) NSArray<AWSCloudWatchDimensionFilter *> * _Nullable dimensions;

/**
 <p>The name of the metric to filter against.</p>
 */
@property (nonatomic, strong) NSString * _Nullable metricName;

/**
 <p>The namespace to filter against.</p>
 */
@property (nonatomic, strong) NSString * _Nullable namespace;

/**
 <p>The token returned by a previous call to indicate that there is more data available.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSCloudWatchListMetricsOutput : AWSModel


/**
 <p>The metrics.</p>
 */
@property (nonatomic, strong) NSArray<AWSCloudWatchMetric *> * _Nullable metrics;

/**
 <p>The token that marks the start of the next batch of returned results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>A message returned by the <code>GetMetricData</code>API, including a code and a description.</p>
 */
@interface AWSCloudWatchMessageData : AWSModel


/**
 <p>The error code or status code associated with the message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable code;

/**
 <p>The message text.</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 <p>Represents a specific metric.</p>
 */
@interface AWSCloudWatchMetric : AWSModel


/**
 <p>The dimensions for the metric.</p>
 */
@property (nonatomic, strong) NSArray<AWSCloudWatchDimension *> * _Nullable dimensions;

/**
 <p>The name of the metric. This is a required field.</p>
 */
@property (nonatomic, strong) NSString * _Nullable metricName;

/**
 <p>The namespace of the metric.</p>
 */
@property (nonatomic, strong) NSString * _Nullable namespace;

@end

/**
 <p>Represents an alarm.</p>
 */
@interface AWSCloudWatchMetricAlarm : AWSModel


/**
 <p>Indicates whether actions should be executed during any changes to the alarm state.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable actionsEnabled;

/**
 <p>The actions to execute when this alarm transitions to the <code>ALARM</code> state from any other state. Each action is specified as an Amazon Resource Name (ARN).</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable alarmActions;

/**
 <p>The Amazon Resource Name (ARN) of the alarm.</p>
 */
@property (nonatomic, strong) NSString * _Nullable alarmArn;

/**
 <p>The time stamp of the last update to the alarm configuration.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable alarmConfigurationUpdatedTimestamp;

/**
 <p>The description of the alarm.</p>
 */
@property (nonatomic, strong) NSString * _Nullable alarmDescription;

/**
 <p>The name of the alarm.</p>
 */
@property (nonatomic, strong) NSString * _Nullable alarmName;

/**
 <p>The arithmetic operation to use when comparing the specified statistic and threshold. The specified statistic value is used as the first operand.</p>
 */
@property (nonatomic, assign) AWSCloudWatchComparisonOperator comparisonOperator;

/**
 <p>The number of datapoints that must be breaching to trigger the alarm.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable datapointsToAlarm;

/**
 <p>The dimensions for the metric associated with the alarm.</p>
 */
@property (nonatomic, strong) NSArray<AWSCloudWatchDimension *> * _Nullable dimensions;

/**
 <p>Used only for alarms based on percentiles. If <code>ignore</code>, the alarm state does not change during periods with too few data points to be statistically significant. If <code>evaluate</code> or this parameter is not used, the alarm is always evaluated and possibly changes state no matter how many data points are available.</p>
 */
@property (nonatomic, strong) NSString * _Nullable evaluateLowSampleCountPercentile;

/**
 <p>The number of periods over which data is compared to the specified threshold.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable evaluationPeriods;

/**
 <p>The percentile statistic for the metric associated with the alarm. Specify a value between p0.0 and p100.</p>
 */
@property (nonatomic, strong) NSString * _Nullable extendedStatistic;

/**
 <p>The actions to execute when this alarm transitions to the <code>INSUFFICIENT_DATA</code> state from any other state. Each action is specified as an Amazon Resource Name (ARN).</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable insufficientDataActions;

/**
 <p>The name of the metric associated with the alarm.</p>
 */
@property (nonatomic, strong) NSString * _Nullable metricName;

/**
 <p/>
 */
@property (nonatomic, strong) NSArray<AWSCloudWatchMetricDataQuery *> * _Nullable metrics;

/**
 <p>The namespace of the metric associated with the alarm.</p>
 */
@property (nonatomic, strong) NSString * _Nullable namespace;

/**
 <p>The actions to execute when this alarm transitions to the <code>OK</code> state from any other state. Each action is specified as an Amazon Resource Name (ARN).</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable OKActions;

/**
 <p>The period, in seconds, over which the statistic is applied.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable period;

/**
 <p>An explanation for the alarm state, in text format.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stateReason;

/**
 <p>An explanation for the alarm state, in JSON format.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stateReasonData;

/**
 <p>The time stamp of the last update to the alarm state.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable stateUpdatedTimestamp;

/**
 <p>The state value for the alarm.</p>
 */
@property (nonatomic, assign) AWSCloudWatchStateValue stateValue;

/**
 <p>The statistic for the metric associated with the alarm, other than percentile. For percentile statistics, use <code>ExtendedStatistic</code>.</p>
 */
@property (nonatomic, assign) AWSCloudWatchStatistic statistic;

/**
 <p>The value to compare with the specified statistic.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable threshold;

/**
 <p>Sets how this alarm is to handle missing data points. If this parameter is omitted, the default behavior of <code>missing</code> is used.</p>
 */
@property (nonatomic, strong) NSString * _Nullable treatMissingData;

/**
 <p>The unit of the metric associated with the alarm.</p>
 */
@property (nonatomic, assign) AWSCloudWatchStandardUnit unit;

@end

/**
 <p>This structure is used in both <code>GetMetricData</code> and <code>PutMetricAlarm</code>. The supported use of this structure is different for those two operations.</p><p>When used in <code>GetMetricData</code>, it indicates the metric data to return, and whether this call is just retrieving a batch set of data for one metric, or is performing a math expression on metric data. A single <code>GetMetricData</code> call can include up to 100 <code>MetricDataQuery</code> structures.</p><p>When used in <code>PutMetricAlarm</code>, it enables you to create an alarm based on a metric math expression. Each <code>MetricDataQuery</code> in the array specifies either a metric to retrieve, or a math expression to be performed on retrieved metrics. A single <code>PutMetricAlarm</code> call can include up to 20 <code>MetricDataQuery</code> structures in the array. The 20 structures can include as many as 10 structures that contain a <code>MetricStat</code> parameter to retrieve a metric, and as many as 10 structures that contain the <code>Expression</code> parameter to perform a math expression. Any expression used in a <code>PutMetricAlarm</code> operation must return a single time series. For more information, see <a href="http://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/using-metric-math.html#metric-math-syntax">Metric Math Syntax and Functions</a> in the <i>Amazon CloudWatch User Guide</i>.</p><p>Some of the parameters of this structure also have different uses whether you are using this structure in a <code>GetMetricData</code> operation or a <code>PutMetricAlarm</code> operation. These differences are explained in the following parameter list.</p>
 Required parameters: [Id]
 */
@interface AWSCloudWatchMetricDataQuery : AWSModel


/**
 <p>The math expression to be performed on the returned data, if this object is performing a math expression. This expression can use the <code>Id</code> of the other metrics to refer to those metrics, and can also use the <code>Id</code> of other expressions to use the result of those expressions. For more information about metric math expressions, see <a href="http://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/using-metric-math.html#metric-math-syntax">Metric Math Syntax and Functions</a> in the <i>Amazon CloudWatch User Guide</i>.</p><p>Within each MetricDataQuery object, you must specify either <code>Expression</code> or <code>MetricStat</code> but not both.</p>
 */
@property (nonatomic, strong) NSString * _Nullable expression;

/**
 <p>A short name used to tie this object to the results in the response. This name must be unique within a single call to <code>GetMetricData</code>. If you are performing math expressions on this set of data, this name represents that data and can serve as a variable in the mathematical expression. The valid characters are letters, numbers, and underscore. The first character must be a lowercase letter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>A human-readable label for this metric or expression. This is especially useful if this is an expression, so that you know what the value represents. If the metric or expression is shown in a CloudWatch dashboard widget, the label is shown. If Label is omitted, CloudWatch generates a default.</p>
 */
@property (nonatomic, strong) NSString * _Nullable label;

/**
 <p>The metric to be returned, along with statistics, period, and units. Use this parameter only if this object is retrieving a metric and not performing a math expression on returned data.</p><p>Within one MetricDataQuery object, you must specify either <code>Expression</code> or <code>MetricStat</code> but not both.</p>
 */
@property (nonatomic, strong) AWSCloudWatchMetricStat * _Nullable metricStat;

/**
 <p>When used in <code>GetMetricData</code>, this option indicates whether to return the timestamps and raw data values of this metric. If you are performing this call just to do math expressions and do not also need the raw data returned, you can specify <code>False</code>. If you omit this, the default of <code>True</code> is used.</p><p>When used in <code>PutMetricAlarm</code>, specify <code>True</code> for the one expression result to use as the alarm. For all other metrics and expressions in the same <code>PutMetricAlarm</code> operation, specify <code>ReturnData</code> as False.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable returnData;

@end

/**
 <p>A <code>GetMetricData</code> call returns an array of <code>MetricDataResult</code> structures. Each of these structures includes the data points for that metric, along with the timestamps of those data points and other identifying information.</p>
 */
@interface AWSCloudWatchMetricDataResult : AWSModel


/**
 <p>The short name you specified to represent this metric.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The human-readable label associated with the data.</p>
 */
@property (nonatomic, strong) NSString * _Nullable label;

/**
 <p>A list of messages with additional information about the data returned.</p>
 */
@property (nonatomic, strong) NSArray<AWSCloudWatchMessageData *> * _Nullable messages;

/**
 <p>The status of the returned data. <code>Complete</code> indicates that all data points in the requested time range were returned. <code>PartialData</code> means that an incomplete set of data points were returned. You can use the <code>NextToken</code> value that was returned and repeat your request to get more data points. <code>NextToken</code> is not returned if you are performing a math expression. <code>InternalError</code> indicates that an error occurred. Retry your request using <code>NextToken</code>, if present.</p>
 */
@property (nonatomic, assign) AWSCloudWatchStatusCode statusCode;

/**
 <p>The timestamps for the data points, formatted in Unix timestamp format. The number of timestamps always matches the number of values and the value for Timestamps[x] is Values[x].</p>
 */
@property (nonatomic, strong) NSArray<NSDate *> * _Nullable timestamps;

/**
 <p>The data points for the metric corresponding to <code>Timestamps</code>. The number of values always matches the number of timestamps and the timestamp for Values[x] is Timestamps[x].</p>
 */
@property (nonatomic, strong) NSArray<NSNumber *> * _Nullable values;

@end

/**
 <p>Encapsulates the information sent to either create a metric or add new values to be aggregated into an existing metric.</p>
 Required parameters: [MetricName]
 */
@interface AWSCloudWatchMetricDatum : AWSModel


/**
 <p>Array of numbers that is used along with the <code>Values</code> array. Each number in the <code>Count</code> array is the number of times the corresponding value in the <code>Values</code> array occurred during the period. </p><p>If you omit the <code>Counts</code> array, the default of 1 is used as the value for each count. If you include a <code>Counts</code> array, it must include the same amount of values as the <code>Values</code> array.</p>
 */
@property (nonatomic, strong) NSArray<NSNumber *> * _Nullable counts;

/**
 <p>The dimensions associated with the metric.</p>
 */
@property (nonatomic, strong) NSArray<AWSCloudWatchDimension *> * _Nullable dimensions;

/**
 <p>The name of the metric.</p>
 */
@property (nonatomic, strong) NSString * _Nullable metricName;

/**
 <p>The statistical values for the metric.</p>
 */
@property (nonatomic, strong) AWSCloudWatchStatisticSet * _Nullable statisticValues;

/**
 <p>Valid values are 1 and 60. Setting this to 1 specifies this metric as a high-resolution metric, so that CloudWatch stores the metric with sub-minute resolution down to one second. Setting this to 60 specifies this metric as a regular-resolution metric, which CloudWatch stores at 1-minute resolution. Currently, high resolution is available only for custom metrics. For more information about high-resolution metrics, see <a href="http://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/publishingMetrics.html#high-resolution-metrics">High-Resolution Metrics</a> in the <i>Amazon CloudWatch User Guide</i>. </p><p>This field is optional, if you do not specify it the default of 60 is used.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable storageResolution;

/**
 <p>The time the metric data was received, expressed as the number of milliseconds since Jan 1, 1970 00:00:00 UTC.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable timestamp;

/**
 <p>The unit of the metric.</p>
 */
@property (nonatomic, assign) AWSCloudWatchStandardUnit unit;

/**
 <p>The value for the metric.</p><p>Although the parameter accepts numbers of type Double, CloudWatch rejects values that are either too small or too large. Values must be in the range of 8.515920e-109 to 1.174271e+108 (Base 10) or 2e-360 to 2e360 (Base 2). In addition, special values (for example, NaN, +Infinity, -Infinity) are not supported.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable value;

/**
 <p>Array of numbers representing the values for the metric during the period. Each unique value is listed just once in this array, and the corresponding number in the <code>Counts</code> array specifies the number of times that value occurred during the period. You can include up to 150 unique values in each <code>PutMetricData</code> action that specifies a <code>Values</code> array.</p><p>Although the <code>Values</code> array accepts numbers of type <code>Double</code>, CloudWatch rejects values that are either too small or too large. Values must be in the range of 8.515920e-109 to 1.174271e+108 (Base 10) or 2e-360 to 2e360 (Base 2). In addition, special values (for example, NaN, +Infinity, -Infinity) are not supported.</p>
 */
@property (nonatomic, strong) NSArray<NSNumber *> * _Nullable values;

@end

/**
 <p>This structure defines the metric to be returned, along with the statistics, period, and units.</p>
 Required parameters: [Metric, Period, Stat]
 */
@interface AWSCloudWatchMetricStat : AWSModel


/**
 <p>The metric to return, including the metric name, namespace, and dimensions.</p>
 */
@property (nonatomic, strong) AWSCloudWatchMetric * _Nullable metric;

/**
 <p>The period, in seconds, to use when retrieving the metric.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable period;

/**
 <p>The statistic to return. It can include any CloudWatch statistic or extended statistic.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stat;

/**
 <p>The unit to use for the returned data points.</p>
 */
@property (nonatomic, assign) AWSCloudWatchStandardUnit unit;

@end

/**
 
 */
@interface AWSCloudWatchPutDashboardInput : AWSRequest


/**
 <p>The detailed information about the dashboard in JSON format, including the widgets to include and their location on the dashboard. This parameter is required.</p><p>For more information about the syntax, see <a>CloudWatch-Dashboard-Body-Structure</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dashboardBody;

/**
 <p>The name of the dashboard. If a dashboard with this name already exists, this call modifies that dashboard, replacing its current contents. Otherwise, a new dashboard is created. The maximum length is 255, and valid characters are A-Z, a-z, 0-9, "-", and "_". This parameter is required.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dashboardName;

@end

/**
 
 */
@interface AWSCloudWatchPutDashboardOutput : AWSModel


/**
 <p>If the input for <code>PutDashboard</code> was correct and the dashboard was successfully created or modified, this result is empty.</p><p>If this result includes only warning messages, then the input was valid enough for the dashboard to be created or modified, but some elements of the dashboard may not render.</p><p>If this result includes error messages, the input was not valid and the operation failed.</p>
 */
@property (nonatomic, strong) NSArray<AWSCloudWatchDashboardValidationMessage *> * _Nullable dashboardValidationMessages;

@end

/**
 
 */
@interface AWSCloudWatchPutMetricAlarmInput : AWSRequest


/**
 <p>Indicates whether actions should be executed during any changes to the alarm state. The default is TRUE.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable actionsEnabled;

/**
 <p>The actions to execute when this alarm transitions to the <code>ALARM</code> state from any other state. Each action is specified as an Amazon Resource Name (ARN).</p><p>Valid Values: <code>arn:aws:automate:<i>region</i>:ec2:stop</code> | <code>arn:aws:automate:<i>region</i>:ec2:terminate</code> | <code>arn:aws:automate:<i>region</i>:ec2:recover</code> | <code>arn:aws:sns:<i>region</i>:<i>account-id</i>:<i>sns-topic-name</i></code> | <code>arn:aws:autoscaling:<i>region</i>:<i>account-id</i>:scalingPolicy:<i>policy-id</i>autoScalingGroupName/<i>group-friendly-name</i>:policyName/<i>policy-friendly-name</i></code></p><p>Valid Values (for use with IAM roles): <code>arn:aws:swf:<i>region</i>:<i>account-id</i>:action/actions/AWS_EC2.InstanceId.Stop/1.0</code> | <code>arn:aws:swf:<i>region</i>:<i>account-id</i>:action/actions/AWS_EC2.InstanceId.Terminate/1.0</code> | <code>arn:aws:swf:<i>region</i>:<i>account-id</i>:action/actions/AWS_EC2.InstanceId.Reboot/1.0</code></p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable alarmActions;

/**
 <p>The description for the alarm.</p>
 */
@property (nonatomic, strong) NSString * _Nullable alarmDescription;

/**
 <p>The name for the alarm. This name must be unique within your AWS account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable alarmName;

/**
 <p> The arithmetic operation to use when comparing the specified statistic and threshold. The specified statistic value is used as the first operand.</p>
 */
@property (nonatomic, assign) AWSCloudWatchComparisonOperator comparisonOperator;

/**
 <p>The number of datapoints that must be breaching to trigger the alarm. This is used only if you are setting an "M out of N" alarm. In that case, this value is the M. For more information, see <a href="http://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/AlarmThatSendsEmail.html#alarm-evaluation">Evaluating an Alarm</a> in the <i>Amazon CloudWatch User Guide</i>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable datapointsToAlarm;

/**
 <p>The dimensions for the metric specified in <code>MetricName</code>.</p>
 */
@property (nonatomic, strong) NSArray<AWSCloudWatchDimension *> * _Nullable dimensions;

/**
 <p> Used only for alarms based on percentiles. If you specify <code>ignore</code>, the alarm state does not change during periods with too few data points to be statistically significant. If you specify <code>evaluate</code> or omit this parameter, the alarm is always evaluated and possibly changes state no matter how many data points are available. For more information, see <a href="http://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/AlarmThatSendsEmail.html#percentiles-with-low-samples">Percentile-Based CloudWatch Alarms and Low Data Samples</a>.</p><p>Valid Values: <code>evaluate | ignore</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable evaluateLowSampleCountPercentile;

/**
 <p>The number of periods over which data is compared to the specified threshold. If you are setting an alarm that requires that a number of consecutive data points be breaching to trigger the alarm, this value specifies that number. If you are setting an "M out of N" alarm, this value is the N.</p><p>An alarm's total current evaluation period can be no longer than one day, so this number multiplied by <code>Period</code> cannot be more than 86,400 seconds.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable evaluationPeriods;

/**
 <p>The percentile statistic for the metric specified in <code>MetricName</code>. Specify a value between p0.0 and p100. When you call <code>PutMetricAlarm</code> and specify a <code>MetricName</code>, you must specify either <code>Statistic</code> or <code>ExtendedStatistic,</code> but not both.</p>
 */
@property (nonatomic, strong) NSString * _Nullable extendedStatistic;

/**
 <p>The actions to execute when this alarm transitions to the <code>INSUFFICIENT_DATA</code> state from any other state. Each action is specified as an Amazon Resource Name (ARN).</p><p>Valid Values: <code>arn:aws:automate:<i>region</i>:ec2:stop</code> | <code>arn:aws:automate:<i>region</i>:ec2:terminate</code> | <code>arn:aws:automate:<i>region</i>:ec2:recover</code> | <code>arn:aws:sns:<i>region</i>:<i>account-id</i>:<i>sns-topic-name</i></code> | <code>arn:aws:autoscaling:<i>region</i>:<i>account-id</i>:scalingPolicy:<i>policy-id</i>autoScalingGroupName/<i>group-friendly-name</i>:policyName/<i>policy-friendly-name</i></code></p><p>Valid Values (for use with IAM roles): <code>&gt;arn:aws:swf:<i>region</i>:<i>account-id</i>:action/actions/AWS_EC2.InstanceId.Stop/1.0</code> | <code>arn:aws:swf:<i>region</i>:<i>account-id</i>:action/actions/AWS_EC2.InstanceId.Terminate/1.0</code> | <code>arn:aws:swf:<i>region</i>:<i>account-id</i>:action/actions/AWS_EC2.InstanceId.Reboot/1.0</code></p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable insufficientDataActions;

/**
 <p>The name for the metric associated with the alarm.</p><p>If you are creating an alarm based on a math expression, you cannot specify this parameter, or any of the <code>Dimensions</code>, <code>Period</code>, <code>Namespace</code>, <code>Statistic</code>, or <code>ExtendedStatistic</code> parameters. Instead, you specify all this information in the <code>Metrics</code> array.</p>
 */
@property (nonatomic, strong) NSString * _Nullable metricName;

/**
 <p>An array of <code>MetricDataQuery</code> structures that enable you to create an alarm based on the result of a metric math expression. Each item in the <code>Metrics</code> array either retrieves a metric or performs a math expression.</p><p>If you use the <code>Metrics</code> parameter, you cannot include the <code>MetricName</code>, <code>Dimensions</code>, <code>Period</code>, <code>Namespace</code>, <code>Statistic</code>, or <code>ExtendedStatistic</code> parameters of <code>PutMetricAlarm</code> in the same operation. Instead, you retrieve the metrics you are using in your math expression as part of the <code>Metrics</code> array.</p>
 */
@property (nonatomic, strong) NSArray<AWSCloudWatchMetricDataQuery *> * _Nullable metrics;

/**
 <p>The namespace for the metric associated specified in <code>MetricName</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable namespace;

/**
 <p>The actions to execute when this alarm transitions to an <code>OK</code> state from any other state. Each action is specified as an Amazon Resource Name (ARN).</p><p>Valid Values: <code>arn:aws:automate:<i>region</i>:ec2:stop</code> | <code>arn:aws:automate:<i>region</i>:ec2:terminate</code> | <code>arn:aws:automate:<i>region</i>:ec2:recover</code> | <code>arn:aws:automate:<i>region</i>:ec2:reboot</code> | <code>arn:aws:sns:<i>region</i>:<i>account-id</i>:<i>sns-topic-name</i></code> | <code>arn:aws:autoscaling:<i>region</i>:<i>account-id</i>:scalingPolicy:<i>policy-id</i>autoScalingGroupName/<i>group-friendly-name</i>:policyName/<i>policy-friendly-name</i></code></p><p>Valid Values (for use with IAM roles): <code>arn:aws:swf:<i>region</i>:<i>account-id</i>:action/actions/AWS_EC2.InstanceId.Stop/1.0</code> | <code>arn:aws:swf:<i>region</i>:<i>account-id</i>:action/actions/AWS_EC2.InstanceId.Terminate/1.0</code> | <code>arn:aws:swf:<i>region</i>:<i>account-id</i>:action/actions/AWS_EC2.InstanceId.Reboot/1.0</code></p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable OKActions;

/**
 <p>The length, in seconds, used each time the metric specified in <code>MetricName</code> is evaluated. Valid values are 10, 30, and any multiple of 60.</p><p>Be sure to specify 10 or 30 only for metrics that are stored by a <code>PutMetricData</code> call with a <code>StorageResolution</code> of 1. If you specify a period of 10 or 30 for a metric that does not have sub-minute resolution, the alarm still attempts to gather data at the period rate that you specify. In this case, it does not receive data for the attempts that do not correspond to a one-minute data resolution, and the alarm may often lapse into INSUFFICENT_DATA status. Specifying 10 or 30 also sets this alarm as a high-resolution alarm, which has a higher charge than other alarms. For more information about pricing, see <a href="https://aws.amazon.com/cloudwatch/pricing/">Amazon CloudWatch Pricing</a>.</p><p>An alarm's total current evaluation period can be no longer than one day, so <code>Period</code> multiplied by <code>EvaluationPeriods</code> cannot be more than 86,400 seconds.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable period;

/**
 <p>The statistic for the metric specified in <code>MetricName</code>, other than percentile. For percentile statistics, use <code>ExtendedStatistic</code>. When you call <code>PutMetricAlarm</code> and specify a <code>MetricName</code>, you must specify either <code>Statistic</code> or <code>ExtendedStatistic,</code> but not both.</p>
 */
@property (nonatomic, assign) AWSCloudWatchStatistic statistic;

/**
 <p>The value against which the specified statistic is compared.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable threshold;

/**
 <p> Sets how this alarm is to handle missing data points. If <code>TreatMissingData</code> is omitted, the default behavior of <code>missing</code> is used. For more information, see <a href="http://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/AlarmThatSendsEmail.html#alarms-and-missing-data">Configuring How CloudWatch Alarms Treats Missing Data</a>.</p><p>Valid Values: <code>breaching | notBreaching | ignore | missing</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable treatMissingData;

/**
 <p>The unit of measure for the statistic. For example, the units for the Amazon EC2 NetworkIn metric are Bytes because NetworkIn tracks the number of bytes that an instance receives on all network interfaces. You can also specify a unit when you create a custom metric. Units help provide conceptual meaning to your data. Metric data points that specify a unit of measure, such as Percent, are aggregated separately.</p><p>If you specify a unit, you must use a unit that is appropriate for the metric. Otherwise, the CloudWatch alarm can get stuck in the <code>INSUFFICIENT DATA</code> state. </p>
 */
@property (nonatomic, assign) AWSCloudWatchStandardUnit unit;

@end

/**
 
 */
@interface AWSCloudWatchPutMetricDataInput : AWSRequest


/**
 <p>The data for the metric. The array can include no more than 20 metrics per call.</p>
 */
@property (nonatomic, strong) NSArray<AWSCloudWatchMetricDatum *> * _Nullable metricData;

/**
 <p>The namespace for the metric data.</p><p>You cannot specify a namespace that begins with "AWS/". Namespaces that begin with "AWS/" are reserved for use by Amazon Web Services products.</p>
 */
@property (nonatomic, strong) NSString * _Nullable namespace;

@end

/**
 
 */
@interface AWSCloudWatchSetAlarmStateInput : AWSRequest


/**
 <p>The name for the alarm. This name must be unique within the AWS account. The maximum length is 255 characters.</p>
 */
@property (nonatomic, strong) NSString * _Nullable alarmName;

/**
 <p>The reason that this alarm is set to this specific state, in text format.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stateReason;

/**
 <p>The reason that this alarm is set to this specific state, in JSON format.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stateReasonData;

/**
 <p>The value of the state.</p>
 */
@property (nonatomic, assign) AWSCloudWatchStateValue stateValue;

@end

/**
 <p>Represents a set of statistics that describes a specific metric. </p>
 Required parameters: [SampleCount, Sum, Minimum, Maximum]
 */
@interface AWSCloudWatchStatisticSet : AWSModel


/**
 <p>The maximum value of the sample set.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maximum;

/**
 <p>The minimum value of the sample set.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable minimum;

/**
 <p>The number of samples used for the statistic set.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable sampleCount;

/**
 <p>The sum of values for the sample set.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable sum;

@end

NS_ASSUME_NONNULL_END
