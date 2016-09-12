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

#import <Foundation/Foundation.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSModel.h>

NS_ASSUME_NONNULL_BEGIN

FOUNDATION_EXPORT NSString *const AWSCloudWatchErrorDomain;

typedef NS_ENUM(NSInteger, AWSCloudWatchErrorType) {
    AWSCloudWatchErrorUnknown,
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

@class AWSCloudWatchAlarmHistoryItem;
@class AWSCloudWatchDatapoint;
@class AWSCloudWatchDeleteAlarmsInput;
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
@class AWSCloudWatchGetMetricStatisticsInput;
@class AWSCloudWatchGetMetricStatisticsOutput;
@class AWSCloudWatchListMetricsInput;
@class AWSCloudWatchListMetricsOutput;
@class AWSCloudWatchMetric;
@class AWSCloudWatchMetricAlarm;
@class AWSCloudWatchMetricDatum;
@class AWSCloudWatchPutMetricAlarmInput;
@class AWSCloudWatchPutMetricDataInput;
@class AWSCloudWatchSetAlarmStateInput;
@class AWSCloudWatchStatisticSet;

/**
 <p> The <code>AlarmHistoryItem</code> data type contains descriptive information about the history of a specific alarm. If you call <a>DescribeAlarmHistory</a>, Amazon CloudWatch returns this data type as part of the DescribeAlarmHistoryResult data type. </p>
 */
@interface AWSCloudWatchAlarmHistoryItem : AWSModel


/**
 <p>The descriptive name for the alarm.</p>
 */
@property (nonatomic, strong) NSString * _Nullable alarmName;

/**
 <p>Machine-readable data about the alarm in JSON format.</p>
 */
@property (nonatomic, strong) NSString * _Nullable historyData;

/**
 <p>The type of alarm history item.</p>
 */
@property (nonatomic, assign) AWSCloudWatchHistoryItemType historyItemType;

/**
 <p>A human-readable summary of the alarm history.</p>
 */
@property (nonatomic, strong) NSString * _Nullable historySummary;

/**
 <p>The time stamp for the alarm history item.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable timestamp;

@end

/**
 <p> The <code>Datapoint</code> data type encapsulates the statistical data that Amazon CloudWatch computes from metric data. </p>
 */
@interface AWSCloudWatchDatapoint : AWSModel


/**
 <p>The average of metric values that correspond to the datapoint.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable average;

/**
 <p>The maximum of the metric value used for the datapoint.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maximum;

/**
 <p>The minimum metric value used for the datapoint.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable minimum;

/**
 <p>The number of metric values that contributed to the aggregate value of this datapoint.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable sampleCount;

/**
 <p>The sum of metric values used for the datapoint.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable sum;

/**
 <p>The time stamp used for the datapoint.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable timestamp;

/**
 <p>The standard unit used for the datapoint.</p>
 */
@property (nonatomic, assign) AWSCloudWatchStandardUnit unit;

@end

/**
 <p>Describes the inputs for DeleteAlarms.</p>
 Required parameters: [AlarmNames]
 */
@interface AWSCloudWatchDeleteAlarmsInput : AWSRequest


/**
 <p>A list of alarms to be deleted.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable alarmNames;

@end

/**
 <p>Describes the inputs for DescribeAlarmHistory.</p>
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
 <p> The output for <a>DescribeAlarmHistory</a>. </p>
 */
@interface AWSCloudWatchDescribeAlarmHistoryOutput : AWSModel


/**
 <p>A list of alarm histories in JSON format.</p>
 */
@property (nonatomic, strong) NSArray<AWSCloudWatchAlarmHistoryItem *> * _Nullable alarmHistoryItems;

/**
 <p>A string that marks the start of the next batch of returned results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>Describes the inputs for DescribeAlarmsForMetric.</p>
 Required parameters: [MetricName, Namespace]
 */
@interface AWSCloudWatchDescribeAlarmsForMetricInput : AWSRequest


/**
 <p>The list of dimensions associated with the metric. If the metric has any associated dimensions, you must specify them in order for the DescribeAlarmsForMetric to succeed.</p>
 */
@property (nonatomic, strong) NSArray<AWSCloudWatchDimension *> * _Nullable dimensions;

/**
 <p>The name of the metric.</p>
 */
@property (nonatomic, strong) NSString * _Nullable metricName;

/**
 <p>The namespace of the metric.</p>
 */
@property (nonatomic, strong) NSString * _Nullable namespace;

/**
 <p>The period in seconds over which the statistic is applied.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable period;

/**
 <p>The statistic for the metric.</p>
 */
@property (nonatomic, assign) AWSCloudWatchStatistic statistic;

/**
 <p>The unit for the metric.</p>
 */
@property (nonatomic, assign) AWSCloudWatchStandardUnit unit;

@end

/**
 <p> The output for <a>DescribeAlarmsForMetric</a>. </p>
 */
@interface AWSCloudWatchDescribeAlarmsForMetricOutput : AWSModel


/**
 <p>A list of information for each alarm with the specified metric.</p>
 */
@property (nonatomic, strong) NSArray<AWSCloudWatchMetricAlarm *> * _Nullable metricAlarms;

@end

/**
 <p>Describes the inputs for DescribeAlarms.</p>
 */
@interface AWSCloudWatchDescribeAlarmsInput : AWSRequest


/**
 <p>The action name prefix.</p>
 */
@property (nonatomic, strong) NSString * _Nullable actionPrefix;

/**
 <p>The alarm name prefix. <code>AlarmNames</code> cannot be specified if this parameter is specified.</p>
 */
@property (nonatomic, strong) NSString * _Nullable alarmNamePrefix;

/**
 <p>A list of alarm names to retrieve information for.</p>
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
 <p>The output for <a>DescribeAlarms</a>.</p>
 */
@interface AWSCloudWatchDescribeAlarmsOutput : AWSModel


/**
 <p>A list of information for the specified alarms.</p>
 */
@property (nonatomic, strong) NSArray<AWSCloudWatchMetricAlarm *> * _Nullable metricAlarms;

/**
 <p>A string that marks the start of the next batch of returned results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p> The <code>Dimension</code> data type further expands on the identity of a metric using a Name, Value pair. </p><p>For examples that use one or more dimensions, see <a>PutMetricData</a>.</p>
 Required parameters: [Name, Value]
 */
@interface AWSCloudWatchDimension : AWSModel


/**
 <p>The name of the dimension.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The value representing the dimension measurement</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 <p> The <code>DimensionFilter</code> data type is used to filter <a>ListMetrics</a> results. </p>
 Required parameters: [Name]
 */
@interface AWSCloudWatchDimensionFilter : AWSModel


/**
 <p>The dimension name to be matched.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The value of the dimension to be matched.</p><note><p>Specifying a <code>Name</code> without specifying a <code>Value</code> returns all values associated with that <code>Name</code>.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 <p/>
 Required parameters: [AlarmNames]
 */
@interface AWSCloudWatchDisableAlarmActionsInput : AWSRequest


/**
 <p>The names of the alarms to disable actions for.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable alarmNames;

@end

/**
 <p>Describes the inputs for EnableAlarmActions.</p>
 Required parameters: [AlarmNames]
 */
@interface AWSCloudWatchEnableAlarmActionsInput : AWSRequest


/**
 <p>The names of the alarms to enable actions for.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable alarmNames;

@end

/**
 <p>Describes the inputs for GetMetricStatistics.</p>
 Required parameters: [Namespace, MetricName, StartTime, EndTime, Period, Statistics]
 */
@interface AWSCloudWatchGetMetricStatisticsInput : AWSRequest


/**
 <p>A list of dimensions describing qualities of the metric.</p>
 */
@property (nonatomic, strong) NSArray<AWSCloudWatchDimension *> * _Nullable dimensions;

/**
 <p>The time stamp to use for determining the last datapoint to return. The value specified is exclusive; results will include datapoints up to the time stamp specified. The time stamp must be in ISO 8601 UTC format (e.g., 2014-09-03T23:00:00Z).</p>
 */
@property (nonatomic, strong) NSDate * _Nullable endTime;

/**
 <p>The name of the metric, with or without spaces.</p>
 */
@property (nonatomic, strong) NSString * _Nullable metricName;

/**
 <p>The namespace of the metric, with or without spaces.</p>
 */
@property (nonatomic, strong) NSString * _Nullable namespace;

/**
 <p> The granularity, in seconds, of the returned datapoints. A <code>Period</code> can be as short as one minute (60 seconds) or as long as one day (86,400 seconds), and must be a multiple of 60. The default value is 60. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable period;

/**
 <p>The time stamp to use for determining the first datapoint to return. The value specified is inclusive; results include datapoints with the time stamp specified. The time stamp must be in ISO 8601 UTC format (e.g., 2014-09-03T23:00:00Z).</p><note><p>The specified start time is rounded down to the nearest value. Datapoints are returned for start times up to two weeks in the past. Specified start times that are more than two weeks in the past will not return datapoints for metrics that are older than two weeks.</p><p>Data that is timestamped 24 hours or more in the past may take in excess of 48 hours to become available from submission time using <code>GetMetricStatistics</code>.</p></note>
 */
@property (nonatomic, strong) NSDate * _Nullable startTime;

/**
 <p> The metric statistics to return. For information about specific statistics returned by GetMetricStatistics, see <a href="http://docs.aws.amazon.com/AmazonCloudWatch/latest/DeveloperGuide/cloudwatch_concepts.html#Statistic">Statistics</a> in the <i>Amazon CloudWatch Developer Guide</i>. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable statistics;

/**
 <p>The specific unit for a given metric. Metrics may be reported in multiple units. Not supplying a unit results in all units being returned. If the metric only ever reports one unit, specifying a unit will have no effect.</p>
 */
@property (nonatomic, assign) AWSCloudWatchStandardUnit unit;

@end

/**
 <p> The output for <a>GetMetricStatistics</a>. </p>
 */
@interface AWSCloudWatchGetMetricStatisticsOutput : AWSModel


/**
 <p>The datapoints for the specified metric.</p>
 */
@property (nonatomic, strong) NSArray<AWSCloudWatchDatapoint *> * _Nullable datapoints;

/**
 <p>A label describing the specified metric.</p>
 */
@property (nonatomic, strong) NSString * _Nullable label;

@end

/**
 <p>Describes the inputs for ListMetrics.</p>
 */
@interface AWSCloudWatchListMetricsInput : AWSRequest


/**
 <p>A list of dimensions to filter against.</p>
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
 <p> The output for <a>ListMetrics</a>. </p>
 */
@interface AWSCloudWatchListMetricsOutput : AWSModel


/**
 <p>A list of metrics used to generate statistics for an AWS account.</p>
 */
@property (nonatomic, strong) NSArray<AWSCloudWatchMetric *> * _Nullable metrics;

/**
 <p>A string that marks the start of the next batch of returned results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p> The <code>Metric</code> data type contains information about a specific metric. If you call <a>ListMetrics</a>, Amazon CloudWatch returns information contained by this data type. </p><p>The example in the Examples section publishes two metrics named buffers and latency. Both metrics are in the examples namespace. Both metrics have two dimensions, InstanceID and InstanceType.</p>
 */
@interface AWSCloudWatchMetric : AWSModel


/**
 <p>A list of dimensions associated with the metric.</p>
 */
@property (nonatomic, strong) NSArray<AWSCloudWatchDimension *> * _Nullable dimensions;

/**
 <p>The name of the metric.</p>
 */
@property (nonatomic, strong) NSString * _Nullable metricName;

/**
 <p>The namespace of the metric.</p>
 */
@property (nonatomic, strong) NSString * _Nullable namespace;

@end

/**
 <p> The <a>MetricAlarm</a> data type represents an alarm. You can use <a>PutMetricAlarm</a> to create or update an alarm. </p>
 */
@interface AWSCloudWatchMetricAlarm : AWSModel


/**
 <p>Indicates whether actions should be executed during any changes to the alarm's state.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable actionsEnabled;

/**
 <p> The list of actions to execute when this alarm transitions into an <code>ALARM</code> state from any other state. Each action is specified as an Amazon Resource Name (ARN). </p>
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
 <p>The description for the alarm.</p>
 */
@property (nonatomic, strong) NSString * _Nullable alarmDescription;

/**
 <p>The name of the alarm.</p>
 */
@property (nonatomic, strong) NSString * _Nullable alarmName;

/**
 <p> The arithmetic operation to use when comparing the specified <code>Statistic</code> and <code>Threshold</code>. The specified <code>Statistic</code> value is used as the first operand. </p>
 */
@property (nonatomic, assign) AWSCloudWatchComparisonOperator comparisonOperator;

/**
 <p>The list of dimensions associated with the alarm's associated metric.</p>
 */
@property (nonatomic, strong) NSArray<AWSCloudWatchDimension *> * _Nullable dimensions;

/**
 <p>The number of periods over which data is compared to the specified threshold.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable evaluationPeriods;

/**
 <p> The list of actions to execute when this alarm transitions into an <code>INSUFFICIENT_DATA</code> state from any other state. Each action is specified as an Amazon Resource Name (ARN). </p><important><p>The current WSDL lists this attribute as <code>UnknownActions</code>.</p></important>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable insufficientDataActions;

/**
 <p>The name of the alarm's metric.</p>
 */
@property (nonatomic, strong) NSString * _Nullable metricName;

/**
 <p>The namespace of alarm's associated metric.</p>
 */
@property (nonatomic, strong) NSString * _Nullable namespace;

/**
 <p> The list of actions to execute when this alarm transitions into an <code>OK</code> state from any other state. Each action is specified as an Amazon Resource Name (ARN). </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable OKActions;

/**
 <p>The period in seconds over which the statistic is applied.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable period;

/**
 <p>A human-readable explanation for the alarm's state.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stateReason;

/**
 <p>An explanation for the alarm's state in machine-readable JSON format</p>
 */
@property (nonatomic, strong) NSString * _Nullable stateReasonData;

/**
 <p>The time stamp of the last update to the alarm's state.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable stateUpdatedTimestamp;

/**
 <p>The state value for the alarm.</p>
 */
@property (nonatomic, assign) AWSCloudWatchStateValue stateValue;

/**
 <p>The statistic to apply to the alarm's associated metric.</p>
 */
@property (nonatomic, assign) AWSCloudWatchStatistic statistic;

/**
 <p>The value against which the specified statistic is compared.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable threshold;

/**
 <p>The unit of the alarm's associated metric.</p>
 */
@property (nonatomic, assign) AWSCloudWatchStandardUnit unit;

@end

/**
 <p> The <code>MetricDatum</code> data type encapsulates the information sent with <a>PutMetricData</a> to either create a new metric or add new values to be aggregated into an existing metric. </p>
 Required parameters: [MetricName]
 */
@interface AWSCloudWatchMetricDatum : AWSModel


/**
 <p>A list of dimensions associated with the metric. Note, when using the Dimensions value in a query, you need to append .member.N to it (e.g., Dimensions.member.N).</p>
 */
@property (nonatomic, strong) NSArray<AWSCloudWatchDimension *> * _Nullable dimensions;

/**
 <p>The name of the metric.</p>
 */
@property (nonatomic, strong) NSString * _Nullable metricName;

/**
 <p>A set of statistical values describing the metric.</p>
 */
@property (nonatomic, strong) AWSCloudWatchStatisticSet * _Nullable statisticValues;

/**
 <p>The time stamp used for the metric in ISO 8601 Universal Coordinated Time (UTC) format. If not specified, the default value is set to the time the metric data was received.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable timestamp;

/**
 <p>The unit of the metric.</p>
 */
@property (nonatomic, assign) AWSCloudWatchStandardUnit unit;

/**
 <p>The value for the metric.</p><important><p>Although the <code>Value</code> parameter accepts numbers of type <code>Double</code>, Amazon CloudWatch rejects values that are either too small or too large. Values must be in the range of 8.515920e-109 to 1.174271e+108 (Base 10) or 2e-360 to 2e360 (Base 2). In addition, special values (e.g., NaN, +Infinity, -Infinity) are not supported.</p></important>
 */
@property (nonatomic, strong) NSNumber * _Nullable value;

@end

/**
 <p>Describes the inputs for PutMetricAlarm.</p>
 Required parameters: [AlarmName, MetricName, Namespace, Statistic, Period, EvaluationPeriods, Threshold, ComparisonOperator]
 */
@interface AWSCloudWatchPutMetricAlarmInput : AWSRequest


/**
 <p>Indicates whether or not actions should be executed during any changes to the alarm's state.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable actionsEnabled;

/**
 <p> The list of actions to execute when this alarm transitions into an <code>ALARM</code> state from any other state. Each action is specified as an Amazon Resource Name (ARN). </p><p>Valid Values: arn:aws:automate:<i>region (e.g., us-east-1)</i>:ec2:stop | arn:aws:automate:<i>region (e.g., us-east-1)</i>:ec2:terminate | arn:aws:automate:<i>region (e.g., us-east-1)</i>:ec2:recover</p><p>Valid Values (for use with IAM roles): arn:aws:swf:us-east-1:{<i>customer-account</i>}:action/actions/AWS_EC2.InstanceId.Stop/1.0 | arn:aws:swf:us-east-1:{<i>customer-account</i>}:action/actions/AWS_EC2.InstanceId.Terminate/1.0 | arn:aws:swf:us-east-1:{<i>customer-account</i>}:action/actions/AWS_EC2.InstanceId.Reboot/1.0</p><p><b>Note:</b> You must create at least one stop, terminate, or reboot alarm using the Amazon EC2 or CloudWatch console to create the <b>EC2ActionsAccess</b> IAM role for the first time. After this IAM role is created, you can create stop, terminate, or reboot alarms using the CLI.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable alarmActions;

/**
 <p>The description for the alarm.</p>
 */
@property (nonatomic, strong) NSString * _Nullable alarmDescription;

/**
 <p>The descriptive name for the alarm. This name must be unique within the user's AWS account</p>
 */
@property (nonatomic, strong) NSString * _Nullable alarmName;

/**
 <p> The arithmetic operation to use when comparing the specified <code>Statistic</code> and <code>Threshold</code>. The specified <code>Statistic</code> value is used as the first operand. </p>
 */
@property (nonatomic, assign) AWSCloudWatchComparisonOperator comparisonOperator;

/**
 <p>The dimensions for the alarm's associated metric.</p>
 */
@property (nonatomic, strong) NSArray<AWSCloudWatchDimension *> * _Nullable dimensions;

/**
 <p>The number of periods over which data is compared to the specified threshold.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable evaluationPeriods;

/**
 <p> The list of actions to execute when this alarm transitions into an <code>INSUFFICIENT_DATA</code> state from any other state. Each action is specified as an Amazon Resource Name (ARN). </p><p>Valid Values: arn:aws:automate:<i>region (e.g., us-east-1)</i>:ec2:stop | arn:aws:automate:<i>region (e.g., us-east-1)</i>:ec2:terminate | arn:aws:automate:<i>region (e.g., us-east-1)</i>:ec2:recover</p><p>Valid Values (for use with IAM roles): arn:aws:swf:us-east-1:{<i>customer-account</i>}:action/actions/AWS_EC2.InstanceId.Stop/1.0 | arn:aws:swf:us-east-1:{<i>customer-account</i>}:action/actions/AWS_EC2.InstanceId.Terminate/1.0 | arn:aws:swf:us-east-1:{<i>customer-account</i>}:action/actions/AWS_EC2.InstanceId.Reboot/1.0</p><p><b>Note:</b> You must create at least one stop, terminate, or reboot alarm using the Amazon EC2 or CloudWatch console to create the <b>EC2ActionsAccess</b> IAM role for the first time. After this IAM role is created, you can create stop, terminate, or reboot alarms using the CLI.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable insufficientDataActions;

/**
 <p>The name for the alarm's associated metric.</p>
 */
@property (nonatomic, strong) NSString * _Nullable metricName;

/**
 <p>The namespace for the alarm's associated metric.</p>
 */
@property (nonatomic, strong) NSString * _Nullable namespace;

/**
 <p> The list of actions to execute when this alarm transitions into an <code>OK</code> state from any other state. Each action is specified as an Amazon Resource Name (ARN). </p><p>Valid Values: arn:aws:automate:<i>region (e.g., us-east-1)</i>:ec2:stop | arn:aws:automate:<i>region (e.g., us-east-1)</i>:ec2:terminate | arn:aws:automate:<i>region (e.g., us-east-1)</i>:ec2:recover</p><p>Valid Values (for use with IAM roles): arn:aws:swf:us-east-1:{<i>customer-account</i>}:action/actions/AWS_EC2.InstanceId.Stop/1.0 | arn:aws:swf:us-east-1:{<i>customer-account</i>}:action/actions/AWS_EC2.InstanceId.Terminate/1.0 | arn:aws:swf:us-east-1:{<i>customer-account</i>}:action/actions/AWS_EC2.InstanceId.Reboot/1.0</p><p><b>Note:</b> You must create at least one stop, terminate, or reboot alarm using the Amazon EC2 or CloudWatch console to create the <b>EC2ActionsAccess</b> IAM role for the first time. After this IAM role is created, you can create stop, terminate, or reboot alarms using the CLI.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable OKActions;

/**
 <p>The period in seconds over which the specified statistic is applied.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable period;

/**
 <p>The statistic to apply to the alarm's associated metric.</p>
 */
@property (nonatomic, assign) AWSCloudWatchStatistic statistic;

/**
 <p>The value against which the specified statistic is compared.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable threshold;

/**
 <p>The statistic's unit of measure. For example, the units for the Amazon EC2 NetworkIn metric are Bytes because NetworkIn tracks the number of bytes that an instance receives on all network interfaces. You can also specify a unit when you create a custom metric. Units help provide conceptual meaning to your data. Metric data points that specify a unit of measure, such as Percent, are aggregated separately.</p><p><b>Note:</b> If you specify a unit, you must use a unit that is appropriate for the metric. Otherwise, this can cause an Amazon CloudWatch alarm to get stuck in the INSUFFICIENT DATA state. </p>
 */
@property (nonatomic, assign) AWSCloudWatchStandardUnit unit;

@end

/**
 <p>Describes the inputs for PutMetricData.</p>
 Required parameters: [Namespace, MetricData]
 */
@interface AWSCloudWatchPutMetricDataInput : AWSRequest


/**
 <p>A list of data describing the metric.</p>
 */
@property (nonatomic, strong) NSArray<AWSCloudWatchMetricDatum *> * _Nullable metricData;

/**
 <p>The namespace for the metric data.</p><note><p>You cannot specify a namespace that begins with "AWS/". Namespaces that begin with "AWS/" are reserved for other Amazon Web Services products that send metrics to Amazon CloudWatch.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable namespace;

@end

/**
 <p>Describes the inputs for SetAlarmState.</p>
 Required parameters: [AlarmName, StateValue, StateReason]
 */
@interface AWSCloudWatchSetAlarmStateInput : AWSRequest


/**
 <p>The descriptive name for the alarm. This name must be unique within the user's AWS account. The maximum length is 255 characters.</p>
 */
@property (nonatomic, strong) NSString * _Nullable alarmName;

/**
 <p>The reason that this alarm is set to this specific state (in human-readable text format)</p>
 */
@property (nonatomic, strong) NSString * _Nullable stateReason;

/**
 <p>The reason that this alarm is set to this specific state (in machine-readable JSON format)</p>
 */
@property (nonatomic, strong) NSString * _Nullable stateReasonData;

/**
 <p>The value of the state.</p>
 */
@property (nonatomic, assign) AWSCloudWatchStateValue stateValue;

@end

/**
 <p> The <code>StatisticSet</code> data type describes the <code>StatisticValues</code> component of <a>MetricDatum</a>, and represents a set of statistics that describes a specific metric. </p>
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
