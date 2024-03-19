//
// Copyright 2010-2024 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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
 <p>You can use Amazon CloudWatch Logs to monitor, store, and access your log files from EC2 instances, CloudTrail, and other sources. You can then retrieve the associated log data from CloudWatch Logs using the CloudWatch console. Alternatively, you can use CloudWatch Logs commands in the Amazon Web Services CLI, CloudWatch Logs API, or CloudWatch Logs SDK.</p><p>You can use CloudWatch Logs to:</p><ul><li><p><b>Monitor logs from EC2 instances in real time</b>: You can use CloudWatch Logs to monitor applications and systems using log data. For example, CloudWatch Logs can track the number of errors that occur in your application logs. Then, it can send you a notification whenever the rate of errors exceeds a threshold that you specify. CloudWatch Logs uses your log data for monitoring so no code changes are required. For example, you can monitor application logs for specific literal terms (such as "NullReferenceException"). You can also count the number of occurrences of a literal term at a particular position in log data (such as "404" status codes in an Apache access log). When the term you are searching for is found, CloudWatch Logs reports the data to a CloudWatch metric that you specify.</p></li><li><p><b>Monitor CloudTrail logged events</b>: You can create alarms in CloudWatch and receive notifications of particular API activity as captured by CloudTrail. You can use the notification to perform troubleshooting.</p></li><li><p><b>Archive log data</b>: You can use CloudWatch Logs to store your log data in highly durable storage. You can change the log retention setting so that any log events earlier than this setting are automatically deleted. The CloudWatch Logs agent helps to quickly send both rotated and non-rotated log data off of a host and into the log service. You can then access the raw log data when you need it.</p></li></ul>
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
 <p>Associates the specified KMS key with either one log group in the account, or with all stored CloudWatch Logs query insights results in the account.</p><p>When you use <code>AssociateKmsKey</code>, you specify either the <code>logGroupName</code> parameter or the <code>resourceIdentifier</code> parameter. You can't specify both of those parameters in the same operation.</p><ul><li><p>Specify the <code>logGroupName</code> parameter to cause all log events stored in the log group to be encrypted with that key. Only the log events ingested after the key is associated are encrypted with that key.</p><p>Associating a KMS key with a log group overrides any existing associations between the log group and a KMS key. After a KMS key is associated with a log group, all newly ingested data for the log group is encrypted using the KMS key. This association is stored as long as the data encrypted with the KMS key is still within CloudWatch Logs. This enables CloudWatch Logs to decrypt this data whenever it is requested.</p><p>Associating a key with a log group does not cause the results of queries of that log group to be encrypted with that key. To have query results encrypted with a KMS key, you must use an <code>AssociateKmsKey</code> operation with the <code>resourceIdentifier</code> parameter that specifies a <code>query-result</code> resource. </p></li><li><p>Specify the <code>resourceIdentifier</code> parameter with a <code>query-result</code> resource, to use that key to encrypt the stored results of all future <a href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_StartQuery.html">StartQuery</a> operations in the account. The response from a <a href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_GetQueryResults.html">GetQueryResults</a> operation will still return the query results in plain text.</p><p>Even if you have not associated a key with your query results, the query results are encrypted when stored, using the default CloudWatch Logs method.</p><p>If you run a query from a monitoring account that queries logs in a source account, the query results key from the monitoring account, if any, is used.</p></li></ul><important><p>If you delete the key that is used to encrypt log events or log group query results, then all the associated stored log events or query results that were encrypted with that key will be unencryptable and unusable.</p></important><note><p>CloudWatch Logs supports only symmetric KMS keys. Do not use an associate an asymmetric KMS key with your log group or query results. For more information, see <a href="https://docs.aws.amazon.com/kms/latest/developerguide/symmetric-asymmetric.html">Using Symmetric and Asymmetric Keys</a>.</p></note><p>It can take up to 5 minutes for this operation to take effect.</p><p>If you attempt to associate a KMS key with a log group but the KMS key does not exist or the KMS key is disabled, you receive an <code>InvalidParameterException</code> error. </p>
 
 @param request A container for the necessary parameters to execute the AssociateKmsKey service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorOperationAborted`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsAssociateKmsKeyRequest
 */
- (AWSTask *)associateKmsKey:(AWSLogsAssociateKmsKeyRequest *)request;

/**
 <p>Associates the specified KMS key with either one log group in the account, or with all stored CloudWatch Logs query insights results in the account.</p><p>When you use <code>AssociateKmsKey</code>, you specify either the <code>logGroupName</code> parameter or the <code>resourceIdentifier</code> parameter. You can't specify both of those parameters in the same operation.</p><ul><li><p>Specify the <code>logGroupName</code> parameter to cause all log events stored in the log group to be encrypted with that key. Only the log events ingested after the key is associated are encrypted with that key.</p><p>Associating a KMS key with a log group overrides any existing associations between the log group and a KMS key. After a KMS key is associated with a log group, all newly ingested data for the log group is encrypted using the KMS key. This association is stored as long as the data encrypted with the KMS key is still within CloudWatch Logs. This enables CloudWatch Logs to decrypt this data whenever it is requested.</p><p>Associating a key with a log group does not cause the results of queries of that log group to be encrypted with that key. To have query results encrypted with a KMS key, you must use an <code>AssociateKmsKey</code> operation with the <code>resourceIdentifier</code> parameter that specifies a <code>query-result</code> resource. </p></li><li><p>Specify the <code>resourceIdentifier</code> parameter with a <code>query-result</code> resource, to use that key to encrypt the stored results of all future <a href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_StartQuery.html">StartQuery</a> operations in the account. The response from a <a href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_GetQueryResults.html">GetQueryResults</a> operation will still return the query results in plain text.</p><p>Even if you have not associated a key with your query results, the query results are encrypted when stored, using the default CloudWatch Logs method.</p><p>If you run a query from a monitoring account that queries logs in a source account, the query results key from the monitoring account, if any, is used.</p></li></ul><important><p>If you delete the key that is used to encrypt log events or log group query results, then all the associated stored log events or query results that were encrypted with that key will be unencryptable and unusable.</p></important><note><p>CloudWatch Logs supports only symmetric KMS keys. Do not use an associate an asymmetric KMS key with your log group or query results. For more information, see <a href="https://docs.aws.amazon.com/kms/latest/developerguide/symmetric-asymmetric.html">Using Symmetric and Asymmetric Keys</a>.</p></note><p>It can take up to 5 minutes for this operation to take effect.</p><p>If you attempt to associate a KMS key with a log group but the KMS key does not exist or the KMS key is disabled, you receive an <code>InvalidParameterException</code> error. </p>
 
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
 <p>Creates a <i>delivery</i>. A delivery is a connection between a logical <i>delivery source</i> and a logical <i>delivery destination</i> that you have already created.</p><p>Only some Amazon Web Services services support being configured as a delivery source using this operation. These services are listed as <b>Supported [V2 Permissions]</b> in the table at <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/AWS-logs-and-resource-policy.html">Enabling logging from Amazon Web Services services.</a></p><p>A delivery destination can represent a log group in CloudWatch Logs, an Amazon S3 bucket, or a delivery stream in Firehose.</p><p>To configure logs delivery between a supported Amazon Web Services service and a destination, you must do the following:</p><ul><li><p>Create a delivery source, which is a logical object that represents the resource that is actually sending the logs. For more information, see <a href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDeliverySource.html">PutDeliverySource</a>.</p></li><li><p>Create a <i>delivery destination</i>, which is a logical object that represents the actual delivery destination. For more information, see <a href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDeliveryDestination.html">PutDeliveryDestination</a>.</p></li><li><p>If you are delivering logs cross-account, you must use <a href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDeliveryDestinationPolicy.html">PutDeliveryDestinationPolicy</a> in the destination account to assign an IAM policy to the destination. This policy allows delivery to that destination. </p></li><li><p>Use <code>CreateDelivery</code> to create a <i>delivery</i> by pairing exactly one delivery source and one delivery destination. </p></li></ul><p>You can configure a single delivery source to send logs to multiple destinations by creating multiple deliveries. You can also create multiple deliveries to configure multiple delivery sources to send logs to the same delivery destination.</p><p>You can't update an existing delivery. You can only create and delete deliveries.</p>
 
 @param request A container for the necessary parameters to execute the CreateDelivery service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLogsCreateDeliveryResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorServiceUnavailable`, `AWSLogsErrorConflict`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorValidation`, `AWSLogsErrorAccessDenied`, `AWSLogsErrorServiceQuotaExceeded`, `AWSLogsErrorThrottling`.
 
 @see AWSLogsCreateDeliveryRequest
 @see AWSLogsCreateDeliveryResponse
 */
- (AWSTask<AWSLogsCreateDeliveryResponse *> *)createDelivery:(AWSLogsCreateDeliveryRequest *)request;

/**
 <p>Creates a <i>delivery</i>. A delivery is a connection between a logical <i>delivery source</i> and a logical <i>delivery destination</i> that you have already created.</p><p>Only some Amazon Web Services services support being configured as a delivery source using this operation. These services are listed as <b>Supported [V2 Permissions]</b> in the table at <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/AWS-logs-and-resource-policy.html">Enabling logging from Amazon Web Services services.</a></p><p>A delivery destination can represent a log group in CloudWatch Logs, an Amazon S3 bucket, or a delivery stream in Firehose.</p><p>To configure logs delivery between a supported Amazon Web Services service and a destination, you must do the following:</p><ul><li><p>Create a delivery source, which is a logical object that represents the resource that is actually sending the logs. For more information, see <a href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDeliverySource.html">PutDeliverySource</a>.</p></li><li><p>Create a <i>delivery destination</i>, which is a logical object that represents the actual delivery destination. For more information, see <a href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDeliveryDestination.html">PutDeliveryDestination</a>.</p></li><li><p>If you are delivering logs cross-account, you must use <a href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDeliveryDestinationPolicy.html">PutDeliveryDestinationPolicy</a> in the destination account to assign an IAM policy to the destination. This policy allows delivery to that destination. </p></li><li><p>Use <code>CreateDelivery</code> to create a <i>delivery</i> by pairing exactly one delivery source and one delivery destination. </p></li></ul><p>You can configure a single delivery source to send logs to multiple destinations by creating multiple deliveries. You can also create multiple deliveries to configure multiple delivery sources to send logs to the same delivery destination.</p><p>You can't update an existing delivery. You can only create and delete deliveries.</p>
 
 @param request A container for the necessary parameters to execute the CreateDelivery service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorServiceUnavailable`, `AWSLogsErrorConflict`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorValidation`, `AWSLogsErrorAccessDenied`, `AWSLogsErrorServiceQuotaExceeded`, `AWSLogsErrorThrottling`.
 
 @see AWSLogsCreateDeliveryRequest
 @see AWSLogsCreateDeliveryResponse
 */
- (void)createDelivery:(AWSLogsCreateDeliveryRequest *)request completionHandler:(void (^ _Nullable)(AWSLogsCreateDeliveryResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates an export task so that you can efficiently export data from a log group to an Amazon S3 bucket. When you perform a <code>CreateExportTask</code> operation, you must use credentials that have permission to write to the S3 bucket that you specify as the destination.</p><p>Exporting log data to S3 buckets that are encrypted by KMS is supported. Exporting log data to Amazon S3 buckets that have S3 Object Lock enabled with a retention period is also supported.</p><p>Exporting to S3 buckets that are encrypted with AES-256 is supported. </p><p>This is an asynchronous call. If all the required information is provided, this operation initiates an export task and responds with the ID of the task. After the task has started, you can use <a href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_DescribeExportTasks.html">DescribeExportTasks</a> to get the status of the export task. Each account can only have one active (<code>RUNNING</code> or <code>PENDING</code>) export task at a time. To cancel an export task, use <a href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_CancelExportTask.html">CancelExportTask</a>.</p><p>You can export logs from multiple log groups or multiple time ranges to the same S3 bucket. To separate log data for each export task, specify a prefix to be used as the Amazon S3 key prefix for all exported objects.</p><note><p>Time-based sorting on chunks of log data inside an exported file is not guaranteed. You can sort the exported log field data by using Linux utilities.</p></note>
 
 @param request A container for the necessary parameters to execute the CreateExportTask service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLogsCreateExportTaskResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorLimitExceeded`, `AWSLogsErrorOperationAborted`, `AWSLogsErrorServiceUnavailable`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorResourceAlreadyExists`.
 
 @see AWSLogsCreateExportTaskRequest
 @see AWSLogsCreateExportTaskResponse
 */
- (AWSTask<AWSLogsCreateExportTaskResponse *> *)createExportTask:(AWSLogsCreateExportTaskRequest *)request;

/**
 <p>Creates an export task so that you can efficiently export data from a log group to an Amazon S3 bucket. When you perform a <code>CreateExportTask</code> operation, you must use credentials that have permission to write to the S3 bucket that you specify as the destination.</p><p>Exporting log data to S3 buckets that are encrypted by KMS is supported. Exporting log data to Amazon S3 buckets that have S3 Object Lock enabled with a retention period is also supported.</p><p>Exporting to S3 buckets that are encrypted with AES-256 is supported. </p><p>This is an asynchronous call. If all the required information is provided, this operation initiates an export task and responds with the ID of the task. After the task has started, you can use <a href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_DescribeExportTasks.html">DescribeExportTasks</a> to get the status of the export task. Each account can only have one active (<code>RUNNING</code> or <code>PENDING</code>) export task at a time. To cancel an export task, use <a href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_CancelExportTask.html">CancelExportTask</a>.</p><p>You can export logs from multiple log groups or multiple time ranges to the same S3 bucket. To separate log data for each export task, specify a prefix to be used as the Amazon S3 key prefix for all exported objects.</p><note><p>Time-based sorting on chunks of log data inside an exported file is not guaranteed. You can sort the exported log field data by using Linux utilities.</p></note>
 
 @param request A container for the necessary parameters to execute the CreateExportTask service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorLimitExceeded`, `AWSLogsErrorOperationAborted`, `AWSLogsErrorServiceUnavailable`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorResourceAlreadyExists`.
 
 @see AWSLogsCreateExportTaskRequest
 @see AWSLogsCreateExportTaskResponse
 */
- (void)createExportTask:(AWSLogsCreateExportTaskRequest *)request completionHandler:(void (^ _Nullable)(AWSLogsCreateExportTaskResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates an <i>anomaly detector</i> that regularly scans one or more log groups and look for patterns and anomalies in the logs.</p><p>An anomaly detector can help surface issues by automatically discovering anomalies in your log event traffic. An anomaly detector uses machine learning algorithms to scan log events and find <i>patterns</i>. A pattern is a shared text structure that recurs among your log fields. Patterns provide a useful tool for analyzing large sets of logs because a large number of log events can often be compressed into a few patterns.</p><p>The anomaly detector uses pattern recognition to find <code>anomalies</code>, which are unusual log events. It uses the <code>evaluationFrequency</code> to compare current log events and patterns with trained baselines. </p><p>Fields within a pattern are called <i>tokens</i>. Fields that vary within a pattern, such as a request ID or timestamp, are referred to as <i>dynamic tokens</i> and represented by <code>&lt;*&gt;</code>. </p><p>The following is an example of a pattern:</p><p><code>[INFO] Request time: &lt;*&gt; ms</code></p><p>This pattern represents log events like <code>[INFO] Request time: 327 ms</code> and other similar log events that differ only by the number, in this csse 327. When the pattern is displayed, the different numbers are replaced by <code>&lt;*&gt;</code></p><note><p>Any parts of log events that are masked as sensitive data are not scanned for anomalies. For more information about masking sensitive data, see <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/mask-sensitive-log-data.html">Help protect sensitive log data with masking</a>. </p></note>
 
 @param request A container for the necessary parameters to execute the CreateLogAnomalyDetector service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLogsCreateLogAnomalyDetectorResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorServiceUnavailable`, `AWSLogsErrorOperationAborted`, `AWSLogsErrorLimitExceeded`.
 
 @see AWSLogsCreateLogAnomalyDetectorRequest
 @see AWSLogsCreateLogAnomalyDetectorResponse
 */
