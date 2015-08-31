/*
 Copyright 2010-2015 Amazon.com, Inc. or its affiliates. All Rights Reserved.

 Licensed under the Apache License, Version 2.0 (the "License").
 You may not use this file except in compliance with the License.
 A copy of the License is located at

 http://aws.amazon.com/apache2.0

 or in the "license" file accompanying this file. This file is distributed
 on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 express or implied. See the License for the specific language governing
 permissions and limitations under the License.
 */

#import <Foundation/Foundation.h>
#import <AWSCore/AWSCore.h>
#import "AWSS3Model.h"
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
 Retrieves the service client associated with the key. You need to call `+ registerS3WithConfiguration:forKey:` before invoking this method. If `+ registerS3WithConfiguration:forKey:` has not been called in advance or the key does not exist, this method returns `nil`.

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
 Instantiates the service client with the given service configuration.
 
 @warning This method has been deprecated. Use `+ registerS3WithConfiguration:forKey:` and `+ S3ForKey:` instead.
 
 @warning Once the client is instantiated, do not modify the configuration object. It may cause unspecified behaviors.
 
 @warning Unlike the singleton method, you are responsible for maintaining a strong reference to this object. If the service client is released before completing a service request, the request may fail with unspecified errors.
 
 @param configuration The service configuration object.
 
 @return An instance of the service client.
 */
- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration __attribute__ ((deprecated("Use '+ registerS3WithConfiguration:forKey:' and '+ S3ForKey:' instead.")));

/**
 <p>Aborts a multipart upload.</p><p>To verify that all parts have been removed, so you don't get charged for the part storage, you should call the List Parts operation and ensure the parts list is empty.</p>
 
 @param request A container for the necessary parameters to execute the AbortMultipartUpload service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSS3ErrorDomain` domain and the following error code: `AWSS3ErrorNoSuchUpload`.
 
 @see AWSS3AbortMultipartUploadRequest
 */
- (AWSTask *)abortMultipartUpload:(AWSS3AbortMultipartUploadRequest *)request;

/**
 Completes a multipart upload by assembling previously uploaded parts.
 
 @param request A container for the necessary parameters to execute the CompleteMultipartUpload service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSS3CompleteMultipartUploadOutput`.
 
 @see AWSS3CompleteMultipartUploadRequest
 @see AWSS3CompleteMultipartUploadOutput
 */
- (AWSTask *)completeMultipartUpload:(AWSS3CompleteMultipartUploadRequest *)request;

/**
 Creates a new bucket.
 
 @param request A container for the necessary parameters to execute the CreateBucket service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSS3CreateBucketOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSS3ErrorDomain` domain and the following error code: `AWSS3ErrorBucketAlreadyExists`.
 
 @see AWSS3CreateBucketRequest
 @see AWSS3CreateBucketOutput
 */
- (AWSTask *)createBucket:(AWSS3CreateBucketRequest *)request;

/**
 <p>Initiates a multipart upload and returns an upload ID.</p><p><b>Note:</b> After you initiate multipart upload and upload one or more parts, you must either complete or abort multipart upload in order to stop getting charged for storage of the uploaded parts. Only after you either complete or abort multipart upload, Amazon S3 frees up the parts storage and stops charging you for the parts storage.</p>
 
 @param request A container for the necessary parameters to execute the CreateMultipartUpload service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSS3CreateMultipartUploadOutput`.
 
 @see AWSS3CreateMultipartUploadRequest
 @see AWSS3CreateMultipartUploadOutput
 */
- (AWSTask *)createMultipartUpload:(AWSS3CreateMultipartUploadRequest *)request;

/**
 Deletes the bucket. All objects (including all object versions and Delete Markers) in the bucket must be deleted before the bucket itself can be deleted.
 
 @param request A container for the necessary parameters to execute the DeleteBucket service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSS3DeleteBucketRequest
 */
- (AWSTask *)deleteBucket:(AWSS3DeleteBucketRequest *)request;

/**
 Deletes the cors configuration information set for the bucket.
 
 @param request A container for the necessary parameters to execute the DeleteBucketCors service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSS3DeleteBucketCorsRequest
 */
