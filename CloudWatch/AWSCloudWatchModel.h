/*
 * Copyright 2010-2014 Amazon.com, Inc. or its affiliates. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License").
 * You may not use this file except in compliance with the License.
 * A copy of the License is located at
 *
 *  http://aws.amazon.com/apache2.0
 *
 * or in the "license" file accompanying this file. This file is distributed
 * on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 * express or implied. See the License for the specific language governing
 * permissions and limitations under the License.
 */

#import <Foundation/Foundation.h>
#import "AWSNetworking.h"
#import "AWSModel.h"

FOUNDATION_EXPORT NSString *const AWSCloudWatchErrorDomain;

typedef NS_ENUM(NSInteger, AWSCloudWatchErrorType) {
    AWSCloudWatchErrorUnknown,
    AWSCloudWatchErrorIncompleteSignature,
    AWSCloudWatchErrorInvalidClientTokenId,
    AWSCloudWatchErrorMissingAuthenticationToken,
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
 * <p> The <code>AlarmHistoryItem</code> data type contains descriptive information about the history of a specific alarm. If you call <a>DescribeAlarmHistory</a>, Amazon CloudWatch returns this data type as part of the <a>DescribeAlarmHistoryResult</a> data type. </p>
 */
@interface AWSCloudWatchAlarmHistoryItem : AWSModel


/**
 * <p> The descriptive name for the alarm. </p>
 */
@property (nonatomic, strong) NSString *alarmName;

/**
 * <p> Machine-readable data about the alarm in JSON format. </p>
 */
@property (nonatomic, strong) NSString *historyData;

/**
 * <p> The type of alarm history item. </p>
 */
@property (nonatomic, assign) AWSCloudWatchHistoryItemType historyItemType;

/**
 * <p> A human-readable summary of the alarm history. </p>
 */
@property (nonatomic, strong) NSString *historySummary;

/**
 * <p> The time stamp for the alarm history item. Amazon CloudWatch uses Coordinated Universal Time (UTC) when returning time stamps, which do not accommodate seasonal adjustments such as daylight savings time. For more information, see <a href="http://docs.aws.amazon.com/AmazonCloudWatch/latest/DeveloperGuide/cloudwatch_concepts.html#about_timestamp">Time stamps</a> in the <i>Amazon CloudWatch Developer Guide</i>. </p>
 */
@property (nonatomic, strong) NSDate *timestamp;

@end

/**
 * <p> The <code>Datapoint</code> data type encapsulates the statistical data that Amazon CloudWatch computes from metric data. </p>
 */
@interface AWSCloudWatchDatapoint : AWSModel


/**
 * <p> The average of metric values that correspond to the datapoint. </p>
 */
@property (nonatomic, strong) NSNumber *average;

/**
 * <p> The maximum of the metric value used for the datapoint. </p>
 */
@property (nonatomic, strong) NSNumber *maximum;

/**
 * <p> The minimum metric value used for the datapoint. </p>
 */
@property (nonatomic, strong) NSNumber *minimum;

/**
 * <p> The number of metric values that contributed to the aggregate value of this datapoint. </p>
 */
@property (nonatomic, strong) NSNumber *sampleCount;

/**
 * <p> The sum of metric values used for the datapoint. </p>
 */
@property (nonatomic, strong) NSNumber *sum;

/**
 * <p> The time stamp used for the datapoint. Amazon CloudWatch uses Coordinated Universal Time (UTC) when returning time stamps, which do not accommodate seasonal adjustments such as daylight savings time. For more information, see <a href="http://docs.aws.amazon.com/AmazonCloudWatch/latest/DeveloperGuide/cloudwatch_concepts.html#about_timestamp">Time stamps</a> in the <i>Amazon CloudWatch Developer Guide</i>. </p>
 */
@property (nonatomic, strong) NSDate *timestamp;

/**
 * <p> The standard unit used for the datapoint. </p>
 */
@property (nonatomic, assign) AWSCloudWatchStandardUnit unit;

@end

@interface AWSCloudWatchDeleteAlarmsInput : AWSRequest


/**
 * <p> A list of alarms to be deleted. </p>
 */
@property (nonatomic, strong) NSArray *alarmNames;

@end

@interface AWSCloudWatchDescribeAlarmHistoryInput : AWSRequest


/**
 * <p> The name of the alarm. </p>
 */
@property (nonatomic, strong) NSString *alarmName;

/**
 * <p> The ending date to retrieve alarm history. </p>
 */
@property (nonatomic, strong) NSDate *endDate;

/**
 * <p> The type of alarm histories to retrieve. </p>
 */
@property (nonatomic, assign) AWSCloudWatchHistoryItemType historyItemType;

/**
 * <p> The maximum number of alarm history records to retrieve. </p>
 */
@property (nonatomic, strong) NSNumber *maxRecords;

/**
 * <p> The token returned by a previous call to indicate that there is more data available. </p>
 */
@property (nonatomic, strong) NSString *nextToken;

/**
 * <p> The starting date to retrieve alarm history. </p>
 */
@property (nonatomic, strong) NSDate *startDate;

@end

/**
 * <p> The output for the <a>DescribeAlarmHistory</a> action. </p>
 */
@interface AWSCloudWatchDescribeAlarmHistoryOutput : AWSModel


/**
 * <p> A list of alarm histories in JSON format. </p>
 */
@property (nonatomic, strong) NSArray *alarmHistoryItems;

/**
 * <p> A string that marks the start of the next batch of returned results. </p>
 */
@property (nonatomic, strong) NSString *nextToken;

@end

@interface AWSCloudWatchDescribeAlarmsForMetricInput : AWSRequest


/**
 * <p> The list of dimensions associated with the metric. </p>
 */
@property (nonatomic, strong) NSArray *dimensions;

/**
 * <p> The name of the metric. </p>
 */
@property (nonatomic, strong) NSString *metricName;

/**
 * <p> The namespace of the metric. </p>
 */
@property (nonatomic, strong) NSString *namespace;

/**
 * <p> The period in seconds over which the statistic is applied. </p>
 */
@property (nonatomic, strong) NSNumber *period;

/**
 * <p> The statistic for the metric. </p>
 */
@property (nonatomic, assign) AWSCloudWatchStatistic statistic;

/**
 * <p> The unit for the metric. </p>
 */
@property (nonatomic, assign) AWSCloudWatchStandardUnit unit;

@end

/**
 * <p> The output for the <a>DescribeAlarmsForMetric</a> action. </p>
 */
@interface AWSCloudWatchDescribeAlarmsForMetricOutput : AWSModel


/**
 * <p> A list of information for each alarm with the specified metric. </p>
 */
@property (nonatomic, strong) NSArray *metricAlarms;

@end

@interface AWSCloudWatchDescribeAlarmsInput : AWSRequest


/**
 * <p> The action name prefix. </p>
 */
@property (nonatomic, strong) NSString *actionPrefix;

/**
 * <p> The alarm name prefix. <code>AlarmNames</code> cannot be specified if this parameter is specified. </p>
 */
@property (nonatomic, strong) NSString *alarmNamePrefix;

/**
 * <p> A list of alarm names to retrieve information for. </p>
 */
@property (nonatomic, strong) NSArray *alarmNames;

/**
 * <p> The maximum number of alarm descriptions to retrieve. </p>
 */
@property (nonatomic, strong) NSNumber *maxRecords;

/**
 * <p> The token returned by a previous call to indicate that there is more data available. </p>
 */
@property (nonatomic, strong) NSString *nextToken;

/**
 * <p> The state value to be used in matching alarms. </p>
 */
@property (nonatomic, assign) AWSCloudWatchStateValue stateValue;

@end

/**
 * <p> The output for the <a>DescribeAlarms</a> action. </p>
 */
@interface AWSCloudWatchDescribeAlarmsOutput : AWSModel


/**
 * <p> A list of information for the specified alarms. </p>
 */
@property (nonatomic, strong) NSArray *metricAlarms;

/**
 * <p> A string that marks the start of the next batch of returned results. </p>
 */
@property (nonatomic, strong) NSString *nextToken;

@end

/**
 * <p> The <code>Dimension</code> data type further expands on the identity of a metric using a Name, Value pair. </p><p>For examples that use one or more dimensions, see <a>PutMetricData</a>.</p>
 * Required parameters: [Name, Value]
 */
@interface AWSCloudWatchDimension : AWSModel


/**
 * <p> The name of the dimension. </p>
 */
@property (nonatomic, strong) NSString *name;

/**
 * <p> The value representing the dimension measurement </p>
 */
@property (nonatomic, strong) NSString *value;

@end

/**
 * <p> The <code>DimensionFilter</code> data type is used to filter <a>ListMetrics</a> results. </p>
 * Required parameters: [Name]
 */
@interface AWSCloudWatchDimensionFilter : AWSModel


/**
 * <p> The dimension name to be matched. </p>
 */
@property (nonatomic, strong) NSString *name;

/**
 * <p> The value of the dimension to be matched. </p>
 */
@property (nonatomic, strong) NSString *value;

@end

/**
 * <p></p>
 * Required parameters: [AlarmNames]
 */
@interface AWSCloudWatchDisableAlarmActionsInput : AWSRequest


/**
 * <p> The names of the alarms to disable actions for. </p>
 */
@property (nonatomic, strong) NSArray *alarmNames;

@end

@interface AWSCloudWatchEnableAlarmActionsInput : AWSRequest


/**
 * <p> The names of the alarms to enable actions for. </p>
 */
@property (nonatomic, strong) NSArray *alarmNames;

@end

@interface AWSCloudWatchGetMetricStatisticsInput : AWSRequest


/**
 * <p> A list of dimensions describing qualities of the metric. </p>
 */
@property (nonatomic, strong) NSArray *dimensions;

/**
 * <p> The time stamp to use for determining the last datapoint to return. The value specified is exclusive; results will include datapoints up to the time stamp specified. </p>
 */
@property (nonatomic, strong) NSDate *endTime;

/**
 * <p> The name of the metric, with or without spaces. </p>
 */
@property (nonatomic, strong) NSString *metricName;

/**
 * <p> The namespace of the metric, with or without spaces. </p>
 */
@property (nonatomic, strong) NSString *namespace;

/**
 * <p> The granularity, in seconds, of the returned datapoints. <code>Period</code> must be at least 60 seconds and must be a multiple of 60. The default value is 60. </p>
 */
@property (nonatomic, strong) NSNumber *period;

/**
 * <p> The time stamp to use for determining the first datapoint to return. The value specified is inclusive; results include datapoints with the time stamp specified. </p>
 */
@property (nonatomic, strong) NSDate *startTime;

/**
 * <p> The metric statistics to return. For information about specific statistics returned by GetMetricStatistics, go to <a href="http://docs.aws.amazon.com/AmazonCloudWatch/latest/DeveloperGuide/index.html?CHAP_TerminologyandKeyConcepts.html#Statistic">Statistics</a> in the <i>Amazon CloudWatch Developer Guide</i>. </p><p> Valid Values: <code>Average | Sum | SampleCount | Maximum | Minimum</code></p>
 */
@property (nonatomic, strong) NSArray *statistics;

/**
 * <p> The unit for the metric. </p>
 */
@property (nonatomic, assign) AWSCloudWatchStandardUnit unit;

@end

/**
 * <p> The output for the <a>GetMetricStatistics</a> action. </p>
 */
@interface AWSCloudWatchGetMetricStatisticsOutput : AWSModel


/**
 * <p> The datapoints for the specified metric. </p>
 */
@property (nonatomic, strong) NSArray *datapoints;

/**
 * <p> A label describing the specified metric. </p>
 */
@property (nonatomic, strong) NSString *label;

@end

@interface AWSCloudWatchListMetricsInput : AWSRequest


/**
 * <p> A list of dimensions to filter against. </p>
 */
@property (nonatomic, strong) NSArray *dimensions;

/**
 * <p> The name of the metric to filter against. </p>
 */
@property (nonatomic, strong) NSString *metricName;

/**
 * <p> The namespace to filter against. </p>
 */
@property (nonatomic, strong) NSString *namespace;

/**
 * <p> The token returned by a previous call to indicate that there is more data available. </p>
 */
@property (nonatomic, strong) NSString *nextToken;

@end

/**
 * <p> The output for the <a>ListMetrics</a> action. </p>
 */
@interface AWSCloudWatchListMetricsOutput : AWSModel


/**
 * <p> A list of metrics used to generate statistics for an AWS account. </p>
 */
@property (nonatomic, strong) NSArray *metrics;

/**
 * <p> A string that marks the start of the next batch of returned results. </p>
 */
@property (nonatomic, strong) NSString *nextToken;

@end

/**
 * <p> The <code>Metric</code> data type contains information about a specific metric. If you call <a>ListMetrics</a>, Amazon CloudWatch returns information contained by this data type. </p><p> The example in the Examples section publishes two metrics named buffers and latency. Both metrics are in the examples namespace. Both metrics have two dimensions, InstanceID and InstanceType. </p>
 */
@interface AWSCloudWatchMetric : AWSModel


/**
 * <p> A list of dimensions associated with the metric. </p>
 */
@property (nonatomic, strong) NSArray *dimensions;

/**
 * <p> The name of the metric. </p>
 */
@property (nonatomic, strong) NSString *metricName;

/**
 * <p> The namespace of the metric. </p>
 */
@property (nonatomic, strong) NSString *namespace;

@end

/**
 * <p> The <a>MetricAlarm</a> data type represents an alarm. You can use <a>PutMetricAlarm</a> to create or update an alarm. </p>
 */
@interface AWSCloudWatchMetricAlarm : AWSModel


/**
 * <p> Indicates whether actions should be executed during any changes to the alarm's state. </p>
 */
@property (nonatomic, strong) NSNumber *actionsEnabled;

/**
 * <p> The list of actions to execute when this alarm transitions into an <code>ALARM</code> state from any other state. Each action is specified as an Amazon Resource Number (ARN). Currently the only actions supported are publishing to an Amazon SNS topic and triggering an Auto Scaling policy. </p>
 */
@property (nonatomic, strong) NSArray *alarmActions;

/**
 * <p> The Amazon Resource Name (ARN) of the alarm. </p>
 */
@property (nonatomic, strong) NSString *alarmArn;

/**
 * <p> The time stamp of the last update to the alarm configuration. Amazon CloudWatch uses Coordinated Universal Time (UTC) when returning time stamps, which do not accommodate seasonal adjustments such as daylight savings time. For more information, see <a href="http://docs.aws.amazon.com/AmazonCloudWatch/latest/DeveloperGuide/cloudwatch_concepts.html#about_timestamp">Time stamps</a> in the <i>Amazon CloudWatch Developer Guide</i>. </p>
 */
@property (nonatomic, strong) NSDate *alarmConfigurationUpdatedTimestamp;

/**
 * <p> The description for the alarm. </p>
 */
@property (nonatomic, strong) NSString *alarmDescription;

/**
 * <p> The name of the alarm. </p>
 */
@property (nonatomic, strong) NSString *alarmName;

/**
 * <p> The arithmetic operation to use when comparing the specified <code>Statistic</code> and <code>Threshold</code>. The specified <code>Statistic</code> value is used as the first operand. </p>
 */
@property (nonatomic, assign) AWSCloudWatchComparisonOperator comparisonOperator;

/**
 * <p> The list of dimensions associated with the alarm's associated metric. </p>
 */
@property (nonatomic, strong) NSArray *dimensions;

/**
 * <p> The number of periods over which data is compared to the specified threshold. </p>
 */
@property (nonatomic, strong) NSNumber *evaluationPeriods;

/**
 * <p> The list of actions to execute when this alarm transitions into an <code>INSUFFICIENT_DATA</code> state from any other state. Each action is specified as an Amazon Resource Number (ARN). Currently the only actions supported are publishing to an Amazon SNS topic or triggering an Auto Scaling policy. </p><important>The current WSDL lists this attribute as <code>UnknownActions</code>.</important>
 */
@property (nonatomic, strong) NSArray *insufficientDataActions;

/**
 * <p> The name of the alarm's metric. </p>
 */
@property (nonatomic, strong) NSString *metricName;

/**
 * <p> The namespace of alarm's associated metric. </p>
 */
@property (nonatomic, strong) NSString *namespace;

/**
 * <p> The list of actions to execute when this alarm transitions into an <code>OK</code> state from any other state. Each action is specified as an Amazon Resource Number (ARN). Currently the only actions supported are publishing to an Amazon SNS topic and triggering an Auto Scaling policy. </p>
 */
@property (nonatomic, strong) NSArray *OKActions;

/**
 * <p> The period in seconds over which the statistic is applied. </p>
 */
@property (nonatomic, strong) NSNumber *period;

/**
 * <p> A human-readable explanation for the alarm's state. </p>
 */
@property (nonatomic, strong) NSString *stateReason;

/**
 * <p> An explanation for the alarm's state in machine-readable JSON format </p>
 */
@property (nonatomic, strong) NSString *stateReasonData;

/**
 * <p> The time stamp of the last update to the alarm's state. Amazon CloudWatch uses Coordinated Universal Time (UTC) when returning time stamps, which do not accommodate seasonal adjustments such as daylight savings time. For more information, see <a href="http://docs.aws.amazon.com/AmazonCloudWatch/latest/DeveloperGuide/cloudwatch_concepts.html#about_timestamp">Time stamps</a> in the <i>Amazon CloudWatch Developer Guide</i>. </p>
 */
@property (nonatomic, strong) NSDate *stateUpdatedTimestamp;

/**
 * <p> The state value for the alarm. </p>
 */
@property (nonatomic, assign) AWSCloudWatchStateValue stateValue;

/**
 * <p> The statistic to apply to the alarm's associated metric. </p>
 */
@property (nonatomic, assign) AWSCloudWatchStatistic statistic;

/**
 * <p> The value against which the specified statistic is compared. </p>
 */
@property (nonatomic, strong) NSNumber *threshold;

/**
 * <p> The unit of the alarm's associated metric. </p>
 */
@property (nonatomic, assign) AWSCloudWatchStandardUnit unit;

@end

/**
 * <p> The <code>MetricDatum</code> data type encapsulates the information sent with <a>PutMetricData</a> to either create a new metric or add new values to be aggregated into an existing metric. </p>
 * Required parameters: [MetricName]
 */
@interface AWSCloudWatchMetricDatum : AWSModel


/**
 * <p> A list of dimensions associated with the metric. Note, when using the Dimensions value in a query, you need to append .member.N to it (e.g., Dimensions.member.N). </p>
 */
@property (nonatomic, strong) NSArray *dimensions;

/**
 * <p> The name of the metric. </p>
 */
@property (nonatomic, strong) NSString *metricName;

/**
 * <p> A set of statistical values describing the metric. </p>
 */
@property (nonatomic, strong) AWSCloudWatchStatisticSet *statisticValues;

/**
 * <p> The time stamp used for the metric. If not specified, the default value is set to the time the metric data was received. Amazon CloudWatch uses Coordinated Universal Time (UTC) when returning time stamps, which do not accommodate seasonal adjustments such as daylight savings time. For more information, see <a href="http://docs.aws.amazon.com/AmazonCloudWatch/latest/DeveloperGuide/cloudwatch_concepts.html#about_timestamp">Time stamps</a> in the <i>Amazon CloudWatch Developer Guide</i>. </p>
 */
@property (nonatomic, strong) NSDate *timestamp;

/**
 * <p> The unit of the metric. </p>
 */
@property (nonatomic, assign) AWSCloudWatchStandardUnit unit;

/**
 * <p> The value for the metric. </p><important>Although the <code>Value</code> parameter accepts numbers of type <code>Double</code>, Amazon CloudWatch truncates values with very large exponents. Values with base-10 exponents greater than 126 (1 x 10^126) are truncated. Likewise, values with base-10 exponents less than -130 (1 x 10^-130) are also truncated. </important>
 */
@property (nonatomic, strong) NSNumber *value;

@end

@interface AWSCloudWatchPutMetricAlarmInput : AWSRequest


/**
 * <p> Indicates whether or not actions should be executed during any changes to the alarm's state. </p>
 */
@property (nonatomic, strong) NSNumber *actionsEnabled;

/**
 * <p> The list of actions to execute when this alarm transitions into an <code>ALARM</code> state from any other state. Each action is specified as an Amazon Resource Number (ARN). Currently the only action supported is publishing to an Amazon SNS topic or an Amazon Auto Scaling policy. </p>
 */
@property (nonatomic, strong) NSArray *alarmActions;

/**
 * <p> The description for the alarm. </p>
 */
@property (nonatomic, strong) NSString *alarmDescription;

/**
 * <p> The descriptive name for the alarm. This name must be unique within the user's AWS account </p>
 */
@property (nonatomic, strong) NSString *alarmName;

/**
 * <p> The arithmetic operation to use when comparing the specified <code>Statistic</code> and <code>Threshold</code>. The specified <code>Statistic</code> value is used as the first operand. </p>
 */
@property (nonatomic, assign) AWSCloudWatchComparisonOperator comparisonOperator;

/**
 * <p> The dimensions for the alarm's associated metric. </p>
 */
@property (nonatomic, strong) NSArray *dimensions;

/**
 * <p> The number of periods over which data is compared to the specified threshold. </p>
 */
@property (nonatomic, strong) NSNumber *evaluationPeriods;

/**
 * <p> The list of actions to execute when this alarm transitions into an <code>INSUFFICIENT_DATA</code> state from any other state. Each action is specified as an Amazon Resource Number (ARN). Currently the only action supported is publishing to an Amazon SNS topic or an Amazon Auto Scaling policy. </p>
 */
@property (nonatomic, strong) NSArray *insufficientDataActions;

/**
 * <p> The name for the alarm's associated metric. </p>
 */
@property (nonatomic, strong) NSString *metricName;

/**
 * <p> The namespace for the alarm's associated metric. </p>
 */
@property (nonatomic, strong) NSString *namespace;

/**
 * <p> The list of actions to execute when this alarm transitions into an <code>OK</code> state from any other state. Each action is specified as an Amazon Resource Number (ARN). Currently the only action supported is publishing to an Amazon SNS topic or an Amazon Auto Scaling policy. </p>
 */
@property (nonatomic, strong) NSArray *OKActions;

/**
 * <p> The period in seconds over which the specified statistic is applied. </p>
 */
@property (nonatomic, strong) NSNumber *period;

/**
 * <p> The statistic to apply to the alarm's associated metric. </p>
 */
@property (nonatomic, assign) AWSCloudWatchStatistic statistic;

/**
 * <p> The value against which the specified statistic is compared. </p>
 */
@property (nonatomic, strong) NSNumber *threshold;

/**
 * <p> The unit for the alarm's associated metric. </p>
 */
@property (nonatomic, assign) AWSCloudWatchStandardUnit unit;

@end

@interface AWSCloudWatchPutMetricDataInput : AWSRequest


/**
 * <p> A list of data describing the metric. </p>
 */
@property (nonatomic, strong) NSArray *metricData;

/**
 * <p> The namespace for the metric data. </p>
 */
@property (nonatomic, strong) NSString *namespace;

@end

@interface AWSCloudWatchSetAlarmStateInput : AWSRequest


/**
 * <p> The descriptive name for the alarm. This name must be unique within the user's AWS account. The maximum length is 255 characters. </p>
 */
@property (nonatomic, strong) NSString *alarmName;

/**
 * <p> The reason that this alarm is set to this specific state (in human-readable text format) </p>
 */
@property (nonatomic, strong) NSString *stateReason;

/**
 * <p> The reason that this alarm is set to this specific state (in machine-readable JSON format) </p>
 */
@property (nonatomic, strong) NSString *stateReasonData;

/**
 * <p> The value of the state. </p>
 */
@property (nonatomic, assign) AWSCloudWatchStateValue stateValue;

@end

/**
 * <p> The <code>StatisticSet</code> data type describes the <code>StatisticValues</code> component of <a>MetricDatum</a>, and represents a set of statistics that describes a specific metric. </p>
 * Required parameters: [SampleCount, Sum, Minimum, Maximum]
 */
@interface AWSCloudWatchStatisticSet : AWSModel


/**
 * <p> The maximum value of the sample set. </p>
 */
@property (nonatomic, strong) NSNumber *maximum;

/**
 * <p> The minimum value of the sample set. </p>
 */
@property (nonatomic, strong) NSNumber *minimum;

/**
 * <p> The number of samples used for the statistic set. </p>
 */
@property (nonatomic, strong) NSNumber *sampleCount;

/**
 * <p> The sum of values for the sample set. </p>
 */
@property (nonatomic, strong) NSNumber *sum;

@end