- (AWSTask<AWSLogsCreateLogAnomalyDetectorResponse *> *)createLogAnomalyDetector:(AWSLogsCreateLogAnomalyDetectorRequest *)request;

/**
 <p>Creates an <i>anomaly detector</i> that regularly scans one or more log groups and look for patterns and anomalies in the logs.</p><p>An anomaly detector can help surface issues by automatically discovering anomalies in your log event traffic. An anomaly detector uses machine learning algorithms to scan log events and find <i>patterns</i>. A pattern is a shared text structure that recurs among your log fields. Patterns provide a useful tool for analyzing large sets of logs because a large number of log events can often be compressed into a few patterns.</p><p>The anomaly detector uses pattern recognition to find <code>anomalies</code>, which are unusual log events. It uses the <code>evaluationFrequency</code> to compare current log events and patterns with trained baselines. </p><p>Fields within a pattern are called <i>tokens</i>. Fields that vary within a pattern, such as a request ID or timestamp, are referred to as <i>dynamic tokens</i> and represented by <code>&lt;*&gt;</code>. </p><p>The following is an example of a pattern:</p><p><code>[INFO] Request time: &lt;*&gt; ms</code></p><p>This pattern represents log events like <code>[INFO] Request time: 327 ms</code> and other similar log events that differ only by the number, in this csse 327. When the pattern is displayed, the different numbers are replaced by <code>&lt;*&gt;</code></p><note><p>Any parts of log events that are masked as sensitive data are not scanned for anomalies. For more information about masking sensitive data, see <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/mask-sensitive-log-data.html">Help protect sensitive log data with masking</a>. </p></note>
 
 @param request A container for the necessary parameters to execute the CreateLogAnomalyDetector service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorServiceUnavailable`, `AWSLogsErrorOperationAborted`, `AWSLogsErrorLimitExceeded`.
 
 @see AWSLogsCreateLogAnomalyDetectorRequest
 @see AWSLogsCreateLogAnomalyDetectorResponse
 */
