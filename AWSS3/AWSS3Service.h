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
#import "AWSS3Model.h"
#import "AWSS3Resources.h"

NS_ASSUME_NONNULL_BEGIN

/**
 
 */
@interface AWSS3 : AWSService

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

     let S3 = AWSS3.defaultS3()

 *Objective-C*

     AWSS3 *S3 = [AWSS3 defaultS3];

 @return The default service client.
 */
+ (instancetype)defaultS3;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
         let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
         let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
         AWSS3.registerS3WithConfiguration(configuration, forKey: "USWest2S3")

         return true
     }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSS3 registerS3WithConfiguration:configuration forKey:@"USWest2S3"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let S3 = AWSS3(forKey: "USWest2S3")

 *Objective-C*

     AWSS3 *S3 = [AWSS3 S3ForKey:@"USWest2S3"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerS3WithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerS3WithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
         let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
         let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
         AWSS3.registerS3WithConfiguration(configuration, forKey: "USWest2S3")

         return true
     }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSS3 registerS3WithConfiguration:configuration forKey:@"USWest2S3"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let S3 = AWSS3(forKey: "USWest2S3")

 *Objective-C*

     AWSS3 *S3 = [AWSS3 S3ForKey:@"USWest2S3"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)S3ForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removeS3ForKey:(NSString *)key;

/**
 <p>Aborts a multipart upload.</p><p>To verify that all parts have been removed, so you don't get charged for the part storage, you should call the List Parts operation and ensure the parts list is empty.</p>
 
 @param request A container for the necessary parameters to execute the AbortMultipartUpload service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSS3AbortMultipartUploadOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSS3ErrorDomain` domain and the following error code: `AWSS3ErrorNoSuchUpload`.
 
 @see AWSS3AbortMultipartUploadRequest
 @see AWSS3AbortMultipartUploadOutput
 */
- (AWSTask<AWSS3AbortMultipartUploadOutput *> *)abortMultipartUpload:(AWSS3AbortMultipartUploadRequest *)request;

/**
 <p>Aborts a multipart upload.</p><p>To verify that all parts have been removed, so you don't get charged for the part storage, you should call the List Parts operation and ensure the parts list is empty.</p>
 
 @param request A container for the necessary parameters to execute the AbortMultipartUpload service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSS3ErrorDomain` domain and the following error code: `AWSS3ErrorNoSuchUpload`.
 
 @see AWSS3AbortMultipartUploadRequest
 @see AWSS3AbortMultipartUploadOutput
 */