- (AWSTask *)deleteBucketCors:(AWSS3DeleteBucketCorsRequest *)request;

/**
 Deletes the lifecycle configuration from the bucket.
 
 @param request A container for the necessary parameters to execute the DeleteBucketLifecycle service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSS3DeleteBucketLifecycleRequest
 */
- (AWSTask *)deleteBucketLifecycle:(AWSS3DeleteBucketLifecycleRequest *)request;

/**
 Deletes the policy from the bucket.
 
 @param request A container for the necessary parameters to execute the DeleteBucketPolicy service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSS3DeleteBucketPolicyRequest
 */
- (AWSTask *)deleteBucketPolicy:(AWSS3DeleteBucketPolicyRequest *)request;

/**
 Deletes the tags from the bucket.
 
 @param request A container for the necessary parameters to execute the DeleteBucketTagging service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSS3DeleteBucketTaggingRequest
 */
- (AWSTask *)deleteBucketTagging:(AWSS3DeleteBucketTaggingRequest *)request;

/**
 This operation removes the website configuration from the bucket.
 
 @param request A container for the necessary parameters to execute the DeleteBucketWebsite service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSS3DeleteBucketWebsiteRequest
 */
- (AWSTask *)deleteBucketWebsite:(AWSS3DeleteBucketWebsiteRequest *)request;

/**
 Removes the null version (if there is one) of an object and inserts a delete marker, which becomes the latest version of the object. If there isn't a null version, Amazon S3 does not remove any objects.
 
 @param request A container for the necessary parameters to execute the DeleteObject service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSS3DeleteObjectOutput`.
 
 @see AWSS3DeleteObjectRequest
 @see AWSS3DeleteObjectOutput
 */
- (AWSTask *)deleteObject:(AWSS3DeleteObjectRequest *)request;

/**
 This operation enables you to delete multiple objects from a bucket using a single HTTP request. You may specify up to 1000 keys.
 
 @param request A container for the necessary parameters to execute the DeleteObjects service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSS3DeleteObjectsOutput`.
 
 @see AWSS3DeleteObjectsRequest
 @see AWSS3DeleteObjectsOutput
 */
- (AWSTask *)deleteObjects:(AWSS3DeleteObjectsRequest *)request;

/**
 Gets the access control policy for the bucket.
 
 @param request A container for the necessary parameters to execute the GetBucketAcl service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSS3GetBucketAclOutput`.
 
 @see AWSS3GetBucketAclRequest
 @see AWSS3GetBucketAclOutput
 */
- (AWSTask *)getBucketAcl:(AWSS3GetBucketAclRequest *)request;

/**
 Returns the cors configuration for the bucket.
 
 @param request A container for the necessary parameters to execute the GetBucketCors service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSS3GetBucketCorsOutput`.
 
 @see AWSS3GetBucketCorsRequest
 @see AWSS3GetBucketCorsOutput
 */
- (AWSTask *)getBucketCors:(AWSS3GetBucketCorsRequest *)request;

/**
 Returns the lifecycle configuration information set on the bucket.
 
 @param request A container for the necessary parameters to execute the GetBucketLifecycle service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSS3GetBucketLifecycleOutput`.
 
 @see AWSS3GetBucketLifecycleRequest
 @see AWSS3GetBucketLifecycleOutput
 */
- (AWSTask *)getBucketLifecycle:(AWSS3GetBucketLifecycleRequest *)request;

/**
 Returns the region the bucket resides in.
 
 @param request A container for the necessary parameters to execute the GetBucketLocation service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSS3GetBucketLocationOutput`.
 
 @see AWSS3GetBucketLocationRequest
 @see AWSS3GetBucketLocationOutput
 */
- (AWSTask *)getBucketLocation:(AWSS3GetBucketLocationRequest *)request;

/**
 Returns the logging status of a bucket and the permissions users have to view and modify that status. To use GET, you must be the bucket owner.
 
 @param request A container for the necessary parameters to execute the GetBucketLogging service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSS3GetBucketLoggingOutput`.
 
 @see AWSS3GetBucketLoggingRequest
 @see AWSS3GetBucketLoggingOutput
 */
- (AWSTask *)getBucketLogging:(AWSS3GetBucketLoggingRequest *)request;

