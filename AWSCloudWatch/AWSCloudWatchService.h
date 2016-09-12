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
#import <AWSCore/AWSCore.h>
#import "AWSCloudWatchModel.h"
#import "AWSCloudWatchResources.h"

NS_ASSUME_NONNULL_BEGIN

/**
 <p>Amazon CloudWatch monitors your Amazon Web Services (AWS) resources and the applications you run on AWS in real-time. You can use CloudWatch to collect and track metrics, which are the variables you want to measure for your resources and applications.</p><p>CloudWatch alarms send notifications or automatically make changes to the resources you are monitoring based on rules that you define. For example, you can monitor the CPU usage and disk reads and writes of your Amazon Elastic Compute Cloud (Amazon EC2) instances and then use this data to determine whether you should launch additional instances to handle increased load. You can also use this data to stop under-used instances to save money.</p><p>In addition to monitoring the built-in metrics that come with AWS, you can monitor your own custom metrics. With CloudWatch, you gain system-wide visibility into resource utilization, application performance, and operational health.</p>
 */
@interface AWSCloudWatch : AWSService

/**
 The service configuration used to instantiate this service client.
 
 @warning Once the client is instantiated, do not modify the configuration object. It may cause unspecified behaviors.
 */
@property (nonatomic, strong, readonly) AWSServiceConfiguration *configuration;

/**
 Returns the singleton service client. If the singleton object does not exist, the SDK instantiates the default service client with `defaultServiceConfiguration` from `[AWSServiceManager defaultServiceManager]`. The reference to this object is maintained by the SDK, and you do not need to retain it manually.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`
 
 *Swift*

     func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
         let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
         let configuration = AWSServiceConfiguration(region: .USEast1, credentialsProvider: credentialProvider)
         AWSServiceManager.defaultServiceManager().defaultServiceConfiguration = configuration

         return true
     }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
          AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                          identityPoolId:@"YourIdentityPoolId"];
          AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1
                                                                               credentialsProvider:credentialsProvider];
          [AWSServiceManager defaultServiceManager].defaultServiceConfiguration = configuration;

          return YES;
      }

 Then call the following to get the default service client:

 *Swift*

     let CloudWatch = AWSCloudWatch.defaultCloudWatch()

 *Objective-C*

     AWSCloudWatch *CloudWatch = [AWSCloudWatch defaultCloudWatch];

 @return The default service client.
 */
+ (instancetype)defaultCloudWatch;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
         let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
         let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
         AWSCloudWatch.registerCloudWatchWithConfiguration(configuration, forKey: "USWest2CloudWatch")

         return true
     }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSCloudWatch registerCloudWatchWithConfiguration:configuration forKey:@"USWest2CloudWatch"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let CloudWatch = AWSCloudWatch(forKey: "USWest2CloudWatch")

 *Objective-C*

     AWSCloudWatch *CloudWatch = [AWSCloudWatch CloudWatchForKey:@"USWest2CloudWatch"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerCloudWatchWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerCloudWatchWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
         let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
         let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
         AWSCloudWatch.registerCloudWatchWithConfiguration(configuration, forKey: "USWest2CloudWatch")

         return true
     }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSCloudWatch registerCloudWatchWithConfiguration:configuration forKey:@"USWest2CloudWatch"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let CloudWatch = AWSCloudWatch(forKey: "USWest2CloudWatch")

 *Objective-C*

     AWSCloudWatch *CloudWatch = [AWSCloudWatch CloudWatchForKey:@"USWest2CloudWatch"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)CloudWatchForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removeCloudWatchForKey:(NSString *)key;

/**
 <p>Deletes all specified alarms. In the event of an error, no alarms are deleted.</p>
 
 @param request A container for the necessary parameters to execute the DeleteAlarms service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSCloudWatchErrorDomain` domain and the following error code: `AWSCloudWatchErrorResourceNotFound`.
 
 @see AWSCloudWatchDeleteAlarmsInput
 */
- (AWSTask *)deleteAlarms:(AWSCloudWatchDeleteAlarmsInput *)request;

/**
 <p>Deletes all specified alarms. In the event of an error, no alarms are deleted.</p>
 
 @param request A container for the necessary parameters to execute the DeleteAlarms service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCloudWatchErrorDomain` domain and the following error code: `AWSCloudWatchErrorResourceNotFound`.
 
 @see AWSCloudWatchDeleteAlarmsInput
 */
