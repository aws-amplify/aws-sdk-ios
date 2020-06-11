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
#import "AWSImagebuilderModel.h"
#import "AWSImagebuilderResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSImagebuilder
FOUNDATION_EXPORT NSString *const AWSImagebuilderSDKVersion;

/**
 <p>EC2 Image Builder is a fully managed AWS service that makes it easier to automate the creation, management, and deployment of customized, secure, and up-to-date “golden” server images that are pre-installed and pre-configured with software and settings to meet specific IT standards.</p>
 */
@interface AWSImagebuilder : AWSService

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

     let Imagebuilder = AWSImagebuilder.default()

 *Objective-C*

     AWSImagebuilder *Imagebuilder = [AWSImagebuilder defaultImagebuilder];

 @return The default service client.
 */
+ (instancetype)defaultImagebuilder;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSImagebuilder.register(with: configuration!, forKey: "USWest2Imagebuilder")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSImagebuilder registerImagebuilderWithConfiguration:configuration forKey:@"USWest2Imagebuilder"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Imagebuilder = AWSImagebuilder(forKey: "USWest2Imagebuilder")

 *Objective-C*

     AWSImagebuilder *Imagebuilder = [AWSImagebuilder ImagebuilderForKey:@"USWest2Imagebuilder"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerImagebuilderWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerImagebuilderWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSImagebuilder.register(with: configuration!, forKey: "USWest2Imagebuilder")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSImagebuilder registerImagebuilderWithConfiguration:configuration forKey:@"USWest2Imagebuilder"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Imagebuilder = AWSImagebuilder(forKey: "USWest2Imagebuilder")

 *Objective-C*

     AWSImagebuilder *Imagebuilder = [AWSImagebuilder ImagebuilderForKey:@"USWest2Imagebuilder"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)ImagebuilderForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removeImagebuilderForKey:(NSString *)key;

/**
 <p>CancelImageCreation cancels the creation of Image. This operation can only be used on images in a non-terminal state.</p>
 
 @param request A container for the necessary parameters to execute the CancelImageCreation service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSImagebuilderCancelImageCreationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSImagebuilderErrorDomain` domain and the following error code: `AWSImagebuilderErrorService`, `AWSImagebuilderErrorClient`, `AWSImagebuilderErrorServiceUnavailable`, `AWSImagebuilderErrorInvalidRequest`, `AWSImagebuilderErrorIdempotentParameterMismatch`, `AWSImagebuilderErrorForbidden`, `AWSImagebuilderErrorCallRateLimitExceeded`, `AWSImagebuilderErrorResourceInUse`.
 
 @see AWSImagebuilderCancelImageCreationRequest
 @see AWSImagebuilderCancelImageCreationResponse
 */
- (AWSTask<AWSImagebuilderCancelImageCreationResponse *> *)cancelImageCreation:(AWSImagebuilderCancelImageCreationRequest *)request;

/**
 <p>CancelImageCreation cancels the creation of Image. This operation can only be used on images in a non-terminal state.</p>
 
 @param request A container for the necessary parameters to execute the CancelImageCreation service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSImagebuilderErrorDomain` domain and the following error code: `AWSImagebuilderErrorService`, `AWSImagebuilderErrorClient`, `AWSImagebuilderErrorServiceUnavailable`, `AWSImagebuilderErrorInvalidRequest`, `AWSImagebuilderErrorIdempotentParameterMismatch`, `AWSImagebuilderErrorForbidden`, `AWSImagebuilderErrorCallRateLimitExceeded`, `AWSImagebuilderErrorResourceInUse`.
 
 @see AWSImagebuilderCancelImageCreationRequest
 @see AWSImagebuilderCancelImageCreationResponse
 */
- (void)cancelImageCreation:(AWSImagebuilderCancelImageCreationRequest *)request completionHandler:(void (^ _Nullable)(AWSImagebuilderCancelImageCreationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new component that can be used to build, validate, test, and assess your image.</p>
 
 @param request A container for the necessary parameters to execute the CreateComponent service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSImagebuilderCreateComponentResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSImagebuilderErrorDomain` domain and the following error code: `AWSImagebuilderErrorService`, `AWSImagebuilderErrorClient`, `AWSImagebuilderErrorServiceUnavailable`, `AWSImagebuilderErrorInvalidRequest`, `AWSImagebuilderErrorIdempotentParameterMismatch`, `AWSImagebuilderErrorForbidden`, `AWSImagebuilderErrorCallRateLimitExceeded`, `AWSImagebuilderErrorInvalidVersionNumber`, `AWSImagebuilderErrorResourceInUse`, `AWSImagebuilderErrorInvalidParameterCombination`, `AWSImagebuilderErrorServiceQuotaExceeded`.
 
 @see AWSImagebuilderCreateComponentRequest
 @see AWSImagebuilderCreateComponentResponse
 */
- (AWSTask<AWSImagebuilderCreateComponentResponse *> *)createComponent:(AWSImagebuilderCreateComponentRequest *)request;

/**
 <p>Creates a new component that can be used to build, validate, test, and assess your image.</p>
 
 @param request A container for the necessary parameters to execute the CreateComponent service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSImagebuilderErrorDomain` domain and the following error code: `AWSImagebuilderErrorService`, `AWSImagebuilderErrorClient`, `AWSImagebuilderErrorServiceUnavailable`, `AWSImagebuilderErrorInvalidRequest`, `AWSImagebuilderErrorIdempotentParameterMismatch`, `AWSImagebuilderErrorForbidden`, `AWSImagebuilderErrorCallRateLimitExceeded`, `AWSImagebuilderErrorInvalidVersionNumber`, `AWSImagebuilderErrorResourceInUse`, `AWSImagebuilderErrorInvalidParameterCombination`, `AWSImagebuilderErrorServiceQuotaExceeded`.
 
 @see AWSImagebuilderCreateComponentRequest
 @see AWSImagebuilderCreateComponentResponse
 */
- (void)createComponent:(AWSImagebuilderCreateComponentRequest *)request completionHandler:(void (^ _Nullable)(AWSImagebuilderCreateComponentResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new distribution configuration. Distribution configurations define and configure the outputs of your pipeline. </p>
 
 @param request A container for the necessary parameters to execute the CreateDistributionConfiguration service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSImagebuilderCreateDistributionConfigurationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSImagebuilderErrorDomain` domain and the following error code: `AWSImagebuilderErrorService`, `AWSImagebuilderErrorClient`, `AWSImagebuilderErrorServiceUnavailable`, `AWSImagebuilderErrorInvalidRequest`, `AWSImagebuilderErrorIdempotentParameterMismatch`, `AWSImagebuilderErrorForbidden`, `AWSImagebuilderErrorCallRateLimitExceeded`, `AWSImagebuilderErrorResourceInUse`, `AWSImagebuilderErrorResourceAlreadyExists`, `AWSImagebuilderErrorInvalidParameterCombination`, `AWSImagebuilderErrorServiceQuotaExceeded`.
 
 @see AWSImagebuilderCreateDistributionConfigurationRequest
 @see AWSImagebuilderCreateDistributionConfigurationResponse
 */
- (AWSTask<AWSImagebuilderCreateDistributionConfigurationResponse *> *)createDistributionConfiguration:(AWSImagebuilderCreateDistributionConfigurationRequest *)request;

/**
 <p>Creates a new distribution configuration. Distribution configurations define and configure the outputs of your pipeline. </p>
 
 @param request A container for the necessary parameters to execute the CreateDistributionConfiguration service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSImagebuilderErrorDomain` domain and the following error code: `AWSImagebuilderErrorService`, `AWSImagebuilderErrorClient`, `AWSImagebuilderErrorServiceUnavailable`, `AWSImagebuilderErrorInvalidRequest`, `AWSImagebuilderErrorIdempotentParameterMismatch`, `AWSImagebuilderErrorForbidden`, `AWSImagebuilderErrorCallRateLimitExceeded`, `AWSImagebuilderErrorResourceInUse`, `AWSImagebuilderErrorResourceAlreadyExists`, `AWSImagebuilderErrorInvalidParameterCombination`, `AWSImagebuilderErrorServiceQuotaExceeded`.
 
 @see AWSImagebuilderCreateDistributionConfigurationRequest
 @see AWSImagebuilderCreateDistributionConfigurationResponse
 */
- (void)createDistributionConfiguration:(AWSImagebuilderCreateDistributionConfigurationRequest *)request completionHandler:(void (^ _Nullable)(AWSImagebuilderCreateDistributionConfigurationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Creates a new image. This request will create a new image along with all of the configured output resources defined in the distribution configuration. </p>
 
 @param request A container for the necessary parameters to execute the CreateImage service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSImagebuilderCreateImageResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSImagebuilderErrorDomain` domain and the following error code: `AWSImagebuilderErrorService`, `AWSImagebuilderErrorClient`, `AWSImagebuilderErrorServiceUnavailable`, `AWSImagebuilderErrorInvalidRequest`, `AWSImagebuilderErrorIdempotentParameterMismatch`, `AWSImagebuilderErrorForbidden`, `AWSImagebuilderErrorCallRateLimitExceeded`, `AWSImagebuilderErrorResourceInUse`, `AWSImagebuilderErrorServiceQuotaExceeded`.
 
 @see AWSImagebuilderCreateImageRequest
 @see AWSImagebuilderCreateImageResponse
 */
- (AWSTask<AWSImagebuilderCreateImageResponse *> *)createImage:(AWSImagebuilderCreateImageRequest *)request;

/**
 <p> Creates a new image. This request will create a new image along with all of the configured output resources defined in the distribution configuration. </p>
 
 @param request A container for the necessary parameters to execute the CreateImage service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSImagebuilderErrorDomain` domain and the following error code: `AWSImagebuilderErrorService`, `AWSImagebuilderErrorClient`, `AWSImagebuilderErrorServiceUnavailable`, `AWSImagebuilderErrorInvalidRequest`, `AWSImagebuilderErrorIdempotentParameterMismatch`, `AWSImagebuilderErrorForbidden`, `AWSImagebuilderErrorCallRateLimitExceeded`, `AWSImagebuilderErrorResourceInUse`, `AWSImagebuilderErrorServiceQuotaExceeded`.
 
 @see AWSImagebuilderCreateImageRequest
 @see AWSImagebuilderCreateImageResponse
 */
- (void)createImage:(AWSImagebuilderCreateImageRequest *)request completionHandler:(void (^ _Nullable)(AWSImagebuilderCreateImageResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Creates a new image pipeline. Image pipelines enable you to automate the creation and distribution of images. </p>
 
 @param request A container for the necessary parameters to execute the CreateImagePipeline service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSImagebuilderCreateImagePipelineResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSImagebuilderErrorDomain` domain and the following error code: `AWSImagebuilderErrorService`, `AWSImagebuilderErrorClient`, `AWSImagebuilderErrorServiceUnavailable`, `AWSImagebuilderErrorInvalidRequest`, `AWSImagebuilderErrorIdempotentParameterMismatch`, `AWSImagebuilderErrorForbidden`, `AWSImagebuilderErrorCallRateLimitExceeded`, `AWSImagebuilderErrorResourceInUse`, `AWSImagebuilderErrorResourceAlreadyExists`, `AWSImagebuilderErrorServiceQuotaExceeded`.
 
 @see AWSImagebuilderCreateImagePipelineRequest
 @see AWSImagebuilderCreateImagePipelineResponse
 */
- (AWSTask<AWSImagebuilderCreateImagePipelineResponse *> *)createImagePipeline:(AWSImagebuilderCreateImagePipelineRequest *)request;

/**
 <p> Creates a new image pipeline. Image pipelines enable you to automate the creation and distribution of images. </p>
 
 @param request A container for the necessary parameters to execute the CreateImagePipeline service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSImagebuilderErrorDomain` domain and the following error code: `AWSImagebuilderErrorService`, `AWSImagebuilderErrorClient`, `AWSImagebuilderErrorServiceUnavailable`, `AWSImagebuilderErrorInvalidRequest`, `AWSImagebuilderErrorIdempotentParameterMismatch`, `AWSImagebuilderErrorForbidden`, `AWSImagebuilderErrorCallRateLimitExceeded`, `AWSImagebuilderErrorResourceInUse`, `AWSImagebuilderErrorResourceAlreadyExists`, `AWSImagebuilderErrorServiceQuotaExceeded`.
 
 @see AWSImagebuilderCreateImagePipelineRequest
 @see AWSImagebuilderCreateImagePipelineResponse
 */
- (void)createImagePipeline:(AWSImagebuilderCreateImagePipelineRequest *)request completionHandler:(void (^ _Nullable)(AWSImagebuilderCreateImagePipelineResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Creates a new image recipe. Image recipes define how images are configured, tested, and assessed. </p>
 
 @param request A container for the necessary parameters to execute the CreateImageRecipe service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSImagebuilderCreateImageRecipeResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSImagebuilderErrorDomain` domain and the following error code: `AWSImagebuilderErrorService`, `AWSImagebuilderErrorClient`, `AWSImagebuilderErrorServiceUnavailable`, `AWSImagebuilderErrorInvalidRequest`, `AWSImagebuilderErrorIdempotentParameterMismatch`, `AWSImagebuilderErrorForbidden`, `AWSImagebuilderErrorCallRateLimitExceeded`, `AWSImagebuilderErrorInvalidVersionNumber`, `AWSImagebuilderErrorResourceInUse`, `AWSImagebuilderErrorResourceAlreadyExists`, `AWSImagebuilderErrorServiceQuotaExceeded`.
 
 @see AWSImagebuilderCreateImageRecipeRequest
 @see AWSImagebuilderCreateImageRecipeResponse
 */
- (AWSTask<AWSImagebuilderCreateImageRecipeResponse *> *)createImageRecipe:(AWSImagebuilderCreateImageRecipeRequest *)request;

/**
 <p> Creates a new image recipe. Image recipes define how images are configured, tested, and assessed. </p>
 
 @param request A container for the necessary parameters to execute the CreateImageRecipe service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSImagebuilderErrorDomain` domain and the following error code: `AWSImagebuilderErrorService`, `AWSImagebuilderErrorClient`, `AWSImagebuilderErrorServiceUnavailable`, `AWSImagebuilderErrorInvalidRequest`, `AWSImagebuilderErrorIdempotentParameterMismatch`, `AWSImagebuilderErrorForbidden`, `AWSImagebuilderErrorCallRateLimitExceeded`, `AWSImagebuilderErrorInvalidVersionNumber`, `AWSImagebuilderErrorResourceInUse`, `AWSImagebuilderErrorResourceAlreadyExists`, `AWSImagebuilderErrorServiceQuotaExceeded`.
 
 @see AWSImagebuilderCreateImageRecipeRequest
 @see AWSImagebuilderCreateImageRecipeResponse
 */
- (void)createImageRecipe:(AWSImagebuilderCreateImageRecipeRequest *)request completionHandler:(void (^ _Nullable)(AWSImagebuilderCreateImageRecipeResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Creates a new infrastructure configuration. An infrastructure configuration defines the environment in which your image will be built and tested. </p>
 
 @param request A container for the necessary parameters to execute the CreateInfrastructureConfiguration service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSImagebuilderCreateInfrastructureConfigurationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSImagebuilderErrorDomain` domain and the following error code: `AWSImagebuilderErrorService`, `AWSImagebuilderErrorClient`, `AWSImagebuilderErrorServiceUnavailable`, `AWSImagebuilderErrorInvalidRequest`, `AWSImagebuilderErrorIdempotentParameterMismatch`, `AWSImagebuilderErrorForbidden`, `AWSImagebuilderErrorCallRateLimitExceeded`, `AWSImagebuilderErrorResourceInUse`, `AWSImagebuilderErrorResourceAlreadyExists`, `AWSImagebuilderErrorServiceQuotaExceeded`.
 
 @see AWSImagebuilderCreateInfrastructureConfigurationRequest
 @see AWSImagebuilderCreateInfrastructureConfigurationResponse
 */
- (AWSTask<AWSImagebuilderCreateInfrastructureConfigurationResponse *> *)createInfrastructureConfiguration:(AWSImagebuilderCreateInfrastructureConfigurationRequest *)request;

/**
 <p> Creates a new infrastructure configuration. An infrastructure configuration defines the environment in which your image will be built and tested. </p>
 
 @param request A container for the necessary parameters to execute the CreateInfrastructureConfiguration service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSImagebuilderErrorDomain` domain and the following error code: `AWSImagebuilderErrorService`, `AWSImagebuilderErrorClient`, `AWSImagebuilderErrorServiceUnavailable`, `AWSImagebuilderErrorInvalidRequest`, `AWSImagebuilderErrorIdempotentParameterMismatch`, `AWSImagebuilderErrorForbidden`, `AWSImagebuilderErrorCallRateLimitExceeded`, `AWSImagebuilderErrorResourceInUse`, `AWSImagebuilderErrorResourceAlreadyExists`, `AWSImagebuilderErrorServiceQuotaExceeded`.
 
 @see AWSImagebuilderCreateInfrastructureConfigurationRequest
 @see AWSImagebuilderCreateInfrastructureConfigurationResponse
 */
- (void)createInfrastructureConfiguration:(AWSImagebuilderCreateInfrastructureConfigurationRequest *)request completionHandler:(void (^ _Nullable)(AWSImagebuilderCreateInfrastructureConfigurationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Deletes a component build version. </p>
 
 @param request A container for the necessary parameters to execute the DeleteComponent service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSImagebuilderDeleteComponentResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSImagebuilderErrorDomain` domain and the following error code: `AWSImagebuilderErrorService`, `AWSImagebuilderErrorClient`, `AWSImagebuilderErrorServiceUnavailable`, `AWSImagebuilderErrorInvalidRequest`, `AWSImagebuilderErrorForbidden`, `AWSImagebuilderErrorCallRateLimitExceeded`, `AWSImagebuilderErrorResourceDependency`.
 
 @see AWSImagebuilderDeleteComponentRequest
 @see AWSImagebuilderDeleteComponentResponse
 */
- (AWSTask<AWSImagebuilderDeleteComponentResponse *> *)deleteComponent:(AWSImagebuilderDeleteComponentRequest *)request;

/**
 <p> Deletes a component build version. </p>
 
 @param request A container for the necessary parameters to execute the DeleteComponent service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSImagebuilderErrorDomain` domain and the following error code: `AWSImagebuilderErrorService`, `AWSImagebuilderErrorClient`, `AWSImagebuilderErrorServiceUnavailable`, `AWSImagebuilderErrorInvalidRequest`, `AWSImagebuilderErrorForbidden`, `AWSImagebuilderErrorCallRateLimitExceeded`, `AWSImagebuilderErrorResourceDependency`.
 
 @see AWSImagebuilderDeleteComponentRequest
 @see AWSImagebuilderDeleteComponentResponse
 */
- (void)deleteComponent:(AWSImagebuilderDeleteComponentRequest *)request completionHandler:(void (^ _Nullable)(AWSImagebuilderDeleteComponentResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Deletes a distribution configuration. </p>
 
 @param request A container for the necessary parameters to execute the DeleteDistributionConfiguration service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSImagebuilderDeleteDistributionConfigurationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSImagebuilderErrorDomain` domain and the following error code: `AWSImagebuilderErrorService`, `AWSImagebuilderErrorClient`, `AWSImagebuilderErrorInvalidRequest`, `AWSImagebuilderErrorServiceUnavailable`, `AWSImagebuilderErrorForbidden`, `AWSImagebuilderErrorCallRateLimitExceeded`, `AWSImagebuilderErrorResourceDependency`.
 
 @see AWSImagebuilderDeleteDistributionConfigurationRequest
 @see AWSImagebuilderDeleteDistributionConfigurationResponse
 */
- (AWSTask<AWSImagebuilderDeleteDistributionConfigurationResponse *> *)deleteDistributionConfiguration:(AWSImagebuilderDeleteDistributionConfigurationRequest *)request;

/**
 <p> Deletes a distribution configuration. </p>
 
 @param request A container for the necessary parameters to execute the DeleteDistributionConfiguration service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSImagebuilderErrorDomain` domain and the following error code: `AWSImagebuilderErrorService`, `AWSImagebuilderErrorClient`, `AWSImagebuilderErrorInvalidRequest`, `AWSImagebuilderErrorServiceUnavailable`, `AWSImagebuilderErrorForbidden`, `AWSImagebuilderErrorCallRateLimitExceeded`, `AWSImagebuilderErrorResourceDependency`.
 
 @see AWSImagebuilderDeleteDistributionConfigurationRequest
 @see AWSImagebuilderDeleteDistributionConfigurationResponse
 */
- (void)deleteDistributionConfiguration:(AWSImagebuilderDeleteDistributionConfigurationRequest *)request completionHandler:(void (^ _Nullable)(AWSImagebuilderDeleteDistributionConfigurationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Deletes an image. </p>
 
 @param request A container for the necessary parameters to execute the DeleteImage service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSImagebuilderDeleteImageResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSImagebuilderErrorDomain` domain and the following error code: `AWSImagebuilderErrorService`, `AWSImagebuilderErrorClient`, `AWSImagebuilderErrorInvalidRequest`, `AWSImagebuilderErrorServiceUnavailable`, `AWSImagebuilderErrorForbidden`, `AWSImagebuilderErrorCallRateLimitExceeded`, `AWSImagebuilderErrorResourceDependency`.
 
 @see AWSImagebuilderDeleteImageRequest
 @see AWSImagebuilderDeleteImageResponse
 */
- (AWSTask<AWSImagebuilderDeleteImageResponse *> *)deleteImage:(AWSImagebuilderDeleteImageRequest *)request;

/**
 <p> Deletes an image. </p>
 
 @param request A container for the necessary parameters to execute the DeleteImage service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSImagebuilderErrorDomain` domain and the following error code: `AWSImagebuilderErrorService`, `AWSImagebuilderErrorClient`, `AWSImagebuilderErrorInvalidRequest`, `AWSImagebuilderErrorServiceUnavailable`, `AWSImagebuilderErrorForbidden`, `AWSImagebuilderErrorCallRateLimitExceeded`, `AWSImagebuilderErrorResourceDependency`.
 
 @see AWSImagebuilderDeleteImageRequest
 @see AWSImagebuilderDeleteImageResponse
 */
- (void)deleteImage:(AWSImagebuilderDeleteImageRequest *)request completionHandler:(void (^ _Nullable)(AWSImagebuilderDeleteImageResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Deletes an image pipeline. </p>
 
 @param request A container for the necessary parameters to execute the DeleteImagePipeline service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSImagebuilderDeleteImagePipelineResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSImagebuilderErrorDomain` domain and the following error code: `AWSImagebuilderErrorService`, `AWSImagebuilderErrorClient`, `AWSImagebuilderErrorServiceUnavailable`, `AWSImagebuilderErrorInvalidRequest`, `AWSImagebuilderErrorForbidden`, `AWSImagebuilderErrorCallRateLimitExceeded`, `AWSImagebuilderErrorResourceDependency`.
 
 @see AWSImagebuilderDeleteImagePipelineRequest
 @see AWSImagebuilderDeleteImagePipelineResponse
 */
- (AWSTask<AWSImagebuilderDeleteImagePipelineResponse *> *)deleteImagePipeline:(AWSImagebuilderDeleteImagePipelineRequest *)request;

/**
 <p> Deletes an image pipeline. </p>
 
 @param request A container for the necessary parameters to execute the DeleteImagePipeline service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSImagebuilderErrorDomain` domain and the following error code: `AWSImagebuilderErrorService`, `AWSImagebuilderErrorClient`, `AWSImagebuilderErrorServiceUnavailable`, `AWSImagebuilderErrorInvalidRequest`, `AWSImagebuilderErrorForbidden`, `AWSImagebuilderErrorCallRateLimitExceeded`, `AWSImagebuilderErrorResourceDependency`.
 
 @see AWSImagebuilderDeleteImagePipelineRequest
 @see AWSImagebuilderDeleteImagePipelineResponse
 */
- (void)deleteImagePipeline:(AWSImagebuilderDeleteImagePipelineRequest *)request completionHandler:(void (^ _Nullable)(AWSImagebuilderDeleteImagePipelineResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Deletes an image recipe. </p>
 
 @param request A container for the necessary parameters to execute the DeleteImageRecipe service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSImagebuilderDeleteImageRecipeResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSImagebuilderErrorDomain` domain and the following error code: `AWSImagebuilderErrorService`, `AWSImagebuilderErrorClient`, `AWSImagebuilderErrorServiceUnavailable`, `AWSImagebuilderErrorInvalidRequest`, `AWSImagebuilderErrorForbidden`, `AWSImagebuilderErrorCallRateLimitExceeded`, `AWSImagebuilderErrorResourceDependency`.
 
 @see AWSImagebuilderDeleteImageRecipeRequest
 @see AWSImagebuilderDeleteImageRecipeResponse
 */
- (AWSTask<AWSImagebuilderDeleteImageRecipeResponse *> *)deleteImageRecipe:(AWSImagebuilderDeleteImageRecipeRequest *)request;

/**
 <p> Deletes an image recipe. </p>
 
 @param request A container for the necessary parameters to execute the DeleteImageRecipe service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSImagebuilderErrorDomain` domain and the following error code: `AWSImagebuilderErrorService`, `AWSImagebuilderErrorClient`, `AWSImagebuilderErrorServiceUnavailable`, `AWSImagebuilderErrorInvalidRequest`, `AWSImagebuilderErrorForbidden`, `AWSImagebuilderErrorCallRateLimitExceeded`, `AWSImagebuilderErrorResourceDependency`.
 
 @see AWSImagebuilderDeleteImageRecipeRequest
 @see AWSImagebuilderDeleteImageRecipeResponse
 */
- (void)deleteImageRecipe:(AWSImagebuilderDeleteImageRecipeRequest *)request completionHandler:(void (^ _Nullable)(AWSImagebuilderDeleteImageRecipeResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Deletes an infrastructure configuration. </p>
 
 @param request A container for the necessary parameters to execute the DeleteInfrastructureConfiguration service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSImagebuilderDeleteInfrastructureConfigurationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSImagebuilderErrorDomain` domain and the following error code: `AWSImagebuilderErrorService`, `AWSImagebuilderErrorClient`, `AWSImagebuilderErrorServiceUnavailable`, `AWSImagebuilderErrorInvalidRequest`, `AWSImagebuilderErrorForbidden`, `AWSImagebuilderErrorCallRateLimitExceeded`, `AWSImagebuilderErrorResourceDependency`.
 
 @see AWSImagebuilderDeleteInfrastructureConfigurationRequest
 @see AWSImagebuilderDeleteInfrastructureConfigurationResponse
 */
- (AWSTask<AWSImagebuilderDeleteInfrastructureConfigurationResponse *> *)deleteInfrastructureConfiguration:(AWSImagebuilderDeleteInfrastructureConfigurationRequest *)request;

/**
 <p> Deletes an infrastructure configuration. </p>
 
 @param request A container for the necessary parameters to execute the DeleteInfrastructureConfiguration service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSImagebuilderErrorDomain` domain and the following error code: `AWSImagebuilderErrorService`, `AWSImagebuilderErrorClient`, `AWSImagebuilderErrorServiceUnavailable`, `AWSImagebuilderErrorInvalidRequest`, `AWSImagebuilderErrorForbidden`, `AWSImagebuilderErrorCallRateLimitExceeded`, `AWSImagebuilderErrorResourceDependency`.
 
 @see AWSImagebuilderDeleteInfrastructureConfigurationRequest
 @see AWSImagebuilderDeleteInfrastructureConfigurationResponse
 */
- (void)deleteInfrastructureConfiguration:(AWSImagebuilderDeleteInfrastructureConfigurationRequest *)request completionHandler:(void (^ _Nullable)(AWSImagebuilderDeleteInfrastructureConfigurationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Gets a component object. </p>
 
 @param request A container for the necessary parameters to execute the GetComponent service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSImagebuilderGetComponentResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSImagebuilderErrorDomain` domain and the following error code: `AWSImagebuilderErrorService`, `AWSImagebuilderErrorClient`, `AWSImagebuilderErrorServiceUnavailable`, `AWSImagebuilderErrorInvalidRequest`, `AWSImagebuilderErrorForbidden`, `AWSImagebuilderErrorCallRateLimitExceeded`.
 
 @see AWSImagebuilderGetComponentRequest
 @see AWSImagebuilderGetComponentResponse
 */
- (AWSTask<AWSImagebuilderGetComponentResponse *> *)getComponent:(AWSImagebuilderGetComponentRequest *)request;

/**
 <p> Gets a component object. </p>
 
 @param request A container for the necessary parameters to execute the GetComponent service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSImagebuilderErrorDomain` domain and the following error code: `AWSImagebuilderErrorService`, `AWSImagebuilderErrorClient`, `AWSImagebuilderErrorServiceUnavailable`, `AWSImagebuilderErrorInvalidRequest`, `AWSImagebuilderErrorForbidden`, `AWSImagebuilderErrorCallRateLimitExceeded`.
 
 @see AWSImagebuilderGetComponentRequest
 @see AWSImagebuilderGetComponentResponse
 */
- (void)getComponent:(AWSImagebuilderGetComponentRequest *)request completionHandler:(void (^ _Nullable)(AWSImagebuilderGetComponentResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Gets a component policy. </p>
 
 @param request A container for the necessary parameters to execute the GetComponentPolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSImagebuilderGetComponentPolicyResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSImagebuilderErrorDomain` domain and the following error code: `AWSImagebuilderErrorService`, `AWSImagebuilderErrorServiceUnavailable`, `AWSImagebuilderErrorResourceNotFound`, `AWSImagebuilderErrorInvalidRequest`, `AWSImagebuilderErrorForbidden`, `AWSImagebuilderErrorCallRateLimitExceeded`.
 
 @see AWSImagebuilderGetComponentPolicyRequest
 @see AWSImagebuilderGetComponentPolicyResponse
 */
- (AWSTask<AWSImagebuilderGetComponentPolicyResponse *> *)getComponentPolicy:(AWSImagebuilderGetComponentPolicyRequest *)request;

/**
 <p> Gets a component policy. </p>
 
 @param request A container for the necessary parameters to execute the GetComponentPolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSImagebuilderErrorDomain` domain and the following error code: `AWSImagebuilderErrorService`, `AWSImagebuilderErrorServiceUnavailable`, `AWSImagebuilderErrorResourceNotFound`, `AWSImagebuilderErrorInvalidRequest`, `AWSImagebuilderErrorForbidden`, `AWSImagebuilderErrorCallRateLimitExceeded`.
 
 @see AWSImagebuilderGetComponentPolicyRequest
 @see AWSImagebuilderGetComponentPolicyResponse
 */
- (void)getComponentPolicy:(AWSImagebuilderGetComponentPolicyRequest *)request completionHandler:(void (^ _Nullable)(AWSImagebuilderGetComponentPolicyResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Gets a distribution configuration. </p>
 
 @param request A container for the necessary parameters to execute the GetDistributionConfiguration service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSImagebuilderGetDistributionConfigurationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSImagebuilderErrorDomain` domain and the following error code: `AWSImagebuilderErrorService`, `AWSImagebuilderErrorClient`, `AWSImagebuilderErrorServiceUnavailable`, `AWSImagebuilderErrorInvalidRequest`, `AWSImagebuilderErrorForbidden`, `AWSImagebuilderErrorCallRateLimitExceeded`.
 
 @see AWSImagebuilderGetDistributionConfigurationRequest
 @see AWSImagebuilderGetDistributionConfigurationResponse
 */
- (AWSTask<AWSImagebuilderGetDistributionConfigurationResponse *> *)getDistributionConfiguration:(AWSImagebuilderGetDistributionConfigurationRequest *)request;

/**
 <p> Gets a distribution configuration. </p>
 
 @param request A container for the necessary parameters to execute the GetDistributionConfiguration service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSImagebuilderErrorDomain` domain and the following error code: `AWSImagebuilderErrorService`, `AWSImagebuilderErrorClient`, `AWSImagebuilderErrorServiceUnavailable`, `AWSImagebuilderErrorInvalidRequest`, `AWSImagebuilderErrorForbidden`, `AWSImagebuilderErrorCallRateLimitExceeded`.
 
 @see AWSImagebuilderGetDistributionConfigurationRequest
 @see AWSImagebuilderGetDistributionConfigurationResponse
 */
- (void)getDistributionConfiguration:(AWSImagebuilderGetDistributionConfigurationRequest *)request completionHandler:(void (^ _Nullable)(AWSImagebuilderGetDistributionConfigurationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Gets an image. </p>
 
 @param request A container for the necessary parameters to execute the GetImage service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSImagebuilderGetImageResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSImagebuilderErrorDomain` domain and the following error code: `AWSImagebuilderErrorService`, `AWSImagebuilderErrorClient`, `AWSImagebuilderErrorServiceUnavailable`, `AWSImagebuilderErrorInvalidRequest`, `AWSImagebuilderErrorForbidden`, `AWSImagebuilderErrorCallRateLimitExceeded`.
 
 @see AWSImagebuilderGetImageRequest
 @see AWSImagebuilderGetImageResponse
 */
- (AWSTask<AWSImagebuilderGetImageResponse *> *)getImage:(AWSImagebuilderGetImageRequest *)request;

/**
 <p> Gets an image. </p>
 
 @param request A container for the necessary parameters to execute the GetImage service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSImagebuilderErrorDomain` domain and the following error code: `AWSImagebuilderErrorService`, `AWSImagebuilderErrorClient`, `AWSImagebuilderErrorServiceUnavailable`, `AWSImagebuilderErrorInvalidRequest`, `AWSImagebuilderErrorForbidden`, `AWSImagebuilderErrorCallRateLimitExceeded`.
 
 @see AWSImagebuilderGetImageRequest
 @see AWSImagebuilderGetImageResponse
 */
- (void)getImage:(AWSImagebuilderGetImageRequest *)request completionHandler:(void (^ _Nullable)(AWSImagebuilderGetImageResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Gets an image pipeline. </p>
 
 @param request A container for the necessary parameters to execute the GetImagePipeline service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSImagebuilderGetImagePipelineResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSImagebuilderErrorDomain` domain and the following error code: `AWSImagebuilderErrorService`, `AWSImagebuilderErrorClient`, `AWSImagebuilderErrorServiceUnavailable`, `AWSImagebuilderErrorInvalidRequest`, `AWSImagebuilderErrorForbidden`, `AWSImagebuilderErrorCallRateLimitExceeded`.
 
 @see AWSImagebuilderGetImagePipelineRequest
 @see AWSImagebuilderGetImagePipelineResponse
 */
- (AWSTask<AWSImagebuilderGetImagePipelineResponse *> *)getImagePipeline:(AWSImagebuilderGetImagePipelineRequest *)request;

/**
 <p> Gets an image pipeline. </p>
 
 @param request A container for the necessary parameters to execute the GetImagePipeline service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSImagebuilderErrorDomain` domain and the following error code: `AWSImagebuilderErrorService`, `AWSImagebuilderErrorClient`, `AWSImagebuilderErrorServiceUnavailable`, `AWSImagebuilderErrorInvalidRequest`, `AWSImagebuilderErrorForbidden`, `AWSImagebuilderErrorCallRateLimitExceeded`.
 
 @see AWSImagebuilderGetImagePipelineRequest
 @see AWSImagebuilderGetImagePipelineResponse
 */
- (void)getImagePipeline:(AWSImagebuilderGetImagePipelineRequest *)request completionHandler:(void (^ _Nullable)(AWSImagebuilderGetImagePipelineResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Gets an image policy. </p>
 
 @param request A container for the necessary parameters to execute the GetImagePolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSImagebuilderGetImagePolicyResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSImagebuilderErrorDomain` domain and the following error code: `AWSImagebuilderErrorService`, `AWSImagebuilderErrorServiceUnavailable`, `AWSImagebuilderErrorResourceNotFound`, `AWSImagebuilderErrorInvalidRequest`, `AWSImagebuilderErrorForbidden`, `AWSImagebuilderErrorCallRateLimitExceeded`.
 
 @see AWSImagebuilderGetImagePolicyRequest
 @see AWSImagebuilderGetImagePolicyResponse
 */
- (AWSTask<AWSImagebuilderGetImagePolicyResponse *> *)getImagePolicy:(AWSImagebuilderGetImagePolicyRequest *)request;

/**
 <p> Gets an image policy. </p>
 
 @param request A container for the necessary parameters to execute the GetImagePolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSImagebuilderErrorDomain` domain and the following error code: `AWSImagebuilderErrorService`, `AWSImagebuilderErrorServiceUnavailable`, `AWSImagebuilderErrorResourceNotFound`, `AWSImagebuilderErrorInvalidRequest`, `AWSImagebuilderErrorForbidden`, `AWSImagebuilderErrorCallRateLimitExceeded`.
 
 @see AWSImagebuilderGetImagePolicyRequest
 @see AWSImagebuilderGetImagePolicyResponse
 */
- (void)getImagePolicy:(AWSImagebuilderGetImagePolicyRequest *)request completionHandler:(void (^ _Nullable)(AWSImagebuilderGetImagePolicyResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Gets an image recipe. </p>
 
 @param request A container for the necessary parameters to execute the GetImageRecipe service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSImagebuilderGetImageRecipeResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSImagebuilderErrorDomain` domain and the following error code: `AWSImagebuilderErrorService`, `AWSImagebuilderErrorClient`, `AWSImagebuilderErrorServiceUnavailable`, `AWSImagebuilderErrorInvalidRequest`, `AWSImagebuilderErrorForbidden`, `AWSImagebuilderErrorCallRateLimitExceeded`.
 
 @see AWSImagebuilderGetImageRecipeRequest
 @see AWSImagebuilderGetImageRecipeResponse
 */
- (AWSTask<AWSImagebuilderGetImageRecipeResponse *> *)getImageRecipe:(AWSImagebuilderGetImageRecipeRequest *)request;

/**
 <p> Gets an image recipe. </p>
 
 @param request A container for the necessary parameters to execute the GetImageRecipe service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSImagebuilderErrorDomain` domain and the following error code: `AWSImagebuilderErrorService`, `AWSImagebuilderErrorClient`, `AWSImagebuilderErrorServiceUnavailable`, `AWSImagebuilderErrorInvalidRequest`, `AWSImagebuilderErrorForbidden`, `AWSImagebuilderErrorCallRateLimitExceeded`.
 
 @see AWSImagebuilderGetImageRecipeRequest
 @see AWSImagebuilderGetImageRecipeResponse
 */
- (void)getImageRecipe:(AWSImagebuilderGetImageRecipeRequest *)request completionHandler:(void (^ _Nullable)(AWSImagebuilderGetImageRecipeResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Gets an image recipe policy. </p>
 
 @param request A container for the necessary parameters to execute the GetImageRecipePolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSImagebuilderGetImageRecipePolicyResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSImagebuilderErrorDomain` domain and the following error code: `AWSImagebuilderErrorService`, `AWSImagebuilderErrorServiceUnavailable`, `AWSImagebuilderErrorInvalidRequest`, `AWSImagebuilderErrorResourceNotFound`, `AWSImagebuilderErrorForbidden`, `AWSImagebuilderErrorCallRateLimitExceeded`.
 
 @see AWSImagebuilderGetImageRecipePolicyRequest
 @see AWSImagebuilderGetImageRecipePolicyResponse
 */
- (AWSTask<AWSImagebuilderGetImageRecipePolicyResponse *> *)getImageRecipePolicy:(AWSImagebuilderGetImageRecipePolicyRequest *)request;

/**
 <p> Gets an image recipe policy. </p>
 
 @param request A container for the necessary parameters to execute the GetImageRecipePolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSImagebuilderErrorDomain` domain and the following error code: `AWSImagebuilderErrorService`, `AWSImagebuilderErrorServiceUnavailable`, `AWSImagebuilderErrorInvalidRequest`, `AWSImagebuilderErrorResourceNotFound`, `AWSImagebuilderErrorForbidden`, `AWSImagebuilderErrorCallRateLimitExceeded`.
 
 @see AWSImagebuilderGetImageRecipePolicyRequest
 @see AWSImagebuilderGetImageRecipePolicyResponse
 */
- (void)getImageRecipePolicy:(AWSImagebuilderGetImageRecipePolicyRequest *)request completionHandler:(void (^ _Nullable)(AWSImagebuilderGetImageRecipePolicyResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Gets an infrastructure configuration. </p>
 
 @param request A container for the necessary parameters to execute the GetInfrastructureConfiguration service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSImagebuilderGetInfrastructureConfigurationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSImagebuilderErrorDomain` domain and the following error code: `AWSImagebuilderErrorService`, `AWSImagebuilderErrorClient`, `AWSImagebuilderErrorServiceUnavailable`, `AWSImagebuilderErrorInvalidRequest`, `AWSImagebuilderErrorForbidden`, `AWSImagebuilderErrorCallRateLimitExceeded`.
 
 @see AWSImagebuilderGetInfrastructureConfigurationRequest
 @see AWSImagebuilderGetInfrastructureConfigurationResponse
 */
- (AWSTask<AWSImagebuilderGetInfrastructureConfigurationResponse *> *)getInfrastructureConfiguration:(AWSImagebuilderGetInfrastructureConfigurationRequest *)request;

/**
 <p> Gets an infrastructure configuration. </p>
 
 @param request A container for the necessary parameters to execute the GetInfrastructureConfiguration service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSImagebuilderErrorDomain` domain and the following error code: `AWSImagebuilderErrorService`, `AWSImagebuilderErrorClient`, `AWSImagebuilderErrorServiceUnavailable`, `AWSImagebuilderErrorInvalidRequest`, `AWSImagebuilderErrorForbidden`, `AWSImagebuilderErrorCallRateLimitExceeded`.
 
 @see AWSImagebuilderGetInfrastructureConfigurationRequest
 @see AWSImagebuilderGetInfrastructureConfigurationResponse
 */
- (void)getInfrastructureConfiguration:(AWSImagebuilderGetInfrastructureConfigurationRequest *)request completionHandler:(void (^ _Nullable)(AWSImagebuilderGetInfrastructureConfigurationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Imports a component and transforms its data into a component document. </p>
 
 @param request A container for the necessary parameters to execute the ImportComponent service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSImagebuilderImportComponentResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSImagebuilderErrorDomain` domain and the following error code: `AWSImagebuilderErrorService`, `AWSImagebuilderErrorClient`, `AWSImagebuilderErrorServiceUnavailable`, `AWSImagebuilderErrorInvalidRequest`, `AWSImagebuilderErrorIdempotentParameterMismatch`, `AWSImagebuilderErrorForbidden`, `AWSImagebuilderErrorCallRateLimitExceeded`, `AWSImagebuilderErrorInvalidVersionNumber`, `AWSImagebuilderErrorResourceInUse`, `AWSImagebuilderErrorInvalidParameterCombination`.
 
 @see AWSImagebuilderImportComponentRequest
 @see AWSImagebuilderImportComponentResponse
 */
- (AWSTask<AWSImagebuilderImportComponentResponse *> *)importComponent:(AWSImagebuilderImportComponentRequest *)request;

/**
 <p>Imports a component and transforms its data into a component document. </p>
 
 @param request A container for the necessary parameters to execute the ImportComponent service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSImagebuilderErrorDomain` domain and the following error code: `AWSImagebuilderErrorService`, `AWSImagebuilderErrorClient`, `AWSImagebuilderErrorServiceUnavailable`, `AWSImagebuilderErrorInvalidRequest`, `AWSImagebuilderErrorIdempotentParameterMismatch`, `AWSImagebuilderErrorForbidden`, `AWSImagebuilderErrorCallRateLimitExceeded`, `AWSImagebuilderErrorInvalidVersionNumber`, `AWSImagebuilderErrorResourceInUse`, `AWSImagebuilderErrorInvalidParameterCombination`.
 
 @see AWSImagebuilderImportComponentRequest
 @see AWSImagebuilderImportComponentResponse
 */
- (void)importComponent:(AWSImagebuilderImportComponentRequest *)request completionHandler:(void (^ _Nullable)(AWSImagebuilderImportComponentResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Returns the list of component build versions for the specified semantic version. </p>
 
 @param request A container for the necessary parameters to execute the ListComponentBuildVersions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSImagebuilderListComponentBuildVersionsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSImagebuilderErrorDomain` domain and the following error code: `AWSImagebuilderErrorService`, `AWSImagebuilderErrorClient`, `AWSImagebuilderErrorServiceUnavailable`, `AWSImagebuilderErrorInvalidRequest`, `AWSImagebuilderErrorInvalidPaginationToken`, `AWSImagebuilderErrorForbidden`, `AWSImagebuilderErrorCallRateLimitExceeded`.
 
 @see AWSImagebuilderListComponentBuildVersionsRequest
 @see AWSImagebuilderListComponentBuildVersionsResponse
 */
- (AWSTask<AWSImagebuilderListComponentBuildVersionsResponse *> *)listComponentBuildVersions:(AWSImagebuilderListComponentBuildVersionsRequest *)request;

/**
 <p> Returns the list of component build versions for the specified semantic version. </p>
 
 @param request A container for the necessary parameters to execute the ListComponentBuildVersions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSImagebuilderErrorDomain` domain and the following error code: `AWSImagebuilderErrorService`, `AWSImagebuilderErrorClient`, `AWSImagebuilderErrorServiceUnavailable`, `AWSImagebuilderErrorInvalidRequest`, `AWSImagebuilderErrorInvalidPaginationToken`, `AWSImagebuilderErrorForbidden`, `AWSImagebuilderErrorCallRateLimitExceeded`.
 
 @see AWSImagebuilderListComponentBuildVersionsRequest
 @see AWSImagebuilderListComponentBuildVersionsResponse
 */
- (void)listComponentBuildVersions:(AWSImagebuilderListComponentBuildVersionsRequest *)request completionHandler:(void (^ _Nullable)(AWSImagebuilderListComponentBuildVersionsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the list of component build versions for the specified semantic version. </p>
 
 @param request A container for the necessary parameters to execute the ListComponents service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSImagebuilderListComponentsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSImagebuilderErrorDomain` domain and the following error code: `AWSImagebuilderErrorService`, `AWSImagebuilderErrorClient`, `AWSImagebuilderErrorServiceUnavailable`, `AWSImagebuilderErrorInvalidRequest`, `AWSImagebuilderErrorInvalidPaginationToken`, `AWSImagebuilderErrorForbidden`, `AWSImagebuilderErrorCallRateLimitExceeded`.
 
 @see AWSImagebuilderListComponentsRequest
 @see AWSImagebuilderListComponentsResponse
 */
- (AWSTask<AWSImagebuilderListComponentsResponse *> *)listComponents:(AWSImagebuilderListComponentsRequest *)request;

/**
 <p>Returns the list of component build versions for the specified semantic version. </p>
 
 @param request A container for the necessary parameters to execute the ListComponents service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSImagebuilderErrorDomain` domain and the following error code: `AWSImagebuilderErrorService`, `AWSImagebuilderErrorClient`, `AWSImagebuilderErrorServiceUnavailable`, `AWSImagebuilderErrorInvalidRequest`, `AWSImagebuilderErrorInvalidPaginationToken`, `AWSImagebuilderErrorForbidden`, `AWSImagebuilderErrorCallRateLimitExceeded`.
 
 @see AWSImagebuilderListComponentsRequest
 @see AWSImagebuilderListComponentsResponse
 */
- (void)listComponents:(AWSImagebuilderListComponentsRequest *)request completionHandler:(void (^ _Nullable)(AWSImagebuilderListComponentsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Returns a list of distribution configurations. </p>
 
 @param request A container for the necessary parameters to execute the ListDistributionConfigurations service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSImagebuilderListDistributionConfigurationsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSImagebuilderErrorDomain` domain and the following error code: `AWSImagebuilderErrorService`, `AWSImagebuilderErrorClient`, `AWSImagebuilderErrorServiceUnavailable`, `AWSImagebuilderErrorInvalidRequest`, `AWSImagebuilderErrorInvalidPaginationToken`, `AWSImagebuilderErrorForbidden`, `AWSImagebuilderErrorCallRateLimitExceeded`.
 
 @see AWSImagebuilderListDistributionConfigurationsRequest
 @see AWSImagebuilderListDistributionConfigurationsResponse
 */
- (AWSTask<AWSImagebuilderListDistributionConfigurationsResponse *> *)listDistributionConfigurations:(AWSImagebuilderListDistributionConfigurationsRequest *)request;

/**
 <p> Returns a list of distribution configurations. </p>
 
 @param request A container for the necessary parameters to execute the ListDistributionConfigurations service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSImagebuilderErrorDomain` domain and the following error code: `AWSImagebuilderErrorService`, `AWSImagebuilderErrorClient`, `AWSImagebuilderErrorServiceUnavailable`, `AWSImagebuilderErrorInvalidRequest`, `AWSImagebuilderErrorInvalidPaginationToken`, `AWSImagebuilderErrorForbidden`, `AWSImagebuilderErrorCallRateLimitExceeded`.
 
 @see AWSImagebuilderListDistributionConfigurationsRequest
 @see AWSImagebuilderListDistributionConfigurationsResponse
 */
- (void)listDistributionConfigurations:(AWSImagebuilderListDistributionConfigurationsRequest *)request completionHandler:(void (^ _Nullable)(AWSImagebuilderListDistributionConfigurationsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Returns a list of image build versions. </p>
 
 @param request A container for the necessary parameters to execute the ListImageBuildVersions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSImagebuilderListImageBuildVersionsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSImagebuilderErrorDomain` domain and the following error code: `AWSImagebuilderErrorService`, `AWSImagebuilderErrorClient`, `AWSImagebuilderErrorServiceUnavailable`, `AWSImagebuilderErrorInvalidRequest`, `AWSImagebuilderErrorInvalidPaginationToken`, `AWSImagebuilderErrorForbidden`, `AWSImagebuilderErrorCallRateLimitExceeded`.
 
 @see AWSImagebuilderListImageBuildVersionsRequest
 @see AWSImagebuilderListImageBuildVersionsResponse
 */
- (AWSTask<AWSImagebuilderListImageBuildVersionsResponse *> *)listImageBuildVersions:(AWSImagebuilderListImageBuildVersionsRequest *)request;

/**
 <p> Returns a list of image build versions. </p>
 
 @param request A container for the necessary parameters to execute the ListImageBuildVersions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSImagebuilderErrorDomain` domain and the following error code: `AWSImagebuilderErrorService`, `AWSImagebuilderErrorClient`, `AWSImagebuilderErrorServiceUnavailable`, `AWSImagebuilderErrorInvalidRequest`, `AWSImagebuilderErrorInvalidPaginationToken`, `AWSImagebuilderErrorForbidden`, `AWSImagebuilderErrorCallRateLimitExceeded`.
 
 @see AWSImagebuilderListImageBuildVersionsRequest
 @see AWSImagebuilderListImageBuildVersionsResponse
 */
- (void)listImageBuildVersions:(AWSImagebuilderListImageBuildVersionsRequest *)request completionHandler:(void (^ _Nullable)(AWSImagebuilderListImageBuildVersionsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Returns a list of images created by the specified pipeline. </p>
 
 @param request A container for the necessary parameters to execute the ListImagePipelineImages service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSImagebuilderListImagePipelineImagesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSImagebuilderErrorDomain` domain and the following error code: `AWSImagebuilderErrorService`, `AWSImagebuilderErrorClient`, `AWSImagebuilderErrorServiceUnavailable`, `AWSImagebuilderErrorInvalidRequest`, `AWSImagebuilderErrorInvalidPaginationToken`, `AWSImagebuilderErrorResourceNotFound`, `AWSImagebuilderErrorForbidden`, `AWSImagebuilderErrorCallRateLimitExceeded`.
 
 @see AWSImagebuilderListImagePipelineImagesRequest
 @see AWSImagebuilderListImagePipelineImagesResponse
 */
- (AWSTask<AWSImagebuilderListImagePipelineImagesResponse *> *)listImagePipelineImages:(AWSImagebuilderListImagePipelineImagesRequest *)request;

/**
 <p> Returns a list of images created by the specified pipeline. </p>
 
 @param request A container for the necessary parameters to execute the ListImagePipelineImages service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSImagebuilderErrorDomain` domain and the following error code: `AWSImagebuilderErrorService`, `AWSImagebuilderErrorClient`, `AWSImagebuilderErrorServiceUnavailable`, `AWSImagebuilderErrorInvalidRequest`, `AWSImagebuilderErrorInvalidPaginationToken`, `AWSImagebuilderErrorResourceNotFound`, `AWSImagebuilderErrorForbidden`, `AWSImagebuilderErrorCallRateLimitExceeded`.
 
 @see AWSImagebuilderListImagePipelineImagesRequest
 @see AWSImagebuilderListImagePipelineImagesResponse
 */
- (void)listImagePipelineImages:(AWSImagebuilderListImagePipelineImagesRequest *)request completionHandler:(void (^ _Nullable)(AWSImagebuilderListImagePipelineImagesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of image pipelines. </p>
 
 @param request A container for the necessary parameters to execute the ListImagePipelines service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSImagebuilderListImagePipelinesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSImagebuilderErrorDomain` domain and the following error code: `AWSImagebuilderErrorService`, `AWSImagebuilderErrorClient`, `AWSImagebuilderErrorServiceUnavailable`, `AWSImagebuilderErrorInvalidRequest`, `AWSImagebuilderErrorInvalidPaginationToken`, `AWSImagebuilderErrorForbidden`, `AWSImagebuilderErrorCallRateLimitExceeded`.
 
 @see AWSImagebuilderListImagePipelinesRequest
 @see AWSImagebuilderListImagePipelinesResponse
 */
- (AWSTask<AWSImagebuilderListImagePipelinesResponse *> *)listImagePipelines:(AWSImagebuilderListImagePipelinesRequest *)request;

/**
 <p>Returns a list of image pipelines. </p>
 
 @param request A container for the necessary parameters to execute the ListImagePipelines service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSImagebuilderErrorDomain` domain and the following error code: `AWSImagebuilderErrorService`, `AWSImagebuilderErrorClient`, `AWSImagebuilderErrorServiceUnavailable`, `AWSImagebuilderErrorInvalidRequest`, `AWSImagebuilderErrorInvalidPaginationToken`, `AWSImagebuilderErrorForbidden`, `AWSImagebuilderErrorCallRateLimitExceeded`.
 
 @see AWSImagebuilderListImagePipelinesRequest
 @see AWSImagebuilderListImagePipelinesResponse
 */
- (void)listImagePipelines:(AWSImagebuilderListImagePipelinesRequest *)request completionHandler:(void (^ _Nullable)(AWSImagebuilderListImagePipelinesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Returns a list of image recipes. </p>
 
 @param request A container for the necessary parameters to execute the ListImageRecipes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSImagebuilderListImageRecipesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSImagebuilderErrorDomain` domain and the following error code: `AWSImagebuilderErrorService`, `AWSImagebuilderErrorClient`, `AWSImagebuilderErrorServiceUnavailable`, `AWSImagebuilderErrorInvalidRequest`, `AWSImagebuilderErrorInvalidPaginationToken`, `AWSImagebuilderErrorForbidden`, `AWSImagebuilderErrorCallRateLimitExceeded`.
 
 @see AWSImagebuilderListImageRecipesRequest
 @see AWSImagebuilderListImageRecipesResponse
 */
- (AWSTask<AWSImagebuilderListImageRecipesResponse *> *)listImageRecipes:(AWSImagebuilderListImageRecipesRequest *)request;

/**
 <p> Returns a list of image recipes. </p>
 
 @param request A container for the necessary parameters to execute the ListImageRecipes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSImagebuilderErrorDomain` domain and the following error code: `AWSImagebuilderErrorService`, `AWSImagebuilderErrorClient`, `AWSImagebuilderErrorServiceUnavailable`, `AWSImagebuilderErrorInvalidRequest`, `AWSImagebuilderErrorInvalidPaginationToken`, `AWSImagebuilderErrorForbidden`, `AWSImagebuilderErrorCallRateLimitExceeded`.
 
 @see AWSImagebuilderListImageRecipesRequest
 @see AWSImagebuilderListImageRecipesResponse
 */
- (void)listImageRecipes:(AWSImagebuilderListImageRecipesRequest *)request completionHandler:(void (^ _Nullable)(AWSImagebuilderListImageRecipesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Returns the list of images that you have access to. </p>
 
 @param request A container for the necessary parameters to execute the ListImages service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSImagebuilderListImagesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSImagebuilderErrorDomain` domain and the following error code: `AWSImagebuilderErrorService`, `AWSImagebuilderErrorClient`, `AWSImagebuilderErrorServiceUnavailable`, `AWSImagebuilderErrorInvalidRequest`, `AWSImagebuilderErrorInvalidPaginationToken`, `AWSImagebuilderErrorForbidden`, `AWSImagebuilderErrorCallRateLimitExceeded`.
 
 @see AWSImagebuilderListImagesRequest
 @see AWSImagebuilderListImagesResponse
 */
- (AWSTask<AWSImagebuilderListImagesResponse *> *)listImages:(AWSImagebuilderListImagesRequest *)request;

/**
 <p> Returns the list of images that you have access to. </p>
 
 @param request A container for the necessary parameters to execute the ListImages service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSImagebuilderErrorDomain` domain and the following error code: `AWSImagebuilderErrorService`, `AWSImagebuilderErrorClient`, `AWSImagebuilderErrorServiceUnavailable`, `AWSImagebuilderErrorInvalidRequest`, `AWSImagebuilderErrorInvalidPaginationToken`, `AWSImagebuilderErrorForbidden`, `AWSImagebuilderErrorCallRateLimitExceeded`.
 
 @see AWSImagebuilderListImagesRequest
 @see AWSImagebuilderListImagesResponse
 */
- (void)listImages:(AWSImagebuilderListImagesRequest *)request completionHandler:(void (^ _Nullable)(AWSImagebuilderListImagesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Returns a list of infrastructure configurations. </p>
 
 @param request A container for the necessary parameters to execute the ListInfrastructureConfigurations service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSImagebuilderListInfrastructureConfigurationsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSImagebuilderErrorDomain` domain and the following error code: `AWSImagebuilderErrorService`, `AWSImagebuilderErrorClient`, `AWSImagebuilderErrorServiceUnavailable`, `AWSImagebuilderErrorInvalidRequest`, `AWSImagebuilderErrorInvalidPaginationToken`, `AWSImagebuilderErrorForbidden`, `AWSImagebuilderErrorCallRateLimitExceeded`.
 
 @see AWSImagebuilderListInfrastructureConfigurationsRequest
 @see AWSImagebuilderListInfrastructureConfigurationsResponse
 */
- (AWSTask<AWSImagebuilderListInfrastructureConfigurationsResponse *> *)listInfrastructureConfigurations:(AWSImagebuilderListInfrastructureConfigurationsRequest *)request;

/**
 <p> Returns a list of infrastructure configurations. </p>
 
 @param request A container for the necessary parameters to execute the ListInfrastructureConfigurations service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSImagebuilderErrorDomain` domain and the following error code: `AWSImagebuilderErrorService`, `AWSImagebuilderErrorClient`, `AWSImagebuilderErrorServiceUnavailable`, `AWSImagebuilderErrorInvalidRequest`, `AWSImagebuilderErrorInvalidPaginationToken`, `AWSImagebuilderErrorForbidden`, `AWSImagebuilderErrorCallRateLimitExceeded`.
 
 @see AWSImagebuilderListInfrastructureConfigurationsRequest
 @see AWSImagebuilderListInfrastructureConfigurationsResponse
 */
- (void)listInfrastructureConfigurations:(AWSImagebuilderListInfrastructureConfigurationsRequest *)request completionHandler:(void (^ _Nullable)(AWSImagebuilderListInfrastructureConfigurationsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Returns the list of tags for the specified resource. </p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSImagebuilderListTagsForResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSImagebuilderErrorDomain` domain and the following error code: `AWSImagebuilderErrorService`, `AWSImagebuilderErrorInvalidParameter`, `AWSImagebuilderErrorResourceNotFound`.
 
 @see AWSImagebuilderListTagsForResourceRequest
 @see AWSImagebuilderListTagsForResourceResponse
 */
- (AWSTask<AWSImagebuilderListTagsForResourceResponse *> *)listTagsForResource:(AWSImagebuilderListTagsForResourceRequest *)request;

/**
 <p> Returns the list of tags for the specified resource. </p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSImagebuilderErrorDomain` domain and the following error code: `AWSImagebuilderErrorService`, `AWSImagebuilderErrorInvalidParameter`, `AWSImagebuilderErrorResourceNotFound`.
 
 @see AWSImagebuilderListTagsForResourceRequest
 @see AWSImagebuilderListTagsForResourceResponse
 */
- (void)listTagsForResource:(AWSImagebuilderListTagsForResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSImagebuilderListTagsForResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Applies a policy to a component. We recommend that you call the RAM API <a href="https://docs.aws.amazon.com/ram/latest/APIReference/API_CreateResourceShare.html">CreateResourceShare</a> to share resources. If you call the Image Builder API <code>PutComponentPolicy</code>, you must also call the RAM API <a href="https://docs.aws.amazon.com/ram/latest/APIReference/API_PromoteResourceShareCreatedFromPolicy.html">PromoteResourceShareCreatedFromPolicy</a> in order for the resource to be visible to all principals with whom the resource is shared. </p>
 
 @param request A container for the necessary parameters to execute the PutComponentPolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSImagebuilderPutComponentPolicyResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSImagebuilderErrorDomain` domain and the following error code: `AWSImagebuilderErrorService`, `AWSImagebuilderErrorClient`, `AWSImagebuilderErrorServiceUnavailable`, `AWSImagebuilderErrorInvalidRequest`, `AWSImagebuilderErrorInvalidParameterValue`, `AWSImagebuilderErrorResourceNotFound`, `AWSImagebuilderErrorForbidden`, `AWSImagebuilderErrorCallRateLimitExceeded`.
 
 @see AWSImagebuilderPutComponentPolicyRequest
 @see AWSImagebuilderPutComponentPolicyResponse
 */
- (AWSTask<AWSImagebuilderPutComponentPolicyResponse *> *)putComponentPolicy:(AWSImagebuilderPutComponentPolicyRequest *)request;

/**
 <p> Applies a policy to a component. We recommend that you call the RAM API <a href="https://docs.aws.amazon.com/ram/latest/APIReference/API_CreateResourceShare.html">CreateResourceShare</a> to share resources. If you call the Image Builder API <code>PutComponentPolicy</code>, you must also call the RAM API <a href="https://docs.aws.amazon.com/ram/latest/APIReference/API_PromoteResourceShareCreatedFromPolicy.html">PromoteResourceShareCreatedFromPolicy</a> in order for the resource to be visible to all principals with whom the resource is shared. </p>
 
 @param request A container for the necessary parameters to execute the PutComponentPolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSImagebuilderErrorDomain` domain and the following error code: `AWSImagebuilderErrorService`, `AWSImagebuilderErrorClient`, `AWSImagebuilderErrorServiceUnavailable`, `AWSImagebuilderErrorInvalidRequest`, `AWSImagebuilderErrorInvalidParameterValue`, `AWSImagebuilderErrorResourceNotFound`, `AWSImagebuilderErrorForbidden`, `AWSImagebuilderErrorCallRateLimitExceeded`.
 
 @see AWSImagebuilderPutComponentPolicyRequest
 @see AWSImagebuilderPutComponentPolicyResponse
 */
- (void)putComponentPolicy:(AWSImagebuilderPutComponentPolicyRequest *)request completionHandler:(void (^ _Nullable)(AWSImagebuilderPutComponentPolicyResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Applies a policy to an image. We recommend that you call the RAM API <a href="https://docs.aws.amazon.com/ram/latest/APIReference/API_CreateResourceShare.html">CreateResourceShare</a> to share resources. If you call the Image Builder API <code>PutImagePolicy</code>, you must also call the RAM API <a href="https://docs.aws.amazon.com/ram/latest/APIReference/API_PromoteResourceShareCreatedFromPolicy.html">PromoteResourceShareCreatedFromPolicy</a> in order for the resource to be visible to all principals with whom the resource is shared. </p>
 
 @param request A container for the necessary parameters to execute the PutImagePolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSImagebuilderPutImagePolicyResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSImagebuilderErrorDomain` domain and the following error code: `AWSImagebuilderErrorService`, `AWSImagebuilderErrorClient`, `AWSImagebuilderErrorServiceUnavailable`, `AWSImagebuilderErrorInvalidRequest`, `AWSImagebuilderErrorInvalidParameterValue`, `AWSImagebuilderErrorResourceNotFound`, `AWSImagebuilderErrorForbidden`, `AWSImagebuilderErrorCallRateLimitExceeded`.
 
 @see AWSImagebuilderPutImagePolicyRequest
 @see AWSImagebuilderPutImagePolicyResponse
 */
- (AWSTask<AWSImagebuilderPutImagePolicyResponse *> *)putImagePolicy:(AWSImagebuilderPutImagePolicyRequest *)request;

/**
 <p>Applies a policy to an image. We recommend that you call the RAM API <a href="https://docs.aws.amazon.com/ram/latest/APIReference/API_CreateResourceShare.html">CreateResourceShare</a> to share resources. If you call the Image Builder API <code>PutImagePolicy</code>, you must also call the RAM API <a href="https://docs.aws.amazon.com/ram/latest/APIReference/API_PromoteResourceShareCreatedFromPolicy.html">PromoteResourceShareCreatedFromPolicy</a> in order for the resource to be visible to all principals with whom the resource is shared. </p>
 
 @param request A container for the necessary parameters to execute the PutImagePolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSImagebuilderErrorDomain` domain and the following error code: `AWSImagebuilderErrorService`, `AWSImagebuilderErrorClient`, `AWSImagebuilderErrorServiceUnavailable`, `AWSImagebuilderErrorInvalidRequest`, `AWSImagebuilderErrorInvalidParameterValue`, `AWSImagebuilderErrorResourceNotFound`, `AWSImagebuilderErrorForbidden`, `AWSImagebuilderErrorCallRateLimitExceeded`.
 
 @see AWSImagebuilderPutImagePolicyRequest
 @see AWSImagebuilderPutImagePolicyResponse
 */
- (void)putImagePolicy:(AWSImagebuilderPutImagePolicyRequest *)request completionHandler:(void (^ _Nullable)(AWSImagebuilderPutImagePolicyResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Applies a policy to an image recipe. We recommend that you call the RAM API <a href="https://docs.aws.amazon.com/ram/latest/APIReference/API_CreateResourceShare.html">CreateResourceShare</a> to share resources. If you call the Image Builder API <code>PutImageRecipePolicy</code>, you must also call the RAM API <a href="https://docs.aws.amazon.com/ram/latest/APIReference/API_PromoteResourceShareCreatedFromPolicy.html">PromoteResourceShareCreatedFromPolicy</a> in order for the resource to be visible to all principals with whom the resource is shared. </p>
 
 @param request A container for the necessary parameters to execute the PutImageRecipePolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSImagebuilderPutImageRecipePolicyResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSImagebuilderErrorDomain` domain and the following error code: `AWSImagebuilderErrorService`, `AWSImagebuilderErrorClient`, `AWSImagebuilderErrorServiceUnavailable`, `AWSImagebuilderErrorInvalidRequest`, `AWSImagebuilderErrorInvalidParameterValue`, `AWSImagebuilderErrorResourceNotFound`, `AWSImagebuilderErrorForbidden`, `AWSImagebuilderErrorCallRateLimitExceeded`.
 
 @see AWSImagebuilderPutImageRecipePolicyRequest
 @see AWSImagebuilderPutImageRecipePolicyResponse
 */
- (AWSTask<AWSImagebuilderPutImageRecipePolicyResponse *> *)putImageRecipePolicy:(AWSImagebuilderPutImageRecipePolicyRequest *)request;

/**
 <p> Applies a policy to an image recipe. We recommend that you call the RAM API <a href="https://docs.aws.amazon.com/ram/latest/APIReference/API_CreateResourceShare.html">CreateResourceShare</a> to share resources. If you call the Image Builder API <code>PutImageRecipePolicy</code>, you must also call the RAM API <a href="https://docs.aws.amazon.com/ram/latest/APIReference/API_PromoteResourceShareCreatedFromPolicy.html">PromoteResourceShareCreatedFromPolicy</a> in order for the resource to be visible to all principals with whom the resource is shared. </p>
 
 @param request A container for the necessary parameters to execute the PutImageRecipePolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSImagebuilderErrorDomain` domain and the following error code: `AWSImagebuilderErrorService`, `AWSImagebuilderErrorClient`, `AWSImagebuilderErrorServiceUnavailable`, `AWSImagebuilderErrorInvalidRequest`, `AWSImagebuilderErrorInvalidParameterValue`, `AWSImagebuilderErrorResourceNotFound`, `AWSImagebuilderErrorForbidden`, `AWSImagebuilderErrorCallRateLimitExceeded`.
 
 @see AWSImagebuilderPutImageRecipePolicyRequest
 @see AWSImagebuilderPutImageRecipePolicyResponse
 */
- (void)putImageRecipePolicy:(AWSImagebuilderPutImageRecipePolicyRequest *)request completionHandler:(void (^ _Nullable)(AWSImagebuilderPutImageRecipePolicyResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Manually triggers a pipeline to create an image. </p>
 
 @param request A container for the necessary parameters to execute the StartImagePipelineExecution service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSImagebuilderStartImagePipelineExecutionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSImagebuilderErrorDomain` domain and the following error code: `AWSImagebuilderErrorService`, `AWSImagebuilderErrorClient`, `AWSImagebuilderErrorServiceUnavailable`, `AWSImagebuilderErrorInvalidRequest`, `AWSImagebuilderErrorResourceNotFound`, `AWSImagebuilderErrorIdempotentParameterMismatch`, `AWSImagebuilderErrorForbidden`, `AWSImagebuilderErrorCallRateLimitExceeded`, `AWSImagebuilderErrorResourceInUse`.
 
 @see AWSImagebuilderStartImagePipelineExecutionRequest
 @see AWSImagebuilderStartImagePipelineExecutionResponse
 */
- (AWSTask<AWSImagebuilderStartImagePipelineExecutionResponse *> *)startImagePipelineExecution:(AWSImagebuilderStartImagePipelineExecutionRequest *)request;

/**
 <p> Manually triggers a pipeline to create an image. </p>
 
 @param request A container for the necessary parameters to execute the StartImagePipelineExecution service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSImagebuilderErrorDomain` domain and the following error code: `AWSImagebuilderErrorService`, `AWSImagebuilderErrorClient`, `AWSImagebuilderErrorServiceUnavailable`, `AWSImagebuilderErrorInvalidRequest`, `AWSImagebuilderErrorResourceNotFound`, `AWSImagebuilderErrorIdempotentParameterMismatch`, `AWSImagebuilderErrorForbidden`, `AWSImagebuilderErrorCallRateLimitExceeded`, `AWSImagebuilderErrorResourceInUse`.
 
 @see AWSImagebuilderStartImagePipelineExecutionRequest
 @see AWSImagebuilderStartImagePipelineExecutionResponse
 */
- (void)startImagePipelineExecution:(AWSImagebuilderStartImagePipelineExecutionRequest *)request completionHandler:(void (^ _Nullable)(AWSImagebuilderStartImagePipelineExecutionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Adds a tag to a resource. </p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSImagebuilderTagResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSImagebuilderErrorDomain` domain and the following error code: `AWSImagebuilderErrorService`, `AWSImagebuilderErrorInvalidParameter`, `AWSImagebuilderErrorResourceNotFound`.
 
 @see AWSImagebuilderTagResourceRequest
 @see AWSImagebuilderTagResourceResponse
 */
- (AWSTask<AWSImagebuilderTagResourceResponse *> *)tagResource:(AWSImagebuilderTagResourceRequest *)request;

/**
 <p> Adds a tag to a resource. </p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSImagebuilderErrorDomain` domain and the following error code: `AWSImagebuilderErrorService`, `AWSImagebuilderErrorInvalidParameter`, `AWSImagebuilderErrorResourceNotFound`.
 
 @see AWSImagebuilderTagResourceRequest
 @see AWSImagebuilderTagResourceResponse
 */
- (void)tagResource:(AWSImagebuilderTagResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSImagebuilderTagResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Removes a tag from a resource. </p>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSImagebuilderUntagResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSImagebuilderErrorDomain` domain and the following error code: `AWSImagebuilderErrorService`, `AWSImagebuilderErrorInvalidParameter`, `AWSImagebuilderErrorResourceNotFound`.
 
 @see AWSImagebuilderUntagResourceRequest
 @see AWSImagebuilderUntagResourceResponse
 */
- (AWSTask<AWSImagebuilderUntagResourceResponse *> *)untagResource:(AWSImagebuilderUntagResourceRequest *)request;

/**
 <p> Removes a tag from a resource. </p>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSImagebuilderErrorDomain` domain and the following error code: `AWSImagebuilderErrorService`, `AWSImagebuilderErrorInvalidParameter`, `AWSImagebuilderErrorResourceNotFound`.
 
 @see AWSImagebuilderUntagResourceRequest
 @see AWSImagebuilderUntagResourceResponse
 */
- (void)untagResource:(AWSImagebuilderUntagResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSImagebuilderUntagResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Updates a new distribution configuration. Distribution configurations define and configure the outputs of your pipeline. </p>
 
 @param request A container for the necessary parameters to execute the UpdateDistributionConfiguration service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSImagebuilderUpdateDistributionConfigurationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSImagebuilderErrorDomain` domain and the following error code: `AWSImagebuilderErrorService`, `AWSImagebuilderErrorClient`, `AWSImagebuilderErrorServiceUnavailable`, `AWSImagebuilderErrorInvalidRequest`, `AWSImagebuilderErrorIdempotentParameterMismatch`, `AWSImagebuilderErrorForbidden`, `AWSImagebuilderErrorCallRateLimitExceeded`, `AWSImagebuilderErrorResourceInUse`, `AWSImagebuilderErrorInvalidParameterCombination`.
 
 @see AWSImagebuilderUpdateDistributionConfigurationRequest
 @see AWSImagebuilderUpdateDistributionConfigurationResponse
 */
- (AWSTask<AWSImagebuilderUpdateDistributionConfigurationResponse *> *)updateDistributionConfiguration:(AWSImagebuilderUpdateDistributionConfigurationRequest *)request;

/**
 <p> Updates a new distribution configuration. Distribution configurations define and configure the outputs of your pipeline. </p>
 
 @param request A container for the necessary parameters to execute the UpdateDistributionConfiguration service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSImagebuilderErrorDomain` domain and the following error code: `AWSImagebuilderErrorService`, `AWSImagebuilderErrorClient`, `AWSImagebuilderErrorServiceUnavailable`, `AWSImagebuilderErrorInvalidRequest`, `AWSImagebuilderErrorIdempotentParameterMismatch`, `AWSImagebuilderErrorForbidden`, `AWSImagebuilderErrorCallRateLimitExceeded`, `AWSImagebuilderErrorResourceInUse`, `AWSImagebuilderErrorInvalidParameterCombination`.
 
 @see AWSImagebuilderUpdateDistributionConfigurationRequest
 @see AWSImagebuilderUpdateDistributionConfigurationResponse
 */
- (void)updateDistributionConfiguration:(AWSImagebuilderUpdateDistributionConfigurationRequest *)request completionHandler:(void (^ _Nullable)(AWSImagebuilderUpdateDistributionConfigurationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Updates a new image pipeline. Image pipelines enable you to automate the creation and distribution of images. </p>
 
 @param request A container for the necessary parameters to execute the UpdateImagePipeline service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSImagebuilderUpdateImagePipelineResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSImagebuilderErrorDomain` domain and the following error code: `AWSImagebuilderErrorService`, `AWSImagebuilderErrorClient`, `AWSImagebuilderErrorServiceUnavailable`, `AWSImagebuilderErrorInvalidRequest`, `AWSImagebuilderErrorIdempotentParameterMismatch`, `AWSImagebuilderErrorForbidden`, `AWSImagebuilderErrorCallRateLimitExceeded`, `AWSImagebuilderErrorResourceInUse`.
 
 @see AWSImagebuilderUpdateImagePipelineRequest
 @see AWSImagebuilderUpdateImagePipelineResponse
 */
- (AWSTask<AWSImagebuilderUpdateImagePipelineResponse *> *)updateImagePipeline:(AWSImagebuilderUpdateImagePipelineRequest *)request;

/**
 <p> Updates a new image pipeline. Image pipelines enable you to automate the creation and distribution of images. </p>
 
 @param request A container for the necessary parameters to execute the UpdateImagePipeline service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSImagebuilderErrorDomain` domain and the following error code: `AWSImagebuilderErrorService`, `AWSImagebuilderErrorClient`, `AWSImagebuilderErrorServiceUnavailable`, `AWSImagebuilderErrorInvalidRequest`, `AWSImagebuilderErrorIdempotentParameterMismatch`, `AWSImagebuilderErrorForbidden`, `AWSImagebuilderErrorCallRateLimitExceeded`, `AWSImagebuilderErrorResourceInUse`.
 
 @see AWSImagebuilderUpdateImagePipelineRequest
 @see AWSImagebuilderUpdateImagePipelineResponse
 */
- (void)updateImagePipeline:(AWSImagebuilderUpdateImagePipelineRequest *)request completionHandler:(void (^ _Nullable)(AWSImagebuilderUpdateImagePipelineResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Updates a new infrastructure configuration. An infrastructure configuration defines the environment in which your image will be built and tested. </p>
 
 @param request A container for the necessary parameters to execute the UpdateInfrastructureConfiguration service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSImagebuilderUpdateInfrastructureConfigurationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSImagebuilderErrorDomain` domain and the following error code: `AWSImagebuilderErrorService`, `AWSImagebuilderErrorClient`, `AWSImagebuilderErrorServiceUnavailable`, `AWSImagebuilderErrorInvalidRequest`, `AWSImagebuilderErrorIdempotentParameterMismatch`, `AWSImagebuilderErrorForbidden`, `AWSImagebuilderErrorCallRateLimitExceeded`, `AWSImagebuilderErrorResourceInUse`.
 
 @see AWSImagebuilderUpdateInfrastructureConfigurationRequest
 @see AWSImagebuilderUpdateInfrastructureConfigurationResponse
 */
- (AWSTask<AWSImagebuilderUpdateInfrastructureConfigurationResponse *> *)updateInfrastructureConfiguration:(AWSImagebuilderUpdateInfrastructureConfigurationRequest *)request;

/**
 <p> Updates a new infrastructure configuration. An infrastructure configuration defines the environment in which your image will be built and tested. </p>
 
 @param request A container for the necessary parameters to execute the UpdateInfrastructureConfiguration service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSImagebuilderErrorDomain` domain and the following error code: `AWSImagebuilderErrorService`, `AWSImagebuilderErrorClient`, `AWSImagebuilderErrorServiceUnavailable`, `AWSImagebuilderErrorInvalidRequest`, `AWSImagebuilderErrorIdempotentParameterMismatch`, `AWSImagebuilderErrorForbidden`, `AWSImagebuilderErrorCallRateLimitExceeded`, `AWSImagebuilderErrorResourceInUse`.
 
 @see AWSImagebuilderUpdateInfrastructureConfigurationRequest
 @see AWSImagebuilderUpdateInfrastructureConfigurationResponse
 */
- (void)updateInfrastructureConfiguration:(AWSImagebuilderUpdateInfrastructureConfigurationRequest *)request completionHandler:(void (^ _Nullable)(AWSImagebuilderUpdateInfrastructureConfigurationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
