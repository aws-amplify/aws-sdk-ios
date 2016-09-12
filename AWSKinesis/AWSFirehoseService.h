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
#import "AWSFirehoseModel.h"
#import "AWSFirehoseResources.h"

NS_ASSUME_NONNULL_BEGIN

/**
 <fullname>Amazon Kinesis Firehose API Reference</fullname><p>Amazon Kinesis Firehose is a fully-managed service that delivers real-time streaming data to destinations such as Amazon Simple Storage Service (Amazon S3), Amazon Elasticsearch Service (Amazon ES), and Amazon Redshift.</p>
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

     let Firehose = AWSFirehose.defaultFirehose()

 *Objective-C*

     AWSFirehose *Firehose = [AWSFirehose defaultFirehose];

 @return The default service client.
 */
+ (instancetype)defaultFirehose;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
         let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
         let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
         AWSFirehose.registerFirehoseWithConfiguration(configuration, forKey: "USWest2Firehose")

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

     func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
         let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
         let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
         AWSFirehose.registerFirehoseWithConfiguration(configuration, forKey: "USWest2Firehose")

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
 <p>Creates a delivery stream.</p><p><a>CreateDeliveryStream</a> is an asynchronous operation that immediately returns. The initial status of the delivery stream is <code>CREATING</code>. After the delivery stream is created, its status is <code>ACTIVE</code> and it now accepts data. Attempts to send data to a delivery stream that is not in the <code>ACTIVE</code> state cause an exception. To check the state of a delivery stream, use <a>DescribeDeliveryStream</a>.</p><p>The name of a delivery stream identifies it. You can't have two delivery streams with the same name in the same region. Two delivery streams in different AWS accounts or different regions in the same AWS account can have the same name.</p><p>By default, you can create up to 20 delivery streams per region.</p><p>A delivery stream can only be configured with a single destination, Amazon S3, Amazon Elasticsearch Service, or Amazon Redshift. For correct <a>CreateDeliveryStream</a> request syntax, specify only one destination configuration parameter: either <b>S3DestinationConfiguration</b>, <b>ElasticsearchDestinationConfiguration</b>, or <b>RedshiftDestinationConfiguration</b>. </p><p>As part of <b>S3DestinationConfiguration</b>, optional values <b>BufferingHints</b>, <b>EncryptionConfiguration</b>, and <b>CompressionFormat</b> can be provided. By default, if no <b>BufferingHints</b> value is provided, Firehose buffers data up to 5 MB or for 5 minutes, whichever condition is satisfied first. Note that <b>BufferingHints</b> is a hint, so there are some cases where the service cannot adhere to these conditions strictly; for example, record boundaries are such that the size is a little over or under the configured buffering size. By default, no encryption is performed. We strongly recommend that you enable encryption to ensure secure data storage in Amazon S3.</p><p>A few notes about <b>RedshiftDestinationConfiguration</b>:</p><ul><li><p>An Amazon Redshift destination requires an S3 bucket as intermediate location, as Firehose first delivers data to S3 and then uses <code>COPY</code> syntax to load data into an Amazon Redshift table. This is specified in the <b>RedshiftDestinationConfiguration.S3Configuration</b> parameter element.</p></li><li><p>The compression formats <code>SNAPPY</code> or <code>ZIP</code> cannot be specified in <b>RedshiftDestinationConfiguration.S3Configuration</b> because the Amazon Redshift <code>COPY</code> operation that reads from the S3 bucket doesn't support these compression formats.</p></li><li><p>We strongly recommend that the username and password provided is used exclusively for Firehose purposes, and that the permissions for the account are restricted for Amazon Redshift <code>INSERT</code> permissions.</p></li></ul><p>Firehose assumes the IAM role that is configured as part of destinations. The IAM role should allow the Firehose principal to assume the role, and the role should have permissions that allows the service to deliver the data. For more information, see <a href="http://docs.aws.amazon.com/firehose/latest/dev/controlling-access.html#using-iam-s3">Amazon S3 Bucket Access</a> in the <i>Amazon Kinesis Firehose Developer Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateDeliveryStream service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSFirehoseCreateDeliveryStreamOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSFirehoseErrorDomain` domain and the following error code: `AWSFirehoseErrorInvalidArgument`, `AWSFirehoseErrorLimitExceeded`, `AWSFirehoseErrorResourceInUse`.
 
 @see AWSFirehoseCreateDeliveryStreamInput
 @see AWSFirehoseCreateDeliveryStreamOutput
 */
- (AWSTask<AWSFirehoseCreateDeliveryStreamOutput *> *)createDeliveryStream:(AWSFirehoseCreateDeliveryStreamInput *)request;

/**
 <p>Creates a delivery stream.</p><p><a>CreateDeliveryStream</a> is an asynchronous operation that immediately returns. The initial status of the delivery stream is <code>CREATING</code>. After the delivery stream is created, its status is <code>ACTIVE</code> and it now accepts data. Attempts to send data to a delivery stream that is not in the <code>ACTIVE</code> state cause an exception. To check the state of a delivery stream, use <a>DescribeDeliveryStream</a>.</p><p>The name of a delivery stream identifies it. You can't have two delivery streams with the same name in the same region. Two delivery streams in different AWS accounts or different regions in the same AWS account can have the same name.</p><p>By default, you can create up to 20 delivery streams per region.</p><p>A delivery stream can only be configured with a single destination, Amazon S3, Amazon Elasticsearch Service, or Amazon Redshift. For correct <a>CreateDeliveryStream</a> request syntax, specify only one destination configuration parameter: either <b>S3DestinationConfiguration</b>, <b>ElasticsearchDestinationConfiguration</b>, or <b>RedshiftDestinationConfiguration</b>. </p><p>As part of <b>S3DestinationConfiguration</b>, optional values <b>BufferingHints</b>, <b>EncryptionConfiguration</b>, and <b>CompressionFormat</b> can be provided. By default, if no <b>BufferingHints</b> value is provided, Firehose buffers data up to 5 MB or for 5 minutes, whichever condition is satisfied first. Note that <b>BufferingHints</b> is a hint, so there are some cases where the service cannot adhere to these conditions strictly; for example, record boundaries are such that the size is a little over or under the configured buffering size. By default, no encryption is performed. We strongly recommend that you enable encryption to ensure secure data storage in Amazon S3.</p><p>A few notes about <b>RedshiftDestinationConfiguration</b>:</p><ul><li><p>An Amazon Redshift destination requires an S3 bucket as intermediate location, as Firehose first delivers data to S3 and then uses <code>COPY</code> syntax to load data into an Amazon Redshift table. This is specified in the <b>RedshiftDestinationConfiguration.S3Configuration</b> parameter element.</p></li><li><p>The compression formats <code>SNAPPY</code> or <code>ZIP</code> cannot be specified in <b>RedshiftDestinationConfiguration.S3Configuration</b> because the Amazon Redshift <code>COPY</code> operation that reads from the S3 bucket doesn't support these compression formats.</p></li><li><p>We strongly recommend that the username and password provided is used exclusively for Firehose purposes, and that the permissions for the account are restricted for Amazon Redshift <code>INSERT</code> permissions.</p></li></ul><p>Firehose assumes the IAM role that is configured as part of destinations. The IAM role should allow the Firehose principal to assume the role, and the role should have permissions that allows the service to deliver the data. For more information, see <a href="http://docs.aws.amazon.com/firehose/latest/dev/controlling-access.html#using-iam-s3">Amazon S3 Bucket Access</a> in the <i>Amazon Kinesis Firehose Developer Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateDeliveryStream service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSFirehoseErrorDomain` domain and the following error code: `AWSFirehoseErrorInvalidArgument`, `AWSFirehoseErrorLimitExceeded`, `AWSFirehoseErrorResourceInUse`.
 
 @see AWSFirehoseCreateDeliveryStreamInput
 @see AWSFirehoseCreateDeliveryStreamOutput
 */
