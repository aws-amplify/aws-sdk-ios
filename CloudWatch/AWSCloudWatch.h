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
#import "AWSService.h"
#import "AWSCloudWatchModel.h"

@class BFTask;

/**
 * <p>This is the <i>Amazon CloudWatch API Reference</i>. This guide provides detailed information about Amazon CloudWatch actions, data types, parameters, and errors. For detailed information about Amazon CloudWatch features and their associated API calls, go to the <a href="http://docs.aws.amazon.com/AmazonCloudWatch/latest/DeveloperGuide">Amazon CloudWatch Developer Guide</a>. </p><p>Amazon CloudWatch is a web service that enables you to publish, monitor, and manage various metrics, as well as configure alarm actions based on data from metrics. For more information about this product go to <a href="http://aws.amazon.com/cloudwatch">http://aws.amazon.com/cloudwatch</a>. </p><p> For information about the namespace, metric names, and dimensions that other Amazon Web Services products use to send metrics to Cloudwatch, go to <a href="http://docs.aws.amazon.com/AmazonCloudWatch/latest/DeveloperGuide/CW_Support_For_AWS.html">Amazon CloudWatch Metrics, Namespaces, and Dimensions Reference</a> in the <i>Amazon CloudWatch Developer Guide</i>. </p><p>Use the following links to get started using the <i>Amazon CloudWatch API Reference</i>:</p><ul><li><a href="http://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_Operations.html">Actions</a>: An alphabetical list of all Amazon CloudWatch actions.</li><li><a href="http://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_Types.html">Data Types</a>: An alphabetical list of all Amazon CloudWatch data types.</li><li><a href="http://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/CommonParameters.html">Common Parameters</a>: Parameters that all Query actions can use.</li><li><a href="http://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/CommonErrors.html">Common Errors</a>: Client and server errors that all actions can return.</li><li><a href="http://docs.aws.amazon.com/general/latest/gr/index.html?rande.html">Regions and Endpoints</a>: Itemized regions and endpoints for all AWS products.</li><li><a href="http://monitoring.amazonaws.com/doc/2010-08-01/CloudWatch.wsdl">WSDL Location</a>: http://monitoring.amazonaws.com/doc/2010-08-01/CloudWatch.wsdl</li></ul><p>In addition to using the Amazon CloudWatch API, you can also use the following SDKs and third-party libraries to access Amazon CloudWatch programmatically.</p><ul><li><a href="http://aws.amazon.com/documentation/sdkforjava/">AWS SDK for Java Documentation</a></li><li><a href="http://aws.amazon.com/documentation/sdkfornet/">AWS SDK for .NET Documentation</a></li><li><a href="http://aws.amazon.com/documentation/sdkforphp/">AWS SDK for PHP Documentation</a></li><li><a href="http://aws.amazon.com/documentation/sdkforruby/">AWS SDK for Ruby Documentation</a></li></ul><p>Developers in the AWS developer community also provide their own libraries, which you can find at the following AWS developer centers:</p><ul><li><a href="http://aws.amazon.com/java/">AWS Java Developer Center</a></li><li><a href="http://aws.amazon.com/php/">AWS PHP Developer Center</a></li><li><a href="http://aws.amazon.com/python/">AWS Python Developer Center</a></li><li><a href="http://aws.amazon.com/ruby/">AWS Ruby Developer Center</a></li><li><a href="http://aws.amazon.com/net/">AWS Windows and .NET Developer Center</a></li></ul>
 */
@interface AWSCloudWatch : AWSService

@property (nonatomic, strong, readonly) AWSServiceConfiguration *configuration;

+ (instancetype)defaultCloudWatch;

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration;

/**
 * <p> Deletes all specified alarms. In the event of an error, no alarms are deleted. </p>
 *
 * @param request A container for the necessary parameters to execute the DeleteAlarms service method.
 *
 * @return An instance of BFTask. On successful execution, task.result will be nil. On failed execution, task.error may contain an NSError with AWSCloudWatchErrorDomain domian and the following error code: AWSCloudWatchErrorResourceNotFound.
 *
 * @see AWSCloudWatchDeleteAlarmsInput
 */
- (BFTask *)deleteAlarms:(AWSCloudWatchDeleteAlarmsInput *)request;

/**
 * <p> Retrieves history for the specified alarm. Filter alarms by date range or item type. If an alarm name is not specified, Amazon CloudWatch returns histories for all of the owner's alarms. </p>
 *
 * @param request A container for the necessary parameters to execute the DescribeAlarmHistory service method.
 *
 * @return An instance of BFTask. On successful execution, task.result will contain an instance of AWSCloudWatchDescribeAlarmHistoryOutput. On failed execution, task.error may contain an NSError with AWSCloudWatchErrorDomain domian and the following error code: AWSCloudWatchErrorInvalidNextToken.
 *
 * @see AWSCloudWatchDescribeAlarmHistoryInput
 * @see AWSCloudWatchDescribeAlarmHistoryOutput
 */
