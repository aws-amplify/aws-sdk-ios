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
#import "AWSLogsModel.h"
#import "AWSLogsResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSLogs
FOUNDATION_EXPORT NSString *const AWSLogsSDKVersion;

/**
 <p>You can use Amazon CloudWatch Logs to monitor, store, and access your log files from Amazon EC2 instances, AWS CloudTrail, or other sources. You can then retrieve the associated log data from CloudWatch Logs using the CloudWatch console, CloudWatch Logs commands in the AWS CLI, CloudWatch Logs API, or CloudWatch Logs SDK.</p><p>You can use CloudWatch Logs to:</p><ul><li><p><b>Monitor logs from EC2 instances in real-time</b>: You can use CloudWatch Logs to monitor applications and systems using log data. For example, CloudWatch Logs can track the number of errors that occur in your application logs and send you a notification whenever the rate of errors exceeds a threshold that you specify. CloudWatch Logs uses your log data for monitoring; so, no code changes are required. For example, you can monitor application logs for specific literal terms (such as "NullReferenceException") or count the number of occurrences of a literal term at a particular position in log data (such as "404" status codes in an Apache access log). When the term you are searching for is found, CloudWatch Logs reports the data to a CloudWatch metric that you specify.</p></li><li><p><b>Monitor AWS CloudTrail logged events</b>: You can create alarms in CloudWatch and receive notifications of particular API activity as captured by CloudTrail and use the notification to perform troubleshooting.</p></li><li><p><b>Archive log data</b>: You can use CloudWatch Logs to store your log data in highly durable storage. You can change the log retention setting so that any log events older than this setting are automatically deleted. The CloudWatch Logs agent makes it easy to quickly send both rotated and non-rotated log data off of a host and into the log service. You can then access the raw log data when you need it.</p></li></ul>
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
 <p>Associates the specified AWS Key Management Service (AWS KMS) customer master key (CMK) with the specified log group.</p><p>Associating an AWS KMS CMK with a log group overrides any existing associations between the log group and a CMK. After a CMK is associated with a log group, all newly ingested data for the log group is encrypted using the CMK. This association is stored as long as the data encrypted with the CMK is still within Amazon CloudWatch Logs. This enables Amazon CloudWatch Logs to decrypt this data whenever it is requested.</p><note><p><b>Important:</b> CloudWatch Logs supports only symmetric CMKs. Do not use an associate an asymmetric CMK with your log group. For more information, see <a href="https://docs.aws.amazon.com/kms/latest/developerguide/symmetric-asymmetric.html">Using Symmetric and Asymmetric Keys</a>.</p></note><p>Note that it can take up to 5 minutes for this operation to take effect.</p><p>If you attempt to associate a CMK with a log group but the CMK does not exist or the CMK is disabled, you will receive an <code>InvalidParameterException</code> error. </p>
 
 @param request A container for the necessary parameters to execute the AssociateKmsKey service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorOperationAborted`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsAssociateKmsKeyRequest
 */
- (AWSTask *)associateKmsKey:(AWSLogsAssociateKmsKeyRequest *)request;

/**
 <p>Associates the specified AWS Key Management Service (AWS KMS) customer master key (CMK) with the specified log group.</p><p>Associating an AWS KMS CMK with a log group overrides any existing associations between the log group and a CMK. After a CMK is associated with a log group, all newly ingested data for the log group is encrypted using the CMK. This association is stored as long as the data encrypted with the CMK is still within Amazon CloudWatch Logs. This enables Amazon CloudWatch Logs to decrypt this data whenever it is requested.</p><note><p><b>Important:</b> CloudWatch Logs supports only symmetric CMKs. Do not use an associate an asymmetric CMK with your log group. For more information, see <a href="https://docs.aws.amazon.com/kms/latest/developerguide/symmetric-asymmetric.html">Using Symmetric and Asymmetric Keys</a>.</p></note><p>Note that it can take up to 5 minutes for this operation to take effect.</p><p>If you attempt to associate a CMK with a log group but the CMK does not exist or the CMK is disabled, you will receive an <code>InvalidParameterException</code> error. </p>
 
 @param request A container for the necessary parameters to execute the AssociateKmsKey service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorOperationAborted`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsAssociateKmsKeyRequest
 */