/**
 Return the notification configuration of a bucket.
 
 @param request A container for the necessary parameters to execute the GetBucketNotification service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSS3GetBucketNotificationOutput`.
 
 @see AWSS3GetBucketNotificationRequest
 @see AWSS3GetBucketNotificationOutput
 */
- (AWSTask *)getBucketNotification:(AWSS3GetBucketNotificationRequest *)request;

/**
 Returns the policy of a specified bucket.
 
 @param request A container for the necessary parameters to execute the GetBucketPolicy service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSS3GetBucketPolicyOutput`.
 
 @see AWSS3GetBucketPolicyRequest
 @see AWSS3GetBucketPolicyOutput
 */
- (AWSTask *)getBucketPolicy:(AWSS3GetBucketPolicyRequest *)request;

/**
 Returns the request payment configuration of a bucket.
 
 @param request A container for the necessary parameters to execute the GetBucketRequestPayment service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSS3GetBucketRequestPaymentOutput`.
 
 @see AWSS3GetBucketRequestPaymentRequest
 @see AWSS3GetBucketRequestPaymentOutput
 */
- (AWSTask *)getBucketRequestPayment:(AWSS3GetBucketRequestPaymentRequest *)request;

/**
 Returns the tag set associated with the bucket.
 
 @param request A container for the necessary parameters to execute the GetBucketTagging service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSS3GetBucketTaggingOutput`.
 
 @see AWSS3GetBucketTaggingRequest
 @see AWSS3GetBucketTaggingOutput
 */
- (AWSTask *)getBucketTagging:(AWSS3GetBucketTaggingRequest *)request;

/**
 Returns the versioning state of a bucket.
 
 @param request A container for the necessary parameters to execute the GetBucketVersioning service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSS3GetBucketVersioningOutput`.
 
 @see AWSS3GetBucketVersioningRequest
 @see AWSS3GetBucketVersioningOutput
 */
- (AWSTask *)getBucketVersioning:(AWSS3GetBucketVersioningRequest *)request;

/**
 Returns the website configuration for a bucket.
 
 @param request A container for the necessary parameters to execute the GetBucketWebsite service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSS3GetBucketWebsiteOutput`.
 
 @see AWSS3GetBucketWebsiteRequest
 @see AWSS3GetBucketWebsiteOutput
 */
- (AWSTask *)getBucketWebsite:(AWSS3GetBucketWebsiteRequest *)request;

/**
 Retrieves objects from Amazon S3.
 
 @param request A container for the necessary parameters to execute the GetObject service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSS3GetObjectOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSS3ErrorDomain` domain and the following error code: `AWSS3ErrorNoSuchKey`.
 
 @see AWSS3GetObjectRequest
 @see AWSS3GetObjectOutput
 */
- (AWSTask *)getObject:(AWSS3GetObjectRequest *)request;

/**
 Returns the access control list (ACL) of an object.
 
 @param request A container for the necessary parameters to execute the GetObjectAcl service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSS3GetObjectAclOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSS3ErrorDomain` domain and the following error code: `AWSS3ErrorNoSuchKey`.
 
 @see AWSS3GetObjectAclRequest
 @see AWSS3GetObjectAclOutput
 */
- (AWSTask *)getObjectAcl:(AWSS3GetObjectAclRequest *)request;

/**
 Return torrent files from a bucket.
 
 @param request A container for the necessary parameters to execute the GetObjectTorrent service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSS3GetObjectTorrentOutput`.
 
 @see AWSS3GetObjectTorrentRequest
 @see AWSS3GetObjectTorrentOutput
 */
- (AWSTask *)getObjectTorrent:(AWSS3GetObjectTorrentRequest *)request;

/**
 This operation is useful to determine if a bucket exists and you have permission to access it.
 
 @param request A container for the necessary parameters to execute the HeadBucket service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSS3ErrorDomain` domain and the following error code: `AWSS3ErrorNoSuchBucket`.
 
 @see AWSS3HeadBucketRequest
 */
- (AWSTask *)headBucket:(AWSS3HeadBucketRequest *)request;