- (BFTask *)describeAlarmHistory:(AWSCloudWatchDescribeAlarmHistoryInput *)request;

/**
 * <p> Retrieves alarms with the specified names. If no name is specified, all alarms for the user are returned. Alarms can be retrieved by using only a prefix for the alarm name, the alarm state, or a prefix for any action. </p>
 *
 * @param request A container for the necessary parameters to execute the DescribeAlarms service method.
 *
 * @return An instance of BFTask. On successful execution, task.result will contain an instance of AWSCloudWatchDescribeAlarmsOutput. On failed execution, task.error may contain an NSError with AWSCloudWatchErrorDomain domian and the following error code: AWSCloudWatchErrorInvalidNextToken.
 *
 * @see AWSCloudWatchDescribeAlarmsInput
 * @see AWSCloudWatchDescribeAlarmsOutput
 */
- (BFTask *)describeAlarms:(AWSCloudWatchDescribeAlarmsInput *)request;

/**
 * <p> Retrieves all alarms for a single metric. Specify a statistic, period, or unit to filter the set of alarms further. </p>
 *
 * @param request A container for the necessary parameters to execute the DescribeAlarmsForMetric service method.
 *
 * @return An instance of BFTask. On successful execution, task.result will contain an instance of AWSCloudWatchDescribeAlarmsForMetricOutput.
 *
 * @see AWSCloudWatchDescribeAlarmsForMetricInput
 * @see AWSCloudWatchDescribeAlarmsForMetricOutput
 */
- (BFTask *)describeAlarmsForMetric:(AWSCloudWatchDescribeAlarmsForMetricInput *)request;

/**
 * <p> Disables actions for the specified alarms. When an alarm's actions are disabled the alarm's state may change, but none of the alarm's actions will execute. </p>
 *
 * @param request A container for the necessary parameters to execute the DisableAlarmActions service method.
 *
 * @return An instance of BFTask. On successful execution, task.result will be nil.
 *
 * @see AWSCloudWatchDisableAlarmActionsInput
 */
- (BFTask *)disableAlarmActions:(AWSCloudWatchDisableAlarmActionsInput *)request;

/**
 * <p> Enables actions for the specified alarms. </p>
 *
 * @param request A container for the necessary parameters to execute the EnableAlarmActions service method.
 *
 * @return An instance of BFTask. On successful execution, task.result will be nil.
 *
 * @see AWSCloudWatchEnableAlarmActionsInput
 */
- (BFTask *)enableAlarmActions:(AWSCloudWatchEnableAlarmActionsInput *)request;

/**
 * <p> Gets statistics for the specified metric. </p><p> The maximum number of data points returned from a single <code>GetMetricStatistics</code> request is 1,440, wereas the maximum number of data points that can be queried is 50,850. If you make a request that generates more than 1,440 data points, Amazon CloudWatch returns an error. In such a case, you can alter the request by narrowing the specified time range or increasing the specified period. Alternatively, you can make multiple requests across adjacent time ranges. </p><p> Amazon CloudWatch aggregates data points based on the length of the <code>period</code> that you specify. For example, if you request statistics with a one-minute granularity, Amazon CloudWatch aggregates data points with time stamps that fall within the same one-minute period. In such a case, the data points queried can greatly outnumber the data points returned. </p><p> The following examples show various statistics allowed by the data point query maximum of 50,850 when you call <code>GetMetricStatistics</code> on Amazon EC2 instances with detailed (one-minute) monitoring enabled: </p><ul><li>Statistics for up to 400 instances for a span of one hour</li><li>Statistics for up to 35 instances over a span of 24 hours</li><li>Statistics for up to 2 instances over a span of 2 weeks</li></ul><p> For information about the namespace, metric names, and dimensions that other Amazon Web Services products use to send metrics to Cloudwatch, go to <a href="http://docs.aws.amazon.com/AmazonCloudWatch/latest/DeveloperGuide/CW_Support_For_AWS.html">Amazon CloudWatch Metrics, Namespaces, and Dimensions Reference</a> in the <i>Amazon CloudWatch Developer Guide</i>. </p>
 *
 * @param request A container for the necessary parameters to execute the GetMetricStatistics service method.
 *
 * @return An instance of BFTask. On successful execution, task.result will contain an instance of AWSCloudWatchGetMetricStatisticsOutput. On failed execution, task.error may contain an NSError with AWSCloudWatchErrorDomain domian and the following error code: AWSCloudWatchErrorInvalidParameterValue, AWSCloudWatchErrorMissingRequiredParameter, AWSCloudWatchErrorInvalidParameterCombination, AWSCloudWatchErrorInternalService.
 *
 * @see AWSCloudWatchGetMetricStatisticsInput
 * @see AWSCloudWatchGetMetricStatisticsOutput
 */