- (void)associateKmsKey:(AWSLogsAssociateKmsKeyRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

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
 <p>Creates an export task, which allows you to efficiently export data from a log group to an Amazon S3 bucket.</p><p>This is an asynchronous call. If all the required information is provided, this operation initiates an export task and responds with the ID of the task. After the task has started, you can use <a>DescribeExportTasks</a> to get the status of the export task. Each account can only have one active (<code>RUNNING</code> or <code>PENDING</code>) export task at a time. To cancel an export task, use <a>CancelExportTask</a>.</p><p>You can export logs from multiple log groups or multiple time ranges to the same S3 bucket. To separate out log data for each export task, you can specify a prefix to be used as the Amazon S3 key prefix for all exported objects.</p><p>Exporting to S3 buckets that are encrypted with AES-256 is supported. Exporting to S3 buckets encrypted with SSE-KMS is not supported. </p>
 
 @param request A container for the necessary parameters to execute the CreateExportTask service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLogsCreateExportTaskResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorLimitExceeded`, `AWSLogsErrorOperationAborted`, `AWSLogsErrorServiceUnavailable`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorResourceAlreadyExists`.
 
 @see AWSLogsCreateExportTaskRequest
 @see AWSLogsCreateExportTaskResponse
 */
- (AWSTask<AWSLogsCreateExportTaskResponse *> *)createExportTask:(AWSLogsCreateExportTaskRequest *)request;

/**
 <p>Creates an export task, which allows you to efficiently export data from a log group to an Amazon S3 bucket.</p><p>This is an asynchronous call. If all the required information is provided, this operation initiates an export task and responds with the ID of the task. After the task has started, you can use <a>DescribeExportTasks</a> to get the status of the export task. Each account can only have one active (<code>RUNNING</code> or <code>PENDING</code>) export task at a time. To cancel an export task, use <a>CancelExportTask</a>.</p><p>You can export logs from multiple log groups or multiple time ranges to the same S3 bucket. To separate out log data for each export task, you can specify a prefix to be used as the Amazon S3 key prefix for all exported objects.</p><p>Exporting to S3 buckets that are encrypted with AES-256 is supported. Exporting to S3 buckets encrypted with SSE-KMS is not supported. </p>
 
 @param request A container for the necessary parameters to execute the CreateExportTask service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorLimitExceeded`, `AWSLogsErrorOperationAborted`, `AWSLogsErrorServiceUnavailable`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorResourceAlreadyExists`.
 
 @see AWSLogsCreateExportTaskRequest
 @see AWSLogsCreateExportTaskResponse
 */
- (void)createExportTask:(AWSLogsCreateExportTaskRequest *)request completionHandler:(void (^ _Nullable)(AWSLogsCreateExportTaskResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a log group with the specified name.</p><p>You can create up to 20,000 log groups per account.</p><p>You must use the following guidelines when naming a log group:</p><ul><li><p>Log group names must be unique within a region for an AWS account.</p></li><li><p>Log group names can be between 1 and 512 characters long.</p></li><li><p>Log group names consist of the following characters: a-z, A-Z, 0-9, '_' (underscore), '-' (hyphen), '/' (forward slash), '.' (period), and '#' (number sign)</p></li></ul><p>If you associate a AWS Key Management Service (AWS KMS) customer master key (CMK) with the log group, ingested data is encrypted using the CMK. This association is stored as long as the data encrypted with the CMK is still within Amazon CloudWatch Logs. This enables Amazon CloudWatch Logs to decrypt this data whenever it is requested.</p><p>If you attempt to associate a CMK with the log group but the CMK does not exist or the CMK is disabled, you will receive an <code>InvalidParameterException</code> error. </p><note><p><b>Important:</b> CloudWatch Logs supports only symmetric CMKs. Do not associate an asymmetric CMK with your log group. For more information, see <a href="https://docs.aws.amazon.com/kms/latest/developerguide/symmetric-asymmetric.html">Using Symmetric and Asymmetric Keys</a>.</p></note>
 
 @param request A container for the necessary parameters to execute the CreateLogGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorResourceAlreadyExists`, `AWSLogsErrorLimitExceeded`, `AWSLogsErrorOperationAborted`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsCreateLogGroupRequest
 */
- (AWSTask *)createLogGroup:(AWSLogsCreateLogGroupRequest *)request;

/**
 <p>Creates a log group with the specified name.</p><p>You can create up to 20,000 log groups per account.</p><p>You must use the following guidelines when naming a log group:</p><ul><li><p>Log group names must be unique within a region for an AWS account.</p></li><li><p>Log group names can be between 1 and 512 characters long.</p></li><li><p>Log group names consist of the following characters: a-z, A-Z, 0-9, '_' (underscore), '-' (hyphen), '/' (forward slash), '.' (period), and '#' (number sign)</p></li></ul><p>If you associate a AWS Key Management Service (AWS KMS) customer master key (CMK) with the log group, ingested data is encrypted using the CMK. This association is stored as long as the data encrypted with the CMK is still within Amazon CloudWatch Logs. This enables Amazon CloudWatch Logs to decrypt this data whenever it is requested.</p><p>If you attempt to associate a CMK with the log group but the CMK does not exist or the CMK is disabled, you will receive an <code>InvalidParameterException</code> error. </p><note><p><b>Important:</b> CloudWatch Logs supports only symmetric CMKs. Do not associate an asymmetric CMK with your log group. For more information, see <a href="https://docs.aws.amazon.com/kms/latest/developerguide/symmetric-asymmetric.html">Using Symmetric and Asymmetric Keys</a>.</p></note>
 
 @param request A container for the necessary parameters to execute the CreateLogGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorResourceAlreadyExists`, `AWSLogsErrorLimitExceeded`, `AWSLogsErrorOperationAborted`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsCreateLogGroupRequest
 */
- (void)createLogGroup:(AWSLogsCreateLogGroupRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Creates a log stream for the specified log group.</p><p>There is no limit on the number of log streams that you can create for a log group. There is a limit of 50 TPS on <code>CreateLogStream</code> operations, after which transactions are throttled.</p><p>You must use the following guidelines when naming a log stream:</p><ul><li><p>Log stream names must be unique within the log group.</p></li><li><p>Log stream names can be between 1 and 512 characters long.</p></li><li><p>The ':' (colon) and '*' (asterisk) characters are not allowed.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the CreateLogStream service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorResourceAlreadyExists`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsCreateLogStreamRequest
 */
- (AWSTask *)createLogStream:(AWSLogsCreateLogStreamRequest *)request;

/**
 <p>Creates a log stream for the specified log group.</p><p>There is no limit on the number of log streams that you can create for a log group. There is a limit of 50 TPS on <code>CreateLogStream</code> operations, after which transactions are throttled.</p><p>You must use the following guidelines when naming a log stream:</p><ul><li><p>Log stream names must be unique within the log group.</p></li><li><p>Log stream names can be between 1 and 512 characters long.</p></li><li><p>The ':' (colon) and '*' (asterisk) characters are not allowed.</p></li></ul>
 
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
 <p>Deletes a resource policy from this account. This revokes the access of the identities in that policy to put log events to this account.</p>
 
 @param request A container for the necessary parameters to execute the DeleteResourcePolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsDeleteResourcePolicyRequest
 */
- (AWSTask *)deleteResourcePolicy:(AWSLogsDeleteResourcePolicyRequest *)request;

/**
 <p>Deletes a resource policy from this account. This revokes the access of the identities in that policy to put log events to this account.</p>
 
 @param request A container for the necessary parameters to execute the DeleteResourcePolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsDeleteResourcePolicyRequest
 */
- (void)deleteResourcePolicy:(AWSLogsDeleteResourcePolicyRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

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
 <p>Lists the specified metric filters. You can list all the metric filters or filter the results by log name, prefix, metric name, or metric namespace. The results are ASCII-sorted by filter name.</p>
 
 @param request A container for the necessary parameters to execute the DescribeMetricFilters service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLogsDescribeMetricFiltersResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsDescribeMetricFiltersRequest
 @see AWSLogsDescribeMetricFiltersResponse
 */
- (AWSTask<AWSLogsDescribeMetricFiltersResponse *> *)describeMetricFilters:(AWSLogsDescribeMetricFiltersRequest *)request;

/**
 <p>Lists the specified metric filters. You can list all the metric filters or filter the results by log name, prefix, metric name, or metric namespace. The results are ASCII-sorted by filter name.</p>
 
 @param request A container for the necessary parameters to execute the DescribeMetricFilters service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsDescribeMetricFiltersRequest
 @see AWSLogsDescribeMetricFiltersResponse
 */
- (void)describeMetricFilters:(AWSLogsDescribeMetricFiltersRequest *)request completionHandler:(void (^ _Nullable)(AWSLogsDescribeMetricFiltersResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of CloudWatch Logs Insights queries that are scheduled, executing, or have been executed recently in this account. You can request all queries, or limit it to queries of a specific log group or queries with a certain status.</p>
 
 @param request A container for the necessary parameters to execute the DescribeQueries service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLogsDescribeQueriesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsDescribeQueriesRequest
 @see AWSLogsDescribeQueriesResponse
 */
- (AWSTask<AWSLogsDescribeQueriesResponse *> *)describeQueries:(AWSLogsDescribeQueriesRequest *)request;

/**
 <p>Returns a list of CloudWatch Logs Insights queries that are scheduled, executing, or have been executed recently in this account. You can request all queries, or limit it to queries of a specific log group or queries with a certain status.</p>
 
 @param request A container for the necessary parameters to execute the DescribeQueries service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsDescribeQueriesRequest
 @see AWSLogsDescribeQueriesResponse
 */
- (void)describeQueries:(AWSLogsDescribeQueriesRequest *)request completionHandler:(void (^ _Nullable)(AWSLogsDescribeQueriesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the resource policies in this account.</p>
 
 @param request A container for the necessary parameters to execute the DescribeResourcePolicies service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLogsDescribeResourcePoliciesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsDescribeResourcePoliciesRequest
 @see AWSLogsDescribeResourcePoliciesResponse
 */
- (AWSTask<AWSLogsDescribeResourcePoliciesResponse *> *)describeResourcePolicies:(AWSLogsDescribeResourcePoliciesRequest *)request;

/**
 <p>Lists the resource policies in this account.</p>
 
 @param request A container for the necessary parameters to execute the DescribeResourcePolicies service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsDescribeResourcePoliciesRequest
 @see AWSLogsDescribeResourcePoliciesResponse
 */
- (void)describeResourcePolicies:(AWSLogsDescribeResourcePoliciesRequest *)request completionHandler:(void (^ _Nullable)(AWSLogsDescribeResourcePoliciesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

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
 <p>Disassociates the associated AWS Key Management Service (AWS KMS) customer master key (CMK) from the specified log group.</p><p>After the AWS KMS CMK is disassociated from the log group, AWS CloudWatch Logs stops encrypting newly ingested data for the log group. All previously ingested data remains encrypted, and AWS CloudWatch Logs requires permissions for the CMK whenever the encrypted data is requested.</p><p>Note that it can take up to 5 minutes for this operation to take effect.</p>
 
 @param request A container for the necessary parameters to execute the DisassociateKmsKey service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorOperationAborted`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsDisassociateKmsKeyRequest
 */
- (AWSTask *)disassociateKmsKey:(AWSLogsDisassociateKmsKeyRequest *)request;

/**
 <p>Disassociates the associated AWS Key Management Service (AWS KMS) customer master key (CMK) from the specified log group.</p><p>After the AWS KMS CMK is disassociated from the log group, AWS CloudWatch Logs stops encrypting newly ingested data for the log group. All previously ingested data remains encrypted, and AWS CloudWatch Logs requires permissions for the CMK whenever the encrypted data is requested.</p><p>Note that it can take up to 5 minutes for this operation to take effect.</p>
 
 @param request A container for the necessary parameters to execute the DisassociateKmsKey service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorOperationAborted`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsDisassociateKmsKeyRequest
 */
- (void)disassociateKmsKey:(AWSLogsDisassociateKmsKeyRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Lists log events from the specified log group. You can list all the log events or filter the results using a filter pattern, a time range, and the name of the log stream.</p><p>By default, this operation returns as many log events as can fit in 1 MB (up to 10,000 log events), or all the events found within the time range that you specify. If the results include a token, then there are more log events available, and you can get additional results by specifying the token in a subsequent call.</p>
 
 @param request A container for the necessary parameters to execute the FilterLogEvents service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLogsFilterLogEventsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsFilterLogEventsRequest
 @see AWSLogsFilterLogEventsResponse
 */
- (AWSTask<AWSLogsFilterLogEventsResponse *> *)filterLogEvents:(AWSLogsFilterLogEventsRequest *)request;

/**
 <p>Lists log events from the specified log group. You can list all the log events or filter the results using a filter pattern, a time range, and the name of the log stream.</p><p>By default, this operation returns as many log events as can fit in 1 MB (up to 10,000 log events), or all the events found within the time range that you specify. If the results include a token, then there are more log events available, and you can get additional results by specifying the token in a subsequent call.</p>
 
 @param request A container for the necessary parameters to execute the FilterLogEvents service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsFilterLogEventsRequest
 @see AWSLogsFilterLogEventsResponse
 */
- (void)filterLogEvents:(AWSLogsFilterLogEventsRequest *)request completionHandler:(void (^ _Nullable)(AWSLogsFilterLogEventsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists log events from the specified log stream. You can list all the log events or filter using a time range.</p><p>By default, this operation returns as many log events as can fit in a response size of 1MB (up to 10,000 log events). You can get additional log events by specifying one of the tokens in a subsequent call.</p>
 
 @param request A container for the necessary parameters to execute the GetLogEvents service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLogsGetLogEventsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsGetLogEventsRequest
 @see AWSLogsGetLogEventsResponse
 */
- (AWSTask<AWSLogsGetLogEventsResponse *> *)getLogEvents:(AWSLogsGetLogEventsRequest *)request;

/**
 <p>Lists log events from the specified log stream. You can list all the log events or filter using a time range.</p><p>By default, this operation returns as many log events as can fit in a response size of 1MB (up to 10,000 log events). You can get additional log events by specifying one of the tokens in a subsequent call.</p>
 
 @param request A container for the necessary parameters to execute the GetLogEvents service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsGetLogEventsRequest
 @see AWSLogsGetLogEventsResponse
 */
- (void)getLogEvents:(AWSLogsGetLogEventsRequest *)request completionHandler:(void (^ _Nullable)(AWSLogsGetLogEventsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of the fields that are included in log events in the specified log group, along with the percentage of log events that contain each field. The search is limited to a time period that you specify.</p><p>In the results, fields that start with @ are fields generated by CloudWatch Logs. For example, <code>@timestamp</code> is the timestamp of each log event.</p><p>The response results are sorted by the frequency percentage, starting with the highest percentage.</p>
 
 @param request A container for the necessary parameters to execute the GetLogGroupFields service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLogsGetLogGroupFieldsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorLimitExceeded`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsGetLogGroupFieldsRequest
 @see AWSLogsGetLogGroupFieldsResponse
 */
- (AWSTask<AWSLogsGetLogGroupFieldsResponse *> *)getLogGroupFields:(AWSLogsGetLogGroupFieldsRequest *)request;

/**
 <p>Returns a list of the fields that are included in log events in the specified log group, along with the percentage of log events that contain each field. The search is limited to a time period that you specify.</p><p>In the results, fields that start with @ are fields generated by CloudWatch Logs. For example, <code>@timestamp</code> is the timestamp of each log event.</p><p>The response results are sorted by the frequency percentage, starting with the highest percentage.</p>
 
 @param request A container for the necessary parameters to execute the GetLogGroupFields service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorLimitExceeded`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsGetLogGroupFieldsRequest
 @see AWSLogsGetLogGroupFieldsResponse
 */
- (void)getLogGroupFields:(AWSLogsGetLogGroupFieldsRequest *)request completionHandler:(void (^ _Nullable)(AWSLogsGetLogGroupFieldsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves all the fields and values of a single log event. All fields are retrieved, even if the original query that produced the <code>logRecordPointer</code> retrieved only a subset of fields. Fields are returned as field name/field value pairs.</p><p>Additionally, the entire unparsed log event is returned within <code>@message</code>.</p>
 
 @param request A container for the necessary parameters to execute the GetLogRecord service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLogsGetLogRecordResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorLimitExceeded`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsGetLogRecordRequest
 @see AWSLogsGetLogRecordResponse
 */
- (AWSTask<AWSLogsGetLogRecordResponse *> *)getLogRecord:(AWSLogsGetLogRecordRequest *)request;

/**
 <p>Retrieves all the fields and values of a single log event. All fields are retrieved, even if the original query that produced the <code>logRecordPointer</code> retrieved only a subset of fields. Fields are returned as field name/field value pairs.</p><p>Additionally, the entire unparsed log event is returned within <code>@message</code>.</p>
 
 @param request A container for the necessary parameters to execute the GetLogRecord service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorLimitExceeded`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsGetLogRecordRequest
 @see AWSLogsGetLogRecordResponse
 */
- (void)getLogRecord:(AWSLogsGetLogRecordRequest *)request completionHandler:(void (^ _Nullable)(AWSLogsGetLogRecordResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the results from the specified query.</p><p>Only the fields requested in the query are returned, along with a <code>@ptr</code> field which is the identifier for the log record. You can use the value of <code>@ptr</code> in a operation to get the full log record.</p><p><code>GetQueryResults</code> does not start a query execution. To run a query, use .</p><p>If the value of the <code>Status</code> field in the output is <code>Running</code>, this operation returns only partial results. If you see a value of <code>Scheduled</code> or <code>Running</code> for the status, you can retry the operation later to see the final results. </p>
 
 @param request A container for the necessary parameters to execute the GetQueryResults service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLogsGetQueryResultsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsGetQueryResultsRequest
 @see AWSLogsGetQueryResultsResponse
 */
- (AWSTask<AWSLogsGetQueryResultsResponse *> *)getQueryResults:(AWSLogsGetQueryResultsRequest *)request;

/**
 <p>Returns the results from the specified query.</p><p>Only the fields requested in the query are returned, along with a <code>@ptr</code> field which is the identifier for the log record. You can use the value of <code>@ptr</code> in a operation to get the full log record.</p><p><code>GetQueryResults</code> does not start a query execution. To run a query, use .</p><p>If the value of the <code>Status</code> field in the output is <code>Running</code>, this operation returns only partial results. If you see a value of <code>Scheduled</code> or <code>Running</code> for the status, you can retry the operation later to see the final results. </p>
 
 @param request A container for the necessary parameters to execute the GetQueryResults service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsGetQueryResultsRequest
 @see AWSLogsGetQueryResultsResponse
 */
- (void)getQueryResults:(AWSLogsGetQueryResultsRequest *)request completionHandler:(void (^ _Nullable)(AWSLogsGetQueryResultsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the tags for the specified log group.</p>
 
 @param request A container for the necessary parameters to execute the ListTagsLogGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLogsListTagsLogGroupResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorResourceNotFound`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsListTagsLogGroupRequest
 @see AWSLogsListTagsLogGroupResponse
 */
- (AWSTask<AWSLogsListTagsLogGroupResponse *> *)listTagsLogGroup:(AWSLogsListTagsLogGroupRequest *)request;

/**
 <p>Lists the tags for the specified log group.</p>
 
 @param request A container for the necessary parameters to execute the ListTagsLogGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorResourceNotFound`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsListTagsLogGroupRequest
 @see AWSLogsListTagsLogGroupResponse
 */
- (void)listTagsLogGroup:(AWSLogsListTagsLogGroupRequest *)request completionHandler:(void (^ _Nullable)(AWSLogsListTagsLogGroupResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates or updates a destination. This operation is used only to create destinations for cross-account subscriptions.</p><p>A destination encapsulates a physical resource (such as an Amazon Kinesis stream) and enables you to subscribe to a real-time stream of log events for a different account, ingested using <a>PutLogEvents</a>.</p><p>Through an access policy, a destination controls what is written to it. By default, <code>PutDestination</code> does not set any access policy with the destination, which means a cross-account user cannot call <a>PutSubscriptionFilter</a> against this destination. To enable this, the destination owner must call <a>PutDestinationPolicy</a> after <code>PutDestination</code>.</p>
 
 @param request A container for the necessary parameters to execute the PutDestination service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLogsPutDestinationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorOperationAborted`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsPutDestinationRequest
 @see AWSLogsPutDestinationResponse
 */
- (AWSTask<AWSLogsPutDestinationResponse *> *)putDestination:(AWSLogsPutDestinationRequest *)request;

/**
 <p>Creates or updates a destination. This operation is used only to create destinations for cross-account subscriptions.</p><p>A destination encapsulates a physical resource (such as an Amazon Kinesis stream) and enables you to subscribe to a real-time stream of log events for a different account, ingested using <a>PutLogEvents</a>.</p><p>Through an access policy, a destination controls what is written to it. By default, <code>PutDestination</code> does not set any access policy with the destination, which means a cross-account user cannot call <a>PutSubscriptionFilter</a> against this destination. To enable this, the destination owner must call <a>PutDestinationPolicy</a> after <code>PutDestination</code>.</p>
 
 @param request A container for the necessary parameters to execute the PutDestination service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorOperationAborted`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsPutDestinationRequest
 @see AWSLogsPutDestinationResponse
 */
- (void)putDestination:(AWSLogsPutDestinationRequest *)request completionHandler:(void (^ _Nullable)(AWSLogsPutDestinationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates or updates an access policy associated with an existing destination. An access policy is an <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/policies_overview.html">IAM policy document</a> that is used to authorize claims to register a subscription filter against a given destination.</p>
 
 @param request A container for the necessary parameters to execute the PutDestinationPolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorOperationAborted`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsPutDestinationPolicyRequest
 */
- (AWSTask *)putDestinationPolicy:(AWSLogsPutDestinationPolicyRequest *)request;

/**
 <p>Creates or updates an access policy associated with an existing destination. An access policy is an <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/policies_overview.html">IAM policy document</a> that is used to authorize claims to register a subscription filter against a given destination.</p>
 
 @param request A container for the necessary parameters to execute the PutDestinationPolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorOperationAborted`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsPutDestinationPolicyRequest
 */
- (void)putDestinationPolicy:(AWSLogsPutDestinationPolicyRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Uploads a batch of log events to the specified log stream.</p><p>You must include the sequence token obtained from the response of the previous call. An upload in a newly created log stream does not require a sequence token. You can also get the sequence token in the <code>expectedSequenceToken</code> field from <code>InvalidSequenceTokenException</code>. If you call <code>PutLogEvents</code> twice within a narrow time period using the same value for <code>sequenceToken</code>, both calls may be successful, or one may be rejected.</p><p>The batch of events must satisfy the following constraints:</p><ul><li><p>The maximum batch size is 1,048,576 bytes, and this size is calculated as the sum of all event messages in UTF-8, plus 26 bytes for each log event.</p></li><li><p>None of the log events in the batch can be more than 2 hours in the future.</p></li><li><p>None of the log events in the batch can be older than 14 days or older than the retention period of the log group.</p></li><li><p>The log events in the batch must be in chronological ordered by their timestamp. The timestamp is the time the event occurred, expressed as the number of milliseconds after Jan 1, 1970 00:00:00 UTC. (In AWS Tools for PowerShell and the AWS SDK for .NET, the timestamp is specified in .NET format: yyyy-mm-ddThh:mm:ss. For example, 2017-09-15T13:45:30.) </p></li><li><p>A batch of log events in a single request cannot span more than 24 hours. Otherwise, the operation fails.</p></li><li><p>The maximum number of log events in a batch is 10,000.</p></li><li><p>There is a quota of 5 requests per second per log stream. Additional requests are throttled. This quota can't be changed.</p></li></ul><p>If a call to PutLogEvents returns "UnrecognizedClientException" the most likely cause is an invalid AWS access key ID or secret key. </p>
 
 @param request A container for the necessary parameters to execute the PutLogEvents service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLogsPutLogEventsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorInvalidSequenceToken`, `AWSLogsErrorDataAlreadyAccepted`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorServiceUnavailable`, `AWSLogsErrorUnrecognizedClient`.
 
 @see AWSLogsPutLogEventsRequest
 @see AWSLogsPutLogEventsResponse
 */
- (AWSTask<AWSLogsPutLogEventsResponse *> *)putLogEvents:(AWSLogsPutLogEventsRequest *)request;

/**
 <p>Uploads a batch of log events to the specified log stream.</p><p>You must include the sequence token obtained from the response of the previous call. An upload in a newly created log stream does not require a sequence token. You can also get the sequence token in the <code>expectedSequenceToken</code> field from <code>InvalidSequenceTokenException</code>. If you call <code>PutLogEvents</code> twice within a narrow time period using the same value for <code>sequenceToken</code>, both calls may be successful, or one may be rejected.</p><p>The batch of events must satisfy the following constraints:</p><ul><li><p>The maximum batch size is 1,048,576 bytes, and this size is calculated as the sum of all event messages in UTF-8, plus 26 bytes for each log event.</p></li><li><p>None of the log events in the batch can be more than 2 hours in the future.</p></li><li><p>None of the log events in the batch can be older than 14 days or older than the retention period of the log group.</p></li><li><p>The log events in the batch must be in chronological ordered by their timestamp. The timestamp is the time the event occurred, expressed as the number of milliseconds after Jan 1, 1970 00:00:00 UTC. (In AWS Tools for PowerShell and the AWS SDK for .NET, the timestamp is specified in .NET format: yyyy-mm-ddThh:mm:ss. For example, 2017-09-15T13:45:30.) </p></li><li><p>A batch of log events in a single request cannot span more than 24 hours. Otherwise, the operation fails.</p></li><li><p>The maximum number of log events in a batch is 10,000.</p></li><li><p>There is a quota of 5 requests per second per log stream. Additional requests are throttled. This quota can't be changed.</p></li></ul><p>If a call to PutLogEvents returns "UnrecognizedClientException" the most likely cause is an invalid AWS access key ID or secret key. </p>
 
 @param request A container for the necessary parameters to execute the PutLogEvents service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorInvalidSequenceToken`, `AWSLogsErrorDataAlreadyAccepted`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorServiceUnavailable`, `AWSLogsErrorUnrecognizedClient`.
 
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
 <p>Creates or updates a resource policy allowing other AWS services to put log events to this account, such as Amazon Route 53. An account can have up to 10 resource policies per region.</p>
 
 @param request A container for the necessary parameters to execute the PutResourcePolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLogsPutResourcePolicyResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorLimitExceeded`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsPutResourcePolicyRequest
 @see AWSLogsPutResourcePolicyResponse
 */
- (AWSTask<AWSLogsPutResourcePolicyResponse *> *)putResourcePolicy:(AWSLogsPutResourcePolicyRequest *)request;

/**
 <p>Creates or updates a resource policy allowing other AWS services to put log events to this account, such as Amazon Route 53. An account can have up to 10 resource policies per region.</p>
 
 @param request A container for the necessary parameters to execute the PutResourcePolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorLimitExceeded`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsPutResourcePolicyRequest
 @see AWSLogsPutResourcePolicyResponse
 */
- (void)putResourcePolicy:(AWSLogsPutResourcePolicyRequest *)request completionHandler:(void (^ _Nullable)(AWSLogsPutResourcePolicyResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Sets the retention of the specified log group. A retention policy allows you to configure the number of days for which to retain log events in the specified log group.</p>
 
 @param request A container for the necessary parameters to execute the PutRetentionPolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorOperationAborted`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsPutRetentionPolicyRequest
 */
- (AWSTask *)putRetentionPolicy:(AWSLogsPutRetentionPolicyRequest *)request;

/**
 <p>Sets the retention of the specified log group. A retention policy allows you to configure the number of days for which to retain log events in the specified log group.</p>
 
 @param request A container for the necessary parameters to execute the PutRetentionPolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorOperationAborted`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsPutRetentionPolicyRequest
 */
- (void)putRetentionPolicy:(AWSLogsPutRetentionPolicyRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Creates or updates a subscription filter and associates it with the specified log group. Subscription filters allow you to subscribe to a real-time stream of log events ingested through <a>PutLogEvents</a> and have them delivered to a specific destination. Currently, the supported destinations are:</p><ul><li><p>An Amazon Kinesis stream belonging to the same account as the subscription filter, for same-account delivery.</p></li><li><p>A logical destination that belongs to a different account, for cross-account delivery.</p></li><li><p>An Amazon Kinesis Firehose delivery stream that belongs to the same account as the subscription filter, for same-account delivery.</p></li><li><p>An AWS Lambda function that belongs to the same account as the subscription filter, for same-account delivery.</p></li></ul><p>There can only be one subscription filter associated with a log group. If you are updating an existing filter, you must specify the correct name in <code>filterName</code>. Otherwise, the call fails because you cannot associate a second filter with a log group.</p>
 
 @param request A container for the necessary parameters to execute the PutSubscriptionFilter service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorOperationAborted`, `AWSLogsErrorLimitExceeded`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsPutSubscriptionFilterRequest
 */
- (AWSTask *)putSubscriptionFilter:(AWSLogsPutSubscriptionFilterRequest *)request;

/**
 <p>Creates or updates a subscription filter and associates it with the specified log group. Subscription filters allow you to subscribe to a real-time stream of log events ingested through <a>PutLogEvents</a> and have them delivered to a specific destination. Currently, the supported destinations are:</p><ul><li><p>An Amazon Kinesis stream belonging to the same account as the subscription filter, for same-account delivery.</p></li><li><p>A logical destination that belongs to a different account, for cross-account delivery.</p></li><li><p>An Amazon Kinesis Firehose delivery stream that belongs to the same account as the subscription filter, for same-account delivery.</p></li><li><p>An AWS Lambda function that belongs to the same account as the subscription filter, for same-account delivery.</p></li></ul><p>There can only be one subscription filter associated with a log group. If you are updating an existing filter, you must specify the correct name in <code>filterName</code>. Otherwise, the call fails because you cannot associate a second filter with a log group.</p>
 
 @param request A container for the necessary parameters to execute the PutSubscriptionFilter service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorOperationAborted`, `AWSLogsErrorLimitExceeded`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsPutSubscriptionFilterRequest
 */
- (void)putSubscriptionFilter:(AWSLogsPutSubscriptionFilterRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Schedules a query of a log group using CloudWatch Logs Insights. You specify the log group and time range to query, and the query string to use.</p><p>For more information, see <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CWL_QuerySyntax.html">CloudWatch Logs Insights Query Syntax</a>.</p><p>Queries time out after 15 minutes of execution. If your queries are timing out, reduce the time range being searched, or partition your query into a number of queries.</p>
 
 @param request A container for the necessary parameters to execute the StartQuery service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLogsStartQueryResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorMalformedQuery`, `AWSLogsErrorInvalidParameter`, `AWSLogsErrorLimitExceeded`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsStartQueryRequest
 @see AWSLogsStartQueryResponse
 */
- (AWSTask<AWSLogsStartQueryResponse *> *)startQuery:(AWSLogsStartQueryRequest *)request;

/**
 <p>Schedules a query of a log group using CloudWatch Logs Insights. You specify the log group and time range to query, and the query string to use.</p><p>For more information, see <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CWL_QuerySyntax.html">CloudWatch Logs Insights Query Syntax</a>.</p><p>Queries time out after 15 minutes of execution. If your queries are timing out, reduce the time range being searched, or partition your query into a number of queries.</p>
 
 @param request A container for the necessary parameters to execute the StartQuery service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorMalformedQuery`, `AWSLogsErrorInvalidParameter`, `AWSLogsErrorLimitExceeded`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsStartQueryRequest
 @see AWSLogsStartQueryResponse
 */
- (void)startQuery:(AWSLogsStartQueryRequest *)request completionHandler:(void (^ _Nullable)(AWSLogsStartQueryResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Stops a CloudWatch Logs Insights query that is in progress. If the query has already ended, the operation returns an error indicating that the specified query is not running.</p>
 
 @param request A container for the necessary parameters to execute the StopQuery service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLogsStopQueryResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsStopQueryRequest
 @see AWSLogsStopQueryResponse
 */
- (AWSTask<AWSLogsStopQueryResponse *> *)stopQuery:(AWSLogsStopQueryRequest *)request;

/**
 <p>Stops a CloudWatch Logs Insights query that is in progress. If the query has already ended, the operation returns an error indicating that the specified query is not running.</p>
 
 @param request A container for the necessary parameters to execute the StopQuery service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsStopQueryRequest
 @see AWSLogsStopQueryResponse
 */
- (void)stopQuery:(AWSLogsStopQueryRequest *)request completionHandler:(void (^ _Nullable)(AWSLogsStopQueryResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Adds or updates the specified tags for the specified log group.</p><p>To list the tags for a log group, use <a>ListTagsLogGroup</a>. To remove tags, use <a>UntagLogGroup</a>.</p><p>For more information about tags, see <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/log-group-tagging.html">Tag Log Groups in Amazon CloudWatch Logs</a> in the <i>Amazon CloudWatch Logs User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the TagLogGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorResourceNotFound`, `AWSLogsErrorInvalidParameter`.
 
 @see AWSLogsTagLogGroupRequest
 */
- (AWSTask *)tagLogGroup:(AWSLogsTagLogGroupRequest *)request;

/**
 <p>Adds or updates the specified tags for the specified log group.</p><p>To list the tags for a log group, use <a>ListTagsLogGroup</a>. To remove tags, use <a>UntagLogGroup</a>.</p><p>For more information about tags, see <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/log-group-tagging.html">Tag Log Groups in Amazon CloudWatch Logs</a> in the <i>Amazon CloudWatch Logs User Guide</i>.</p>
 
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