- (void)createDeliveryStream:(AWSFirehoseCreateDeliveryStreamInput *)request completionHandler:(void (^ _Nullable)(AWSFirehoseCreateDeliveryStreamOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a delivery stream and its data.</p><p>You can delete a delivery stream only if it is in <code>ACTIVE</code> or <code>DELETING</code> state, and not in the <code>CREATING</code> state. While the deletion request is in process, the delivery stream is in the <code>DELETING</code> state.</p><p>To check the state of a delivery stream, use <a>DescribeDeliveryStream</a>.</p><p>While the delivery stream is <code>DELETING</code> state, the service may continue to accept the records, but the service doesn't make any guarantees with respect to delivering the data. Therefore, as a best practice, you should first stop any applications that are sending records before deleting a delivery stream.</p>
 
 @param request A container for the necessary parameters to execute the DeleteDeliveryStream service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSFirehoseDeleteDeliveryStreamOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSFirehoseErrorDomain` domain and the following error code: `AWSFirehoseErrorResourceInUse`, `AWSFirehoseErrorResourceNotFound`.
 
 @see AWSFirehoseDeleteDeliveryStreamInput
 @see AWSFirehoseDeleteDeliveryStreamOutput
 */
- (AWSTask<AWSFirehoseDeleteDeliveryStreamOutput *> *)deleteDeliveryStream:(AWSFirehoseDeleteDeliveryStreamInput *)request;

/**
 <p>Deletes a delivery stream and its data.</p><p>You can delete a delivery stream only if it is in <code>ACTIVE</code> or <code>DELETING</code> state, and not in the <code>CREATING</code> state. While the deletion request is in process, the delivery stream is in the <code>DELETING</code> state.</p><p>To check the state of a delivery stream, use <a>DescribeDeliveryStream</a>.</p><p>While the delivery stream is <code>DELETING</code> state, the service may continue to accept the records, but the service doesn't make any guarantees with respect to delivering the data. Therefore, as a best practice, you should first stop any applications that are sending records before deleting a delivery stream.</p>
 
 @param request A container for the necessary parameters to execute the DeleteDeliveryStream service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSFirehoseErrorDomain` domain and the following error code: `AWSFirehoseErrorResourceInUse`, `AWSFirehoseErrorResourceNotFound`.
 
 @see AWSFirehoseDeleteDeliveryStreamInput
 @see AWSFirehoseDeleteDeliveryStreamOutput
 */
- (void)deleteDeliveryStream:(AWSFirehoseDeleteDeliveryStreamInput *)request completionHandler:(void (^ _Nullable)(AWSFirehoseDeleteDeliveryStreamOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the specified delivery stream and gets the status. For example, after your delivery stream is created, call <a>DescribeDeliveryStream</a> to see if the delivery stream is <code>ACTIVE</code> and therefore ready for data to be sent to it.</p>
 
 @param request A container for the necessary parameters to execute the DescribeDeliveryStream service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSFirehoseDescribeDeliveryStreamOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSFirehoseErrorDomain` domain and the following error code: `AWSFirehoseErrorResourceNotFound`.
 
 @see AWSFirehoseDescribeDeliveryStreamInput
 @see AWSFirehoseDescribeDeliveryStreamOutput
 */
- (AWSTask<AWSFirehoseDescribeDeliveryStreamOutput *> *)describeDeliveryStream:(AWSFirehoseDescribeDeliveryStreamInput *)request;

/**
 <p>Describes the specified delivery stream and gets the status. For example, after your delivery stream is created, call <a>DescribeDeliveryStream</a> to see if the delivery stream is <code>ACTIVE</code> and therefore ready for data to be sent to it.</p>
 
 @param request A container for the necessary parameters to execute the DescribeDeliveryStream service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSFirehoseErrorDomain` domain and the following error code: `AWSFirehoseErrorResourceNotFound`.
 
 @see AWSFirehoseDescribeDeliveryStreamInput
 @see AWSFirehoseDescribeDeliveryStreamOutput
 */
- (void)describeDeliveryStream:(AWSFirehoseDescribeDeliveryStreamInput *)request completionHandler:(void (^ _Nullable)(AWSFirehoseDescribeDeliveryStreamOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists your delivery streams.</p><p>The number of delivery streams might be too large to return using a single call to <a>ListDeliveryStreams</a>. You can limit the number of delivery streams returned, using the <b>Limit</b> parameter. To determine whether there are more delivery streams to list, check the value of <b>HasMoreDeliveryStreams</b> in the output. If there are more delivery streams to list, you can request them by specifying the name of the last delivery stream returned in the call in the <b>ExclusiveStartDeliveryStreamName</b> parameter of a subsequent call.</p>
 
 @param request A container for the necessary parameters to execute the ListDeliveryStreams service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSFirehoseListDeliveryStreamsOutput`.
 
 @see AWSFirehoseListDeliveryStreamsInput
 @see AWSFirehoseListDeliveryStreamsOutput
 */
- (AWSTask<AWSFirehoseListDeliveryStreamsOutput *> *)listDeliveryStreams:(AWSFirehoseListDeliveryStreamsInput *)request;

/**
 <p>Lists your delivery streams.</p><p>The number of delivery streams might be too large to return using a single call to <a>ListDeliveryStreams</a>. You can limit the number of delivery streams returned, using the <b>Limit</b> parameter. To determine whether there are more delivery streams to list, check the value of <b>HasMoreDeliveryStreams</b> in the output. If there are more delivery streams to list, you can request them by specifying the name of the last delivery stream returned in the call in the <b>ExclusiveStartDeliveryStreamName</b> parameter of a subsequent call.</p>
 
 @param request A container for the necessary parameters to execute the ListDeliveryStreams service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSFirehoseListDeliveryStreamsInput
 @see AWSFirehoseListDeliveryStreamsOutput
 */
- (void)listDeliveryStreams:(AWSFirehoseListDeliveryStreamsInput *)request completionHandler:(void (^ _Nullable)(AWSFirehoseListDeliveryStreamsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Writes a single data record into an Amazon Kinesis Firehose delivery stream. To write multiple data records into a delivery stream, use <a>PutRecordBatch</a>. Applications using these operations are referred to as producers.</p><p>By default, each delivery stream can take in up to 2,000 transactions per second, 5,000 records per second, or 5 MB per second. Note that if you use <a>PutRecord</a> and <a>PutRecordBatch</a>, the limits are an aggregate across these two operations for each delivery stream. For more information about limits and how to request an increase, see <a href="http://docs.aws.amazon.com/firehose/latest/dev/limits.html">Amazon Kinesis Firehose Limits</a>. </p><p>You must specify the name of the delivery stream and the data record when using <a>PutRecord</a>. The data record consists of a data blob that can be up to 1,000 KB in size, and any kind of data, for example, a segment from a log file, geographic location data, web site clickstream data, etc.</p><p>Firehose buffers records before delivering them to the destination. To disambiguate the data blobs at the destination, a common solution is to use delimiters in the data, such as a newline (<code>\n</code>) or some other character unique within the data. This allows the consumer application(s) to parse individual data items when reading the data from the destination.</p><p>The <a>PutRecord</a> operation returns a <b>RecordId</b>, which is a unique string assigned to each record. Producer applications can use this ID for purposes such as auditability and investigation.</p><p>If the <a>PutRecord</a> operation throws a <b>ServiceUnavailableException</b>, back off and retry. If the exception persists, it is possible that the throughput limits have been exceeded for the delivery stream. </p><p>Data records sent to Firehose are stored for 24 hours from the time they are added to a delivery stream as it attempts to send the records to the destination. If the destination is unreachable for more than 24 hours, the data is no longer available.</p>
 
 @param request A container for the necessary parameters to execute the PutRecord service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSFirehosePutRecordOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSFirehoseErrorDomain` domain and the following error code: `AWSFirehoseErrorResourceNotFound`, `AWSFirehoseErrorInvalidArgument`, `AWSFirehoseErrorServiceUnavailable`.
 
 @see AWSFirehosePutRecordInput
 @see AWSFirehosePutRecordOutput
 */
- (AWSTask<AWSFirehosePutRecordOutput *> *)putRecord:(AWSFirehosePutRecordInput *)request;

/**
 <p>Writes a single data record into an Amazon Kinesis Firehose delivery stream. To write multiple data records into a delivery stream, use <a>PutRecordBatch</a>. Applications using these operations are referred to as producers.</p><p>By default, each delivery stream can take in up to 2,000 transactions per second, 5,000 records per second, or 5 MB per second. Note that if you use <a>PutRecord</a> and <a>PutRecordBatch</a>, the limits are an aggregate across these two operations for each delivery stream. For more information about limits and how to request an increase, see <a href="http://docs.aws.amazon.com/firehose/latest/dev/limits.html">Amazon Kinesis Firehose Limits</a>. </p><p>You must specify the name of the delivery stream and the data record when using <a>PutRecord</a>. The data record consists of a data blob that can be up to 1,000 KB in size, and any kind of data, for example, a segment from a log file, geographic location data, web site clickstream data, etc.</p><p>Firehose buffers records before delivering them to the destination. To disambiguate the data blobs at the destination, a common solution is to use delimiters in the data, such as a newline (<code>\n</code>) or some other character unique within the data. This allows the consumer application(s) to parse individual data items when reading the data from the destination.</p><p>The <a>PutRecord</a> operation returns a <b>RecordId</b>, which is a unique string assigned to each record. Producer applications can use this ID for purposes such as auditability and investigation.</p><p>If the <a>PutRecord</a> operation throws a <b>ServiceUnavailableException</b>, back off and retry. If the exception persists, it is possible that the throughput limits have been exceeded for the delivery stream. </p><p>Data records sent to Firehose are stored for 24 hours from the time they are added to a delivery stream as it attempts to send the records to the destination. If the destination is unreachable for more than 24 hours, the data is no longer available.</p>
 
 @param request A container for the necessary parameters to execute the PutRecord service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSFirehoseErrorDomain` domain and the following error code: `AWSFirehoseErrorResourceNotFound`, `AWSFirehoseErrorInvalidArgument`, `AWSFirehoseErrorServiceUnavailable`.
 
 @see AWSFirehosePutRecordInput
 @see AWSFirehosePutRecordOutput
 */
- (void)putRecord:(AWSFirehosePutRecordInput *)request completionHandler:(void (^ _Nullable)(AWSFirehosePutRecordOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Writes multiple data records into a delivery stream in a single call, which can achieve higher throughput per producer than when writing single records. To write single data records into a delivery stream, use <a>PutRecord</a>. Applications using these operations are referred to as producers.</p><p>Each <a>PutRecordBatch</a> request supports up to 500 records. Each record in the request can be as large as 1,000 KB (before 64-bit encoding), up to a limit of 4 MB for the entire request. By default, each delivery stream can take in up to 2,000 transactions per second, 5,000 records per second, or 5 MB per second. Note that if you use <a>PutRecord</a> and <a>PutRecordBatch</a>, the limits are an aggregate across these two operations for each delivery stream. For more information about limits and how to request an increase, see <a href="http://docs.aws.amazon.com/firehose/latest/dev/limits.html">Amazon Kinesis Firehose Limits</a>. </p><p>You must specify the name of the delivery stream and the data record when using <a>PutRecord</a>. The data record consists of a data blob that can be up to 1,000 KB in size, and any kind of data, for example, a segment from a log file, geographic location data, web site clickstream data, and so on.</p><p>Firehose buffers records before delivering them to the destination. To disambiguate the data blobs at the destination, a common solution is to use delimiters in the data, such as a newline (<code>\n</code>) or some other character unique within the data. This allows the consumer application(s) to parse individual data items when reading the data from the destination.</p><p>The <a>PutRecordBatch</a> response includes a count of any failed records, <b>FailedPutCount</b>, and an array of responses, <b>RequestResponses</b>. The <b>FailedPutCount</b> value is a count of records that failed. Each entry in the <b>RequestResponses</b> array gives additional information of the processed record. Each entry in <b>RequestResponses</b> directly correlates with a record in the request array using the same ordering, from the top to the bottom of the request and response. <b>RequestResponses</b> always includes the same number of records as the request array. <b>RequestResponses</b> both successfully and unsuccessfully processed records. Firehose attempts to process all records in each <a>PutRecordBatch</a> request. A single record failure does not stop the processing of subsequent records.</p><p>A successfully processed record includes a <b>RecordId</b> value, which is a unique value identified for the record. An unsuccessfully processed record includes <b>ErrorCode</b> and <b>ErrorMessage</b> values. <b>ErrorCode</b> reflects the type of error and is one of the following values: <code>ServiceUnavailable</code> or <code>InternalFailure</code>. <code>ErrorMessage</code> provides more detailed information about the error.</p><p>If <b>FailedPutCount</b> is greater than 0 (zero), retry the request. A retry of the entire batch of records is possible; however, we strongly recommend that you inspect the entire response and resend only those records that failed processing. This minimizes duplicate records and also reduces the total bytes sent (and corresponding charges).</p><p>If the <a>PutRecordBatch</a> operation throws a <b>ServiceUnavailableException</b>, back off and retry. If the exception persists, it is possible that the throughput limits have been exceeded for the delivery stream.</p><p>Data records sent to Firehose are stored for 24 hours from the time they are added to a delivery stream as it attempts to send the records to the destination. If the destination is unreachable for more than 24 hours, the data is no longer available.</p>
 
 @param request A container for the necessary parameters to execute the PutRecordBatch service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSFirehosePutRecordBatchOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSFirehoseErrorDomain` domain and the following error code: `AWSFirehoseErrorResourceNotFound`, `AWSFirehoseErrorInvalidArgument`, `AWSFirehoseErrorServiceUnavailable`.
 
 @see AWSFirehosePutRecordBatchInput
 @see AWSFirehosePutRecordBatchOutput
 */
- (AWSTask<AWSFirehosePutRecordBatchOutput *> *)putRecordBatch:(AWSFirehosePutRecordBatchInput *)request;

/**
 <p>Writes multiple data records into a delivery stream in a single call, which can achieve higher throughput per producer than when writing single records. To write single data records into a delivery stream, use <a>PutRecord</a>. Applications using these operations are referred to as producers.</p><p>Each <a>PutRecordBatch</a> request supports up to 500 records. Each record in the request can be as large as 1,000 KB (before 64-bit encoding), up to a limit of 4 MB for the entire request. By default, each delivery stream can take in up to 2,000 transactions per second, 5,000 records per second, or 5 MB per second. Note that if you use <a>PutRecord</a> and <a>PutRecordBatch</a>, the limits are an aggregate across these two operations for each delivery stream. For more information about limits and how to request an increase, see <a href="http://docs.aws.amazon.com/firehose/latest/dev/limits.html">Amazon Kinesis Firehose Limits</a>. </p><p>You must specify the name of the delivery stream and the data record when using <a>PutRecord</a>. The data record consists of a data blob that can be up to 1,000 KB in size, and any kind of data, for example, a segment from a log file, geographic location data, web site clickstream data, and so on.</p><p>Firehose buffers records before delivering them to the destination. To disambiguate the data blobs at the destination, a common solution is to use delimiters in the data, such as a newline (<code>\n</code>) or some other character unique within the data. This allows the consumer application(s) to parse individual data items when reading the data from the destination.</p><p>The <a>PutRecordBatch</a> response includes a count of any failed records, <b>FailedPutCount</b>, and an array of responses, <b>RequestResponses</b>. The <b>FailedPutCount</b> value is a count of records that failed. Each entry in the <b>RequestResponses</b> array gives additional information of the processed record. Each entry in <b>RequestResponses</b> directly correlates with a record in the request array using the same ordering, from the top to the bottom of the request and response. <b>RequestResponses</b> always includes the same number of records as the request array. <b>RequestResponses</b> both successfully and unsuccessfully processed records. Firehose attempts to process all records in each <a>PutRecordBatch</a> request. A single record failure does not stop the processing of subsequent records.</p><p>A successfully processed record includes a <b>RecordId</b> value, which is a unique value identified for the record. An unsuccessfully processed record includes <b>ErrorCode</b> and <b>ErrorMessage</b> values. <b>ErrorCode</b> reflects the type of error and is one of the following values: <code>ServiceUnavailable</code> or <code>InternalFailure</code>. <code>ErrorMessage</code> provides more detailed information about the error.</p><p>If <b>FailedPutCount</b> is greater than 0 (zero), retry the request. A retry of the entire batch of records is possible; however, we strongly recommend that you inspect the entire response and resend only those records that failed processing. This minimizes duplicate records and also reduces the total bytes sent (and corresponding charges).</p><p>If the <a>PutRecordBatch</a> operation throws a <b>ServiceUnavailableException</b>, back off and retry. If the exception persists, it is possible that the throughput limits have been exceeded for the delivery stream.</p><p>Data records sent to Firehose are stored for 24 hours from the time they are added to a delivery stream as it attempts to send the records to the destination. If the destination is unreachable for more than 24 hours, the data is no longer available.</p>
 
 @param request A container for the necessary parameters to execute the PutRecordBatch service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSFirehoseErrorDomain` domain and the following error code: `AWSFirehoseErrorResourceNotFound`, `AWSFirehoseErrorInvalidArgument`, `AWSFirehoseErrorServiceUnavailable`.
 
 @see AWSFirehosePutRecordBatchInput
 @see AWSFirehosePutRecordBatchOutput
 */
- (void)putRecordBatch:(AWSFirehosePutRecordBatchInput *)request completionHandler:(void (^ _Nullable)(AWSFirehosePutRecordBatchOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the specified destination of the specified delivery stream. Note: Switching between Elasticsearch and other services is not supported. For Elasticsearch destination, you can only update an existing Elasticsearch destination with this operation.</p><p>This operation can be used to change the destination type (for example, to replace the Amazon S3 destination with Amazon Redshift) or change the parameters associated with a given destination (for example, to change the bucket name of the Amazon S3 destination). The update may not occur immediately. The target delivery stream remains active while the configurations are updated, so data writes to the delivery stream can continue during this process. The updated configurations are normally effective within a few minutes.</p><p>If the destination type is the same, Firehose merges the configuration parameters specified in the <a>UpdateDestination</a> request with the destination configuration that already exists on the delivery stream. If any of the parameters are not specified in the update request, then the existing configuration parameters are retained. For example, in the Amazon S3 destination, if <a>EncryptionConfiguration</a> is not specified then the existing <a>EncryptionConfiguration</a> is maintained on the destination.</p><p>If the destination type is not the same, for example, changing the destination from Amazon S3 to Amazon Redshift, Firehose does not merge any parameters. In this case, all parameters must be specified.</p><p>Firehose uses the <b>CurrentDeliveryStreamVersionId</b> to avoid race conditions and conflicting merges. This is a required field in every request and the service only updates the configuration if the existing configuration matches the <b>VersionId</b>. After the update is applied successfully, the <b>VersionId</b> is updated, which can be retrieved with the <a>DescribeDeliveryStream</a> operation. The new <b>VersionId</b> should be uses to set <b>CurrentDeliveryStreamVersionId</b> in the next <a>UpdateDestination</a> operation.</p>
 
 @param request A container for the necessary parameters to execute the UpdateDestination service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSFirehoseUpdateDestinationOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSFirehoseErrorDomain` domain and the following error code: `AWSFirehoseErrorInvalidArgument`, `AWSFirehoseErrorResourceInUse`, `AWSFirehoseErrorResourceNotFound`, `AWSFirehoseErrorConcurrentModification`.
 
 @see AWSFirehoseUpdateDestinationInput
 @see AWSFirehoseUpdateDestinationOutput
 */
- (AWSTask<AWSFirehoseUpdateDestinationOutput *> *)updateDestination:(AWSFirehoseUpdateDestinationInput *)request;

/**
 <p>Updates the specified destination of the specified delivery stream. Note: Switching between Elasticsearch and other services is not supported. For Elasticsearch destination, you can only update an existing Elasticsearch destination with this operation.</p><p>This operation can be used to change the destination type (for example, to replace the Amazon S3 destination with Amazon Redshift) or change the parameters associated with a given destination (for example, to change the bucket name of the Amazon S3 destination). The update may not occur immediately. The target delivery stream remains active while the configurations are updated, so data writes to the delivery stream can continue during this process. The updated configurations are normally effective within a few minutes.</p><p>If the destination type is the same, Firehose merges the configuration parameters specified in the <a>UpdateDestination</a> request with the destination configuration that already exists on the delivery stream. If any of the parameters are not specified in the update request, then the existing configuration parameters are retained. For example, in the Amazon S3 destination, if <a>EncryptionConfiguration</a> is not specified then the existing <a>EncryptionConfiguration</a> is maintained on the destination.</p><p>If the destination type is not the same, for example, changing the destination from Amazon S3 to Amazon Redshift, Firehose does not merge any parameters. In this case, all parameters must be specified.</p><p>Firehose uses the <b>CurrentDeliveryStreamVersionId</b> to avoid race conditions and conflicting merges. This is a required field in every request and the service only updates the configuration if the existing configuration matches the <b>VersionId</b>. After the update is applied successfully, the <b>VersionId</b> is updated, which can be retrieved with the <a>DescribeDeliveryStream</a> operation. The new <b>VersionId</b> should be uses to set <b>CurrentDeliveryStreamVersionId</b> in the next <a>UpdateDestination</a> operation.</p>
 
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