- (BFTask *)getMetricStatistics:(AWSCloudWatchGetMetricStatisticsInput *)request;

/**
 * <p> Returns a list of valid metrics stored for the AWS account owner. Returned metrics can be used with <a>GetMetricStatistics</a> to obtain statistical data for a given metric. </p>
 *
 * @param request A container for the necessary parameters to execute the ListMetrics service method.
 *
 * @return An instance of BFTask. On successful execution, task.result will contain an instance of AWSCloudWatchListMetricsOutput. On failed execution, task.error may contain an NSError with AWSCloudWatchErrorDomain domian and the following error code: AWSCloudWatchErrorInternalService, AWSCloudWatchErrorInvalidParameterValue.
 *
 * @see AWSCloudWatchListMetricsInput
 * @see AWSCloudWatchListMetricsOutput
 */
- (BFTask *)listMetrics:(AWSCloudWatchListMetricsInput *)request;

/**
 * <p> Creates or updates an alarm and associates it with the specified Amazon CloudWatch metric. Optionally, this operation can associate one or more Amazon Simple Notification Service resources with the alarm. </p><p> When this operation creates an alarm, the alarm state is immediately set to <code>INSUFFICIENT_DATA</code>. The alarm is evaluated and its <code>StateValue</code> is set appropriately. Any actions associated with the <code>StateValue</code> is then executed. </p>
 *
 * @param request A container for the necessary parameters to execute the PutMetricAlarm service method.
 *
 * @return An instance of BFTask. On successful execution, task.result will be nil. On failed execution, task.error may contain an NSError with AWSCloudWatchErrorDomain domian and the following error code: AWSCloudWatchErrorLimitExceeded.
 *
 * @see AWSCloudWatchPutMetricAlarmInput
 */
- (BFTask *)putMetricAlarm:(AWSCloudWatchPutMetricAlarmInput *)request;

/**
 * <p> Publishes metric data points to Amazon CloudWatch. Amazon Cloudwatch associates the data points with the specified metric. If the specified metric does not exist, Amazon CloudWatch creates the metric. It can take up to fifteen minutes for a new metric to appear in calls to the <a>ListMetrics</a> action.</p><p> The size of a <function>PutMetricData</function> request is limited to 8 KB for HTTP GET requests and 40 KB for HTTP POST requests. </p><important> Although the <code>Value</code> parameter accepts numbers of type <code>Double</code>, Amazon CloudWatch truncates values with very large exponents. Values with base-10 exponents greater than 126 (1 x 10^126) are truncated. Likewise, values with base-10 exponents less than -130 (1 x 10^-130) are also truncated. </important><p>Data that is timestamped 24 hours or more in the past may take in excess of 48 hours to become available from submission time using <code>GetMetricStatistics</code>.</p>
 *
 * @param request A container for the necessary parameters to execute the PutMetricData service method.
 *
 * @return An instance of BFTask. On successful execution, task.result will be nil. On failed execution, task.error may contain an NSError with AWSCloudWatchErrorDomain domian and the following error code: AWSCloudWatchErrorInvalidParameterValue, AWSCloudWatchErrorMissingRequiredParameter, AWSCloudWatchErrorInvalidParameterCombination, AWSCloudWatchErrorInternalService.
 *
 * @see AWSCloudWatchPutMetricDataInput
 */
- (BFTask *)putMetricData:(AWSCloudWatchPutMetricDataInput *)request;

/**
 * <p> Temporarily sets the state of an alarm. When the updated <code>StateValue</code> differs from the previous value, the action configured for the appropriate state is invoked. This is not a permanent change. The next periodic alarm check (in about a minute) will set the alarm to its actual state. </p>
 *
 * @param request A container for the necessary parameters to execute the SetAlarmState service method.
 *
 * @return An instance of BFTask. On successful execution, task.result will be nil. On failed execution, task.error may contain an NSError with AWSCloudWatchErrorDomain domian and the following error code: AWSCloudWatchErrorResourceNotFound, AWSCloudWatchErrorInvalidFormat.
 *
 * @see AWSCloudWatchSetAlarmStateInput
 */
- (BFTask *)setAlarmState:(AWSCloudWatchSetAlarmStateInput *)request;

@end