- (void)deleteAlarms:(AWSCloudWatchDeleteAlarmsInput *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves history for the specified alarm. Filter alarms by date range or item type. If an alarm name is not specified, Amazon CloudWatch returns histories for all of the owner's alarms.</p><note><p>Amazon CloudWatch retains the history of an alarm for two weeks, whether or not you delete the alarm.</p></note>
 
 @param request A container for the necessary parameters to execute the DescribeAlarmHistory service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCloudWatchDescribeAlarmHistoryOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCloudWatchErrorDomain` domain and the following error code: `AWSCloudWatchErrorInvalidNextToken`.
 
 @see AWSCloudWatchDescribeAlarmHistoryInput
 @see AWSCloudWatchDescribeAlarmHistoryOutput
 */
- (AWSTask<AWSCloudWatchDescribeAlarmHistoryOutput *> *)describeAlarmHistory:(AWSCloudWatchDescribeAlarmHistoryInput *)request;

/**
 <p>Retrieves history for the specified alarm. Filter alarms by date range or item type. If an alarm name is not specified, Amazon CloudWatch returns histories for all of the owner's alarms.</p><note><p>Amazon CloudWatch retains the history of an alarm for two weeks, whether or not you delete the alarm.</p></note>
 
 @param request A container for the necessary parameters to execute the DescribeAlarmHistory service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCloudWatchErrorDomain` domain and the following error code: `AWSCloudWatchErrorInvalidNextToken`.
 
 @see AWSCloudWatchDescribeAlarmHistoryInput
 @see AWSCloudWatchDescribeAlarmHistoryOutput
 */
- (void)describeAlarmHistory:(AWSCloudWatchDescribeAlarmHistoryInput *)request completionHandler:(void (^ _Nullable)(AWSCloudWatchDescribeAlarmHistoryOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves alarms with the specified names. If no name is specified, all alarms for the user are returned. Alarms can be retrieved by using only a prefix for the alarm name, the alarm state, or a prefix for any action.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAlarms service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCloudWatchDescribeAlarmsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCloudWatchErrorDomain` domain and the following error code: `AWSCloudWatchErrorInvalidNextToken`.
 
 @see AWSCloudWatchDescribeAlarmsInput
 @see AWSCloudWatchDescribeAlarmsOutput
 */
- (AWSTask<AWSCloudWatchDescribeAlarmsOutput *> *)describeAlarms:(AWSCloudWatchDescribeAlarmsInput *)request;

/**
 <p>Retrieves alarms with the specified names. If no name is specified, all alarms for the user are returned. Alarms can be retrieved by using only a prefix for the alarm name, the alarm state, or a prefix for any action.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAlarms service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCloudWatchErrorDomain` domain and the following error code: `AWSCloudWatchErrorInvalidNextToken`.
 
 @see AWSCloudWatchDescribeAlarmsInput
 @see AWSCloudWatchDescribeAlarmsOutput
 */
- (void)describeAlarms:(AWSCloudWatchDescribeAlarmsInput *)request completionHandler:(void (^ _Nullable)(AWSCloudWatchDescribeAlarmsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves all alarms for a single metric. Specify a statistic, period, or unit to filter the set of alarms further.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAlarmsForMetric service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCloudWatchDescribeAlarmsForMetricOutput`.
 
 @see AWSCloudWatchDescribeAlarmsForMetricInput
 @see AWSCloudWatchDescribeAlarmsForMetricOutput
 */
- (AWSTask<AWSCloudWatchDescribeAlarmsForMetricOutput *> *)describeAlarmsForMetric:(AWSCloudWatchDescribeAlarmsForMetricInput *)request;

/**
 <p>Retrieves all alarms for a single metric. Specify a statistic, period, or unit to filter the set of alarms further.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAlarmsForMetric service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSCloudWatchDescribeAlarmsForMetricInput
 @see AWSCloudWatchDescribeAlarmsForMetricOutput
 */
- (void)describeAlarmsForMetric:(AWSCloudWatchDescribeAlarmsForMetricInput *)request completionHandler:(void (^ _Nullable)(AWSCloudWatchDescribeAlarmsForMetricOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Disables actions for the specified alarms. When an alarm's actions are disabled the alarm's state may change, but none of the alarm's actions will execute.</p>
 
 @param request A container for the necessary parameters to execute the DisableAlarmActions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSCloudWatchDisableAlarmActionsInput
 */
- (AWSTask *)disableAlarmActions:(AWSCloudWatchDisableAlarmActionsInput *)request;

/**
 <p>Disables actions for the specified alarms. When an alarm's actions are disabled the alarm's state may change, but none of the alarm's actions will execute.</p>
 
 @param request A container for the necessary parameters to execute the DisableAlarmActions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSCloudWatchDisableAlarmActionsInput
 */
- (void)disableAlarmActions:(AWSCloudWatchDisableAlarmActionsInput *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Enables actions for the specified alarms.</p>
 
 @param request A container for the necessary parameters to execute the EnableAlarmActions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSCloudWatchEnableAlarmActionsInput
 */
- (AWSTask *)enableAlarmActions:(AWSCloudWatchEnableAlarmActionsInput *)request;

/**
 <p>Enables actions for the specified alarms.</p>
 
 @param request A container for the necessary parameters to execute the EnableAlarmActions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSCloudWatchEnableAlarmActionsInput
 */
- (void)enableAlarmActions:(AWSCloudWatchEnableAlarmActionsInput *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Gets statistics for the specified metric.</p><p> The maximum number of data points that can be queried is 50,850, whereas the maximum number of data points returned from a single <code>GetMetricStatistics</code> request is 1,440. If you make a request that generates more than 1,440 data points, Amazon CloudWatch returns an error. In such a case, you can alter the request by narrowing the specified time range or increasing the specified period. A period can be as short as one minute (60 seconds) or as long as one day (86,400 seconds). Alternatively, you can make multiple requests across adjacent time ranges. <code>GetMetricStatistics</code> does not return the data in chronological order. </p><p> Amazon CloudWatch aggregates data points based on the length of the <code>period</code> that you specify. For example, if you request statistics with a one-minute granularity, Amazon CloudWatch aggregates data points with time stamps that fall within the same one-minute period. In such a case, the data points queried can greatly outnumber the data points returned. </p><p> The following examples show various statistics allowed by the data point query maximum of 50,850 when you call <code>GetMetricStatistics</code> on Amazon EC2 instances with detailed (one-minute) monitoring enabled: </p><ul><li><p>Statistics for up to 400 instances for a span of one hour</p></li><li><p>Statistics for up to 35 instances over a span of 24 hours</p></li><li><p>Statistics for up to 2 instances over a span of 2 weeks</p></li></ul><p> For information about the namespace, metric names, and dimensions that other Amazon Web Services products use to send metrics to CloudWatch, go to <a href="http://docs.aws.amazon.com/AmazonCloudWatch/latest/DeveloperGuide/CW_Support_For_AWS.html">Amazon CloudWatch Metrics, Namespaces, and Dimensions Reference</a> in the <i>Amazon CloudWatch Developer Guide</i>. </p>
 
 @param request A container for the necessary parameters to execute the GetMetricStatistics service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCloudWatchGetMetricStatisticsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCloudWatchErrorDomain` domain and the following error code: `AWSCloudWatchErrorInvalidParameterValue`, `AWSCloudWatchErrorMissingRequiredParameter`, `AWSCloudWatchErrorInvalidParameterCombination`, `AWSCloudWatchErrorInternalService`.
 
 @see AWSCloudWatchGetMetricStatisticsInput
 @see AWSCloudWatchGetMetricStatisticsOutput
 */
- (AWSTask<AWSCloudWatchGetMetricStatisticsOutput *> *)getMetricStatistics:(AWSCloudWatchGetMetricStatisticsInput *)request;

/**
 <p>Gets statistics for the specified metric.</p><p> The maximum number of data points that can be queried is 50,850, whereas the maximum number of data points returned from a single <code>GetMetricStatistics</code> request is 1,440. If you make a request that generates more than 1,440 data points, Amazon CloudWatch returns an error. In such a case, you can alter the request by narrowing the specified time range or increasing the specified period. A period can be as short as one minute (60 seconds) or as long as one day (86,400 seconds). Alternatively, you can make multiple requests across adjacent time ranges. <code>GetMetricStatistics</code> does not return the data in chronological order. </p><p> Amazon CloudWatch aggregates data points based on the length of the <code>period</code> that you specify. For example, if you request statistics with a one-minute granularity, Amazon CloudWatch aggregates data points with time stamps that fall within the same one-minute period. In such a case, the data points queried can greatly outnumber the data points returned. </p><p> The following examples show various statistics allowed by the data point query maximum of 50,850 when you call <code>GetMetricStatistics</code> on Amazon EC2 instances with detailed (one-minute) monitoring enabled: </p><ul><li><p>Statistics for up to 400 instances for a span of one hour</p></li><li><p>Statistics for up to 35 instances over a span of 24 hours</p></li><li><p>Statistics for up to 2 instances over a span of 2 weeks</p></li></ul><p> For information about the namespace, metric names, and dimensions that other Amazon Web Services products use to send metrics to CloudWatch, go to <a href="http://docs.aws.amazon.com/AmazonCloudWatch/latest/DeveloperGuide/CW_Support_For_AWS.html">Amazon CloudWatch Metrics, Namespaces, and Dimensions Reference</a> in the <i>Amazon CloudWatch Developer Guide</i>. </p>
 
 @param request A container for the necessary parameters to execute the GetMetricStatistics service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCloudWatchErrorDomain` domain and the following error code: `AWSCloudWatchErrorInvalidParameterValue`, `AWSCloudWatchErrorMissingRequiredParameter`, `AWSCloudWatchErrorInvalidParameterCombination`, `AWSCloudWatchErrorInternalService`.
 
 @see AWSCloudWatchGetMetricStatisticsInput
 @see AWSCloudWatchGetMetricStatisticsOutput
 */
- (void)getMetricStatistics:(AWSCloudWatchGetMetricStatisticsInput *)request completionHandler:(void (^ _Nullable)(AWSCloudWatchGetMetricStatisticsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Returns a list of valid metrics stored for the AWS account owner. Returned metrics can be used with <a>GetMetricStatistics</a> to obtain statistical data for a given metric. </p><note><p> Up to 500 results are returned for any one call. To retrieve further results, use returned <code>NextToken</code> values with subsequent <code>ListMetrics</code> operations.</p></note><note><p> If you create a metric with <a>PutMetricData</a>, allow up to fifteen minutes for the metric to appear in calls to <code>ListMetrics</code>. Statistics about the metric, however, are available sooner using <a>GetMetricStatistics</a>.</p></note>
 
 @param request A container for the necessary parameters to execute the ListMetrics service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCloudWatchListMetricsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCloudWatchErrorDomain` domain and the following error code: `AWSCloudWatchErrorInternalService`, `AWSCloudWatchErrorInvalidParameterValue`.
 
 @see AWSCloudWatchListMetricsInput
 @see AWSCloudWatchListMetricsOutput
 */
- (AWSTask<AWSCloudWatchListMetricsOutput *> *)listMetrics:(AWSCloudWatchListMetricsInput *)request;

/**
 <p> Returns a list of valid metrics stored for the AWS account owner. Returned metrics can be used with <a>GetMetricStatistics</a> to obtain statistical data for a given metric. </p><note><p> Up to 500 results are returned for any one call. To retrieve further results, use returned <code>NextToken</code> values with subsequent <code>ListMetrics</code> operations.</p></note><note><p> If you create a metric with <a>PutMetricData</a>, allow up to fifteen minutes for the metric to appear in calls to <code>ListMetrics</code>. Statistics about the metric, however, are available sooner using <a>GetMetricStatistics</a>.</p></note>
 
 @param request A container for the necessary parameters to execute the ListMetrics service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCloudWatchErrorDomain` domain and the following error code: `AWSCloudWatchErrorInternalService`, `AWSCloudWatchErrorInvalidParameterValue`.
 
 @see AWSCloudWatchListMetricsInput
 @see AWSCloudWatchListMetricsOutput
 */
- (void)listMetrics:(AWSCloudWatchListMetricsInput *)request completionHandler:(void (^ _Nullable)(AWSCloudWatchListMetricsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates or updates an alarm and associates it with the specified Amazon CloudWatch metric. Optionally, this operation can associate one or more Amazon SNS resources with the alarm.</p><p> When this operation creates an alarm, the alarm state is immediately set to <code>INSUFFICIENT_DATA</code>. The alarm is evaluated and its <code>StateValue</code> is set appropriately. Any actions associated with the <code>StateValue</code> are then executed. </p><note><p>When updating an existing alarm, its <code>StateValue</code> is left unchanged, but it completely overwrites the alarm's previous configuration.</p></note><note><p>If you are using an AWS Identity and Access Management (IAM) account to create or modify an alarm, you must have the following Amazon EC2 permissions:</p><ul><li><p><code>ec2:DescribeInstanceStatus</code> and <code>ec2:DescribeInstances</code> for all alarms on Amazon EC2 instance status metrics.</p></li><li><p><code>ec2:StopInstances</code> for alarms with stop actions.</p></li><li><p><code>ec2:TerminateInstances</code> for alarms with terminate actions.</p></li><li><p><code>ec2:DescribeInstanceRecoveryAttribute</code>, and <code>ec2:RecoverInstances</code> for alarms with recover actions.</p></li></ul><p>If you have read/write permissions for Amazon CloudWatch but not for Amazon EC2, you can still create an alarm but the stop or terminate actions won't be performed on the Amazon EC2 instance. However, if you are later granted permission to use the associated Amazon EC2 APIs, the alarm actions you created earlier will be performed. For more information about IAM permissions, see <a href="http://docs.aws.amazon.com/IAM/latest/UserGuide/PermissionsAndPolicies.html">Permissions and Policies</a> in <i>Using IAM</i>.</p><p>If you are using an IAM role (e.g., an Amazon EC2 instance profile), you cannot stop or terminate the instance using alarm actions. However, you can still see the alarm state and perform any other actions such as Amazon SNS notifications or Auto Scaling policies.</p><p>If you are using temporary security credentials granted using the AWS Security Token Service (AWS STS), you cannot stop or terminate an Amazon EC2 instance using alarm actions.</p></note>
 
 @param request A container for the necessary parameters to execute the PutMetricAlarm service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSCloudWatchErrorDomain` domain and the following error code: `AWSCloudWatchErrorLimitExceeded`.
 
 @see AWSCloudWatchPutMetricAlarmInput
 */
- (AWSTask *)putMetricAlarm:(AWSCloudWatchPutMetricAlarmInput *)request;

/**
 <p>Creates or updates an alarm and associates it with the specified Amazon CloudWatch metric. Optionally, this operation can associate one or more Amazon SNS resources with the alarm.</p><p> When this operation creates an alarm, the alarm state is immediately set to <code>INSUFFICIENT_DATA</code>. The alarm is evaluated and its <code>StateValue</code> is set appropriately. Any actions associated with the <code>StateValue</code> are then executed. </p><note><p>When updating an existing alarm, its <code>StateValue</code> is left unchanged, but it completely overwrites the alarm's previous configuration.</p></note><note><p>If you are using an AWS Identity and Access Management (IAM) account to create or modify an alarm, you must have the following Amazon EC2 permissions:</p><ul><li><p><code>ec2:DescribeInstanceStatus</code> and <code>ec2:DescribeInstances</code> for all alarms on Amazon EC2 instance status metrics.</p></li><li><p><code>ec2:StopInstances</code> for alarms with stop actions.</p></li><li><p><code>ec2:TerminateInstances</code> for alarms with terminate actions.</p></li><li><p><code>ec2:DescribeInstanceRecoveryAttribute</code>, and <code>ec2:RecoverInstances</code> for alarms with recover actions.</p></li></ul><p>If you have read/write permissions for Amazon CloudWatch but not for Amazon EC2, you can still create an alarm but the stop or terminate actions won't be performed on the Amazon EC2 instance. However, if you are later granted permission to use the associated Amazon EC2 APIs, the alarm actions you created earlier will be performed. For more information about IAM permissions, see <a href="http://docs.aws.amazon.com/IAM/latest/UserGuide/PermissionsAndPolicies.html">Permissions and Policies</a> in <i>Using IAM</i>.</p><p>If you are using an IAM role (e.g., an Amazon EC2 instance profile), you cannot stop or terminate the instance using alarm actions. However, you can still see the alarm state and perform any other actions such as Amazon SNS notifications or Auto Scaling policies.</p><p>If you are using temporary security credentials granted using the AWS Security Token Service (AWS STS), you cannot stop or terminate an Amazon EC2 instance using alarm actions.</p></note>
 
 @param request A container for the necessary parameters to execute the PutMetricAlarm service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCloudWatchErrorDomain` domain and the following error code: `AWSCloudWatchErrorLimitExceeded`.
 
 @see AWSCloudWatchPutMetricAlarmInput
 */
- (void)putMetricAlarm:(AWSCloudWatchPutMetricAlarmInput *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p> Publishes metric data points to Amazon CloudWatch. Amazon CloudWatch associates the data points with the specified metric. If the specified metric does not exist, Amazon CloudWatch creates the metric. When Amazon CloudWatch creates a metric, it can take up to fifteen minutes for the metric to appear in calls to <a>ListMetrics</a>. </p><p> Each <code>PutMetricData</code> request is limited to 8 KB in size for HTTP GET requests and is limited to 40 KB in size for HTTP POST requests. </p><important><p>Although the <code>Value</code> parameter accepts numbers of type <code>Double</code>, Amazon CloudWatch rejects values that are either too small or too large. Values must be in the range of 8.515920e-109 to 1.174271e+108 (Base 10) or 2e-360 to 2e360 (Base 2). In addition, special values (e.g., NaN, +Infinity, -Infinity) are not supported.</p></important><p>Data that is timestamped 24 hours or more in the past may take in excess of 48 hours to become available from submission time using <code>GetMetricStatistics</code>.</p>
 
 @param request A container for the necessary parameters to execute the PutMetricData service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSCloudWatchErrorDomain` domain and the following error code: `AWSCloudWatchErrorInvalidParameterValue`, `AWSCloudWatchErrorMissingRequiredParameter`, `AWSCloudWatchErrorInvalidParameterCombination`, `AWSCloudWatchErrorInternalService`.
 
 @see AWSCloudWatchPutMetricDataInput
 */
- (AWSTask *)putMetricData:(AWSCloudWatchPutMetricDataInput *)request;

/**
 <p> Publishes metric data points to Amazon CloudWatch. Amazon CloudWatch associates the data points with the specified metric. If the specified metric does not exist, Amazon CloudWatch creates the metric. When Amazon CloudWatch creates a metric, it can take up to fifteen minutes for the metric to appear in calls to <a>ListMetrics</a>. </p><p> Each <code>PutMetricData</code> request is limited to 8 KB in size for HTTP GET requests and is limited to 40 KB in size for HTTP POST requests. </p><important><p>Although the <code>Value</code> parameter accepts numbers of type <code>Double</code>, Amazon CloudWatch rejects values that are either too small or too large. Values must be in the range of 8.515920e-109 to 1.174271e+108 (Base 10) or 2e-360 to 2e360 (Base 2). In addition, special values (e.g., NaN, +Infinity, -Infinity) are not supported.</p></important><p>Data that is timestamped 24 hours or more in the past may take in excess of 48 hours to become available from submission time using <code>GetMetricStatistics</code>.</p>
 
 @param request A container for the necessary parameters to execute the PutMetricData service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCloudWatchErrorDomain` domain and the following error code: `AWSCloudWatchErrorInvalidParameterValue`, `AWSCloudWatchErrorMissingRequiredParameter`, `AWSCloudWatchErrorInvalidParameterCombination`, `AWSCloudWatchErrorInternalService`.
 
 @see AWSCloudWatchPutMetricDataInput
 */
- (void)putMetricData:(AWSCloudWatchPutMetricDataInput *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p> Temporarily sets the state of an alarm for testing purposes. When the updated <code>StateValue</code> differs from the previous value, the action configured for the appropriate state is invoked. For example, if your alarm is configured to send an Amazon SNS message when an alarm is triggered, temporarily changing the alarm's state to <b>ALARM</b> sends an Amazon SNS message. The alarm returns to its actual state (often within seconds). Because the alarm state change happens very quickly, it is typically only visible in the alarm's <b>History</b> tab in the Amazon CloudWatch console or through <code>DescribeAlarmHistory</code>. </p>
 
 @param request A container for the necessary parameters to execute the SetAlarmState service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSCloudWatchErrorDomain` domain and the following error code: `AWSCloudWatchErrorResourceNotFound`, `AWSCloudWatchErrorInvalidFormat`.
 
 @see AWSCloudWatchSetAlarmStateInput
 */
- (AWSTask *)setAlarmState:(AWSCloudWatchSetAlarmStateInput *)request;

/**
 <p> Temporarily sets the state of an alarm for testing purposes. When the updated <code>StateValue</code> differs from the previous value, the action configured for the appropriate state is invoked. For example, if your alarm is configured to send an Amazon SNS message when an alarm is triggered, temporarily changing the alarm's state to <b>ALARM</b> sends an Amazon SNS message. The alarm returns to its actual state (often within seconds). Because the alarm state change happens very quickly, it is typically only visible in the alarm's <b>History</b> tab in the Amazon CloudWatch console or through <code>DescribeAlarmHistory</code>. </p>
 
 @param request A container for the necessary parameters to execute the SetAlarmState service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCloudWatchErrorDomain` domain and the following error code: `AWSCloudWatchErrorResourceNotFound`, `AWSCloudWatchErrorInvalidFormat`.
 
 @see AWSCloudWatchSetAlarmStateInput
 */
- (void)setAlarmState:(AWSCloudWatchSetAlarmStateInput *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
