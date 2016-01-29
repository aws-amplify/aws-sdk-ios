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
#import "AWSKinesisModel.h"

NS_ASSUME_NONNULL_BEGIN

/**
 <fullname>Amazon Kinesis Service API Reference</fullname><p>Amazon Kinesis is a managed service that scales elastically for real time processing of streaming big data.</p>
 */
@interface AWSKinesis : AWSService

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

     let Kinesis = AWSKinesis.defaultKinesis()

 *Objective-C*

     AWSKinesis *Kinesis = [AWSKinesis defaultKinesis];

 @return The default service client.
 */
+ (instancetype)defaultKinesis;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
         let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
         let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
         AWSKinesis.registerKinesisWithConfiguration(configuration, forKey: "USWest2Kinesis")

         return true
     }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSKinesis registerKinesisWithConfiguration:configuration forKey:@"USWest2Kinesis"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Kinesis = AWSKinesis(forKey: "USWest2Kinesis")

 *Objective-C*

     AWSKinesis *Kinesis = [AWSKinesis KinesisForKey:@"USWest2Kinesis"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerKinesisWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerKinesisWithConfiguration:forKey:` before invoking this method. If `+ registerKinesisWithConfiguration:forKey:` has not been called in advance or the key does not exist, this method returns `nil`.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
         let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
         let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
         AWSKinesis.registerKinesisWithConfiguration(configuration, forKey: "USWest2Kinesis")

         return true
     }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSKinesis registerKinesisWithConfiguration:configuration forKey:@"USWest2Kinesis"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Kinesis = AWSKinesis(forKey: "USWest2Kinesis")

 *Objective-C*

     AWSKinesis *Kinesis = [AWSKinesis KinesisForKey:@"USWest2Kinesis"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)KinesisForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removeKinesisForKey:(NSString *)key;

/**
 Instantiates the service client with the given service configuration.
 
 @warning This method has been deprecated. Use `+ registerKinesisWithConfiguration:forKey:` and `+ KinesisForKey:` instead.
 
 @warning Once the client is instantiated, do not modify the configuration object. It may cause unspecified behaviors.
 
 @warning Unlike the singleton method, you are responsible for maintaining a strong reference to this object. If the service client is released before completing a service request, the request may fail with unspecified errors.
 
 @param configuration The service configuration object.
 
 @return An instance of the service client.
 */
- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration __attribute__ ((deprecated("Use '+ registerKinesisWithConfiguration:forKey:' and '+ KinesisForKey:' instead.")));

/**
 <p>Adds or updates tags for the specified Amazon Kinesis stream. Each stream can have up to 10 tags. </p><p>If tags have already been assigned to the stream, <code>AddTagsToStream</code> overwrites any existing tags that correspond to the specified tag keys.</p>
 
 @param request A container for the necessary parameters to execute the AddTagsToStream service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSKinesisErrorDomain` domain and the following error code: `AWSKinesisErrorResourceNotFound`, `AWSKinesisErrorResourceInUse`, `AWSKinesisErrorInvalidArgument`, `AWSKinesisErrorLimitExceeded`.
 
 @see AWSKinesisAddTagsToStreamInput
 */
- (AWSTask *)addTagsToStream:(AWSKinesisAddTagsToStreamInput *)request;

/**
 <p>Adds or updates tags for the specified Amazon Kinesis stream. Each stream can have up to 10 tags. </p><p>If tags have already been assigned to the stream, <code>AddTagsToStream</code> overwrites any existing tags that correspond to the specified tag keys.</p>
 
 @param request A container for the necessary parameters to execute the AddTagsToStream service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSKinesisErrorDomain` domain and the following error code: `AWSKinesisErrorResourceNotFound`, `AWSKinesisErrorResourceInUse`, `AWSKinesisErrorInvalidArgument`, `AWSKinesisErrorLimitExceeded`.
 
 @see AWSKinesisAddTagsToStreamInput
 */
- (void)addTagsToStream:(AWSKinesisAddTagsToStreamInput *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Creates a Amazon Kinesis stream. A stream captures and transports data records that are continuously emitted from different data sources or <i>producers</i>. Scale-out within an Amazon Kinesis stream is explicitly supported by means of shards, which are uniquely identified groups of data records in an Amazon Kinesis stream.</p><p>You specify and control the number of shards that a stream is composed of. Each open shard can support up to 5 read transactions per second, up to a maximum total of 2 MB of data read per second. Each shard can support up to 1000 records written per second, up to a maximum total of 1 MB data written per second. You can add shards to a stream if the amount of data input increases and you can remove shards if the amount of data input decreases.</p><p>The stream name identifies the stream. The name is scoped to the AWS account used by the application. It is also scoped by region. That is, two streams in two different accounts can have the same name, and two streams in the same account, but in two different regions, can have the same name. </p><p><code>CreateStream</code> is an asynchronous operation. Upon receiving a <code>CreateStream</code> request, Amazon Kinesis immediately returns and sets the stream status to <code>CREATING</code>. After the stream is created, Amazon Kinesis sets the stream status to <code>ACTIVE</code>. You should perform read and write operations only on an <code>ACTIVE</code> stream. </p><p>You receive a <code>LimitExceededException</code> when making a <code>CreateStream</code> request if you try to do one of the following:</p><ul><li>Have more than five streams in the <code>CREATING</code> state at any point in time.</li><li>Create more shards than are authorized for your account.</li></ul><p>The default limit for an AWS account is 10 shards per stream. If you need to create a stream with more than 10 shards, <a href="http://docs.aws.amazon.com/general/latest/gr/aws_service_limits.html">contact AWS Support</a> to increase the limit on your account.</p><p>You can use <code>DescribeStream</code> to check the stream status, which is returned in <code>StreamStatus</code>.</p><p><code>CreateStream</code> has a limit of 5 transactions per second per account.</p>
 
 @param request A container for the necessary parameters to execute the CreateStream service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSKinesisErrorDomain` domain and the following error code: `AWSKinesisErrorResourceInUse`, `AWSKinesisErrorLimitExceeded`, `AWSKinesisErrorInvalidArgument`.
 
 @see AWSKinesisCreateStreamInput
 */
- (AWSTask *)createStream:(AWSKinesisCreateStreamInput *)request;

/**
 <p>Creates a Amazon Kinesis stream. A stream captures and transports data records that are continuously emitted from different data sources or <i>producers</i>. Scale-out within an Amazon Kinesis stream is explicitly supported by means of shards, which are uniquely identified groups of data records in an Amazon Kinesis stream.</p><p>You specify and control the number of shards that a stream is composed of. Each open shard can support up to 5 read transactions per second, up to a maximum total of 2 MB of data read per second. Each shard can support up to 1000 records written per second, up to a maximum total of 1 MB data written per second. You can add shards to a stream if the amount of data input increases and you can remove shards if the amount of data input decreases.</p><p>The stream name identifies the stream. The name is scoped to the AWS account used by the application. It is also scoped by region. That is, two streams in two different accounts can have the same name, and two streams in the same account, but in two different regions, can have the same name. </p><p><code>CreateStream</code> is an asynchronous operation. Upon receiving a <code>CreateStream</code> request, Amazon Kinesis immediately returns and sets the stream status to <code>CREATING</code>. After the stream is created, Amazon Kinesis sets the stream status to <code>ACTIVE</code>. You should perform read and write operations only on an <code>ACTIVE</code> stream. </p><p>You receive a <code>LimitExceededException</code> when making a <code>CreateStream</code> request if you try to do one of the following:</p><ul><li>Have more than five streams in the <code>CREATING</code> state at any point in time.</li><li>Create more shards than are authorized for your account.</li></ul><p>The default limit for an AWS account is 10 shards per stream. If you need to create a stream with more than 10 shards, <a href="http://docs.aws.amazon.com/general/latest/gr/aws_service_limits.html">contact AWS Support</a> to increase the limit on your account.</p><p>You can use <code>DescribeStream</code> to check the stream status, which is returned in <code>StreamStatus</code>.</p><p><code>CreateStream</code> has a limit of 5 transactions per second per account.</p>
 
 @param request A container for the necessary parameters to execute the CreateStream service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSKinesisErrorDomain` domain and the following error code: `AWSKinesisErrorResourceInUse`, `AWSKinesisErrorLimitExceeded`, `AWSKinesisErrorInvalidArgument`.
 
 @see AWSKinesisCreateStreamInput
 */
- (void)createStream:(AWSKinesisCreateStreamInput *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a stream and all its shards and data. You must shut down any applications that are operating on the stream before you delete the stream. If an application attempts to operate on a deleted stream, it will receive the exception <code>ResourceNotFoundException</code>.</p><p>If the stream is in the <code>ACTIVE</code> state, you can delete it. After a <code>DeleteStream</code> request, the specified stream is in the <code>DELETING</code> state until Amazon Kinesis completes the deletion.</p><p><b>Note:</b> Amazon Kinesis might continue to accept data read and write operations, such as <a>PutRecord</a>, <a>PutRecords</a>, and <a>GetRecords</a>, on a stream in the <code>DELETING</code> state until the stream deletion is complete.</p><p>When you delete a stream, any shards in that stream are also deleted, and any tags are dissociated from the stream.</p><p>You can use the <a>DescribeStream</a> operation to check the state of the stream, which is returned in <code>StreamStatus</code>.</p><p><code>DeleteStream</code> has a limit of 5 transactions per second per account.</p>
 
 @param request A container for the necessary parameters to execute the DeleteStream service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSKinesisErrorDomain` domain and the following error code: `AWSKinesisErrorResourceNotFound`, `AWSKinesisErrorLimitExceeded`.
 
 @see AWSKinesisDeleteStreamInput
 */
- (AWSTask *)deleteStream:(AWSKinesisDeleteStreamInput *)request;

/**
 <p>Deletes a stream and all its shards and data. You must shut down any applications that are operating on the stream before you delete the stream. If an application attempts to operate on a deleted stream, it will receive the exception <code>ResourceNotFoundException</code>.</p><p>If the stream is in the <code>ACTIVE</code> state, you can delete it. After a <code>DeleteStream</code> request, the specified stream is in the <code>DELETING</code> state until Amazon Kinesis completes the deletion.</p><p><b>Note:</b> Amazon Kinesis might continue to accept data read and write operations, such as <a>PutRecord</a>, <a>PutRecords</a>, and <a>GetRecords</a>, on a stream in the <code>DELETING</code> state until the stream deletion is complete.</p><p>When you delete a stream, any shards in that stream are also deleted, and any tags are dissociated from the stream.</p><p>You can use the <a>DescribeStream</a> operation to check the state of the stream, which is returned in <code>StreamStatus</code>.</p><p><code>DeleteStream</code> has a limit of 5 transactions per second per account.</p>
 
 @param request A container for the necessary parameters to execute the DeleteStream service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSKinesisErrorDomain` domain and the following error code: `AWSKinesisErrorResourceNotFound`, `AWSKinesisErrorLimitExceeded`.
 
 @see AWSKinesisDeleteStreamInput
 */
- (void)deleteStream:(AWSKinesisDeleteStreamInput *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Describes the specified stream.</p><p>The information about the stream includes its current status, its Amazon Resource Name (ARN), and an array of shard objects. For each shard object, there is information about the hash key and sequence number ranges that the shard spans, and the IDs of any earlier shards that played in a role in creating the shard. A sequence number is the identifier associated with every record ingested in the Amazon Kinesis stream. The sequence number is assigned when a record is put into the stream.</p><p>You can limit the number of returned shards using the <code>Limit</code> parameter. The number of shards in a stream may be too large to return from a single call to <code>DescribeStream</code>. You can detect this by using the <code>HasMoreShards</code> flag in the returned output. <code>HasMoreShards</code> is set to <code>true</code> when there is more data available. </p><p><code>DescribeStream</code> is a paginated operation. If there are more shards available, you can request them using the shard ID of the last shard returned. Specify this ID in the <code>ExclusiveStartShardId</code> parameter in a subsequent request to <code>DescribeStream</code>. </p><p><code>DescribeStream</code> has a limit of 10 transactions per second per account.</p>
 
 @param request A container for the necessary parameters to execute the DescribeStream service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSKinesisDescribeStreamOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSKinesisErrorDomain` domain and the following error code: `AWSKinesisErrorResourceNotFound`, `AWSKinesisErrorLimitExceeded`.
 
 @see AWSKinesisDescribeStreamInput
 @see AWSKinesisDescribeStreamOutput
 */
- (AWSTask<AWSKinesisDescribeStreamOutput *> *)describeStream:(AWSKinesisDescribeStreamInput *)request;

/**
 <p>Describes the specified stream.</p><p>The information about the stream includes its current status, its Amazon Resource Name (ARN), and an array of shard objects. For each shard object, there is information about the hash key and sequence number ranges that the shard spans, and the IDs of any earlier shards that played in a role in creating the shard. A sequence number is the identifier associated with every record ingested in the Amazon Kinesis stream. The sequence number is assigned when a record is put into the stream.</p><p>You can limit the number of returned shards using the <code>Limit</code> parameter. The number of shards in a stream may be too large to return from a single call to <code>DescribeStream</code>. You can detect this by using the <code>HasMoreShards</code> flag in the returned output. <code>HasMoreShards</code> is set to <code>true</code> when there is more data available. </p><p><code>DescribeStream</code> is a paginated operation. If there are more shards available, you can request them using the shard ID of the last shard returned. Specify this ID in the <code>ExclusiveStartShardId</code> parameter in a subsequent request to <code>DescribeStream</code>. </p><p><code>DescribeStream</code> has a limit of 10 transactions per second per account.</p>
 
 @param request A container for the necessary parameters to execute the DescribeStream service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSKinesisErrorDomain` domain and the following error code: `AWSKinesisErrorResourceNotFound`, `AWSKinesisErrorLimitExceeded`.
 
 @see AWSKinesisDescribeStreamInput
 @see AWSKinesisDescribeStreamOutput
 */
- (void)describeStream:(AWSKinesisDescribeStreamInput *)request completionHandler:(void (^ _Nullable)(AWSKinesisDescribeStreamOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets data records from a shard.</p><p>Specify a shard iterator using the <code>ShardIterator</code> parameter. The shard iterator specifies the position in the shard from which you want to start reading data records sequentially. If there are no records available in the portion of the shard that the iterator points to, <code>GetRecords</code> returns an empty list. Note that it might take multiple calls to get to a portion of the shard that contains records.</p><p>You can scale by provisioning multiple shards. Your application should have one thread per shard, each reading continuously from its stream. To read from a stream continually, call <code>GetRecords</code> in a loop. Use <a>GetShardIterator</a> to get the shard iterator to specify in the first <code>GetRecords</code> call. <code>GetRecords</code> returns a new shard iterator in <code>NextShardIterator</code>. Specify the shard iterator returned in <code>NextShardIterator</code> in subsequent calls to <code>GetRecords</code>. Note that if the shard has been closed, the shard iterator can't return more data and <code>GetRecords</code> returns <code>null</code> in <code>NextShardIterator</code>. You can terminate the loop when the shard is closed, or when the shard iterator reaches the record with the sequence number or other attribute that marks it as the last record to process.</p><p>Each data record can be up to 50 KB in size, and each shard can read up to 2 MB per second. You can ensure that your calls don't exceed the maximum supported size or throughput by using the <code>Limit</code> parameter to specify the maximum number of records that <code>GetRecords</code> can return. Consider your average record size when determining this limit. For example, if your average record size is 40 KB, you can limit the data returned to about 1 MB per call by specifying 25 as the limit.</p><p>The size of the data returned by <code>GetRecords</code> will vary depending on the utilization of the shard. The maximum size of data that <code>GetRecords</code> can return is 10 MB. If a call returns 10 MB of data, subsequent calls made within the next 5 seconds throw <code>ProvisionedThroughputExceededException</code>. If there is insufficient provisioned throughput on the shard, subsequent calls made within the next 1 second throw <code>ProvisionedThroughputExceededException</code>. Note that <code>GetRecords</code> won't return any data when it throws an exception. For this reason, we recommend that you wait one second between calls to <code>GetRecords</code>; however, it's possible that the application will get exceptions for longer than 1 second.</p><p>To detect whether the application is falling behind in processing, add a timestamp to your records and note how long it takes to process them. You can also monitor how much data is in a stream using the CloudWatch metrics for write operations (<code>PutRecord</code> and <code>PutRecords</code>). For more information, see <a href="http://docs.aws.amazon.com/kinesis/latest/dev/monitoring_with_cloudwatch.html">Monitoring Amazon Kinesis with Amazon CloudWatch</a> in the <i>Amazon Kinesis Developer Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the GetRecords service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSKinesisGetRecordsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSKinesisErrorDomain` domain and the following error code: `AWSKinesisErrorResourceNotFound`, `AWSKinesisErrorInvalidArgument`, `AWSKinesisErrorProvisionedThroughputExceeded`, `AWSKinesisErrorExpiredIterator`.
 
 @see AWSKinesisGetRecordsInput
 @see AWSKinesisGetRecordsOutput
 */
- (AWSTask<AWSKinesisGetRecordsOutput *> *)getRecords:(AWSKinesisGetRecordsInput *)request;

/**
 <p>Gets data records from a shard.</p><p>Specify a shard iterator using the <code>ShardIterator</code> parameter. The shard iterator specifies the position in the shard from which you want to start reading data records sequentially. If there are no records available in the portion of the shard that the iterator points to, <code>GetRecords</code> returns an empty list. Note that it might take multiple calls to get to a portion of the shard that contains records.</p><p>You can scale by provisioning multiple shards. Your application should have one thread per shard, each reading continuously from its stream. To read from a stream continually, call <code>GetRecords</code> in a loop. Use <a>GetShardIterator</a> to get the shard iterator to specify in the first <code>GetRecords</code> call. <code>GetRecords</code> returns a new shard iterator in <code>NextShardIterator</code>. Specify the shard iterator returned in <code>NextShardIterator</code> in subsequent calls to <code>GetRecords</code>. Note that if the shard has been closed, the shard iterator can't return more data and <code>GetRecords</code> returns <code>null</code> in <code>NextShardIterator</code>. You can terminate the loop when the shard is closed, or when the shard iterator reaches the record with the sequence number or other attribute that marks it as the last record to process.</p><p>Each data record can be up to 50 KB in size, and each shard can read up to 2 MB per second. You can ensure that your calls don't exceed the maximum supported size or throughput by using the <code>Limit</code> parameter to specify the maximum number of records that <code>GetRecords</code> can return. Consider your average record size when determining this limit. For example, if your average record size is 40 KB, you can limit the data returned to about 1 MB per call by specifying 25 as the limit.</p><p>The size of the data returned by <code>GetRecords</code> will vary depending on the utilization of the shard. The maximum size of data that <code>GetRecords</code> can return is 10 MB. If a call returns 10 MB of data, subsequent calls made within the next 5 seconds throw <code>ProvisionedThroughputExceededException</code>. If there is insufficient provisioned throughput on the shard, subsequent calls made within the next 1 second throw <code>ProvisionedThroughputExceededException</code>. Note that <code>GetRecords</code> won't return any data when it throws an exception. For this reason, we recommend that you wait one second between calls to <code>GetRecords</code>; however, it's possible that the application will get exceptions for longer than 1 second.</p><p>To detect whether the application is falling behind in processing, add a timestamp to your records and note how long it takes to process them. You can also monitor how much data is in a stream using the CloudWatch metrics for write operations (<code>PutRecord</code> and <code>PutRecords</code>). For more information, see <a href="http://docs.aws.amazon.com/kinesis/latest/dev/monitoring_with_cloudwatch.html">Monitoring Amazon Kinesis with Amazon CloudWatch</a> in the <i>Amazon Kinesis Developer Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the GetRecords service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSKinesisErrorDomain` domain and the following error code: `AWSKinesisErrorResourceNotFound`, `AWSKinesisErrorInvalidArgument`, `AWSKinesisErrorProvisionedThroughputExceeded`, `AWSKinesisErrorExpiredIterator`.
 
 @see AWSKinesisGetRecordsInput
 @see AWSKinesisGetRecordsOutput
 */
- (void)getRecords:(AWSKinesisGetRecordsInput *)request completionHandler:(void (^ _Nullable)(AWSKinesisGetRecordsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets a shard iterator. A shard iterator expires five minutes after it is returned to the requester.</p><p>A shard iterator specifies the position in the shard from which to start reading data records sequentially. A shard iterator specifies this position using the sequence number of a data record in a shard. A sequence number is the identifier associated with every record ingested in the Amazon Kinesis stream. The sequence number is assigned when a record is put into the stream. </p><p>You must specify the shard iterator type. For example, you can set the <code>ShardIteratorType</code> parameter to read exactly from the position denoted by a specific sequence number by using the <code>AT_SEQUENCE_NUMBER</code> shard iterator type, or right after the sequence number by using the <code>AFTER_SEQUENCE_NUMBER</code> shard iterator type, using sequence numbers returned by earlier calls to <a>PutRecord</a>, <a>PutRecords</a>, <a>GetRecords</a>, or <a>DescribeStream</a>. You can specify the shard iterator type <code>TRIM_HORIZON</code> in the request to cause <code>ShardIterator</code> to point to the last untrimmed record in the shard in the system, which is the oldest data record in the shard. Or you can point to just after the most recent record in the shard, by using the shard iterator type <code>LATEST</code>, so that you always read the most recent data in the shard. </p><p>When you repeatedly read from an Amazon Kinesis stream use a <a>GetShardIterator</a> request to get the first shard iterator to to use in your first <code>GetRecords</code> request and then use the shard iterator returned by the <code>GetRecords</code> request in <code>NextShardIterator</code> for subsequent reads. A new shard iterator is returned by every <code>GetRecords</code> request in <code>NextShardIterator</code>, which you use in the <code>ShardIterator</code> parameter of the next <code>GetRecords</code> request. </p><p>If a <code>GetShardIterator</code> request is made too often, you receive a <code>ProvisionedThroughputExceededException</code>. For more information about throughput limits, see <a>GetRecords</a>.</p><p>If the shard is closed, the iterator can't return more data, and <code>GetShardIterator</code> returns <code>null</code> for its <code>ShardIterator</code>. A shard can be closed using <a>SplitShard</a> or <a>MergeShards</a>.</p><p><code>GetShardIterator</code> has a limit of 5 transactions per second per account per open shard.</p>
 
 @param request A container for the necessary parameters to execute the GetShardIterator service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSKinesisGetShardIteratorOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSKinesisErrorDomain` domain and the following error code: `AWSKinesisErrorResourceNotFound`, `AWSKinesisErrorInvalidArgument`, `AWSKinesisErrorProvisionedThroughputExceeded`.
 
 @see AWSKinesisGetShardIteratorInput
 @see AWSKinesisGetShardIteratorOutput
 */
- (AWSTask<AWSKinesisGetShardIteratorOutput *> *)getShardIterator:(AWSKinesisGetShardIteratorInput *)request;

/**
 <p>Gets a shard iterator. A shard iterator expires five minutes after it is returned to the requester.</p><p>A shard iterator specifies the position in the shard from which to start reading data records sequentially. A shard iterator specifies this position using the sequence number of a data record in a shard. A sequence number is the identifier associated with every record ingested in the Amazon Kinesis stream. The sequence number is assigned when a record is put into the stream. </p><p>You must specify the shard iterator type. For example, you can set the <code>ShardIteratorType</code> parameter to read exactly from the position denoted by a specific sequence number by using the <code>AT_SEQUENCE_NUMBER</code> shard iterator type, or right after the sequence number by using the <code>AFTER_SEQUENCE_NUMBER</code> shard iterator type, using sequence numbers returned by earlier calls to <a>PutRecord</a>, <a>PutRecords</a>, <a>GetRecords</a>, or <a>DescribeStream</a>. You can specify the shard iterator type <code>TRIM_HORIZON</code> in the request to cause <code>ShardIterator</code> to point to the last untrimmed record in the shard in the system, which is the oldest data record in the shard. Or you can point to just after the most recent record in the shard, by using the shard iterator type <code>LATEST</code>, so that you always read the most recent data in the shard. </p><p>When you repeatedly read from an Amazon Kinesis stream use a <a>GetShardIterator</a> request to get the first shard iterator to to use in your first <code>GetRecords</code> request and then use the shard iterator returned by the <code>GetRecords</code> request in <code>NextShardIterator</code> for subsequent reads. A new shard iterator is returned by every <code>GetRecords</code> request in <code>NextShardIterator</code>, which you use in the <code>ShardIterator</code> parameter of the next <code>GetRecords</code> request. </p><p>If a <code>GetShardIterator</code> request is made too often, you receive a <code>ProvisionedThroughputExceededException</code>. For more information about throughput limits, see <a>GetRecords</a>.</p><p>If the shard is closed, the iterator can't return more data, and <code>GetShardIterator</code> returns <code>null</code> for its <code>ShardIterator</code>. A shard can be closed using <a>SplitShard</a> or <a>MergeShards</a>.</p><p><code>GetShardIterator</code> has a limit of 5 transactions per second per account per open shard.</p>
 
 @param request A container for the necessary parameters to execute the GetShardIterator service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSKinesisErrorDomain` domain and the following error code: `AWSKinesisErrorResourceNotFound`, `AWSKinesisErrorInvalidArgument`, `AWSKinesisErrorProvisionedThroughputExceeded`.
 
 @see AWSKinesisGetShardIteratorInput
 @see AWSKinesisGetShardIteratorOutput
 */
- (void)getShardIterator:(AWSKinesisGetShardIteratorInput *)request completionHandler:(void (^ _Nullable)(AWSKinesisGetShardIteratorOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Lists your streams.</p><p> The number of streams may be too large to return from a single call to <code>ListStreams</code>. You can limit the number of returned streams using the <code>Limit</code> parameter. If you do not specify a value for the <code>Limit</code> parameter, Amazon Kinesis uses the default limit, which is currently 10.</p><p> You can detect if there are more streams available to list by using the <code>HasMoreStreams</code> flag from the returned output. If there are more streams available, you can request more streams by using the name of the last stream returned by the <code>ListStreams</code> request in the <code>ExclusiveStartStreamName</code> parameter in a subsequent request to <code>ListStreams</code>. The group of stream names returned by the subsequent request is then added to the list. You can continue this process until all the stream names have been collected in the list. </p><p><code>ListStreams</code> has a limit of 5 transactions per second per account.</p>
 
 @param request A container for the necessary parameters to execute the ListStreams service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSKinesisListStreamsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSKinesisErrorDomain` domain and the following error code: `AWSKinesisErrorLimitExceeded`.
 
 @see AWSKinesisListStreamsInput
 @see AWSKinesisListStreamsOutput
 */
- (AWSTask<AWSKinesisListStreamsOutput *> *)listStreams:(AWSKinesisListStreamsInput *)request;

/**
 <p> Lists your streams.</p><p> The number of streams may be too large to return from a single call to <code>ListStreams</code>. You can limit the number of returned streams using the <code>Limit</code> parameter. If you do not specify a value for the <code>Limit</code> parameter, Amazon Kinesis uses the default limit, which is currently 10.</p><p> You can detect if there are more streams available to list by using the <code>HasMoreStreams</code> flag from the returned output. If there are more streams available, you can request more streams by using the name of the last stream returned by the <code>ListStreams</code> request in the <code>ExclusiveStartStreamName</code> parameter in a subsequent request to <code>ListStreams</code>. The group of stream names returned by the subsequent request is then added to the list. You can continue this process until all the stream names have been collected in the list. </p><p><code>ListStreams</code> has a limit of 5 transactions per second per account.</p>
 
 @param request A container for the necessary parameters to execute the ListStreams service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSKinesisErrorDomain` domain and the following error code: `AWSKinesisErrorLimitExceeded`.
 
 @see AWSKinesisListStreamsInput
 @see AWSKinesisListStreamsOutput
 */
- (void)listStreams:(AWSKinesisListStreamsInput *)request completionHandler:(void (^ _Nullable)(AWSKinesisListStreamsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the tags for the specified Amazon Kinesis stream.</p>
 
 @param request A container for the necessary parameters to execute the ListTagsForStream service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSKinesisListTagsForStreamOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSKinesisErrorDomain` domain and the following error code: `AWSKinesisErrorResourceNotFound`, `AWSKinesisErrorInvalidArgument`, `AWSKinesisErrorLimitExceeded`.
 
 @see AWSKinesisListTagsForStreamInput
 @see AWSKinesisListTagsForStreamOutput
 */
- (AWSTask<AWSKinesisListTagsForStreamOutput *> *)listTagsForStream:(AWSKinesisListTagsForStreamInput *)request;

/**
 <p>Lists the tags for the specified Amazon Kinesis stream.</p>
 
 @param request A container for the necessary parameters to execute the ListTagsForStream service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSKinesisErrorDomain` domain and the following error code: `AWSKinesisErrorResourceNotFound`, `AWSKinesisErrorInvalidArgument`, `AWSKinesisErrorLimitExceeded`.
 
 @see AWSKinesisListTagsForStreamInput
 @see AWSKinesisListTagsForStreamOutput
 */
- (void)listTagsForStream:(AWSKinesisListTagsForStreamInput *)request completionHandler:(void (^ _Nullable)(AWSKinesisListTagsForStreamOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Merges two adjacent shards in a stream and combines them into a single shard to reduce the stream's capacity to ingest and transport data. Two shards are considered adjacent if the union of the hash key ranges for the two shards form a contiguous set with no gaps. For example, if you have two shards, one with a hash key range of 276...381 and the other with a hash key range of 382...454, then you could merge these two shards into a single shard that would have a hash key range of 276...454. After the merge, the single child shard receives data for all hash key values covered by the two parent shards.</p><p><code>MergeShards</code> is called when there is a need to reduce the overall capacity of a stream because of excess capacity that is not being used. You must specify the shard to be merged and the adjacent shard for a stream. For more information about merging shards, see <a href="http://docs.aws.amazon.com/kinesis/latest/dev/kinesis-using-api-java.html#kinesis-using-api-java-resharding-merge">Merge Two Shards</a> in the <i>Amazon Kinesis Developer Guide</i>.</p><p>If the stream is in the <code>ACTIVE</code> state, you can call <code>MergeShards</code>. If a stream is in the <code>CREATING</code>, <code>UPDATING</code>, or <code>DELETING</code> state, <code>MergeShards</code> returns a <code>ResourceInUseException</code>. If the specified stream does not exist, <code>MergeShards</code> returns a <code>ResourceNotFoundException</code>. </p><p>You can use <a>DescribeStream</a> to check the state of the stream, which is returned in <code>StreamStatus</code>.</p><p><code>MergeShards</code> is an asynchronous operation. Upon receiving a <code>MergeShards</code> request, Amazon Kinesis immediately returns a response and sets the <code>StreamStatus</code> to <code>UPDATING</code>. After the operation is completed, Amazon Kinesis sets the <code>StreamStatus</code> to <code>ACTIVE</code>. Read and write operations continue to work while the stream is in the <code>UPDATING</code> state. </p><p>You use <a>DescribeStream</a> to determine the shard IDs that are specified in the <code>MergeShards</code> request. </p><p>If you try to operate on too many streams in parallel using <a>CreateStream</a>, <a>DeleteStream</a>, <code>MergeShards</code> or <a>SplitShard</a>, you will receive a <code>LimitExceededException</code>. </p><p><code>MergeShards</code> has limit of 5 transactions per second per account.</p>
 
 @param request A container for the necessary parameters to execute the MergeShards service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSKinesisErrorDomain` domain and the following error code: `AWSKinesisErrorResourceNotFound`, `AWSKinesisErrorResourceInUse`, `AWSKinesisErrorInvalidArgument`, `AWSKinesisErrorLimitExceeded`.
 
 @see AWSKinesisMergeShardsInput
 */
- (AWSTask *)mergeShards:(AWSKinesisMergeShardsInput *)request;

/**
 <p>Merges two adjacent shards in a stream and combines them into a single shard to reduce the stream's capacity to ingest and transport data. Two shards are considered adjacent if the union of the hash key ranges for the two shards form a contiguous set with no gaps. For example, if you have two shards, one with a hash key range of 276...381 and the other with a hash key range of 382...454, then you could merge these two shards into a single shard that would have a hash key range of 276...454. After the merge, the single child shard receives data for all hash key values covered by the two parent shards.</p><p><code>MergeShards</code> is called when there is a need to reduce the overall capacity of a stream because of excess capacity that is not being used. You must specify the shard to be merged and the adjacent shard for a stream. For more information about merging shards, see <a href="http://docs.aws.amazon.com/kinesis/latest/dev/kinesis-using-api-java.html#kinesis-using-api-java-resharding-merge">Merge Two Shards</a> in the <i>Amazon Kinesis Developer Guide</i>.</p><p>If the stream is in the <code>ACTIVE</code> state, you can call <code>MergeShards</code>. If a stream is in the <code>CREATING</code>, <code>UPDATING</code>, or <code>DELETING</code> state, <code>MergeShards</code> returns a <code>ResourceInUseException</code>. If the specified stream does not exist, <code>MergeShards</code> returns a <code>ResourceNotFoundException</code>. </p><p>You can use <a>DescribeStream</a> to check the state of the stream, which is returned in <code>StreamStatus</code>.</p><p><code>MergeShards</code> is an asynchronous operation. Upon receiving a <code>MergeShards</code> request, Amazon Kinesis immediately returns a response and sets the <code>StreamStatus</code> to <code>UPDATING</code>. After the operation is completed, Amazon Kinesis sets the <code>StreamStatus</code> to <code>ACTIVE</code>. Read and write operations continue to work while the stream is in the <code>UPDATING</code> state. </p><p>You use <a>DescribeStream</a> to determine the shard IDs that are specified in the <code>MergeShards</code> request. </p><p>If you try to operate on too many streams in parallel using <a>CreateStream</a>, <a>DeleteStream</a>, <code>MergeShards</code> or <a>SplitShard</a>, you will receive a <code>LimitExceededException</code>. </p><p><code>MergeShards</code> has limit of 5 transactions per second per account.</p>
 
 @param request A container for the necessary parameters to execute the MergeShards service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSKinesisErrorDomain` domain and the following error code: `AWSKinesisErrorResourceNotFound`, `AWSKinesisErrorResourceInUse`, `AWSKinesisErrorInvalidArgument`, `AWSKinesisErrorLimitExceeded`.
 
 @see AWSKinesisMergeShardsInput
 */
- (void)mergeShards:(AWSKinesisMergeShardsInput *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Puts (writes) a single data record from a producer into an Amazon Kinesis stream. Call <code>PutRecord</code> to send data from the producer into the Amazon Kinesis stream for real-time ingestion and subsequent processing, one record at a time. Each shard can support up to 1000 records written per second, up to a maximum total of 1 MB data written per second.</p><p>You must specify the name of the stream that captures, stores, and transports the data; a partition key; and the data blob itself.</p><p>The data blob can be any type of data; for example, a segment from a log file, geographic/location data, website clickstream data, and so on.</p><p>The partition key is used by Amazon Kinesis to distribute data across shards. Amazon Kinesis segregates the data records that belong to a data stream into multiple shards, using the partition key associated with each data record to determine which shard a given data record belongs to. </p><p>Partition keys are Unicode strings, with a maximum length limit of 256 bytes. An MD5 hash function is used to map partition keys to 128-bit integer values and to map associated data records to shards using the hash key ranges of the shards. You can override hashing the partition key to determine the shard by explicitly specifying a hash value using the <code>ExplicitHashKey</code> parameter. For more information, see <a href="http://docs.aws.amazon.com/kinesis/latest/dev/kinesis-using-api-java.html#kinesis-using-api-defn-partition-key">Partition Key</a> in the <i>Amazon Kinesis Developer Guide</i>.</p><p><code>PutRecord</code> returns the shard ID of where the data record was placed and the sequence number that was assigned to the data record.</p><p>Sequence numbers generally increase over time. To guarantee strictly increasing ordering, use the <code>SequenceNumberForOrdering</code> parameter. For more information, see <a href="http://docs.aws.amazon.com/kinesis/latest/dev/kinesis-using-api-java.html#kinesis-using-api-defn-sequence-number">Sequence Number</a> in the <i>Amazon Kinesis Developer Guide</i>.</p><p>If a <code>PutRecord</code> request cannot be processed because of insufficient provisioned throughput on the shard involved in the request, <code>PutRecord</code> throws <code>ProvisionedThroughputExceededException</code>. </p><p>Data records are accessible for only 24 hours from the time that they are added to an Amazon Kinesis stream.</p>
 
 @param request A container for the necessary parameters to execute the PutRecord service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSKinesisPutRecordOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSKinesisErrorDomain` domain and the following error code: `AWSKinesisErrorResourceNotFound`, `AWSKinesisErrorInvalidArgument`, `AWSKinesisErrorProvisionedThroughputExceeded`.
 
 @see AWSKinesisPutRecordInput
 @see AWSKinesisPutRecordOutput
 */
- (AWSTask<AWSKinesisPutRecordOutput *> *)putRecord:(AWSKinesisPutRecordInput *)request;

/**
 <p>Puts (writes) a single data record from a producer into an Amazon Kinesis stream. Call <code>PutRecord</code> to send data from the producer into the Amazon Kinesis stream for real-time ingestion and subsequent processing, one record at a time. Each shard can support up to 1000 records written per second, up to a maximum total of 1 MB data written per second.</p><p>You must specify the name of the stream that captures, stores, and transports the data; a partition key; and the data blob itself.</p><p>The data blob can be any type of data; for example, a segment from a log file, geographic/location data, website clickstream data, and so on.</p><p>The partition key is used by Amazon Kinesis to distribute data across shards. Amazon Kinesis segregates the data records that belong to a data stream into multiple shards, using the partition key associated with each data record to determine which shard a given data record belongs to. </p><p>Partition keys are Unicode strings, with a maximum length limit of 256 bytes. An MD5 hash function is used to map partition keys to 128-bit integer values and to map associated data records to shards using the hash key ranges of the shards. You can override hashing the partition key to determine the shard by explicitly specifying a hash value using the <code>ExplicitHashKey</code> parameter. For more information, see <a href="http://docs.aws.amazon.com/kinesis/latest/dev/kinesis-using-api-java.html#kinesis-using-api-defn-partition-key">Partition Key</a> in the <i>Amazon Kinesis Developer Guide</i>.</p><p><code>PutRecord</code> returns the shard ID of where the data record was placed and the sequence number that was assigned to the data record.</p><p>Sequence numbers generally increase over time. To guarantee strictly increasing ordering, use the <code>SequenceNumberForOrdering</code> parameter. For more information, see <a href="http://docs.aws.amazon.com/kinesis/latest/dev/kinesis-using-api-java.html#kinesis-using-api-defn-sequence-number">Sequence Number</a> in the <i>Amazon Kinesis Developer Guide</i>.</p><p>If a <code>PutRecord</code> request cannot be processed because of insufficient provisioned throughput on the shard involved in the request, <code>PutRecord</code> throws <code>ProvisionedThroughputExceededException</code>. </p><p>Data records are accessible for only 24 hours from the time that they are added to an Amazon Kinesis stream.</p>
 
 @param request A container for the necessary parameters to execute the PutRecord service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSKinesisErrorDomain` domain and the following error code: `AWSKinesisErrorResourceNotFound`, `AWSKinesisErrorInvalidArgument`, `AWSKinesisErrorProvisionedThroughputExceeded`.
 
 @see AWSKinesisPutRecordInput
 @see AWSKinesisPutRecordOutput
 */
- (void)putRecord:(AWSKinesisPutRecordInput *)request completionHandler:(void (^ _Nullable)(AWSKinesisPutRecordOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Puts (writes) multiple data records from a producer into an Amazon Kinesis stream in a single call (also referred to as a <code>PutRecords</code> request). Use this operation to send data from a data producer into the Amazon Kinesis stream for real-time ingestion and processing. Each shard can support up to 1000 records written per second, up to a maximum total of 1 MB data written per second.</p><p>You must specify the name of the stream that captures, stores, and transports the data; and an array of request <code>Records</code>, with each record in the array requiring a partition key and data blob. </p><p>The data blob can be any type of data; for example, a segment from a log file, geographic/location data, website clickstream data, and so on.</p><p>The partition key is used by Amazon Kinesis as input to a hash function that maps the partition key and associated data to a specific shard. An MD5 hash function is used to map partition keys to 128-bit integer values and to map associated data records to shards. As a result of this hashing mechanism, all data records with the same partition key map to the same shard within the stream. For more information, see <a href="http://docs.aws.amazon.com/kinesis/latest/dev/kinesis-using-api-java.html#kinesis-using-api-defn-partition-key">Partition Key</a> in the <i>Amazon Kinesis Developer Guide</i>.</p><p>Each record in the <code>Records</code> array may include an optional parameter, <code>ExplicitHashKey</code>, which overrides the partition key to shard mapping. This parameter allows a data producer to determine explicitly the shard where the record is stored. For more information, see <a href="http://docs.aws.amazon.com/kinesis/latest/dev/kinesis-using-api-java.html#kinesis-using-api-putrecords">Adding Multiple Records with PutRecords</a> in the <i>Amazon Kinesis Developer Guide</i>.</p><p>The <code>PutRecords</code> response includes an array of response <code>Records</code>. Each record in the response array directly correlates with a record in the request array using natural ordering, from the top to the bottom of the request and response. The response <code>Records</code> array always includes the same number of records as the request array.</p><p>The response <code>Records</code> array includes both successfully and unsuccessfully processed records. Amazon Kinesis attempts to process all records in each <code>PutRecords</code> request. A single record failure does not stop the processing of subsequent records.</p><p>A successfully-processed record includes <code>ShardId</code> and <code>SequenceNumber</code> values. The <code>ShardId</code> parameter identifies the shard in the stream where the record is stored. The <code>SequenceNumber</code> parameter is an identifier assigned to the put record, unique to all records in the stream.</p><p>An unsuccessfully-processed record includes <code>ErrorCode</code> and <code>ErrorMessage</code> values. <code>ErrorCode</code> reflects the type of error and can be one of the following values: <code>ProvisionedThroughputExceededException</code> or <code>InternalFailure</code>. <code>ErrorMessage</code> provides more detailed information about the <code>ProvisionedThroughputExceededException</code> exception including the account ID, stream name, and shard ID of the record that was throttled.</p><p>Data records are accessible for only 24 hours from the time that they are added to an Amazon Kinesis stream.</p>
 
 @param request A container for the necessary parameters to execute the PutRecords service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSKinesisPutRecordsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSKinesisErrorDomain` domain and the following error code: `AWSKinesisErrorResourceNotFound`, `AWSKinesisErrorInvalidArgument`, `AWSKinesisErrorProvisionedThroughputExceeded`.
 
 @see AWSKinesisPutRecordsInput
 @see AWSKinesisPutRecordsOutput
 */
- (AWSTask<AWSKinesisPutRecordsOutput *> *)putRecords:(AWSKinesisPutRecordsInput *)request;

/**
 <p>Puts (writes) multiple data records from a producer into an Amazon Kinesis stream in a single call (also referred to as a <code>PutRecords</code> request). Use this operation to send data from a data producer into the Amazon Kinesis stream for real-time ingestion and processing. Each shard can support up to 1000 records written per second, up to a maximum total of 1 MB data written per second.</p><p>You must specify the name of the stream that captures, stores, and transports the data; and an array of request <code>Records</code>, with each record in the array requiring a partition key and data blob. </p><p>The data blob can be any type of data; for example, a segment from a log file, geographic/location data, website clickstream data, and so on.</p><p>The partition key is used by Amazon Kinesis as input to a hash function that maps the partition key and associated data to a specific shard. An MD5 hash function is used to map partition keys to 128-bit integer values and to map associated data records to shards. As a result of this hashing mechanism, all data records with the same partition key map to the same shard within the stream. For more information, see <a href="http://docs.aws.amazon.com/kinesis/latest/dev/kinesis-using-api-java.html#kinesis-using-api-defn-partition-key">Partition Key</a> in the <i>Amazon Kinesis Developer Guide</i>.</p><p>Each record in the <code>Records</code> array may include an optional parameter, <code>ExplicitHashKey</code>, which overrides the partition key to shard mapping. This parameter allows a data producer to determine explicitly the shard where the record is stored. For more information, see <a href="http://docs.aws.amazon.com/kinesis/latest/dev/kinesis-using-api-java.html#kinesis-using-api-putrecords">Adding Multiple Records with PutRecords</a> in the <i>Amazon Kinesis Developer Guide</i>.</p><p>The <code>PutRecords</code> response includes an array of response <code>Records</code>. Each record in the response array directly correlates with a record in the request array using natural ordering, from the top to the bottom of the request and response. The response <code>Records</code> array always includes the same number of records as the request array.</p><p>The response <code>Records</code> array includes both successfully and unsuccessfully processed records. Amazon Kinesis attempts to process all records in each <code>PutRecords</code> request. A single record failure does not stop the processing of subsequent records.</p><p>A successfully-processed record includes <code>ShardId</code> and <code>SequenceNumber</code> values. The <code>ShardId</code> parameter identifies the shard in the stream where the record is stored. The <code>SequenceNumber</code> parameter is an identifier assigned to the put record, unique to all records in the stream.</p><p>An unsuccessfully-processed record includes <code>ErrorCode</code> and <code>ErrorMessage</code> values. <code>ErrorCode</code> reflects the type of error and can be one of the following values: <code>ProvisionedThroughputExceededException</code> or <code>InternalFailure</code>. <code>ErrorMessage</code> provides more detailed information about the <code>ProvisionedThroughputExceededException</code> exception including the account ID, stream name, and shard ID of the record that was throttled.</p><p>Data records are accessible for only 24 hours from the time that they are added to an Amazon Kinesis stream.</p>
 
 @param request A container for the necessary parameters to execute the PutRecords service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSKinesisErrorDomain` domain and the following error code: `AWSKinesisErrorResourceNotFound`, `AWSKinesisErrorInvalidArgument`, `AWSKinesisErrorProvisionedThroughputExceeded`.
 
 @see AWSKinesisPutRecordsInput
 @see AWSKinesisPutRecordsOutput
 */
- (void)putRecords:(AWSKinesisPutRecordsInput *)request completionHandler:(void (^ _Nullable)(AWSKinesisPutRecordsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes tags from the specified Amazon Kinesis stream.</p><p>If you specify a tag that does not exist, it is ignored.</p>
 
 @param request A container for the necessary parameters to execute the RemoveTagsFromStream service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSKinesisErrorDomain` domain and the following error code: `AWSKinesisErrorResourceNotFound`, `AWSKinesisErrorResourceInUse`, `AWSKinesisErrorInvalidArgument`, `AWSKinesisErrorLimitExceeded`.
 
 @see AWSKinesisRemoveTagsFromStreamInput
 */
- (AWSTask *)removeTagsFromStream:(AWSKinesisRemoveTagsFromStreamInput *)request;

/**
 <p>Deletes tags from the specified Amazon Kinesis stream.</p><p>If you specify a tag that does not exist, it is ignored.</p>
 
 @param request A container for the necessary parameters to execute the RemoveTagsFromStream service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSKinesisErrorDomain` domain and the following error code: `AWSKinesisErrorResourceNotFound`, `AWSKinesisErrorResourceInUse`, `AWSKinesisErrorInvalidArgument`, `AWSKinesisErrorLimitExceeded`.
 
 @see AWSKinesisRemoveTagsFromStreamInput
 */
- (void)removeTagsFromStream:(AWSKinesisRemoveTagsFromStreamInput *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Splits a shard into two new shards in the stream, to increase the stream's capacity to ingest and transport data. <code>SplitShard</code> is called when there is a need to increase the overall capacity of stream because of an expected increase in the volume of data records being ingested. </p><p>You can also use <code>SplitShard</code> when a shard appears to be approaching its maximum utilization, for example, when the set of producers sending data into the specific shard are suddenly sending more than previously anticipated. You can also call <code>SplitShard</code> to increase stream capacity, so that more Amazon Kinesis applications can simultaneously read data from the stream for real-time processing. </p><p>You must specify the shard to be split and the new hash key, which is the position in the shard where the shard gets split in two. In many cases, the new hash key might simply be the average of the beginning and ending hash key, but it can be any hash key value in the range being mapped into the shard. For more information about splitting shards, see <a href="http://docs.aws.amazon.com/kinesis/latest/dev/kinesis-using-api-java.html#kinesis-using-api-java-resharding-split">Split a Shard</a> in the <i>Amazon Kinesis Developer Guide</i>.</p><p>You can use <a>DescribeStream</a> to determine the shard ID and hash key values for the <code>ShardToSplit</code> and <code>NewStartingHashKey</code> parameters that are specified in the <code>SplitShard</code> request.</p><p><code>SplitShard</code> is an asynchronous operation. Upon receiving a <code>SplitShard</code> request, Amazon Kinesis immediately returns a response and sets the stream status to <code>UPDATING</code>. After the operation is completed, Amazon Kinesis sets the stream status to <code>ACTIVE</code>. Read and write operations continue to work while the stream is in the <code>UPDATING</code> state. </p><p>You can use <code>DescribeStream</code> to check the status of the stream, which is returned in <code>StreamStatus</code>. If the stream is in the <code>ACTIVE</code> state, you can call <code>SplitShard</code>. If a stream is in <code>CREATING</code> or <code>UPDATING</code> or <code>DELETING</code> states, <code>DescribeStream</code> returns a <code>ResourceInUseException</code>.</p><p>If the specified stream does not exist, <code>DescribeStream</code> returns a <code>ResourceNotFoundException</code>. If you try to create more shards than are authorized for your account, you receive a <code>LimitExceededException</code>. </p><p>The default limit for an AWS account is 10 shards per stream. If you need to create a stream with more than 10 shards, <a href="http://docs.aws.amazon.com/general/latest/gr/aws_service_limits.html">contact AWS Support</a> to increase the limit on your account.</p><p>If you try to operate on too many streams in parallel using <a>CreateStream</a>, <a>DeleteStream</a>, <a>MergeShards</a> or <a>SplitShard</a>, you receive a <code>LimitExceededException</code>. </p><p><code>SplitShard</code> has limit of 5 transactions per second per account.</p>
 
 @param request A container for the necessary parameters to execute the SplitShard service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSKinesisErrorDomain` domain and the following error code: `AWSKinesisErrorResourceNotFound`, `AWSKinesisErrorResourceInUse`, `AWSKinesisErrorInvalidArgument`, `AWSKinesisErrorLimitExceeded`.
 
 @see AWSKinesisSplitShardInput
 */
- (AWSTask *)splitShard:(AWSKinesisSplitShardInput *)request;

/**
 <p>Splits a shard into two new shards in the stream, to increase the stream's capacity to ingest and transport data. <code>SplitShard</code> is called when there is a need to increase the overall capacity of stream because of an expected increase in the volume of data records being ingested. </p><p>You can also use <code>SplitShard</code> when a shard appears to be approaching its maximum utilization, for example, when the set of producers sending data into the specific shard are suddenly sending more than previously anticipated. You can also call <code>SplitShard</code> to increase stream capacity, so that more Amazon Kinesis applications can simultaneously read data from the stream for real-time processing. </p><p>You must specify the shard to be split and the new hash key, which is the position in the shard where the shard gets split in two. In many cases, the new hash key might simply be the average of the beginning and ending hash key, but it can be any hash key value in the range being mapped into the shard. For more information about splitting shards, see <a href="http://docs.aws.amazon.com/kinesis/latest/dev/kinesis-using-api-java.html#kinesis-using-api-java-resharding-split">Split a Shard</a> in the <i>Amazon Kinesis Developer Guide</i>.</p><p>You can use <a>DescribeStream</a> to determine the shard ID and hash key values for the <code>ShardToSplit</code> and <code>NewStartingHashKey</code> parameters that are specified in the <code>SplitShard</code> request.</p><p><code>SplitShard</code> is an asynchronous operation. Upon receiving a <code>SplitShard</code> request, Amazon Kinesis immediately returns a response and sets the stream status to <code>UPDATING</code>. After the operation is completed, Amazon Kinesis sets the stream status to <code>ACTIVE</code>. Read and write operations continue to work while the stream is in the <code>UPDATING</code> state. </p><p>You can use <code>DescribeStream</code> to check the status of the stream, which is returned in <code>StreamStatus</code>. If the stream is in the <code>ACTIVE</code> state, you can call <code>SplitShard</code>. If a stream is in <code>CREATING</code> or <code>UPDATING</code> or <code>DELETING</code> states, <code>DescribeStream</code> returns a <code>ResourceInUseException</code>.</p><p>If the specified stream does not exist, <code>DescribeStream</code> returns a <code>ResourceNotFoundException</code>. If you try to create more shards than are authorized for your account, you receive a <code>LimitExceededException</code>. </p><p>The default limit for an AWS account is 10 shards per stream. If you need to create a stream with more than 10 shards, <a href="http://docs.aws.amazon.com/general/latest/gr/aws_service_limits.html">contact AWS Support</a> to increase the limit on your account.</p><p>If you try to operate on too many streams in parallel using <a>CreateStream</a>, <a>DeleteStream</a>, <a>MergeShards</a> or <a>SplitShard</a>, you receive a <code>LimitExceededException</code>. </p><p><code>SplitShard</code> has limit of 5 transactions per second per account.</p>
 
 @param request A container for the necessary parameters to execute the SplitShard service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSKinesisErrorDomain` domain and the following error code: `AWSKinesisErrorResourceNotFound`, `AWSKinesisErrorResourceInUse`, `AWSKinesisErrorInvalidArgument`, `AWSKinesisErrorLimitExceeded`.
 
 @see AWSKinesisSplitShardInput
 */
- (void)splitShard:(AWSKinesisSplitShardInput *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