- (void)createLogAnomalyDetector:(AWSLogsCreateLogAnomalyDetectorRequest *)request completionHandler:(void (^ _Nullable)(AWSLogsCreateLogAnomalyDetectorResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a log group with the specified name. You can create up to 1,000,000 log groups per Region per account.</p><p>You must use the following guidelines when naming a log group:</p><ul><li><p>Log group names must be unique within a Region for an Amazon Web Services account.</p></li><li><p>Log group names can be between 1 and 512 characters long.</p></li><li><p>Log group names consist of the following characters: a-z, A-Z, 0-9, '_' (underscore), '-' (hyphen), '/' (forward slash), '.' (period), and '#' (number sign)</p></li><li><p>Log group names can't start with the string <code>aws/</code></p></li></ul><p>When you create a log group, by default the log events in the log group do not expire. To set a retention policy so that events expire and are deleted after a specified time, use <a href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutRetentionPolicy.html">PutRetentionPolicy</a>.</p><p>If you associate an KMS key with the log group, ingested data is encrypted using the KMS key. This association is stored as long as the data encrypted with the KMS key is still within CloudWatch Logs. This enables CloudWatch Logs to decrypt this data whenever it is requested.</p><p>If you attempt to associate a KMS key with the log group but the KMS key does not exist or the KMS key is disabled, you receive an <code>InvalidParameterException</code> error. </p><important><p>CloudWatch Logs supports only symmetric KMS keys. Do not associate an asymmetric KMS key with your log group. For more information, see <a href="https://docs.aws.amazon.com/kms/latest/developerguide/symmetric-asymmetric.html">Using Symmetric and Asymmetric Keys</a>.</p></important>
 
 @param request A container for the necessary parameters to execute the CreateLogGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorResourceAlreadyExists`, `AWSLogsErrorLimitExceeded`, `AWSLogsErrorOperationAborted`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsCreateLogGroupRequest
 */
- (AWSTask *)createLogGroup:(AWSLogsCreateLogGroupRequest *)request;

/**
 <p>Creates a log group with the specified name. You can create up to 1,000,000 log groups per Region per account.</p><p>You must use the following guidelines when naming a log group:</p><ul><li><p>Log group names must be unique within a Region for an Amazon Web Services account.</p></li><li><p>Log group names can be between 1 and 512 characters long.</p></li><li><p>Log group names consist of the following characters: a-z, A-Z, 0-9, '_' (underscore), '-' (hyphen), '/' (forward slash), '.' (period), and '#' (number sign)</p></li><li><p>Log group names can't start with the string <code>aws/</code></p></li></ul><p>When you create a log group, by default the log events in the log group do not expire. To set a retention policy so that events expire and are deleted after a specified time, use <a href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutRetentionPolicy.html">PutRetentionPolicy</a>.</p><p>If you associate an KMS key with the log group, ingested data is encrypted using the KMS key. This association is stored as long as the data encrypted with the KMS key is still within CloudWatch Logs. This enables CloudWatch Logs to decrypt this data whenever it is requested.</p><p>If you attempt to associate a KMS key with the log group but the KMS key does not exist or the KMS key is disabled, you receive an <code>InvalidParameterException</code> error. </p><important><p>CloudWatch Logs supports only symmetric KMS keys. Do not associate an asymmetric KMS key with your log group. For more information, see <a href="https://docs.aws.amazon.com/kms/latest/developerguide/symmetric-asymmetric.html">Using Symmetric and Asymmetric Keys</a>.</p></important>
 
 @param request A container for the necessary parameters to execute the CreateLogGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorResourceAlreadyExists`, `AWSLogsErrorLimitExceeded`, `AWSLogsErrorOperationAborted`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsCreateLogGroupRequest
 */
- (void)createLogGroup:(AWSLogsCreateLogGroupRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Creates a log stream for the specified log group. A log stream is a sequence of log events that originate from a single source, such as an application instance or a resource that is being monitored.</p><p>There is no limit on the number of log streams that you can create for a log group. There is a limit of 50 TPS on <code>CreateLogStream</code> operations, after which transactions are throttled.</p><p>You must use the following guidelines when naming a log stream:</p><ul><li><p>Log stream names must be unique within the log group.</p></li><li><p>Log stream names can be between 1 and 512 characters long.</p></li><li><p>Don't use ':' (colon) or '*' (asterisk) characters.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the CreateLogStream service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorResourceAlreadyExists`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsCreateLogStreamRequest
 */
- (AWSTask *)createLogStream:(AWSLogsCreateLogStreamRequest *)request;

/**
 <p>Creates a log stream for the specified log group. A log stream is a sequence of log events that originate from a single source, such as an application instance or a resource that is being monitored.</p><p>There is no limit on the number of log streams that you can create for a log group. There is a limit of 50 TPS on <code>CreateLogStream</code> operations, after which transactions are throttled.</p><p>You must use the following guidelines when naming a log stream:</p><ul><li><p>Log stream names must be unique within the log group.</p></li><li><p>Log stream names can be between 1 and 512 characters long.</p></li><li><p>Don't use ':' (colon) or '*' (asterisk) characters.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the CreateLogStream service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorResourceAlreadyExists`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsCreateLogStreamRequest
 */
- (void)createLogStream:(AWSLogsCreateLogStreamRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a CloudWatch Logs account policy. This stops the policy from applying to all log groups or a subset of log groups in the account. Log-group level policies will still be in effect.</p><p>To use this operation, you must be signed on with the correct permissions depending on the type of policy that you are deleting.</p><ul><li><p>To delete a data protection policy, you must have the <code>logs:DeleteDataProtectionPolicy</code> and <code>logs:DeleteAccountPolicy</code> permissions.</p></li><li><p>To delete a subscription filter policy, you must have the <code>logs:DeleteSubscriptionFilter</code> and <code>logs:DeleteAccountPolicy</code> permissions.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the DeleteAccountPolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorServiceUnavailable`, `AWSLogsErrorOperationAborted`.
 
 @see AWSLogsDeleteAccountPolicyRequest
 */
- (AWSTask *)deleteAccountPolicy:(AWSLogsDeleteAccountPolicyRequest *)request;

/**
 <p>Deletes a CloudWatch Logs account policy. This stops the policy from applying to all log groups or a subset of log groups in the account. Log-group level policies will still be in effect.</p><p>To use this operation, you must be signed on with the correct permissions depending on the type of policy that you are deleting.</p><ul><li><p>To delete a data protection policy, you must have the <code>logs:DeleteDataProtectionPolicy</code> and <code>logs:DeleteAccountPolicy</code> permissions.</p></li><li><p>To delete a subscription filter policy, you must have the <code>logs:DeleteSubscriptionFilter</code> and <code>logs:DeleteAccountPolicy</code> permissions.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the DeleteAccountPolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorServiceUnavailable`, `AWSLogsErrorOperationAborted`.
 
 @see AWSLogsDeleteAccountPolicyRequest
 */
- (void)deleteAccountPolicy:(AWSLogsDeleteAccountPolicyRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the data protection policy from the specified log group. </p><p>For more information about data protection policies, see <a href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDataProtectionPolicy.html">PutDataProtectionPolicy</a>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteDataProtectionPolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorOperationAborted`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsDeleteDataProtectionPolicyRequest
 */
- (AWSTask *)deleteDataProtectionPolicy:(AWSLogsDeleteDataProtectionPolicyRequest *)request;

/**
 <p>Deletes the data protection policy from the specified log group. </p><p>For more information about data protection policies, see <a href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDataProtectionPolicy.html">PutDataProtectionPolicy</a>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteDataProtectionPolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorOperationAborted`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsDeleteDataProtectionPolicyRequest
 */
- (void)deleteDataProtectionPolicy:(AWSLogsDeleteDataProtectionPolicyRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes s <i>delivery</i>. A delivery is a connection between a logical <i>delivery source</i> and a logical <i>delivery destination</i>. Deleting a delivery only deletes the connection between the delivery source and delivery destination. It does not delete the delivery destination or the delivery source.</p>
 
 @param request A container for the necessary parameters to execute the DeleteDelivery service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorResourceNotFound`, `AWSLogsErrorServiceUnavailable`, `AWSLogsErrorConflict`, `AWSLogsErrorValidation`, `AWSLogsErrorServiceQuotaExceeded`, `AWSLogsErrorThrottling`.
 
 @see AWSLogsDeleteDeliveryRequest
 */
- (AWSTask *)deleteDelivery:(AWSLogsDeleteDeliveryRequest *)request;

/**
 <p>Deletes s <i>delivery</i>. A delivery is a connection between a logical <i>delivery source</i> and a logical <i>delivery destination</i>. Deleting a delivery only deletes the connection between the delivery source and delivery destination. It does not delete the delivery destination or the delivery source.</p>
 
 @param request A container for the necessary parameters to execute the DeleteDelivery service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorResourceNotFound`, `AWSLogsErrorServiceUnavailable`, `AWSLogsErrorConflict`, `AWSLogsErrorValidation`, `AWSLogsErrorServiceQuotaExceeded`, `AWSLogsErrorThrottling`.
 
 @see AWSLogsDeleteDeliveryRequest
 */
- (void)deleteDelivery:(AWSLogsDeleteDeliveryRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a <i>delivery destination</i>. A delivery is a connection between a logical <i>delivery source</i> and a logical <i>delivery destination</i>.</p><p>You can't delete a delivery destination if any current deliveries are associated with it. To find whether any deliveries are associated with this delivery destination, use the <a href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_DescribeDeliveries.html">DescribeDeliveries</a> operation and check the <code>deliveryDestinationArn</code> field in the results.</p>
 
 @param request A container for the necessary parameters to execute the DeleteDeliveryDestination service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorResourceNotFound`, `AWSLogsErrorServiceUnavailable`, `AWSLogsErrorConflict`, `AWSLogsErrorValidation`, `AWSLogsErrorServiceQuotaExceeded`, `AWSLogsErrorThrottling`.
 
 @see AWSLogsDeleteDeliveryDestinationRequest
 */
- (AWSTask *)deleteDeliveryDestination:(AWSLogsDeleteDeliveryDestinationRequest *)request;

/**
 <p>Deletes a <i>delivery destination</i>. A delivery is a connection between a logical <i>delivery source</i> and a logical <i>delivery destination</i>.</p><p>You can't delete a delivery destination if any current deliveries are associated with it. To find whether any deliveries are associated with this delivery destination, use the <a href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_DescribeDeliveries.html">DescribeDeliveries</a> operation and check the <code>deliveryDestinationArn</code> field in the results.</p>
 
 @param request A container for the necessary parameters to execute the DeleteDeliveryDestination service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorResourceNotFound`, `AWSLogsErrorServiceUnavailable`, `AWSLogsErrorConflict`, `AWSLogsErrorValidation`, `AWSLogsErrorServiceQuotaExceeded`, `AWSLogsErrorThrottling`.
 
 @see AWSLogsDeleteDeliveryDestinationRequest
 */
- (void)deleteDeliveryDestination:(AWSLogsDeleteDeliveryDestinationRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a delivery destination policy. For more information about these policies, see <a href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDeliveryDestinationPolicy.html">PutDeliveryDestinationPolicy</a>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteDeliveryDestinationPolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorServiceUnavailable`, `AWSLogsErrorValidation`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorConflict`.
 
 @see AWSLogsDeleteDeliveryDestinationPolicyRequest
 */
- (AWSTask *)deleteDeliveryDestinationPolicy:(AWSLogsDeleteDeliveryDestinationPolicyRequest *)request;

/**
 <p>Deletes a delivery destination policy. For more information about these policies, see <a href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDeliveryDestinationPolicy.html">PutDeliveryDestinationPolicy</a>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteDeliveryDestinationPolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorServiceUnavailable`, `AWSLogsErrorValidation`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorConflict`.
 
 @see AWSLogsDeleteDeliveryDestinationPolicyRequest
 */
- (void)deleteDeliveryDestinationPolicy:(AWSLogsDeleteDeliveryDestinationPolicyRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a <i>delivery source</i>. A delivery is a connection between a logical <i>delivery source</i> and a logical <i>delivery destination</i>.</p><p>You can't delete a delivery source if any current deliveries are associated with it. To find whether any deliveries are associated with this delivery source, use the <a href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_DescribeDeliveries.html">DescribeDeliveries</a> operation and check the <code>deliverySourceName</code> field in the results.</p>
 
 @param request A container for the necessary parameters to execute the DeleteDeliverySource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorResourceNotFound`, `AWSLogsErrorServiceUnavailable`, `AWSLogsErrorConflict`, `AWSLogsErrorValidation`, `AWSLogsErrorServiceQuotaExceeded`, `AWSLogsErrorThrottling`.
 
 @see AWSLogsDeleteDeliverySourceRequest
 */
- (AWSTask *)deleteDeliverySource:(AWSLogsDeleteDeliverySourceRequest *)request;

/**
 <p>Deletes a <i>delivery source</i>. A delivery is a connection between a logical <i>delivery source</i> and a logical <i>delivery destination</i>.</p><p>You can't delete a delivery source if any current deliveries are associated with it. To find whether any deliveries are associated with this delivery source, use the <a href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_DescribeDeliveries.html">DescribeDeliveries</a> operation and check the <code>deliverySourceName</code> field in the results.</p>
 
 @param request A container for the necessary parameters to execute the DeleteDeliverySource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorResourceNotFound`, `AWSLogsErrorServiceUnavailable`, `AWSLogsErrorConflict`, `AWSLogsErrorValidation`, `AWSLogsErrorServiceQuotaExceeded`, `AWSLogsErrorThrottling`.
 
 @see AWSLogsDeleteDeliverySourceRequest
 */
- (void)deleteDeliverySource:(AWSLogsDeleteDeliverySourceRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

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
 <p>Deletes the specified CloudWatch Logs anomaly detector.</p>
 
 @param request A container for the necessary parameters to execute the DeleteLogAnomalyDetector service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorServiceUnavailable`, `AWSLogsErrorOperationAborted`.
 
 @see AWSLogsDeleteLogAnomalyDetectorRequest
 */
- (AWSTask *)deleteLogAnomalyDetector:(AWSLogsDeleteLogAnomalyDetectorRequest *)request;

/**
 <p>Deletes the specified CloudWatch Logs anomaly detector.</p>
 
 @param request A container for the necessary parameters to execute the DeleteLogAnomalyDetector service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorServiceUnavailable`, `AWSLogsErrorOperationAborted`.
 
 @see AWSLogsDeleteLogAnomalyDetectorRequest
 */
- (void)deleteLogAnomalyDetector:(AWSLogsDeleteLogAnomalyDetectorRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

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
 <p>Deletes a saved CloudWatch Logs Insights query definition. A query definition contains details about a saved CloudWatch Logs Insights query.</p><p>Each <code>DeleteQueryDefinition</code> operation can delete one query definition.</p><p>You must have the <code>logs:DeleteQueryDefinition</code> permission to be able to perform this operation.</p>
 
 @param request A container for the necessary parameters to execute the DeleteQueryDefinition service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLogsDeleteQueryDefinitionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsDeleteQueryDefinitionRequest
 @see AWSLogsDeleteQueryDefinitionResponse
 */
- (AWSTask<AWSLogsDeleteQueryDefinitionResponse *> *)deleteQueryDefinition:(AWSLogsDeleteQueryDefinitionRequest *)request;

/**
 <p>Deletes a saved CloudWatch Logs Insights query definition. A query definition contains details about a saved CloudWatch Logs Insights query.</p><p>Each <code>DeleteQueryDefinition</code> operation can delete one query definition.</p><p>You must have the <code>logs:DeleteQueryDefinition</code> permission to be able to perform this operation.</p>
 
 @param request A container for the necessary parameters to execute the DeleteQueryDefinition service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsDeleteQueryDefinitionRequest
 @see AWSLogsDeleteQueryDefinitionResponse
 */
- (void)deleteQueryDefinition:(AWSLogsDeleteQueryDefinitionRequest *)request completionHandler:(void (^ _Nullable)(AWSLogsDeleteQueryDefinitionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

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
 <p>Returns a list of all CloudWatch Logs account policies in the account.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAccountPolicies service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLogsDescribeAccountPoliciesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorOperationAborted`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsDescribeAccountPoliciesRequest
 @see AWSLogsDescribeAccountPoliciesResponse
 */
- (AWSTask<AWSLogsDescribeAccountPoliciesResponse *> *)describeAccountPolicies:(AWSLogsDescribeAccountPoliciesRequest *)request;

/**
 <p>Returns a list of all CloudWatch Logs account policies in the account.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAccountPolicies service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorOperationAborted`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsDescribeAccountPoliciesRequest
 @see AWSLogsDescribeAccountPoliciesResponse
 */
- (void)describeAccountPolicies:(AWSLogsDescribeAccountPoliciesRequest *)request completionHandler:(void (^ _Nullable)(AWSLogsDescribeAccountPoliciesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves a list of the deliveries that have been created in the account.</p><p>A <i>delivery</i> is a connection between a <a href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDeliverySource.html"><i>delivery source</i></a> and a <a href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDeliveryDestination.html"><i>delivery destination</i></a>.</p><p>A delivery source represents an Amazon Web Services resource that sends logs to an logs delivery destination. The destination can be CloudWatch Logs, Amazon S3, or Firehose. Only some Amazon Web Services services support being configured as a delivery source. These services are listed in <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/AWS-logs-and-resource-policy.html">Enable logging from Amazon Web Services services.</a></p>
 
 @param request A container for the necessary parameters to execute the DescribeDeliveries service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLogsDescribeDeliveriesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorServiceUnavailable`, `AWSLogsErrorServiceQuotaExceeded`, `AWSLogsErrorValidation`, `AWSLogsErrorThrottling`.
 
 @see AWSLogsDescribeDeliveriesRequest
 @see AWSLogsDescribeDeliveriesResponse
 */
- (AWSTask<AWSLogsDescribeDeliveriesResponse *> *)describeDeliveries:(AWSLogsDescribeDeliveriesRequest *)request;

/**
 <p>Retrieves a list of the deliveries that have been created in the account.</p><p>A <i>delivery</i> is a connection between a <a href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDeliverySource.html"><i>delivery source</i></a> and a <a href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDeliveryDestination.html"><i>delivery destination</i></a>.</p><p>A delivery source represents an Amazon Web Services resource that sends logs to an logs delivery destination. The destination can be CloudWatch Logs, Amazon S3, or Firehose. Only some Amazon Web Services services support being configured as a delivery source. These services are listed in <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/AWS-logs-and-resource-policy.html">Enable logging from Amazon Web Services services.</a></p>
 
 @param request A container for the necessary parameters to execute the DescribeDeliveries service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorServiceUnavailable`, `AWSLogsErrorServiceQuotaExceeded`, `AWSLogsErrorValidation`, `AWSLogsErrorThrottling`.
 
 @see AWSLogsDescribeDeliveriesRequest
 @see AWSLogsDescribeDeliveriesResponse
 */
- (void)describeDeliveries:(AWSLogsDescribeDeliveriesRequest *)request completionHandler:(void (^ _Nullable)(AWSLogsDescribeDeliveriesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves a list of the delivery destinations that have been created in the account.</p>
 
 @param request A container for the necessary parameters to execute the DescribeDeliveryDestinations service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLogsDescribeDeliveryDestinationsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorServiceUnavailable`, `AWSLogsErrorServiceQuotaExceeded`, `AWSLogsErrorValidation`, `AWSLogsErrorThrottling`.
 
 @see AWSLogsDescribeDeliveryDestinationsRequest
 @see AWSLogsDescribeDeliveryDestinationsResponse
 */
- (AWSTask<AWSLogsDescribeDeliveryDestinationsResponse *> *)describeDeliveryDestinations:(AWSLogsDescribeDeliveryDestinationsRequest *)request;

/**
 <p>Retrieves a list of the delivery destinations that have been created in the account.</p>
 
 @param request A container for the necessary parameters to execute the DescribeDeliveryDestinations service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorServiceUnavailable`, `AWSLogsErrorServiceQuotaExceeded`, `AWSLogsErrorValidation`, `AWSLogsErrorThrottling`.
 
 @see AWSLogsDescribeDeliveryDestinationsRequest
 @see AWSLogsDescribeDeliveryDestinationsResponse
 */
- (void)describeDeliveryDestinations:(AWSLogsDescribeDeliveryDestinationsRequest *)request completionHandler:(void (^ _Nullable)(AWSLogsDescribeDeliveryDestinationsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves a list of the delivery sources that have been created in the account.</p>
 
 @param request A container for the necessary parameters to execute the DescribeDeliverySources service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLogsDescribeDeliverySourcesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorServiceUnavailable`, `AWSLogsErrorServiceQuotaExceeded`, `AWSLogsErrorValidation`, `AWSLogsErrorThrottling`.
 
 @see AWSLogsDescribeDeliverySourcesRequest
 @see AWSLogsDescribeDeliverySourcesResponse
 */
- (AWSTask<AWSLogsDescribeDeliverySourcesResponse *> *)describeDeliverySources:(AWSLogsDescribeDeliverySourcesRequest *)request;

/**
 <p>Retrieves a list of the delivery sources that have been created in the account.</p>
 
 @param request A container for the necessary parameters to execute the DescribeDeliverySources service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorServiceUnavailable`, `AWSLogsErrorServiceQuotaExceeded`, `AWSLogsErrorValidation`, `AWSLogsErrorThrottling`.
 
 @see AWSLogsDescribeDeliverySourcesRequest
 @see AWSLogsDescribeDeliverySourcesResponse
 */
- (void)describeDeliverySources:(AWSLogsDescribeDeliverySourcesRequest *)request completionHandler:(void (^ _Nullable)(AWSLogsDescribeDeliverySourcesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

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
 <p>Lists the specified log groups. You can list all your log groups or filter the results by prefix. The results are ASCII-sorted by log group name.</p><p>CloudWatch Logs doesn’t support IAM policies that control access to the <code>DescribeLogGroups</code> action by using the <code>aws:ResourceTag/<i>key-name</i></code> condition key. Other CloudWatch Logs actions do support the use of the <code>aws:ResourceTag/<i>key-name</i></code> condition key to control access. For more information about using tags to control access, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_tags.html">Controlling access to Amazon Web Services resources using tags</a>.</p><p>If you are using CloudWatch cross-account observability, you can use this operation in a monitoring account and view data from the linked source accounts. For more information, see <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-Unified-Cross-Account.html">CloudWatch cross-account observability</a>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeLogGroups service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLogsDescribeLogGroupsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsDescribeLogGroupsRequest
 @see AWSLogsDescribeLogGroupsResponse
 */
- (AWSTask<AWSLogsDescribeLogGroupsResponse *> *)describeLogGroups:(AWSLogsDescribeLogGroupsRequest *)request;

/**
 <p>Lists the specified log groups. You can list all your log groups or filter the results by prefix. The results are ASCII-sorted by log group name.</p><p>CloudWatch Logs doesn’t support IAM policies that control access to the <code>DescribeLogGroups</code> action by using the <code>aws:ResourceTag/<i>key-name</i></code> condition key. Other CloudWatch Logs actions do support the use of the <code>aws:ResourceTag/<i>key-name</i></code> condition key to control access. For more information about using tags to control access, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_tags.html">Controlling access to Amazon Web Services resources using tags</a>.</p><p>If you are using CloudWatch cross-account observability, you can use this operation in a monitoring account and view data from the linked source accounts. For more information, see <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-Unified-Cross-Account.html">CloudWatch cross-account observability</a>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeLogGroups service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsDescribeLogGroupsRequest
 @see AWSLogsDescribeLogGroupsResponse
 */
- (void)describeLogGroups:(AWSLogsDescribeLogGroupsRequest *)request completionHandler:(void (^ _Nullable)(AWSLogsDescribeLogGroupsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the log streams for the specified log group. You can list all the log streams or filter the results by prefix. You can also control how the results are ordered.</p><p>You can specify the log group to search by using either <code>logGroupIdentifier</code> or <code>logGroupName</code>. You must include one of these two parameters, but you can't include both. </p><p>This operation has a limit of five transactions per second, after which transactions are throttled.</p><p>If you are using CloudWatch cross-account observability, you can use this operation in a monitoring account and view data from the linked source accounts. For more information, see <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-Unified-Cross-Account.html">CloudWatch cross-account observability</a>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeLogStreams service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLogsDescribeLogStreamsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsDescribeLogStreamsRequest
 @see AWSLogsDescribeLogStreamsResponse
 */
- (AWSTask<AWSLogsDescribeLogStreamsResponse *> *)describeLogStreams:(AWSLogsDescribeLogStreamsRequest *)request;

/**
 <p>Lists the log streams for the specified log group. You can list all the log streams or filter the results by prefix. You can also control how the results are ordered.</p><p>You can specify the log group to search by using either <code>logGroupIdentifier</code> or <code>logGroupName</code>. You must include one of these two parameters, but you can't include both. </p><p>This operation has a limit of five transactions per second, after which transactions are throttled.</p><p>If you are using CloudWatch cross-account observability, you can use this operation in a monitoring account and view data from the linked source accounts. For more information, see <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-Unified-Cross-Account.html">CloudWatch cross-account observability</a>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeLogStreams service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsDescribeLogStreamsRequest
 @see AWSLogsDescribeLogStreamsResponse
 */
- (void)describeLogStreams:(AWSLogsDescribeLogStreamsRequest *)request completionHandler:(void (^ _Nullable)(AWSLogsDescribeLogStreamsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the specified metric filters. You can list all of the metric filters or filter the results by log name, prefix, metric name, or metric namespace. The results are ASCII-sorted by filter name.</p>
 
 @param request A container for the necessary parameters to execute the DescribeMetricFilters service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLogsDescribeMetricFiltersResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsDescribeMetricFiltersRequest
 @see AWSLogsDescribeMetricFiltersResponse
 */
- (AWSTask<AWSLogsDescribeMetricFiltersResponse *> *)describeMetricFilters:(AWSLogsDescribeMetricFiltersRequest *)request;

/**
 <p>Lists the specified metric filters. You can list all of the metric filters or filter the results by log name, prefix, metric name, or metric namespace. The results are ASCII-sorted by filter name.</p>
 
 @param request A container for the necessary parameters to execute the DescribeMetricFilters service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsDescribeMetricFiltersRequest
 @see AWSLogsDescribeMetricFiltersResponse
 */
- (void)describeMetricFilters:(AWSLogsDescribeMetricFiltersRequest *)request completionHandler:(void (^ _Nullable)(AWSLogsDescribeMetricFiltersResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of CloudWatch Logs Insights queries that are scheduled, running, or have been run recently in this account. You can request all queries or limit it to queries of a specific log group or queries with a certain status.</p>
 
 @param request A container for the necessary parameters to execute the DescribeQueries service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLogsDescribeQueriesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsDescribeQueriesRequest
 @see AWSLogsDescribeQueriesResponse
 */
- (AWSTask<AWSLogsDescribeQueriesResponse *> *)describeQueries:(AWSLogsDescribeQueriesRequest *)request;

/**
 <p>Returns a list of CloudWatch Logs Insights queries that are scheduled, running, or have been run recently in this account. You can request all queries or limit it to queries of a specific log group or queries with a certain status.</p>
 
 @param request A container for the necessary parameters to execute the DescribeQueries service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsDescribeQueriesRequest
 @see AWSLogsDescribeQueriesResponse
 */
- (void)describeQueries:(AWSLogsDescribeQueriesRequest *)request completionHandler:(void (^ _Nullable)(AWSLogsDescribeQueriesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>This operation returns a paginated list of your saved CloudWatch Logs Insights query definitions. You can retrieve query definitions from the current account or from a source account that is linked to the current account.</p><p>You can use the <code>queryDefinitionNamePrefix</code> parameter to limit the results to only the query definitions that have names that start with a certain string.</p>
 
 @param request A container for the necessary parameters to execute the DescribeQueryDefinitions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLogsDescribeQueryDefinitionsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsDescribeQueryDefinitionsRequest
 @see AWSLogsDescribeQueryDefinitionsResponse
 */
- (AWSTask<AWSLogsDescribeQueryDefinitionsResponse *> *)describeQueryDefinitions:(AWSLogsDescribeQueryDefinitionsRequest *)request;

/**
 <p>This operation returns a paginated list of your saved CloudWatch Logs Insights query definitions. You can retrieve query definitions from the current account or from a source account that is linked to the current account.</p><p>You can use the <code>queryDefinitionNamePrefix</code> parameter to limit the results to only the query definitions that have names that start with a certain string.</p>
 
 @param request A container for the necessary parameters to execute the DescribeQueryDefinitions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsDescribeQueryDefinitionsRequest
 @see AWSLogsDescribeQueryDefinitionsResponse
 */
- (void)describeQueryDefinitions:(AWSLogsDescribeQueryDefinitionsRequest *)request completionHandler:(void (^ _Nullable)(AWSLogsDescribeQueryDefinitionsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

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
 <p>Disassociates the specified KMS key from the specified log group or from all CloudWatch Logs Insights query results in the account.</p><p>When you use <code>DisassociateKmsKey</code>, you specify either the <code>logGroupName</code> parameter or the <code>resourceIdentifier</code> parameter. You can't specify both of those parameters in the same operation.</p><ul><li><p>Specify the <code>logGroupName</code> parameter to stop using the KMS key to encrypt future log events ingested and stored in the log group. Instead, they will be encrypted with the default CloudWatch Logs method. The log events that were ingested while the key was associated with the log group are still encrypted with that key. Therefore, CloudWatch Logs will need permissions for the key whenever that data is accessed.</p></li><li><p>Specify the <code>resourceIdentifier</code> parameter with the <code>query-result</code> resource to stop using the KMS key to encrypt the results of all future <a href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_StartQuery.html">StartQuery</a> operations in the account. They will instead be encrypted with the default CloudWatch Logs method. The results from queries that ran while the key was associated with the account are still encrypted with that key. Therefore, CloudWatch Logs will need permissions for the key whenever that data is accessed.</p></li></ul><p>It can take up to 5 minutes for this operation to take effect.</p>
 
 @param request A container for the necessary parameters to execute the DisassociateKmsKey service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorOperationAborted`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsDisassociateKmsKeyRequest
 */
- (AWSTask *)disassociateKmsKey:(AWSLogsDisassociateKmsKeyRequest *)request;

/**
 <p>Disassociates the specified KMS key from the specified log group or from all CloudWatch Logs Insights query results in the account.</p><p>When you use <code>DisassociateKmsKey</code>, you specify either the <code>logGroupName</code> parameter or the <code>resourceIdentifier</code> parameter. You can't specify both of those parameters in the same operation.</p><ul><li><p>Specify the <code>logGroupName</code> parameter to stop using the KMS key to encrypt future log events ingested and stored in the log group. Instead, they will be encrypted with the default CloudWatch Logs method. The log events that were ingested while the key was associated with the log group are still encrypted with that key. Therefore, CloudWatch Logs will need permissions for the key whenever that data is accessed.</p></li><li><p>Specify the <code>resourceIdentifier</code> parameter with the <code>query-result</code> resource to stop using the KMS key to encrypt the results of all future <a href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_StartQuery.html">StartQuery</a> operations in the account. They will instead be encrypted with the default CloudWatch Logs method. The results from queries that ran while the key was associated with the account are still encrypted with that key. Therefore, CloudWatch Logs will need permissions for the key whenever that data is accessed.</p></li></ul><p>It can take up to 5 minutes for this operation to take effect.</p>
 
 @param request A container for the necessary parameters to execute the DisassociateKmsKey service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorOperationAborted`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsDisassociateKmsKeyRequest
 */
- (void)disassociateKmsKey:(AWSLogsDisassociateKmsKeyRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Lists log events from the specified log group. You can list all the log events or filter the results using a filter pattern, a time range, and the name of the log stream.</p><p>You must have the <code>logs:FilterLogEvents</code> permission to perform this operation.</p><p>You can specify the log group to search by using either <code>logGroupIdentifier</code> or <code>logGroupName</code>. You must include one of these two parameters, but you can't include both. </p><p>By default, this operation returns as many log events as can fit in 1 MB (up to 10,000 log events) or all the events found within the specified time range. If the results include a token, that means there are more log events available. You can get additional results by specifying the token in a subsequent call. This operation can return empty results while there are more log events available through the token.</p><p>The returned log events are sorted by event timestamp, the timestamp when the event was ingested by CloudWatch Logs, and the ID of the <code>PutLogEvents</code> request.</p><p>If you are using CloudWatch cross-account observability, you can use this operation in a monitoring account and view data from the linked source accounts. For more information, see <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-Unified-Cross-Account.html">CloudWatch cross-account observability</a>.</p>
 
 @param request A container for the necessary parameters to execute the FilterLogEvents service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLogsFilterLogEventsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsFilterLogEventsRequest
 @see AWSLogsFilterLogEventsResponse
 */
- (AWSTask<AWSLogsFilterLogEventsResponse *> *)filterLogEvents:(AWSLogsFilterLogEventsRequest *)request;

/**
 <p>Lists log events from the specified log group. You can list all the log events or filter the results using a filter pattern, a time range, and the name of the log stream.</p><p>You must have the <code>logs:FilterLogEvents</code> permission to perform this operation.</p><p>You can specify the log group to search by using either <code>logGroupIdentifier</code> or <code>logGroupName</code>. You must include one of these two parameters, but you can't include both. </p><p>By default, this operation returns as many log events as can fit in 1 MB (up to 10,000 log events) or all the events found within the specified time range. If the results include a token, that means there are more log events available. You can get additional results by specifying the token in a subsequent call. This operation can return empty results while there are more log events available through the token.</p><p>The returned log events are sorted by event timestamp, the timestamp when the event was ingested by CloudWatch Logs, and the ID of the <code>PutLogEvents</code> request.</p><p>If you are using CloudWatch cross-account observability, you can use this operation in a monitoring account and view data from the linked source accounts. For more information, see <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-Unified-Cross-Account.html">CloudWatch cross-account observability</a>.</p>
 
 @param request A container for the necessary parameters to execute the FilterLogEvents service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsFilterLogEventsRequest
 @see AWSLogsFilterLogEventsResponse
 */
- (void)filterLogEvents:(AWSLogsFilterLogEventsRequest *)request completionHandler:(void (^ _Nullable)(AWSLogsFilterLogEventsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about a log group data protection policy.</p>
 
 @param request A container for the necessary parameters to execute the GetDataProtectionPolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLogsGetDataProtectionPolicyResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorOperationAborted`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsGetDataProtectionPolicyRequest
 @see AWSLogsGetDataProtectionPolicyResponse
 */
- (AWSTask<AWSLogsGetDataProtectionPolicyResponse *> *)getDataProtectionPolicy:(AWSLogsGetDataProtectionPolicyRequest *)request;

/**
 <p>Returns information about a log group data protection policy.</p>
 
 @param request A container for the necessary parameters to execute the GetDataProtectionPolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorOperationAborted`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsGetDataProtectionPolicyRequest
 @see AWSLogsGetDataProtectionPolicyResponse
 */
- (void)getDataProtectionPolicy:(AWSLogsGetDataProtectionPolicyRequest *)request completionHandler:(void (^ _Nullable)(AWSLogsGetDataProtectionPolicyResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns complete information about one logical <i>delivery</i>. A delivery is a connection between a <a href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDeliverySource.html"><i>delivery source</i></a> and a <a href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDeliveryDestination.html"><i>delivery destination</i></a>.</p><p>A delivery source represents an Amazon Web Services resource that sends logs to an logs delivery destination. The destination can be CloudWatch Logs, Amazon S3, or Firehose. Only some Amazon Web Services services support being configured as a delivery source. These services are listed in <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/AWS-logs-and-resource-policy.html">Enable logging from Amazon Web Services services.</a></p><p>You need to specify the delivery <code>id</code> in this operation. You can find the IDs of the deliveries in your account with the <a href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_DescribeDeliveries.html">DescribeDeliveries</a> operation.</p>
 
 @param request A container for the necessary parameters to execute the GetDelivery service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLogsGetDeliveryResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorResourceNotFound`, `AWSLogsErrorServiceUnavailable`, `AWSLogsErrorValidation`, `AWSLogsErrorServiceQuotaExceeded`, `AWSLogsErrorThrottling`.
 
 @see AWSLogsGetDeliveryRequest
 @see AWSLogsGetDeliveryResponse
 */
- (AWSTask<AWSLogsGetDeliveryResponse *> *)getDelivery:(AWSLogsGetDeliveryRequest *)request;

/**
 <p>Returns complete information about one logical <i>delivery</i>. A delivery is a connection between a <a href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDeliverySource.html"><i>delivery source</i></a> and a <a href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDeliveryDestination.html"><i>delivery destination</i></a>.</p><p>A delivery source represents an Amazon Web Services resource that sends logs to an logs delivery destination. The destination can be CloudWatch Logs, Amazon S3, or Firehose. Only some Amazon Web Services services support being configured as a delivery source. These services are listed in <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/AWS-logs-and-resource-policy.html">Enable logging from Amazon Web Services services.</a></p><p>You need to specify the delivery <code>id</code> in this operation. You can find the IDs of the deliveries in your account with the <a href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_DescribeDeliveries.html">DescribeDeliveries</a> operation.</p>
 
 @param request A container for the necessary parameters to execute the GetDelivery service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorResourceNotFound`, `AWSLogsErrorServiceUnavailable`, `AWSLogsErrorValidation`, `AWSLogsErrorServiceQuotaExceeded`, `AWSLogsErrorThrottling`.
 
 @see AWSLogsGetDeliveryRequest
 @see AWSLogsGetDeliveryResponse
 */
- (void)getDelivery:(AWSLogsGetDeliveryRequest *)request completionHandler:(void (^ _Nullable)(AWSLogsGetDeliveryResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves complete information about one delivery destination.</p>
 
 @param request A container for the necessary parameters to execute the GetDeliveryDestination service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLogsGetDeliveryDestinationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorResourceNotFound`, `AWSLogsErrorServiceUnavailable`, `AWSLogsErrorValidation`, `AWSLogsErrorServiceQuotaExceeded`, `AWSLogsErrorThrottling`.
 
 @see AWSLogsGetDeliveryDestinationRequest
 @see AWSLogsGetDeliveryDestinationResponse
 */
- (AWSTask<AWSLogsGetDeliveryDestinationResponse *> *)getDeliveryDestination:(AWSLogsGetDeliveryDestinationRequest *)request;

/**
 <p>Retrieves complete information about one delivery destination.</p>
 
 @param request A container for the necessary parameters to execute the GetDeliveryDestination service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorResourceNotFound`, `AWSLogsErrorServiceUnavailable`, `AWSLogsErrorValidation`, `AWSLogsErrorServiceQuotaExceeded`, `AWSLogsErrorThrottling`.
 
 @see AWSLogsGetDeliveryDestinationRequest
 @see AWSLogsGetDeliveryDestinationResponse
 */
- (void)getDeliveryDestination:(AWSLogsGetDeliveryDestinationRequest *)request completionHandler:(void (^ _Nullable)(AWSLogsGetDeliveryDestinationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the delivery destination policy assigned to the delivery destination that you specify. For more information about delivery destinations and their policies, see <a href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDeliveryDestinationPolicy.html">PutDeliveryDestinationPolicy</a>.</p>
 
 @param request A container for the necessary parameters to execute the GetDeliveryDestinationPolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLogsGetDeliveryDestinationPolicyResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorServiceUnavailable`, `AWSLogsErrorValidation`, `AWSLogsErrorResourceNotFound`.
 
 @see AWSLogsGetDeliveryDestinationPolicyRequest
 @see AWSLogsGetDeliveryDestinationPolicyResponse
 */
- (AWSTask<AWSLogsGetDeliveryDestinationPolicyResponse *> *)getDeliveryDestinationPolicy:(AWSLogsGetDeliveryDestinationPolicyRequest *)request;

/**
 <p>Retrieves the delivery destination policy assigned to the delivery destination that you specify. For more information about delivery destinations and their policies, see <a href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDeliveryDestinationPolicy.html">PutDeliveryDestinationPolicy</a>.</p>
 
 @param request A container for the necessary parameters to execute the GetDeliveryDestinationPolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorServiceUnavailable`, `AWSLogsErrorValidation`, `AWSLogsErrorResourceNotFound`.
 
 @see AWSLogsGetDeliveryDestinationPolicyRequest
 @see AWSLogsGetDeliveryDestinationPolicyResponse
 */
- (void)getDeliveryDestinationPolicy:(AWSLogsGetDeliveryDestinationPolicyRequest *)request completionHandler:(void (^ _Nullable)(AWSLogsGetDeliveryDestinationPolicyResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves complete information about one delivery source.</p>
 
 @param request A container for the necessary parameters to execute the GetDeliverySource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLogsGetDeliverySourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorResourceNotFound`, `AWSLogsErrorServiceUnavailable`, `AWSLogsErrorValidation`, `AWSLogsErrorServiceQuotaExceeded`, `AWSLogsErrorThrottling`.
 
 @see AWSLogsGetDeliverySourceRequest
 @see AWSLogsGetDeliverySourceResponse
 */
- (AWSTask<AWSLogsGetDeliverySourceResponse *> *)getDeliverySource:(AWSLogsGetDeliverySourceRequest *)request;

/**
 <p>Retrieves complete information about one delivery source.</p>
 
 @param request A container for the necessary parameters to execute the GetDeliverySource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorResourceNotFound`, `AWSLogsErrorServiceUnavailable`, `AWSLogsErrorValidation`, `AWSLogsErrorServiceQuotaExceeded`, `AWSLogsErrorThrottling`.
 
 @see AWSLogsGetDeliverySourceRequest
 @see AWSLogsGetDeliverySourceResponse
 */
- (void)getDeliverySource:(AWSLogsGetDeliverySourceRequest *)request completionHandler:(void (^ _Nullable)(AWSLogsGetDeliverySourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves information about the log anomaly detector that you specify.</p>
 
 @param request A container for the necessary parameters to execute the GetLogAnomalyDetector service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLogsGetLogAnomalyDetectorResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorServiceUnavailable`, `AWSLogsErrorOperationAborted`.
 
 @see AWSLogsGetLogAnomalyDetectorRequest
 @see AWSLogsGetLogAnomalyDetectorResponse
 */
- (AWSTask<AWSLogsGetLogAnomalyDetectorResponse *> *)getLogAnomalyDetector:(AWSLogsGetLogAnomalyDetectorRequest *)request;

/**
 <p>Retrieves information about the log anomaly detector that you specify.</p>
 
 @param request A container for the necessary parameters to execute the GetLogAnomalyDetector service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorServiceUnavailable`, `AWSLogsErrorOperationAborted`.
 
 @see AWSLogsGetLogAnomalyDetectorRequest
 @see AWSLogsGetLogAnomalyDetectorResponse
 */
- (void)getLogAnomalyDetector:(AWSLogsGetLogAnomalyDetectorRequest *)request completionHandler:(void (^ _Nullable)(AWSLogsGetLogAnomalyDetectorResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists log events from the specified log stream. You can list all of the log events or filter using a time range.</p><p>By default, this operation returns as many log events as can fit in a response size of 1MB (up to 10,000 log events). You can get additional log events by specifying one of the tokens in a subsequent call. This operation can return empty results while there are more log events available through the token.</p><p>If you are using CloudWatch cross-account observability, you can use this operation in a monitoring account and view data from the linked source accounts. For more information, see <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-Unified-Cross-Account.html">CloudWatch cross-account observability</a>.</p><p>You can specify the log group to search by using either <code>logGroupIdentifier</code> or <code>logGroupName</code>. You must include one of these two parameters, but you can't include both. </p>
 
 @param request A container for the necessary parameters to execute the GetLogEvents service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLogsGetLogEventsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsGetLogEventsRequest
 @see AWSLogsGetLogEventsResponse
 */
- (AWSTask<AWSLogsGetLogEventsResponse *> *)getLogEvents:(AWSLogsGetLogEventsRequest *)request;

/**
 <p>Lists log events from the specified log stream. You can list all of the log events or filter using a time range.</p><p>By default, this operation returns as many log events as can fit in a response size of 1MB (up to 10,000 log events). You can get additional log events by specifying one of the tokens in a subsequent call. This operation can return empty results while there are more log events available through the token.</p><p>If you are using CloudWatch cross-account observability, you can use this operation in a monitoring account and view data from the linked source accounts. For more information, see <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-Unified-Cross-Account.html">CloudWatch cross-account observability</a>.</p><p>You can specify the log group to search by using either <code>logGroupIdentifier</code> or <code>logGroupName</code>. You must include one of these two parameters, but you can't include both. </p>
 
 @param request A container for the necessary parameters to execute the GetLogEvents service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsGetLogEventsRequest
 @see AWSLogsGetLogEventsResponse
 */
- (void)getLogEvents:(AWSLogsGetLogEventsRequest *)request completionHandler:(void (^ _Nullable)(AWSLogsGetLogEventsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of the fields that are included in log events in the specified log group. Includes the percentage of log events that contain each field. The search is limited to a time period that you specify.</p><p>You can specify the log group to search by using either <code>logGroupIdentifier</code> or <code>logGroupName</code>. You must specify one of these parameters, but you can't specify both. </p><p>In the results, fields that start with <code>@</code> are fields generated by CloudWatch Logs. For example, <code>@timestamp</code> is the timestamp of each log event. For more information about the fields that are generated by CloudWatch logs, see <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CWL_AnalyzeLogData-discoverable-fields.html">Supported Logs and Discovered Fields</a>.</p><p>The response results are sorted by the frequency percentage, starting with the highest percentage.</p><p>If you are using CloudWatch cross-account observability, you can use this operation in a monitoring account and view data from the linked source accounts. For more information, see <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-Unified-Cross-Account.html">CloudWatch cross-account observability</a>.</p>
 
 @param request A container for the necessary parameters to execute the GetLogGroupFields service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLogsGetLogGroupFieldsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorLimitExceeded`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsGetLogGroupFieldsRequest
 @see AWSLogsGetLogGroupFieldsResponse
 */
- (AWSTask<AWSLogsGetLogGroupFieldsResponse *> *)getLogGroupFields:(AWSLogsGetLogGroupFieldsRequest *)request;

/**
 <p>Returns a list of the fields that are included in log events in the specified log group. Includes the percentage of log events that contain each field. The search is limited to a time period that you specify.</p><p>You can specify the log group to search by using either <code>logGroupIdentifier</code> or <code>logGroupName</code>. You must specify one of these parameters, but you can't specify both. </p><p>In the results, fields that start with <code>@</code> are fields generated by CloudWatch Logs. For example, <code>@timestamp</code> is the timestamp of each log event. For more information about the fields that are generated by CloudWatch logs, see <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CWL_AnalyzeLogData-discoverable-fields.html">Supported Logs and Discovered Fields</a>.</p><p>The response results are sorted by the frequency percentage, starting with the highest percentage.</p><p>If you are using CloudWatch cross-account observability, you can use this operation in a monitoring account and view data from the linked source accounts. For more information, see <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-Unified-Cross-Account.html">CloudWatch cross-account observability</a>.</p>
 
 @param request A container for the necessary parameters to execute the GetLogGroupFields service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorLimitExceeded`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsGetLogGroupFieldsRequest
 @see AWSLogsGetLogGroupFieldsResponse
 */
- (void)getLogGroupFields:(AWSLogsGetLogGroupFieldsRequest *)request completionHandler:(void (^ _Nullable)(AWSLogsGetLogGroupFieldsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves all of the fields and values of a single log event. All fields are retrieved, even if the original query that produced the <code>logRecordPointer</code> retrieved only a subset of fields. Fields are returned as field name/field value pairs.</p><p>The full unparsed log event is returned within <code>@message</code>.</p>
 
 @param request A container for the necessary parameters to execute the GetLogRecord service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLogsGetLogRecordResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorLimitExceeded`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsGetLogRecordRequest
 @see AWSLogsGetLogRecordResponse
 */
- (AWSTask<AWSLogsGetLogRecordResponse *> *)getLogRecord:(AWSLogsGetLogRecordRequest *)request;

/**
 <p>Retrieves all of the fields and values of a single log event. All fields are retrieved, even if the original query that produced the <code>logRecordPointer</code> retrieved only a subset of fields. Fields are returned as field name/field value pairs.</p><p>The full unparsed log event is returned within <code>@message</code>.</p>
 
 @param request A container for the necessary parameters to execute the GetLogRecord service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorLimitExceeded`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsGetLogRecordRequest
 @see AWSLogsGetLogRecordResponse
 */
- (void)getLogRecord:(AWSLogsGetLogRecordRequest *)request completionHandler:(void (^ _Nullable)(AWSLogsGetLogRecordResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the results from the specified query.</p><p>Only the fields requested in the query are returned, along with a <code>@ptr</code> field, which is the identifier for the log record. You can use the value of <code>@ptr</code> in a <a href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_GetLogRecord.html">GetLogRecord</a> operation to get the full log record.</p><p><code>GetQueryResults</code> does not start running a query. To run a query, use <a href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_StartQuery.html">StartQuery</a>. For more information about how long results of previous queries are available, see <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/cloudwatch_limits_cwl.html">CloudWatch Logs quotas</a>.</p><p>If the value of the <code>Status</code> field in the output is <code>Running</code>, this operation returns only partial results. If you see a value of <code>Scheduled</code> or <code>Running</code> for the status, you can retry the operation later to see the final results. </p><p>If you are using CloudWatch cross-account observability, you can use this operation in a monitoring account to start queries in linked source accounts. For more information, see <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-Unified-Cross-Account.html">CloudWatch cross-account observability</a>.</p>
 
 @param request A container for the necessary parameters to execute the GetQueryResults service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLogsGetQueryResultsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsGetQueryResultsRequest
 @see AWSLogsGetQueryResultsResponse
 */
- (AWSTask<AWSLogsGetQueryResultsResponse *> *)getQueryResults:(AWSLogsGetQueryResultsRequest *)request;

/**
 <p>Returns the results from the specified query.</p><p>Only the fields requested in the query are returned, along with a <code>@ptr</code> field, which is the identifier for the log record. You can use the value of <code>@ptr</code> in a <a href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_GetLogRecord.html">GetLogRecord</a> operation to get the full log record.</p><p><code>GetQueryResults</code> does not start running a query. To run a query, use <a href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_StartQuery.html">StartQuery</a>. For more information about how long results of previous queries are available, see <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/cloudwatch_limits_cwl.html">CloudWatch Logs quotas</a>.</p><p>If the value of the <code>Status</code> field in the output is <code>Running</code>, this operation returns only partial results. If you see a value of <code>Scheduled</code> or <code>Running</code> for the status, you can retry the operation later to see the final results. </p><p>If you are using CloudWatch cross-account observability, you can use this operation in a monitoring account to start queries in linked source accounts. For more information, see <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-Unified-Cross-Account.html">CloudWatch cross-account observability</a>.</p>
 
 @param request A container for the necessary parameters to execute the GetQueryResults service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsGetQueryResultsRequest
 @see AWSLogsGetQueryResultsResponse
 */
- (void)getQueryResults:(AWSLogsGetQueryResultsRequest *)request completionHandler:(void (^ _Nullable)(AWSLogsGetQueryResultsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of anomalies that log anomaly detectors have found. For details about the structure format of each anomaly object that is returned, see the example in this section.</p>
 
 @param request A container for the necessary parameters to execute the ListAnomalies service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLogsListAnomaliesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorServiceUnavailable`, `AWSLogsErrorOperationAborted`.
 
 @see AWSLogsListAnomaliesRequest
 @see AWSLogsListAnomaliesResponse
 */
- (AWSTask<AWSLogsListAnomaliesResponse *> *)listAnomalies:(AWSLogsListAnomaliesRequest *)request;

/**
 <p>Returns a list of anomalies that log anomaly detectors have found. For details about the structure format of each anomaly object that is returned, see the example in this section.</p>
 
 @param request A container for the necessary parameters to execute the ListAnomalies service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorServiceUnavailable`, `AWSLogsErrorOperationAborted`.
 
 @see AWSLogsListAnomaliesRequest
 @see AWSLogsListAnomaliesResponse
 */
- (void)listAnomalies:(AWSLogsListAnomaliesRequest *)request completionHandler:(void (^ _Nullable)(AWSLogsListAnomaliesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves a list of the log anomaly detectors in the account.</p>
 
 @param request A container for the necessary parameters to execute the ListLogAnomalyDetectors service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLogsListLogAnomalyDetectorsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorServiceUnavailable`, `AWSLogsErrorOperationAborted`.
 
 @see AWSLogsListLogAnomalyDetectorsRequest
 @see AWSLogsListLogAnomalyDetectorsResponse
 */
- (AWSTask<AWSLogsListLogAnomalyDetectorsResponse *> *)listLogAnomalyDetectors:(AWSLogsListLogAnomalyDetectorsRequest *)request;

/**
 <p>Retrieves a list of the log anomaly detectors in the account.</p>
 
 @param request A container for the necessary parameters to execute the ListLogAnomalyDetectors service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorServiceUnavailable`, `AWSLogsErrorOperationAborted`.
 
 @see AWSLogsListLogAnomalyDetectorsRequest
 @see AWSLogsListLogAnomalyDetectorsResponse
 */
- (void)listLogAnomalyDetectors:(AWSLogsListLogAnomalyDetectorsRequest *)request completionHandler:(void (^ _Nullable)(AWSLogsListLogAnomalyDetectorsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Displays the tags associated with a CloudWatch Logs resource. Currently, log groups and destinations support tagging.</p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLogsListTagsForResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsListTagsForResourceRequest
 @see AWSLogsListTagsForResourceResponse
 */
- (AWSTask<AWSLogsListTagsForResourceResponse *> *)listTagsForResource:(AWSLogsListTagsForResourceRequest *)request;

/**
 <p>Displays the tags associated with a CloudWatch Logs resource. Currently, log groups and destinations support tagging.</p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsListTagsForResourceRequest
 @see AWSLogsListTagsForResourceResponse
 */
- (void)listTagsForResource:(AWSLogsListTagsForResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSLogsListTagsForResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <important><p>The ListTagsLogGroup operation is on the path to deprecation. We recommend that you use <a href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_ListTagsForResource.html">ListTagsForResource</a> instead.</p></important><p>Lists the tags for the specified log group.</p>
 
 @param request A container for the necessary parameters to execute the ListTagsLogGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLogsListTagsLogGroupResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorResourceNotFound`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsListTagsLogGroupRequest
 @see AWSLogsListTagsLogGroupResponse
 */
- (AWSTask<AWSLogsListTagsLogGroupResponse *> *)listTagsLogGroup:(AWSLogsListTagsLogGroupRequest *)request;

/**
 <important><p>The ListTagsLogGroup operation is on the path to deprecation. We recommend that you use <a href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_ListTagsForResource.html">ListTagsForResource</a> instead.</p></important><p>Lists the tags for the specified log group.</p>
 
 @param request A container for the necessary parameters to execute the ListTagsLogGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorResourceNotFound`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsListTagsLogGroupRequest
 @see AWSLogsListTagsLogGroupResponse
 */
- (void)listTagsLogGroup:(AWSLogsListTagsLogGroupRequest *)request completionHandler:(void (^ _Nullable)(AWSLogsListTagsLogGroupResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates an account-level data protection policy or subscription filter policy that applies to all log groups or a subset of log groups in the account.</p><p><b>Data protection policy</b></p><p>A data protection policy can help safeguard sensitive data that's ingested by your log groups by auditing and masking the sensitive log data. Each account can have only one account-level data protection policy.</p><important><p>Sensitive data is detected and masked when it is ingested into a log group. When you set a data protection policy, log events ingested into the log groups before that time are not masked.</p></important><p>If you use <code>PutAccountPolicy</code> to create a data protection policy for your whole account, it applies to both existing log groups and all log groups that are created later in this account. The account-level policy is applied to existing log groups with eventual consistency. It might take up to 5 minutes before sensitive data in existing log groups begins to be masked.</p><p>By default, when a user views a log event that includes masked data, the sensitive data is replaced by asterisks. A user who has the <code>logs:Unmask</code> permission can use a <a href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_GetLogEvents.html">GetLogEvents</a> or <a href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_FilterLogEvents.html">FilterLogEvents</a> operation with the <code>unmask</code> parameter set to <code>true</code> to view the unmasked log events. Users with the <code>logs:Unmask</code> can also view unmasked data in the CloudWatch Logs console by running a CloudWatch Logs Insights query with the <code>unmask</code> query command.</p><p>For more information, including a list of types of data that can be audited and masked, see <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/mask-sensitive-log-data.html">Protect sensitive log data with masking</a>.</p><p>To use the <code>PutAccountPolicy</code> operation for a data protection policy, you must be signed on with the <code>logs:PutDataProtectionPolicy</code> and <code>logs:PutAccountPolicy</code> permissions.</p><p>The <code>PutAccountPolicy</code> operation applies to all log groups in the account. You can use <a href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDataProtectionPolicy.html">PutDataProtectionPolicy</a> to create a data protection policy that applies to just one log group. If a log group has its own data protection policy and the account also has an account-level data protection policy, then the two policies are cumulative. Any sensitive term specified in either policy is masked.</p><p><b>Subscription filter policy</b></p><p>A subscription filter policy sets up a real-time feed of log events from CloudWatch Logs to other Amazon Web Services services. Account-level subscription filter policies apply to both existing log groups and log groups that are created later in this account. Supported destinations are Kinesis Data Streams, Firehose, and Lambda. When log events are sent to the receiving service, they are Base64 encoded and compressed with the GZIP format.</p><p>The following destinations are supported for subscription filters:</p><ul><li><p>An Kinesis Data Streams data stream in the same account as the subscription policy, for same-account delivery.</p></li><li><p>An Firehose data stream in the same account as the subscription policy, for same-account delivery.</p></li><li><p>A Lambda function in the same account as the subscription policy, for same-account delivery.</p></li><li><p>A logical destination in a different account created with <a href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDestination.html">PutDestination</a>, for cross-account delivery. Kinesis Data Streams and Firehose are supported as logical destinations.</p></li></ul><p>Each account can have one account-level subscription filter policy. If you are updating an existing filter, you must specify the correct name in <code>PolicyName</code>. To perform a <code>PutAccountPolicy</code> subscription filter operation for any destination except a Lambda function, you must also have the <code>iam:PassRole</code> permission.</p>
 
 @param request A container for the necessary parameters to execute the PutAccountPolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLogsPutAccountPolicyResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorOperationAborted`, `AWSLogsErrorServiceUnavailable`, `AWSLogsErrorLimitExceeded`.
 
 @see AWSLogsPutAccountPolicyRequest
 @see AWSLogsPutAccountPolicyResponse
 */
- (AWSTask<AWSLogsPutAccountPolicyResponse *> *)putAccountPolicy:(AWSLogsPutAccountPolicyRequest *)request;

/**
 <p>Creates an account-level data protection policy or subscription filter policy that applies to all log groups or a subset of log groups in the account.</p><p><b>Data protection policy</b></p><p>A data protection policy can help safeguard sensitive data that's ingested by your log groups by auditing and masking the sensitive log data. Each account can have only one account-level data protection policy.</p><important><p>Sensitive data is detected and masked when it is ingested into a log group. When you set a data protection policy, log events ingested into the log groups before that time are not masked.</p></important><p>If you use <code>PutAccountPolicy</code> to create a data protection policy for your whole account, it applies to both existing log groups and all log groups that are created later in this account. The account-level policy is applied to existing log groups with eventual consistency. It might take up to 5 minutes before sensitive data in existing log groups begins to be masked.</p><p>By default, when a user views a log event that includes masked data, the sensitive data is replaced by asterisks. A user who has the <code>logs:Unmask</code> permission can use a <a href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_GetLogEvents.html">GetLogEvents</a> or <a href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_FilterLogEvents.html">FilterLogEvents</a> operation with the <code>unmask</code> parameter set to <code>true</code> to view the unmasked log events. Users with the <code>logs:Unmask</code> can also view unmasked data in the CloudWatch Logs console by running a CloudWatch Logs Insights query with the <code>unmask</code> query command.</p><p>For more information, including a list of types of data that can be audited and masked, see <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/mask-sensitive-log-data.html">Protect sensitive log data with masking</a>.</p><p>To use the <code>PutAccountPolicy</code> operation for a data protection policy, you must be signed on with the <code>logs:PutDataProtectionPolicy</code> and <code>logs:PutAccountPolicy</code> permissions.</p><p>The <code>PutAccountPolicy</code> operation applies to all log groups in the account. You can use <a href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDataProtectionPolicy.html">PutDataProtectionPolicy</a> to create a data protection policy that applies to just one log group. If a log group has its own data protection policy and the account also has an account-level data protection policy, then the two policies are cumulative. Any sensitive term specified in either policy is masked.</p><p><b>Subscription filter policy</b></p><p>A subscription filter policy sets up a real-time feed of log events from CloudWatch Logs to other Amazon Web Services services. Account-level subscription filter policies apply to both existing log groups and log groups that are created later in this account. Supported destinations are Kinesis Data Streams, Firehose, and Lambda. When log events are sent to the receiving service, they are Base64 encoded and compressed with the GZIP format.</p><p>The following destinations are supported for subscription filters:</p><ul><li><p>An Kinesis Data Streams data stream in the same account as the subscription policy, for same-account delivery.</p></li><li><p>An Firehose data stream in the same account as the subscription policy, for same-account delivery.</p></li><li><p>A Lambda function in the same account as the subscription policy, for same-account delivery.</p></li><li><p>A logical destination in a different account created with <a href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDestination.html">PutDestination</a>, for cross-account delivery. Kinesis Data Streams and Firehose are supported as logical destinations.</p></li></ul><p>Each account can have one account-level subscription filter policy. If you are updating an existing filter, you must specify the correct name in <code>PolicyName</code>. To perform a <code>PutAccountPolicy</code> subscription filter operation for any destination except a Lambda function, you must also have the <code>iam:PassRole</code> permission.</p>
 
 @param request A container for the necessary parameters to execute the PutAccountPolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorOperationAborted`, `AWSLogsErrorServiceUnavailable`, `AWSLogsErrorLimitExceeded`.
 
 @see AWSLogsPutAccountPolicyRequest
 @see AWSLogsPutAccountPolicyResponse
 */
- (void)putAccountPolicy:(AWSLogsPutAccountPolicyRequest *)request completionHandler:(void (^ _Nullable)(AWSLogsPutAccountPolicyResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a data protection policy for the specified log group. A data protection policy can help safeguard sensitive data that's ingested by the log group by auditing and masking the sensitive log data.</p><important><p>Sensitive data is detected and masked when it is ingested into the log group. When you set a data protection policy, log events ingested into the log group before that time are not masked.</p></important><p>By default, when a user views a log event that includes masked data, the sensitive data is replaced by asterisks. A user who has the <code>logs:Unmask</code> permission can use a <a href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_GetLogEvents.html">GetLogEvents</a> or <a href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_FilterLogEvents.html">FilterLogEvents</a> operation with the <code>unmask</code> parameter set to <code>true</code> to view the unmasked log events. Users with the <code>logs:Unmask</code> can also view unmasked data in the CloudWatch Logs console by running a CloudWatch Logs Insights query with the <code>unmask</code> query command.</p><p>For more information, including a list of types of data that can be audited and masked, see <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/mask-sensitive-log-data.html">Protect sensitive log data with masking</a>.</p><p>The <code>PutDataProtectionPolicy</code> operation applies to only the specified log group. You can also use <a href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutAccountPolicy.html">PutAccountPolicy</a> to create an account-level data protection policy that applies to all log groups in the account, including both existing log groups and log groups that are created level. If a log group has its own data protection policy and the account also has an account-level data protection policy, then the two policies are cumulative. Any sensitive term specified in either policy is masked.</p>
 
 @param request A container for the necessary parameters to execute the PutDataProtectionPolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLogsPutDataProtectionPolicyResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorLimitExceeded`, `AWSLogsErrorOperationAborted`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsPutDataProtectionPolicyRequest
 @see AWSLogsPutDataProtectionPolicyResponse
 */
- (AWSTask<AWSLogsPutDataProtectionPolicyResponse *> *)putDataProtectionPolicy:(AWSLogsPutDataProtectionPolicyRequest *)request;

/**
 <p>Creates a data protection policy for the specified log group. A data protection policy can help safeguard sensitive data that's ingested by the log group by auditing and masking the sensitive log data.</p><important><p>Sensitive data is detected and masked when it is ingested into the log group. When you set a data protection policy, log events ingested into the log group before that time are not masked.</p></important><p>By default, when a user views a log event that includes masked data, the sensitive data is replaced by asterisks. A user who has the <code>logs:Unmask</code> permission can use a <a href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_GetLogEvents.html">GetLogEvents</a> or <a href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_FilterLogEvents.html">FilterLogEvents</a> operation with the <code>unmask</code> parameter set to <code>true</code> to view the unmasked log events. Users with the <code>logs:Unmask</code> can also view unmasked data in the CloudWatch Logs console by running a CloudWatch Logs Insights query with the <code>unmask</code> query command.</p><p>For more information, including a list of types of data that can be audited and masked, see <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/mask-sensitive-log-data.html">Protect sensitive log data with masking</a>.</p><p>The <code>PutDataProtectionPolicy</code> operation applies to only the specified log group. You can also use <a href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutAccountPolicy.html">PutAccountPolicy</a> to create an account-level data protection policy that applies to all log groups in the account, including both existing log groups and log groups that are created level. If a log group has its own data protection policy and the account also has an account-level data protection policy, then the two policies are cumulative. Any sensitive term specified in either policy is masked.</p>
 
 @param request A container for the necessary parameters to execute the PutDataProtectionPolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorLimitExceeded`, `AWSLogsErrorOperationAborted`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsPutDataProtectionPolicyRequest
 @see AWSLogsPutDataProtectionPolicyResponse
 */
- (void)putDataProtectionPolicy:(AWSLogsPutDataProtectionPolicyRequest *)request completionHandler:(void (^ _Nullable)(AWSLogsPutDataProtectionPolicyResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates or updates a logical <i>delivery destination</i>. A delivery destination is an Amazon Web Services resource that represents an Amazon Web Services service that logs can be sent to. CloudWatch Logs, Amazon S3, and Firehose are supported as logs delivery destinations.</p><p>To configure logs delivery between a supported Amazon Web Services service and a destination, you must do the following:</p><ul><li><p>Create a delivery source, which is a logical object that represents the resource that is actually sending the logs. For more information, see <a href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDeliverySource.html">PutDeliverySource</a>.</p></li><li><p>Use <code>PutDeliveryDestination</code> to create a <i>delivery destination</i>, which is a logical object that represents the actual delivery destination. </p></li><li><p>If you are delivering logs cross-account, you must use <a href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDeliveryDestinationPolicy.html">PutDeliveryDestinationPolicy</a> in the destination account to assign an IAM policy to the destination. This policy allows delivery to that destination. </p></li><li><p>Use <code>CreateDelivery</code> to create a <i>delivery</i> by pairing exactly one delivery source and one delivery destination. For more information, see <a href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_CreateDelivery.html">CreateDelivery</a>. </p></li></ul><p>You can configure a single delivery source to send logs to multiple destinations by creating multiple deliveries. You can also create multiple deliveries to configure multiple delivery sources to send logs to the same delivery destination.</p><p>Only some Amazon Web Services services support being configured as a delivery source. These services are listed as <b>Supported [V2 Permissions]</b> in the table at <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/AWS-logs-and-resource-policy.html">Enabling logging from Amazon Web Services services.</a></p><p>If you use this operation to update an existing delivery destination, all the current delivery destination parameters are overwritten with the new parameter values that you specify.</p>
 
 @param request A container for the necessary parameters to execute the PutDeliveryDestination service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLogsPutDeliveryDestinationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorServiceUnavailable`, `AWSLogsErrorConflict`, `AWSLogsErrorValidation`, `AWSLogsErrorServiceQuotaExceeded`, `AWSLogsErrorThrottling`, `AWSLogsErrorResourceNotFound`.
 
 @see AWSLogsPutDeliveryDestinationRequest
 @see AWSLogsPutDeliveryDestinationResponse
 */
- (AWSTask<AWSLogsPutDeliveryDestinationResponse *> *)putDeliveryDestination:(AWSLogsPutDeliveryDestinationRequest *)request;

/**
 <p>Creates or updates a logical <i>delivery destination</i>. A delivery destination is an Amazon Web Services resource that represents an Amazon Web Services service that logs can be sent to. CloudWatch Logs, Amazon S3, and Firehose are supported as logs delivery destinations.</p><p>To configure logs delivery between a supported Amazon Web Services service and a destination, you must do the following:</p><ul><li><p>Create a delivery source, which is a logical object that represents the resource that is actually sending the logs. For more information, see <a href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDeliverySource.html">PutDeliverySource</a>.</p></li><li><p>Use <code>PutDeliveryDestination</code> to create a <i>delivery destination</i>, which is a logical object that represents the actual delivery destination. </p></li><li><p>If you are delivering logs cross-account, you must use <a href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDeliveryDestinationPolicy.html">PutDeliveryDestinationPolicy</a> in the destination account to assign an IAM policy to the destination. This policy allows delivery to that destination. </p></li><li><p>Use <code>CreateDelivery</code> to create a <i>delivery</i> by pairing exactly one delivery source and one delivery destination. For more information, see <a href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_CreateDelivery.html">CreateDelivery</a>. </p></li></ul><p>You can configure a single delivery source to send logs to multiple destinations by creating multiple deliveries. You can also create multiple deliveries to configure multiple delivery sources to send logs to the same delivery destination.</p><p>Only some Amazon Web Services services support being configured as a delivery source. These services are listed as <b>Supported [V2 Permissions]</b> in the table at <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/AWS-logs-and-resource-policy.html">Enabling logging from Amazon Web Services services.</a></p><p>If you use this operation to update an existing delivery destination, all the current delivery destination parameters are overwritten with the new parameter values that you specify.</p>
 
 @param request A container for the necessary parameters to execute the PutDeliveryDestination service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorServiceUnavailable`, `AWSLogsErrorConflict`, `AWSLogsErrorValidation`, `AWSLogsErrorServiceQuotaExceeded`, `AWSLogsErrorThrottling`, `AWSLogsErrorResourceNotFound`.
 
 @see AWSLogsPutDeliveryDestinationRequest
 @see AWSLogsPutDeliveryDestinationResponse
 */
- (void)putDeliveryDestination:(AWSLogsPutDeliveryDestinationRequest *)request completionHandler:(void (^ _Nullable)(AWSLogsPutDeliveryDestinationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates and assigns an IAM policy that grants permissions to CloudWatch Logs to deliver logs cross-account to a specified destination in this account. To configure the delivery of logs from an Amazon Web Services service in another account to a logs delivery destination in the current account, you must do the following:</p><ul><li><p>Create a delivery source, which is a logical object that represents the resource that is actually sending the logs. For more information, see <a href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDeliverySource.html">PutDeliverySource</a>.</p></li><li><p>Create a <i>delivery destination</i>, which is a logical object that represents the actual delivery destination. For more information, see <a href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDeliveryDestination.html">PutDeliveryDestination</a>.</p></li><li><p>Use this operation in the destination account to assign an IAM policy to the destination. This policy allows delivery to that destination. </p></li><li><p>Create a <i>delivery</i> by pairing exactly one delivery source and one delivery destination. For more information, see <a href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_CreateDelivery.html">CreateDelivery</a>.</p></li></ul><p>Only some Amazon Web Services services support being configured as a delivery source. These services are listed as <b>Supported [V2 Permissions]</b> in the table at <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/AWS-logs-and-resource-policy.html">Enabling logging from Amazon Web Services services.</a></p><p>The contents of the policy must include two statements. One statement enables general logs delivery, and the other allows delivery to the chosen destination. See the examples for the needed policies.</p>
 
 @param request A container for the necessary parameters to execute the PutDeliveryDestinationPolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLogsPutDeliveryDestinationPolicyResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorServiceUnavailable`, `AWSLogsErrorValidation`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorConflict`.
 
 @see AWSLogsPutDeliveryDestinationPolicyRequest
 @see AWSLogsPutDeliveryDestinationPolicyResponse
 */
- (AWSTask<AWSLogsPutDeliveryDestinationPolicyResponse *> *)putDeliveryDestinationPolicy:(AWSLogsPutDeliveryDestinationPolicyRequest *)request;

/**
 <p>Creates and assigns an IAM policy that grants permissions to CloudWatch Logs to deliver logs cross-account to a specified destination in this account. To configure the delivery of logs from an Amazon Web Services service in another account to a logs delivery destination in the current account, you must do the following:</p><ul><li><p>Create a delivery source, which is a logical object that represents the resource that is actually sending the logs. For more information, see <a href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDeliverySource.html">PutDeliverySource</a>.</p></li><li><p>Create a <i>delivery destination</i>, which is a logical object that represents the actual delivery destination. For more information, see <a href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDeliveryDestination.html">PutDeliveryDestination</a>.</p></li><li><p>Use this operation in the destination account to assign an IAM policy to the destination. This policy allows delivery to that destination. </p></li><li><p>Create a <i>delivery</i> by pairing exactly one delivery source and one delivery destination. For more information, see <a href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_CreateDelivery.html">CreateDelivery</a>.</p></li></ul><p>Only some Amazon Web Services services support being configured as a delivery source. These services are listed as <b>Supported [V2 Permissions]</b> in the table at <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/AWS-logs-and-resource-policy.html">Enabling logging from Amazon Web Services services.</a></p><p>The contents of the policy must include two statements. One statement enables general logs delivery, and the other allows delivery to the chosen destination. See the examples for the needed policies.</p>
 
 @param request A container for the necessary parameters to execute the PutDeliveryDestinationPolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorServiceUnavailable`, `AWSLogsErrorValidation`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorConflict`.
 
 @see AWSLogsPutDeliveryDestinationPolicyRequest
 @see AWSLogsPutDeliveryDestinationPolicyResponse
 */
- (void)putDeliveryDestinationPolicy:(AWSLogsPutDeliveryDestinationPolicyRequest *)request completionHandler:(void (^ _Nullable)(AWSLogsPutDeliveryDestinationPolicyResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates or updates a logical <i>delivery source</i>. A delivery source represents an Amazon Web Services resource that sends logs to an logs delivery destination. The destination can be CloudWatch Logs, Amazon S3, or Firehose.</p><p>To configure logs delivery between a delivery destination and an Amazon Web Services service that is supported as a delivery source, you must do the following:</p><ul><li><p>Use <code>PutDeliverySource</code> to create a delivery source, which is a logical object that represents the resource that is actually sending the logs. </p></li><li><p>Use <code>PutDeliveryDestination</code> to create a <i>delivery destination</i>, which is a logical object that represents the actual delivery destination. For more information, see <a href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDeliveryDestination.html">PutDeliveryDestination</a>.</p></li><li><p>If you are delivering logs cross-account, you must use <a href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDeliveryDestinationPolicy.html">PutDeliveryDestinationPolicy</a> in the destination account to assign an IAM policy to the destination. This policy allows delivery to that destination. </p></li><li><p>Use <code>CreateDelivery</code> to create a <i>delivery</i> by pairing exactly one delivery source and one delivery destination. For more information, see <a href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_CreateDelivery.html">CreateDelivery</a>. </p></li></ul><p>You can configure a single delivery source to send logs to multiple destinations by creating multiple deliveries. You can also create multiple deliveries to configure multiple delivery sources to send logs to the same delivery destination.</p><p>Only some Amazon Web Services services support being configured as a delivery source. These services are listed as <b>Supported [V2 Permissions]</b> in the table at <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/AWS-logs-and-resource-policy.html">Enabling logging from Amazon Web Services services.</a></p><p>If you use this operation to update an existing delivery source, all the current delivery source parameters are overwritten with the new parameter values that you specify.</p>
 
 @param request A container for the necessary parameters to execute the PutDeliverySource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLogsPutDeliverySourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorServiceUnavailable`, `AWSLogsErrorConflict`, `AWSLogsErrorValidation`, `AWSLogsErrorServiceQuotaExceeded`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorThrottling`.
 
 @see AWSLogsPutDeliverySourceRequest
 @see AWSLogsPutDeliverySourceResponse
 */
- (AWSTask<AWSLogsPutDeliverySourceResponse *> *)putDeliverySource:(AWSLogsPutDeliverySourceRequest *)request;

/**
 <p>Creates or updates a logical <i>delivery source</i>. A delivery source represents an Amazon Web Services resource that sends logs to an logs delivery destination. The destination can be CloudWatch Logs, Amazon S3, or Firehose.</p><p>To configure logs delivery between a delivery destination and an Amazon Web Services service that is supported as a delivery source, you must do the following:</p><ul><li><p>Use <code>PutDeliverySource</code> to create a delivery source, which is a logical object that represents the resource that is actually sending the logs. </p></li><li><p>Use <code>PutDeliveryDestination</code> to create a <i>delivery destination</i>, which is a logical object that represents the actual delivery destination. For more information, see <a href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDeliveryDestination.html">PutDeliveryDestination</a>.</p></li><li><p>If you are delivering logs cross-account, you must use <a href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDeliveryDestinationPolicy.html">PutDeliveryDestinationPolicy</a> in the destination account to assign an IAM policy to the destination. This policy allows delivery to that destination. </p></li><li><p>Use <code>CreateDelivery</code> to create a <i>delivery</i> by pairing exactly one delivery source and one delivery destination. For more information, see <a href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_CreateDelivery.html">CreateDelivery</a>. </p></li></ul><p>You can configure a single delivery source to send logs to multiple destinations by creating multiple deliveries. You can also create multiple deliveries to configure multiple delivery sources to send logs to the same delivery destination.</p><p>Only some Amazon Web Services services support being configured as a delivery source. These services are listed as <b>Supported [V2 Permissions]</b> in the table at <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/AWS-logs-and-resource-policy.html">Enabling logging from Amazon Web Services services.</a></p><p>If you use this operation to update an existing delivery source, all the current delivery source parameters are overwritten with the new parameter values that you specify.</p>
 
 @param request A container for the necessary parameters to execute the PutDeliverySource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorServiceUnavailable`, `AWSLogsErrorConflict`, `AWSLogsErrorValidation`, `AWSLogsErrorServiceQuotaExceeded`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorThrottling`.
 
 @see AWSLogsPutDeliverySourceRequest
 @see AWSLogsPutDeliverySourceResponse
 */
- (void)putDeliverySource:(AWSLogsPutDeliverySourceRequest *)request completionHandler:(void (^ _Nullable)(AWSLogsPutDeliverySourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates or updates a destination. This operation is used only to create destinations for cross-account subscriptions.</p><p>A destination encapsulates a physical resource (such as an Amazon Kinesis stream). With a destination, you can subscribe to a real-time stream of log events for a different account, ingested using <a href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutLogEvents.html">PutLogEvents</a>.</p><p>Through an access policy, a destination controls what is written to it. By default, <code>PutDestination</code> does not set any access policy with the destination, which means a cross-account user cannot call <a href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutSubscriptionFilter.html">PutSubscriptionFilter</a> against this destination. To enable this, the destination owner must call <a href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDestinationPolicy.html">PutDestinationPolicy</a> after <code>PutDestination</code>.</p><p>To perform a <code>PutDestination</code> operation, you must also have the <code>iam:PassRole</code> permission.</p>
 
 @param request A container for the necessary parameters to execute the PutDestination service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLogsPutDestinationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorOperationAborted`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsPutDestinationRequest
 @see AWSLogsPutDestinationResponse
 */
- (AWSTask<AWSLogsPutDestinationResponse *> *)putDestination:(AWSLogsPutDestinationRequest *)request;

/**
 <p>Creates or updates a destination. This operation is used only to create destinations for cross-account subscriptions.</p><p>A destination encapsulates a physical resource (such as an Amazon Kinesis stream). With a destination, you can subscribe to a real-time stream of log events for a different account, ingested using <a href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutLogEvents.html">PutLogEvents</a>.</p><p>Through an access policy, a destination controls what is written to it. By default, <code>PutDestination</code> does not set any access policy with the destination, which means a cross-account user cannot call <a href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutSubscriptionFilter.html">PutSubscriptionFilter</a> against this destination. To enable this, the destination owner must call <a href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDestinationPolicy.html">PutDestinationPolicy</a> after <code>PutDestination</code>.</p><p>To perform a <code>PutDestination</code> operation, you must also have the <code>iam:PassRole</code> permission.</p>
 
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
 <p>Uploads a batch of log events to the specified log stream.</p><important><p>The sequence token is now ignored in <code>PutLogEvents</code> actions. <code>PutLogEvents</code> actions are always accepted and never return <code>InvalidSequenceTokenException</code> or <code>DataAlreadyAcceptedException</code> even if the sequence token is not valid. You can use parallel <code>PutLogEvents</code> actions on the same log stream. </p></important><p>The batch of events must satisfy the following constraints:</p><ul><li><p>The maximum batch size is 1,048,576 bytes. This size is calculated as the sum of all event messages in UTF-8, plus 26 bytes for each log event.</p></li><li><p>None of the log events in the batch can be more than 2 hours in the future.</p></li><li><p>None of the log events in the batch can be more than 14 days in the past. Also, none of the log events can be from earlier than the retention period of the log group.</p></li><li><p>The log events in the batch must be in chronological order by their timestamp. The timestamp is the time that the event occurred, expressed as the number of milliseconds after <code>Jan 1, 1970 00:00:00 UTC</code>. (In Amazon Web Services Tools for PowerShell and the Amazon Web Services SDK for .NET, the timestamp is specified in .NET format: <code>yyyy-mm-ddThh:mm:ss</code>. For example, <code>2017-09-15T13:45:30</code>.) </p></li><li><p>A batch of log events in a single request cannot span more than 24 hours. Otherwise, the operation fails.</p></li><li><p>Each log event can be no larger than 256 KB.</p></li><li><p>The maximum number of log events in a batch is 10,000.</p></li><li><important><p>The quota of five requests per second per log stream has been removed. Instead, <code>PutLogEvents</code> actions are throttled based on a per-second per-account quota. You can request an increase to the per-second throttling quota by using the Service Quotas service.</p></important></li></ul><p>If a call to <code>PutLogEvents</code> returns "UnrecognizedClientException" the most likely cause is a non-valid Amazon Web Services access key ID or secret key. </p>
 
 @param request A container for the necessary parameters to execute the PutLogEvents service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLogsPutLogEventsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorInvalidSequenceToken`, `AWSLogsErrorDataAlreadyAccepted`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorServiceUnavailable`, `AWSLogsErrorUnrecognizedClient`.
 
 @see AWSLogsPutLogEventsRequest
 @see AWSLogsPutLogEventsResponse
 */
- (AWSTask<AWSLogsPutLogEventsResponse *> *)putLogEvents:(AWSLogsPutLogEventsRequest *)request;

/**
 <p>Uploads a batch of log events to the specified log stream.</p><important><p>The sequence token is now ignored in <code>PutLogEvents</code> actions. <code>PutLogEvents</code> actions are always accepted and never return <code>InvalidSequenceTokenException</code> or <code>DataAlreadyAcceptedException</code> even if the sequence token is not valid. You can use parallel <code>PutLogEvents</code> actions on the same log stream. </p></important><p>The batch of events must satisfy the following constraints:</p><ul><li><p>The maximum batch size is 1,048,576 bytes. This size is calculated as the sum of all event messages in UTF-8, plus 26 bytes for each log event.</p></li><li><p>None of the log events in the batch can be more than 2 hours in the future.</p></li><li><p>None of the log events in the batch can be more than 14 days in the past. Also, none of the log events can be from earlier than the retention period of the log group.</p></li><li><p>The log events in the batch must be in chronological order by their timestamp. The timestamp is the time that the event occurred, expressed as the number of milliseconds after <code>Jan 1, 1970 00:00:00 UTC</code>. (In Amazon Web Services Tools for PowerShell and the Amazon Web Services SDK for .NET, the timestamp is specified in .NET format: <code>yyyy-mm-ddThh:mm:ss</code>. For example, <code>2017-09-15T13:45:30</code>.) </p></li><li><p>A batch of log events in a single request cannot span more than 24 hours. Otherwise, the operation fails.</p></li><li><p>Each log event can be no larger than 256 KB.</p></li><li><p>The maximum number of log events in a batch is 10,000.</p></li><li><important><p>The quota of five requests per second per log stream has been removed. Instead, <code>PutLogEvents</code> actions are throttled based on a per-second per-account quota. You can request an increase to the per-second throttling quota by using the Service Quotas service.</p></important></li></ul><p>If a call to <code>PutLogEvents</code> returns "UnrecognizedClientException" the most likely cause is a non-valid Amazon Web Services access key ID or secret key. </p>
 
 @param request A container for the necessary parameters to execute the PutLogEvents service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorInvalidSequenceToken`, `AWSLogsErrorDataAlreadyAccepted`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorServiceUnavailable`, `AWSLogsErrorUnrecognizedClient`.
 
 @see AWSLogsPutLogEventsRequest
 @see AWSLogsPutLogEventsResponse
 */
- (void)putLogEvents:(AWSLogsPutLogEventsRequest *)request completionHandler:(void (^ _Nullable)(AWSLogsPutLogEventsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates or updates a metric filter and associates it with the specified log group. With metric filters, you can configure rules to extract metric data from log events ingested through <a href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutLogEvents.html">PutLogEvents</a>.</p><p>The maximum number of metric filters that can be associated with a log group is 100.</p><p>When you create a metric filter, you can also optionally assign a unit and dimensions to the metric that is created.</p><important><p>Metrics extracted from log events are charged as custom metrics. To prevent unexpected high charges, do not specify high-cardinality fields such as <code>IPAddress</code> or <code>requestID</code> as dimensions. Each different value found for a dimension is treated as a separate metric and accrues charges as a separate custom metric. </p><p>CloudWatch Logs might disable a metric filter if it generates 1,000 different name/value pairs for your specified dimensions within one hour.</p><p>You can also set up a billing alarm to alert you if your charges are higher than expected. For more information, see <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/monitor_estimated_charges_with_cloudwatch.html"> Creating a Billing Alarm to Monitor Your Estimated Amazon Web Services Charges</a>. </p></important>
 
 @param request A container for the necessary parameters to execute the PutMetricFilter service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorOperationAborted`, `AWSLogsErrorLimitExceeded`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsPutMetricFilterRequest
 */
- (AWSTask *)putMetricFilter:(AWSLogsPutMetricFilterRequest *)request;

/**
 <p>Creates or updates a metric filter and associates it with the specified log group. With metric filters, you can configure rules to extract metric data from log events ingested through <a href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutLogEvents.html">PutLogEvents</a>.</p><p>The maximum number of metric filters that can be associated with a log group is 100.</p><p>When you create a metric filter, you can also optionally assign a unit and dimensions to the metric that is created.</p><important><p>Metrics extracted from log events are charged as custom metrics. To prevent unexpected high charges, do not specify high-cardinality fields such as <code>IPAddress</code> or <code>requestID</code> as dimensions. Each different value found for a dimension is treated as a separate metric and accrues charges as a separate custom metric. </p><p>CloudWatch Logs might disable a metric filter if it generates 1,000 different name/value pairs for your specified dimensions within one hour.</p><p>You can also set up a billing alarm to alert you if your charges are higher than expected. For more information, see <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/monitor_estimated_charges_with_cloudwatch.html"> Creating a Billing Alarm to Monitor Your Estimated Amazon Web Services Charges</a>. </p></important>
 
 @param request A container for the necessary parameters to execute the PutMetricFilter service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorOperationAborted`, `AWSLogsErrorLimitExceeded`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsPutMetricFilterRequest
 */
- (void)putMetricFilter:(AWSLogsPutMetricFilterRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Creates or updates a query definition for CloudWatch Logs Insights. For more information, see <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/AnalyzingLogData.html">Analyzing Log Data with CloudWatch Logs Insights</a>.</p><p>To update a query definition, specify its <code>queryDefinitionId</code> in your request. The values of <code>name</code>, <code>queryString</code>, and <code>logGroupNames</code> are changed to the values that you specify in your update operation. No current values are retained from the current query definition. For example, imagine updating a current query definition that includes log groups. If you don't specify the <code>logGroupNames</code> parameter in your update operation, the query definition changes to contain no log groups.</p><p>You must have the <code>logs:PutQueryDefinition</code> permission to be able to perform this operation.</p>
 
 @param request A container for the necessary parameters to execute the PutQueryDefinition service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLogsPutQueryDefinitionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorLimitExceeded`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsPutQueryDefinitionRequest
 @see AWSLogsPutQueryDefinitionResponse
 */
- (AWSTask<AWSLogsPutQueryDefinitionResponse *> *)putQueryDefinition:(AWSLogsPutQueryDefinitionRequest *)request;

/**
 <p>Creates or updates a query definition for CloudWatch Logs Insights. For more information, see <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/AnalyzingLogData.html">Analyzing Log Data with CloudWatch Logs Insights</a>.</p><p>To update a query definition, specify its <code>queryDefinitionId</code> in your request. The values of <code>name</code>, <code>queryString</code>, and <code>logGroupNames</code> are changed to the values that you specify in your update operation. No current values are retained from the current query definition. For example, imagine updating a current query definition that includes log groups. If you don't specify the <code>logGroupNames</code> parameter in your update operation, the query definition changes to contain no log groups.</p><p>You must have the <code>logs:PutQueryDefinition</code> permission to be able to perform this operation.</p>
 
 @param request A container for the necessary parameters to execute the PutQueryDefinition service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorLimitExceeded`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsPutQueryDefinitionRequest
 @see AWSLogsPutQueryDefinitionResponse
 */
- (void)putQueryDefinition:(AWSLogsPutQueryDefinitionRequest *)request completionHandler:(void (^ _Nullable)(AWSLogsPutQueryDefinitionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates or updates a resource policy allowing other Amazon Web Services services to put log events to this account, such as Amazon Route 53. An account can have up to 10 resource policies per Amazon Web Services Region.</p>
 
 @param request A container for the necessary parameters to execute the PutResourcePolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLogsPutResourcePolicyResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorLimitExceeded`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsPutResourcePolicyRequest
 @see AWSLogsPutResourcePolicyResponse
 */
- (AWSTask<AWSLogsPutResourcePolicyResponse *> *)putResourcePolicy:(AWSLogsPutResourcePolicyRequest *)request;

/**
 <p>Creates or updates a resource policy allowing other Amazon Web Services services to put log events to this account, such as Amazon Route 53. An account can have up to 10 resource policies per Amazon Web Services Region.</p>
 
 @param request A container for the necessary parameters to execute the PutResourcePolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorLimitExceeded`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsPutResourcePolicyRequest
 @see AWSLogsPutResourcePolicyResponse
 */
- (void)putResourcePolicy:(AWSLogsPutResourcePolicyRequest *)request completionHandler:(void (^ _Nullable)(AWSLogsPutResourcePolicyResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Sets the retention of the specified log group. With a retention policy, you can configure the number of days for which to retain log events in the specified log group.</p><note><p>CloudWatch Logs doesn’t immediately delete log events when they reach their retention setting. It typically takes up to 72 hours after that before log events are deleted, but in rare situations might take longer.</p><p>To illustrate, imagine that you change a log group to have a longer retention setting when it contains log events that are past the expiration date, but haven’t been deleted. Those log events will take up to 72 hours to be deleted after the new retention date is reached. To make sure that log data is deleted permanently, keep a log group at its lower retention setting until 72 hours after the previous retention period ends. Alternatively, wait to change the retention setting until you confirm that the earlier log events are deleted. </p><p>When log events reach their retention setting they are marked for deletion. After they are marked for deletion, they do not add to your archival storage costs anymore, even if they are not actually deleted until later. These log events marked for deletion are also not included when you use an API to retrieve the <code>storedBytes</code> value to see how many bytes a log group is storing.</p></note>
 
 @param request A container for the necessary parameters to execute the PutRetentionPolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorOperationAborted`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsPutRetentionPolicyRequest
 */
- (AWSTask *)putRetentionPolicy:(AWSLogsPutRetentionPolicyRequest *)request;

/**
 <p>Sets the retention of the specified log group. With a retention policy, you can configure the number of days for which to retain log events in the specified log group.</p><note><p>CloudWatch Logs doesn’t immediately delete log events when they reach their retention setting. It typically takes up to 72 hours after that before log events are deleted, but in rare situations might take longer.</p><p>To illustrate, imagine that you change a log group to have a longer retention setting when it contains log events that are past the expiration date, but haven’t been deleted. Those log events will take up to 72 hours to be deleted after the new retention date is reached. To make sure that log data is deleted permanently, keep a log group at its lower retention setting until 72 hours after the previous retention period ends. Alternatively, wait to change the retention setting until you confirm that the earlier log events are deleted. </p><p>When log events reach their retention setting they are marked for deletion. After they are marked for deletion, they do not add to your archival storage costs anymore, even if they are not actually deleted until later. These log events marked for deletion are also not included when you use an API to retrieve the <code>storedBytes</code> value to see how many bytes a log group is storing.</p></note>
 
 @param request A container for the necessary parameters to execute the PutRetentionPolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorOperationAborted`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsPutRetentionPolicyRequest
 */
- (void)putRetentionPolicy:(AWSLogsPutRetentionPolicyRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Creates or updates a subscription filter and associates it with the specified log group. With subscription filters, you can subscribe to a real-time stream of log events ingested through <a href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutLogEvents.html">PutLogEvents</a> and have them delivered to a specific destination. When log events are sent to the receiving service, they are Base64 encoded and compressed with the GZIP format.</p><p>The following destinations are supported for subscription filters:</p><ul><li><p>An Amazon Kinesis data stream belonging to the same account as the subscription filter, for same-account delivery.</p></li><li><p>A logical destination created with <a href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDestination.html">PutDestination</a> that belongs to a different account, for cross-account delivery. We currently support Kinesis Data Streams and Firehose as logical destinations.</p></li><li><p>An Amazon Kinesis Data Firehose delivery stream that belongs to the same account as the subscription filter, for same-account delivery.</p></li><li><p>An Lambda function that belongs to the same account as the subscription filter, for same-account delivery.</p></li></ul><p>Each log group can have up to two subscription filters associated with it. If you are updating an existing filter, you must specify the correct name in <code>filterName</code>. </p><p>To perform a <code>PutSubscriptionFilter</code> operation for any destination except a Lambda function, you must also have the <code>iam:PassRole</code> permission.</p>
 
 @param request A container for the necessary parameters to execute the PutSubscriptionFilter service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorOperationAborted`, `AWSLogsErrorLimitExceeded`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsPutSubscriptionFilterRequest
 */
- (AWSTask *)putSubscriptionFilter:(AWSLogsPutSubscriptionFilterRequest *)request;

/**
 <p>Creates or updates a subscription filter and associates it with the specified log group. With subscription filters, you can subscribe to a real-time stream of log events ingested through <a href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutLogEvents.html">PutLogEvents</a> and have them delivered to a specific destination. When log events are sent to the receiving service, they are Base64 encoded and compressed with the GZIP format.</p><p>The following destinations are supported for subscription filters:</p><ul><li><p>An Amazon Kinesis data stream belonging to the same account as the subscription filter, for same-account delivery.</p></li><li><p>A logical destination created with <a href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDestination.html">PutDestination</a> that belongs to a different account, for cross-account delivery. We currently support Kinesis Data Streams and Firehose as logical destinations.</p></li><li><p>An Amazon Kinesis Data Firehose delivery stream that belongs to the same account as the subscription filter, for same-account delivery.</p></li><li><p>An Lambda function that belongs to the same account as the subscription filter, for same-account delivery.</p></li></ul><p>Each log group can have up to two subscription filters associated with it. If you are updating an existing filter, you must specify the correct name in <code>filterName</code>. </p><p>To perform a <code>PutSubscriptionFilter</code> operation for any destination except a Lambda function, you must also have the <code>iam:PassRole</code> permission.</p>
 
 @param request A container for the necessary parameters to execute the PutSubscriptionFilter service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorOperationAborted`, `AWSLogsErrorLimitExceeded`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsPutSubscriptionFilterRequest
 */
- (void)putSubscriptionFilter:(AWSLogsPutSubscriptionFilterRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Schedules a query of a log group using CloudWatch Logs Insights. You specify the log group and time range to query and the query string to use.</p><p>For more information, see <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CWL_QuerySyntax.html">CloudWatch Logs Insights Query Syntax</a>.</p><p>After you run a query using <code>StartQuery</code>, the query results are stored by CloudWatch Logs. You can use <a href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_GetQueryResults.html">GetQueryResults</a> to retrieve the results of a query, using the <code>queryId</code> that <code>StartQuery</code> returns. </p><p>If you have associated a KMS key with the query results in this account, then <a href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_StartQuery.html">StartQuery</a> uses that key to encrypt the results when it stores them. If no key is associated with query results, the query results are encrypted with the default CloudWatch Logs encryption method.</p><p>Queries time out after 60 minutes of runtime. If your queries are timing out, reduce the time range being searched or partition your query into a number of queries.</p><p>If you are using CloudWatch cross-account observability, you can use this operation in a monitoring account to start a query in a linked source account. For more information, see <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-Unified-Cross-Account.html">CloudWatch cross-account observability</a>. For a cross-account <code>StartQuery</code> operation, the query definition must be defined in the monitoring account.</p><p>You can have up to 30 concurrent CloudWatch Logs insights queries, including queries that have been added to dashboards. </p>
 
 @param request A container for the necessary parameters to execute the StartQuery service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLogsStartQueryResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorMalformedQuery`, `AWSLogsErrorInvalidParameter`, `AWSLogsErrorLimitExceeded`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsStartQueryRequest
 @see AWSLogsStartQueryResponse
 */
- (AWSTask<AWSLogsStartQueryResponse *> *)startQuery:(AWSLogsStartQueryRequest *)request;

/**
 <p>Schedules a query of a log group using CloudWatch Logs Insights. You specify the log group and time range to query and the query string to use.</p><p>For more information, see <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CWL_QuerySyntax.html">CloudWatch Logs Insights Query Syntax</a>.</p><p>After you run a query using <code>StartQuery</code>, the query results are stored by CloudWatch Logs. You can use <a href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_GetQueryResults.html">GetQueryResults</a> to retrieve the results of a query, using the <code>queryId</code> that <code>StartQuery</code> returns. </p><p>If you have associated a KMS key with the query results in this account, then <a href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_StartQuery.html">StartQuery</a> uses that key to encrypt the results when it stores them. If no key is associated with query results, the query results are encrypted with the default CloudWatch Logs encryption method.</p><p>Queries time out after 60 minutes of runtime. If your queries are timing out, reduce the time range being searched or partition your query into a number of queries.</p><p>If you are using CloudWatch cross-account observability, you can use this operation in a monitoring account to start a query in a linked source account. For more information, see <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-Unified-Cross-Account.html">CloudWatch cross-account observability</a>. For a cross-account <code>StartQuery</code> operation, the query definition must be defined in the monitoring account.</p><p>You can have up to 30 concurrent CloudWatch Logs insights queries, including queries that have been added to dashboards. </p>
 
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
 <important><p>The TagLogGroup operation is on the path to deprecation. We recommend that you use <a href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_TagResource.html">TagResource</a> instead.</p></important><p>Adds or updates the specified tags for the specified log group.</p><p>To list the tags for a log group, use <a href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_ListTagsForResource.html">ListTagsForResource</a>. To remove tags, use <a href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_UntagResource.html">UntagResource</a>.</p><p>For more information about tags, see <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/Working-with-log-groups-and-streams.html#log-group-tagging">Tag Log Groups in Amazon CloudWatch Logs</a> in the <i>Amazon CloudWatch Logs User Guide</i>.</p><p>CloudWatch Logs doesn’t support IAM policies that prevent users from assigning specified tags to log groups using the <code>aws:Resource/<i>key-name</i></code> or <code>aws:TagKeys</code> condition keys. For more information about using tags to control access, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_tags.html">Controlling access to Amazon Web Services resources using tags</a>.</p>
 
 @param request A container for the necessary parameters to execute the TagLogGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorResourceNotFound`, `AWSLogsErrorInvalidParameter`.
 
 @see AWSLogsTagLogGroupRequest
 */
- (AWSTask *)tagLogGroup:(AWSLogsTagLogGroupRequest *)request;

/**
 <important><p>The TagLogGroup operation is on the path to deprecation. We recommend that you use <a href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_TagResource.html">TagResource</a> instead.</p></important><p>Adds or updates the specified tags for the specified log group.</p><p>To list the tags for a log group, use <a href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_ListTagsForResource.html">ListTagsForResource</a>. To remove tags, use <a href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_UntagResource.html">UntagResource</a>.</p><p>For more information about tags, see <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/Working-with-log-groups-and-streams.html#log-group-tagging">Tag Log Groups in Amazon CloudWatch Logs</a> in the <i>Amazon CloudWatch Logs User Guide</i>.</p><p>CloudWatch Logs doesn’t support IAM policies that prevent users from assigning specified tags to log groups using the <code>aws:Resource/<i>key-name</i></code> or <code>aws:TagKeys</code> condition keys. For more information about using tags to control access, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_tags.html">Controlling access to Amazon Web Services resources using tags</a>.</p>
 
 @param request A container for the necessary parameters to execute the TagLogGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorResourceNotFound`, `AWSLogsErrorInvalidParameter`.
 
 @see AWSLogsTagLogGroupRequest
 */
- (void)tagLogGroup:(AWSLogsTagLogGroupRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Assigns one or more tags (key-value pairs) to the specified CloudWatch Logs resource. Currently, the only CloudWatch Logs resources that can be tagged are log groups and destinations. </p><p>Tags can help you organize and categorize your resources. You can also use them to scope user permissions by granting a user permission to access or change only resources with certain tag values.</p><p>Tags don't have any semantic meaning to Amazon Web Services and are interpreted strictly as strings of characters.</p><p>You can use the <code>TagResource</code> action with a resource that already has tags. If you specify a new tag key for the alarm, this tag is appended to the list of tags associated with the alarm. If you specify a tag key that is already associated with the alarm, the new tag value that you specify replaces the previous value for that tag.</p><p>You can associate as many as 50 tags with a CloudWatch Logs resource.</p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorServiceUnavailable`, `AWSLogsErrorTooManyTags`.
 
 @see AWSLogsTagResourceRequest
 */
- (AWSTask *)tagResource:(AWSLogsTagResourceRequest *)request;

/**
 <p>Assigns one or more tags (key-value pairs) to the specified CloudWatch Logs resource. Currently, the only CloudWatch Logs resources that can be tagged are log groups and destinations. </p><p>Tags can help you organize and categorize your resources. You can also use them to scope user permissions by granting a user permission to access or change only resources with certain tag values.</p><p>Tags don't have any semantic meaning to Amazon Web Services and are interpreted strictly as strings of characters.</p><p>You can use the <code>TagResource</code> action with a resource that already has tags. If you specify a new tag key for the alarm, this tag is appended to the list of tags associated with the alarm. If you specify a tag key that is already associated with the alarm, the new tag value that you specify replaces the previous value for that tag.</p><p>You can associate as many as 50 tags with a CloudWatch Logs resource.</p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorServiceUnavailable`, `AWSLogsErrorTooManyTags`.
 
 @see AWSLogsTagResourceRequest
 */
- (void)tagResource:(AWSLogsTagResourceRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

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
 <important><p>The UntagLogGroup operation is on the path to deprecation. We recommend that you use <a href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_UntagResource.html">UntagResource</a> instead.</p></important><p>Removes the specified tags from the specified log group.</p><p>To list the tags for a log group, use <a href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_ListTagsForResource.html">ListTagsForResource</a>. To add tags, use <a href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_TagResource.html">TagResource</a>.</p><p>CloudWatch Logs doesn’t support IAM policies that prevent users from assigning specified tags to log groups using the <code>aws:Resource/<i>key-name</i></code> or <code>aws:TagKeys</code> condition keys. </p>
 
 @param request A container for the necessary parameters to execute the UntagLogGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorResourceNotFound`.
 
 @see AWSLogsUntagLogGroupRequest
 */
- (AWSTask *)untagLogGroup:(AWSLogsUntagLogGroupRequest *)request;

/**
 <important><p>The UntagLogGroup operation is on the path to deprecation. We recommend that you use <a href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_UntagResource.html">UntagResource</a> instead.</p></important><p>Removes the specified tags from the specified log group.</p><p>To list the tags for a log group, use <a href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_ListTagsForResource.html">ListTagsForResource</a>. To add tags, use <a href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_TagResource.html">TagResource</a>.</p><p>CloudWatch Logs doesn’t support IAM policies that prevent users from assigning specified tags to log groups using the <code>aws:Resource/<i>key-name</i></code> or <code>aws:TagKeys</code> condition keys. </p>
 
 @param request A container for the necessary parameters to execute the UntagLogGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorResourceNotFound`.
 
 @see AWSLogsUntagLogGroupRequest
 */
- (void)untagLogGroup:(AWSLogsUntagLogGroupRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Removes one or more tags from the specified resource.</p>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsUntagResourceRequest
 */
- (AWSTask *)untagResource:(AWSLogsUntagResourceRequest *)request;

/**
 <p>Removes one or more tags from the specified resource.</p>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorServiceUnavailable`.
 
 @see AWSLogsUntagResourceRequest
 */
- (void)untagResource:(AWSLogsUntagResourceRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Use this operation to <i>suppress</i> anomaly detection for a specified anomaly or pattern. If you suppress an anomaly, CloudWatch Logs won’t report new occurrences of that anomaly and won't update that anomaly with new data. If you suppress a pattern, CloudWatch Logs won’t report any anomalies related to that pattern.</p><p>You must specify either <code>anomalyId</code> or <code>patternId</code>, but you can't specify both parameters in the same operation.</p><p>If you have previously used this operation to suppress detection of a pattern or anomaly, you can use it again to cause CloudWatch Logs to end the suppression. To do this, use this operation and specify the anomaly or pattern to stop suppressing, and omit the <code>suppressionType</code> and <code>suppressionPeriod</code> parameters.</p>
 
 @param request A container for the necessary parameters to execute the UpdateAnomaly service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorServiceUnavailable`, `AWSLogsErrorOperationAborted`.
 
 @see AWSLogsUpdateAnomalyRequest
 */
- (AWSTask *)updateAnomaly:(AWSLogsUpdateAnomalyRequest *)request;

/**
 <p>Use this operation to <i>suppress</i> anomaly detection for a specified anomaly or pattern. If you suppress an anomaly, CloudWatch Logs won’t report new occurrences of that anomaly and won't update that anomaly with new data. If you suppress a pattern, CloudWatch Logs won’t report any anomalies related to that pattern.</p><p>You must specify either <code>anomalyId</code> or <code>patternId</code>, but you can't specify both parameters in the same operation.</p><p>If you have previously used this operation to suppress detection of a pattern or anomaly, you can use it again to cause CloudWatch Logs to end the suppression. To do this, use this operation and specify the anomaly or pattern to stop suppressing, and omit the <code>suppressionType</code> and <code>suppressionPeriod</code> parameters.</p>
 
 @param request A container for the necessary parameters to execute the UpdateAnomaly service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorServiceUnavailable`, `AWSLogsErrorOperationAborted`.
 
 @see AWSLogsUpdateAnomalyRequest
 */
- (void)updateAnomaly:(AWSLogsUpdateAnomalyRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Updates an existing log anomaly detector.</p>
 
 @param request A container for the necessary parameters to execute the UpdateLogAnomalyDetector service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorServiceUnavailable`, `AWSLogsErrorOperationAborted`.
 
 @see AWSLogsUpdateLogAnomalyDetectorRequest
 */
- (AWSTask *)updateLogAnomalyDetector:(AWSLogsUpdateLogAnomalyDetectorRequest *)request;

/**
 <p>Updates an existing log anomaly detector.</p>
 
 @param request A container for the necessary parameters to execute the UpdateLogAnomalyDetector service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLogsErrorDomain` domain and the following error code: `AWSLogsErrorInvalidParameter`, `AWSLogsErrorResourceNotFound`, `AWSLogsErrorServiceUnavailable`, `AWSLogsErrorOperationAborted`.
 
 @see AWSLogsUpdateLogAnomalyDetectorRequest
 */
- (void)updateLogAnomalyDetector:(AWSLogsUpdateLogAnomalyDetectorRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
