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

#import <Foundation/Foundation.h>
#import <AWSCore/AWSCore.h>
#import "AWSLogsModel.h"
#import "AWSLogsResources.h"

NS_ASSUME_NONNULL_BEGIN

/**
 <p>You can use Amazon CloudWatch Logs to monitor, store, and access your log files from EC2 instances, Amazon CloudTrail, or other sources. You can then retrieve the associated log data from CloudWatch Logs using the Amazon CloudWatch console, the CloudWatch Logs commands in the AWS CLI, the CloudWatch Logs API, or the CloudWatch Logs SDK.</p><p>You can use CloudWatch Logs to:</p><ul><li><p><b>Monitor Logs from Amazon EC2 Instances in Real-time</b>: You can use CloudWatch Logs to monitor applications and systems using log data. For example, CloudWatch Logs can track the number of errors that occur in your application logs and send you a notification whenever the rate of errors exceeds a threshold you specify. CloudWatch Logs uses your log data for monitoring; so, no code changes are required. For example, you can monitor application logs for specific literal terms (such as "NullReferenceException") or count the number of occurrences of a literal term at a particular position in log data (such as "404" status codes in an Apache access log). When the term you are searching for is found, CloudWatch Logs reports the data to a Amazon CloudWatch metric that you specify.</p></li><li><p><b>Monitor Amazon CloudTrail Logged Events</b>: You can create alarms in Amazon CloudWatch and receive notifications of particular API activity as captured by CloudTrail and use the notification to perform troubleshooting.</p></li><li><p><b>Archive Log Data</b>: You can use CloudWatch Logs to store your log data in highly durable storage. You can change the log retention setting so that any log events older than this setting are automatically deleted. The CloudWatch Logs agent makes it easy to quickly send both rotated and non-rotated log data off of a host and into the log service. You can then access the raw log data when you need it.</p></li></ul>
 */
@interface AWSLogs : AWSService

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

     let Logs = AWSLogs.default()

 *Objective-C*

     AWSLogs *Logs = [AWSLogs defaultLogs];

 @return The default service client.
 */
