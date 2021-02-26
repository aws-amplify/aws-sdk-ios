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
#import <AWSCore/AWSCore.h>
#import "AWSCloudWatchModel.h"
#import "AWSCloudWatchResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSCloudWatch
FOUNDATION_EXPORT NSString *const AWSCloudWatchSDKVersion;

/**
 <p>Amazon CloudWatch monitors your Amazon Web Services (AWS) resources and the applications you run on AWS in real time. You can use CloudWatch to collect and track metrics, which are the variables you want to measure for your resources and applications.</p><p>CloudWatch alarms send notifications or automatically change the resources you are monitoring based on rules that you define. For example, you can monitor the CPU usage and disk reads and writes of your Amazon EC2 instances. Then, use this data to determine whether you should launch additional instances to handle increased load. You can also use this data to stop under-used instances to save money.</p><p>In addition to monitoring the built-in metrics that come with AWS, you can monitor your own custom metrics. With CloudWatch, you gain system-wide visibility into resource utilization, application performance, and operational health.</p>
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

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USEast1, credentialsProvider: credentialProvider)
        AWSServiceManager.default().defaultServiceConfiguration = configuration
 
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

     let CloudWatch = AWSCloudWatch.default()

 *Objective-C*

     AWSCloudWatch *CloudWatch = [AWSCloudWatch defaultCloudWatch];

 @return The default service client.
 */
+ (instancetype)defaultCloudWatch;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSCloudWatch.register(with: configuration!, forKey: "USWest2CloudWatch")
 
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

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSCloudWatch.register(with: configuration!, forKey: "USWest2CloudWatch")
 
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
 <p>Deletes the specified alarms. In the event of an error, no alarms are deleted.</p>
 
 @param request A container for the necessary parameters to execute the DeleteAlarms service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSCloudWatchErrorDomain` domain and the following error code: `AWSCloudWatchErrorResourceNotFound`.
 
 @see AWSCloudWatchDeleteAlarmsInput
 */
- (AWSTask *)deleteAlarms:(AWSCloudWatchDeleteAlarmsInput *)request;

/**
 <p>Deletes the specified alarms. In the event of an error, no alarms are deleted.</p>
 
 @param request A container for the necessary parameters to execute the DeleteAlarms service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCloudWatchErrorDomain` domain and the following error code: `AWSCloudWatchErrorResourceNotFound`.
 
 @see AWSCloudWatchDeleteAlarmsInput
 */
