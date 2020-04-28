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
#import "AWSapi.ecrModel.h"
#import "AWSapi.ecrResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSapi.ecr
FOUNDATION_EXPORT NSString *const AWSapi.ecrSDKVersion;

/**
 <fullname>Amazon Elastic Container Registry</fullname><p>Amazon Elastic Container Registry (Amazon ECR) is a managed Docker registry service. Customers can use the familiar Docker CLI to push, pull, and manage images. Amazon ECR provides a secure, scalable, and reliable registry. Amazon ECR supports private Docker repositories with resource-based permissions using IAM so that specific users or Amazon EC2 instances can access repositories and images. Developers can use the Docker CLI to author and manage images.</p>
 */
@interface AWSapi.ecr : AWSService

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

     let api.ecr = AWSapi.ecr.default()

 *Objective-C*

     AWSapi.ecr *api.ecr = [AWSapi.ecr defaultapi.ecr];

 @return The default service client.
 */
+ (instancetype)defaultapi.ecr;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSapi.ecr.register(with: configuration!, forKey: "USWest2api.ecr")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSapi.ecr registerapi.ecrWithConfiguration:configuration forKey:@"USWest2api.ecr"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let api.ecr = AWSapi.ecr(forKey: "USWest2api.ecr")

 *Objective-C*

     AWSapi.ecr *api.ecr = [AWSapi.ecr api.ecrForKey:@"USWest2api.ecr"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerapi.ecrWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerapi.ecrWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSapi.ecr.register(with: configuration!, forKey: "USWest2api.ecr")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSapi.ecr registerapi.ecrWithConfiguration:configuration forKey:@"USWest2api.ecr"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let api.ecr = AWSapi.ecr(forKey: "USWest2api.ecr")

 *Objective-C*

     AWSapi.ecr *api.ecr = [AWSapi.ecr api.ecrForKey:@"USWest2api.ecr"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)api.ecrForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removeapi.ecrForKey:(NSString *)key;

/**
 <p>Checks the availability of one or more image layers in a repository.</p><p>When an image is pushed to a repository, each image layer is checked to verify if it has been uploaded before. If it has been uploaded, then the image layer is skipped.</p><note><p>This operation is used by the Amazon ECR proxy and is not generally used by customers for pulling and pushing images. In most cases, you should use the <code>docker</code> CLI to pull, tag, and push images.</p></note>
 
 @param request A container for the necessary parameters to execute the BatchCheckLayerAvailability service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.ecrBatchCheckLayerAvailabilityResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapi.ecrErrorDomain` domain and the following error code: `AWSapi.ecrErrorRepositoryNotFound`, `AWSapi.ecrErrorInvalidParameter`, `AWSapi.ecrErrorServer`.
 
 @see AWSapi.ecrBatchCheckLayerAvailabilityRequest
 @see AWSapi.ecrBatchCheckLayerAvailabilityResponse
 */
- (AWSTask<AWSapi.ecrBatchCheckLayerAvailabilityResponse *> *)batchCheckLayerAvailability:(AWSapi.ecrBatchCheckLayerAvailabilityRequest *)request;

/**
 <p>Checks the availability of one or more image layers in a repository.</p><p>When an image is pushed to a repository, each image layer is checked to verify if it has been uploaded before. If it has been uploaded, then the image layer is skipped.</p><note><p>This operation is used by the Amazon ECR proxy and is not generally used by customers for pulling and pushing images. In most cases, you should use the <code>docker</code> CLI to pull, tag, and push images.</p></note>
 
 @param request A container for the necessary parameters to execute the BatchCheckLayerAvailability service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapi.ecrErrorDomain` domain and the following error code: `AWSapi.ecrErrorRepositoryNotFound`, `AWSapi.ecrErrorInvalidParameter`, `AWSapi.ecrErrorServer`.
 
 @see AWSapi.ecrBatchCheckLayerAvailabilityRequest
 @see AWSapi.ecrBatchCheckLayerAvailabilityResponse
 */
- (void)batchCheckLayerAvailability:(AWSapi.ecrBatchCheckLayerAvailabilityRequest *)request completionHandler:(void (^ _Nullable)(AWSapi.ecrBatchCheckLayerAvailabilityResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a list of specified images within a repository. Images are specified with either an <code>imageTag</code> or <code>imageDigest</code>.</p><p>You can remove a tag from an image by specifying the image's tag in your request. When you remove the last tag from an image, the image is deleted from your repository.</p><p>You can completely delete an image (and all of its tags) by specifying the image's digest in your request.</p>
 
 @param request A container for the necessary parameters to execute the BatchDeleteImage service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.ecrBatchDeleteImageResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapi.ecrErrorDomain` domain and the following error code: `AWSapi.ecrErrorServer`, `AWSapi.ecrErrorInvalidParameter`, `AWSapi.ecrErrorRepositoryNotFound`.
 
 @see AWSapi.ecrBatchDeleteImageRequest
 @see AWSapi.ecrBatchDeleteImageResponse
 */
- (AWSTask<AWSapi.ecrBatchDeleteImageResponse *> *)batchDeleteImage:(AWSapi.ecrBatchDeleteImageRequest *)request;

/**
 <p>Deletes a list of specified images within a repository. Images are specified with either an <code>imageTag</code> or <code>imageDigest</code>.</p><p>You can remove a tag from an image by specifying the image's tag in your request. When you remove the last tag from an image, the image is deleted from your repository.</p><p>You can completely delete an image (and all of its tags) by specifying the image's digest in your request.</p>
 
 @param request A container for the necessary parameters to execute the BatchDeleteImage service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapi.ecrErrorDomain` domain and the following error code: `AWSapi.ecrErrorServer`, `AWSapi.ecrErrorInvalidParameter`, `AWSapi.ecrErrorRepositoryNotFound`.
 
 @see AWSapi.ecrBatchDeleteImageRequest
 @see AWSapi.ecrBatchDeleteImageResponse
 */
- (void)batchDeleteImage:(AWSapi.ecrBatchDeleteImageRequest *)request completionHandler:(void (^ _Nullable)(AWSapi.ecrBatchDeleteImageResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets detailed information for an image. Images are specified with either an <code>imageTag</code> or <code>imageDigest</code>.</p><p>When an image is pulled, the BatchGetImage API is called once to retrieve the image manifest.</p>
 
 @param request A container for the necessary parameters to execute the BatchGetImage service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.ecrBatchGetImageResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapi.ecrErrorDomain` domain and the following error code: `AWSapi.ecrErrorServer`, `AWSapi.ecrErrorInvalidParameter`, `AWSapi.ecrErrorRepositoryNotFound`.
 
 @see AWSapi.ecrBatchGetImageRequest
 @see AWSapi.ecrBatchGetImageResponse
 */
- (AWSTask<AWSapi.ecrBatchGetImageResponse *> *)batchGetImage:(AWSapi.ecrBatchGetImageRequest *)request;

/**
 <p>Gets detailed information for an image. Images are specified with either an <code>imageTag</code> or <code>imageDigest</code>.</p><p>When an image is pulled, the BatchGetImage API is called once to retrieve the image manifest.</p>
 
 @param request A container for the necessary parameters to execute the BatchGetImage service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapi.ecrErrorDomain` domain and the following error code: `AWSapi.ecrErrorServer`, `AWSapi.ecrErrorInvalidParameter`, `AWSapi.ecrErrorRepositoryNotFound`.
 
 @see AWSapi.ecrBatchGetImageRequest
 @see AWSapi.ecrBatchGetImageResponse
 */
- (void)batchGetImage:(AWSapi.ecrBatchGetImageRequest *)request completionHandler:(void (^ _Nullable)(AWSapi.ecrBatchGetImageResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Informs Amazon ECR that the image layer upload has completed for a specified registry, repository name, and upload ID. You can optionally provide a <code>sha256</code> digest of the image layer for data validation purposes.</p><p>When an image is pushed, the CompleteLayerUpload API is called once per each new image layer to verify that the upload has completed.</p><note><p>This operation is used by the Amazon ECR proxy and is not generally used by customers for pulling and pushing images. In most cases, you should use the <code>docker</code> CLI to pull, tag, and push images.</p></note>
 
 @param request A container for the necessary parameters to execute the CompleteLayerUpload service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.ecrCompleteLayerUploadResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapi.ecrErrorDomain` domain and the following error code: `AWSapi.ecrErrorServer`, `AWSapi.ecrErrorInvalidParameter`, `AWSapi.ecrErrorRepositoryNotFound`, `AWSapi.ecrErrorUploadNotFound`, `AWSapi.ecrErrorInvalidLayer`, `AWSapi.ecrErrorLayerPartTooSmall`, `AWSapi.ecrErrorLayerAlreadyExists`, `AWSapi.ecrErrorEmptyUpload`.
 
 @see AWSapi.ecrCompleteLayerUploadRequest
 @see AWSapi.ecrCompleteLayerUploadResponse
 */
- (AWSTask<AWSapi.ecrCompleteLayerUploadResponse *> *)completeLayerUpload:(AWSapi.ecrCompleteLayerUploadRequest *)request;

/**
 <p>Informs Amazon ECR that the image layer upload has completed for a specified registry, repository name, and upload ID. You can optionally provide a <code>sha256</code> digest of the image layer for data validation purposes.</p><p>When an image is pushed, the CompleteLayerUpload API is called once per each new image layer to verify that the upload has completed.</p><note><p>This operation is used by the Amazon ECR proxy and is not generally used by customers for pulling and pushing images. In most cases, you should use the <code>docker</code> CLI to pull, tag, and push images.</p></note>
 
 @param request A container for the necessary parameters to execute the CompleteLayerUpload service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapi.ecrErrorDomain` domain and the following error code: `AWSapi.ecrErrorServer`, `AWSapi.ecrErrorInvalidParameter`, `AWSapi.ecrErrorRepositoryNotFound`, `AWSapi.ecrErrorUploadNotFound`, `AWSapi.ecrErrorInvalidLayer`, `AWSapi.ecrErrorLayerPartTooSmall`, `AWSapi.ecrErrorLayerAlreadyExists`, `AWSapi.ecrErrorEmptyUpload`.
 
 @see AWSapi.ecrCompleteLayerUploadRequest
 @see AWSapi.ecrCompleteLayerUploadResponse
 */
- (void)completeLayerUpload:(AWSapi.ecrCompleteLayerUploadRequest *)request completionHandler:(void (^ _Nullable)(AWSapi.ecrCompleteLayerUploadResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a repository. For more information, see <a href="https://docs.aws.amazon.com/AmazonECR/latest/userguide/Repositories.html">Amazon ECR Repositories</a> in the <i>Amazon Elastic Container Registry User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateRepository service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.ecrCreateRepositoryResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapi.ecrErrorDomain` domain and the following error code: `AWSapi.ecrErrorServer`, `AWSapi.ecrErrorInvalidParameter`, `AWSapi.ecrErrorInvalidTagParameter`, `AWSapi.ecrErrorTooManyTags`, `AWSapi.ecrErrorRepositoryAlreadyExists`, `AWSapi.ecrErrorLimitExceeded`.
 
 @see AWSapi.ecrCreateRepositoryRequest
 @see AWSapi.ecrCreateRepositoryResponse
 */
- (AWSTask<AWSapi.ecrCreateRepositoryResponse *> *)createRepository:(AWSapi.ecrCreateRepositoryRequest *)request;

/**
 <p>Creates a repository. For more information, see <a href="https://docs.aws.amazon.com/AmazonECR/latest/userguide/Repositories.html">Amazon ECR Repositories</a> in the <i>Amazon Elastic Container Registry User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateRepository service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapi.ecrErrorDomain` domain and the following error code: `AWSapi.ecrErrorServer`, `AWSapi.ecrErrorInvalidParameter`, `AWSapi.ecrErrorInvalidTagParameter`, `AWSapi.ecrErrorTooManyTags`, `AWSapi.ecrErrorRepositoryAlreadyExists`, `AWSapi.ecrErrorLimitExceeded`.
 
 @see AWSapi.ecrCreateRepositoryRequest
 @see AWSapi.ecrCreateRepositoryResponse
 */
- (void)createRepository:(AWSapi.ecrCreateRepositoryRequest *)request completionHandler:(void (^ _Nullable)(AWSapi.ecrCreateRepositoryResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the lifecycle policy associated with the specified repository.</p>
 
 @param request A container for the necessary parameters to execute the DeleteLifecyclePolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.ecrDeleteLifecyclePolicyResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapi.ecrErrorDomain` domain and the following error code: `AWSapi.ecrErrorServer`, `AWSapi.ecrErrorInvalidParameter`, `AWSapi.ecrErrorRepositoryNotFound`, `AWSapi.ecrErrorLifecyclePolicyNotFound`.
 
 @see AWSapi.ecrDeleteLifecyclePolicyRequest
 @see AWSapi.ecrDeleteLifecyclePolicyResponse
 */
- (AWSTask<AWSapi.ecrDeleteLifecyclePolicyResponse *> *)deleteLifecyclePolicy:(AWSapi.ecrDeleteLifecyclePolicyRequest *)request;

/**
 <p>Deletes the lifecycle policy associated with the specified repository.</p>
 
 @param request A container for the necessary parameters to execute the DeleteLifecyclePolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapi.ecrErrorDomain` domain and the following error code: `AWSapi.ecrErrorServer`, `AWSapi.ecrErrorInvalidParameter`, `AWSapi.ecrErrorRepositoryNotFound`, `AWSapi.ecrErrorLifecyclePolicyNotFound`.
 
 @see AWSapi.ecrDeleteLifecyclePolicyRequest
 @see AWSapi.ecrDeleteLifecyclePolicyResponse
 */
- (void)deleteLifecyclePolicy:(AWSapi.ecrDeleteLifecyclePolicyRequest *)request completionHandler:(void (^ _Nullable)(AWSapi.ecrDeleteLifecyclePolicyResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a repository. If the repository contains images, you must either delete all images in the repository or use the <code>force</code> option to delete the repository.</p>
 
 @param request A container for the necessary parameters to execute the DeleteRepository service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.ecrDeleteRepositoryResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapi.ecrErrorDomain` domain and the following error code: `AWSapi.ecrErrorServer`, `AWSapi.ecrErrorInvalidParameter`, `AWSapi.ecrErrorRepositoryNotFound`, `AWSapi.ecrErrorRepositoryNotEmpty`.
 
 @see AWSapi.ecrDeleteRepositoryRequest
 @see AWSapi.ecrDeleteRepositoryResponse
 */
- (AWSTask<AWSapi.ecrDeleteRepositoryResponse *> *)deleteRepository:(AWSapi.ecrDeleteRepositoryRequest *)request;

/**
 <p>Deletes a repository. If the repository contains images, you must either delete all images in the repository or use the <code>force</code> option to delete the repository.</p>
 
 @param request A container for the necessary parameters to execute the DeleteRepository service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapi.ecrErrorDomain` domain and the following error code: `AWSapi.ecrErrorServer`, `AWSapi.ecrErrorInvalidParameter`, `AWSapi.ecrErrorRepositoryNotFound`, `AWSapi.ecrErrorRepositoryNotEmpty`.
 
 @see AWSapi.ecrDeleteRepositoryRequest
 @see AWSapi.ecrDeleteRepositoryResponse
 */
- (void)deleteRepository:(AWSapi.ecrDeleteRepositoryRequest *)request completionHandler:(void (^ _Nullable)(AWSapi.ecrDeleteRepositoryResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the repository policy associated with the specified repository.</p>
 
 @param request A container for the necessary parameters to execute the DeleteRepositoryPolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.ecrDeleteRepositoryPolicyResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapi.ecrErrorDomain` domain and the following error code: `AWSapi.ecrErrorServer`, `AWSapi.ecrErrorInvalidParameter`, `AWSapi.ecrErrorRepositoryNotFound`, `AWSapi.ecrErrorRepositoryPolicyNotFound`.
 
 @see AWSapi.ecrDeleteRepositoryPolicyRequest
 @see AWSapi.ecrDeleteRepositoryPolicyResponse
 */
- (AWSTask<AWSapi.ecrDeleteRepositoryPolicyResponse *> *)deleteRepositoryPolicy:(AWSapi.ecrDeleteRepositoryPolicyRequest *)request;

/**
 <p>Deletes the repository policy associated with the specified repository.</p>
 
 @param request A container for the necessary parameters to execute the DeleteRepositoryPolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapi.ecrErrorDomain` domain and the following error code: `AWSapi.ecrErrorServer`, `AWSapi.ecrErrorInvalidParameter`, `AWSapi.ecrErrorRepositoryNotFound`, `AWSapi.ecrErrorRepositoryPolicyNotFound`.
 
 @see AWSapi.ecrDeleteRepositoryPolicyRequest
 @see AWSapi.ecrDeleteRepositoryPolicyResponse
 */
- (void)deleteRepositoryPolicy:(AWSapi.ecrDeleteRepositoryPolicyRequest *)request completionHandler:(void (^ _Nullable)(AWSapi.ecrDeleteRepositoryPolicyResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the scan findings for the specified image.</p>
 
 @param request A container for the necessary parameters to execute the DescribeImageScanFindings service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.ecrDescribeImageScanFindingsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapi.ecrErrorDomain` domain and the following error code: `AWSapi.ecrErrorServer`, `AWSapi.ecrErrorInvalidParameter`, `AWSapi.ecrErrorRepositoryNotFound`, `AWSapi.ecrErrorImageNotFound`, `AWSapi.ecrErrorScanNotFound`.
 
 @see AWSapi.ecrDescribeImageScanFindingsRequest
 @see AWSapi.ecrDescribeImageScanFindingsResponse
 */
- (AWSTask<AWSapi.ecrDescribeImageScanFindingsResponse *> *)describeImageScanFindings:(AWSapi.ecrDescribeImageScanFindingsRequest *)request;

/**
 <p>Returns the scan findings for the specified image.</p>
 
 @param request A container for the necessary parameters to execute the DescribeImageScanFindings service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapi.ecrErrorDomain` domain and the following error code: `AWSapi.ecrErrorServer`, `AWSapi.ecrErrorInvalidParameter`, `AWSapi.ecrErrorRepositoryNotFound`, `AWSapi.ecrErrorImageNotFound`, `AWSapi.ecrErrorScanNotFound`.
 
 @see AWSapi.ecrDescribeImageScanFindingsRequest
 @see AWSapi.ecrDescribeImageScanFindingsResponse
 */
- (void)describeImageScanFindings:(AWSapi.ecrDescribeImageScanFindingsRequest *)request completionHandler:(void (^ _Nullable)(AWSapi.ecrDescribeImageScanFindingsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns metadata about the images in a repository.</p><note><p>Beginning with Docker version 1.9, the Docker client compresses image layers before pushing them to a V2 Docker registry. The output of the <code>docker images</code> command shows the uncompressed image size, so it may return a larger image size than the image sizes returned by <a>DescribeImages</a>.</p></note>
 
 @param request A container for the necessary parameters to execute the DescribeImages service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.ecrDescribeImagesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapi.ecrErrorDomain` domain and the following error code: `AWSapi.ecrErrorServer`, `AWSapi.ecrErrorInvalidParameter`, `AWSapi.ecrErrorRepositoryNotFound`, `AWSapi.ecrErrorImageNotFound`.
 
 @see AWSapi.ecrDescribeImagesRequest
 @see AWSapi.ecrDescribeImagesResponse
 */
- (AWSTask<AWSapi.ecrDescribeImagesResponse *> *)describeImages:(AWSapi.ecrDescribeImagesRequest *)request;

/**
 <p>Returns metadata about the images in a repository.</p><note><p>Beginning with Docker version 1.9, the Docker client compresses image layers before pushing them to a V2 Docker registry. The output of the <code>docker images</code> command shows the uncompressed image size, so it may return a larger image size than the image sizes returned by <a>DescribeImages</a>.</p></note>
 
 @param request A container for the necessary parameters to execute the DescribeImages service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapi.ecrErrorDomain` domain and the following error code: `AWSapi.ecrErrorServer`, `AWSapi.ecrErrorInvalidParameter`, `AWSapi.ecrErrorRepositoryNotFound`, `AWSapi.ecrErrorImageNotFound`.
 
 @see AWSapi.ecrDescribeImagesRequest
 @see AWSapi.ecrDescribeImagesResponse
 */
- (void)describeImages:(AWSapi.ecrDescribeImagesRequest *)request completionHandler:(void (^ _Nullable)(AWSapi.ecrDescribeImagesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes image repositories in a registry.</p>
 
 @param request A container for the necessary parameters to execute the DescribeRepositories service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.ecrDescribeRepositoriesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapi.ecrErrorDomain` domain and the following error code: `AWSapi.ecrErrorServer`, `AWSapi.ecrErrorInvalidParameter`, `AWSapi.ecrErrorRepositoryNotFound`.
 
 @see AWSapi.ecrDescribeRepositoriesRequest
 @see AWSapi.ecrDescribeRepositoriesResponse
 */
- (AWSTask<AWSapi.ecrDescribeRepositoriesResponse *> *)describeRepositories:(AWSapi.ecrDescribeRepositoriesRequest *)request;

/**
 <p>Describes image repositories in a registry.</p>
 
 @param request A container for the necessary parameters to execute the DescribeRepositories service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapi.ecrErrorDomain` domain and the following error code: `AWSapi.ecrErrorServer`, `AWSapi.ecrErrorInvalidParameter`, `AWSapi.ecrErrorRepositoryNotFound`.
 
 @see AWSapi.ecrDescribeRepositoriesRequest
 @see AWSapi.ecrDescribeRepositoriesResponse
 */
- (void)describeRepositories:(AWSapi.ecrDescribeRepositoriesRequest *)request completionHandler:(void (^ _Nullable)(AWSapi.ecrDescribeRepositoriesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves an authorization token. An authorization token represents your IAM authentication credentials and can be used to access any Amazon ECR registry that your IAM principal has access to. The authorization token is valid for 12 hours.</p><p>The <code>authorizationToken</code> returned is a base64 encoded string that can be decoded and used in a <code>docker login</code> command to authenticate to a registry. The AWS CLI offers an <code>get-login-password</code> command that simplifies the login process. For more information, see <a href="https://docs.aws.amazon.com/AmazonECR/latest/userguide/Registries.html#registry_auth">Registry Authentication</a> in the <i>Amazon Elastic Container Registry User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the GetAuthorizationToken service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.ecrGetAuthorizationTokenResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapi.ecrErrorDomain` domain and the following error code: `AWSapi.ecrErrorServer`, `AWSapi.ecrErrorInvalidParameter`.
 
 @see AWSapi.ecrGetAuthorizationTokenRequest
 @see AWSapi.ecrGetAuthorizationTokenResponse
 */
- (AWSTask<AWSapi.ecrGetAuthorizationTokenResponse *> *)getAuthorizationToken:(AWSapi.ecrGetAuthorizationTokenRequest *)request;

/**
 <p>Retrieves an authorization token. An authorization token represents your IAM authentication credentials and can be used to access any Amazon ECR registry that your IAM principal has access to. The authorization token is valid for 12 hours.</p><p>The <code>authorizationToken</code> returned is a base64 encoded string that can be decoded and used in a <code>docker login</code> command to authenticate to a registry. The AWS CLI offers an <code>get-login-password</code> command that simplifies the login process. For more information, see <a href="https://docs.aws.amazon.com/AmazonECR/latest/userguide/Registries.html#registry_auth">Registry Authentication</a> in the <i>Amazon Elastic Container Registry User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the GetAuthorizationToken service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapi.ecrErrorDomain` domain and the following error code: `AWSapi.ecrErrorServer`, `AWSapi.ecrErrorInvalidParameter`.
 
 @see AWSapi.ecrGetAuthorizationTokenRequest
 @see AWSapi.ecrGetAuthorizationTokenResponse
 */
- (void)getAuthorizationToken:(AWSapi.ecrGetAuthorizationTokenRequest *)request completionHandler:(void (^ _Nullable)(AWSapi.ecrGetAuthorizationTokenResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the pre-signed Amazon S3 download URL corresponding to an image layer. You can only get URLs for image layers that are referenced in an image.</p><p>When an image is pulled, the GetDownloadUrlForLayer API is called once per image layer that is not already cached.</p><note><p>This operation is used by the Amazon ECR proxy and is not generally used by customers for pulling and pushing images. In most cases, you should use the <code>docker</code> CLI to pull, tag, and push images.</p></note>
 
 @param request A container for the necessary parameters to execute the GetDownloadUrlForLayer service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.ecrGetDownloadUrlForLayerResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapi.ecrErrorDomain` domain and the following error code: `AWSapi.ecrErrorServer`, `AWSapi.ecrErrorInvalidParameter`, `AWSapi.ecrErrorLayersNotFound`, `AWSapi.ecrErrorLayerInaccessible`, `AWSapi.ecrErrorRepositoryNotFound`.
 
 @see AWSapi.ecrGetDownloadUrlForLayerRequest
 @see AWSapi.ecrGetDownloadUrlForLayerResponse
 */
- (AWSTask<AWSapi.ecrGetDownloadUrlForLayerResponse *> *)getDownloadUrlForLayer:(AWSapi.ecrGetDownloadUrlForLayerRequest *)request;

/**
 <p>Retrieves the pre-signed Amazon S3 download URL corresponding to an image layer. You can only get URLs for image layers that are referenced in an image.</p><p>When an image is pulled, the GetDownloadUrlForLayer API is called once per image layer that is not already cached.</p><note><p>This operation is used by the Amazon ECR proxy and is not generally used by customers for pulling and pushing images. In most cases, you should use the <code>docker</code> CLI to pull, tag, and push images.</p></note>
 
 @param request A container for the necessary parameters to execute the GetDownloadUrlForLayer service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapi.ecrErrorDomain` domain and the following error code: `AWSapi.ecrErrorServer`, `AWSapi.ecrErrorInvalidParameter`, `AWSapi.ecrErrorLayersNotFound`, `AWSapi.ecrErrorLayerInaccessible`, `AWSapi.ecrErrorRepositoryNotFound`.
 
 @see AWSapi.ecrGetDownloadUrlForLayerRequest
 @see AWSapi.ecrGetDownloadUrlForLayerResponse
 */
- (void)getDownloadUrlForLayer:(AWSapi.ecrGetDownloadUrlForLayerRequest *)request completionHandler:(void (^ _Nullable)(AWSapi.ecrGetDownloadUrlForLayerResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the lifecycle policy for the specified repository.</p>
 
 @param request A container for the necessary parameters to execute the GetLifecyclePolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.ecrGetLifecyclePolicyResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapi.ecrErrorDomain` domain and the following error code: `AWSapi.ecrErrorServer`, `AWSapi.ecrErrorInvalidParameter`, `AWSapi.ecrErrorRepositoryNotFound`, `AWSapi.ecrErrorLifecyclePolicyNotFound`.
 
 @see AWSapi.ecrGetLifecyclePolicyRequest
 @see AWSapi.ecrGetLifecyclePolicyResponse
 */
- (AWSTask<AWSapi.ecrGetLifecyclePolicyResponse *> *)getLifecyclePolicy:(AWSapi.ecrGetLifecyclePolicyRequest *)request;

/**
 <p>Retrieves the lifecycle policy for the specified repository.</p>
 
 @param request A container for the necessary parameters to execute the GetLifecyclePolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapi.ecrErrorDomain` domain and the following error code: `AWSapi.ecrErrorServer`, `AWSapi.ecrErrorInvalidParameter`, `AWSapi.ecrErrorRepositoryNotFound`, `AWSapi.ecrErrorLifecyclePolicyNotFound`.
 
 @see AWSapi.ecrGetLifecyclePolicyRequest
 @see AWSapi.ecrGetLifecyclePolicyResponse
 */
- (void)getLifecyclePolicy:(AWSapi.ecrGetLifecyclePolicyRequest *)request completionHandler:(void (^ _Nullable)(AWSapi.ecrGetLifecyclePolicyResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the results of the lifecycle policy preview request for the specified repository.</p>
 
 @param request A container for the necessary parameters to execute the GetLifecyclePolicyPreview service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.ecrGetLifecyclePolicyPreviewResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapi.ecrErrorDomain` domain and the following error code: `AWSapi.ecrErrorServer`, `AWSapi.ecrErrorInvalidParameter`, `AWSapi.ecrErrorRepositoryNotFound`, `AWSapi.ecrErrorLifecyclePolicyPreviewNotFound`.
 
 @see AWSapi.ecrGetLifecyclePolicyPreviewRequest
 @see AWSapi.ecrGetLifecyclePolicyPreviewResponse
 */
- (AWSTask<AWSapi.ecrGetLifecyclePolicyPreviewResponse *> *)getLifecyclePolicyPreview:(AWSapi.ecrGetLifecyclePolicyPreviewRequest *)request;

/**
 <p>Retrieves the results of the lifecycle policy preview request for the specified repository.</p>
 
 @param request A container for the necessary parameters to execute the GetLifecyclePolicyPreview service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapi.ecrErrorDomain` domain and the following error code: `AWSapi.ecrErrorServer`, `AWSapi.ecrErrorInvalidParameter`, `AWSapi.ecrErrorRepositoryNotFound`, `AWSapi.ecrErrorLifecyclePolicyPreviewNotFound`.
 
 @see AWSapi.ecrGetLifecyclePolicyPreviewRequest
 @see AWSapi.ecrGetLifecyclePolicyPreviewResponse
 */
- (void)getLifecyclePolicyPreview:(AWSapi.ecrGetLifecyclePolicyPreviewRequest *)request completionHandler:(void (^ _Nullable)(AWSapi.ecrGetLifecyclePolicyPreviewResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the repository policy for the specified repository.</p>
 
 @param request A container for the necessary parameters to execute the GetRepositoryPolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.ecrGetRepositoryPolicyResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapi.ecrErrorDomain` domain and the following error code: `AWSapi.ecrErrorServer`, `AWSapi.ecrErrorInvalidParameter`, `AWSapi.ecrErrorRepositoryNotFound`, `AWSapi.ecrErrorRepositoryPolicyNotFound`.
 
 @see AWSapi.ecrGetRepositoryPolicyRequest
 @see AWSapi.ecrGetRepositoryPolicyResponse
 */
- (AWSTask<AWSapi.ecrGetRepositoryPolicyResponse *> *)getRepositoryPolicy:(AWSapi.ecrGetRepositoryPolicyRequest *)request;

/**
 <p>Retrieves the repository policy for the specified repository.</p>
 
 @param request A container for the necessary parameters to execute the GetRepositoryPolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapi.ecrErrorDomain` domain and the following error code: `AWSapi.ecrErrorServer`, `AWSapi.ecrErrorInvalidParameter`, `AWSapi.ecrErrorRepositoryNotFound`, `AWSapi.ecrErrorRepositoryPolicyNotFound`.
 
 @see AWSapi.ecrGetRepositoryPolicyRequest
 @see AWSapi.ecrGetRepositoryPolicyResponse
 */
- (void)getRepositoryPolicy:(AWSapi.ecrGetRepositoryPolicyRequest *)request completionHandler:(void (^ _Nullable)(AWSapi.ecrGetRepositoryPolicyResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Notifies Amazon ECR that you intend to upload an image layer.</p><p>When an image is pushed, the InitiateLayerUpload API is called once per image layer that has not already been uploaded. Whether or not an image layer has been uploaded is determined by the BatchCheckLayerAvailability API action.</p><note><p>This operation is used by the Amazon ECR proxy and is not generally used by customers for pulling and pushing images. In most cases, you should use the <code>docker</code> CLI to pull, tag, and push images.</p></note>
 
 @param request A container for the necessary parameters to execute the InitiateLayerUpload service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.ecrInitiateLayerUploadResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapi.ecrErrorDomain` domain and the following error code: `AWSapi.ecrErrorServer`, `AWSapi.ecrErrorInvalidParameter`, `AWSapi.ecrErrorRepositoryNotFound`.
 
 @see AWSapi.ecrInitiateLayerUploadRequest
 @see AWSapi.ecrInitiateLayerUploadResponse
 */
- (AWSTask<AWSapi.ecrInitiateLayerUploadResponse *> *)initiateLayerUpload:(AWSapi.ecrInitiateLayerUploadRequest *)request;

/**
 <p>Notifies Amazon ECR that you intend to upload an image layer.</p><p>When an image is pushed, the InitiateLayerUpload API is called once per image layer that has not already been uploaded. Whether or not an image layer has been uploaded is determined by the BatchCheckLayerAvailability API action.</p><note><p>This operation is used by the Amazon ECR proxy and is not generally used by customers for pulling and pushing images. In most cases, you should use the <code>docker</code> CLI to pull, tag, and push images.</p></note>
 
 @param request A container for the necessary parameters to execute the InitiateLayerUpload service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapi.ecrErrorDomain` domain and the following error code: `AWSapi.ecrErrorServer`, `AWSapi.ecrErrorInvalidParameter`, `AWSapi.ecrErrorRepositoryNotFound`.
 
 @see AWSapi.ecrInitiateLayerUploadRequest
 @see AWSapi.ecrInitiateLayerUploadResponse
 */
- (void)initiateLayerUpload:(AWSapi.ecrInitiateLayerUploadRequest *)request completionHandler:(void (^ _Nullable)(AWSapi.ecrInitiateLayerUploadResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists all the image IDs for the specified repository.</p><p>You can filter images based on whether or not they are tagged by using the <code>tagStatus</code> filter and specifying either <code>TAGGED</code>, <code>UNTAGGED</code> or <code>ANY</code>. For example, you can filter your results to return only <code>UNTAGGED</code> images and then pipe that result to a <a>BatchDeleteImage</a> operation to delete them. Or, you can filter your results to return only <code>TAGGED</code> images to list all of the tags in your repository.</p>
 
 @param request A container for the necessary parameters to execute the ListImages service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.ecrListImagesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapi.ecrErrorDomain` domain and the following error code: `AWSapi.ecrErrorServer`, `AWSapi.ecrErrorInvalidParameter`, `AWSapi.ecrErrorRepositoryNotFound`.
 
 @see AWSapi.ecrListImagesRequest
 @see AWSapi.ecrListImagesResponse
 */
- (AWSTask<AWSapi.ecrListImagesResponse *> *)listImages:(AWSapi.ecrListImagesRequest *)request;

/**
 <p>Lists all the image IDs for the specified repository.</p><p>You can filter images based on whether or not they are tagged by using the <code>tagStatus</code> filter and specifying either <code>TAGGED</code>, <code>UNTAGGED</code> or <code>ANY</code>. For example, you can filter your results to return only <code>UNTAGGED</code> images and then pipe that result to a <a>BatchDeleteImage</a> operation to delete them. Or, you can filter your results to return only <code>TAGGED</code> images to list all of the tags in your repository.</p>
 
 @param request A container for the necessary parameters to execute the ListImages service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapi.ecrErrorDomain` domain and the following error code: `AWSapi.ecrErrorServer`, `AWSapi.ecrErrorInvalidParameter`, `AWSapi.ecrErrorRepositoryNotFound`.
 
 @see AWSapi.ecrListImagesRequest
 @see AWSapi.ecrListImagesResponse
 */
- (void)listImages:(AWSapi.ecrListImagesRequest *)request completionHandler:(void (^ _Nullable)(AWSapi.ecrListImagesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>List the tags for an Amazon ECR resource.</p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.ecrListTagsForResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapi.ecrErrorDomain` domain and the following error code: `AWSapi.ecrErrorInvalidParameter`, `AWSapi.ecrErrorRepositoryNotFound`, `AWSapi.ecrErrorServer`.
 
 @see AWSapi.ecrListTagsForResourceRequest
 @see AWSapi.ecrListTagsForResourceResponse
 */
- (AWSTask<AWSapi.ecrListTagsForResourceResponse *> *)listTagsForResource:(AWSapi.ecrListTagsForResourceRequest *)request;

/**
 <p>List the tags for an Amazon ECR resource.</p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapi.ecrErrorDomain` domain and the following error code: `AWSapi.ecrErrorInvalidParameter`, `AWSapi.ecrErrorRepositoryNotFound`, `AWSapi.ecrErrorServer`.
 
 @see AWSapi.ecrListTagsForResourceRequest
 @see AWSapi.ecrListTagsForResourceResponse
 */
- (void)listTagsForResource:(AWSapi.ecrListTagsForResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSapi.ecrListTagsForResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates or updates the image manifest and tags associated with an image.</p><p>When an image is pushed and all new image layers have been uploaded, the PutImage API is called once to create or update the image manifest and the tags associated with the image.</p><note><p>This operation is used by the Amazon ECR proxy and is not generally used by customers for pulling and pushing images. In most cases, you should use the <code>docker</code> CLI to pull, tag, and push images.</p></note>
 
 @param request A container for the necessary parameters to execute the PutImage service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.ecrPutImageResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapi.ecrErrorDomain` domain and the following error code: `AWSapi.ecrErrorServer`, `AWSapi.ecrErrorInvalidParameter`, `AWSapi.ecrErrorRepositoryNotFound`, `AWSapi.ecrErrorImageAlreadyExists`, `AWSapi.ecrErrorLayersNotFound`, `AWSapi.ecrErrorReferencedImagesNotFound`, `AWSapi.ecrErrorLimitExceeded`, `AWSapi.ecrErrorImageTagAlreadyExists`.
 
 @see AWSapi.ecrPutImageRequest
 @see AWSapi.ecrPutImageResponse
 */
- (AWSTask<AWSapi.ecrPutImageResponse *> *)putImage:(AWSapi.ecrPutImageRequest *)request;

/**
 <p>Creates or updates the image manifest and tags associated with an image.</p><p>When an image is pushed and all new image layers have been uploaded, the PutImage API is called once to create or update the image manifest and the tags associated with the image.</p><note><p>This operation is used by the Amazon ECR proxy and is not generally used by customers for pulling and pushing images. In most cases, you should use the <code>docker</code> CLI to pull, tag, and push images.</p></note>
 
 @param request A container for the necessary parameters to execute the PutImage service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapi.ecrErrorDomain` domain and the following error code: `AWSapi.ecrErrorServer`, `AWSapi.ecrErrorInvalidParameter`, `AWSapi.ecrErrorRepositoryNotFound`, `AWSapi.ecrErrorImageAlreadyExists`, `AWSapi.ecrErrorLayersNotFound`, `AWSapi.ecrErrorReferencedImagesNotFound`, `AWSapi.ecrErrorLimitExceeded`, `AWSapi.ecrErrorImageTagAlreadyExists`.
 
 @see AWSapi.ecrPutImageRequest
 @see AWSapi.ecrPutImageResponse
 */
- (void)putImage:(AWSapi.ecrPutImageRequest *)request completionHandler:(void (^ _Nullable)(AWSapi.ecrPutImageResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the image scanning configuration for the specified repository.</p>
 
 @param request A container for the necessary parameters to execute the PutImageScanningConfiguration service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.ecrPutImageScanningConfigurationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapi.ecrErrorDomain` domain and the following error code: `AWSapi.ecrErrorServer`, `AWSapi.ecrErrorInvalidParameter`, `AWSapi.ecrErrorRepositoryNotFound`.
 
 @see AWSapi.ecrPutImageScanningConfigurationRequest
 @see AWSapi.ecrPutImageScanningConfigurationResponse
 */
- (AWSTask<AWSapi.ecrPutImageScanningConfigurationResponse *> *)putImageScanningConfiguration:(AWSapi.ecrPutImageScanningConfigurationRequest *)request;

/**
 <p>Updates the image scanning configuration for the specified repository.</p>
 
 @param request A container for the necessary parameters to execute the PutImageScanningConfiguration service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapi.ecrErrorDomain` domain and the following error code: `AWSapi.ecrErrorServer`, `AWSapi.ecrErrorInvalidParameter`, `AWSapi.ecrErrorRepositoryNotFound`.
 
 @see AWSapi.ecrPutImageScanningConfigurationRequest
 @see AWSapi.ecrPutImageScanningConfigurationResponse
 */
- (void)putImageScanningConfiguration:(AWSapi.ecrPutImageScanningConfigurationRequest *)request completionHandler:(void (^ _Nullable)(AWSapi.ecrPutImageScanningConfigurationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the image tag mutability settings for the specified repository. For more information, see <a href="https://docs.aws.amazon.com/AmazonECR/latest/userguide/image-tag-mutability.html">Image Tag Mutability</a> in the <i>Amazon Elastic Container Registry User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the PutImageTagMutability service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.ecrPutImageTagMutabilityResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapi.ecrErrorDomain` domain and the following error code: `AWSapi.ecrErrorServer`, `AWSapi.ecrErrorInvalidParameter`, `AWSapi.ecrErrorRepositoryNotFound`.
 
 @see AWSapi.ecrPutImageTagMutabilityRequest
 @see AWSapi.ecrPutImageTagMutabilityResponse
 */
- (AWSTask<AWSapi.ecrPutImageTagMutabilityResponse *> *)putImageTagMutability:(AWSapi.ecrPutImageTagMutabilityRequest *)request;

/**
 <p>Updates the image tag mutability settings for the specified repository. For more information, see <a href="https://docs.aws.amazon.com/AmazonECR/latest/userguide/image-tag-mutability.html">Image Tag Mutability</a> in the <i>Amazon Elastic Container Registry User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the PutImageTagMutability service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapi.ecrErrorDomain` domain and the following error code: `AWSapi.ecrErrorServer`, `AWSapi.ecrErrorInvalidParameter`, `AWSapi.ecrErrorRepositoryNotFound`.
 
 @see AWSapi.ecrPutImageTagMutabilityRequest
 @see AWSapi.ecrPutImageTagMutabilityResponse
 */
- (void)putImageTagMutability:(AWSapi.ecrPutImageTagMutabilityRequest *)request completionHandler:(void (^ _Nullable)(AWSapi.ecrPutImageTagMutabilityResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates or updates the lifecycle policy for the specified repository. For more information, see <a href="https://docs.aws.amazon.com/AmazonECR/latest/userguide/LifecyclePolicies.html">Lifecycle Policy Template</a>.</p>
 
 @param request A container for the necessary parameters to execute the PutLifecyclePolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.ecrPutLifecyclePolicyResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapi.ecrErrorDomain` domain and the following error code: `AWSapi.ecrErrorServer`, `AWSapi.ecrErrorInvalidParameter`, `AWSapi.ecrErrorRepositoryNotFound`.
 
 @see AWSapi.ecrPutLifecyclePolicyRequest
 @see AWSapi.ecrPutLifecyclePolicyResponse
 */
- (AWSTask<AWSapi.ecrPutLifecyclePolicyResponse *> *)putLifecyclePolicy:(AWSapi.ecrPutLifecyclePolicyRequest *)request;

/**
 <p>Creates or updates the lifecycle policy for the specified repository. For more information, see <a href="https://docs.aws.amazon.com/AmazonECR/latest/userguide/LifecyclePolicies.html">Lifecycle Policy Template</a>.</p>
 
 @param request A container for the necessary parameters to execute the PutLifecyclePolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapi.ecrErrorDomain` domain and the following error code: `AWSapi.ecrErrorServer`, `AWSapi.ecrErrorInvalidParameter`, `AWSapi.ecrErrorRepositoryNotFound`.
 
 @see AWSapi.ecrPutLifecyclePolicyRequest
 @see AWSapi.ecrPutLifecyclePolicyResponse
 */
- (void)putLifecyclePolicy:(AWSapi.ecrPutLifecyclePolicyRequest *)request completionHandler:(void (^ _Nullable)(AWSapi.ecrPutLifecyclePolicyResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Applies a repository policy to the specified repository to control access permissions. For more information, see <a href="https://docs.aws.amazon.com/AmazonECR/latest/userguide/RepositoryPolicies.html">Amazon ECR Repository Policies</a> in the <i>Amazon Elastic Container Registry User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the SetRepositoryPolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.ecrSetRepositoryPolicyResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapi.ecrErrorDomain` domain and the following error code: `AWSapi.ecrErrorServer`, `AWSapi.ecrErrorInvalidParameter`, `AWSapi.ecrErrorRepositoryNotFound`.
 
 @see AWSapi.ecrSetRepositoryPolicyRequest
 @see AWSapi.ecrSetRepositoryPolicyResponse
 */
- (AWSTask<AWSapi.ecrSetRepositoryPolicyResponse *> *)setRepositoryPolicy:(AWSapi.ecrSetRepositoryPolicyRequest *)request;

/**
 <p>Applies a repository policy to the specified repository to control access permissions. For more information, see <a href="https://docs.aws.amazon.com/AmazonECR/latest/userguide/RepositoryPolicies.html">Amazon ECR Repository Policies</a> in the <i>Amazon Elastic Container Registry User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the SetRepositoryPolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapi.ecrErrorDomain` domain and the following error code: `AWSapi.ecrErrorServer`, `AWSapi.ecrErrorInvalidParameter`, `AWSapi.ecrErrorRepositoryNotFound`.
 
 @see AWSapi.ecrSetRepositoryPolicyRequest
 @see AWSapi.ecrSetRepositoryPolicyResponse
 */
- (void)setRepositoryPolicy:(AWSapi.ecrSetRepositoryPolicyRequest *)request completionHandler:(void (^ _Nullable)(AWSapi.ecrSetRepositoryPolicyResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Starts an image vulnerability scan. An image scan can only be started once per day on an individual image. This limit includes if an image was scanned on initial push. For more information, see <a href="https://docs.aws.amazon.com/AmazonECR/latest/userguide/image-scanning.html">Image Scanning</a> in the <i>Amazon Elastic Container Registry User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the StartImageScan service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.ecrStartImageScanResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapi.ecrErrorDomain` domain and the following error code: `AWSapi.ecrErrorServer`, `AWSapi.ecrErrorInvalidParameter`, `AWSapi.ecrErrorUnsupportedImageType`, `AWSapi.ecrErrorLimitExceeded`, `AWSapi.ecrErrorRepositoryNotFound`, `AWSapi.ecrErrorImageNotFound`.
 
 @see AWSapi.ecrStartImageScanRequest
 @see AWSapi.ecrStartImageScanResponse
 */
- (AWSTask<AWSapi.ecrStartImageScanResponse *> *)startImageScan:(AWSapi.ecrStartImageScanRequest *)request;

/**
 <p>Starts an image vulnerability scan. An image scan can only be started once per day on an individual image. This limit includes if an image was scanned on initial push. For more information, see <a href="https://docs.aws.amazon.com/AmazonECR/latest/userguide/image-scanning.html">Image Scanning</a> in the <i>Amazon Elastic Container Registry User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the StartImageScan service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapi.ecrErrorDomain` domain and the following error code: `AWSapi.ecrErrorServer`, `AWSapi.ecrErrorInvalidParameter`, `AWSapi.ecrErrorUnsupportedImageType`, `AWSapi.ecrErrorLimitExceeded`, `AWSapi.ecrErrorRepositoryNotFound`, `AWSapi.ecrErrorImageNotFound`.
 
 @see AWSapi.ecrStartImageScanRequest
 @see AWSapi.ecrStartImageScanResponse
 */
- (void)startImageScan:(AWSapi.ecrStartImageScanRequest *)request completionHandler:(void (^ _Nullable)(AWSapi.ecrStartImageScanResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Starts a preview of a lifecycle policy for the specified repository. This allows you to see the results before associating the lifecycle policy with the repository.</p>
 
 @param request A container for the necessary parameters to execute the StartLifecyclePolicyPreview service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.ecrStartLifecyclePolicyPreviewResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapi.ecrErrorDomain` domain and the following error code: `AWSapi.ecrErrorServer`, `AWSapi.ecrErrorInvalidParameter`, `AWSapi.ecrErrorRepositoryNotFound`, `AWSapi.ecrErrorLifecyclePolicyNotFound`, `AWSapi.ecrErrorLifecyclePolicyPreviewInProgress`.
 
 @see AWSapi.ecrStartLifecyclePolicyPreviewRequest
 @see AWSapi.ecrStartLifecyclePolicyPreviewResponse
 */
- (AWSTask<AWSapi.ecrStartLifecyclePolicyPreviewResponse *> *)startLifecyclePolicyPreview:(AWSapi.ecrStartLifecyclePolicyPreviewRequest *)request;

/**
 <p>Starts a preview of a lifecycle policy for the specified repository. This allows you to see the results before associating the lifecycle policy with the repository.</p>
 
 @param request A container for the necessary parameters to execute the StartLifecyclePolicyPreview service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapi.ecrErrorDomain` domain and the following error code: `AWSapi.ecrErrorServer`, `AWSapi.ecrErrorInvalidParameter`, `AWSapi.ecrErrorRepositoryNotFound`, `AWSapi.ecrErrorLifecyclePolicyNotFound`, `AWSapi.ecrErrorLifecyclePolicyPreviewInProgress`.
 
 @see AWSapi.ecrStartLifecyclePolicyPreviewRequest
 @see AWSapi.ecrStartLifecyclePolicyPreviewResponse
 */
- (void)startLifecyclePolicyPreview:(AWSapi.ecrStartLifecyclePolicyPreviewRequest *)request completionHandler:(void (^ _Nullable)(AWSapi.ecrStartLifecyclePolicyPreviewResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Adds specified tags to a resource with the specified ARN. Existing tags on a resource are not changed if they are not specified in the request parameters.</p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.ecrTagResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapi.ecrErrorDomain` domain and the following error code: `AWSapi.ecrErrorInvalidParameter`, `AWSapi.ecrErrorInvalidTagParameter`, `AWSapi.ecrErrorTooManyTags`, `AWSapi.ecrErrorRepositoryNotFound`, `AWSapi.ecrErrorServer`.
 
 @see AWSapi.ecrTagResourceRequest
 @see AWSapi.ecrTagResourceResponse
 */
- (AWSTask<AWSapi.ecrTagResourceResponse *> *)tagResource:(AWSapi.ecrTagResourceRequest *)request;

/**
 <p>Adds specified tags to a resource with the specified ARN. Existing tags on a resource are not changed if they are not specified in the request parameters.</p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapi.ecrErrorDomain` domain and the following error code: `AWSapi.ecrErrorInvalidParameter`, `AWSapi.ecrErrorInvalidTagParameter`, `AWSapi.ecrErrorTooManyTags`, `AWSapi.ecrErrorRepositoryNotFound`, `AWSapi.ecrErrorServer`.
 
 @see AWSapi.ecrTagResourceRequest
 @see AWSapi.ecrTagResourceResponse
 */
- (void)tagResource:(AWSapi.ecrTagResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSapi.ecrTagResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes specified tags from a resource.</p>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.ecrUntagResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapi.ecrErrorDomain` domain and the following error code: `AWSapi.ecrErrorInvalidParameter`, `AWSapi.ecrErrorInvalidTagParameter`, `AWSapi.ecrErrorTooManyTags`, `AWSapi.ecrErrorRepositoryNotFound`, `AWSapi.ecrErrorServer`.
 
 @see AWSapi.ecrUntagResourceRequest
 @see AWSapi.ecrUntagResourceResponse
 */
- (AWSTask<AWSapi.ecrUntagResourceResponse *> *)untagResource:(AWSapi.ecrUntagResourceRequest *)request;

/**
 <p>Deletes specified tags from a resource.</p>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapi.ecrErrorDomain` domain and the following error code: `AWSapi.ecrErrorInvalidParameter`, `AWSapi.ecrErrorInvalidTagParameter`, `AWSapi.ecrErrorTooManyTags`, `AWSapi.ecrErrorRepositoryNotFound`, `AWSapi.ecrErrorServer`.
 
 @see AWSapi.ecrUntagResourceRequest
 @see AWSapi.ecrUntagResourceResponse
 */
- (void)untagResource:(AWSapi.ecrUntagResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSapi.ecrUntagResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Uploads an image layer part to Amazon ECR.</p><p>When an image is pushed, each new image layer is uploaded in parts. The maximum size of each image layer part can be 20971520 bytes (or about 20MB). The UploadLayerPart API is called once per each new image layer part.</p><note><p>This operation is used by the Amazon ECR proxy and is not generally used by customers for pulling and pushing images. In most cases, you should use the <code>docker</code> CLI to pull, tag, and push images.</p></note>
 
 @param request A container for the necessary parameters to execute the UploadLayerPart service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.ecrUploadLayerPartResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapi.ecrErrorDomain` domain and the following error code: `AWSapi.ecrErrorServer`, `AWSapi.ecrErrorInvalidParameter`, `AWSapi.ecrErrorInvalidLayerPart`, `AWSapi.ecrErrorRepositoryNotFound`, `AWSapi.ecrErrorUploadNotFound`, `AWSapi.ecrErrorLimitExceeded`.
 
 @see AWSapi.ecrUploadLayerPartRequest
 @see AWSapi.ecrUploadLayerPartResponse
 */
- (AWSTask<AWSapi.ecrUploadLayerPartResponse *> *)uploadLayerPart:(AWSapi.ecrUploadLayerPartRequest *)request;

/**
 <p>Uploads an image layer part to Amazon ECR.</p><p>When an image is pushed, each new image layer is uploaded in parts. The maximum size of each image layer part can be 20971520 bytes (or about 20MB). The UploadLayerPart API is called once per each new image layer part.</p><note><p>This operation is used by the Amazon ECR proxy and is not generally used by customers for pulling and pushing images. In most cases, you should use the <code>docker</code> CLI to pull, tag, and push images.</p></note>
 
 @param request A container for the necessary parameters to execute the UploadLayerPart service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapi.ecrErrorDomain` domain and the following error code: `AWSapi.ecrErrorServer`, `AWSapi.ecrErrorInvalidParameter`, `AWSapi.ecrErrorInvalidLayerPart`, `AWSapi.ecrErrorRepositoryNotFound`, `AWSapi.ecrErrorUploadNotFound`, `AWSapi.ecrErrorLimitExceeded`.
 
 @see AWSapi.ecrUploadLayerPartRequest
 @see AWSapi.ecrUploadLayerPartResponse
 */
- (void)uploadLayerPart:(AWSapi.ecrUploadLayerPartRequest *)request completionHandler:(void (^ _Nullable)(AWSapi.ecrUploadLayerPartResponse * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