+ (instancetype)defaultLogs;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSLogs.register(with: configuration!, forKey: "USWest2Logs")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSLogs registerLogsWithConfiguration:configuration forKey:@"USWest2Logs"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Logs = AWSLogs(forKey: "USWest2Logs")

 *Objective-C*

     AWSLogs *Logs = [AWSLogs LogsForKey:@"USWest2Logs"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerLogsWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerLogsWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSLogs.register(with: configuration!, forKey: "USWest2Logs")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSLogs registerLogsWithConfiguration:configuration forKey:@"USWest2Logs"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Logs = AWSLogs(forKey: "USWest2Logs")

 *Objective-C*

     AWSLogs *Logs = [AWSLogs LogsForKey:@"USWest2Logs"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)LogsForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removeLogsForKey:(NSString *)key;

/**
 <p>Cancels the specified export task.</p><p>The task must be in the <code>PENDING</code> or <code>RUNNING</code> state.</p>
 
 @param request A container for the necessary parameters to execute the CancelExportTask service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorInvalidOperation`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsCancelExportTaskRequest
 */
- (AWSTask *)cancelExportTask:(AWSLogsCancelExportTaskRequest *)request;

/**
 <p>Cancels the specified export task.</p><p>The task must be in the <code>PENDING</code> or <code>RUNNING</code> state.</p>
 
 @param request A container for the necessary parameters to execute the CancelExportTask service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorInvalidOperation`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsCancelExportTaskRequest
 */
- (void)cancelExportTask:(AWSLogsCancelExportTaskRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Creates an export task, which allows you to efficiently export data from a log group to an Amazon S3 bucket.</p><p>This is an asynchronous call. If all the required information is provided, this operation initiates an export task and responds with the ID of the task. After the task has started, you can use <a>DescribeExportTasks</a> to get the status of the export task. Each account can only have one active (<code>RUNNING</code> or <code>PENDING</code>) export task at a time. To cancel an export task, use <a>CancelExportTask</a>.</p><p>You can export logs from multiple log groups or multiple time ranges to the same S3 bucket. To separate out log data for each export task, you can specify a prefix that will be used as the Amazon S3 key prefix for all exported objects.</p>
 
 @param request A container for the necessary parameters to execute the CreateExportTask service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLogsCreateExportTaskResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorLimitExceeded`, `AWSLogsErrorOperationAborted`, `AWSLogsErrorServiceUnavailable`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorResourceAlreadyExists`.
 
 @see AWSLogsCreateExportTaskRequest
 @see AWSLogsCreateExportTaskResponse
 */
- (AWSTask<AWSLogsCreateExportTaskResponse *> *)createExportTask:(AWSLogsCreateExportTaskRequest *)request;

/**
 <p>Creates an export task, which allows you to efficiently export data from a log group to an Amazon S3 bucket.</p><p>This is an asynchronous call. If all the required information is provided, this operation initiates an export task and responds with the ID of the task. After the task has started, you can use <a>DescribeExportTasks</a> to get the status of the export task. Each account can only have one active (<code>RUNNING</code> or <code>PENDING</code>) export task at a time. To cancel an export task, use <a>CancelExportTask</a>.</p><p>You can export logs from multiple log groups or multiple time ranges to the same S3 bucket. To separate out log data for each export task, you can specify a prefix that will be used as the Amazon S3 key prefix for all exported objects.</p>
 
 @param request A container for the necessary parameters to execute the CreateExportTask service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorLimitExceeded`, `AWSLogsErrorOperationAborted`, `AWSLogsErrorServiceUnavailable`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorResourceAlreadyExists`.
 
 @see AWSLogsCreateExportTaskRequest
 @see AWSLogsCreateExportTaskResponse
 */
- (void)createExportTask:(AWSLogsCreateExportTaskRequest *)request completionHandler:(void (^ _Nullable)(AWSLogsCreateExportTaskResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a log group with the specified name.</p><p>You can create up to 5000 log groups per account.</p><p>You must use the following guidelines when naming a log group:</p><ul><li><p>Log group names must be unique within a region for an AWS account.</p></li><li><p>Log group names can be between 1 and 512 characters long.</p></li><li><p>Log group names consist of the following characters: a-z, A-Z, 0-9, '_' (underscore), '-' (hyphen), '/' (forward slash), and '.' (period).</p></li></ul>
 
 @param request A container for the necessary parameters to execute the CreateLogGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorResourceAlreadyExists`, `AWSLogsErrorLimitExceeded`, `AWSLogsErrorOperationAborted`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsCreateLogGroupRequest
 */
- (AWSTask *)createLogGroup:(AWSLogsCreateLogGroupRequest *)request;

/**
 <p>Creates a log group with the specified name.</p><p>You can create up to 5000 log groups per account.</p><p>You must use the following guidelines when naming a log group:</p><ul><li><p>Log group names must be unique within a region for an AWS account.</p></li><li><p>Log group names can be between 1 and 512 characters long.</p></li><li><p>Log group names consist of the following characters: a-z, A-Z, 0-9, '_' (underscore), '-' (hyphen), '/' (forward slash), and '.' (period).</p></li></ul>
 
 @param request A container for the necessary parameters to execute the CreateLogGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorResourceAlreadyExists`, `AWSLogsErrorLimitExceeded`, `AWSLogsErrorOperationAborted`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsCreateLogGroupRequest
 */
- (void)createLogGroup:(AWSLogsCreateLogGroupRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Creates a log stream for the specified log group.</p><p>There is no limit on the number of log streams that you can create for a log group.</p><p>You must use the following guidelines when naming a log stream:</p><ul><li><p>Log stream names must be unique within the log group.</p></li><li><p>Log stream names can be between 1 and 512 characters long.</p></li><li><p>The ':' (colon) and '*' (asterisk) characters are not allowed.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the CreateLogStream service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorResourceAlreadyExists`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsCreateLogStreamRequest
 */
- (AWSTask *)createLogStream:(AWSLogsCreateLogStreamRequest *)request;

/**
 <p>Creates a log stream for the specified log group.</p><p>There is no limit on the number of log streams that you can create for a log group.</p><p>You must use the following guidelines when naming a log stream:</p><ul><li><p>Log stream names must be unique within the log group.</p></li><li><p>Log stream names can be between 1 and 512 characters long.</p></li><li><p>The ':' (colon) and '*' (asterisk) characters are not allowed.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the CreateLogStream service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorResourceAlreadyExists`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsCreateLogStreamRequest
 */
- (void)createLogStream:(AWSLogsCreateLogStreamRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified destination, and eventually disables all the subscription filters that publish to it. This operation does not delete the physical resource encapsulated by the destination.</p>
 
 @param request A container for the necessary parameters to execute the DeleteDestination service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorOperationAborted`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsDeleteDestinationRequest
 */
- (AWSTask *)deleteDestination:(AWSLogsDeleteDestinationRequest *)request;

/**
 <p>Deletes the specified destination, and eventually disables all the subscription filters that publish to it. This operation does not delete the physical resource encapsulated by the destination.</p>
 
 @param request A container for the necessary parameters to execute the DeleteDestination service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorOperationAborted`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsDeleteDestinationRequest
 */
- (void)deleteDestination:(AWSLogsDeleteDestinationRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified log group and permanently deletes all the archived log events associated with the log group.</p>
 
 @param request A container for the necessary parameters to execute the DeleteLogGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorOperationAborted`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsDeleteLogGroupRequest
 */
- (AWSTask *)deleteLogGroup:(AWSLogsDeleteLogGroupRequest *)request;

/**
 <p>Deletes the specified log group and permanently deletes all the archived log events associated with the log group.</p>
 
 @param request A container for the necessary parameters to execute the DeleteLogGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorOperationAborted`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsDeleteLogGroupRequest
 */
- (void)deleteLogGroup:(AWSLogsDeleteLogGroupRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified log stream and permanently deletes all the archived log events associated with the log stream.</p>
 
 @param request A container for the necessary parameters to execute the DeleteLogStream service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorOperationAborted`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsDeleteLogStreamRequest
 */
- (AWSTask *)deleteLogStream:(AWSLogsDeleteLogStreamRequest *)request;

/**
 <p>Deletes the specified log stream and permanently deletes all the archived log events associated with the log stream.</p>
 
 @param request A container for the necessary parameters to execute the DeleteLogStream service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorOperationAborted`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsDeleteLogStreamRequest
 */
- (void)deleteLogStream:(AWSLogsDeleteLogStreamRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified metric filter.</p>
 
 @param request A container for the necessary parameters to execute the DeleteMetricFilter service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorOperationAborted`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsDeleteMetricFilterRequest
 */
- (AWSTask *)deleteMetricFilter:(AWSLogsDeleteMetricFilterRequest *)request;

/**
 <p>Deletes the specified metric filter.</p>
 
 @param request A container for the necessary parameters to execute the DeleteMetricFilter service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorOperationAborted`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsDeleteMetricFilterRequest
 */
- (void)deleteMetricFilter:(AWSLogsDeleteMetricFilterRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified retention policy.</p><p>Log events do not expire if they belong to log groups without a retention policy.</p>
 
 @param request A container for the necessary parameters to execute the DeleteRetentionPolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorOperationAborted`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsDeleteRetentionPolicyRequest
 */
- (AWSTask *)deleteRetentionPolicy:(AWSLogsDeleteRetentionPolicyRequest *)request;

/**
 <p>Deletes the specified retention policy.</p><p>Log events do not expire if they belong to log groups without a retention policy.</p>
 
 @param request A container for the necessary parameters to execute the DeleteRetentionPolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorOperationAborted`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsDeleteRetentionPolicyRequest
 */
- (void)deleteRetentionPolicy:(AWSLogsDeleteRetentionPolicyRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified subscription filter.</p>
 
 @param request A container for the necessary parameters to execute the DeleteSubscriptionFilter service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorOperationAborted`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsDeleteSubscriptionFilterRequest
 */
- (AWSTask *)deleteSubscriptionFilter:(AWSLogsDeleteSubscriptionFilterRequest *)request;

/**
 <p>Deletes the specified subscription filter.</p>
 
 @param request A container for the necessary parameters to execute the DeleteSubscriptionFilter service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorOperationAborted`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsDeleteSubscriptionFilterRequest
 */
- (void)deleteSubscriptionFilter:(AWSLogsDeleteSubscriptionFilterRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Lists all your destinations. The results are ASCII-sorted by destination name.</p>
 
 @param request A container for the necessary parameters to execute the DescribeDestinations service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLogsDescribeDestinationsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsDescribeDestinationsRequest
 @see AWSLogsDescribeDestinationsResponse
 */
- (AWSTask<AWSLogsDescribeDestinationsResponse *> *)describeDestinations:(AWSLogsDescribeDestinationsRequest *)request;

/**
 <p>Lists all your destinations. The results are ASCII-sorted by destination name.</p>
 
 @param request A container for the necessary parameters to execute the DescribeDestinations service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsDescribeDestinationsRequest
 @see AWSLogsDescribeDestinationsResponse
 */
- (void)describeDestinations:(AWSLogsDescribeDestinationsRequest *)request completionHandler:(void (^ _Nullable)(AWSLogsDescribeDestinationsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the specified export tasks. You can list all your export tasks or filter the results based on task ID or task status.</p>
 
 @param request A container for the necessary parameters to execute the DescribeExportTasks service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLogsDescribeExportTasksResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsDescribeExportTasksRequest
 @see AWSLogsDescribeExportTasksResponse
 */
- (AWSTask<AWSLogsDescribeExportTasksResponse *> *)describeExportTasks:(AWSLogsDescribeExportTasksRequest *)request;

/**
 <p>Lists the specified export tasks. You can list all your export tasks or filter the results based on task ID or task status.</p>
 
 @param request A container for the necessary parameters to execute the DescribeExportTasks service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsDescribeExportTasksRequest
 @see AWSLogsDescribeExportTasksResponse
 */
- (void)describeExportTasks:(AWSLogsDescribeExportTasksRequest *)request completionHandler:(void (^ _Nullable)(AWSLogsDescribeExportTasksResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the specified log groups. You can list all your log groups or filter the results by prefix. The results are ASCII-sorted by log group name.</p>
 
 @param request A container for the necessary parameters to execute the DescribeLogGroups service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLogsDescribeLogGroupsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsDescribeLogGroupsRequest
 @see AWSLogsDescribeLogGroupsResponse
 */
- (AWSTask<AWSLogsDescribeLogGroupsResponse *> *)describeLogGroups:(AWSLogsDescribeLogGroupsRequest *)request;

/**
 <p>Lists the specified log groups. You can list all your log groups or filter the results by prefix. The results are ASCII-sorted by log group name.</p>
 
 @param request A container for the necessary parameters to execute the DescribeLogGroups service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsDescribeLogGroupsRequest
 @see AWSLogsDescribeLogGroupsResponse
 */
- (void)describeLogGroups:(AWSLogsDescribeLogGroupsRequest *)request completionHandler:(void (^ _Nullable)(AWSLogsDescribeLogGroupsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the log streams for the specified log group. You can list all the log streams or filter the results by prefix. You can also control how the results are ordered.</p><p>This operation has a limit of five transactions per second, after which transactions are throttled.</p>
 
 @param request A container for the necessary parameters to execute the DescribeLogStreams service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLogsDescribeLogStreamsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsDescribeLogStreamsRequest
 @see AWSLogsDescribeLogStreamsResponse
 */
- (AWSTask<AWSLogsDescribeLogStreamsResponse *> *)describeLogStreams:(AWSLogsDescribeLogStreamsRequest *)request;

/**
 <p>Lists the log streams for the specified log group. You can list all the log streams or filter the results by prefix. You can also control how the results are ordered.</p><p>This operation has a limit of five transactions per second, after which transactions are throttled.</p>
 
 @param request A container for the necessary parameters to execute the DescribeLogStreams service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsDescribeLogStreamsRequest
 @see AWSLogsDescribeLogStreamsResponse
 */
- (void)describeLogStreams:(AWSLogsDescribeLogStreamsRequest *)request completionHandler:(void (^ _Nullable)(AWSLogsDescribeLogStreamsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the specified metric filters. You can list all the metric filters or filter the results by log name, prefix, metric name, and metric namespace. The results are ASCII-sorted by filter name.</p>
 
 @param request A container for the necessary parameters to execute the DescribeMetricFilters service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLogsDescribeMetricFiltersResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsDescribeMetricFiltersRequest
 @see AWSLogsDescribeMetricFiltersResponse
 */
- (AWSTask<AWSLogsDescribeMetricFiltersResponse *> *)describeMetricFilters:(AWSLogsDescribeMetricFiltersRequest *)request;

/**
 <p>Lists the specified metric filters. You can list all the metric filters or filter the results by log name, prefix, metric name, and metric namespace. The results are ASCII-sorted by filter name.</p>
 
 @param request A container for the necessary parameters to execute the DescribeMetricFilters service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsDescribeMetricFiltersRequest
 @see AWSLogsDescribeMetricFiltersResponse
 */
- (void)describeMetricFilters:(AWSLogsDescribeMetricFiltersRequest *)request completionHandler:(void (^ _Nullable)(AWSLogsDescribeMetricFiltersResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the subscription filters for the specified log group. You can list all the subscription filters or filter the results by prefix. The results are ASCII-sorted by filter name.</p>
 
 @param request A container for the necessary parameters to execute the DescribeSubscriptionFilters service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLogsDescribeSubscriptionFiltersResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsDescribeSubscriptionFiltersRequest
 @see AWSLogsDescribeSubscriptionFiltersResponse
 */
- (AWSTask<AWSLogsDescribeSubscriptionFiltersResponse *> *)describeSubscriptionFilters:(AWSLogsDescribeSubscriptionFiltersRequest *)request;

/**
 <p>Lists the subscription filters for the specified log group. You can list all the subscription filters or filter the results by prefix. The results are ASCII-sorted by filter name.</p>
 
 @param request A container for the necessary parameters to execute the DescribeSubscriptionFilters service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsDescribeSubscriptionFiltersRequest
 @see AWSLogsDescribeSubscriptionFiltersResponse
 */
- (void)describeSubscriptionFilters:(AWSLogsDescribeSubscriptionFiltersRequest *)request completionHandler:(void (^ _Nullable)(AWSLogsDescribeSubscriptionFiltersResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists log events from the specified log group. You can list all the log events or filter the results using a filter pattern, a time range, and the name of the log stream.</p><p>By default, this operation returns as many log events as can fit in 1MB (up to 10,000 log events), or all the events found within the time range that you specify. If the results include a token, then there are more log events available, and you can get additional results by specifying the token in a subsequent call.</p>
 
 @param request A container for the necessary parameters to execute the FilterLogEvents service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLogsFilterLogEventsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsFilterLogEventsRequest
 @see AWSLogsFilterLogEventsResponse
 */
- (AWSTask<AWSLogsFilterLogEventsResponse *> *)filterLogEvents:(AWSLogsFilterLogEventsRequest *)request;

/**
 <p>Lists log events from the specified log group. You can list all the log events or filter the results using a filter pattern, a time range, and the name of the log stream.</p><p>By default, this operation returns as many log events as can fit in 1MB (up to 10,000 log events), or all the events found within the time range that you specify. If the results include a token, then there are more log events available, and you can get additional results by specifying the token in a subsequent call.</p>
 
 @param request A container for the necessary parameters to execute the FilterLogEvents service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsFilterLogEventsRequest
 @see AWSLogsFilterLogEventsResponse
 */
- (void)filterLogEvents:(AWSLogsFilterLogEventsRequest *)request completionHandler:(void (^ _Nullable)(AWSLogsFilterLogEventsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists log events from the specified log stream. You can list all the log events or filter using a time range.</p><p>By default, this operation returns as many log events as can fit in a response size of 1MB (up to 10,000 log events). If the results include tokens, there are more log events available. You can get additional log events by specifying one of the tokens in a subsequent call.</p>
 
 @param request A container for the necessary parameters to execute the GetLogEvents service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLogsGetLogEventsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsGetLogEventsRequest
 @see AWSLogsGetLogEventsResponse
 */
- (AWSTask<AWSLogsGetLogEventsResponse *> *)getLogEvents:(AWSLogsGetLogEventsRequest *)request;

/**
 <p>Lists log events from the specified log stream. You can list all the log events or filter using a time range.</p><p>By default, this operation returns as many log events as can fit in a response size of 1MB (up to 10,000 log events). If the results include tokens, there are more log events available. You can get additional log events by specifying one of the tokens in a subsequent call.</p>
 
 @param request A container for the necessary parameters to execute the GetLogEvents service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsGetLogEventsRequest
 @see AWSLogsGetLogEventsResponse
 */
- (void)getLogEvents:(AWSLogsGetLogEventsRequest *)request completionHandler:(void (^ _Nullable)(AWSLogsGetLogEventsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the tags for the specified log group.</p><p>To add tags, use <a>TagLogGroup</a>. To remove tags, use <a>UntagLogGroup</a>.</p>
 
 @param request A container for the necessary parameters to execute the ListTagsLogGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLogsListTagsLogGroupResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorResourceNotFound`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsListTagsLogGroupRequest
 @see AWSLogsListTagsLogGroupResponse
 */
- (AWSTask<AWSLogsListTagsLogGroupResponse *> *)listTagsLogGroup:(AWSLogsListTagsLogGroupRequest *)request;

/**
 <p>Lists the tags for the specified log group.</p><p>To add tags, use <a>TagLogGroup</a>. To remove tags, use <a>UntagLogGroup</a>.</p>
 
 @param request A container for the necessary parameters to execute the ListTagsLogGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorResourceNotFound`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsListTagsLogGroupRequest
 @see AWSLogsListTagsLogGroupResponse
 */
- (void)listTagsLogGroup:(AWSLogsListTagsLogGroupRequest *)request completionHandler:(void (^ _Nullable)(AWSLogsListTagsLogGroupResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates or updates a destination. A destination encapsulates a physical resource (such as a Kinesis stream) and enables you to subscribe to a real-time stream of log events of a different account, ingested using <a>PutLogEvents</a>. Currently, the only supported physical resource is a Amazon Kinesis stream belonging to the same account as the destination.</p><p>A destination controls what is written to its Amazon Kinesis stream through an access policy. By default, <code>PutDestination</code> does not set any access policy with the destination, which means a cross-account user cannot call <a>PutSubscriptionFilter</a> against this destination. To enable this, the destination owner must call <a>PutDestinationPolicy</a> after <code>PutDestination</code>.</p>
 
 @param request A container for the necessary parameters to execute the PutDestination service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLogsPutDestinationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorOperationAborted`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsPutDestinationRequest
 @see AWSLogsPutDestinationResponse
 */
- (AWSTask<AWSLogsPutDestinationResponse *> *)putDestination:(AWSLogsPutDestinationRequest *)request;

/**
 <p>Creates or updates a destination. A destination encapsulates a physical resource (such as a Kinesis stream) and enables you to subscribe to a real-time stream of log events of a different account, ingested using <a>PutLogEvents</a>. Currently, the only supported physical resource is a Amazon Kinesis stream belonging to the same account as the destination.</p><p>A destination controls what is written to its Amazon Kinesis stream through an access policy. By default, <code>PutDestination</code> does not set any access policy with the destination, which means a cross-account user cannot call <a>PutSubscriptionFilter</a> against this destination. To enable this, the destination owner must call <a>PutDestinationPolicy</a> after <code>PutDestination</code>.</p>
 
 @param request A container for the necessary parameters to execute the PutDestination service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorOperationAborted`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsPutDestinationRequest
 @see AWSLogsPutDestinationResponse
 */
- (void)putDestination:(AWSLogsPutDestinationRequest *)request completionHandler:(void (^ _Nullable)(AWSLogsPutDestinationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates or updates an access policy associated with an existing destination. An access policy is an <a href="http://docs.aws.amazon.com/IAM/latest/UserGuide/policies_overview.html">IAM policy document</a> that is used to authorize claims to register a subscription filter against a given destination.</p>
 
 @param request A container for the necessary parameters to execute the PutDestinationPolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorOperationAborted`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsPutDestinationPolicyRequest
 */
- (AWSTask *)putDestinationPolicy:(AWSLogsPutDestinationPolicyRequest *)request;

/**
 <p>Creates or updates an access policy associated with an existing destination. An access policy is an <a href="http://docs.aws.amazon.com/IAM/latest/UserGuide/policies_overview.html">IAM policy document</a> that is used to authorize claims to register a subscription filter against a given destination.</p>
 
 @param request A container for the necessary parameters to execute the PutDestinationPolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorOperationAborted`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsPutDestinationPolicyRequest
 */
- (void)putDestinationPolicy:(AWSLogsPutDestinationPolicyRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Uploads a batch of log events to the specified log stream.</p><p>You must include the sequence token obtained from the response of the previous call. An upload in a newly created log stream does not require a sequence token. You can also get the sequence token using <a>DescribeLogStreams</a>.</p><p>The batch of events must satisfy the following constraints:</p><ul><li><p>The maximum batch size is 1,048,576 bytes, and this size is calculated as the sum of all event messages in UTF-8, plus 26 bytes for each log event.</p></li><li><p>None of the log events in the batch can be more than 2 hours in the future.</p></li><li><p>None of the log events in the batch can be older than 14 days or the retention period of the log group.</p></li><li><p>The log events in the batch must be in chronological ordered by their timestamp (the time the event occurred, expressed as the number of milliseconds since Jan 1, 1970 00:00:00 UTC).</p></li><li><p>The maximum number of log events in a batch is 10,000.</p></li><li><p>A batch of log events in a single request cannot span more than 24 hours. Otherwise, the operation fails.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the PutLogEvents service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLogsPutLogEventsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorInvalidSequenceToken`, `AWSLogsErrorDataAlreadyAccepted`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsPutLogEventsRequest
 @see AWSLogsPutLogEventsResponse
 */
- (AWSTask<AWSLogsPutLogEventsResponse *> *)putLogEvents:(AWSLogsPutLogEventsRequest *)request;

/**
 <p>Uploads a batch of log events to the specified log stream.</p><p>You must include the sequence token obtained from the response of the previous call. An upload in a newly created log stream does not require a sequence token. You can also get the sequence token using <a>DescribeLogStreams</a>.</p><p>The batch of events must satisfy the following constraints:</p><ul><li><p>The maximum batch size is 1,048,576 bytes, and this size is calculated as the sum of all event messages in UTF-8, plus 26 bytes for each log event.</p></li><li><p>None of the log events in the batch can be more than 2 hours in the future.</p></li><li><p>None of the log events in the batch can be older than 14 days or the retention period of the log group.</p></li><li><p>The log events in the batch must be in chronological ordered by their timestamp (the time the event occurred, expressed as the number of milliseconds since Jan 1, 1970 00:00:00 UTC).</p></li><li><p>The maximum number of log events in a batch is 10,000.</p></li><li><p>A batch of log events in a single request cannot span more than 24 hours. Otherwise, the operation fails.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the PutLogEvents service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorInvalidSequenceToken`, `AWSLogsErrorDataAlreadyAccepted`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsPutLogEventsRequest
 @see AWSLogsPutLogEventsResponse
 */
- (void)putLogEvents:(AWSLogsPutLogEventsRequest *)request completionHandler:(void (^ _Nullable)(AWSLogsPutLogEventsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates or updates a metric filter and associates it with the specified log group. Metric filters allow you to configure rules to extract metric data from log events ingested through <a>PutLogEvents</a>.</p><p>The maximum number of metric filters that can be associated with a log group is 100.</p>
 
 @param request A container for the necessary parameters to execute the PutMetricFilter service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorOperationAborted`, `AWSLogsErrorLimitExceeded`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsPutMetricFilterRequest
 */
- (AWSTask *)putMetricFilter:(AWSLogsPutMetricFilterRequest *)request;

/**
 <p>Creates or updates a metric filter and associates it with the specified log group. Metric filters allow you to configure rules to extract metric data from log events ingested through <a>PutLogEvents</a>.</p><p>The maximum number of metric filters that can be associated with a log group is 100.</p>
 
 @param request A container for the necessary parameters to execute the PutMetricFilter service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorOperationAborted`, `AWSLogsErrorLimitExceeded`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsPutMetricFilterRequest
 */
- (void)putMetricFilter:(AWSLogsPutMetricFilterRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Sets the retention of the specified log group. A retention policy allows you to configure the number of days you want to retain log events in the specified log group.</p>
 
 @param request A container for the necessary parameters to execute the PutRetentionPolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorOperationAborted`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsPutRetentionPolicyRequest
 */
- (AWSTask *)putRetentionPolicy:(AWSLogsPutRetentionPolicyRequest *)request;

/**
 <p>Sets the retention of the specified log group. A retention policy allows you to configure the number of days you want to retain log events in the specified log group.</p>
 
 @param request A container for the necessary parameters to execute the PutRetentionPolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorOperationAborted`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsPutRetentionPolicyRequest
 */
- (void)putRetentionPolicy:(AWSLogsPutRetentionPolicyRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Creates or updates a subscription filter and associates it with the specified log group. Subscription filters allow you to subscribe to a real-time stream of log events ingested through <a>PutLogEvents</a> and have them delivered to a specific destination. Currently, the supported destinations are:</p><ul><li><p>An Amazon Kinesis stream belonging to the same account as the subscription filter, for same-account delivery.</p></li><li><p>A logical destination that belongs to a different account, for cross-account delivery.</p></li><li><p>An Amazon Kinesis Firehose stream that belongs to the same account as the subscription filter, for same-account delivery.</p></li><li><p>An AWS Lambda function that belongs to the same account as the subscription filter, for same-account delivery.</p></li></ul><p>There can only be one subscription filter associated with a log group.</p>
 
 @param request A container for the necessary parameters to execute the PutSubscriptionFilter service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorOperationAborted`, `AWSLogsErrorLimitExceeded`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsPutSubscriptionFilterRequest
 */
- (AWSTask *)putSubscriptionFilter:(AWSLogsPutSubscriptionFilterRequest *)request;

/**
 <p>Creates or updates a subscription filter and associates it with the specified log group. Subscription filters allow you to subscribe to a real-time stream of log events ingested through <a>PutLogEvents</a> and have them delivered to a specific destination. Currently, the supported destinations are:</p><ul><li><p>An Amazon Kinesis stream belonging to the same account as the subscription filter, for same-account delivery.</p></li><li><p>A logical destination that belongs to a different account, for cross-account delivery.</p></li><li><p>An Amazon Kinesis Firehose stream that belongs to the same account as the subscription filter, for same-account delivery.</p></li><li><p>An AWS Lambda function that belongs to the same account as the subscription filter, for same-account delivery.</p></li></ul><p>There can only be one subscription filter associated with a log group.</p>
 
 @param request A container for the necessary parameters to execute the PutSubscriptionFilter service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorOperationAborted`, `AWSLogsErrorLimitExceeded`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsPutSubscriptionFilterRequest
 */
- (void)putSubscriptionFilter:(AWSLogsPutSubscriptionFilterRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Adds or updates the specified tags for the specified log group.</p><p>To list the tags for a log group, use <a>ListTagsLogGroup</a>. To remove tags, use <a>UntagLogGroup</a>.</p><p>For more information about tags, see <a href="http://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/log-group-tagging.html">Tag Log Groups in Amazon CloudWatch Logs</a> in the <i>Amazon CloudWatch Logs User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the TagLogGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorResourceNotFound`, `AWSLogsErrorInvalidParameter`.
 
 @see AWSLogsTagLogGroupRequest
 */
- (AWSTask *)tagLogGroup:(AWSLogsTagLogGroupRequest *)request;

/**
 <p>Adds or updates the specified tags for the specified log group.</p><p>To list the tags for a log group, use <a>ListTagsLogGroup</a>. To remove tags, use <a>UntagLogGroup</a>.</p><p>For more information about tags, see <a href="http://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/log-group-tagging.html">Tag Log Groups in Amazon CloudWatch Logs</a> in the <i>Amazon CloudWatch Logs User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the TagLogGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorResourceNotFound`, `AWSLogsErrorInvalidParameter`.
 
 @see AWSLogsTagLogGroupRequest
 */
- (void)tagLogGroup:(AWSLogsTagLogGroupRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Tests the filter pattern of a metric filter against a sample of log event messages. You can use this operation to validate the correctness of a metric filter pattern.</p>
 
 @param request A container for the necessary parameters to execute the TestMetricFilter service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLogsTestMetricFilterResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsTestMetricFilterRequest
 @see AWSLogsTestMetricFilterResponse
 */
- (AWSTask<AWSLogsTestMetricFilterResponse *> *)testMetricFilter:(AWSLogsTestMetricFilterRequest *)request;

/**
 <p>Tests the filter pattern of a metric filter against a sample of log event messages. You can use this operation to validate the correctness of a metric filter pattern.</p>
 
 @param request A container for the necessary parameters to execute the TestMetricFilter service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsTestMetricFilterRequest
 @see AWSLogsTestMetricFilterResponse
 */
- (void)testMetricFilter:(AWSLogsTestMetricFilterRequest *)request completionHandler:(void (^ _Nullable)(AWSLogsTestMetricFilterResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Removes the specified tags from the specified log group.</p><p>To list the tags for a log group, use <a>ListTagsLogGroup</a>. To add tags, use <a>UntagLogGroup</a>.</p>
 
 @param request A container for the necessary parameters to execute the UntagLogGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorResourceNotFound`.
 
 @see AWSLogsUntagLogGroupRequest
 */
- (AWSTask *)untagLogGroup:(AWSLogsUntagLogGroupRequest *)request;

/**
 <p>Removes the specified tags from the specified log group.</p><p>To list the tags for a log group, use <a>ListTagsLogGroup</a>. To add tags, use <a>UntagLogGroup</a>.</p>
 
 @param request A container for the necessary parameters to execute the UntagLogGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorResourceNotFound`.
 
 @see AWSLogsUntagLogGroupRequest
 */
- (void)untagLogGroup:(AWSLogsUntagLogGroupRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
