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
#import "AWSQldbModel.h"
#import "AWSQldbResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSQldb
FOUNDATION_EXPORT NSString *const AWSQldbSDKVersion;

/**
 <p>The control plane for Amazon QLDB</p>
 */
@interface AWSQldb : AWSService

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

     let Qldb = AWSQldb.default()

 *Objective-C*

     AWSQldb *Qldb = [AWSQldb defaultQldb];

 @return The default service client.
 */
+ (instancetype)defaultQldb;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSQldb.register(with: configuration!, forKey: "USWest2Qldb")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSQldb registerQldbWithConfiguration:configuration forKey:@"USWest2Qldb"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Qldb = AWSQldb(forKey: "USWest2Qldb")

 *Objective-C*

     AWSQldb *Qldb = [AWSQldb QldbForKey:@"USWest2Qldb"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerQldbWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerQldbWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSQldb.register(with: configuration!, forKey: "USWest2Qldb")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSQldb registerQldbWithConfiguration:configuration forKey:@"USWest2Qldb"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Qldb = AWSQldb(forKey: "USWest2Qldb")

 *Objective-C*

     AWSQldb *Qldb = [AWSQldb QldbForKey:@"USWest2Qldb"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)QldbForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removeQldbForKey:(NSString *)key;

/**
 <p>Ends a given Amazon QLDB journal stream. Before a stream can be canceled, its current status must be <code>ACTIVE</code>.</p><p>You can't restart a stream after you cancel it. Canceled QLDB stream resources are subject to a 7-day retention period, so they are automatically deleted after this limit expires.</p>
 
 @param request A container for the necessary parameters to execute the CancelJournalKinesisStream service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSQldbCancelJournalKinesisStreamResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSQldbErrorDomain` domain and the following error code: `AWSQldbErrorInvalidParameter`, `AWSQldbErrorResourceNotFound`, `AWSQldbErrorResourcePreconditionNotMet`.
 
 @see AWSQldbCancelJournalKinesisStreamRequest
 @see AWSQldbCancelJournalKinesisStreamResponse
 */
- (AWSTask<AWSQldbCancelJournalKinesisStreamResponse *> *)cancelJournalKinesisStream:(AWSQldbCancelJournalKinesisStreamRequest *)request;

/**
 <p>Ends a given Amazon QLDB journal stream. Before a stream can be canceled, its current status must be <code>ACTIVE</code>.</p><p>You can't restart a stream after you cancel it. Canceled QLDB stream resources are subject to a 7-day retention period, so they are automatically deleted after this limit expires.</p>
 
 @param request A container for the necessary parameters to execute the CancelJournalKinesisStream service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSQldbErrorDomain` domain and the following error code: `AWSQldbErrorInvalidParameter`, `AWSQldbErrorResourceNotFound`, `AWSQldbErrorResourcePreconditionNotMet`.
 
 @see AWSQldbCancelJournalKinesisStreamRequest
 @see AWSQldbCancelJournalKinesisStreamResponse
 */
- (void)cancelJournalKinesisStream:(AWSQldbCancelJournalKinesisStreamRequest *)request completionHandler:(void (^ _Nullable)(AWSQldbCancelJournalKinesisStreamResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new ledger in your AWS account.</p>
 
 @param request A container for the necessary parameters to execute the CreateLedger service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSQldbCreateLedgerResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSQldbErrorDomain` domain and the following error code: `AWSQldbErrorInvalidParameter`, `AWSQldbErrorResourceAlreadyExists`, `AWSQldbErrorLimitExceeded`, `AWSQldbErrorResourceInUse`.
 
 @see AWSQldbCreateLedgerRequest
 @see AWSQldbCreateLedgerResponse
 */
- (AWSTask<AWSQldbCreateLedgerResponse *> *)createLedger:(AWSQldbCreateLedgerRequest *)request;

/**
 <p>Creates a new ledger in your AWS account.</p>
 
 @param request A container for the necessary parameters to execute the CreateLedger service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSQldbErrorDomain` domain and the following error code: `AWSQldbErrorInvalidParameter`, `AWSQldbErrorResourceAlreadyExists`, `AWSQldbErrorLimitExceeded`, `AWSQldbErrorResourceInUse`.
 
 @see AWSQldbCreateLedgerRequest
 @see AWSQldbCreateLedgerResponse
 */
- (void)createLedger:(AWSQldbCreateLedgerRequest *)request completionHandler:(void (^ _Nullable)(AWSQldbCreateLedgerResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a ledger and all of its contents. This action is irreversible.</p><p>If deletion protection is enabled, you must first disable it before you can delete the ledger using the QLDB API or the AWS Command Line Interface (AWS CLI). You can disable it by calling the <code>UpdateLedger</code> operation to set the flag to <code>false</code>. The QLDB console disables deletion protection for you when you use it to delete a ledger.</p>
 
 @param request A container for the necessary parameters to execute the DeleteLedger service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSQldbErrorDomain` domain and the following error code: `AWSQldbErrorInvalidParameter`, `AWSQldbErrorResourceNotFound`, `AWSQldbErrorResourceInUse`, `AWSQldbErrorResourcePreconditionNotMet`.
 
 @see AWSQldbDeleteLedgerRequest
 */
- (AWSTask *)deleteLedger:(AWSQldbDeleteLedgerRequest *)request;

/**
 <p>Deletes a ledger and all of its contents. This action is irreversible.</p><p>If deletion protection is enabled, you must first disable it before you can delete the ledger using the QLDB API or the AWS Command Line Interface (AWS CLI). You can disable it by calling the <code>UpdateLedger</code> operation to set the flag to <code>false</code>. The QLDB console disables deletion protection for you when you use it to delete a ledger.</p>
 
 @param request A container for the necessary parameters to execute the DeleteLedger service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSQldbErrorDomain` domain and the following error code: `AWSQldbErrorInvalidParameter`, `AWSQldbErrorResourceNotFound`, `AWSQldbErrorResourceInUse`, `AWSQldbErrorResourcePreconditionNotMet`.
 
 @see AWSQldbDeleteLedgerRequest
 */
- (void)deleteLedger:(AWSQldbDeleteLedgerRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Returns detailed information about a given Amazon QLDB journal stream. The output includes the Amazon Resource Name (ARN), stream name, current status, creation time, and the parameters of your original stream creation request.</p>
 
 @param request A container for the necessary parameters to execute the DescribeJournalKinesisStream service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSQldbDescribeJournalKinesisStreamResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSQldbErrorDomain` domain and the following error code: `AWSQldbErrorInvalidParameter`, `AWSQldbErrorResourceNotFound`, `AWSQldbErrorResourcePreconditionNotMet`.
 
 @see AWSQldbDescribeJournalKinesisStreamRequest
 @see AWSQldbDescribeJournalKinesisStreamResponse
 */
- (AWSTask<AWSQldbDescribeJournalKinesisStreamResponse *> *)describeJournalKinesisStream:(AWSQldbDescribeJournalKinesisStreamRequest *)request;

/**
 <p>Returns detailed information about a given Amazon QLDB journal stream. The output includes the Amazon Resource Name (ARN), stream name, current status, creation time, and the parameters of your original stream creation request.</p>
 
 @param request A container for the necessary parameters to execute the DescribeJournalKinesisStream service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSQldbErrorDomain` domain and the following error code: `AWSQldbErrorInvalidParameter`, `AWSQldbErrorResourceNotFound`, `AWSQldbErrorResourcePreconditionNotMet`.
 
 @see AWSQldbDescribeJournalKinesisStreamRequest
 @see AWSQldbDescribeJournalKinesisStreamResponse
 */
- (void)describeJournalKinesisStream:(AWSQldbDescribeJournalKinesisStreamRequest *)request completionHandler:(void (^ _Nullable)(AWSQldbDescribeJournalKinesisStreamResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about a journal export job, including the ledger name, export ID, when it was created, current status, and its start and end time export parameters.</p><p>This action does not return any expired export jobs. For more information, see <a href="https://docs.aws.amazon.com/qldb/latest/developerguide/export-journal.request.html#export-journal.request.expiration">Export Job Expiration</a> in the <i>Amazon QLDB Developer Guide</i>.</p><p>If the export job with the given <code>ExportId</code> doesn't exist, then throws <code>ResourceNotFoundException</code>.</p><p>If the ledger with the given <code>Name</code> doesn't exist, then throws <code>ResourceNotFoundException</code>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeJournalS3Export service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSQldbDescribeJournalS3ExportResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSQldbErrorDomain` domain and the following error code: `AWSQldbErrorResourceNotFound`.
 
 @see AWSQldbDescribeJournalS3ExportRequest
 @see AWSQldbDescribeJournalS3ExportResponse
 */
- (AWSTask<AWSQldbDescribeJournalS3ExportResponse *> *)describeJournalS3Export:(AWSQldbDescribeJournalS3ExportRequest *)request;

/**
 <p>Returns information about a journal export job, including the ledger name, export ID, when it was created, current status, and its start and end time export parameters.</p><p>This action does not return any expired export jobs. For more information, see <a href="https://docs.aws.amazon.com/qldb/latest/developerguide/export-journal.request.html#export-journal.request.expiration">Export Job Expiration</a> in the <i>Amazon QLDB Developer Guide</i>.</p><p>If the export job with the given <code>ExportId</code> doesn't exist, then throws <code>ResourceNotFoundException</code>.</p><p>If the ledger with the given <code>Name</code> doesn't exist, then throws <code>ResourceNotFoundException</code>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeJournalS3Export service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSQldbErrorDomain` domain and the following error code: `AWSQldbErrorResourceNotFound`.
 
 @see AWSQldbDescribeJournalS3ExportRequest
 @see AWSQldbDescribeJournalS3ExportResponse
 */
- (void)describeJournalS3Export:(AWSQldbDescribeJournalS3ExportRequest *)request completionHandler:(void (^ _Nullable)(AWSQldbDescribeJournalS3ExportResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about a ledger, including its state and when it was created.</p>
 
 @param request A container for the necessary parameters to execute the DescribeLedger service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSQldbDescribeLedgerResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSQldbErrorDomain` domain and the following error code: `AWSQldbErrorInvalidParameter`, `AWSQldbErrorResourceNotFound`.
 
 @see AWSQldbDescribeLedgerRequest
 @see AWSQldbDescribeLedgerResponse
 */
- (AWSTask<AWSQldbDescribeLedgerResponse *> *)describeLedger:(AWSQldbDescribeLedgerRequest *)request;

/**
 <p>Returns information about a ledger, including its state and when it was created.</p>
 
 @param request A container for the necessary parameters to execute the DescribeLedger service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSQldbErrorDomain` domain and the following error code: `AWSQldbErrorInvalidParameter`, `AWSQldbErrorResourceNotFound`.
 
 @see AWSQldbDescribeLedgerRequest
 @see AWSQldbDescribeLedgerResponse
 */
- (void)describeLedger:(AWSQldbDescribeLedgerRequest *)request completionHandler:(void (^ _Nullable)(AWSQldbDescribeLedgerResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Exports journal contents within a date and time range from a ledger into a specified Amazon Simple Storage Service (Amazon S3) bucket. The data is written as files in Amazon Ion format.</p><p>If the ledger with the given <code>Name</code> doesn't exist, then throws <code>ResourceNotFoundException</code>.</p><p>If the ledger with the given <code>Name</code> is in <code>CREATING</code> status, then throws <code>ResourcePreconditionNotMetException</code>.</p><p>You can initiate up to two concurrent journal export requests for each ledger. Beyond this limit, journal export requests throw <code>LimitExceededException</code>.</p>
 
 @param request A container for the necessary parameters to execute the ExportJournalToS3 service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSQldbExportJournalToS3Response`. On failed execution, `task.error` may contain an `NSError` with `AWSQldbErrorDomain` domain and the following error code: `AWSQldbErrorResourceNotFound`, `AWSQldbErrorResourcePreconditionNotMet`.
 
 @see AWSQldbExportJournalToS3Request
 @see AWSQldbExportJournalToS3Response
 */
- (AWSTask<AWSQldbExportJournalToS3Response *> *)exportJournalToS3:(AWSQldbExportJournalToS3Request *)request;

/**
 <p>Exports journal contents within a date and time range from a ledger into a specified Amazon Simple Storage Service (Amazon S3) bucket. The data is written as files in Amazon Ion format.</p><p>If the ledger with the given <code>Name</code> doesn't exist, then throws <code>ResourceNotFoundException</code>.</p><p>If the ledger with the given <code>Name</code> is in <code>CREATING</code> status, then throws <code>ResourcePreconditionNotMetException</code>.</p><p>You can initiate up to two concurrent journal export requests for each ledger. Beyond this limit, journal export requests throw <code>LimitExceededException</code>.</p>
 
 @param request A container for the necessary parameters to execute the ExportJournalToS3 service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSQldbErrorDomain` domain and the following error code: `AWSQldbErrorResourceNotFound`, `AWSQldbErrorResourcePreconditionNotMet`.
 
 @see AWSQldbExportJournalToS3Request
 @see AWSQldbExportJournalToS3Response
 */
- (void)exportJournalToS3:(AWSQldbExportJournalToS3Request *)request completionHandler:(void (^ _Nullable)(AWSQldbExportJournalToS3Response * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a block object at a specified address in a journal. Also returns a proof of the specified block for verification if <code>DigestTipAddress</code> is provided.</p><p>For information about the data contents in a block, see <a href="https://docs.aws.amazon.com/qldb/latest/developerguide/journal-contents.html">Journal contents</a> in the <i>Amazon QLDB Developer Guide</i>.</p><p>If the specified ledger doesn't exist or is in <code>DELETING</code> status, then throws <code>ResourceNotFoundException</code>.</p><p>If the specified ledger is in <code>CREATING</code> status, then throws <code>ResourcePreconditionNotMetException</code>.</p><p>If no block exists with the specified address, then throws <code>InvalidParameterException</code>.</p>
 
 @param request A container for the necessary parameters to execute the GetBlock service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSQldbGetBlockResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSQldbErrorDomain` domain and the following error code: `AWSQldbErrorInvalidParameter`, `AWSQldbErrorResourceNotFound`, `AWSQldbErrorResourcePreconditionNotMet`.
 
 @see AWSQldbGetBlockRequest
 @see AWSQldbGetBlockResponse
 */
- (AWSTask<AWSQldbGetBlockResponse *> *)getBlock:(AWSQldbGetBlockRequest *)request;

/**
 <p>Returns a block object at a specified address in a journal. Also returns a proof of the specified block for verification if <code>DigestTipAddress</code> is provided.</p><p>For information about the data contents in a block, see <a href="https://docs.aws.amazon.com/qldb/latest/developerguide/journal-contents.html">Journal contents</a> in the <i>Amazon QLDB Developer Guide</i>.</p><p>If the specified ledger doesn't exist or is in <code>DELETING</code> status, then throws <code>ResourceNotFoundException</code>.</p><p>If the specified ledger is in <code>CREATING</code> status, then throws <code>ResourcePreconditionNotMetException</code>.</p><p>If no block exists with the specified address, then throws <code>InvalidParameterException</code>.</p>
 
 @param request A container for the necessary parameters to execute the GetBlock service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSQldbErrorDomain` domain and the following error code: `AWSQldbErrorInvalidParameter`, `AWSQldbErrorResourceNotFound`, `AWSQldbErrorResourcePreconditionNotMet`.
 
 @see AWSQldbGetBlockRequest
 @see AWSQldbGetBlockResponse
 */
- (void)getBlock:(AWSQldbGetBlockRequest *)request completionHandler:(void (^ _Nullable)(AWSQldbGetBlockResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the digest of a ledger at the latest committed block in the journal. The response includes a 256-bit hash value and a block address.</p>
 
 @param request A container for the necessary parameters to execute the GetDigest service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSQldbGetDigestResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSQldbErrorDomain` domain and the following error code: `AWSQldbErrorInvalidParameter`, `AWSQldbErrorResourceNotFound`, `AWSQldbErrorResourcePreconditionNotMet`.
 
 @see AWSQldbGetDigestRequest
 @see AWSQldbGetDigestResponse
 */
- (AWSTask<AWSQldbGetDigestResponse *> *)getDigest:(AWSQldbGetDigestRequest *)request;

/**
 <p>Returns the digest of a ledger at the latest committed block in the journal. The response includes a 256-bit hash value and a block address.</p>
 
 @param request A container for the necessary parameters to execute the GetDigest service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSQldbErrorDomain` domain and the following error code: `AWSQldbErrorInvalidParameter`, `AWSQldbErrorResourceNotFound`, `AWSQldbErrorResourcePreconditionNotMet`.
 
 @see AWSQldbGetDigestRequest
 @see AWSQldbGetDigestResponse
 */
- (void)getDigest:(AWSQldbGetDigestRequest *)request completionHandler:(void (^ _Nullable)(AWSQldbGetDigestResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a revision data object for a specified document ID and block address. Also returns a proof of the specified revision for verification if <code>DigestTipAddress</code> is provided.</p>
 
 @param request A container for the necessary parameters to execute the GetRevision service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSQldbGetRevisionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSQldbErrorDomain` domain and the following error code: `AWSQldbErrorInvalidParameter`, `AWSQldbErrorResourceNotFound`, `AWSQldbErrorResourcePreconditionNotMet`.
 
 @see AWSQldbGetRevisionRequest
 @see AWSQldbGetRevisionResponse
 */
- (AWSTask<AWSQldbGetRevisionResponse *> *)getRevision:(AWSQldbGetRevisionRequest *)request;

/**
 <p>Returns a revision data object for a specified document ID and block address. Also returns a proof of the specified revision for verification if <code>DigestTipAddress</code> is provided.</p>
 
 @param request A container for the necessary parameters to execute the GetRevision service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSQldbErrorDomain` domain and the following error code: `AWSQldbErrorInvalidParameter`, `AWSQldbErrorResourceNotFound`, `AWSQldbErrorResourcePreconditionNotMet`.
 
 @see AWSQldbGetRevisionRequest
 @see AWSQldbGetRevisionResponse
 */
- (void)getRevision:(AWSQldbGetRevisionRequest *)request completionHandler:(void (^ _Nullable)(AWSQldbGetRevisionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns an array of all Amazon QLDB journal stream descriptors for a given ledger. The output of each stream descriptor includes the same details that are returned by <code>DescribeJournalKinesisStream</code>.</p><p>This action returns a maximum of <code>MaxResults</code> items. It is paginated so that you can retrieve all the items by calling <code>ListJournalKinesisStreamsForLedger</code> multiple times.</p>
 
 @param request A container for the necessary parameters to execute the ListJournalKinesisStreamsForLedger service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSQldbListJournalKinesisStreamsForLedgerResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSQldbErrorDomain` domain and the following error code: `AWSQldbErrorInvalidParameter`, `AWSQldbErrorResourceNotFound`, `AWSQldbErrorResourcePreconditionNotMet`.
 
 @see AWSQldbListJournalKinesisStreamsForLedgerRequest
 @see AWSQldbListJournalKinesisStreamsForLedgerResponse
 */
- (AWSTask<AWSQldbListJournalKinesisStreamsForLedgerResponse *> *)listJournalKinesisStreamsForLedger:(AWSQldbListJournalKinesisStreamsForLedgerRequest *)request;

/**
 <p>Returns an array of all Amazon QLDB journal stream descriptors for a given ledger. The output of each stream descriptor includes the same details that are returned by <code>DescribeJournalKinesisStream</code>.</p><p>This action returns a maximum of <code>MaxResults</code> items. It is paginated so that you can retrieve all the items by calling <code>ListJournalKinesisStreamsForLedger</code> multiple times.</p>
 
 @param request A container for the necessary parameters to execute the ListJournalKinesisStreamsForLedger service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSQldbErrorDomain` domain and the following error code: `AWSQldbErrorInvalidParameter`, `AWSQldbErrorResourceNotFound`, `AWSQldbErrorResourcePreconditionNotMet`.
 
 @see AWSQldbListJournalKinesisStreamsForLedgerRequest
 @see AWSQldbListJournalKinesisStreamsForLedgerResponse
 */
- (void)listJournalKinesisStreamsForLedger:(AWSQldbListJournalKinesisStreamsForLedgerRequest *)request completionHandler:(void (^ _Nullable)(AWSQldbListJournalKinesisStreamsForLedgerResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns an array of journal export job descriptions for all ledgers that are associated with the current AWS account and Region.</p><p>This action returns a maximum of <code>MaxResults</code> items, and is paginated so that you can retrieve all the items by calling <code>ListJournalS3Exports</code> multiple times.</p><p>This action does not return any expired export jobs. For more information, see <a href="https://docs.aws.amazon.com/qldb/latest/developerguide/export-journal.request.html#export-journal.request.expiration">Export Job Expiration</a> in the <i>Amazon QLDB Developer Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the ListJournalS3Exports service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSQldbListJournalS3ExportsResponse`.
 
 @see AWSQldbListJournalS3ExportsRequest
 @see AWSQldbListJournalS3ExportsResponse
 */
- (AWSTask<AWSQldbListJournalS3ExportsResponse *> *)listJournalS3Exports:(AWSQldbListJournalS3ExportsRequest *)request;

/**
 <p>Returns an array of journal export job descriptions for all ledgers that are associated with the current AWS account and Region.</p><p>This action returns a maximum of <code>MaxResults</code> items, and is paginated so that you can retrieve all the items by calling <code>ListJournalS3Exports</code> multiple times.</p><p>This action does not return any expired export jobs. For more information, see <a href="https://docs.aws.amazon.com/qldb/latest/developerguide/export-journal.request.html#export-journal.request.expiration">Export Job Expiration</a> in the <i>Amazon QLDB Developer Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the ListJournalS3Exports service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSQldbListJournalS3ExportsRequest
 @see AWSQldbListJournalS3ExportsResponse
 */
- (void)listJournalS3Exports:(AWSQldbListJournalS3ExportsRequest *)request completionHandler:(void (^ _Nullable)(AWSQldbListJournalS3ExportsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns an array of journal export job descriptions for a specified ledger.</p><p>This action returns a maximum of <code>MaxResults</code> items, and is paginated so that you can retrieve all the items by calling <code>ListJournalS3ExportsForLedger</code> multiple times.</p><p>This action does not return any expired export jobs. For more information, see <a href="https://docs.aws.amazon.com/qldb/latest/developerguide/export-journal.request.html#export-journal.request.expiration">Export Job Expiration</a> in the <i>Amazon QLDB Developer Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the ListJournalS3ExportsForLedger service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSQldbListJournalS3ExportsForLedgerResponse`.
 
 @see AWSQldbListJournalS3ExportsForLedgerRequest
 @see AWSQldbListJournalS3ExportsForLedgerResponse
 */
- (AWSTask<AWSQldbListJournalS3ExportsForLedgerResponse *> *)listJournalS3ExportsForLedger:(AWSQldbListJournalS3ExportsForLedgerRequest *)request;

/**
 <p>Returns an array of journal export job descriptions for a specified ledger.</p><p>This action returns a maximum of <code>MaxResults</code> items, and is paginated so that you can retrieve all the items by calling <code>ListJournalS3ExportsForLedger</code> multiple times.</p><p>This action does not return any expired export jobs. For more information, see <a href="https://docs.aws.amazon.com/qldb/latest/developerguide/export-journal.request.html#export-journal.request.expiration">Export Job Expiration</a> in the <i>Amazon QLDB Developer Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the ListJournalS3ExportsForLedger service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSQldbListJournalS3ExportsForLedgerRequest
 @see AWSQldbListJournalS3ExportsForLedgerResponse
 */
- (void)listJournalS3ExportsForLedger:(AWSQldbListJournalS3ExportsForLedgerRequest *)request completionHandler:(void (^ _Nullable)(AWSQldbListJournalS3ExportsForLedgerResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns an array of ledger summaries that are associated with the current AWS account and Region.</p><p>This action returns a maximum of 100 items and is paginated so that you can retrieve all the items by calling <code>ListLedgers</code> multiple times.</p>
 
 @param request A container for the necessary parameters to execute the ListLedgers service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSQldbListLedgersResponse`.
 
 @see AWSQldbListLedgersRequest
 @see AWSQldbListLedgersResponse
 */
- (AWSTask<AWSQldbListLedgersResponse *> *)listLedgers:(AWSQldbListLedgersRequest *)request;

/**
 <p>Returns an array of ledger summaries that are associated with the current AWS account and Region.</p><p>This action returns a maximum of 100 items and is paginated so that you can retrieve all the items by calling <code>ListLedgers</code> multiple times.</p>
 
 @param request A container for the necessary parameters to execute the ListLedgers service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSQldbListLedgersRequest
 @see AWSQldbListLedgersResponse
 */
- (void)listLedgers:(AWSQldbListLedgersRequest *)request completionHandler:(void (^ _Nullable)(AWSQldbListLedgersResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns all tags for a specified Amazon QLDB resource.</p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSQldbListTagsForResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSQldbErrorDomain` domain and the following error code: `AWSQldbErrorInvalidParameter`, `AWSQldbErrorResourceNotFound`.
 
 @see AWSQldbListTagsForResourceRequest
 @see AWSQldbListTagsForResourceResponse
 */
- (AWSTask<AWSQldbListTagsForResourceResponse *> *)listTagsForResource:(AWSQldbListTagsForResourceRequest *)request;

/**
 <p>Returns all tags for a specified Amazon QLDB resource.</p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSQldbErrorDomain` domain and the following error code: `AWSQldbErrorInvalidParameter`, `AWSQldbErrorResourceNotFound`.
 
 @see AWSQldbListTagsForResourceRequest
 @see AWSQldbListTagsForResourceResponse
 */
- (void)listTagsForResource:(AWSQldbListTagsForResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSQldbListTagsForResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a journal stream for a given Amazon QLDB ledger. The stream captures every document revision that is committed to the ledger's journal and delivers the data to a specified Amazon Kinesis Data Streams resource.</p>
 
 @param request A container for the necessary parameters to execute the StreamJournalToKinesis service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSQldbStreamJournalToKinesisResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSQldbErrorDomain` domain and the following error code: `AWSQldbErrorInvalidParameter`, `AWSQldbErrorResourceNotFound`, `AWSQldbErrorResourcePreconditionNotMet`.
 
 @see AWSQldbStreamJournalToKinesisRequest
 @see AWSQldbStreamJournalToKinesisResponse
 */
- (AWSTask<AWSQldbStreamJournalToKinesisResponse *> *)streamJournalToKinesis:(AWSQldbStreamJournalToKinesisRequest *)request;

/**
 <p>Creates a journal stream for a given Amazon QLDB ledger. The stream captures every document revision that is committed to the ledger's journal and delivers the data to a specified Amazon Kinesis Data Streams resource.</p>
 
 @param request A container for the necessary parameters to execute the StreamJournalToKinesis service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSQldbErrorDomain` domain and the following error code: `AWSQldbErrorInvalidParameter`, `AWSQldbErrorResourceNotFound`, `AWSQldbErrorResourcePreconditionNotMet`.
 
 @see AWSQldbStreamJournalToKinesisRequest
 @see AWSQldbStreamJournalToKinesisResponse
 */
- (void)streamJournalToKinesis:(AWSQldbStreamJournalToKinesisRequest *)request completionHandler:(void (^ _Nullable)(AWSQldbStreamJournalToKinesisResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Adds one or more tags to a specified Amazon QLDB resource.</p><p>A resource can have up to 50 tags. If you try to create more than 50 tags for a resource, your request fails and returns an error.</p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSQldbTagResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSQldbErrorDomain` domain and the following error code: `AWSQldbErrorInvalidParameter`, `AWSQldbErrorResourceNotFound`.
 
 @see AWSQldbTagResourceRequest
 @see AWSQldbTagResourceResponse
 */
- (AWSTask<AWSQldbTagResourceResponse *> *)tagResource:(AWSQldbTagResourceRequest *)request;

/**
 <p>Adds one or more tags to a specified Amazon QLDB resource.</p><p>A resource can have up to 50 tags. If you try to create more than 50 tags for a resource, your request fails and returns an error.</p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSQldbErrorDomain` domain and the following error code: `AWSQldbErrorInvalidParameter`, `AWSQldbErrorResourceNotFound`.
 
 @see AWSQldbTagResourceRequest
 @see AWSQldbTagResourceResponse
 */
- (void)tagResource:(AWSQldbTagResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSQldbTagResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Removes one or more tags from a specified Amazon QLDB resource. You can specify up to 50 tag keys to remove.</p>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSQldbUntagResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSQldbErrorDomain` domain and the following error code: `AWSQldbErrorInvalidParameter`, `AWSQldbErrorResourceNotFound`.
 
 @see AWSQldbUntagResourceRequest
 @see AWSQldbUntagResourceResponse
 */
- (AWSTask<AWSQldbUntagResourceResponse *> *)untagResource:(AWSQldbUntagResourceRequest *)request;

/**
 <p>Removes one or more tags from a specified Amazon QLDB resource. You can specify up to 50 tag keys to remove.</p>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSQldbErrorDomain` domain and the following error code: `AWSQldbErrorInvalidParameter`, `AWSQldbErrorResourceNotFound`.
 
 @see AWSQldbUntagResourceRequest
 @see AWSQldbUntagResourceResponse
 */
- (void)untagResource:(AWSQldbUntagResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSQldbUntagResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates properties on a ledger.</p>
 
 @param request A container for the necessary parameters to execute the UpdateLedger service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSQldbUpdateLedgerResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSQldbErrorDomain` domain and the following error code: `AWSQldbErrorInvalidParameter`, `AWSQldbErrorResourceNotFound`.
 
 @see AWSQldbUpdateLedgerRequest
 @see AWSQldbUpdateLedgerResponse
 */
- (AWSTask<AWSQldbUpdateLedgerResponse *> *)updateLedger:(AWSQldbUpdateLedgerRequest *)request;

/**
 <p>Updates properties on a ledger.</p>
 
 @param request A container for the necessary parameters to execute the UpdateLedger service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSQldbErrorDomain` domain and the following error code: `AWSQldbErrorInvalidParameter`, `AWSQldbErrorResourceNotFound`.
 
 @see AWSQldbUpdateLedgerRequest
 @see AWSQldbUpdateLedgerResponse
 */
- (void)updateLedger:(AWSQldbUpdateLedgerRequest *)request completionHandler:(void (^ _Nullable)(AWSQldbUpdateLedgerResponse * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
