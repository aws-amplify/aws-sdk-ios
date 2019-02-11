//
// Copyright 2010-2019 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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
#import "AWSFirehoseModel.h"
#import "AWSFirehoseResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSFirehose
FOUNDATION_EXPORT NSString *const AWSFirehoseSDKVersion;

/**
 <fullname>Amazon Kinesis Data Firehose API Reference</fullname><p>Amazon Kinesis Data Firehose is a fully managed service that delivers real-time streaming data to destinations such as Amazon Simple Storage Service (Amazon S3), Amazon Elasticsearch Service (Amazon ES), Amazon Redshift, and Splunk.</p>
 */
@interface AWSFirehose : AWSService

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

     let Firehose = AWSFirehose.default()

 *Objective-C*

     AWSFirehose *Firehose = [AWSFirehose defaultFirehose];

 @return The default service client.
 */
+ (instancetype)defaultFirehose;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSFirehose.register(with: configuration!, forKey: "USWest2Firehose")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSFirehose registerFirehoseWithConfiguration:configuration forKey:@"USWest2Firehose"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Firehose = AWSFirehose(forKey: "USWest2Firehose")

 *Objective-C*

     AWSFirehose *Firehose = [AWSFirehose FirehoseForKey:@"USWest2Firehose"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerFirehoseWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerFirehoseWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSFirehose.register(with: configuration!, forKey: "USWest2Firehose")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSFirehose registerFirehoseWithConfiguration:configuration forKey:@"USWest2Firehose"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Firehose = AWSFirehose(forKey: "USWest2Firehose")

 *Objective-C*

     AWSFirehose *Firehose = [AWSFirehose FirehoseForKey:@"USWest2Firehose"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)FirehoseForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removeFirehoseForKey:(NSString *)key;

/**
 <p>Creates a Kinesis Data Firehose delivery stream.</p><p>By default, you can create up to 50 delivery streams per AWS Region.</p><p>This is an asynchronous operation that immediately returns. The initial status of the delivery stream is <code>CREATING</code>. After the delivery stream is created, its status is <code>ACTIVE</code> and it now accepts data. Attempts to send data to a delivery stream that is not in the <code>ACTIVE</code> state cause an exception. To check the state of a delivery stream, use <a>DescribeDeliveryStream</a>.</p><p>A Kinesis Data Firehose delivery stream can be configured to receive records directly from providers using <a>PutRecord</a> or <a>PutRecordBatch</a>, or it can be configured to use an existing Kinesis stream as its source. To specify a Kinesis data stream as input, set the <code>DeliveryStreamType</code> parameter to <code>KinesisStreamAsSource</code>, and provide the Kinesis stream Amazon Resource Name (ARN) and role ARN in the <code>KinesisStreamSourceConfiguration</code> parameter.</p><p>A delivery stream is configured with a single destination: Amazon S3, Amazon ES, Amazon Redshift, or Splunk. You must specify only one of the following destination configuration parameters: <code>ExtendedS3DestinationConfiguration</code>, <code>S3DestinationConfiguration</code>, <code>ElasticsearchDestinationConfiguration</code>, <code>RedshiftDestinationConfiguration</code>, or <code>SplunkDestinationConfiguration</code>.</p><p>When you specify <code>S3DestinationConfiguration</code>, you can also provide the following optional values: BufferingHints, <code>EncryptionConfiguration</code>, and <code>CompressionFormat</code>. By default, if no <code>BufferingHints</code> value is provided, Kinesis Data Firehose buffers data up to 5 MB or for 5 minutes, whichever condition is satisfied first. <code>BufferingHints</code> is a hint, so there are some cases where the service cannot adhere to these conditions strictly. For example, record boundaries might be such that the size is a little over or under the configured buffering size. By default, no encryption is performed. We strongly recommend that you enable encryption to ensure secure data storage in Amazon S3.</p><p>A few notes about Amazon Redshift as a destination:</p><ul><li><p>An Amazon Redshift destination requires an S3 bucket as intermediate location. Kinesis Data Firehose first delivers data to Amazon S3 and then uses <code>COPY</code> syntax to load data into an Amazon Redshift table. This is specified in the <code>RedshiftDestinationConfiguration.S3Configuration</code> parameter.</p></li><li><p>The compression formats <code>SNAPPY</code> or <code>ZIP</code> cannot be specified in <code>RedshiftDestinationConfiguration.S3Configuration</code> because the Amazon Redshift <code>COPY</code> operation that reads from the S3 bucket doesn't support these compression formats.</p></li><li><p>We strongly recommend that you use the user name and password you provide exclusively with Kinesis Data Firehose, and that the permissions for the account are restricted for Amazon Redshift <code>INSERT</code> permissions.</p></li></ul><p>Kinesis Data Firehose assumes the IAM role that is configured as part of the destination. The role should allow the Kinesis Data Firehose principal to assume the role, and the role should have permissions that allow the service to deliver the data. For more information, see <a href="http://docs.aws.amazon.com/firehose/latest/dev/controlling-access.html#using-iam-s3">Grant Kinesis Data Firehose Access to an Amazon S3 Destination</a> in the <i>Amazon Kinesis Data Firehose Developer Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateDeliveryStream service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSFirehoseCreateDeliveryStreamOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSFirehoseErrorDomain` domain and the following error code: `AWSFirehoseErrorInvalidArgument`, `AWSFirehoseErrorLimitExceeded`, `AWSFirehoseErrorResourceInUse`.
 
 @see AWSFirehoseCreateDeliveryStreamInput
 @see AWSFirehoseCreateDeliveryStreamOutput
 */
- (AWSTask<AWSFirehoseCreateDeliveryStreamOutput *> *)createDeliveryStream:(AWSFirehoseCreateDeliveryStreamInput *)request;

/**
 <p>Creates a Kinesis Data Firehose delivery stream.</p><p>By default, you can create up to 50 delivery streams per AWS Region.</p><p>This is an asynchronous operation that immediately returns. The initial status of the delivery stream is <code>CREATING</code>. After the delivery stream is created, its status is <code>ACTIVE</code> and it now accepts data. Attempts to send data to a delivery stream that is not in the <code>ACTIVE</code> state cause an exception. To check the state of a delivery stream, use <a>DescribeDeliveryStream</a>.</p><p>A Kinesis Data Firehose delivery stream can be configured to receive records directly from providers using <a>PutRecord</a> or <a>PutRecordBatch</a>, or it can be configured to use an existing Kinesis stream as its source. To specify a Kinesis data stream as input, set the <code>DeliveryStreamType</code> parameter to <code>KinesisStreamAsSource</code>, and provide the Kinesis stream Amazon Resource Name (ARN) and role ARN in the <code>KinesisStreamSourceConfiguration</code> parameter.</p><p>A delivery stream is configured with a single destination: Amazon S3, Amazon ES, Amazon Redshift, or Splunk. You must specify only one of the following destination configuration parameters: <code>ExtendedS3DestinationConfiguration</code>, <code>S3DestinationConfiguration</code>, <code>ElasticsearchDestinationConfiguration</code>, <code>RedshiftDestinationConfiguration</code>, or <code>SplunkDestinationConfiguration</code>.</p><p>When you specify <code>S3DestinationConfiguration</code>, you can also provide the following optional values: BufferingHints, <code>EncryptionConfiguration</code>, and <code>CompressionFormat</code>. By default, if no <code>BufferingHints</code> value is provided, Kinesis Data Firehose buffers data up to 5 MB or for 5 minutes, whichever condition is satisfied first. <code>BufferingHints</code> is a hint, so there are some cases where the service cannot adhere to these conditions strictly. For example, record boundaries might be such that the size is a little over or under the configured buffering size. By default, no encryption is performed. We strongly recommend that you enable encryption to ensure secure data storage in Amazon S3.</p><p>A few notes about Amazon Redshift as a destination:</p><ul><li><p>An Amazon Redshift destination requires an S3 bucket as intermediate location. Kinesis Data Firehose first delivers data to Amazon S3 and then uses <code>COPY</code> syntax to load data into an Amazon Redshift table. This is specified in the <code>RedshiftDestinationConfiguration.S3Configuration</code> parameter.</p></li><li><p>The compression formats <code>SNAPPY</code> or <code>ZIP</code> cannot be specified in <code>RedshiftDestinationConfiguration.S3Configuration</code> because the Amazon Redshift <code>COPY</code> operation that reads from the S3 bucket doesn't support these compression formats.</p></li><li><p>We strongly recommend that you use the user name and password you provide exclusively with Kinesis Data Firehose, and that the permissions for the account are restricted for Amazon Redshift <code>INSERT</code> permissions.</p></li></ul><p>Kinesis Data Firehose assumes the IAM role that is configured as part of the destination. The role should allow the Kinesis Data Firehose principal to assume the role, and the role should have permissions that allow the service to deliver the data. For more information, see <a href="http://docs.aws.amazon.com/firehose/latest/dev/controlling-access.html#using-iam-s3">Grant Kinesis Data Firehose Access to an Amazon S3 Destination</a> in the <i>Amazon Kinesis Data Firehose Developer Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateDeliveryStream service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSFirehoseErrorDomain` domain and the following error code: `AWSFirehoseErrorInvalidArgument`, `AWSFirehoseErrorLimitExceeded`, `AWSFirehoseErrorResourceInUse`.
 
 @see AWSFirehoseCreateDeliveryStreamInput
 @see AWSFirehoseCreateDeliveryStreamOutput
 */
- (void)createDeliveryStream:(AWSFirehoseCreateDeliveryStreamInput *)request completionHandler:(void (^ _Nullable)(AWSFirehoseCreateDeliveryStreamOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a delivery stream and its data.</p><p>You can delete a delivery stream only if it is in <code>ACTIVE</code> or <code>DELETING</code> state, and not in the <code>CREATING</code> state. While the deletion request is in process, the delivery stream is in the <code>DELETING</code> state.</p><p>To check the state of a delivery stream, use <a>DescribeDeliveryStream</a>.</p><p>While the delivery stream is <code>DELETING</code> state, the service might continue to accept the records, but it doesn't make any guarantees with respect to delivering the data. Therefore, as a best practice, you should first stop any applications that are sending records before deleting a delivery stream.</p>
 
 @param request A container for the necessary parameters to execute the DeleteDeliveryStream service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSFirehoseDeleteDeliveryStreamOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSFirehoseErrorDomain` domain and the following error code: `AWSFirehoseErrorResourceInUse`, `AWSFirehoseErrorResourceNotFound`.
 
 @see AWSFirehoseDeleteDeliveryStreamInput
 @see AWSFirehoseDeleteDeliveryStreamOutput
 */
- (AWSTask<AWSFirehoseDeleteDeliveryStreamOutput *> *)deleteDeliveryStream:(AWSFirehoseDeleteDeliveryStreamInput *)request;

/**
 <p>Deletes a delivery stream and its data.</p><p>You can delete a delivery stream only if it is in <code>ACTIVE</code> or <code>DELETING</code> state, and not in the <code>CREATING</code> state. While the deletion request is in process, the delivery stream is in the <code>DELETING</code> state.</p><p>To check the state of a delivery stream, use <a>DescribeDeliveryStream</a>.</p><p>While the delivery stream is <code>DELETING</code> state, the service might continue to accept the records, but it doesn't make any guarantees with respect to delivering the data. Therefore, as a best practice, you should first stop any applications that are sending records before deleting a delivery stream.</p>
 
 @param request A container for the necessary parameters to execute the DeleteDeliveryStream service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSFirehoseErrorDomain` domain and the following error code: `AWSFirehoseErrorResourceInUse`, `AWSFirehoseErrorResourceNotFound`.
 
 @see AWSFirehoseDeleteDeliveryStreamInput
 @see AWSFirehoseDeleteDeliveryStreamOutput
 */
- (void)deleteDeliveryStream:(AWSFirehoseDeleteDeliveryStreamInput *)request completionHandler:(void (^ _Nullable)(AWSFirehoseDeleteDeliveryStreamOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the specified delivery stream and gets the status. For example, after your delivery stream is created, call <code>DescribeDeliveryStream</code> to see whether the delivery stream is <code>ACTIVE</code> and therefore ready for data to be sent to it.</p>
 
 @param request A container for the necessary parameters to execute the DescribeDeliveryStream service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSFirehoseDescribeDeliveryStreamOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSFirehoseErrorDomain` domain and the following error code: `AWSFirehoseErrorResourceNotFound`.
 
 @see AWSFirehoseDescribeDeliveryStreamInput
 @see AWSFirehoseDescribeDeliveryStreamOutput
 */
- (AWSTask<AWSFirehoseDescribeDeliveryStreamOutput *> *)describeDeliveryStream:(AWSFirehoseDescribeDeliveryStreamInput *)request;

/**
 <p>Describes the specified delivery stream and gets the status. For example, after your delivery stream is created, call <code>DescribeDeliveryStream</code> to see whether the delivery stream is <code>ACTIVE</code> and therefore ready for data to be sent to it.</p>
 
 @param request A container for the necessary parameters to execute the DescribeDeliveryStream service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSFirehoseErrorDomain` domain and the following error code: `AWSFirehoseErrorResourceNotFound`.
 
 @see AWSFirehoseDescribeDeliveryStreamInput
 @see AWSFirehoseDescribeDeliveryStreamOutput
 */
- (void)describeDeliveryStream:(AWSFirehoseDescribeDeliveryStreamInput *)request completionHandler:(void (^ _Nullable)(AWSFirehoseDescribeDeliveryStreamOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists your delivery streams in alphabetical order of their names.</p><p>The number of delivery streams might be too large to return using a single call to <code>ListDeliveryStreams</code>. You can limit the number of delivery streams returned, using the <code>Limit</code> parameter. To determine whether there are more delivery streams to list, check the value of <code>HasMoreDeliveryStreams</code> in the output. If there are more delivery streams to list, you can request them by calling this operation again and setting the <code>ExclusiveStartDeliveryStreamName</code> parameter to the name of the last delivery stream returned in the last call.</p>
 
 @param request A container for the necessary parameters to execute the ListDeliveryStreams service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSFirehoseListDeliveryStreamsOutput`.
 
 @see AWSFirehoseListDeliveryStreamsInput
 @see AWSFirehoseListDeliveryStreamsOutput
 */
- (AWSTask<AWSFirehoseListDeliveryStreamsOutput *> *)listDeliveryStreams:(AWSFirehoseListDeliveryStreamsInput *)request;

/**
 <p>Lists your delivery streams in alphabetical order of their names.</p><p>The number of delivery streams might be too large to return using a single call to <code>ListDeliveryStreams</code>. You can limit the number of delivery streams returned, using the <code>Limit</code> parameter. To determine whether there are more delivery streams to list, check the value of <code>HasMoreDeliveryStreams</code> in the output. If there are more delivery streams to list, you can request them by calling this operation again and setting the <code>ExclusiveStartDeliveryStreamName</code> parameter to the name of the last delivery stream returned in the last call.</p>
 
 @param request A container for the necessary parameters to execute the ListDeliveryStreams service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSFirehoseListDeliveryStreamsInput
 @see AWSFirehoseListDeliveryStreamsOutput
 */
- (void)listDeliveryStreams:(AWSFirehoseListDeliveryStreamsInput *)request completionHandler:(void (^ _Nullable)(AWSFirehoseListDeliveryStreamsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the tags for the specified delivery stream. This operation has a limit of five transactions per second per account. </p>
 
 @param request A container for the necessary parameters to execute the ListTagsForDeliveryStream service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSFirehoseListTagsForDeliveryStreamOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSFirehoseErrorDomain` domain and the following error code: `AWSFirehoseErrorResourceNotFound`, `AWSFirehoseErrorInvalidArgument`, `AWSFirehoseErrorLimitExceeded`.
 
 @see AWSFirehoseListTagsForDeliveryStreamInput
 @see AWSFirehoseListTagsForDeliveryStreamOutput
 */
- (AWSTask<AWSFirehoseListTagsForDeliveryStreamOutput *> *)listTagsForDeliveryStream:(AWSFirehoseListTagsForDeliveryStreamInput *)request;

/**
 <p>Lists the tags for the specified delivery stream. This operation has a limit of five transactions per second per account. </p>
 
 @param request A container for the necessary parameters to execute the ListTagsForDeliveryStream service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSFirehoseErrorDomain` domain and the following error code: `AWSFirehoseErrorResourceNotFound`, `AWSFirehoseErrorInvalidArgument`, `AWSFirehoseErrorLimitExceeded`.
 
 @see AWSFirehoseListTagsForDeliveryStreamInput
 @see AWSFirehoseListTagsForDeliveryStreamOutput
 */
- (void)listTagsForDeliveryStream:(AWSFirehoseListTagsForDeliveryStreamInput *)request completionHandler:(void (^ _Nullable)(AWSFirehoseListTagsForDeliveryStreamOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Writes a single data record into an Amazon Kinesis Data Firehose delivery stream. To write multiple data records into a delivery stream, use <a>PutRecordBatch</a>. Applications using these operations are referred to as producers.</p><p>By default, each delivery stream can take in up to 2,000 transactions per second, 5,000 records per second, or 5 MB per second. If you use <a>PutRecord</a> and <a>PutRecordBatch</a>, the limits are an aggregate across these two operations for each delivery stream. For more information about limits and how to request an increase, see <a href="http://docs.aws.amazon.com/firehose/latest/dev/limits.html">Amazon Kinesis Data Firehose Limits</a>. </p><p>You must specify the name of the delivery stream and the data record when using <a>PutRecord</a>. The data record consists of a data blob that can be up to 1,000 KB in size, and any kind of data. For example, it can be a segment from a log file, geographic location data, website clickstream data, and so on.</p><p>Kinesis Data Firehose buffers records before delivering them to the destination. To disambiguate the data blobs at the destination, a common solution is to use delimiters in the data, such as a newline (<code>\n</code>) or some other character unique within the data. This allows the consumer application to parse individual data items when reading the data from the destination.</p><p>The <code>PutRecord</code> operation returns a <code>RecordId</code>, which is a unique string assigned to each record. Producer applications can use this ID for purposes such as auditability and investigation.</p><p>If the <code>PutRecord</code> operation throws a <code>ServiceUnavailableException</code>, back off and retry. If the exception persists, it is possible that the throughput limits have been exceeded for the delivery stream. </p><p>Data records sent to Kinesis Data Firehose are stored for 24 hours from the time they are added to a delivery stream as it tries to send the records to the destination. If the destination is unreachable for more than 24 hours, the data is no longer available.</p><important><p>Don't concatenate two or more base64 strings to form the data fields of your records. Instead, concatenate the raw data, then perform base64 encoding.</p></important>
 
 @param request A container for the necessary parameters to execute the PutRecord service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSFirehosePutRecordOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSFirehoseErrorDomain` domain and the following error code: `AWSFirehoseErrorResourceNotFound`, `AWSFirehoseErrorInvalidArgument`, `AWSFirehoseErrorServiceUnavailable`.
 
 @see AWSFirehosePutRecordInput
 @see AWSFirehosePutRecordOutput
 */
- (AWSTask<AWSFirehosePutRecordOutput *> *)putRecord:(AWSFirehosePutRecordInput *)request;

/**
 <p>Writes a single data record into an Amazon Kinesis Data Firehose delivery stream. To write multiple data records into a delivery stream, use <a>PutRecordBatch</a>. Applications using these operations are referred to as producers.</p><p>By default, each delivery stream can take in up to 2,000 transactions per second, 5,000 records per second, or 5 MB per second. If you use <a>PutRecord</a> and <a>PutRecordBatch</a>, the limits are an aggregate across these two operations for each delivery stream. For more information about limits and how to request an increase, see <a href="http://docs.aws.amazon.com/firehose/latest/dev/limits.html">Amazon Kinesis Data Firehose Limits</a>. </p><p>You must specify the name of the delivery stream and the data record when using <a>PutRecord</a>. The data record consists of a data blob that can be up to 1,000 KB in size, and any kind of data. For example, it can be a segment from a log file, geographic location data, website clickstream data, and so on.</p><p>Kinesis Data Firehose buffers records before delivering them to the destination. To disambiguate the data blobs at the destination, a common solution is to use delimiters in the data, such as a newline (<code>\n</code>) or some other character unique within the data. This allows the consumer application to parse individual data items when reading the data from the destination.</p><p>The <code>PutRecord</code> operation returns a <code>RecordId</code>, which is a unique string assigned to each record. Producer applications can use this ID for purposes such as auditability and investigation.</p><p>If the <code>PutRecord</code> operation throws a <code>ServiceUnavailableException</code>, back off and retry. If the exception persists, it is possible that the throughput limits have been exceeded for the delivery stream. </p><p>Data records sent to Kinesis Data Firehose are stored for 24 hours from the time they are added to a delivery stream as it tries to send the records to the destination. If the destination is unreachable for more than 24 hours, the data is no longer available.</p><important><p>Don't concatenate two or more base64 strings to form the data fields of your records. Instead, concatenate the raw data, then perform base64 encoding.</p></important>
 
 @param request A container for the necessary parameters to execute the PutRecord service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSFirehoseErrorDomain` domain and the following error code: `AWSFirehoseErrorResourceNotFound`, `AWSFirehoseErrorInvalidArgument`, `AWSFirehoseErrorServiceUnavailable`.
 
 @see AWSFirehosePutRecordInput
 @see AWSFirehosePutRecordOutput
 */
- (void)putRecord:(AWSFirehosePutRecordInput *)request completionHandler:(void (^ _Nullable)(AWSFirehosePutRecordOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Writes multiple data records into a delivery stream in a single call, which can achieve higher throughput per producer than when writing single records. To write single data records into a delivery stream, use <a>PutRecord</a>. Applications using these operations are referred to as producers.</p><p>By default, each delivery stream can take in up to 2,000 transactions per second, 5,000 records per second, or 5 MB per second. If you use <a>PutRecord</a> and <a>PutRecordBatch</a>, the limits are an aggregate across these two operations for each delivery stream. For more information about limits, see <a href="http://docs.aws.amazon.com/firehose/latest/dev/limits.html">Amazon Kinesis Data Firehose Limits</a>.</p><p>Each <a>PutRecordBatch</a> request supports up to 500 records. Each record in the request can be as large as 1,000 KB (before 64-bit encoding), up to a limit of 4 MB for the entire request. These limits cannot be changed.</p><p>You must specify the name of the delivery stream and the data record when using <a>PutRecord</a>. The data record consists of a data blob that can be up to 1,000 KB in size, and any kind of data. For example, it could be a segment from a log file, geographic location data, website clickstream data, and so on.</p><p>Kinesis Data Firehose buffers records before delivering them to the destination. To disambiguate the data blobs at the destination, a common solution is to use delimiters in the data, such as a newline (<code>\n</code>) or some other character unique within the data. This allows the consumer application to parse individual data items when reading the data from the destination.</p><p>The <a>PutRecordBatch</a> response includes a count of failed records, <code>FailedPutCount</code>, and an array of responses, <code>RequestResponses</code>. Even if the <a>PutRecordBatch</a> call succeeds, the value of <code>FailedPutCount</code> may be greater than 0, indicating that there are records for which the operation didn't succeed. Each entry in the <code>RequestResponses</code> array provides additional information about the processed record. It directly correlates with a record in the request array using the same ordering, from the top to the bottom. The response array always includes the same number of records as the request array. <code>RequestResponses</code> includes both successfully and unsuccessfully processed records. Kinesis Data Firehose tries to process all records in each <a>PutRecordBatch</a> request. A single record failure does not stop the processing of subsequent records. </p><p>A successfully processed record includes a <code>RecordId</code> value, which is unique for the record. An unsuccessfully processed record includes <code>ErrorCode</code> and <code>ErrorMessage</code> values. <code>ErrorCode</code> reflects the type of error, and is one of the following values: <code>ServiceUnavailableException</code> or <code>InternalFailure</code>. <code>ErrorMessage</code> provides more detailed information about the error.</p><p>If there is an internal server error or a timeout, the write might have completed or it might have failed. If <code>FailedPutCount</code> is greater than 0, retry the request, resending only those records that might have failed processing. This minimizes the possible duplicate records and also reduces the total bytes sent (and corresponding charges). We recommend that you handle any duplicates at the destination.</p><p>If <a>PutRecordBatch</a> throws <code>ServiceUnavailableException</code>, back off and retry. If the exception persists, it is possible that the throughput limits have been exceeded for the delivery stream.</p><p>Data records sent to Kinesis Data Firehose are stored for 24 hours from the time they are added to a delivery stream as it attempts to send the records to the destination. If the destination is unreachable for more than 24 hours, the data is no longer available.</p><important><p>Don't concatenate two or more base64 strings to form the data fields of your records. Instead, concatenate the raw data, then perform base64 encoding.</p></important>
 
 @param request A container for the necessary parameters to execute the PutRecordBatch service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSFirehosePutRecordBatchOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSFirehoseErrorDomain` domain and the following error code: `AWSFirehoseErrorResourceNotFound`, `AWSFirehoseErrorInvalidArgument`, `AWSFirehoseErrorServiceUnavailable`.
 
 @see AWSFirehosePutRecordBatchInput
 @see AWSFirehosePutRecordBatchOutput
 */
- (AWSTask<AWSFirehosePutRecordBatchOutput *> *)putRecordBatch:(AWSFirehosePutRecordBatchInput *)request;

/**
 <p>Writes multiple data records into a delivery stream in a single call, which can achieve higher throughput per producer than when writing single records. To write single data records into a delivery stream, use <a>PutRecord</a>. Applications using these operations are referred to as producers.</p><p>By default, each delivery stream can take in up to 2,000 transactions per second, 5,000 records per second, or 5 MB per second. If you use <a>PutRecord</a> and <a>PutRecordBatch</a>, the limits are an aggregate across these two operations for each delivery stream. For more information about limits, see <a href="http://docs.aws.amazon.com/firehose/latest/dev/limits.html">Amazon Kinesis Data Firehose Limits</a>.</p><p>Each <a>PutRecordBatch</a> request supports up to 500 records. Each record in the request can be as large as 1,000 KB (before 64-bit encoding), up to a limit of 4 MB for the entire request. These limits cannot be changed.</p><p>You must specify the name of the delivery stream and the data record when using <a>PutRecord</a>. The data record consists of a data blob that can be up to 1,000 KB in size, and any kind of data. For example, it could be a segment from a log file, geographic location data, website clickstream data, and so on.</p><p>Kinesis Data Firehose buffers records before delivering them to the destination. To disambiguate the data blobs at the destination, a common solution is to use delimiters in the data, such as a newline (<code>\n</code>) or some other character unique within the data. This allows the consumer application to parse individual data items when reading the data from the destination.</p><p>The <a>PutRecordBatch</a> response includes a count of failed records, <code>FailedPutCount</code>, and an array of responses, <code>RequestResponses</code>. Even if the <a>PutRecordBatch</a> call succeeds, the value of <code>FailedPutCount</code> may be greater than 0, indicating that there are records for which the operation didn't succeed. Each entry in the <code>RequestResponses</code> array provides additional information about the processed record. It directly correlates with a record in the request array using the same ordering, from the top to the bottom. The response array always includes the same number of records as the request array. <code>RequestResponses</code> includes both successfully and unsuccessfully processed records. Kinesis Data Firehose tries to process all records in each <a>PutRecordBatch</a> request. A single record failure does not stop the processing of subsequent records. </p><p>A successfully processed record includes a <code>RecordId</code> value, which is unique for the record. An unsuccessfully processed record includes <code>ErrorCode</code> and <code>ErrorMessage</code> values. <code>ErrorCode</code> reflects the type of error, and is one of the following values: <code>ServiceUnavailableException</code> or <code>InternalFailure</code>. <code>ErrorMessage</code> provides more detailed information about the error.</p><p>If there is an internal server error or a timeout, the write might have completed or it might have failed. If <code>FailedPutCount</code> is greater than 0, retry the request, resending only those records that might have failed processing. This minimizes the possible duplicate records and also reduces the total bytes sent (and corresponding charges). We recommend that you handle any duplicates at the destination.</p><p>If <a>PutRecordBatch</a> throws <code>ServiceUnavailableException</code>, back off and retry. If the exception persists, it is possible that the throughput limits have been exceeded for the delivery stream.</p><p>Data records sent to Kinesis Data Firehose are stored for 24 hours from the time they are added to a delivery stream as it attempts to send the records to the destination. If the destination is unreachable for more than 24 hours, the data is no longer available.</p><important><p>Don't concatenate two or more base64 strings to form the data fields of your records. Instead, concatenate the raw data, then perform base64 encoding.</p></important>
 
 @param request A container for the necessary parameters to execute the PutRecordBatch service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSFirehoseErrorDomain` domain and the following error code: `AWSFirehoseErrorResourceNotFound`, `AWSFirehoseErrorInvalidArgument`, `AWSFirehoseErrorServiceUnavailable`.
 
 @see AWSFirehosePutRecordBatchInput
 @see AWSFirehosePutRecordBatchOutput
 */
- (void)putRecordBatch:(AWSFirehosePutRecordBatchInput *)request completionHandler:(void (^ _Nullable)(AWSFirehosePutRecordBatchOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Enables server-side encryption (SSE) for the delivery stream. </p><p>This operation is asynchronous. It returns immediately. When you invoke it, Kinesis Data Firehose first sets the status of the stream to <code>ENABLING</code>, and then to <code>ENABLED</code>. You can continue to read and write data to your stream while its status is <code>ENABLING</code>, but the data is not encrypted. It can take up to 5 seconds after the encryption status changes to <code>ENABLED</code> before all records written to the delivery stream are encrypted. To find out whether a record or a batch of records was encrypted, check the response elements <a>PutRecordOutput$Encrypted</a> and <a>PutRecordBatchOutput$Encrypted</a>, respectively.</p><p>To check the encryption state of a delivery stream, use <a>DescribeDeliveryStream</a>.</p><p>You can only enable SSE for a delivery stream that uses <code>DirectPut</code> as its source. </p><p>The <code>StartDeliveryStreamEncryption</code> and <code>StopDeliveryStreamEncryption</code> operations have a combined limit of 25 calls per delivery stream per 24 hours. For example, you reach the limit if you call <code>StartDeliveryStreamEncryption</code> 13 times and <code>StopDeliveryStreamEncryption</code> 12 times for the same delivery stream in a 24-hour period.</p>
 
 @param request A container for the necessary parameters to execute the StartDeliveryStreamEncryption service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSFirehoseStartDeliveryStreamEncryptionOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSFirehoseErrorDomain` domain and the following error code: `AWSFirehoseErrorResourceNotFound`, `AWSFirehoseErrorResourceInUse`, `AWSFirehoseErrorInvalidArgument`, `AWSFirehoseErrorLimitExceeded`.
 
 @see AWSFirehoseStartDeliveryStreamEncryptionInput
 @see AWSFirehoseStartDeliveryStreamEncryptionOutput
 */
- (AWSTask<AWSFirehoseStartDeliveryStreamEncryptionOutput *> *)startDeliveryStreamEncryption:(AWSFirehoseStartDeliveryStreamEncryptionInput *)request;

/**
 <p>Enables server-side encryption (SSE) for the delivery stream. </p><p>This operation is asynchronous. It returns immediately. When you invoke it, Kinesis Data Firehose first sets the status of the stream to <code>ENABLING</code>, and then to <code>ENABLED</code>. You can continue to read and write data to your stream while its status is <code>ENABLING</code>, but the data is not encrypted. It can take up to 5 seconds after the encryption status changes to <code>ENABLED</code> before all records written to the delivery stream are encrypted. To find out whether a record or a batch of records was encrypted, check the response elements <a>PutRecordOutput$Encrypted</a> and <a>PutRecordBatchOutput$Encrypted</a>, respectively.</p><p>To check the encryption state of a delivery stream, use <a>DescribeDeliveryStream</a>.</p><p>You can only enable SSE for a delivery stream that uses <code>DirectPut</code> as its source. </p><p>The <code>StartDeliveryStreamEncryption</code> and <code>StopDeliveryStreamEncryption</code> operations have a combined limit of 25 calls per delivery stream per 24 hours. For example, you reach the limit if you call <code>StartDeliveryStreamEncryption</code> 13 times and <code>StopDeliveryStreamEncryption</code> 12 times for the same delivery stream in a 24-hour period.</p>
 
 @param request A container for the necessary parameters to execute the StartDeliveryStreamEncryption service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSFirehoseErrorDomain` domain and the following error code: `AWSFirehoseErrorResourceNotFound`, `AWSFirehoseErrorResourceInUse`, `AWSFirehoseErrorInvalidArgument`, `AWSFirehoseErrorLimitExceeded`.
 
 @see AWSFirehoseStartDeliveryStreamEncryptionInput
 @see AWSFirehoseStartDeliveryStreamEncryptionOutput
 */
- (void)startDeliveryStreamEncryption:(AWSFirehoseStartDeliveryStreamEncryptionInput *)request completionHandler:(void (^ _Nullable)(AWSFirehoseStartDeliveryStreamEncryptionOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Disables server-side encryption (SSE) for the delivery stream. </p><p>This operation is asynchronous. It returns immediately. When you invoke it, Kinesis Data Firehose first sets the status of the stream to <code>DISABLING</code>, and then to <code>DISABLED</code>. You can continue to read and write data to your stream while its status is <code>DISABLING</code>. It can take up to 5 seconds after the encryption status changes to <code>DISABLED</code> before all records written to the delivery stream are no longer subject to encryption. To find out whether a record or a batch of records was encrypted, check the response elements <a>PutRecordOutput$Encrypted</a> and <a>PutRecordBatchOutput$Encrypted</a>, respectively.</p><p>To check the encryption state of a delivery stream, use <a>DescribeDeliveryStream</a>. </p><p>The <code>StartDeliveryStreamEncryption</code> and <code>StopDeliveryStreamEncryption</code> operations have a combined limit of 25 calls per delivery stream per 24 hours. For example, you reach the limit if you call <code>StartDeliveryStreamEncryption</code> 13 times and <code>StopDeliveryStreamEncryption</code> 12 times for the same delivery stream in a 24-hour period.</p>
 
 @param request A container for the necessary parameters to execute the StopDeliveryStreamEncryption service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSFirehoseStopDeliveryStreamEncryptionOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSFirehoseErrorDomain` domain and the following error code: `AWSFirehoseErrorResourceNotFound`, `AWSFirehoseErrorResourceInUse`, `AWSFirehoseErrorInvalidArgument`, `AWSFirehoseErrorLimitExceeded`.
 
 @see AWSFirehoseStopDeliveryStreamEncryptionInput
 @see AWSFirehoseStopDeliveryStreamEncryptionOutput
 */
- (AWSTask<AWSFirehoseStopDeliveryStreamEncryptionOutput *> *)stopDeliveryStreamEncryption:(AWSFirehoseStopDeliveryStreamEncryptionInput *)request;

/**
 <p>Disables server-side encryption (SSE) for the delivery stream. </p><p>This operation is asynchronous. It returns immediately. When you invoke it, Kinesis Data Firehose first sets the status of the stream to <code>DISABLING</code>, and then to <code>DISABLED</code>. You can continue to read and write data to your stream while its status is <code>DISABLING</code>. It can take up to 5 seconds after the encryption status changes to <code>DISABLED</code> before all records written to the delivery stream are no longer subject to encryption. To find out whether a record or a batch of records was encrypted, check the response elements <a>PutRecordOutput$Encrypted</a> and <a>PutRecordBatchOutput$Encrypted</a>, respectively.</p><p>To check the encryption state of a delivery stream, use <a>DescribeDeliveryStream</a>. </p><p>The <code>StartDeliveryStreamEncryption</code> and <code>StopDeliveryStreamEncryption</code> operations have a combined limit of 25 calls per delivery stream per 24 hours. For example, you reach the limit if you call <code>StartDeliveryStreamEncryption</code> 13 times and <code>StopDeliveryStreamEncryption</code> 12 times for the same delivery stream in a 24-hour period.</p>
 
 @param request A container for the necessary parameters to execute the StopDeliveryStreamEncryption service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSFirehoseErrorDomain` domain and the following error code: `AWSFirehoseErrorResourceNotFound`, `AWSFirehoseErrorResourceInUse`, `AWSFirehoseErrorInvalidArgument`, `AWSFirehoseErrorLimitExceeded`.
 
 @see AWSFirehoseStopDeliveryStreamEncryptionInput
 @see AWSFirehoseStopDeliveryStreamEncryptionOutput
 */
- (void)stopDeliveryStreamEncryption:(AWSFirehoseStopDeliveryStreamEncryptionInput *)request completionHandler:(void (^ _Nullable)(AWSFirehoseStopDeliveryStreamEncryptionOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Adds or updates tags for the specified delivery stream. A tag is a key-value pair that you can define and assign to AWS resources. If you specify a tag that already exists, the tag value is replaced with the value that you specify in the request. Tags are metadata. For example, you can add friendly names and descriptions or other types of information that can help you distinguish the delivery stream. For more information about tags, see <a href="https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/cost-alloc-tags.html">Using Cost Allocation Tags</a> in the <i>AWS Billing and Cost Management User Guide</i>. </p><p>Each delivery stream can have up to 50 tags. </p><p>This operation has a limit of five transactions per second per account. </p>
 
 @param request A container for the necessary parameters to execute the TagDeliveryStream service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSFirehoseTagDeliveryStreamOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSFirehoseErrorDomain` domain and the following error code: `AWSFirehoseErrorResourceNotFound`, `AWSFirehoseErrorResourceInUse`, `AWSFirehoseErrorInvalidArgument`, `AWSFirehoseErrorLimitExceeded`.
 
 @see AWSFirehoseTagDeliveryStreamInput
 @see AWSFirehoseTagDeliveryStreamOutput
 */
- (AWSTask<AWSFirehoseTagDeliveryStreamOutput *> *)tagDeliveryStream:(AWSFirehoseTagDeliveryStreamInput *)request;

/**
 <p>Adds or updates tags for the specified delivery stream. A tag is a key-value pair that you can define and assign to AWS resources. If you specify a tag that already exists, the tag value is replaced with the value that you specify in the request. Tags are metadata. For example, you can add friendly names and descriptions or other types of information that can help you distinguish the delivery stream. For more information about tags, see <a href="https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/cost-alloc-tags.html">Using Cost Allocation Tags</a> in the <i>AWS Billing and Cost Management User Guide</i>. </p><p>Each delivery stream can have up to 50 tags. </p><p>This operation has a limit of five transactions per second per account. </p>
 
 @param request A container for the necessary parameters to execute the TagDeliveryStream service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSFirehoseErrorDomain` domain and the following error code: `AWSFirehoseErrorResourceNotFound`, `AWSFirehoseErrorResourceInUse`, `AWSFirehoseErrorInvalidArgument`, `AWSFirehoseErrorLimitExceeded`.
 
 @see AWSFirehoseTagDeliveryStreamInput
 @see AWSFirehoseTagDeliveryStreamOutput
 */
- (void)tagDeliveryStream:(AWSFirehoseTagDeliveryStreamInput *)request completionHandler:(void (^ _Nullable)(AWSFirehoseTagDeliveryStreamOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Removes tags from the specified delivery stream. Removed tags are deleted, and you can't recover them after this operation successfully completes.</p><p>If you specify a tag that doesn't exist, the operation ignores it.</p><p>This operation has a limit of five transactions per second per account. </p>
 
 @param request A container for the necessary parameters to execute the UntagDeliveryStream service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSFirehoseUntagDeliveryStreamOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSFirehoseErrorDomain` domain and the following error code: `AWSFirehoseErrorResourceNotFound`, `AWSFirehoseErrorResourceInUse`, `AWSFirehoseErrorInvalidArgument`, `AWSFirehoseErrorLimitExceeded`.
 
 @see AWSFirehoseUntagDeliveryStreamInput
 @see AWSFirehoseUntagDeliveryStreamOutput
 */
- (AWSTask<AWSFirehoseUntagDeliveryStreamOutput *> *)untagDeliveryStream:(AWSFirehoseUntagDeliveryStreamInput *)request;

/**
 <p>Removes tags from the specified delivery stream. Removed tags are deleted, and you can't recover them after this operation successfully completes.</p><p>If you specify a tag that doesn't exist, the operation ignores it.</p><p>This operation has a limit of five transactions per second per account. </p>
 
 @param request A container for the necessary parameters to execute the UntagDeliveryStream service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSFirehoseErrorDomain` domain and the following error code: `AWSFirehoseErrorResourceNotFound`, `AWSFirehoseErrorResourceInUse`, `AWSFirehoseErrorInvalidArgument`, `AWSFirehoseErrorLimitExceeded`.
 
 @see AWSFirehoseUntagDeliveryStreamInput
 @see AWSFirehoseUntagDeliveryStreamOutput
 */
- (void)untagDeliveryStream:(AWSFirehoseUntagDeliveryStreamInput *)request completionHandler:(void (^ _Nullable)(AWSFirehoseUntagDeliveryStreamOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the specified destination of the specified delivery stream.</p><p>Use this operation to change the destination type (for example, to replace the Amazon S3 destination with Amazon Redshift) or change the parameters associated with a destination (for example, to change the bucket name of the Amazon S3 destination). The update might not occur immediately. The target delivery stream remains active while the configurations are updated, so data writes to the delivery stream can continue during this process. The updated configurations are usually effective within a few minutes.</p><p>Switching between Amazon ES and other services is not supported. For an Amazon ES destination, you can only update to another Amazon ES destination.</p><p>If the destination type is the same, Kinesis Data Firehose merges the configuration parameters specified with the destination configuration that already exists on the delivery stream. If any of the parameters are not specified in the call, the existing values are retained. For example, in the Amazon S3 destination, if <a>EncryptionConfiguration</a> is not specified, then the existing <code>EncryptionConfiguration</code> is maintained on the destination.</p><p>If the destination type is not the same, for example, changing the destination from Amazon S3 to Amazon Redshift, Kinesis Data Firehose does not merge any parameters. In this case, all parameters must be specified.</p><p>Kinesis Data Firehose uses <code>CurrentDeliveryStreamVersionId</code> to avoid race conditions and conflicting merges. This is a required field, and the service updates the configuration only if the existing configuration has a version ID that matches. After the update is applied successfully, the version ID is updated, and can be retrieved using <a>DescribeDeliveryStream</a>. Use the new version ID to set <code>CurrentDeliveryStreamVersionId</code> in the next call.</p>
 
 @param request A container for the necessary parameters to execute the UpdateDestination service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSFirehoseUpdateDestinationOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSFirehoseErrorDomain` domain and the following error code: `AWSFirehoseErrorInvalidArgument`, `AWSFirehoseErrorResourceInUse`, `AWSFirehoseErrorResourceNotFound`, `AWSFirehoseErrorConcurrentModification`.
 
 @see AWSFirehoseUpdateDestinationInput
 @see AWSFirehoseUpdateDestinationOutput
 */
- (AWSTask<AWSFirehoseUpdateDestinationOutput *> *)updateDestination:(AWSFirehoseUpdateDestinationInput *)request;

/**
 <p>Updates the specified destination of the specified delivery stream.</p><p>Use this operation to change the destination type (for example, to replace the Amazon S3 destination with Amazon Redshift) or change the parameters associated with a destination (for example, to change the bucket name of the Amazon S3 destination). The update might not occur immediately. The target delivery stream remains active while the configurations are updated, so data writes to the delivery stream can continue during this process. The updated configurations are usually effective within a few minutes.</p><p>Switching between Amazon ES and other services is not supported. For an Amazon ES destination, you can only update to another Amazon ES destination.</p><p>If the destination type is the same, Kinesis Data Firehose merges the configuration parameters specified with the destination configuration that already exists on the delivery stream. If any of the parameters are not specified in the call, the existing values are retained. For example, in the Amazon S3 destination, if <a>EncryptionConfiguration</a> is not specified, then the existing <code>EncryptionConfiguration</code> is maintained on the destination.</p><p>If the destination type is not the same, for example, changing the destination from Amazon S3 to Amazon Redshift, Kinesis Data Firehose does not merge any parameters. In this case, all parameters must be specified.</p><p>Kinesis Data Firehose uses <code>CurrentDeliveryStreamVersionId</code> to avoid race conditions and conflicting merges. This is a required field, and the service updates the configuration only if the existing configuration has a version ID that matches. After the update is applied successfully, the version ID is updated, and can be retrieved using <a>DescribeDeliveryStream</a>. Use the new version ID to set <code>CurrentDeliveryStreamVersionId</code> in the next call.</p>
 
 @param request A container for the necessary parameters to execute the UpdateDestination service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSFirehoseErrorDomain` domain and the following error code: `AWSFirehoseErrorInvalidArgument`, `AWSFirehoseErrorResourceInUse`, `AWSFirehoseErrorResourceNotFound`, `AWSFirehoseErrorConcurrentModification`.
 
 @see AWSFirehoseUpdateDestinationInput
 @see AWSFirehoseUpdateDestinationOutput
 */
- (void)updateDestination:(AWSFirehoseUpdateDestinationInput *)request completionHandler:(void (^ _Nullable)(AWSFirehoseUpdateDestinationOutput * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