/**
 The HEAD operation retrieves metadata from an object without returning the object itself. This operation is useful if you're only interested in an object's metadata. To use HEAD, you must have READ access to the object.
 
 @param request A container for the necessary parameters to execute the HeadObject service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSS3HeadObjectOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSS3ErrorDomain` domain and the following error code: `AWSS3ErrorNoSuchKey`.
 
 @see AWSS3HeadObjectRequest
 @see AWSS3HeadObjectOutput
 */
- (AWSTask *)headObject:(AWSS3HeadObjectRequest *)request;

/**
 Returns a list of all buckets owned by the authenticated sender of the request.
 
 @param request A container for the necessary parameters to execute the ListBuckets service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSS3ListBucketsOutput`.
 
 @see AWSRequest
 @see AWSS3ListBucketsOutput
 */
- (AWSTask *)listBuckets:(AWSRequest *)request;

/**
 This operation lists in-progress multipart uploads.
 
 @param request A container for the necessary parameters to execute the ListMultipartUploads service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSS3ListMultipartUploadsOutput`.
 
 @see AWSS3ListMultipartUploadsRequest
 @see AWSS3ListMultipartUploadsOutput
 */
- (AWSTask *)listMultipartUploads:(AWSS3ListMultipartUploadsRequest *)request;

/**
 Returns metadata about all of the versions of objects in a bucket.
 
 @param request A container for the necessary parameters to execute the ListObjectVersions service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSS3ListObjectVersionsOutput`.
 
 @see AWSS3ListObjectVersionsRequest
 @see AWSS3ListObjectVersionsOutput
 */
- (AWSTask *)listObjectVersions:(AWSS3ListObjectVersionsRequest *)request;

/**
 Returns some or all (up to 1000) of the objects in a bucket. You can use the request parameters as selection criteria to return a subset of the objects in a bucket.
 
 @param request A container for the necessary parameters to execute the ListObjects service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSS3ListObjectsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSS3ErrorDomain` domain and the following error code: `AWSS3ErrorNoSuchBucket`.
 
 @see AWSS3ListObjectsRequest
 @see AWSS3ListObjectsOutput
 */
- (AWSTask *)listObjects:(AWSS3ListObjectsRequest *)request;

/**
 Lists the parts that have been uploaded for a specific multipart upload.
 
 @param request A container for the necessary parameters to execute the ListParts service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSS3ListPartsOutput`.
 
 @see AWSS3ListPartsRequest
 @see AWSS3ListPartsOutput
 */
- (AWSTask *)listParts:(AWSS3ListPartsRequest *)request;

/**
 Sets the permissions on a bucket using access control lists (ACL).
 
 @param request A container for the necessary parameters to execute the PutBucketAcl service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSS3PutBucketAclRequest
 */
- (AWSTask *)putBucketAcl:(AWSS3PutBucketAclRequest *)request;

/**
 Sets the cors configuration for a bucket.
 
 @param request A container for the necessary parameters to execute the PutBucketCors service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSS3PutBucketCorsRequest
 */
- (AWSTask *)putBucketCors:(AWSS3PutBucketCorsRequest *)request;

/**
 Sets lifecycle configuration for your bucket. If a lifecycle configuration exists, it replaces it.
 
 @param request A container for the necessary parameters to execute the PutBucketLifecycle service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSS3PutBucketLifecycleRequest
 */
- (AWSTask *)putBucketLifecycle:(AWSS3PutBucketLifecycleRequest *)request;

/**
 Set the logging parameters for a bucket and to specify permissions for who can view and modify the logging parameters. To set the logging status of a bucket, you must be the bucket owner.
 
 @param request A container for the necessary parameters to execute the PutBucketLogging service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSS3PutBucketLoggingRequest
 */
- (AWSTask *)putBucketLogging:(AWSS3PutBucketLoggingRequest *)request;

/**
 Enables notifications of specified events for a bucket.
 
 @param request A container for the necessary parameters to execute the PutBucketNotification service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSS3PutBucketNotificationRequest
 */
- (AWSTask *)putBucketNotification:(AWSS3PutBucketNotificationRequest *)request;

/**
 Replaces a policy on a bucket. If the bucket already has a policy, the one in this request completely replaces it.
 
 @param request A container for the necessary parameters to execute the PutBucketPolicy service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSS3PutBucketPolicyRequest
 */
