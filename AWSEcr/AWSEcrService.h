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
#import "AWSEcrModel.h"
#import "AWSEcrResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSEcr
FOUNDATION_EXPORT NSString *const AWSEcrSDKVersion;

/**
 <fullname>Amazon Elastic Container Registry</fullname><p>Amazon Elastic Container Registry (Amazon ECR) is a managed Docker registry service. Customers can use the familiar Docker CLI to push, pull, and manage images. Amazon ECR provides a secure, scalable, and reliable registry. Amazon ECR supports private Docker repositories with resource-based permissions using IAM so that specific users or Amazon EC2 instances can access repositories and images. Developers can use the Docker CLI to author and manage images.</p>
 */
@interface AWSEcr : AWSService

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

     let Ecr = AWSEcr.default()

 *Objective-C*

     AWSEcr *Ecr = [AWSEcr defaultEcr];

 @return The default service client.
 */
+ (instancetype)defaultEcr;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSEcr.register(with: configuration!, forKey: "USWest2Ecr")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSEcr registerEcrWithConfiguration:configuration forKey:@"USWest2Ecr"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Ecr = AWSEcr(forKey: "USWest2Ecr")

 *Objective-C*

     AWSEcr *Ecr = [AWSEcr EcrForKey:@"USWest2Ecr"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerEcrWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerEcrWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSEcr.register(with: configuration!, forKey: "USWest2Ecr")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSEcr registerEcrWithConfiguration:configuration forKey:@"USWest2Ecr"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Ecr = AWSEcr(forKey: "USWest2Ecr")

 *Objective-C*

     AWSEcr *Ecr = [AWSEcr EcrForKey:@"USWest2Ecr"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)EcrForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removeEcrForKey:(NSString *)key;

/**
 <p>Checks the availability of one or more image layers in a repository.</p><p>When an image is pushed to a repository, each image layer is checked to verify if it has been uploaded before. If it has been uploaded, then the image layer is skipped.</p><note><p>This operation is used by the Amazon ECR proxy and is not generally used by customers for pulling and pushing images. In most cases, you should use the <code>docker</code> CLI to pull, tag, and push images.</p></note>
 
 @param request A container for the necessary parameters to execute the BatchCheckLayerAvailability service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEcrBatchCheckLayerAvailabilityResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSEcrErrorDomain` domain and the following error code: `AWSEcrErrorRepositoryNotFound`, `AWSEcrErrorInvalidParameter`, `AWSEcrErrorServer`.
 
 @see AWSEcrBatchCheckLayerAvailabilityRequest
 @see AWSEcrBatchCheckLayerAvailabilityResponse
 */
- (AWSTask<AWSEcrBatchCheckLayerAvailabilityResponse *> *)batchCheckLayerAvailability:(AWSEcrBatchCheckLayerAvailabilityRequest *)request;

/**
 <p>Checks the availability of one or more image layers in a repository.</p><p>When an image is pushed to a repository, each image layer is checked to verify if it has been uploaded before. If it has been uploaded, then the image layer is skipped.</p><note><p>This operation is used by the Amazon ECR proxy and is not generally used by customers for pulling and pushing images. In most cases, you should use the <code>docker</code> CLI to pull, tag, and push images.</p></note>
 
 @param request A container for the necessary parameters to execute the BatchCheckLayerAvailability service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSEcrErrorDomain` domain and the following error code: `AWSEcrErrorRepositoryNotFound`, `AWSEcrErrorInvalidParameter`, `AWSEcrErrorServer`.
 
 @see AWSEcrBatchCheckLayerAvailabilityRequest
 @see AWSEcrBatchCheckLayerAvailabilityResponse
 */
- (void)batchCheckLayerAvailability:(AWSEcrBatchCheckLayerAvailabilityRequest *)request completionHandler:(void (^ _Nullable)(AWSEcrBatchCheckLayerAvailabilityResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a list of specified images within a repository. Images are specified with either an <code>imageTag</code> or <code>imageDigest</code>.</p><p>You can remove a tag from an image by specifying the image's tag in your request. When you remove the last tag from an image, the image is deleted from your repository.</p><p>You can completely delete an image (and all of its tags) by specifying the image's digest in your request.</p>
 
 @param request A container for the necessary parameters to execute the BatchDeleteImage service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEcrBatchDeleteImageResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSEcrErrorDomain` domain and the following error code: `AWSEcrErrorServer`, `AWSEcrErrorInvalidParameter`, `AWSEcrErrorRepositoryNotFound`.
 
 @see AWSEcrBatchDeleteImageRequest
 @see AWSEcrBatchDeleteImageResponse
 */
- (AWSTask<AWSEcrBatchDeleteImageResponse *> *)batchDeleteImage:(AWSEcrBatchDeleteImageRequest *)request;

/**
 <p>Deletes a list of specified images within a repository. Images are specified with either an <code>imageTag</code> or <code>imageDigest</code>.</p><p>You can remove a tag from an image by specifying the image's tag in your request. When you remove the last tag from an image, the image is deleted from your repository.</p><p>You can completely delete an image (and all of its tags) by specifying the image's digest in your request.</p>
 
 @param request A container for the necessary parameters to execute the BatchDeleteImage service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSEcrErrorDomain` domain and the following error code: `AWSEcrErrorServer`, `AWSEcrErrorInvalidParameter`, `AWSEcrErrorRepositoryNotFound`.
 
 @see AWSEcrBatchDeleteImageRequest
 @see AWSEcrBatchDeleteImageResponse
 */
- (void)batchDeleteImage:(AWSEcrBatchDeleteImageRequest *)request completionHandler:(void (^ _Nullable)(AWSEcrBatchDeleteImageResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets detailed information for an image. Images are specified with either an <code>imageTag</code> or <code>imageDigest</code>.</p><p>When an image is pulled, the BatchGetImage API is called once to retrieve the image manifest.</p>
 
 @param request A container for the necessary parameters to execute the BatchGetImage service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEcrBatchGetImageResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSEcrErrorDomain` domain and the following error code: `AWSEcrErrorServer`, `AWSEcrErrorInvalidParameter`, `AWSEcrErrorRepositoryNotFound`.
 
 @see AWSEcrBatchGetImageRequest
 @see AWSEcrBatchGetImageResponse
 */
- (AWSTask<AWSEcrBatchGetImageResponse *> *)batchGetImage:(AWSEcrBatchGetImageRequest *)request;

/**
 <p>Gets detailed information for an image. Images are specified with either an <code>imageTag</code> or <code>imageDigest</code>.</p><p>When an image is pulled, the BatchGetImage API is called once to retrieve the image manifest.</p>
 
 @param request A container for the necessary parameters to execute the BatchGetImage service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSEcrErrorDomain` domain and the following error code: `AWSEcrErrorServer`, `AWSEcrErrorInvalidParameter`, `AWSEcrErrorRepositoryNotFound`.
 
 @see AWSEcrBatchGetImageRequest
 @see AWSEcrBatchGetImageResponse
 */
- (void)batchGetImage:(AWSEcrBatchGetImageRequest *)request completionHandler:(void (^ _Nullable)(AWSEcrBatchGetImageResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Informs Amazon ECR that the image layer upload has completed for a specified registry, repository name, and upload ID. You can optionally provide a <code>sha256</code> digest of the image layer for data validation purposes.</p><p>When an image is pushed, the CompleteLayerUpload API is called once per each new image layer to verify that the upload has completed.</p><note><p>This operation is used by the Amazon ECR proxy and is not generally used by customers for pulling and pushing images. In most cases, you should use the <code>docker</code> CLI to pull, tag, and push images.</p></note>
 
 @param request A container for the necessary parameters to execute the CompleteLayerUpload service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEcrCompleteLayerUploadResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSEcrErrorDomain` domain and the following error code: `AWSEcrErrorServer`, `AWSEcrErrorInvalidParameter`, `AWSEcrErrorRepositoryNotFound`, `AWSEcrErrorUploadNotFound`, `AWSEcrErrorInvalidLayer`, `AWSEcrErrorLayerPartTooSmall`, `AWSEcrErrorLayerAlreadyExists`, `AWSEcrErrorEmptyUpload`.
 
 @see AWSEcrCompleteLayerUploadRequest
 @see AWSEcrCompleteLayerUploadResponse
 */
- (AWSTask<AWSEcrCompleteLayerUploadResponse *> *)completeLayerUpload:(AWSEcrCompleteLayerUploadRequest *)request;

/**
 <p>Informs Amazon ECR that the image layer upload has completed for a specified registry, repository name, and upload ID. You can optionally provide a <code>sha256</code> digest of the image layer for data validation purposes.</p><p>When an image is pushed, the CompleteLayerUpload API is called once per each new image layer to verify that the upload has completed.</p><note><p>This operation is used by the Amazon ECR proxy and is not generally used by customers for pulling and pushing images. In most cases, you should use the <code>docker</code> CLI to pull, tag, and push images.</p></note>
 
 @param request A container for the necessary parameters to execute the CompleteLayerUpload service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSEcrErrorDomain` domain and the following error code: `AWSEcrErrorServer`, `AWSEcrErrorInvalidParameter`, `AWSEcrErrorRepositoryNotFound`, `AWSEcrErrorUploadNotFound`, `AWSEcrErrorInvalidLayer`, `AWSEcrErrorLayerPartTooSmall`, `AWSEcrErrorLayerAlreadyExists`, `AWSEcrErrorEmptyUpload`.
 
 @see AWSEcrCompleteLayerUploadRequest
 @see AWSEcrCompleteLayerUploadResponse
 */
- (void)completeLayerUpload:(AWSEcrCompleteLayerUploadRequest *)request completionHandler:(void (^ _Nullable)(AWSEcrCompleteLayerUploadResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a repository. For more information, see <a href="https://docs.aws.amazon.com/AmazonECR/latest/userguide/Repositories.html">Amazon ECR Repositories</a> in the <i>Amazon Elastic Container Registry User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateRepository service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEcrCreateRepositoryResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSEcrErrorDomain` domain and the following error code: `AWSEcrErrorServer`, `AWSEcrErrorInvalidParameter`, `AWSEcrErrorInvalidTagParameter`, `AWSEcrErrorTooManyTags`, `AWSEcrErrorRepositoryAlreadyExists`, `AWSEcrErrorLimitExceeded`.
 
 @see AWSEcrCreateRepositoryRequest
 @see AWSEcrCreateRepositoryResponse
 */
- (AWSTask<AWSEcrCreateRepositoryResponse *> *)createRepository:(AWSEcrCreateRepositoryRequest *)request;

/**
 <p>Creates a repository. For more information, see <a href="https://docs.aws.amazon.com/AmazonECR/latest/userguide/Repositories.html">Amazon ECR Repositories</a> in the <i>Amazon Elastic Container Registry User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateRepository service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSEcrErrorDomain` domain and the following error code: `AWSEcrErrorServer`, `AWSEcrErrorInvalidParameter`, `AWSEcrErrorInvalidTagParameter`, `AWSEcrErrorTooManyTags`, `AWSEcrErrorRepositoryAlreadyExists`, `AWSEcrErrorLimitExceeded`.
 
 @see AWSEcrCreateRepositoryRequest
 @see AWSEcrCreateRepositoryResponse
 */
- (void)createRepository:(AWSEcrCreateRepositoryRequest *)request completionHandler:(void (^ _Nullable)(AWSEcrCreateRepositoryResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the lifecycle policy associated with the specified repository.</p>
 
 @param request A container for the necessary parameters to execute the DeleteLifecyclePolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEcrDeleteLifecyclePolicyResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSEcrErrorDomain` domain and the following error code: `AWSEcrErrorServer`, `AWSEcrErrorInvalidParameter`, `AWSEcrErrorRepositoryNotFound`, `AWSEcrErrorLifecyclePolicyNotFound`.
 
 @see AWSEcrDeleteLifecyclePolicyRequest
 @see AWSEcrDeleteLifecyclePolicyResponse
 */
- (AWSTask<AWSEcrDeleteLifecyclePolicyResponse *> *)deleteLifecyclePolicy:(AWSEcrDeleteLifecyclePolicyRequest *)request;

/**
 <p>Deletes the lifecycle policy associated with the specified repository.</p>
 
 @param request A container for the necessary parameters to execute the DeleteLifecyclePolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSEcrErrorDomain` domain and the following error code: `AWSEcrErrorServer`, `AWSEcrErrorInvalidParameter`, `AWSEcrErrorRepositoryNotFound`, `AWSEcrErrorLifecyclePolicyNotFound`.
 
 @see AWSEcrDeleteLifecyclePolicyRequest
 @see AWSEcrDeleteLifecyclePolicyResponse
 */
- (void)deleteLifecyclePolicy:(AWSEcrDeleteLifecyclePolicyRequest *)request completionHandler:(void (^ _Nullable)(AWSEcrDeleteLifecyclePolicyResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a repository. If the repository contains images, you must either delete all images in the repository or use the <code>force</code> option to delete the repository.</p>
 
 @param request A container for the necessary parameters to execute the DeleteRepository service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEcrDeleteRepositoryResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSEcrErrorDomain` domain and the following error code: `AWSEcrErrorServer`, `AWSEcrErrorInvalidParameter`, `AWSEcrErrorRepositoryNotFound`, `AWSEcrErrorRepositoryNotEmpty`.
 
 @see AWSEcrDeleteRepositoryRequest
 @see AWSEcrDeleteRepositoryResponse
 */
- (AWSTask<AWSEcrDeleteRepositoryResponse *> *)deleteRepository:(AWSEcrDeleteRepositoryRequest *)request;

/**
 <p>Deletes a repository. If the repository contains images, you must either delete all images in the repository or use the <code>force</code> option to delete the repository.</p>
 
 @param request A container for the necessary parameters to execute the DeleteRepository service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSEcrErrorDomain` domain and the following error code: `AWSEcrErrorServer`, `AWSEcrErrorInvalidParameter`, `AWSEcrErrorRepositoryNotFound`, `AWSEcrErrorRepositoryNotEmpty`.
 
 @see AWSEcrDeleteRepositoryRequest
 @see AWSEcrDeleteRepositoryResponse
 */
- (void)deleteRepository:(AWSEcrDeleteRepositoryRequest *)request completionHandler:(void (^ _Nullable)(AWSEcrDeleteRepositoryResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the repository policy associated with the specified repository.</p>
 
 @param request A container for the necessary parameters to execute the DeleteRepositoryPolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEcrDeleteRepositoryPolicyResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSEcrErrorDomain` domain and the following error code: `AWSEcrErrorServer`, `AWSEcrErrorInvalidParameter`, `AWSEcrErrorRepositoryNotFound`, `AWSEcrErrorRepositoryPolicyNotFound`.
 
 @see AWSEcrDeleteRepositoryPolicyRequest
 @see AWSEcrDeleteRepositoryPolicyResponse
 */
- (AWSTask<AWSEcrDeleteRepositoryPolicyResponse *> *)deleteRepositoryPolicy:(AWSEcrDeleteRepositoryPolicyRequest *)request;

/**
 <p>Deletes the repository policy associated with the specified repository.</p>
 
 @param request A container for the necessary parameters to execute the DeleteRepositoryPolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSEcrErrorDomain` domain and the following error code: `AWSEcrErrorServer`, `AWSEcrErrorInvalidParameter`, `AWSEcrErrorRepositoryNotFound`, `AWSEcrErrorRepositoryPolicyNotFound`.
 
 @see AWSEcrDeleteRepositoryPolicyRequest
 @see AWSEcrDeleteRepositoryPolicyResponse
 */
- (void)deleteRepositoryPolicy:(AWSEcrDeleteRepositoryPolicyRequest *)request completionHandler:(void (^ _Nullable)(AWSEcrDeleteRepositoryPolicyResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the scan findings for the specified image.</p>
 
 @param request A container for the necessary parameters to execute the DescribeImageScanFindings service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEcrDescribeImageScanFindingsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSEcrErrorDomain` domain and the following error code: `AWSEcrErrorServer`, `AWSEcrErrorInvalidParameter`, `AWSEcrErrorRepositoryNotFound`, `AWSEcrErrorImageNotFound`, `AWSEcrErrorScanNotFound`.
 
 @see AWSEcrDescribeImageScanFindingsRequest
 @see AWSEcrDescribeImageScanFindingsResponse
 */
- (AWSTask<AWSEcrDescribeImageScanFindingsResponse *> *)describeImageScanFindings:(AWSEcrDescribeImageScanFindingsRequest *)request;

/**
 <p>Returns the scan findings for the specified image.</p>
 
 @param request A container for the necessary parameters to execute the DescribeImageScanFindings service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSEcrErrorDomain` domain and the following error code: `AWSEcrErrorServer`, `AWSEcrErrorInvalidParameter`, `AWSEcrErrorRepositoryNotFound`, `AWSEcrErrorImageNotFound`, `AWSEcrErrorScanNotFound`.
 
 @see AWSEcrDescribeImageScanFindingsRequest
 @see AWSEcrDescribeImageScanFindingsResponse
 */
- (void)describeImageScanFindings:(AWSEcrDescribeImageScanFindingsRequest *)request completionHandler:(void (^ _Nullable)(AWSEcrDescribeImageScanFindingsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns metadata about the images in a repository.</p><note><p>Beginning with Docker version 1.9, the Docker client compresses image layers before pushing them to a V2 Docker registry. The output of the <code>docker images</code> command shows the uncompressed image size, so it may return a larger image size than the image sizes returned by <a>DescribeImages</a>.</p></note>
 
 @param request A container for the necessary parameters to execute the DescribeImages service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEcrDescribeImagesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSEcrErrorDomain` domain and the following error code: `AWSEcrErrorServer`, `AWSEcrErrorInvalidParameter`, `AWSEcrErrorRepositoryNotFound`, `AWSEcrErrorImageNotFound`.
 
 @see AWSEcrDescribeImagesRequest
 @see AWSEcrDescribeImagesResponse
 */
- (AWSTask<AWSEcrDescribeImagesResponse *> *)describeImages:(AWSEcrDescribeImagesRequest *)request;

/**
 <p>Returns metadata about the images in a repository.</p><note><p>Beginning with Docker version 1.9, the Docker client compresses image layers before pushing them to a V2 Docker registry. The output of the <code>docker images</code> command shows the uncompressed image size, so it may return a larger image size than the image sizes returned by <a>DescribeImages</a>.</p></note>
 
 @param request A container for the necessary parameters to execute the DescribeImages service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSEcrErrorDomain` domain and the following error code: `AWSEcrErrorServer`, `AWSEcrErrorInvalidParameter`, `AWSEcrErrorRepositoryNotFound`, `AWSEcrErrorImageNotFound`.
 
 @see AWSEcrDescribeImagesRequest
 @see AWSEcrDescribeImagesResponse
 */
- (void)describeImages:(AWSEcrDescribeImagesRequest *)request completionHandler:(void (^ _Nullable)(AWSEcrDescribeImagesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes image repositories in a registry.</p>
 
 @param request A container for the necessary parameters to execute the DescribeRepositories service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEcrDescribeRepositoriesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSEcrErrorDomain` domain and the following error code: `AWSEcrErrorServer`, `AWSEcrErrorInvalidParameter`, `AWSEcrErrorRepositoryNotFound`.
 
 @see AWSEcrDescribeRepositoriesRequest
 @see AWSEcrDescribeRepositoriesResponse
 */
- (AWSTask<AWSEcrDescribeRepositoriesResponse *> *)describeRepositories:(AWSEcrDescribeRepositoriesRequest *)request;

/**
 <p>Describes image repositories in a registry.</p>
 
 @param request A container for the necessary parameters to execute the DescribeRepositories service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSEcrErrorDomain` domain and the following error code: `AWSEcrErrorServer`, `AWSEcrErrorInvalidParameter`, `AWSEcrErrorRepositoryNotFound`.
 
 @see AWSEcrDescribeRepositoriesRequest
 @see AWSEcrDescribeRepositoriesResponse
 */
- (void)describeRepositories:(AWSEcrDescribeRepositoriesRequest *)request completionHandler:(void (^ _Nullable)(AWSEcrDescribeRepositoriesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves an authorization token. An authorization token represents your IAM authentication credentials and can be used to access any Amazon ECR registry that your IAM principal has access to. The authorization token is valid for 12 hours.</p><p>The <code>authorizationToken</code> returned is a base64 encoded string that can be decoded and used in a <code>docker login</code> command to authenticate to a registry. The AWS CLI offers an <code>get-login-password</code> command that simplifies the login process. For more information, see <a href="https://docs.aws.amazon.com/AmazonECR/latest/userguide/Registries.html#registry_auth">Registry Authentication</a> in the <i>Amazon Elastic Container Registry User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the GetAuthorizationToken service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEcrGetAuthorizationTokenResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSEcrErrorDomain` domain and the following error code: `AWSEcrErrorServer`, `AWSEcrErrorInvalidParameter`.
 
 @see AWSEcrGetAuthorizationTokenRequest
 @see AWSEcrGetAuthorizationTokenResponse
 */
- (AWSTask<AWSEcrGetAuthorizationTokenResponse *> *)getAuthorizationToken:(AWSEcrGetAuthorizationTokenRequest *)request;

/**
 <p>Retrieves an authorization token. An authorization token represents your IAM authentication credentials and can be used to access any Amazon ECR registry that your IAM principal has access to. The authorization token is valid for 12 hours.</p><p>The <code>authorizationToken</code> returned is a base64 encoded string that can be decoded and used in a <code>docker login</code> command to authenticate to a registry. The AWS CLI offers an <code>get-login-password</code> command that simplifies the login process. For more information, see <a href="https://docs.aws.amazon.com/AmazonECR/latest/userguide/Registries.html#registry_auth">Registry Authentication</a> in the <i>Amazon Elastic Container Registry User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the GetAuthorizationToken service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSEcrErrorDomain` domain and the following error code: `AWSEcrErrorServer`, `AWSEcrErrorInvalidParameter`.
 
 @see AWSEcrGetAuthorizationTokenRequest
 @see AWSEcrGetAuthorizationTokenResponse
 */
- (void)getAuthorizationToken:(AWSEcrGetAuthorizationTokenRequest *)request completionHandler:(void (^ _Nullable)(AWSEcrGetAuthorizationTokenResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the pre-signed Amazon S3 download URL corresponding to an image layer. You can only get URLs for image layers that are referenced in an image.</p><p>When an image is pulled, the GetDownloadUrlForLayer API is called once per image layer that is not already cached.</p><note><p>This operation is used by the Amazon ECR proxy and is not generally used by customers for pulling and pushing images. In most cases, you should use the <code>docker</code> CLI to pull, tag, and push images.</p></note>
 
 @param request A container for the necessary parameters to execute the GetDownloadUrlForLayer service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEcrGetDownloadUrlForLayerResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSEcrErrorDomain` domain and the following error code: `AWSEcrErrorServer`, `AWSEcrErrorInvalidParameter`, `AWSEcrErrorLayersNotFound`, `AWSEcrErrorLayerInaccessible`, `AWSEcrErrorRepositoryNotFound`.
 
 @see AWSEcrGetDownloadUrlForLayerRequest
 @see AWSEcrGetDownloadUrlForLayerResponse
 */
- (AWSTask<AWSEcrGetDownloadUrlForLayerResponse *> *)getDownloadUrlForLayer:(AWSEcrGetDownloadUrlForLayerRequest *)request;

/**
 <p>Retrieves the pre-signed Amazon S3 download URL corresponding to an image layer. You can only get URLs for image layers that are referenced in an image.</p><p>When an image is pulled, the GetDownloadUrlForLayer API is called once per image layer that is not already cached.</p><note><p>This operation is used by the Amazon ECR proxy and is not generally used by customers for pulling and pushing images. In most cases, you should use the <code>docker</code> CLI to pull, tag, and push images.</p></note>
 
 @param request A container for the necessary parameters to execute the GetDownloadUrlForLayer service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSEcrErrorDomain` domain and the following error code: `AWSEcrErrorServer`, `AWSEcrErrorInvalidParameter`, `AWSEcrErrorLayersNotFound`, `AWSEcrErrorLayerInaccessible`, `AWSEcrErrorRepositoryNotFound`.
 
 @see AWSEcrGetDownloadUrlForLayerRequest
 @see AWSEcrGetDownloadUrlForLayerResponse
 */
- (void)getDownloadUrlForLayer:(AWSEcrGetDownloadUrlForLayerRequest *)request completionHandler:(void (^ _Nullable)(AWSEcrGetDownloadUrlForLayerResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the lifecycle policy for the specified repository.</p>
 
 @param request A container for the necessary parameters to execute the GetLifecyclePolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEcrGetLifecyclePolicyResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSEcrErrorDomain` domain and the following error code: `AWSEcrErrorServer`, `AWSEcrErrorInvalidParameter`, `AWSEcrErrorRepositoryNotFound`, `AWSEcrErrorLifecyclePolicyNotFound`.
 
 @see AWSEcrGetLifecyclePolicyRequest
 @see AWSEcrGetLifecyclePolicyResponse
 */
- (AWSTask<AWSEcrGetLifecyclePolicyResponse *> *)getLifecyclePolicy:(AWSEcrGetLifecyclePolicyRequest *)request;

/**
 <p>Retrieves the lifecycle policy for the specified repository.</p>
 
 @param request A container for the necessary parameters to execute the GetLifecyclePolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSEcrErrorDomain` domain and the following error code: `AWSEcrErrorServer`, `AWSEcrErrorInvalidParameter`, `AWSEcrErrorRepositoryNotFound`, `AWSEcrErrorLifecyclePolicyNotFound`.
 
 @see AWSEcrGetLifecyclePolicyRequest
 @see AWSEcrGetLifecyclePolicyResponse
 */
- (void)getLifecyclePolicy:(AWSEcrGetLifecyclePolicyRequest *)request completionHandler:(void (^ _Nullable)(AWSEcrGetLifecyclePolicyResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the results of the lifecycle policy preview request for the specified repository.</p>
 
 @param request A container for the necessary parameters to execute the GetLifecyclePolicyPreview service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEcrGetLifecyclePolicyPreviewResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSEcrErrorDomain` domain and the following error code: `AWSEcrErrorServer`, `AWSEcrErrorInvalidParameter`, `AWSEcrErrorRepositoryNotFound`, `AWSEcrErrorLifecyclePolicyPreviewNotFound`.
 
 @see AWSEcrGetLifecyclePolicyPreviewRequest
 @see AWSEcrGetLifecyclePolicyPreviewResponse
 */
- (AWSTask<AWSEcrGetLifecyclePolicyPreviewResponse *> *)getLifecyclePolicyPreview:(AWSEcrGetLifecyclePolicyPreviewRequest *)request;

/**
 <p>Retrieves the results of the lifecycle policy preview request for the specified repository.</p>
 
 @param request A container for the necessary parameters to execute the GetLifecyclePolicyPreview service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSEcrErrorDomain` domain and the following error code: `AWSEcrErrorServer`, `AWSEcrErrorInvalidParameter`, `AWSEcrErrorRepositoryNotFound`, `AWSEcrErrorLifecyclePolicyPreviewNotFound`.
 
 @see AWSEcrGetLifecyclePolicyPreviewRequest
 @see AWSEcrGetLifecyclePolicyPreviewResponse
 */
- (void)getLifecyclePolicyPreview:(AWSEcrGetLifecyclePolicyPreviewRequest *)request completionHandler:(void (^ _Nullable)(AWSEcrGetLifecyclePolicyPreviewResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the repository policy for the specified repository.</p>
 
 @param request A container for the necessary parameters to execute the GetRepositoryPolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEcrGetRepositoryPolicyResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSEcrErrorDomain` domain and the following error code: `AWSEcrErrorServer`, `AWSEcrErrorInvalidParameter`, `AWSEcrErrorRepositoryNotFound`, `AWSEcrErrorRepositoryPolicyNotFound`.
 
 @see AWSEcrGetRepositoryPolicyRequest
 @see AWSEcrGetRepositoryPolicyResponse
 */
- (AWSTask<AWSEcrGetRepositoryPolicyResponse *> *)getRepositoryPolicy:(AWSEcrGetRepositoryPolicyRequest *)request;

/**
 <p>Retrieves the repository policy for the specified repository.</p>
 
 @param request A container for the necessary parameters to execute the GetRepositoryPolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSEcrErrorDomain` domain and the following error code: `AWSEcrErrorServer`, `AWSEcrErrorInvalidParameter`, `AWSEcrErrorRepositoryNotFound`, `AWSEcrErrorRepositoryPolicyNotFound`.
 
 @see AWSEcrGetRepositoryPolicyRequest
 @see AWSEcrGetRepositoryPolicyResponse
 */
- (void)getRepositoryPolicy:(AWSEcrGetRepositoryPolicyRequest *)request completionHandler:(void (^ _Nullable)(AWSEcrGetRepositoryPolicyResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Notifies Amazon ECR that you intend to upload an image layer.</p><p>When an image is pushed, the InitiateLayerUpload API is called once per image layer that has not already been uploaded. Whether or not an image layer has been uploaded is determined by the BatchCheckLayerAvailability API action.</p><note><p>This operation is used by the Amazon ECR proxy and is not generally used by customers for pulling and pushing images. In most cases, you should use the <code>docker</code> CLI to pull, tag, and push images.</p></note>
 
 @param request A container for the necessary parameters to execute the InitiateLayerUpload service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEcrInitiateLayerUploadResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSEcrErrorDomain` domain and the following error code: `AWSEcrErrorServer`, `AWSEcrErrorInvalidParameter`, `AWSEcrErrorRepositoryNotFound`.
 
 @see AWSEcrInitiateLayerUploadRequest
 @see AWSEcrInitiateLayerUploadResponse
 */
- (AWSTask<AWSEcrInitiateLayerUploadResponse *> *)initiateLayerUpload:(AWSEcrInitiateLayerUploadRequest *)request;

/**
 <p>Notifies Amazon ECR that you intend to upload an image layer.</p><p>When an image is pushed, the InitiateLayerUpload API is called once per image layer that has not already been uploaded. Whether or not an image layer has been uploaded is determined by the BatchCheckLayerAvailability API action.</p><note><p>This operation is used by the Amazon ECR proxy and is not generally used by customers for pulling and pushing images. In most cases, you should use the <code>docker</code> CLI to pull, tag, and push images.</p></note>
 
 @param request A container for the necessary parameters to execute the InitiateLayerUpload service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSEcrErrorDomain` domain and the following error code: `AWSEcrErrorServer`, `AWSEcrErrorInvalidParameter`, `AWSEcrErrorRepositoryNotFound`.
 
 @see AWSEcrInitiateLayerUploadRequest
 @see AWSEcrInitiateLayerUploadResponse
 */
- (void)initiateLayerUpload:(AWSEcrInitiateLayerUploadRequest *)request completionHandler:(void (^ _Nullable)(AWSEcrInitiateLayerUploadResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists all the image IDs for the specified repository.</p><p>You can filter images based on whether or not they are tagged by using the <code>tagStatus</code> filter and specifying either <code>TAGGED</code>, <code>UNTAGGED</code> or <code>ANY</code>. For example, you can filter your results to return only <code>UNTAGGED</code> images and then pipe that result to a <a>BatchDeleteImage</a> operation to delete them. Or, you can filter your results to return only <code>TAGGED</code> images to list all of the tags in your repository.</p>
 
 @param request A container for the necessary parameters to execute the ListImages service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEcrListImagesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSEcrErrorDomain` domain and the following error code: `AWSEcrErrorServer`, `AWSEcrErrorInvalidParameter`, `AWSEcrErrorRepositoryNotFound`.
 
 @see AWSEcrListImagesRequest
 @see AWSEcrListImagesResponse
 */
- (AWSTask<AWSEcrListImagesResponse *> *)listImages:(AWSEcrListImagesRequest *)request;

/**
 <p>Lists all the image IDs for the specified repository.</p><p>You can filter images based on whether or not they are tagged by using the <code>tagStatus</code> filter and specifying either <code>TAGGED</code>, <code>UNTAGGED</code> or <code>ANY</code>. For example, you can filter your results to return only <code>UNTAGGED</code> images and then pipe that result to a <a>BatchDeleteImage</a> operation to delete them. Or, you can filter your results to return only <code>TAGGED</code> images to list all of the tags in your repository.</p>
 
 @param request A container for the necessary parameters to execute the ListImages service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSEcrErrorDomain` domain and the following error code: `AWSEcrErrorServer`, `AWSEcrErrorInvalidParameter`, `AWSEcrErrorRepositoryNotFound`.
 
 @see AWSEcrListImagesRequest
 @see AWSEcrListImagesResponse
 */
- (void)listImages:(AWSEcrListImagesRequest *)request completionHandler:(void (^ _Nullable)(AWSEcrListImagesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>List the tags for an Amazon ECR resource.</p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEcrListTagsForResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSEcrErrorDomain` domain and the following error code: `AWSEcrErrorInvalidParameter`, `AWSEcrErrorRepositoryNotFound`, `AWSEcrErrorServer`.
 
 @see AWSEcrListTagsForResourceRequest
 @see AWSEcrListTagsForResourceResponse
 */
- (AWSTask<AWSEcrListTagsForResourceResponse *> *)listTagsForResource:(AWSEcrListTagsForResourceRequest *)request;

/**
 <p>List the tags for an Amazon ECR resource.</p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSEcrErrorDomain` domain and the following error code: `AWSEcrErrorInvalidParameter`, `AWSEcrErrorRepositoryNotFound`, `AWSEcrErrorServer`.
 
 @see AWSEcrListTagsForResourceRequest
 @see AWSEcrListTagsForResourceResponse
 */
- (void)listTagsForResource:(AWSEcrListTagsForResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSEcrListTagsForResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates or updates the image manifest and tags associated with an image.</p><p>When an image is pushed and all new image layers have been uploaded, the PutImage API is called once to create or update the image manifest and the tags associated with the image.</p><note><p>This operation is used by the Amazon ECR proxy and is not generally used by customers for pulling and pushing images. In most cases, you should use the <code>docker</code> CLI to pull, tag, and push images.</p></note>
 
 @param request A container for the necessary parameters to execute the PutImage service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEcrPutImageResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSEcrErrorDomain` domain and the following error code: `AWSEcrErrorServer`, `AWSEcrErrorInvalidParameter`, `AWSEcrErrorRepositoryNotFound`, `AWSEcrErrorImageAlreadyExists`, `AWSEcrErrorLayersNotFound`, `AWSEcrErrorReferencedImagesNotFound`, `AWSEcrErrorLimitExceeded`, `AWSEcrErrorImageTagAlreadyExists`.
 
 @see AWSEcrPutImageRequest
 @see AWSEcrPutImageResponse
 */
- (AWSTask<AWSEcrPutImageResponse *> *)putImage:(AWSEcrPutImageRequest *)request;

/**
 <p>Creates or updates the image manifest and tags associated with an image.</p><p>When an image is pushed and all new image layers have been uploaded, the PutImage API is called once to create or update the image manifest and the tags associated with the image.</p><note><p>This operation is used by the Amazon ECR proxy and is not generally used by customers for pulling and pushing images. In most cases, you should use the <code>docker</code> CLI to pull, tag, and push images.</p></note>
 
 @param request A container for the necessary parameters to execute the PutImage service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSEcrErrorDomain` domain and the following error code: `AWSEcrErrorServer`, `AWSEcrErrorInvalidParameter`, `AWSEcrErrorRepositoryNotFound`, `AWSEcrErrorImageAlreadyExists`, `AWSEcrErrorLayersNotFound`, `AWSEcrErrorReferencedImagesNotFound`, `AWSEcrErrorLimitExceeded`, `AWSEcrErrorImageTagAlreadyExists`.
 
 @see AWSEcrPutImageRequest
 @see AWSEcrPutImageResponse
 */
- (void)putImage:(AWSEcrPutImageRequest *)request completionHandler:(void (^ _Nullable)(AWSEcrPutImageResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the image scanning configuration for the specified repository.</p>
 
 @param request A container for the necessary parameters to execute the PutImageScanningConfiguration service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEcrPutImageScanningConfigurationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSEcrErrorDomain` domain and the following error code: `AWSEcrErrorServer`, `AWSEcrErrorInvalidParameter`, `AWSEcrErrorRepositoryNotFound`.
 
 @see AWSEcrPutImageScanningConfigurationRequest
 @see AWSEcrPutImageScanningConfigurationResponse
 */
- (AWSTask<AWSEcrPutImageScanningConfigurationResponse *> *)putImageScanningConfiguration:(AWSEcrPutImageScanningConfigurationRequest *)request;

/**
 <p>Updates the image scanning configuration for the specified repository.</p>
 
 @param request A container for the necessary parameters to execute the PutImageScanningConfiguration service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSEcrErrorDomain` domain and the following error code: `AWSEcrErrorServer`, `AWSEcrErrorInvalidParameter`, `AWSEcrErrorRepositoryNotFound`.
 
 @see AWSEcrPutImageScanningConfigurationRequest
 @see AWSEcrPutImageScanningConfigurationResponse
 */
- (void)putImageScanningConfiguration:(AWSEcrPutImageScanningConfigurationRequest *)request completionHandler:(void (^ _Nullable)(AWSEcrPutImageScanningConfigurationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the image tag mutability settings for the specified repository. For more information, see <a href="https://docs.aws.amazon.com/AmazonECR/latest/userguide/image-tag-mutability.html">Image Tag Mutability</a> in the <i>Amazon Elastic Container Registry User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the PutImageTagMutability service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEcrPutImageTagMutabilityResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSEcrErrorDomain` domain and the following error code: `AWSEcrErrorServer`, `AWSEcrErrorInvalidParameter`, `AWSEcrErrorRepositoryNotFound`.
 
 @see AWSEcrPutImageTagMutabilityRequest
 @see AWSEcrPutImageTagMutabilityResponse
 */
- (AWSTask<AWSEcrPutImageTagMutabilityResponse *> *)putImageTagMutability:(AWSEcrPutImageTagMutabilityRequest *)request;

/**
 <p>Updates the image tag mutability settings for the specified repository. For more information, see <a href="https://docs.aws.amazon.com/AmazonECR/latest/userguide/image-tag-mutability.html">Image Tag Mutability</a> in the <i>Amazon Elastic Container Registry User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the PutImageTagMutability service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSEcrErrorDomain` domain and the following error code: `AWSEcrErrorServer`, `AWSEcrErrorInvalidParameter`, `AWSEcrErrorRepositoryNotFound`.
 
 @see AWSEcrPutImageTagMutabilityRequest
 @see AWSEcrPutImageTagMutabilityResponse
 */
- (void)putImageTagMutability:(AWSEcrPutImageTagMutabilityRequest *)request completionHandler:(void (^ _Nullable)(AWSEcrPutImageTagMutabilityResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates or updates the lifecycle policy for the specified repository. For more information, see <a href="https://docs.aws.amazon.com/AmazonECR/latest/userguide/LifecyclePolicies.html">Lifecycle Policy Template</a>.</p>
 
 @param request A container for the necessary parameters to execute the PutLifecyclePolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEcrPutLifecyclePolicyResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSEcrErrorDomain` domain and the following error code: `AWSEcrErrorServer`, `AWSEcrErrorInvalidParameter`, `AWSEcrErrorRepositoryNotFound`.
 
 @see AWSEcrPutLifecyclePolicyRequest
 @see AWSEcrPutLifecyclePolicyResponse
 */
- (AWSTask<AWSEcrPutLifecyclePolicyResponse *> *)putLifecyclePolicy:(AWSEcrPutLifecyclePolicyRequest *)request;

/**
 <p>Creates or updates the lifecycle policy for the specified repository. For more information, see <a href="https://docs.aws.amazon.com/AmazonECR/latest/userguide/LifecyclePolicies.html">Lifecycle Policy Template</a>.</p>
 
 @param request A container for the necessary parameters to execute the PutLifecyclePolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSEcrErrorDomain` domain and the following error code: `AWSEcrErrorServer`, `AWSEcrErrorInvalidParameter`, `AWSEcrErrorRepositoryNotFound`.
 
 @see AWSEcrPutLifecyclePolicyRequest
 @see AWSEcrPutLifecyclePolicyResponse
 */
- (void)putLifecyclePolicy:(AWSEcrPutLifecyclePolicyRequest *)request completionHandler:(void (^ _Nullable)(AWSEcrPutLifecyclePolicyResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Applies a repository policy to the specified repository to control access permissions. For more information, see <a href="https://docs.aws.amazon.com/AmazonECR/latest/userguide/repository-policies.html">Amazon ECR Repository Policies</a> in the <i>Amazon Elastic Container Registry User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the SetRepositoryPolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEcrSetRepositoryPolicyResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSEcrErrorDomain` domain and the following error code: `AWSEcrErrorServer`, `AWSEcrErrorInvalidParameter`, `AWSEcrErrorRepositoryNotFound`.
 
 @see AWSEcrSetRepositoryPolicyRequest
 @see AWSEcrSetRepositoryPolicyResponse
 */
- (AWSTask<AWSEcrSetRepositoryPolicyResponse *> *)setRepositoryPolicy:(AWSEcrSetRepositoryPolicyRequest *)request;

/**
 <p>Applies a repository policy to the specified repository to control access permissions. For more information, see <a href="https://docs.aws.amazon.com/AmazonECR/latest/userguide/repository-policies.html">Amazon ECR Repository Policies</a> in the <i>Amazon Elastic Container Registry User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the SetRepositoryPolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSEcrErrorDomain` domain and the following error code: `AWSEcrErrorServer`, `AWSEcrErrorInvalidParameter`, `AWSEcrErrorRepositoryNotFound`.
 
 @see AWSEcrSetRepositoryPolicyRequest
 @see AWSEcrSetRepositoryPolicyResponse
 */
- (void)setRepositoryPolicy:(AWSEcrSetRepositoryPolicyRequest *)request completionHandler:(void (^ _Nullable)(AWSEcrSetRepositoryPolicyResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Starts an image vulnerability scan. An image scan can only be started once per day on an individual image. This limit includes if an image was scanned on initial push. For more information, see <a href="https://docs.aws.amazon.com/AmazonECR/latest/userguide/image-scanning.html">Image Scanning</a> in the <i>Amazon Elastic Container Registry User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the StartImageScan service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEcrStartImageScanResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSEcrErrorDomain` domain and the following error code: `AWSEcrErrorServer`, `AWSEcrErrorInvalidParameter`, `AWSEcrErrorUnsupportedImageType`, `AWSEcrErrorLimitExceeded`, `AWSEcrErrorRepositoryNotFound`, `AWSEcrErrorImageNotFound`.
 
 @see AWSEcrStartImageScanRequest
 @see AWSEcrStartImageScanResponse
 */
- (AWSTask<AWSEcrStartImageScanResponse *> *)startImageScan:(AWSEcrStartImageScanRequest *)request;

/**
 <p>Starts an image vulnerability scan. An image scan can only be started once per day on an individual image. This limit includes if an image was scanned on initial push. For more information, see <a href="https://docs.aws.amazon.com/AmazonECR/latest/userguide/image-scanning.html">Image Scanning</a> in the <i>Amazon Elastic Container Registry User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the StartImageScan service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSEcrErrorDomain` domain and the following error code: `AWSEcrErrorServer`, `AWSEcrErrorInvalidParameter`, `AWSEcrErrorUnsupportedImageType`, `AWSEcrErrorLimitExceeded`, `AWSEcrErrorRepositoryNotFound`, `AWSEcrErrorImageNotFound`.
 
 @see AWSEcrStartImageScanRequest
 @see AWSEcrStartImageScanResponse
 */
- (void)startImageScan:(AWSEcrStartImageScanRequest *)request completionHandler:(void (^ _Nullable)(AWSEcrStartImageScanResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Starts a preview of a lifecycle policy for the specified repository. This allows you to see the results before associating the lifecycle policy with the repository.</p>
 
 @param request A container for the necessary parameters to execute the StartLifecyclePolicyPreview service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEcrStartLifecyclePolicyPreviewResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSEcrErrorDomain` domain and the following error code: `AWSEcrErrorServer`, `AWSEcrErrorInvalidParameter`, `AWSEcrErrorRepositoryNotFound`, `AWSEcrErrorLifecyclePolicyNotFound`, `AWSEcrErrorLifecyclePolicyPreviewInProgress`.
 
 @see AWSEcrStartLifecyclePolicyPreviewRequest
 @see AWSEcrStartLifecyclePolicyPreviewResponse
 */
- (AWSTask<AWSEcrStartLifecyclePolicyPreviewResponse *> *)startLifecyclePolicyPreview:(AWSEcrStartLifecyclePolicyPreviewRequest *)request;

/**
 <p>Starts a preview of a lifecycle policy for the specified repository. This allows you to see the results before associating the lifecycle policy with the repository.</p>
 
 @param request A container for the necessary parameters to execute the StartLifecyclePolicyPreview service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSEcrErrorDomain` domain and the following error code: `AWSEcrErrorServer`, `AWSEcrErrorInvalidParameter`, `AWSEcrErrorRepositoryNotFound`, `AWSEcrErrorLifecyclePolicyNotFound`, `AWSEcrErrorLifecyclePolicyPreviewInProgress`.
 
 @see AWSEcrStartLifecyclePolicyPreviewRequest
 @see AWSEcrStartLifecyclePolicyPreviewResponse
 */
- (void)startLifecyclePolicyPreview:(AWSEcrStartLifecyclePolicyPreviewRequest *)request completionHandler:(void (^ _Nullable)(AWSEcrStartLifecyclePolicyPreviewResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Adds specified tags to a resource with the specified ARN. Existing tags on a resource are not changed if they are not specified in the request parameters.</p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEcrTagResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSEcrErrorDomain` domain and the following error code: `AWSEcrErrorInvalidParameter`, `AWSEcrErrorInvalidTagParameter`, `AWSEcrErrorTooManyTags`, `AWSEcrErrorRepositoryNotFound`, `AWSEcrErrorServer`.
 
 @see AWSEcrTagResourceRequest
 @see AWSEcrTagResourceResponse
 */
- (AWSTask<AWSEcrTagResourceResponse *> *)tagResource:(AWSEcrTagResourceRequest *)request;

/**
 <p>Adds specified tags to a resource with the specified ARN. Existing tags on a resource are not changed if they are not specified in the request parameters.</p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSEcrErrorDomain` domain and the following error code: `AWSEcrErrorInvalidParameter`, `AWSEcrErrorInvalidTagParameter`, `AWSEcrErrorTooManyTags`, `AWSEcrErrorRepositoryNotFound`, `AWSEcrErrorServer`.
 
 @see AWSEcrTagResourceRequest
 @see AWSEcrTagResourceResponse
 */
- (void)tagResource:(AWSEcrTagResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSEcrTagResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes specified tags from a resource.</p>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEcrUntagResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSEcrErrorDomain` domain and the following error code: `AWSEcrErrorInvalidParameter`, `AWSEcrErrorInvalidTagParameter`, `AWSEcrErrorTooManyTags`, `AWSEcrErrorRepositoryNotFound`, `AWSEcrErrorServer`.
 
 @see AWSEcrUntagResourceRequest
 @see AWSEcrUntagResourceResponse
 */
- (AWSTask<AWSEcrUntagResourceResponse *> *)untagResource:(AWSEcrUntagResourceRequest *)request;

/**
 <p>Deletes specified tags from a resource.</p>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSEcrErrorDomain` domain and the following error code: `AWSEcrErrorInvalidParameter`, `AWSEcrErrorInvalidTagParameter`, `AWSEcrErrorTooManyTags`, `AWSEcrErrorRepositoryNotFound`, `AWSEcrErrorServer`.
 
 @see AWSEcrUntagResourceRequest
 @see AWSEcrUntagResourceResponse
 */
- (void)untagResource:(AWSEcrUntagResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSEcrUntagResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Uploads an image layer part to Amazon ECR.</p><p>When an image is pushed, each new image layer is uploaded in parts. The maximum size of each image layer part can be 20971520 bytes (or about 20MB). The UploadLayerPart API is called once per each new image layer part.</p><note><p>This operation is used by the Amazon ECR proxy and is not generally used by customers for pulling and pushing images. In most cases, you should use the <code>docker</code> CLI to pull, tag, and push images.</p></note>
 
 @param request A container for the necessary parameters to execute the UploadLayerPart service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEcrUploadLayerPartResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSEcrErrorDomain` domain and the following error code: `AWSEcrErrorServer`, `AWSEcrErrorInvalidParameter`, `AWSEcrErrorInvalidLayerPart`, `AWSEcrErrorRepositoryNotFound`, `AWSEcrErrorUploadNotFound`, `AWSEcrErrorLimitExceeded`.
 
 @see AWSEcrUploadLayerPartRequest
 @see AWSEcrUploadLayerPartResponse
 */
- (AWSTask<AWSEcrUploadLayerPartResponse *> *)uploadLayerPart:(AWSEcrUploadLayerPartRequest *)request;

/**
 <p>Uploads an image layer part to Amazon ECR.</p><p>When an image is pushed, each new image layer is uploaded in parts. The maximum size of each image layer part can be 20971520 bytes (or about 20MB). The UploadLayerPart API is called once per each new image layer part.</p><note><p>This operation is used by the Amazon ECR proxy and is not generally used by customers for pulling and pushing images. In most cases, you should use the <code>docker</code> CLI to pull, tag, and push images.</p></note>
 
 @param request A container for the necessary parameters to execute the UploadLayerPart service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSEcrErrorDomain` domain and the following error code: `AWSEcrErrorServer`, `AWSEcrErrorInvalidParameter`, `AWSEcrErrorInvalidLayerPart`, `AWSEcrErrorRepositoryNotFound`, `AWSEcrErrorUploadNotFound`, `AWSEcrErrorLimitExceeded`.
 
 @see AWSEcrUploadLayerPartRequest
 @see AWSEcrUploadLayerPartResponse
 */
- (void)uploadLayerPart:(AWSEcrUploadLayerPartRequest *)request completionHandler:(void (^ _Nullable)(AWSEcrUploadLayerPartResponse * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