- (void)abortMultipartUpload:(AWSS3AbortMultipartUploadRequest *)request completionHandler:(void (^ _Nullable)(AWSS3AbortMultipartUploadOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Completes a multipart upload by assembling previously uploaded parts.
 
 @param request A container for the necessary parameters to execute the CompleteMultipartUpload service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSS3CompleteMultipartUploadOutput`.
 
 @see AWSS3CompleteMultipartUploadRequest
 @see AWSS3CompleteMultipartUploadOutput
 */
- (AWSTask<AWSS3CompleteMultipartUploadOutput *> *)completeMultipartUpload:(AWSS3CompleteMultipartUploadRequest *)request;

/**
 Completes a multipart upload by assembling previously uploaded parts.
 
 @param request A container for the necessary parameters to execute the CompleteMultipartUpload service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSS3CompleteMultipartUploadRequest
 @see AWSS3CompleteMultipartUploadOutput
 */
- (void)completeMultipartUpload:(AWSS3CompleteMultipartUploadRequest *)request completionHandler:(void (^ _Nullable)(AWSS3CompleteMultipartUploadOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Creates a copy of an object that is already stored in Amazon S3.
 
 @param request A container for the necessary parameters to execute the CopyObject service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSS3ReplicateObjectOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSS3ErrorDomain` domain and the following error code: `AWSS3ErrorObjectNotInActiveTier`.
 
 @see AWSS3ReplicateObjectRequest
 @see AWSS3ReplicateObjectOutput
 */
- (AWSTask<AWSS3ReplicateObjectOutput *> *)replicateObject:(AWSS3ReplicateObjectRequest *)request;

/**
 Creates a copy of an object that is already stored in Amazon S3.
 
 @param request A container for the necessary parameters to execute the CopyObject service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSS3ErrorDomain` domain and the following error code: `AWSS3ErrorObjectNotInActiveTier`.
 
 @see AWSS3ReplicateObjectRequest
 @see AWSS3ReplicateObjectOutput
 */
- (void)replicateObject:(AWSS3ReplicateObjectRequest *)request completionHandler:(void (^ _Nullable)(AWSS3ReplicateObjectOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Creates a new bucket.
 
 @param request A container for the necessary parameters to execute the CreateBucket service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSS3CreateBucketOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSS3ErrorDomain` domain and the following error code: `AWSS3ErrorBucketAlreadyExists`, `AWSS3ErrorBucketAlreadyOwnedByYou`.
 
 @see AWSS3CreateBucketRequest
 @see AWSS3CreateBucketOutput
 */
- (AWSTask<AWSS3CreateBucketOutput *> *)createBucket:(AWSS3CreateBucketRequest *)request;

/**
 Creates a new bucket.
 
 @param request A container for the necessary parameters to execute the CreateBucket service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSS3ErrorDomain` domain and the following error code: `AWSS3ErrorBucketAlreadyExists`, `AWSS3ErrorBucketAlreadyOwnedByYou`.
 
 @see AWSS3CreateBucketRequest
 @see AWSS3CreateBucketOutput
 */
- (void)createBucket:(AWSS3CreateBucketRequest *)request completionHandler:(void (^ _Nullable)(AWSS3CreateBucketOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Initiates a multipart upload and returns an upload ID.</p><p><b>Note:</b> After you initiate multipart upload and upload one or more parts, you must either complete or abort multipart upload in order to stop getting charged for storage of the uploaded parts. Only after you either complete or abort multipart upload, Amazon S3 frees up the parts storage and stops charging you for the parts storage.</p>
 
 @param request A container for the necessary parameters to execute the CreateMultipartUpload service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSS3CreateMultipartUploadOutput`.
 
 @see AWSS3CreateMultipartUploadRequest
 @see AWSS3CreateMultipartUploadOutput
 */
- (AWSTask<AWSS3CreateMultipartUploadOutput *> *)createMultipartUpload:(AWSS3CreateMultipartUploadRequest *)request;

/**
 <p>Initiates a multipart upload and returns an upload ID.</p><p><b>Note:</b> After you initiate multipart upload and upload one or more parts, you must either complete or abort multipart upload in order to stop getting charged for storage of the uploaded parts. Only after you either complete or abort multipart upload, Amazon S3 frees up the parts storage and stops charging you for the parts storage.</p>
 
 @param request A container for the necessary parameters to execute the CreateMultipartUpload service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSS3CreateMultipartUploadRequest
 @see AWSS3CreateMultipartUploadOutput
 */
- (void)createMultipartUpload:(AWSS3CreateMultipartUploadRequest *)request completionHandler:(void (^ _Nullable)(AWSS3CreateMultipartUploadOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Deletes the bucket. All objects (including all object versions and Delete Markers) in the bucket must be deleted before the bucket itself can be deleted.
 
 @param request A container for the necessary parameters to execute the DeleteBucket service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSS3DeleteBucketRequest
 */
- (AWSTask *)deleteBucket:(AWSS3DeleteBucketRequest *)request;

/**
 Deletes the bucket. All objects (including all object versions and Delete Markers) in the bucket must be deleted before the bucket itself can be deleted.
 
 @param request A container for the necessary parameters to execute the DeleteBucket service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSS3DeleteBucketRequest
 */
- (void)deleteBucket:(AWSS3DeleteBucketRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 Deletes the cors configuration information set for the bucket.
 
 @param request A container for the necessary parameters to execute the DeleteBucketCors service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSS3DeleteBucketCorsRequest
 */
- (AWSTask *)deleteBucketCors:(AWSS3DeleteBucketCorsRequest *)request;

/**
 Deletes the cors configuration information set for the bucket.
 
 @param request A container for the necessary parameters to execute the DeleteBucketCors service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSS3DeleteBucketCorsRequest
 */
- (void)deleteBucketCors:(AWSS3DeleteBucketCorsRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 Deletes the lifecycle configuration from the bucket.
 
 @param request A container for the necessary parameters to execute the DeleteBucketLifecycle service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSS3DeleteBucketLifecycleRequest
 */
- (AWSTask *)deleteBucketLifecycle:(AWSS3DeleteBucketLifecycleRequest *)request;

/**
 Deletes the lifecycle configuration from the bucket.
 
 @param request A container for the necessary parameters to execute the DeleteBucketLifecycle service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSS3DeleteBucketLifecycleRequest
 */
- (void)deleteBucketLifecycle:(AWSS3DeleteBucketLifecycleRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 Deletes the policy from the bucket.
 
 @param request A container for the necessary parameters to execute the DeleteBucketPolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSS3DeleteBucketPolicyRequest
 */
- (AWSTask *)deleteBucketPolicy:(AWSS3DeleteBucketPolicyRequest *)request;

/**
 Deletes the policy from the bucket.
 
 @param request A container for the necessary parameters to execute the DeleteBucketPolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSS3DeleteBucketPolicyRequest
 */
- (void)deleteBucketPolicy:(AWSS3DeleteBucketPolicyRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 Deletes the replication configuration from the bucket.
 
 @param request A container for the necessary parameters to execute the DeleteBucketReplication service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSS3DeleteBucketReplicationRequest
 */
- (AWSTask *)deleteBucketReplication:(AWSS3DeleteBucketReplicationRequest *)request;

/**
 Deletes the replication configuration from the bucket.
 
 @param request A container for the necessary parameters to execute the DeleteBucketReplication service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSS3DeleteBucketReplicationRequest
 */
- (void)deleteBucketReplication:(AWSS3DeleteBucketReplicationRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 Deletes the tags from the bucket.
 
 @param request A container for the necessary parameters to execute the DeleteBucketTagging service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSS3DeleteBucketTaggingRequest
 */
- (AWSTask *)deleteBucketTagging:(AWSS3DeleteBucketTaggingRequest *)request;

/**
 Deletes the tags from the bucket.
 
 @param request A container for the necessary parameters to execute the DeleteBucketTagging service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSS3DeleteBucketTaggingRequest
 */
- (void)deleteBucketTagging:(AWSS3DeleteBucketTaggingRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 This operation removes the website configuration from the bucket.
 
 @param request A container for the necessary parameters to execute the DeleteBucketWebsite service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSS3DeleteBucketWebsiteRequest
 */
- (AWSTask *)deleteBucketWebsite:(AWSS3DeleteBucketWebsiteRequest *)request;

/**
 This operation removes the website configuration from the bucket.
 
 @param request A container for the necessary parameters to execute the DeleteBucketWebsite service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSS3DeleteBucketWebsiteRequest
 */
- (void)deleteBucketWebsite:(AWSS3DeleteBucketWebsiteRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 Removes the null version (if there is one) of an object and inserts a delete marker, which becomes the latest version of the object. If there isn't a null version, Amazon S3 does not remove any objects.
 
 @param request A container for the necessary parameters to execute the DeleteObject service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSS3DeleteObjectOutput`.
 
 @see AWSS3DeleteObjectRequest
 @see AWSS3DeleteObjectOutput
 */
- (AWSTask<AWSS3DeleteObjectOutput *> *)deleteObject:(AWSS3DeleteObjectRequest *)request;

/**
 Removes the null version (if there is one) of an object and inserts a delete marker, which becomes the latest version of the object. If there isn't a null version, Amazon S3 does not remove any objects.
 
 @param request A container for the necessary parameters to execute the DeleteObject service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSS3DeleteObjectRequest
 @see AWSS3DeleteObjectOutput
 */
- (void)deleteObject:(AWSS3DeleteObjectRequest *)request completionHandler:(void (^ _Nullable)(AWSS3DeleteObjectOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 This operation enables you to delete multiple objects from a bucket using a single HTTP request. You may specify up to 1000 keys.
 
 @param request A container for the necessary parameters to execute the DeleteObjects service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSS3DeleteObjectsOutput`.
 
 @see AWSS3DeleteObjectsRequest
 @see AWSS3DeleteObjectsOutput
 */
- (AWSTask<AWSS3DeleteObjectsOutput *> *)deleteObjects:(AWSS3DeleteObjectsRequest *)request;

/**
 This operation enables you to delete multiple objects from a bucket using a single HTTP request. You may specify up to 1000 keys.
 
 @param request A container for the necessary parameters to execute the DeleteObjects service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSS3DeleteObjectsRequest
 @see AWSS3DeleteObjectsOutput
 */
- (void)deleteObjects:(AWSS3DeleteObjectsRequest *)request completionHandler:(void (^ _Nullable)(AWSS3DeleteObjectsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Returns the accelerate configuration of a bucket.
 
 @param request A container for the necessary parameters to execute the GetBucketAccelerateConfiguration service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSS3GetBucketAccelerateConfigurationOutput`.
 
 @see AWSS3GetBucketAccelerateConfigurationRequest
 @see AWSS3GetBucketAccelerateConfigurationOutput
 */
- (AWSTask<AWSS3GetBucketAccelerateConfigurationOutput *> *)getBucketAccelerateConfiguration:(AWSS3GetBucketAccelerateConfigurationRequest *)request;

/**
 Returns the accelerate configuration of a bucket.
 
 @param request A container for the necessary parameters to execute the GetBucketAccelerateConfiguration service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSS3GetBucketAccelerateConfigurationRequest
 @see AWSS3GetBucketAccelerateConfigurationOutput
 */
- (void)getBucketAccelerateConfiguration:(AWSS3GetBucketAccelerateConfigurationRequest *)request completionHandler:(void (^ _Nullable)(AWSS3GetBucketAccelerateConfigurationOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Gets the access control policy for the bucket.
 
 @param request A container for the necessary parameters to execute the GetBucketAcl service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSS3GetBucketAclOutput`.
 
 @see AWSS3GetBucketAclRequest
 @see AWSS3GetBucketAclOutput
 */
- (AWSTask<AWSS3GetBucketAclOutput *> *)getBucketAcl:(AWSS3GetBucketAclRequest *)request;

/**
 Gets the access control policy for the bucket.
 
 @param request A container for the necessary parameters to execute the GetBucketAcl service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSS3GetBucketAclRequest
 @see AWSS3GetBucketAclOutput
 */
- (void)getBucketAcl:(AWSS3GetBucketAclRequest *)request completionHandler:(void (^ _Nullable)(AWSS3GetBucketAclOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Returns the cors configuration for the bucket.
 
 @param request A container for the necessary parameters to execute the GetBucketCors service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSS3GetBucketCorsOutput`.
 
 @see AWSS3GetBucketCorsRequest
 @see AWSS3GetBucketCorsOutput
 */
- (AWSTask<AWSS3GetBucketCorsOutput *> *)getBucketCors:(AWSS3GetBucketCorsRequest *)request;

/**
 Returns the cors configuration for the bucket.
 
 @param request A container for the necessary parameters to execute the GetBucketCors service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSS3GetBucketCorsRequest
 @see AWSS3GetBucketCorsOutput
 */
- (void)getBucketCors:(AWSS3GetBucketCorsRequest *)request completionHandler:(void (^ _Nullable)(AWSS3GetBucketCorsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Deprecated, see the GetBucketLifecycleConfiguration operation.
 
 @param request A container for the necessary parameters to execute the GetBucketLifecycle service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSS3GetBucketLifecycleOutput`.
 
 @see AWSS3GetBucketLifecycleRequest
 @see AWSS3GetBucketLifecycleOutput
 */
- (AWSTask<AWSS3GetBucketLifecycleOutput *> *)getBucketLifecycle:(AWSS3GetBucketLifecycleRequest *)request;

/**
 Deprecated, see the GetBucketLifecycleConfiguration operation.
 
 @param request A container for the necessary parameters to execute the GetBucketLifecycle service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSS3GetBucketLifecycleRequest
 @see AWSS3GetBucketLifecycleOutput
 */
- (void)getBucketLifecycle:(AWSS3GetBucketLifecycleRequest *)request completionHandler:(void (^ _Nullable)(AWSS3GetBucketLifecycleOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Returns the lifecycle configuration information set on the bucket.
 
 @param request A container for the necessary parameters to execute the GetBucketLifecycleConfiguration service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSS3GetBucketLifecycleConfigurationOutput`.
 
 @see AWSS3GetBucketLifecycleConfigurationRequest
 @see AWSS3GetBucketLifecycleConfigurationOutput
 */
- (AWSTask<AWSS3GetBucketLifecycleConfigurationOutput *> *)getBucketLifecycleConfiguration:(AWSS3GetBucketLifecycleConfigurationRequest *)request;

/**
 Returns the lifecycle configuration information set on the bucket.
 
 @param request A container for the necessary parameters to execute the GetBucketLifecycleConfiguration service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSS3GetBucketLifecycleConfigurationRequest
 @see AWSS3GetBucketLifecycleConfigurationOutput
 */
- (void)getBucketLifecycleConfiguration:(AWSS3GetBucketLifecycleConfigurationRequest *)request completionHandler:(void (^ _Nullable)(AWSS3GetBucketLifecycleConfigurationOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Returns the region the bucket resides in.
 
 @param request A container for the necessary parameters to execute the GetBucketLocation service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSS3GetBucketLocationOutput`.
 
 @see AWSS3GetBucketLocationRequest
 @see AWSS3GetBucketLocationOutput
 */
- (AWSTask<AWSS3GetBucketLocationOutput *> *)getBucketLocation:(AWSS3GetBucketLocationRequest *)request;

/**
 Returns the region the bucket resides in.
 
 @param request A container for the necessary parameters to execute the GetBucketLocation service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSS3GetBucketLocationRequest
 @see AWSS3GetBucketLocationOutput
 */
- (void)getBucketLocation:(AWSS3GetBucketLocationRequest *)request completionHandler:(void (^ _Nullable)(AWSS3GetBucketLocationOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Returns the logging status of a bucket and the permissions users have to view and modify that status. To use GET, you must be the bucket owner.
 
 @param request A container for the necessary parameters to execute the GetBucketLogging service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSS3GetBucketLoggingOutput`.
 
 @see AWSS3GetBucketLoggingRequest
 @see AWSS3GetBucketLoggingOutput
 */
- (AWSTask<AWSS3GetBucketLoggingOutput *> *)getBucketLogging:(AWSS3GetBucketLoggingRequest *)request;

/**
 Returns the logging status of a bucket and the permissions users have to view and modify that status. To use GET, you must be the bucket owner.
 
 @param request A container for the necessary parameters to execute the GetBucketLogging service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSS3GetBucketLoggingRequest
 @see AWSS3GetBucketLoggingOutput
 */
- (void)getBucketLogging:(AWSS3GetBucketLoggingRequest *)request completionHandler:(void (^ _Nullable)(AWSS3GetBucketLoggingOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Deprecated, see the GetBucketNotificationConfiguration operation.
 
 @param request A container for the necessary parameters to execute the GetBucketNotification service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSS3NotificationConfigurationDeprecated`.
 
 @see AWSS3GetBucketNotificationConfigurationRequest
 @see AWSS3NotificationConfigurationDeprecated
 */
- (AWSTask<AWSS3NotificationConfigurationDeprecated *> *)getBucketNotification:(AWSS3GetBucketNotificationConfigurationRequest *)request;

/**
 Deprecated, see the GetBucketNotificationConfiguration operation.
 
 @param request A container for the necessary parameters to execute the GetBucketNotification service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSS3GetBucketNotificationConfigurationRequest
 @see AWSS3NotificationConfigurationDeprecated
 */
- (void)getBucketNotification:(AWSS3GetBucketNotificationConfigurationRequest *)request completionHandler:(void (^ _Nullable)(AWSS3NotificationConfigurationDeprecated * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Returns the notification configuration of a bucket.
 
 @param request A container for the necessary parameters to execute the GetBucketNotificationConfiguration service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSS3NotificationConfiguration`.
 
 @see AWSS3GetBucketNotificationConfigurationRequest
 @see AWSS3NotificationConfiguration
 */
- (AWSTask<AWSS3NotificationConfiguration *> *)getBucketNotificationConfiguration:(AWSS3GetBucketNotificationConfigurationRequest *)request;

/**
 Returns the notification configuration of a bucket.
 
 @param request A container for the necessary parameters to execute the GetBucketNotificationConfiguration service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSS3GetBucketNotificationConfigurationRequest
 @see AWSS3NotificationConfiguration
 */
- (void)getBucketNotificationConfiguration:(AWSS3GetBucketNotificationConfigurationRequest *)request completionHandler:(void (^ _Nullable)(AWSS3NotificationConfiguration * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Returns the policy of a specified bucket.
 
 @param request A container for the necessary parameters to execute the GetBucketPolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSS3GetBucketPolicyOutput`.
 
 @see AWSS3GetBucketPolicyRequest
 @see AWSS3GetBucketPolicyOutput
 */
- (AWSTask<AWSS3GetBucketPolicyOutput *> *)getBucketPolicy:(AWSS3GetBucketPolicyRequest *)request;

/**
 Returns the policy of a specified bucket.
 
 @param request A container for the necessary parameters to execute the GetBucketPolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSS3GetBucketPolicyRequest
 @see AWSS3GetBucketPolicyOutput
 */
- (void)getBucketPolicy:(AWSS3GetBucketPolicyRequest *)request completionHandler:(void (^ _Nullable)(AWSS3GetBucketPolicyOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Returns the replication configuration of a bucket.
 
 @param request A container for the necessary parameters to execute the GetBucketReplication service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSS3GetBucketReplicationOutput`.
 
 @see AWSS3GetBucketReplicationRequest
 @see AWSS3GetBucketReplicationOutput
 */
- (AWSTask<AWSS3GetBucketReplicationOutput *> *)getBucketReplication:(AWSS3GetBucketReplicationRequest *)request;

/**
 Returns the replication configuration of a bucket.
 
 @param request A container for the necessary parameters to execute the GetBucketReplication service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSS3GetBucketReplicationRequest
 @see AWSS3GetBucketReplicationOutput
 */
- (void)getBucketReplication:(AWSS3GetBucketReplicationRequest *)request completionHandler:(void (^ _Nullable)(AWSS3GetBucketReplicationOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Returns the request payment configuration of a bucket.
 
 @param request A container for the necessary parameters to execute the GetBucketRequestPayment service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSS3GetBucketRequestPaymentOutput`.
 
 @see AWSS3GetBucketRequestPaymentRequest
 @see AWSS3GetBucketRequestPaymentOutput
 */
- (AWSTask<AWSS3GetBucketRequestPaymentOutput *> *)getBucketRequestPayment:(AWSS3GetBucketRequestPaymentRequest *)request;

/**
 Returns the request payment configuration of a bucket.
 
 @param request A container for the necessary parameters to execute the GetBucketRequestPayment service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSS3GetBucketRequestPaymentRequest
 @see AWSS3GetBucketRequestPaymentOutput
 */
- (void)getBucketRequestPayment:(AWSS3GetBucketRequestPaymentRequest *)request completionHandler:(void (^ _Nullable)(AWSS3GetBucketRequestPaymentOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Returns the tag set associated with the bucket.
 
 @param request A container for the necessary parameters to execute the GetBucketTagging service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSS3GetBucketTaggingOutput`.
 
 @see AWSS3GetBucketTaggingRequest
 @see AWSS3GetBucketTaggingOutput
 */
- (AWSTask<AWSS3GetBucketTaggingOutput *> *)getBucketTagging:(AWSS3GetBucketTaggingRequest *)request;

/**
 Returns the tag set associated with the bucket.
 
 @param request A container for the necessary parameters to execute the GetBucketTagging service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSS3GetBucketTaggingRequest
 @see AWSS3GetBucketTaggingOutput
 */
- (void)getBucketTagging:(AWSS3GetBucketTaggingRequest *)request completionHandler:(void (^ _Nullable)(AWSS3GetBucketTaggingOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Returns the versioning state of a bucket.
 
 @param request A container for the necessary parameters to execute the GetBucketVersioning service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSS3GetBucketVersioningOutput`.
 
 @see AWSS3GetBucketVersioningRequest
 @see AWSS3GetBucketVersioningOutput
 */
- (AWSTask<AWSS3GetBucketVersioningOutput *> *)getBucketVersioning:(AWSS3GetBucketVersioningRequest *)request;

/**
 Returns the versioning state of a bucket.
 
 @param request A container for the necessary parameters to execute the GetBucketVersioning service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSS3GetBucketVersioningRequest
 @see AWSS3GetBucketVersioningOutput
 */
- (void)getBucketVersioning:(AWSS3GetBucketVersioningRequest *)request completionHandler:(void (^ _Nullable)(AWSS3GetBucketVersioningOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Returns the website configuration for a bucket.
 
 @param request A container for the necessary parameters to execute the GetBucketWebsite service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSS3GetBucketWebsiteOutput`.
 
 @see AWSS3GetBucketWebsiteRequest
 @see AWSS3GetBucketWebsiteOutput
 */
- (AWSTask<AWSS3GetBucketWebsiteOutput *> *)getBucketWebsite:(AWSS3GetBucketWebsiteRequest *)request;

/**
 Returns the website configuration for a bucket.
 
 @param request A container for the necessary parameters to execute the GetBucketWebsite service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSS3GetBucketWebsiteRequest
 @see AWSS3GetBucketWebsiteOutput
 */
- (void)getBucketWebsite:(AWSS3GetBucketWebsiteRequest *)request completionHandler:(void (^ _Nullable)(AWSS3GetBucketWebsiteOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Retrieves objects from Amazon S3.
 
 @param request A container for the necessary parameters to execute the GetObject service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSS3GetObjectOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSS3ErrorDomain` domain and the following error code: `AWSS3ErrorNoSuchKey`.
 
 @see AWSS3GetObjectRequest
 @see AWSS3GetObjectOutput
 */
- (AWSTask<AWSS3GetObjectOutput *> *)getObject:(AWSS3GetObjectRequest *)request;

/**
 Retrieves objects from Amazon S3.
 
 @param request A container for the necessary parameters to execute the GetObject service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSS3ErrorDomain` domain and the following error code: `AWSS3ErrorNoSuchKey`.
 
 @see AWSS3GetObjectRequest
 @see AWSS3GetObjectOutput
 */
- (void)getObject:(AWSS3GetObjectRequest *)request completionHandler:(void (^ _Nullable)(AWSS3GetObjectOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Returns the access control list (ACL) of an object.
 
 @param request A container for the necessary parameters to execute the GetObjectAcl service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSS3GetObjectAclOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSS3ErrorDomain` domain and the following error code: `AWSS3ErrorNoSuchKey`.
 
 @see AWSS3GetObjectAclRequest
 @see AWSS3GetObjectAclOutput
 */
- (AWSTask<AWSS3GetObjectAclOutput *> *)getObjectAcl:(AWSS3GetObjectAclRequest *)request;

/**
 Returns the access control list (ACL) of an object.
 
 @param request A container for the necessary parameters to execute the GetObjectAcl service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSS3ErrorDomain` domain and the following error code: `AWSS3ErrorNoSuchKey`.
 
 @see AWSS3GetObjectAclRequest
 @see AWSS3GetObjectAclOutput
 */
- (void)getObjectAcl:(AWSS3GetObjectAclRequest *)request completionHandler:(void (^ _Nullable)(AWSS3GetObjectAclOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Return torrent files from a bucket.
 
 @param request A container for the necessary parameters to execute the GetObjectTorrent service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSS3GetObjectTorrentOutput`.
 
 @see AWSS3GetObjectTorrentRequest
 @see AWSS3GetObjectTorrentOutput
 */
- (AWSTask<AWSS3GetObjectTorrentOutput *> *)getObjectTorrent:(AWSS3GetObjectTorrentRequest *)request;

/**
 Return torrent files from a bucket.
 
 @param request A container for the necessary parameters to execute the GetObjectTorrent service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSS3GetObjectTorrentRequest
 @see AWSS3GetObjectTorrentOutput
 */
- (void)getObjectTorrent:(AWSS3GetObjectTorrentRequest *)request completionHandler:(void (^ _Nullable)(AWSS3GetObjectTorrentOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 This operation is useful to determine if a bucket exists and you have permission to access it.
 
 @param request A container for the necessary parameters to execute the HeadBucket service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSS3ErrorDomain` domain and the following error code: `AWSS3ErrorNoSuchBucket`.
 
 @see AWSS3HeadBucketRequest
 */
- (AWSTask *)headBucket:(AWSS3HeadBucketRequest *)request;

/**
 This operation is useful to determine if a bucket exists and you have permission to access it.
 
 @param request A container for the necessary parameters to execute the HeadBucket service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSS3ErrorDomain` domain and the following error code: `AWSS3ErrorNoSuchBucket`.
 
 @see AWSS3HeadBucketRequest
 */
- (void)headBucket:(AWSS3HeadBucketRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 The HEAD operation retrieves metadata from an object without returning the object itself. This operation is useful if you're only interested in an object's metadata. To use HEAD, you must have READ access to the object.
 
 @param request A container for the necessary parameters to execute the HeadObject service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSS3HeadObjectOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSS3ErrorDomain` domain and the following error code: `AWSS3ErrorNoSuchKey`.
 
 @see AWSS3HeadObjectRequest
 @see AWSS3HeadObjectOutput
 */
- (AWSTask<AWSS3HeadObjectOutput *> *)headObject:(AWSS3HeadObjectRequest *)request;

/**
 The HEAD operation retrieves metadata from an object without returning the object itself. This operation is useful if you're only interested in an object's metadata. To use HEAD, you must have READ access to the object.
 
 @param request A container for the necessary parameters to execute the HeadObject service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSS3ErrorDomain` domain and the following error code: `AWSS3ErrorNoSuchKey`.
 
 @see AWSS3HeadObjectRequest
 @see AWSS3HeadObjectOutput
 */
- (void)headObject:(AWSS3HeadObjectRequest *)request completionHandler:(void (^ _Nullable)(AWSS3HeadObjectOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Returns a list of all buckets owned by the authenticated sender of the request.
 
 @param request A container for the necessary parameters to execute the ListBuckets service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSS3ListBucketsOutput`.
 
 @see AWSRequest
 @see AWSS3ListBucketsOutput
 */
- (AWSTask<AWSS3ListBucketsOutput *> *)listBuckets:(AWSRequest *)request;

/**
 Returns a list of all buckets owned by the authenticated sender of the request.
 
 @param request A container for the necessary parameters to execute the ListBuckets service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSRequest
 @see AWSS3ListBucketsOutput
 */
- (void)listBuckets:(AWSRequest *)request completionHandler:(void (^ _Nullable)(AWSS3ListBucketsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 This operation lists in-progress multipart uploads.
 
 @param request A container for the necessary parameters to execute the ListMultipartUploads service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSS3ListMultipartUploadsOutput`.
 
 @see AWSS3ListMultipartUploadsRequest
 @see AWSS3ListMultipartUploadsOutput
 */
- (AWSTask<AWSS3ListMultipartUploadsOutput *> *)listMultipartUploads:(AWSS3ListMultipartUploadsRequest *)request;

/**
 This operation lists in-progress multipart uploads.
 
 @param request A container for the necessary parameters to execute the ListMultipartUploads service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSS3ListMultipartUploadsRequest
 @see AWSS3ListMultipartUploadsOutput
 */
- (void)listMultipartUploads:(AWSS3ListMultipartUploadsRequest *)request completionHandler:(void (^ _Nullable)(AWSS3ListMultipartUploadsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Returns metadata about all of the versions of objects in a bucket.
 
 @param request A container for the necessary parameters to execute the ListObjectVersions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSS3ListObjectVersionsOutput`.
 
 @see AWSS3ListObjectVersionsRequest
 @see AWSS3ListObjectVersionsOutput
 */
- (AWSTask<AWSS3ListObjectVersionsOutput *> *)listObjectVersions:(AWSS3ListObjectVersionsRequest *)request;

/**
 Returns metadata about all of the versions of objects in a bucket.
 
 @param request A container for the necessary parameters to execute the ListObjectVersions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSS3ListObjectVersionsRequest
 @see AWSS3ListObjectVersionsOutput
 */
- (void)listObjectVersions:(AWSS3ListObjectVersionsRequest *)request completionHandler:(void (^ _Nullable)(AWSS3ListObjectVersionsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Returns some or all (up to 1000) of the objects in a bucket. You can use the request parameters as selection criteria to return a subset of the objects in a bucket.
 
 @param request A container for the necessary parameters to execute the ListObjects service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSS3ListObjectsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSS3ErrorDomain` domain and the following error code: `AWSS3ErrorNoSuchBucket`.
 
 @see AWSS3ListObjectsRequest
 @see AWSS3ListObjectsOutput
 */
- (AWSTask<AWSS3ListObjectsOutput *> *)listObjects:(AWSS3ListObjectsRequest *)request;

/**
 Returns some or all (up to 1000) of the objects in a bucket. You can use the request parameters as selection criteria to return a subset of the objects in a bucket.
 
 @param request A container for the necessary parameters to execute the ListObjects service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSS3ErrorDomain` domain and the following error code: `AWSS3ErrorNoSuchBucket`.
 
 @see AWSS3ListObjectsRequest
 @see AWSS3ListObjectsOutput
 */
- (void)listObjects:(AWSS3ListObjectsRequest *)request completionHandler:(void (^ _Nullable)(AWSS3ListObjectsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Returns some or all (up to 1000) of the objects in a bucket. You can use the request parameters as selection criteria to return a subset of the objects in a bucket. Note: ListObjectsV2 is the revised List Objects API and we recommend you use this revised API for new application development.
 
 @param request A container for the necessary parameters to execute the ListObjectsV2 service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSS3ListObjectsV2Output`. On failed execution, `task.error` may contain an `NSError` with `AWSS3ErrorDomain` domain and the following error code: `AWSS3ErrorNoSuchBucket`.
 
 @see AWSS3ListObjectsV2Request
 @see AWSS3ListObjectsV2Output
 */
- (AWSTask<AWSS3ListObjectsV2Output *> *)listObjectsV2:(AWSS3ListObjectsV2Request *)request;

/**
 Returns some or all (up to 1000) of the objects in a bucket. You can use the request parameters as selection criteria to return a subset of the objects in a bucket. Note: ListObjectsV2 is the revised List Objects API and we recommend you use this revised API for new application development.
 
 @param request A container for the necessary parameters to execute the ListObjectsV2 service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSS3ErrorDomain` domain and the following error code: `AWSS3ErrorNoSuchBucket`.
 
 @see AWSS3ListObjectsV2Request
 @see AWSS3ListObjectsV2Output
 */
- (void)listObjectsV2:(AWSS3ListObjectsV2Request *)request completionHandler:(void (^ _Nullable)(AWSS3ListObjectsV2Output * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Lists the parts that have been uploaded for a specific multipart upload.
 
 @param request A container for the necessary parameters to execute the ListParts service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSS3ListPartsOutput`.
 
 @see AWSS3ListPartsRequest
 @see AWSS3ListPartsOutput
 */
- (AWSTask<AWSS3ListPartsOutput *> *)listParts:(AWSS3ListPartsRequest *)request;

/**
 Lists the parts that have been uploaded for a specific multipart upload.
 
 @param request A container for the necessary parameters to execute the ListParts service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSS3ListPartsRequest
 @see AWSS3ListPartsOutput
 */
- (void)listParts:(AWSS3ListPartsRequest *)request completionHandler:(void (^ _Nullable)(AWSS3ListPartsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Sets the accelerate configuration of an existing bucket.
 
 @param request A container for the necessary parameters to execute the PutBucketAccelerateConfiguration service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSS3PutBucketAccelerateConfigurationRequest
 */
- (AWSTask *)putBucketAccelerateConfiguration:(AWSS3PutBucketAccelerateConfigurationRequest *)request;

/**
 Sets the accelerate configuration of an existing bucket.
 
 @param request A container for the necessary parameters to execute the PutBucketAccelerateConfiguration service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSS3PutBucketAccelerateConfigurationRequest
 */
- (void)putBucketAccelerateConfiguration:(AWSS3PutBucketAccelerateConfigurationRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 Sets the permissions on a bucket using access control lists (ACL).
 
 @param request A container for the necessary parameters to execute the PutBucketAcl service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSS3PutBucketAclRequest
 */
- (AWSTask *)putBucketAcl:(AWSS3PutBucketAclRequest *)request;

/**
 Sets the permissions on a bucket using access control lists (ACL).
 
 @param request A container for the necessary parameters to execute the PutBucketAcl service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSS3PutBucketAclRequest
 */
- (void)putBucketAcl:(AWSS3PutBucketAclRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 Sets the cors configuration for a bucket.
 
 @param request A container for the necessary parameters to execute the PutBucketCors service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSS3PutBucketCorsRequest
 */
- (AWSTask *)putBucketCors:(AWSS3PutBucketCorsRequest *)request;

/**
 Sets the cors configuration for a bucket.
 
 @param request A container for the necessary parameters to execute the PutBucketCors service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSS3PutBucketCorsRequest
 */
- (void)putBucketCors:(AWSS3PutBucketCorsRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 Deprecated, see the PutBucketLifecycleConfiguration operation.
 
 @param request A container for the necessary parameters to execute the PutBucketLifecycle service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSS3PutBucketLifecycleRequest
 */
- (AWSTask *)putBucketLifecycle:(AWSS3PutBucketLifecycleRequest *)request;

/**
 Deprecated, see the PutBucketLifecycleConfiguration operation.
 
 @param request A container for the necessary parameters to execute the PutBucketLifecycle service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSS3PutBucketLifecycleRequest
 */
- (void)putBucketLifecycle:(AWSS3PutBucketLifecycleRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 Sets lifecycle configuration for your bucket. If a lifecycle configuration exists, it replaces it.
 
 @param request A container for the necessary parameters to execute the PutBucketLifecycleConfiguration service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSS3PutBucketLifecycleConfigurationRequest
 */
- (AWSTask *)putBucketLifecycleConfiguration:(AWSS3PutBucketLifecycleConfigurationRequest *)request;

/**
 Sets lifecycle configuration for your bucket. If a lifecycle configuration exists, it replaces it.
 
 @param request A container for the necessary parameters to execute the PutBucketLifecycleConfiguration service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSS3PutBucketLifecycleConfigurationRequest
 */
- (void)putBucketLifecycleConfiguration:(AWSS3PutBucketLifecycleConfigurationRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 Set the logging parameters for a bucket and to specify permissions for who can view and modify the logging parameters. To set the logging status of a bucket, you must be the bucket owner.
 
 @param request A container for the necessary parameters to execute the PutBucketLogging service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSS3PutBucketLoggingRequest
 */
- (AWSTask *)putBucketLogging:(AWSS3PutBucketLoggingRequest *)request;

/**
 Set the logging parameters for a bucket and to specify permissions for who can view and modify the logging parameters. To set the logging status of a bucket, you must be the bucket owner.
 
 @param request A container for the necessary parameters to execute the PutBucketLogging service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSS3PutBucketLoggingRequest
 */
- (void)putBucketLogging:(AWSS3PutBucketLoggingRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 Deprecated, see the PutBucketNotificationConfiguraiton operation.
 
 @param request A container for the necessary parameters to execute the PutBucketNotification service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSS3PutBucketNotificationRequest
 */
- (AWSTask *)putBucketNotification:(AWSS3PutBucketNotificationRequest *)request;

/**
 Deprecated, see the PutBucketNotificationConfiguraiton operation.
 
 @param request A container for the necessary parameters to execute the PutBucketNotification service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSS3PutBucketNotificationRequest
 */
- (void)putBucketNotification:(AWSS3PutBucketNotificationRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 Enables notifications of specified events for a bucket.
 
 @param request A container for the necessary parameters to execute the PutBucketNotificationConfiguration service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSS3PutBucketNotificationConfigurationRequest
 */
- (AWSTask *)putBucketNotificationConfiguration:(AWSS3PutBucketNotificationConfigurationRequest *)request;

/**
 Enables notifications of specified events for a bucket.
 
 @param request A container for the necessary parameters to execute the PutBucketNotificationConfiguration service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSS3PutBucketNotificationConfigurationRequest
 */
- (void)putBucketNotificationConfiguration:(AWSS3PutBucketNotificationConfigurationRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 Replaces a policy on a bucket. If the bucket already has a policy, the one in this request completely replaces it.
 
 @param request A container for the necessary parameters to execute the PutBucketPolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSS3PutBucketPolicyRequest
 */
- (AWSTask *)putBucketPolicy:(AWSS3PutBucketPolicyRequest *)request;

/**
 Replaces a policy on a bucket. If the bucket already has a policy, the one in this request completely replaces it.
 
 @param request A container for the necessary parameters to execute the PutBucketPolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSS3PutBucketPolicyRequest
 */
- (void)putBucketPolicy:(AWSS3PutBucketPolicyRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 Creates a new replication configuration (or replaces an existing one, if present).
 
 @param request A container for the necessary parameters to execute the PutBucketReplication service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSS3PutBucketReplicationRequest
 */
- (AWSTask *)putBucketReplication:(AWSS3PutBucketReplicationRequest *)request;

/**
 Creates a new replication configuration (or replaces an existing one, if present).
 
 @param request A container for the necessary parameters to execute the PutBucketReplication service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSS3PutBucketReplicationRequest
 */
- (void)putBucketReplication:(AWSS3PutBucketReplicationRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 Sets the request payment configuration for a bucket. By default, the bucket owner pays for downloads from the bucket. This configuration parameter enables the bucket owner (only) to specify that the person requesting the download will be charged for the download. Documentation on requester pays buckets can be found at http://docs.aws.amazon.com/AmazonS3/latest/dev/RequesterPaysBuckets.html
 
 @param request A container for the necessary parameters to execute the PutBucketRequestPayment service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSS3PutBucketRequestPaymentRequest
 */
- (AWSTask *)putBucketRequestPayment:(AWSS3PutBucketRequestPaymentRequest *)request;

/**
 Sets the request payment configuration for a bucket. By default, the bucket owner pays for downloads from the bucket. This configuration parameter enables the bucket owner (only) to specify that the person requesting the download will be charged for the download. Documentation on requester pays buckets can be found at http://docs.aws.amazon.com/AmazonS3/latest/dev/RequesterPaysBuckets.html
 
 @param request A container for the necessary parameters to execute the PutBucketRequestPayment service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSS3PutBucketRequestPaymentRequest
 */
- (void)putBucketRequestPayment:(AWSS3PutBucketRequestPaymentRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 Sets the tags for a bucket.
 
 @param request A container for the necessary parameters to execute the PutBucketTagging service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSS3PutBucketTaggingRequest
 */
- (AWSTask *)putBucketTagging:(AWSS3PutBucketTaggingRequest *)request;

/**
 Sets the tags for a bucket.
 
 @param request A container for the necessary parameters to execute the PutBucketTagging service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSS3PutBucketTaggingRequest
 */
- (void)putBucketTagging:(AWSS3PutBucketTaggingRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 Sets the versioning state of an existing bucket. To set the versioning state, you must be the bucket owner.
 
 @param request A container for the necessary parameters to execute the PutBucketVersioning service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSS3PutBucketVersioningRequest
 */
- (AWSTask *)putBucketVersioning:(AWSS3PutBucketVersioningRequest *)request;

/**
 Sets the versioning state of an existing bucket. To set the versioning state, you must be the bucket owner.
 
 @param request A container for the necessary parameters to execute the PutBucketVersioning service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSS3PutBucketVersioningRequest
 */
- (void)putBucketVersioning:(AWSS3PutBucketVersioningRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 Set the website configuration for a bucket.
 
 @param request A container for the necessary parameters to execute the PutBucketWebsite service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSS3PutBucketWebsiteRequest
 */
- (AWSTask *)putBucketWebsite:(AWSS3PutBucketWebsiteRequest *)request;

/**
 Set the website configuration for a bucket.
 
 @param request A container for the necessary parameters to execute the PutBucketWebsite service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSS3PutBucketWebsiteRequest
 */
- (void)putBucketWebsite:(AWSS3PutBucketWebsiteRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 Adds an object to a bucket.
 
 @param request A container for the necessary parameters to execute the PutObject service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSS3PutObjectOutput`.
 
 @see AWSS3PutObjectRequest
 @see AWSS3PutObjectOutput
 */
- (AWSTask<AWSS3PutObjectOutput *> *)putObject:(AWSS3PutObjectRequest *)request;

/**
 Adds an object to a bucket.
 
 @param request A container for the necessary parameters to execute the PutObject service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSS3PutObjectRequest
 @see AWSS3PutObjectOutput
 */
- (void)putObject:(AWSS3PutObjectRequest *)request completionHandler:(void (^ _Nullable)(AWSS3PutObjectOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 uses the acl subresource to set the access control list (ACL) permissions for an object that already exists in a bucket
 
 @param request A container for the necessary parameters to execute the PutObjectAcl service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSS3PutObjectAclOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSS3ErrorDomain` domain and the following error code: `AWSS3ErrorNoSuchKey`.
 
 @see AWSS3PutObjectAclRequest
 @see AWSS3PutObjectAclOutput
 */
- (AWSTask<AWSS3PutObjectAclOutput *> *)putObjectAcl:(AWSS3PutObjectAclRequest *)request;

/**
 uses the acl subresource to set the access control list (ACL) permissions for an object that already exists in a bucket
 
 @param request A container for the necessary parameters to execute the PutObjectAcl service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSS3ErrorDomain` domain and the following error code: `AWSS3ErrorNoSuchKey`.
 
 @see AWSS3PutObjectAclRequest
 @see AWSS3PutObjectAclOutput
 */
- (void)putObjectAcl:(AWSS3PutObjectAclRequest *)request completionHandler:(void (^ _Nullable)(AWSS3PutObjectAclOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Restores an archived copy of an object back into Amazon S3
 
 @param request A container for the necessary parameters to execute the RestoreObject service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSS3RestoreObjectOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSS3ErrorDomain` domain and the following error code: `AWSS3ErrorObjectAlreadyInActiveTier`.
 
 @see AWSS3RestoreObjectRequest
 @see AWSS3RestoreObjectOutput
 */
- (AWSTask<AWSS3RestoreObjectOutput *> *)restoreObject:(AWSS3RestoreObjectRequest *)request;

/**
 Restores an archived copy of an object back into Amazon S3
 
 @param request A container for the necessary parameters to execute the RestoreObject service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSS3ErrorDomain` domain and the following error code: `AWSS3ErrorObjectAlreadyInActiveTier`.
 
 @see AWSS3RestoreObjectRequest
 @see AWSS3RestoreObjectOutput
 */
- (void)restoreObject:(AWSS3RestoreObjectRequest *)request completionHandler:(void (^ _Nullable)(AWSS3RestoreObjectOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Uploads a part in a multipart upload.</p><p><b>Note:</b> After you initiate multipart upload and upload one or more parts, you must either complete or abort multipart upload in order to stop getting charged for storage of the uploaded parts. Only after you either complete or abort multipart upload, Amazon S3 frees up the parts storage and stops charging you for the parts storage.</p>
 
 @param request A container for the necessary parameters to execute the UploadPart service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSS3UploadPartOutput`.
 
 @see AWSS3UploadPartRequest
 @see AWSS3UploadPartOutput
 */
- (AWSTask<AWSS3UploadPartOutput *> *)uploadPart:(AWSS3UploadPartRequest *)request;

/**
 <p>Uploads a part in a multipart upload.</p><p><b>Note:</b> After you initiate multipart upload and upload one or more parts, you must either complete or abort multipart upload in order to stop getting charged for storage of the uploaded parts. Only after you either complete or abort multipart upload, Amazon S3 frees up the parts storage and stops charging you for the parts storage.</p>
 
 @param request A container for the necessary parameters to execute the UploadPart service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSS3UploadPartRequest
 @see AWSS3UploadPartOutput
 */
- (void)uploadPart:(AWSS3UploadPartRequest *)request completionHandler:(void (^ _Nullable)(AWSS3UploadPartOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Uploads a part by copying data from an existing object as data source.
 
 @param request A container for the necessary parameters to execute the UploadPartCopy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSS3UploadPartCopyOutput`.
 
 @see AWSS3UploadPartCopyRequest
 @see AWSS3UploadPartCopyOutput
 */
- (AWSTask<AWSS3UploadPartCopyOutput *> *)uploadPartCopy:(AWSS3UploadPartCopyRequest *)request;

/**
 Uploads a part by copying data from an existing object as data source.
 
 @param request A container for the necessary parameters to execute the UploadPartCopy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSS3UploadPartCopyRequest
 @see AWSS3UploadPartCopyOutput
 */
- (void)uploadPartCopy:(AWSS3UploadPartCopyRequest *)request completionHandler:(void (^ _Nullable)(AWSS3UploadPartCopyOutput * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