- (AWSTask *)putBucketPolicy:(AWSS3PutBucketPolicyRequest *)request;

/**
 Sets the request payment configuration for a bucket. By default, the bucket owner pays for downloads from the bucket. This configuration parameter enables the bucket owner (only) to specify that the person requesting the download will be charged for the download.
 
 @param request A container for the necessary parameters to execute the PutBucketRequestPayment service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSS3PutBucketRequestPaymentRequest
 */
- (AWSTask *)putBucketRequestPayment:(AWSS3PutBucketRequestPaymentRequest *)request;

/**
 Sets the tags for a bucket.
 
 @param request A container for the necessary parameters to execute the PutBucketTagging service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSS3PutBucketTaggingRequest
 */
- (AWSTask *)putBucketTagging:(AWSS3PutBucketTaggingRequest *)request;

/**
 Sets the versioning state of an existing bucket. To set the versioning state, you must be the bucket owner.
 
 @param request A container for the necessary parameters to execute the PutBucketVersioning service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSS3PutBucketVersioningRequest
 */
- (AWSTask *)putBucketVersioning:(AWSS3PutBucketVersioningRequest *)request;

/**
 Set the website configuration for a bucket.
 
 @param request A container for the necessary parameters to execute the PutBucketWebsite service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSS3PutBucketWebsiteRequest
 */
- (AWSTask *)putBucketWebsite:(AWSS3PutBucketWebsiteRequest *)request;

/**
 Adds an object to a bucket.
 
 @param request A container for the necessary parameters to execute the PutObject service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSS3PutObjectOutput`.
 
 @see AWSS3PutObjectRequest
 @see AWSS3PutObjectOutput
 */
- (AWSTask *)putObject:(AWSS3PutObjectRequest *)request;

/**
 uses the acl subresource to set the access control list (ACL) permissions for an object that already exists in a bucket
 
 @param request A container for the necessary parameters to execute the PutObjectAcl service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSS3ErrorDomain` domain and the following error code: `AWSS3ErrorNoSuchKey`.
 
 @see AWSS3PutObjectAclRequest
 */
- (AWSTask *)putObjectAcl:(AWSS3PutObjectAclRequest *)request;

/**
 Creates a copy of an object that is already stored in Amazon S3.
 
 @param request A container for the necessary parameters to execute the ReplicateObject service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSS3ReplicateObjectOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSS3ErrorDomain` domain and the following error code: `AWSS3ErrorObjectNotInActiveTier`.
 
 @see AWSS3ReplicateObjectRequest
 @see AWSS3ReplicateObjectOutput
 */
- (AWSTask *)replicateObject:(AWSS3ReplicateObjectRequest *)request;

/**
 Restores an archived copy of an object back into Amazon S3
 
 @param request A container for the necessary parameters to execute the RestoreObject service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSS3ErrorDomain` domain and the following error code: `AWSS3ErrorObjectAlreadyInActiveTier`.
 
 @see AWSS3RestoreObjectRequest
 */
- (AWSTask *)restoreObject:(AWSS3RestoreObjectRequest *)request;

/**
 <p>Uploads a part in a multipart upload.</p><p><b>Note:</b> After you initiate multipart upload and upload one or more parts, you must either complete or abort multipart upload in order to stop getting charged for storage of the uploaded parts. Only after you either complete or abort multipart upload, Amazon S3 frees up the parts storage and stops charging you for the parts storage.</p>
 
 @param request A container for the necessary parameters to execute the UploadPart service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSS3UploadPartOutput`.
 
 @see AWSS3UploadPartRequest
 @see AWSS3UploadPartOutput
 */
- (AWSTask *)uploadPart:(AWSS3UploadPartRequest *)request;

/**
 Uploads a part by copying data from an existing object as data source.
 
 @param request A container for the necessary parameters to execute the UploadPartCopy service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSS3UploadPartCopyOutput`.
 
 @see AWSS3UploadPartCopyRequest
 @see AWSS3UploadPartCopyOutput
 */
- (AWSTask *)uploadPartCopy:(AWSS3UploadPartCopyRequest *)request;

@end