- (void)deleteAlarms:(AWSCloudWatchDeleteAlarmsInput *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes all dashboards that you specify. You may specify up to 100 dashboards to delete. If there is an error during this call, no dashboards are deleted.</p>
 
 @param request A container for the necessary parameters to execute the DeleteDashboards service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCloudWatchDeleteDashboardsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCloudWatchErrorDomain` domain and the following error code: `AWSCloudWatchErrorInvalidParameterValue`, `AWSCloudWatchErrorDashboardNotFound`, `AWSCloudWatchErrorInternalService`.
 
 @see AWSCloudWatchDeleteDashboardsInput
 @see AWSCloudWatchDeleteDashboardsOutput
 */
- (AWSTask<AWSCloudWatchDeleteDashboardsOutput *> *)deleteDashboards:(AWSCloudWatchDeleteDashboardsInput *)request;

/**
 <p>Deletes all dashboards that you specify. You may specify up to 100 dashboards to delete. If there is an error during this call, no dashboards are deleted.</p>
 
 @param request A container for the necessary parameters to execute the DeleteDashboards service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCloudWatchErrorDomain` domain and the following error code: `AWSCloudWatchErrorInvalidParameterValue`, `AWSCloudWatchErrorDashboardNotFound`, `AWSCloudWatchErrorInternalService`.
 
 @see AWSCloudWatchDeleteDashboardsInput
 @see AWSCloudWatchDeleteDashboardsOutput
 */
- (void)deleteDashboards:(AWSCloudWatchDeleteDashboardsInput *)request completionHandler:(void (^ _Nullable)(AWSCloudWatchDeleteDashboardsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the history for the specified alarm. You can filter the results by date range or item type. If an alarm name is not specified, the histories for all alarms are returned.</p><p>CloudWatch retains the history of an alarm even if you delete the alarm.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAlarmHistory service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCloudWatchDescribeAlarmHistoryOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCloudWatchErrorDomain` domain and the following error code: `AWSCloudWatchErrorInvalidNextToken`.
 
 @see AWSCloudWatchDescribeAlarmHistoryInput
 @see AWSCloudWatchDescribeAlarmHistoryOutput
 */
- (AWSTask<AWSCloudWatchDescribeAlarmHistoryOutput *> *)describeAlarmHistory:(AWSCloudWatchDescribeAlarmHistoryInput *)request;

/**
 <p>Retrieves the history for the specified alarm. You can filter the results by date range or item type. If an alarm name is not specified, the histories for all alarms are returned.</p><p>CloudWatch retains the history of an alarm even if you delete the alarm.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAlarmHistory service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCloudWatchErrorDomain` domain and the following error code: `AWSCloudWatchErrorInvalidNextToken`.
 
 @see AWSCloudWatchDescribeAlarmHistoryInput
 @see AWSCloudWatchDescribeAlarmHistoryOutput
 */
- (void)describeAlarmHistory:(AWSCloudWatchDescribeAlarmHistoryInput *)request completionHandler:(void (^ _Nullable)(AWSCloudWatchDescribeAlarmHistoryOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the specified alarms. If no alarms are specified, all alarms are returned. Alarms can be retrieved by using only a prefix for the alarm name, the alarm state, or a prefix for any action.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAlarms service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCloudWatchDescribeAlarmsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCloudWatchErrorDomain` domain and the following error code: `AWSCloudWatchErrorInvalidNextToken`.
 
 @see AWSCloudWatchDescribeAlarmsInput
 @see AWSCloudWatchDescribeAlarmsOutput
 */
- (AWSTask<AWSCloudWatchDescribeAlarmsOutput *> *)describeAlarms:(AWSCloudWatchDescribeAlarmsInput *)request;

/**
 <p>Retrieves the specified alarms. If no alarms are specified, all alarms are returned. Alarms can be retrieved by using only a prefix for the alarm name, the alarm state, or a prefix for any action.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAlarms service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCloudWatchErrorDomain` domain and the following error code: `AWSCloudWatchErrorInvalidNextToken`.
 
 @see AWSCloudWatchDescribeAlarmsInput
 @see AWSCloudWatchDescribeAlarmsOutput
 */
- (void)describeAlarms:(AWSCloudWatchDescribeAlarmsInput *)request completionHandler:(void (^ _Nullable)(AWSCloudWatchDescribeAlarmsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the alarms for the specified metric. To filter the results, specify a statistic, period, or unit.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAlarmsForMetric service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCloudWatchDescribeAlarmsForMetricOutput`.
 
 @see AWSCloudWatchDescribeAlarmsForMetricInput
 @see AWSCloudWatchDescribeAlarmsForMetricOutput
 */
- (AWSTask<AWSCloudWatchDescribeAlarmsForMetricOutput *> *)describeAlarmsForMetric:(AWSCloudWatchDescribeAlarmsForMetricInput *)request;

/**
 <p>Retrieves the alarms for the specified metric. To filter the results, specify a statistic, period, or unit.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAlarmsForMetric service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSCloudWatchDescribeAlarmsForMetricInput
 @see AWSCloudWatchDescribeAlarmsForMetricOutput
 */
- (void)describeAlarmsForMetric:(AWSCloudWatchDescribeAlarmsForMetricInput *)request completionHandler:(void (^ _Nullable)(AWSCloudWatchDescribeAlarmsForMetricOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Disables the actions for the specified alarms. When an alarm's actions are disabled, the alarm actions do not execute when the alarm state changes.</p>
 
 @param request A container for the necessary parameters to execute the DisableAlarmActions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSCloudWatchDisableAlarmActionsInput
 */
- (AWSTask *)disableAlarmActions:(AWSCloudWatchDisableAlarmActionsInput *)request;

/**
 <p>Disables the actions for the specified alarms. When an alarm's actions are disabled, the alarm actions do not execute when the alarm state changes.</p>
 
 @param request A container for the necessary parameters to execute the DisableAlarmActions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSCloudWatchDisableAlarmActionsInput
 */
- (void)disableAlarmActions:(AWSCloudWatchDisableAlarmActionsInput *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Enables the actions for the specified alarms.</p>
 
 @param request A container for the necessary parameters to execute the EnableAlarmActions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSCloudWatchEnableAlarmActionsInput
 */
- (AWSTask *)enableAlarmActions:(AWSCloudWatchEnableAlarmActionsInput *)request;

/**
 <p>Enables the actions for the specified alarms.</p>
 
 @param request A container for the necessary parameters to execute the EnableAlarmActions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSCloudWatchEnableAlarmActionsInput
 */
- (void)enableAlarmActions:(AWSCloudWatchEnableAlarmActionsInput *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Displays the details of the dashboard that you specify.</p><p>To copy an existing dashboard, use <code>GetDashboard</code>, and then use the data returned within <code>DashboardBody</code> as the template for the new dashboard when you call <code>PutDashboard</code> to create the copy.</p>
 
 @param request A container for the necessary parameters to execute the GetDashboard service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCloudWatchGetDashboardOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCloudWatchErrorDomain` domain and the following error code: `AWSCloudWatchErrorInvalidParameterValue`, `AWSCloudWatchErrorDashboardNotFound`, `AWSCloudWatchErrorInternalService`.
 
 @see AWSCloudWatchGetDashboardInput
 @see AWSCloudWatchGetDashboardOutput
 */
- (AWSTask<AWSCloudWatchGetDashboardOutput *> *)getDashboard:(AWSCloudWatchGetDashboardInput *)request;

/**
 <p>Displays the details of the dashboard that you specify.</p><p>To copy an existing dashboard, use <code>GetDashboard</code>, and then use the data returned within <code>DashboardBody</code> as the template for the new dashboard when you call <code>PutDashboard</code> to create the copy.</p>
 
 @param request A container for the necessary parameters to execute the GetDashboard service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCloudWatchErrorDomain` domain and the following error code: `AWSCloudWatchErrorInvalidParameterValue`, `AWSCloudWatchErrorDashboardNotFound`, `AWSCloudWatchErrorInternalService`.
 
 @see AWSCloudWatchGetDashboardInput
 @see AWSCloudWatchGetDashboardOutput
 */
- (void)getDashboard:(AWSCloudWatchGetDashboardInput *)request completionHandler:(void (^ _Nullable)(AWSCloudWatchGetDashboardOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>You can use the <code>GetMetricData</code> API to retrieve as many as 100 different metrics in a single request, with a total of as many as 100,800 datapoints. You can also optionally perform math expressions on the values of the returned statistics, to create new time series that represent new insights into your data. For example, using Lambda metrics, you could divide the Errors metric by the Invocations metric to get an error rate time series. For more information about metric math expressions, see <a href="http://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/using-metric-math.html#metric-math-syntax">Metric Math Syntax and Functions</a> in the <i>Amazon CloudWatch User Guide</i>.</p><p>Calls to the <code>GetMetricData</code> API have a different pricing structure than calls to <code>GetMetricStatistics</code>. For more information about pricing, see <a href="https://aws.amazon.com/cloudwatch/pricing/">Amazon CloudWatch Pricing</a>.</p><p>Amazon CloudWatch retains metric data as follows:</p><ul><li><p>Data points with a period of less than 60 seconds are available for 3 hours. These data points are high-resolution metrics and are available only for custom metrics that have been defined with a <code>StorageResolution</code> of 1.</p></li><li><p>Data points with a period of 60 seconds (1-minute) are available for 15 days.</p></li><li><p>Data points with a period of 300 seconds (5-minute) are available for 63 days.</p></li><li><p>Data points with a period of 3600 seconds (1 hour) are available for 455 days (15 months).</p></li></ul><p>Data points that are initially published with a shorter period are aggregated together for long-term storage. For example, if you collect data using a period of 1 minute, the data remains available for 15 days with 1-minute resolution. After 15 days, this data is still available, but is aggregated and retrievable only with a resolution of 5 minutes. After 63 days, the data is further aggregated and is available with a resolution of 1 hour.</p>
 
 @param request A container for the necessary parameters to execute the GetMetricData service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCloudWatchGetMetricDataOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCloudWatchErrorDomain` domain and the following error code: `AWSCloudWatchErrorInvalidNextToken`.
 
 @see AWSCloudWatchGetMetricDataInput
 @see AWSCloudWatchGetMetricDataOutput
 */
- (AWSTask<AWSCloudWatchGetMetricDataOutput *> *)getMetricData:(AWSCloudWatchGetMetricDataInput *)request;

/**
 <p>You can use the <code>GetMetricData</code> API to retrieve as many as 100 different metrics in a single request, with a total of as many as 100,800 datapoints. You can also optionally perform math expressions on the values of the returned statistics, to create new time series that represent new insights into your data. For example, using Lambda metrics, you could divide the Errors metric by the Invocations metric to get an error rate time series. For more information about metric math expressions, see <a href="http://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/using-metric-math.html#metric-math-syntax">Metric Math Syntax and Functions</a> in the <i>Amazon CloudWatch User Guide</i>.</p><p>Calls to the <code>GetMetricData</code> API have a different pricing structure than calls to <code>GetMetricStatistics</code>. For more information about pricing, see <a href="https://aws.amazon.com/cloudwatch/pricing/">Amazon CloudWatch Pricing</a>.</p><p>Amazon CloudWatch retains metric data as follows:</p><ul><li><p>Data points with a period of less than 60 seconds are available for 3 hours. These data points are high-resolution metrics and are available only for custom metrics that have been defined with a <code>StorageResolution</code> of 1.</p></li><li><p>Data points with a period of 60 seconds (1-minute) are available for 15 days.</p></li><li><p>Data points with a period of 300 seconds (5-minute) are available for 63 days.</p></li><li><p>Data points with a period of 3600 seconds (1 hour) are available for 455 days (15 months).</p></li></ul><p>Data points that are initially published with a shorter period are aggregated together for long-term storage. For example, if you collect data using a period of 1 minute, the data remains available for 15 days with 1-minute resolution. After 15 days, this data is still available, but is aggregated and retrievable only with a resolution of 5 minutes. After 63 days, the data is further aggregated and is available with a resolution of 1 hour.</p>
 
 @param request A container for the necessary parameters to execute the GetMetricData service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCloudWatchErrorDomain` domain and the following error code: `AWSCloudWatchErrorInvalidNextToken`.
 
 @see AWSCloudWatchGetMetricDataInput
 @see AWSCloudWatchGetMetricDataOutput
 */
- (void)getMetricData:(AWSCloudWatchGetMetricDataInput *)request completionHandler:(void (^ _Nullable)(AWSCloudWatchGetMetricDataOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets statistics for the specified metric.</p><p>The maximum number of data points returned from a single call is 1,440. If you request more than 1,440 data points, CloudWatch returns an error. To reduce the number of data points, you can narrow the specified time range and make multiple requests across adjacent time ranges, or you can increase the specified period. Data points are not returned in chronological order.</p><p>CloudWatch aggregates data points based on the length of the period that you specify. For example, if you request statistics with a one-hour period, CloudWatch aggregates all data points with time stamps that fall within each one-hour period. Therefore, the number of values aggregated by CloudWatch is larger than the number of data points returned.</p><p>CloudWatch needs raw data points to calculate percentile statistics. If you publish data using a statistic set instead, you can only retrieve percentile statistics for this data if one of the following conditions is true:</p><ul><li><p>The SampleCount value of the statistic set is 1.</p></li><li><p>The Min and the Max values of the statistic set are equal.</p></li></ul><p>Percentile statistics are not available for metrics when any of the metric values are negative numbers.</p><p>Amazon CloudWatch retains metric data as follows:</p><ul><li><p>Data points with a period of less than 60 seconds are available for 3 hours. These data points are high-resolution metrics and are available only for custom metrics that have been defined with a <code>StorageResolution</code> of 1.</p></li><li><p>Data points with a period of 60 seconds (1-minute) are available for 15 days.</p></li><li><p>Data points with a period of 300 seconds (5-minute) are available for 63 days.</p></li><li><p>Data points with a period of 3600 seconds (1 hour) are available for 455 days (15 months).</p></li></ul><p>Data points that are initially published with a shorter period are aggregated together for long-term storage. For example, if you collect data using a period of 1 minute, the data remains available for 15 days with 1-minute resolution. After 15 days, this data is still available, but is aggregated and retrievable only with a resolution of 5 minutes. After 63 days, the data is further aggregated and is available with a resolution of 1 hour.</p><p>CloudWatch started retaining 5-minute and 1-hour metric data as of July 9, 2016.</p><p>For information about metrics and dimensions supported by AWS services, see the <a href="http://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CW_Support_For_AWS.html">Amazon CloudWatch Metrics and Dimensions Reference</a> in the <i>Amazon CloudWatch User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the GetMetricStatistics service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCloudWatchGetMetricStatisticsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCloudWatchErrorDomain` domain and the following error code: `AWSCloudWatchErrorInvalidParameterValue`, `AWSCloudWatchErrorMissingRequiredParameter`, `AWSCloudWatchErrorInvalidParameterCombination`, `AWSCloudWatchErrorInternalService`.
 
 @see AWSCloudWatchGetMetricStatisticsInput
 @see AWSCloudWatchGetMetricStatisticsOutput
 */
- (AWSTask<AWSCloudWatchGetMetricStatisticsOutput *> *)getMetricStatistics:(AWSCloudWatchGetMetricStatisticsInput *)request;

/**
 <p>Gets statistics for the specified metric.</p><p>The maximum number of data points returned from a single call is 1,440. If you request more than 1,440 data points, CloudWatch returns an error. To reduce the number of data points, you can narrow the specified time range and make multiple requests across adjacent time ranges, or you can increase the specified period. Data points are not returned in chronological order.</p><p>CloudWatch aggregates data points based on the length of the period that you specify. For example, if you request statistics with a one-hour period, CloudWatch aggregates all data points with time stamps that fall within each one-hour period. Therefore, the number of values aggregated by CloudWatch is larger than the number of data points returned.</p><p>CloudWatch needs raw data points to calculate percentile statistics. If you publish data using a statistic set instead, you can only retrieve percentile statistics for this data if one of the following conditions is true:</p><ul><li><p>The SampleCount value of the statistic set is 1.</p></li><li><p>The Min and the Max values of the statistic set are equal.</p></li></ul><p>Percentile statistics are not available for metrics when any of the metric values are negative numbers.</p><p>Amazon CloudWatch retains metric data as follows:</p><ul><li><p>Data points with a period of less than 60 seconds are available for 3 hours. These data points are high-resolution metrics and are available only for custom metrics that have been defined with a <code>StorageResolution</code> of 1.</p></li><li><p>Data points with a period of 60 seconds (1-minute) are available for 15 days.</p></li><li><p>Data points with a period of 300 seconds (5-minute) are available for 63 days.</p></li><li><p>Data points with a period of 3600 seconds (1 hour) are available for 455 days (15 months).</p></li></ul><p>Data points that are initially published with a shorter period are aggregated together for long-term storage. For example, if you collect data using a period of 1 minute, the data remains available for 15 days with 1-minute resolution. After 15 days, this data is still available, but is aggregated and retrievable only with a resolution of 5 minutes. After 63 days, the data is further aggregated and is available with a resolution of 1 hour.</p><p>CloudWatch started retaining 5-minute and 1-hour metric data as of July 9, 2016.</p><p>For information about metrics and dimensions supported by AWS services, see the <a href="http://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CW_Support_For_AWS.html">Amazon CloudWatch Metrics and Dimensions Reference</a> in the <i>Amazon CloudWatch User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the GetMetricStatistics service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCloudWatchErrorDomain` domain and the following error code: `AWSCloudWatchErrorInvalidParameterValue`, `AWSCloudWatchErrorMissingRequiredParameter`, `AWSCloudWatchErrorInvalidParameterCombination`, `AWSCloudWatchErrorInternalService`.
 
 @see AWSCloudWatchGetMetricStatisticsInput
 @see AWSCloudWatchGetMetricStatisticsOutput
 */
- (void)getMetricStatistics:(AWSCloudWatchGetMetricStatisticsInput *)request completionHandler:(void (^ _Nullable)(AWSCloudWatchGetMetricStatisticsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>You can use the <code>GetMetricWidgetImage</code> API to retrieve a snapshot graph of one or more Amazon CloudWatch metrics as a bitmap image. You can then embed this image into your services and products, such as wiki pages, reports, and documents. You could also retrieve images regularly, such as every minute, and create your own custom live dashboard.</p><p>The graph you retrieve can include all CloudWatch metric graph features, including metric math and horizontal and vertical annotations.</p><p>There is a limit of 20 transactions per second for this API. Each <code>GetMetricWidgetImage</code> action has the following limits:</p><ul><li><p>As many as 100 metrics in the graph.</p></li><li><p>Up to 100 KB uncompressed payload.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the GetMetricWidgetImage service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCloudWatchGetMetricWidgetImageOutput`.
 
 @see AWSCloudWatchGetMetricWidgetImageInput
 @see AWSCloudWatchGetMetricWidgetImageOutput
 */
- (AWSTask<AWSCloudWatchGetMetricWidgetImageOutput *> *)getMetricWidgetImage:(AWSCloudWatchGetMetricWidgetImageInput *)request;

/**
 <p>You can use the <code>GetMetricWidgetImage</code> API to retrieve a snapshot graph of one or more Amazon CloudWatch metrics as a bitmap image. You can then embed this image into your services and products, such as wiki pages, reports, and documents. You could also retrieve images regularly, such as every minute, and create your own custom live dashboard.</p><p>The graph you retrieve can include all CloudWatch metric graph features, including metric math and horizontal and vertical annotations.</p><p>There is a limit of 20 transactions per second for this API. Each <code>GetMetricWidgetImage</code> action has the following limits:</p><ul><li><p>As many as 100 metrics in the graph.</p></li><li><p>Up to 100 KB uncompressed payload.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the GetMetricWidgetImage service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSCloudWatchGetMetricWidgetImageInput
 @see AWSCloudWatchGetMetricWidgetImageOutput
 */
- (void)getMetricWidgetImage:(AWSCloudWatchGetMetricWidgetImageInput *)request completionHandler:(void (^ _Nullable)(AWSCloudWatchGetMetricWidgetImageOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of the dashboards for your account. If you include <code>DashboardNamePrefix</code>, only those dashboards with names starting with the prefix are listed. Otherwise, all dashboards in your account are listed. </p><p><code>ListDashboards</code> returns up to 1000 results on one page. If there are more than 1000 dashboards, you can call <code>ListDashboards</code> again and include the value you received for <code>NextToken</code> in the first call, to receive the next 1000 results.</p>
 
 @param request A container for the necessary parameters to execute the ListDashboards service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCloudWatchListDashboardsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCloudWatchErrorDomain` domain and the following error code: `AWSCloudWatchErrorInvalidParameterValue`, `AWSCloudWatchErrorInternalService`.
 
 @see AWSCloudWatchListDashboardsInput
 @see AWSCloudWatchListDashboardsOutput
 */
- (AWSTask<AWSCloudWatchListDashboardsOutput *> *)listDashboards:(AWSCloudWatchListDashboardsInput *)request;

/**
 <p>Returns a list of the dashboards for your account. If you include <code>DashboardNamePrefix</code>, only those dashboards with names starting with the prefix are listed. Otherwise, all dashboards in your account are listed. </p><p><code>ListDashboards</code> returns up to 1000 results on one page. If there are more than 1000 dashboards, you can call <code>ListDashboards</code> again and include the value you received for <code>NextToken</code> in the first call, to receive the next 1000 results.</p>
 
 @param request A container for the necessary parameters to execute the ListDashboards service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCloudWatchErrorDomain` domain and the following error code: `AWSCloudWatchErrorInvalidParameterValue`, `AWSCloudWatchErrorInternalService`.
 
 @see AWSCloudWatchListDashboardsInput
 @see AWSCloudWatchListDashboardsOutput
 */
- (void)listDashboards:(AWSCloudWatchListDashboardsInput *)request completionHandler:(void (^ _Nullable)(AWSCloudWatchListDashboardsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>List the specified metrics. You can use the returned metrics with <a>GetMetricData</a> or <a>GetMetricStatistics</a> to obtain statistical data.</p><p>Up to 500 results are returned for any one call. To retrieve additional results, use the returned token with subsequent calls.</p><p>After you create a metric, allow up to fifteen minutes before the metric appears. Statistics about the metric, however, are available sooner using <a>GetMetricData</a> or <a>GetMetricStatistics</a>.</p>
 
 @param request A container for the necessary parameters to execute the ListMetrics service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCloudWatchListMetricsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCloudWatchErrorDomain` domain and the following error code: `AWSCloudWatchErrorInternalService`, `AWSCloudWatchErrorInvalidParameterValue`.
 
 @see AWSCloudWatchListMetricsInput
 @see AWSCloudWatchListMetricsOutput
 */
- (AWSTask<AWSCloudWatchListMetricsOutput *> *)listMetrics:(AWSCloudWatchListMetricsInput *)request;

/**
 <p>List the specified metrics. You can use the returned metrics with <a>GetMetricData</a> or <a>GetMetricStatistics</a> to obtain statistical data.</p><p>Up to 500 results are returned for any one call. To retrieve additional results, use the returned token with subsequent calls.</p><p>After you create a metric, allow up to fifteen minutes before the metric appears. Statistics about the metric, however, are available sooner using <a>GetMetricData</a> or <a>GetMetricStatistics</a>.</p>
 
 @param request A container for the necessary parameters to execute the ListMetrics service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCloudWatchErrorDomain` domain and the following error code: `AWSCloudWatchErrorInternalService`, `AWSCloudWatchErrorInvalidParameterValue`.
 
 @see AWSCloudWatchListMetricsInput
 @see AWSCloudWatchListMetricsOutput
 */
- (void)listMetrics:(AWSCloudWatchListMetricsInput *)request completionHandler:(void (^ _Nullable)(AWSCloudWatchListMetricsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a dashboard if it does not already exist, or updates an existing dashboard. If you update a dashboard, the entire contents are replaced with what you specify here.</p><p>There is no limit to the number of dashboards in your account. All dashboards in your account are global, not region-specific.</p><p>A simple way to create a dashboard using <code>PutDashboard</code> is to copy an existing dashboard. To copy an existing dashboard using the console, you can load the dashboard and then use the View/edit source command in the Actions menu to display the JSON block for that dashboard. Another way to copy a dashboard is to use <code>GetDashboard</code>, and then use the data returned within <code>DashboardBody</code> as the template for the new dashboard when you call <code>PutDashboard</code>.</p><p>When you create a dashboard with <code>PutDashboard</code>, a good practice is to add a text widget at the top of the dashboard with a message that the dashboard was created by script and should not be changed in the console. This message could also point console users to the location of the <code>DashboardBody</code> script or the CloudFormation template used to create the dashboard.</p>
 
 @param request A container for the necessary parameters to execute the PutDashboard service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCloudWatchPutDashboardOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCloudWatchErrorDomain` domain and the following error code: `AWSCloudWatchErrorDashboardInvalidInput`, `AWSCloudWatchErrorInternalService`.
 
 @see AWSCloudWatchPutDashboardInput
 @see AWSCloudWatchPutDashboardOutput
 */
- (AWSTask<AWSCloudWatchPutDashboardOutput *> *)putDashboard:(AWSCloudWatchPutDashboardInput *)request;

/**
 <p>Creates a dashboard if it does not already exist, or updates an existing dashboard. If you update a dashboard, the entire contents are replaced with what you specify here.</p><p>There is no limit to the number of dashboards in your account. All dashboards in your account are global, not region-specific.</p><p>A simple way to create a dashboard using <code>PutDashboard</code> is to copy an existing dashboard. To copy an existing dashboard using the console, you can load the dashboard and then use the View/edit source command in the Actions menu to display the JSON block for that dashboard. Another way to copy a dashboard is to use <code>GetDashboard</code>, and then use the data returned within <code>DashboardBody</code> as the template for the new dashboard when you call <code>PutDashboard</code>.</p><p>When you create a dashboard with <code>PutDashboard</code>, a good practice is to add a text widget at the top of the dashboard with a message that the dashboard was created by script and should not be changed in the console. This message could also point console users to the location of the <code>DashboardBody</code> script or the CloudFormation template used to create the dashboard.</p>
 
 @param request A container for the necessary parameters to execute the PutDashboard service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCloudWatchErrorDomain` domain and the following error code: `AWSCloudWatchErrorDashboardInvalidInput`, `AWSCloudWatchErrorInternalService`.
 
 @see AWSCloudWatchPutDashboardInput
 @see AWSCloudWatchPutDashboardOutput
 */
- (void)putDashboard:(AWSCloudWatchPutDashboardInput *)request completionHandler:(void (^ _Nullable)(AWSCloudWatchPutDashboardOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates or updates an alarm and associates it with the specified metric or metric math expression.</p><p>When this operation creates an alarm, the alarm state is immediately set to <code>INSUFFICIENT_DATA</code>. The alarm is then evaluated and its state is set appropriately. Any actions associated with the new state are then executed.</p><p>When you update an existing alarm, its state is left unchanged, but the update completely overwrites the previous configuration of the alarm.</p><p>If you are an IAM user, you must have Amazon EC2 permissions for some alarm operations:</p><ul><li><p><code>iam:CreateServiceLinkedRole</code> for all alarms with EC2 actions</p></li><li><p><code>ec2:DescribeInstanceStatus</code> and <code>ec2:DescribeInstances</code> for all alarms on EC2 instance status metrics</p></li><li><p><code>ec2:StopInstances</code> for alarms with stop actions</p></li><li><p><code>ec2:TerminateInstances</code> for alarms with terminate actions</p></li><li><p><code>ec2:DescribeInstanceRecoveryAttribute</code> and <code>ec2:RecoverInstances</code> for alarms with recover actions</p></li></ul><p>If you have read/write permissions for Amazon CloudWatch but not for Amazon EC2, you can still create an alarm, but the stop or terminate actions are not performed. However, if you are later granted the required permissions, the alarm actions that you created earlier are performed.</p><p>If you are using an IAM role (for example, an EC2 instance profile), you cannot stop or terminate the instance using alarm actions. However, you can still see the alarm state and perform any other actions such as Amazon SNS notifications or Auto Scaling policies.</p><p>If you are using temporary security credentials granted using AWS STS, you cannot stop or terminate an EC2 instance using alarm actions.</p><p>The first time you create an alarm in the AWS Management Console, the CLI, or by using the PutMetricAlarm API, CloudWatch creates the necessary service-linked role for you. The service-linked role is called <code>AWSServiceRoleForCloudWatchEvents</code>. For more information, see <a href="http://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_terms-and-concepts.html#iam-term-service-linked-role">AWS service-linked role</a>.</p>
 
 @param request A container for the necessary parameters to execute the PutMetricAlarm service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSCloudWatchErrorDomain` domain and the following error code: `AWSCloudWatchErrorLimitExceeded`.
 
 @see AWSCloudWatchPutMetricAlarmInput
 */
- (AWSTask *)putMetricAlarm:(AWSCloudWatchPutMetricAlarmInput *)request;

/**
 <p>Creates or updates an alarm and associates it with the specified metric or metric math expression.</p><p>When this operation creates an alarm, the alarm state is immediately set to <code>INSUFFICIENT_DATA</code>. The alarm is then evaluated and its state is set appropriately. Any actions associated with the new state are then executed.</p><p>When you update an existing alarm, its state is left unchanged, but the update completely overwrites the previous configuration of the alarm.</p><p>If you are an IAM user, you must have Amazon EC2 permissions for some alarm operations:</p><ul><li><p><code>iam:CreateServiceLinkedRole</code> for all alarms with EC2 actions</p></li><li><p><code>ec2:DescribeInstanceStatus</code> and <code>ec2:DescribeInstances</code> for all alarms on EC2 instance status metrics</p></li><li><p><code>ec2:StopInstances</code> for alarms with stop actions</p></li><li><p><code>ec2:TerminateInstances</code> for alarms with terminate actions</p></li><li><p><code>ec2:DescribeInstanceRecoveryAttribute</code> and <code>ec2:RecoverInstances</code> for alarms with recover actions</p></li></ul><p>If you have read/write permissions for Amazon CloudWatch but not for Amazon EC2, you can still create an alarm, but the stop or terminate actions are not performed. However, if you are later granted the required permissions, the alarm actions that you created earlier are performed.</p><p>If you are using an IAM role (for example, an EC2 instance profile), you cannot stop or terminate the instance using alarm actions. However, you can still see the alarm state and perform any other actions such as Amazon SNS notifications or Auto Scaling policies.</p><p>If you are using temporary security credentials granted using AWS STS, you cannot stop or terminate an EC2 instance using alarm actions.</p><p>The first time you create an alarm in the AWS Management Console, the CLI, or by using the PutMetricAlarm API, CloudWatch creates the necessary service-linked role for you. The service-linked role is called <code>AWSServiceRoleForCloudWatchEvents</code>. For more information, see <a href="http://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_terms-and-concepts.html#iam-term-service-linked-role">AWS service-linked role</a>.</p>
 
 @param request A container for the necessary parameters to execute the PutMetricAlarm service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCloudWatchErrorDomain` domain and the following error code: `AWSCloudWatchErrorLimitExceeded`.
 
 @see AWSCloudWatchPutMetricAlarmInput
 */
- (void)putMetricAlarm:(AWSCloudWatchPutMetricAlarmInput *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Publishes metric data points to Amazon CloudWatch. CloudWatch associates the data points with the specified metric. If the specified metric does not exist, CloudWatch creates the metric. When CloudWatch creates a metric, it can take up to fifteen minutes for the metric to appear in calls to <a>ListMetrics</a>.</p><p>You can publish either individual data points in the <code>Value</code> field, or arrays of values and the number of times each value occurred during the period by using the <code>Values</code> and <code>Counts</code> fields in the <code>MetricDatum</code> structure. Using the <code>Values</code> and <code>Counts</code> method enables you to publish up to 150 values per metric with one <code>PutMetricData</code> request, and supports retrieving percentile statistics on this data.</p><p>Each <code>PutMetricData</code> request is limited to 40 KB in size for HTTP POST requests. You can send a payload compressed by gzip. Each request is also limited to no more than 20 different metrics.</p><p>Although the <code>Value</code> parameter accepts numbers of type <code>Double</code>, CloudWatch rejects values that are either too small or too large. Values must be in the range of 8.515920e-109 to 1.174271e+108 (Base 10) or 2e-360 to 2e360 (Base 2). In addition, special values (for example, NaN, +Infinity, -Infinity) are not supported.</p><p>You can use up to 10 dimensions per metric to further clarify what data the metric collects. For more information about specifying dimensions, see <a href="http://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/publishingMetrics.html">Publishing Metrics</a> in the <i>Amazon CloudWatch User Guide</i>.</p><p>Data points with time stamps from 24 hours ago or longer can take at least 48 hours to become available for <a>GetMetricData</a> or <a>GetMetricStatistics</a> from the time they are submitted.</p><p>CloudWatch needs raw data points to calculate percentile statistics. If you publish data using a statistic set instead, you can only retrieve percentile statistics for this data if one of the following conditions is true:</p><ul><li><p>The <code>SampleCount</code> value of the statistic set is 1 and <code>Min</code>, <code>Max</code>, and <code>Sum</code> are all equal.</p></li><li><p>The <code>Min</code> and <code>Max</code> are equal, and <code>Sum</code> is equal to <code>Min</code> multiplied by <code>SampleCount</code>.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the PutMetricData service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSCloudWatchErrorDomain` domain and the following error code: `AWSCloudWatchErrorInvalidParameterValue`, `AWSCloudWatchErrorMissingRequiredParameter`, `AWSCloudWatchErrorInvalidParameterCombination`, `AWSCloudWatchErrorInternalService`.
 
 @see AWSCloudWatchPutMetricDataInput
 */
- (AWSTask *)putMetricData:(AWSCloudWatchPutMetricDataInput *)request;

/**
 <p>Publishes metric data points to Amazon CloudWatch. CloudWatch associates the data points with the specified metric. If the specified metric does not exist, CloudWatch creates the metric. When CloudWatch creates a metric, it can take up to fifteen minutes for the metric to appear in calls to <a>ListMetrics</a>.</p><p>You can publish either individual data points in the <code>Value</code> field, or arrays of values and the number of times each value occurred during the period by using the <code>Values</code> and <code>Counts</code> fields in the <code>MetricDatum</code> structure. Using the <code>Values</code> and <code>Counts</code> method enables you to publish up to 150 values per metric with one <code>PutMetricData</code> request, and supports retrieving percentile statistics on this data.</p><p>Each <code>PutMetricData</code> request is limited to 40 KB in size for HTTP POST requests. You can send a payload compressed by gzip. Each request is also limited to no more than 20 different metrics.</p><p>Although the <code>Value</code> parameter accepts numbers of type <code>Double</code>, CloudWatch rejects values that are either too small or too large. Values must be in the range of 8.515920e-109 to 1.174271e+108 (Base 10) or 2e-360 to 2e360 (Base 2). In addition, special values (for example, NaN, +Infinity, -Infinity) are not supported.</p><p>You can use up to 10 dimensions per metric to further clarify what data the metric collects. For more information about specifying dimensions, see <a href="http://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/publishingMetrics.html">Publishing Metrics</a> in the <i>Amazon CloudWatch User Guide</i>.</p><p>Data points with time stamps from 24 hours ago or longer can take at least 48 hours to become available for <a>GetMetricData</a> or <a>GetMetricStatistics</a> from the time they are submitted.</p><p>CloudWatch needs raw data points to calculate percentile statistics. If you publish data using a statistic set instead, you can only retrieve percentile statistics for this data if one of the following conditions is true:</p><ul><li><p>The <code>SampleCount</code> value of the statistic set is 1 and <code>Min</code>, <code>Max</code>, and <code>Sum</code> are all equal.</p></li><li><p>The <code>Min</code> and <code>Max</code> are equal, and <code>Sum</code> is equal to <code>Min</code> multiplied by <code>SampleCount</code>.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the PutMetricData service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCloudWatchErrorDomain` domain and the following error code: `AWSCloudWatchErrorInvalidParameterValue`, `AWSCloudWatchErrorMissingRequiredParameter`, `AWSCloudWatchErrorInvalidParameterCombination`, `AWSCloudWatchErrorInternalService`.
 
 @see AWSCloudWatchPutMetricDataInput
 */
- (void)putMetricData:(AWSCloudWatchPutMetricDataInput *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Temporarily sets the state of an alarm for testing purposes. When the updated state differs from the previous value, the action configured for the appropriate state is invoked. For example, if your alarm is configured to send an Amazon SNS message when an alarm is triggered, temporarily changing the alarm state to <code>ALARM</code> sends an SNS message. The alarm returns to its actual state (often within seconds). Because the alarm state change happens quickly, it is typically only visible in the alarm's <b>History</b> tab in the Amazon CloudWatch console or through <a>DescribeAlarmHistory</a>.</p>
 
 @param request A container for the necessary parameters to execute the SetAlarmState service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSCloudWatchErrorDomain` domain and the following error code: `AWSCloudWatchErrorResourceNotFound`, `AWSCloudWatchErrorInvalidFormat`.
 
 @see AWSCloudWatchSetAlarmStateInput
 */
- (AWSTask *)setAlarmState:(AWSCloudWatchSetAlarmStateInput *)request;

/**
 <p>Temporarily sets the state of an alarm for testing purposes. When the updated state differs from the previous value, the action configured for the appropriate state is invoked. For example, if your alarm is configured to send an Amazon SNS message when an alarm is triggered, temporarily changing the alarm state to <code>ALARM</code> sends an SNS message. The alarm returns to its actual state (often within seconds). Because the alarm state change happens quickly, it is typically only visible in the alarm's <b>History</b> tab in the Amazon CloudWatch console or through <a>DescribeAlarmHistory</a>.</p>
 
 @param request A container for the necessary parameters to execute the SetAlarmState service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCloudWatchErrorDomain` domain and the following error code: `AWSCloudWatchErrorResourceNotFound`, `AWSCloudWatchErrorInvalidFormat`.
 
 @see AWSCloudWatchSetAlarmStateInput
 */
- (void)setAlarmState:(AWSCloudWatchSetAlarmStateInput *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
