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
#import "AWSimagebuilderModel.h"
#import "AWSimagebuilderResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSimagebuilder
FOUNDATION_EXPORT NSString *const AWSimagebuilderSDKVersion;

/**
 <p>EC2 Image Builder is a fully managed AWS service that makes it easier to automate the creation, management, and deployment of customized, secure, and up-to-date “golden” server images that are pre-installed and pre-configured with software and settings to meet specific IT standards.</p>
 */
@interface AWSimagebuilder : AWSService

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

     let imagebuilder = AWSimagebuilder.default()

 *Objective-C*

     AWSimagebuilder *imagebuilder = [AWSimagebuilder defaultimagebuilder];

 @return The default service client.
 */
+ (instancetype)defaultimagebuilder;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSimagebuilder.register(with: configuration!, forKey: "USWest2imagebuilder")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSimagebuilder registerimagebuilderWithConfiguration:configuration forKey:@"USWest2imagebuilder"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let imagebuilder = AWSimagebuilder(forKey: "USWest2imagebuilder")

 *Objective-C*

     AWSimagebuilder *imagebuilder = [AWSimagebuilder imagebuilderForKey:@"USWest2imagebuilder"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerimagebuilderWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerimagebuilderWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSimagebuilder.register(with: configuration!, forKey: "USWest2imagebuilder")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSimagebuilder registerimagebuilderWithConfiguration:configuration forKey:@"USWest2imagebuilder"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let imagebuilder = AWSimagebuilder(forKey: "USWest2imagebuilder")

 *Objective-C*

     AWSimagebuilder *imagebuilder = [AWSimagebuilder imagebuilderForKey:@"USWest2imagebuilder"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)imagebuilderForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removeimagebuilderForKey:(NSString *)key;

/**
 <p>CancelImageCreation cancels the creation of Image. This operation can only be used on images in a non-terminal state.</p>
 
 @param request A container for the necessary parameters to execute the CancelImageCreation service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSimagebuilderCancelImageCreationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSimagebuilderErrorDomain` domain and the following error code: `AWSimagebuilderErrorService`, `AWSimagebuilderErrorClient`, `AWSimagebuilderErrorServiceUnavailable`, `AWSimagebuilderErrorInvalidRequest`, `AWSimagebuilderErrorIdempotentParameterMismatch`, `AWSimagebuilderErrorForbidden`, `AWSimagebuilderErrorCallRateLimitExceeded`, `AWSimagebuilderErrorResourceInUse`.
 
 @see AWSimagebuilderCancelImageCreationRequest
 @see AWSimagebuilderCancelImageCreationResponse
 */
- (AWSTask<AWSimagebuilderCancelImageCreationResponse *> *)cancelImageCreation:(AWSimagebuilderCancelImageCreationRequest *)request;

/**
 <p>CancelImageCreation cancels the creation of Image. This operation can only be used on images in a non-terminal state.</p>
 
 @param request A container for the necessary parameters to execute the CancelImageCreation service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSimagebuilderErrorDomain` domain and the following error code: `AWSimagebuilderErrorService`, `AWSimagebuilderErrorClient`, `AWSimagebuilderErrorServiceUnavailable`, `AWSimagebuilderErrorInvalidRequest`, `AWSimagebuilderErrorIdempotentParameterMismatch`, `AWSimagebuilderErrorForbidden`, `AWSimagebuilderErrorCallRateLimitExceeded`, `AWSimagebuilderErrorResourceInUse`.
 
 @see AWSimagebuilderCancelImageCreationRequest
 @see AWSimagebuilderCancelImageCreationResponse
 */
- (void)cancelImageCreation:(AWSimagebuilderCancelImageCreationRequest *)request completionHandler:(void (^ _Nullable)(AWSimagebuilderCancelImageCreationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new component that can be used to build, validate, test, and assess your image.</p>
 
 @param request A container for the necessary parameters to execute the CreateComponent service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSimagebuilderCreateComponentResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSimagebuilderErrorDomain` domain and the following error code: `AWSimagebuilderErrorService`, `AWSimagebuilderErrorClient`, `AWSimagebuilderErrorServiceUnavailable`, `AWSimagebuilderErrorInvalidRequest`, `AWSimagebuilderErrorIdempotentParameterMismatch`, `AWSimagebuilderErrorForbidden`, `AWSimagebuilderErrorCallRateLimitExceeded`, `AWSimagebuilderErrorInvalidVersionNumber`, `AWSimagebuilderErrorResourceInUse`, `AWSimagebuilderErrorInvalidParameterCombination`.
 
 @see AWSimagebuilderCreateComponentRequest
 @see AWSimagebuilderCreateComponentResponse
 */
- (AWSTask<AWSimagebuilderCreateComponentResponse *> *)createComponent:(AWSimagebuilderCreateComponentRequest *)request;

/**
 <p>Creates a new component that can be used to build, validate, test, and assess your image.</p>
 
 @param request A container for the necessary parameters to execute the CreateComponent service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSimagebuilderErrorDomain` domain and the following error code: `AWSimagebuilderErrorService`, `AWSimagebuilderErrorClient`, `AWSimagebuilderErrorServiceUnavailable`, `AWSimagebuilderErrorInvalidRequest`, `AWSimagebuilderErrorIdempotentParameterMismatch`, `AWSimagebuilderErrorForbidden`, `AWSimagebuilderErrorCallRateLimitExceeded`, `AWSimagebuilderErrorInvalidVersionNumber`, `AWSimagebuilderErrorResourceInUse`, `AWSimagebuilderErrorInvalidParameterCombination`.
 
 @see AWSimagebuilderCreateComponentRequest
 @see AWSimagebuilderCreateComponentResponse
 */
- (void)createComponent:(AWSimagebuilderCreateComponentRequest *)request completionHandler:(void (^ _Nullable)(AWSimagebuilderCreateComponentResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new distribution configuration. Distribution configurations define and configure the outputs of your pipeline. </p>
 
 @param request A container for the necessary parameters to execute the CreateDistributionConfiguration service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSimagebuilderCreateDistributionConfigurationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSimagebuilderErrorDomain` domain and the following error code: `AWSimagebuilderErrorService`, `AWSimagebuilderErrorClient`, `AWSimagebuilderErrorServiceUnavailable`, `AWSimagebuilderErrorInvalidRequest`, `AWSimagebuilderErrorIdempotentParameterMismatch`, `AWSimagebuilderErrorForbidden`, `AWSimagebuilderErrorCallRateLimitExceeded`, `AWSimagebuilderErrorResourceInUse`, `AWSimagebuilderErrorResourceAlreadyExists`, `AWSimagebuilderErrorInvalidParameterCombination`.
 
 @see AWSimagebuilderCreateDistributionConfigurationRequest
 @see AWSimagebuilderCreateDistributionConfigurationResponse
 */
- (AWSTask<AWSimagebuilderCreateDistributionConfigurationResponse *> *)createDistributionConfiguration:(AWSimagebuilderCreateDistributionConfigurationRequest *)request;

/**
 <p>Creates a new distribution configuration. Distribution configurations define and configure the outputs of your pipeline. </p>
 
 @param request A container for the necessary parameters to execute the CreateDistributionConfiguration service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSimagebuilderErrorDomain` domain and the following error code: `AWSimagebuilderErrorService`, `AWSimagebuilderErrorClient`, `AWSimagebuilderErrorServiceUnavailable`, `AWSimagebuilderErrorInvalidRequest`, `AWSimagebuilderErrorIdempotentParameterMismatch`, `AWSimagebuilderErrorForbidden`, `AWSimagebuilderErrorCallRateLimitExceeded`, `AWSimagebuilderErrorResourceInUse`, `AWSimagebuilderErrorResourceAlreadyExists`, `AWSimagebuilderErrorInvalidParameterCombination`.
 
 @see AWSimagebuilderCreateDistributionConfigurationRequest
 @see AWSimagebuilderCreateDistributionConfigurationResponse
 */
- (void)createDistributionConfiguration:(AWSimagebuilderCreateDistributionConfigurationRequest *)request completionHandler:(void (^ _Nullable)(AWSimagebuilderCreateDistributionConfigurationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Creates a new image. This request will create a new image along with all of the configured output resources defined in the distribution configuration. </p>
 
 @param request A container for the necessary parameters to execute the CreateImage service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSimagebuilderCreateImageResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSimagebuilderErrorDomain` domain and the following error code: `AWSimagebuilderErrorService`, `AWSimagebuilderErrorClient`, `AWSimagebuilderErrorServiceUnavailable`, `AWSimagebuilderErrorInvalidRequest`, `AWSimagebuilderErrorIdempotentParameterMismatch`, `AWSimagebuilderErrorForbidden`, `AWSimagebuilderErrorCallRateLimitExceeded`, `AWSimagebuilderErrorResourceInUse`.
 
 @see AWSimagebuilderCreateImageRequest
 @see AWSimagebuilderCreateImageResponse
 */
- (AWSTask<AWSimagebuilderCreateImageResponse *> *)createImage:(AWSimagebuilderCreateImageRequest *)request;

/**
 <p> Creates a new image. This request will create a new image along with all of the configured output resources defined in the distribution configuration. </p>
 
 @param request A container for the necessary parameters to execute the CreateImage service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSimagebuilderErrorDomain` domain and the following error code: `AWSimagebuilderErrorService`, `AWSimagebuilderErrorClient`, `AWSimagebuilderErrorServiceUnavailable`, `AWSimagebuilderErrorInvalidRequest`, `AWSimagebuilderErrorIdempotentParameterMismatch`, `AWSimagebuilderErrorForbidden`, `AWSimagebuilderErrorCallRateLimitExceeded`, `AWSimagebuilderErrorResourceInUse`.
 
 @see AWSimagebuilderCreateImageRequest
 @see AWSimagebuilderCreateImageResponse
 */
- (void)createImage:(AWSimagebuilderCreateImageRequest *)request completionHandler:(void (^ _Nullable)(AWSimagebuilderCreateImageResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Creates a new image pipeline. Image pipelines enable you to automate the creation and distribution of images. </p>
 
 @param request A container for the necessary parameters to execute the CreateImagePipeline service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSimagebuilderCreateImagePipelineResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSimagebuilderErrorDomain` domain and the following error code: `AWSimagebuilderErrorService`, `AWSimagebuilderErrorClient`, `AWSimagebuilderErrorServiceUnavailable`, `AWSimagebuilderErrorInvalidRequest`, `AWSimagebuilderErrorIdempotentParameterMismatch`, `AWSimagebuilderErrorForbidden`, `AWSimagebuilderErrorCallRateLimitExceeded`, `AWSimagebuilderErrorResourceInUse`, `AWSimagebuilderErrorResourceAlreadyExists`.
 
 @see AWSimagebuilderCreateImagePipelineRequest
 @see AWSimagebuilderCreateImagePipelineResponse
 */
- (AWSTask<AWSimagebuilderCreateImagePipelineResponse *> *)createImagePipeline:(AWSimagebuilderCreateImagePipelineRequest *)request;

/**
 <p> Creates a new image pipeline. Image pipelines enable you to automate the creation and distribution of images. </p>
 
 @param request A container for the necessary parameters to execute the CreateImagePipeline service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSimagebuilderErrorDomain` domain and the following error code: `AWSimagebuilderErrorService`, `AWSimagebuilderErrorClient`, `AWSimagebuilderErrorServiceUnavailable`, `AWSimagebuilderErrorInvalidRequest`, `AWSimagebuilderErrorIdempotentParameterMismatch`, `AWSimagebuilderErrorForbidden`, `AWSimagebuilderErrorCallRateLimitExceeded`, `AWSimagebuilderErrorResourceInUse`, `AWSimagebuilderErrorResourceAlreadyExists`.
 
 @see AWSimagebuilderCreateImagePipelineRequest
 @see AWSimagebuilderCreateImagePipelineResponse
 */
- (void)createImagePipeline:(AWSimagebuilderCreateImagePipelineRequest *)request completionHandler:(void (^ _Nullable)(AWSimagebuilderCreateImagePipelineResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Creates a new image recipe. Image recipes define how images are configured, tested, and assessed. </p>
 
 @param request A container for the necessary parameters to execute the CreateImageRecipe service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSimagebuilderCreateImageRecipeResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSimagebuilderErrorDomain` domain and the following error code: `AWSimagebuilderErrorService`, `AWSimagebuilderErrorClient`, `AWSimagebuilderErrorServiceUnavailable`, `AWSimagebuilderErrorInvalidRequest`, `AWSimagebuilderErrorIdempotentParameterMismatch`, `AWSimagebuilderErrorForbidden`, `AWSimagebuilderErrorCallRateLimitExceeded`, `AWSimagebuilderErrorInvalidVersionNumber`, `AWSimagebuilderErrorResourceInUse`, `AWSimagebuilderErrorResourceAlreadyExists`.
 
 @see AWSimagebuilderCreateImageRecipeRequest
 @see AWSimagebuilderCreateImageRecipeResponse
 */
- (AWSTask<AWSimagebuilderCreateImageRecipeResponse *> *)createImageRecipe:(AWSimagebuilderCreateImageRecipeRequest *)request;

/**
 <p> Creates a new image recipe. Image recipes define how images are configured, tested, and assessed. </p>
 
 @param request A container for the necessary parameters to execute the CreateImageRecipe service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSimagebuilderErrorDomain` domain and the following error code: `AWSimagebuilderErrorService`, `AWSimagebuilderErrorClient`, `AWSimagebuilderErrorServiceUnavailable`, `AWSimagebuilderErrorInvalidRequest`, `AWSimagebuilderErrorIdempotentParameterMismatch`, `AWSimagebuilderErrorForbidden`, `AWSimagebuilderErrorCallRateLimitExceeded`, `AWSimagebuilderErrorInvalidVersionNumber`, `AWSimagebuilderErrorResourceInUse`, `AWSimagebuilderErrorResourceAlreadyExists`.
 
 @see AWSimagebuilderCreateImageRecipeRequest
 @see AWSimagebuilderCreateImageRecipeResponse
 */
- (void)createImageRecipe:(AWSimagebuilderCreateImageRecipeRequest *)request completionHandler:(void (^ _Nullable)(AWSimagebuilderCreateImageRecipeResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Creates a new infrastructure configuration. An infrastructure configuration defines the environment in which your image will be built and tested. </p>
 
 @param request A container for the necessary parameters to execute the CreateInfrastructureConfiguration service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSimagebuilderCreateInfrastructureConfigurationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSimagebuilderErrorDomain` domain and the following error code: `AWSimagebuilderErrorService`, `AWSimagebuilderErrorClient`, `AWSimagebuilderErrorServiceUnavailable`, `AWSimagebuilderErrorInvalidRequest`, `AWSimagebuilderErrorIdempotentParameterMismatch`, `AWSimagebuilderErrorForbidden`, `AWSimagebuilderErrorCallRateLimitExceeded`, `AWSimagebuilderErrorResourceInUse`, `AWSimagebuilderErrorResourceAlreadyExists`.
 
 @see AWSimagebuilderCreateInfrastructureConfigurationRequest
 @see AWSimagebuilderCreateInfrastructureConfigurationResponse
 */
- (AWSTask<AWSimagebuilderCreateInfrastructureConfigurationResponse *> *)createInfrastructureConfiguration:(AWSimagebuilderCreateInfrastructureConfigurationRequest *)request;

/**
 <p> Creates a new infrastructure configuration. An infrastructure configuration defines the environment in which your image will be built and tested. </p>
 
 @param request A container for the necessary parameters to execute the CreateInfrastructureConfiguration service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSimagebuilderErrorDomain` domain and the following error code: `AWSimagebuilderErrorService`, `AWSimagebuilderErrorClient`, `AWSimagebuilderErrorServiceUnavailable`, `AWSimagebuilderErrorInvalidRequest`, `AWSimagebuilderErrorIdempotentParameterMismatch`, `AWSimagebuilderErrorForbidden`, `AWSimagebuilderErrorCallRateLimitExceeded`, `AWSimagebuilderErrorResourceInUse`, `AWSimagebuilderErrorResourceAlreadyExists`.
 
 @see AWSimagebuilderCreateInfrastructureConfigurationRequest
 @see AWSimagebuilderCreateInfrastructureConfigurationResponse
 */
- (void)createInfrastructureConfiguration:(AWSimagebuilderCreateInfrastructureConfigurationRequest *)request completionHandler:(void (^ _Nullable)(AWSimagebuilderCreateInfrastructureConfigurationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Deletes a component build version. </p>
 
 @param request A container for the necessary parameters to execute the DeleteComponent service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSimagebuilderDeleteComponentResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSimagebuilderErrorDomain` domain and the following error code: `AWSimagebuilderErrorService`, `AWSimagebuilderErrorClient`, `AWSimagebuilderErrorServiceUnavailable`, `AWSimagebuilderErrorInvalidRequest`, `AWSimagebuilderErrorForbidden`, `AWSimagebuilderErrorCallRateLimitExceeded`, `AWSimagebuilderErrorResourceDependency`.
 
 @see AWSimagebuilderDeleteComponentRequest
 @see AWSimagebuilderDeleteComponentResponse
 */
- (AWSTask<AWSimagebuilderDeleteComponentResponse *> *)deleteComponent:(AWSimagebuilderDeleteComponentRequest *)request;

/**
 <p> Deletes a component build version. </p>
 
 @param request A container for the necessary parameters to execute the DeleteComponent service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSimagebuilderErrorDomain` domain and the following error code: `AWSimagebuilderErrorService`, `AWSimagebuilderErrorClient`, `AWSimagebuilderErrorServiceUnavailable`, `AWSimagebuilderErrorInvalidRequest`, `AWSimagebuilderErrorForbidden`, `AWSimagebuilderErrorCallRateLimitExceeded`, `AWSimagebuilderErrorResourceDependency`.
 
 @see AWSimagebuilderDeleteComponentRequest
 @see AWSimagebuilderDeleteComponentResponse
 */
- (void)deleteComponent:(AWSimagebuilderDeleteComponentRequest *)request completionHandler:(void (^ _Nullable)(AWSimagebuilderDeleteComponentResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Deletes a distribution configuration. </p>
 
 @param request A container for the necessary parameters to execute the DeleteDistributionConfiguration service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSimagebuilderDeleteDistributionConfigurationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSimagebuilderErrorDomain` domain and the following error code: `AWSimagebuilderErrorService`, `AWSimagebuilderErrorClient`, `AWSimagebuilderErrorInvalidRequest`, `AWSimagebuilderErrorServiceUnavailable`, `AWSimagebuilderErrorForbidden`, `AWSimagebuilderErrorCallRateLimitExceeded`, `AWSimagebuilderErrorResourceDependency`.
 
 @see AWSimagebuilderDeleteDistributionConfigurationRequest
 @see AWSimagebuilderDeleteDistributionConfigurationResponse
 */
- (AWSTask<AWSimagebuilderDeleteDistributionConfigurationResponse *> *)deleteDistributionConfiguration:(AWSimagebuilderDeleteDistributionConfigurationRequest *)request;

/**
 <p> Deletes a distribution configuration. </p>
 
 @param request A container for the necessary parameters to execute the DeleteDistributionConfiguration service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSimagebuilderErrorDomain` domain and the following error code: `AWSimagebuilderErrorService`, `AWSimagebuilderErrorClient`, `AWSimagebuilderErrorInvalidRequest`, `AWSimagebuilderErrorServiceUnavailable`, `AWSimagebuilderErrorForbidden`, `AWSimagebuilderErrorCallRateLimitExceeded`, `AWSimagebuilderErrorResourceDependency`.
 
 @see AWSimagebuilderDeleteDistributionConfigurationRequest
 @see AWSimagebuilderDeleteDistributionConfigurationResponse
 */
- (void)deleteDistributionConfiguration:(AWSimagebuilderDeleteDistributionConfigurationRequest *)request completionHandler:(void (^ _Nullable)(AWSimagebuilderDeleteDistributionConfigurationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Deletes an image. </p>
 
 @param request A container for the necessary parameters to execute the DeleteImage service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSimagebuilderDeleteImageResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSimagebuilderErrorDomain` domain and the following error code: `AWSimagebuilderErrorService`, `AWSimagebuilderErrorClient`, `AWSimagebuilderErrorInvalidRequest`, `AWSimagebuilderErrorServiceUnavailable`, `AWSimagebuilderErrorForbidden`, `AWSimagebuilderErrorCallRateLimitExceeded`, `AWSimagebuilderErrorResourceDependency`.
 
 @see AWSimagebuilderDeleteImageRequest
 @see AWSimagebuilderDeleteImageResponse
 */
- (AWSTask<AWSimagebuilderDeleteImageResponse *> *)deleteImage:(AWSimagebuilderDeleteImageRequest *)request;

/**
 <p> Deletes an image. </p>
 
 @param request A container for the necessary parameters to execute the DeleteImage service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSimagebuilderErrorDomain` domain and the following error code: `AWSimagebuilderErrorService`, `AWSimagebuilderErrorClient`, `AWSimagebuilderErrorInvalidRequest`, `AWSimagebuilderErrorServiceUnavailable`, `AWSimagebuilderErrorForbidden`, `AWSimagebuilderErrorCallRateLimitExceeded`, `AWSimagebuilderErrorResourceDependency`.
 
 @see AWSimagebuilderDeleteImageRequest
 @see AWSimagebuilderDeleteImageResponse
 */
- (void)deleteImage:(AWSimagebuilderDeleteImageRequest *)request completionHandler:(void (^ _Nullable)(AWSimagebuilderDeleteImageResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Deletes an image pipeline. </p>
 
 @param request A container for the necessary parameters to execute the DeleteImagePipeline service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSimagebuilderDeleteImagePipelineResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSimagebuilderErrorDomain` domain and the following error code: `AWSimagebuilderErrorService`, `AWSimagebuilderErrorClient`, `AWSimagebuilderErrorServiceUnavailable`, `AWSimagebuilderErrorInvalidRequest`, `AWSimagebuilderErrorForbidden`, `AWSimagebuilderErrorCallRateLimitExceeded`, `AWSimagebuilderErrorResourceDependency`.
 
 @see AWSimagebuilderDeleteImagePipelineRequest
 @see AWSimagebuilderDeleteImagePipelineResponse
 */
- (AWSTask<AWSimagebuilderDeleteImagePipelineResponse *> *)deleteImagePipeline:(AWSimagebuilderDeleteImagePipelineRequest *)request;

/**
 <p> Deletes an image pipeline. </p>
 
 @param request A container for the necessary parameters to execute the DeleteImagePipeline service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSimagebuilderErrorDomain` domain and the following error code: `AWSimagebuilderErrorService`, `AWSimagebuilderErrorClient`, `AWSimagebuilderErrorServiceUnavailable`, `AWSimagebuilderErrorInvalidRequest`, `AWSimagebuilderErrorForbidden`, `AWSimagebuilderErrorCallRateLimitExceeded`, `AWSimagebuilderErrorResourceDependency`.
 
 @see AWSimagebuilderDeleteImagePipelineRequest
 @see AWSimagebuilderDeleteImagePipelineResponse
 */
- (void)deleteImagePipeline:(AWSimagebuilderDeleteImagePipelineRequest *)request completionHandler:(void (^ _Nullable)(AWSimagebuilderDeleteImagePipelineResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Deletes an image recipe. </p>
 
 @param request A container for the necessary parameters to execute the DeleteImageRecipe service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSimagebuilderDeleteImageRecipeResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSimagebuilderErrorDomain` domain and the following error code: `AWSimagebuilderErrorService`, `AWSimagebuilderErrorClient`, `AWSimagebuilderErrorServiceUnavailable`, `AWSimagebuilderErrorInvalidRequest`, `AWSimagebuilderErrorForbidden`, `AWSimagebuilderErrorCallRateLimitExceeded`, `AWSimagebuilderErrorResourceDependency`.
 
 @see AWSimagebuilderDeleteImageRecipeRequest
 @see AWSimagebuilderDeleteImageRecipeResponse
 */
- (AWSTask<AWSimagebuilderDeleteImageRecipeResponse *> *)deleteImageRecipe:(AWSimagebuilderDeleteImageRecipeRequest *)request;

/**
 <p> Deletes an image recipe. </p>
 
 @param request A container for the necessary parameters to execute the DeleteImageRecipe service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSimagebuilderErrorDomain` domain and the following error code: `AWSimagebuilderErrorService`, `AWSimagebuilderErrorClient`, `AWSimagebuilderErrorServiceUnavailable`, `AWSimagebuilderErrorInvalidRequest`, `AWSimagebuilderErrorForbidden`, `AWSimagebuilderErrorCallRateLimitExceeded`, `AWSimagebuilderErrorResourceDependency`.
 
 @see AWSimagebuilderDeleteImageRecipeRequest
 @see AWSimagebuilderDeleteImageRecipeResponse
 */
- (void)deleteImageRecipe:(AWSimagebuilderDeleteImageRecipeRequest *)request completionHandler:(void (^ _Nullable)(AWSimagebuilderDeleteImageRecipeResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Deletes an infrastructure configuration. </p>
 
 @param request A container for the necessary parameters to execute the DeleteInfrastructureConfiguration service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSimagebuilderDeleteInfrastructureConfigurationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSimagebuilderErrorDomain` domain and the following error code: `AWSimagebuilderErrorService`, `AWSimagebuilderErrorClient`, `AWSimagebuilderErrorServiceUnavailable`, `AWSimagebuilderErrorInvalidRequest`, `AWSimagebuilderErrorForbidden`, `AWSimagebuilderErrorCallRateLimitExceeded`, `AWSimagebuilderErrorResourceDependency`.
 
 @see AWSimagebuilderDeleteInfrastructureConfigurationRequest
 @see AWSimagebuilderDeleteInfrastructureConfigurationResponse
 */
- (AWSTask<AWSimagebuilderDeleteInfrastructureConfigurationResponse *> *)deleteInfrastructureConfiguration:(AWSimagebuilderDeleteInfrastructureConfigurationRequest *)request;

/**
 <p> Deletes an infrastructure configuration. </p>
 
 @param request A container for the necessary parameters to execute the DeleteInfrastructureConfiguration service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSimagebuilderErrorDomain` domain and the following error code: `AWSimagebuilderErrorService`, `AWSimagebuilderErrorClient`, `AWSimagebuilderErrorServiceUnavailable`, `AWSimagebuilderErrorInvalidRequest`, `AWSimagebuilderErrorForbidden`, `AWSimagebuilderErrorCallRateLimitExceeded`, `AWSimagebuilderErrorResourceDependency`.
 
 @see AWSimagebuilderDeleteInfrastructureConfigurationRequest
 @see AWSimagebuilderDeleteInfrastructureConfigurationResponse
 */
- (void)deleteInfrastructureConfiguration:(AWSimagebuilderDeleteInfrastructureConfigurationRequest *)request completionHandler:(void (^ _Nullable)(AWSimagebuilderDeleteInfrastructureConfigurationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Gets a component object. </p>
 
 @param request A container for the necessary parameters to execute the GetComponent service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSimagebuilderGetComponentResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSimagebuilderErrorDomain` domain and the following error code: `AWSimagebuilderErrorService`, `AWSimagebuilderErrorClient`, `AWSimagebuilderErrorServiceUnavailable`, `AWSimagebuilderErrorInvalidRequest`, `AWSimagebuilderErrorForbidden`, `AWSimagebuilderErrorCallRateLimitExceeded`.
 
 @see AWSimagebuilderGetComponentRequest
 @see AWSimagebuilderGetComponentResponse
 */
- (AWSTask<AWSimagebuilderGetComponentResponse *> *)getComponent:(AWSimagebuilderGetComponentRequest *)request;

/**
 <p> Gets a component object. </p>
 
 @param request A container for the necessary parameters to execute the GetComponent service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSimagebuilderErrorDomain` domain and the following error code: `AWSimagebuilderErrorService`, `AWSimagebuilderErrorClient`, `AWSimagebuilderErrorServiceUnavailable`, `AWSimagebuilderErrorInvalidRequest`, `AWSimagebuilderErrorForbidden`, `AWSimagebuilderErrorCallRateLimitExceeded`.
 
 @see AWSimagebuilderGetComponentRequest
 @see AWSimagebuilderGetComponentResponse
 */
- (void)getComponent:(AWSimagebuilderGetComponentRequest *)request completionHandler:(void (^ _Nullable)(AWSimagebuilderGetComponentResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Gets a component policy. </p>
 
 @param request A container for the necessary parameters to execute the GetComponentPolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSimagebuilderGetComponentPolicyResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSimagebuilderErrorDomain` domain and the following error code: `AWSimagebuilderErrorService`, `AWSimagebuilderErrorServiceUnavailable`, `AWSimagebuilderErrorResourceNotFound`, `AWSimagebuilderErrorInvalidRequest`, `AWSimagebuilderErrorForbidden`, `AWSimagebuilderErrorCallRateLimitExceeded`.
 
 @see AWSimagebuilderGetComponentPolicyRequest
 @see AWSimagebuilderGetComponentPolicyResponse
 */
- (AWSTask<AWSimagebuilderGetComponentPolicyResponse *> *)getComponentPolicy:(AWSimagebuilderGetComponentPolicyRequest *)request;

/**
 <p> Gets a component policy. </p>
 
 @param request A container for the necessary parameters to execute the GetComponentPolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSimagebuilderErrorDomain` domain and the following error code: `AWSimagebuilderErrorService`, `AWSimagebuilderErrorServiceUnavailable`, `AWSimagebuilderErrorResourceNotFound`, `AWSimagebuilderErrorInvalidRequest`, `AWSimagebuilderErrorForbidden`, `AWSimagebuilderErrorCallRateLimitExceeded`.
 
 @see AWSimagebuilderGetComponentPolicyRequest
 @see AWSimagebuilderGetComponentPolicyResponse
 */
- (void)getComponentPolicy:(AWSimagebuilderGetComponentPolicyRequest *)request completionHandler:(void (^ _Nullable)(AWSimagebuilderGetComponentPolicyResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Gets a distribution configuration. </p>
 
 @param request A container for the necessary parameters to execute the GetDistributionConfiguration service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSimagebuilderGetDistributionConfigurationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSimagebuilderErrorDomain` domain and the following error code: `AWSimagebuilderErrorService`, `AWSimagebuilderErrorClient`, `AWSimagebuilderErrorServiceUnavailable`, `AWSimagebuilderErrorInvalidRequest`, `AWSimagebuilderErrorForbidden`, `AWSimagebuilderErrorCallRateLimitExceeded`.
 
 @see AWSimagebuilderGetDistributionConfigurationRequest
 @see AWSimagebuilderGetDistributionConfigurationResponse
 */
- (AWSTask<AWSimagebuilderGetDistributionConfigurationResponse *> *)getDistributionConfiguration:(AWSimagebuilderGetDistributionConfigurationRequest *)request;

/**
 <p> Gets a distribution configuration. </p>
 
 @param request A container for the necessary parameters to execute the GetDistributionConfiguration service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSimagebuilderErrorDomain` domain and the following error code: `AWSimagebuilderErrorService`, `AWSimagebuilderErrorClient`, `AWSimagebuilderErrorServiceUnavailable`, `AWSimagebuilderErrorInvalidRequest`, `AWSimagebuilderErrorForbidden`, `AWSimagebuilderErrorCallRateLimitExceeded`.
 
 @see AWSimagebuilderGetDistributionConfigurationRequest
 @see AWSimagebuilderGetDistributionConfigurationResponse
 */
- (void)getDistributionConfiguration:(AWSimagebuilderGetDistributionConfigurationRequest *)request completionHandler:(void (^ _Nullable)(AWSimagebuilderGetDistributionConfigurationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Gets an image. </p>
 
 @param request A container for the necessary parameters to execute the GetImage service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSimagebuilderGetImageResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSimagebuilderErrorDomain` domain and the following error code: `AWSimagebuilderErrorService`, `AWSimagebuilderErrorClient`, `AWSimagebuilderErrorServiceUnavailable`, `AWSimagebuilderErrorInvalidRequest`, `AWSimagebuilderErrorForbidden`, `AWSimagebuilderErrorCallRateLimitExceeded`.
 
 @see AWSimagebuilderGetImageRequest
 @see AWSimagebuilderGetImageResponse
 */
- (AWSTask<AWSimagebuilderGetImageResponse *> *)getImage:(AWSimagebuilderGetImageRequest *)request;

/**
 <p> Gets an image. </p>
 
 @param request A container for the necessary parameters to execute the GetImage service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSimagebuilderErrorDomain` domain and the following error code: `AWSimagebuilderErrorService`, `AWSimagebuilderErrorClient`, `AWSimagebuilderErrorServiceUnavailable`, `AWSimagebuilderErrorInvalidRequest`, `AWSimagebuilderErrorForbidden`, `AWSimagebuilderErrorCallRateLimitExceeded`.
 
 @see AWSimagebuilderGetImageRequest
 @see AWSimagebuilderGetImageResponse
 */
- (void)getImage:(AWSimagebuilderGetImageRequest *)request completionHandler:(void (^ _Nullable)(AWSimagebuilderGetImageResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Gets an image pipeline. </p>
 
 @param request A container for the necessary parameters to execute the GetImagePipeline service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSimagebuilderGetImagePipelineResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSimagebuilderErrorDomain` domain and the following error code: `AWSimagebuilderErrorService`, `AWSimagebuilderErrorClient`, `AWSimagebuilderErrorServiceUnavailable`, `AWSimagebuilderErrorInvalidRequest`, `AWSimagebuilderErrorForbidden`, `AWSimagebuilderErrorCallRateLimitExceeded`.
 
 @see AWSimagebuilderGetImagePipelineRequest
 @see AWSimagebuilderGetImagePipelineResponse
 */
- (AWSTask<AWSimagebuilderGetImagePipelineResponse *> *)getImagePipeline:(AWSimagebuilderGetImagePipelineRequest *)request;

/**
 <p> Gets an image pipeline. </p>
 
 @param request A container for the necessary parameters to execute the GetImagePipeline service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSimagebuilderErrorDomain` domain and the following error code: `AWSimagebuilderErrorService`, `AWSimagebuilderErrorClient`, `AWSimagebuilderErrorServiceUnavailable`, `AWSimagebuilderErrorInvalidRequest`, `AWSimagebuilderErrorForbidden`, `AWSimagebuilderErrorCallRateLimitExceeded`.
 
 @see AWSimagebuilderGetImagePipelineRequest
 @see AWSimagebuilderGetImagePipelineResponse
 */
- (void)getImagePipeline:(AWSimagebuilderGetImagePipelineRequest *)request completionHandler:(void (^ _Nullable)(AWSimagebuilderGetImagePipelineResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Gets an image policy. </p>
 
 @param request A container for the necessary parameters to execute the GetImagePolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSimagebuilderGetImagePolicyResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSimagebuilderErrorDomain` domain and the following error code: `AWSimagebuilderErrorService`, `AWSimagebuilderErrorServiceUnavailable`, `AWSimagebuilderErrorResourceNotFound`, `AWSimagebuilderErrorInvalidRequest`, `AWSimagebuilderErrorForbidden`, `AWSimagebuilderErrorCallRateLimitExceeded`.
 
 @see AWSimagebuilderGetImagePolicyRequest
 @see AWSimagebuilderGetImagePolicyResponse
 */
- (AWSTask<AWSimagebuilderGetImagePolicyResponse *> *)getImagePolicy:(AWSimagebuilderGetImagePolicyRequest *)request;

/**
 <p> Gets an image policy. </p>
 
 @param request A container for the necessary parameters to execute the GetImagePolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSimagebuilderErrorDomain` domain and the following error code: `AWSimagebuilderErrorService`, `AWSimagebuilderErrorServiceUnavailable`, `AWSimagebuilderErrorResourceNotFound`, `AWSimagebuilderErrorInvalidRequest`, `AWSimagebuilderErrorForbidden`, `AWSimagebuilderErrorCallRateLimitExceeded`.
 
 @see AWSimagebuilderGetImagePolicyRequest
 @see AWSimagebuilderGetImagePolicyResponse
 */
- (void)getImagePolicy:(AWSimagebuilderGetImagePolicyRequest *)request completionHandler:(void (^ _Nullable)(AWSimagebuilderGetImagePolicyResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Gets an image recipe. </p>
 
 @param request A container for the necessary parameters to execute the GetImageRecipe service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSimagebuilderGetImageRecipeResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSimagebuilderErrorDomain` domain and the following error code: `AWSimagebuilderErrorService`, `AWSimagebuilderErrorClient`, `AWSimagebuilderErrorServiceUnavailable`, `AWSimagebuilderErrorInvalidRequest`, `AWSimagebuilderErrorForbidden`, `AWSimagebuilderErrorCallRateLimitExceeded`.
 
 @see AWSimagebuilderGetImageRecipeRequest
 @see AWSimagebuilderGetImageRecipeResponse
 */
- (AWSTask<AWSimagebuilderGetImageRecipeResponse *> *)getImageRecipe:(AWSimagebuilderGetImageRecipeRequest *)request;

/**
 <p> Gets an image recipe. </p>
 
 @param request A container for the necessary parameters to execute the GetImageRecipe service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSimagebuilderErrorDomain` domain and the following error code: `AWSimagebuilderErrorService`, `AWSimagebuilderErrorClient`, `AWSimagebuilderErrorServiceUnavailable`, `AWSimagebuilderErrorInvalidRequest`, `AWSimagebuilderErrorForbidden`, `AWSimagebuilderErrorCallRateLimitExceeded`.
 
 @see AWSimagebuilderGetImageRecipeRequest
 @see AWSimagebuilderGetImageRecipeResponse
 */
- (void)getImageRecipe:(AWSimagebuilderGetImageRecipeRequest *)request completionHandler:(void (^ _Nullable)(AWSimagebuilderGetImageRecipeResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Gets an image recipe policy. </p>
 
 @param request A container for the necessary parameters to execute the GetImageRecipePolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSimagebuilderGetImageRecipePolicyResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSimagebuilderErrorDomain` domain and the following error code: `AWSimagebuilderErrorService`, `AWSimagebuilderErrorServiceUnavailable`, `AWSimagebuilderErrorInvalidRequest`, `AWSimagebuilderErrorResourceNotFound`, `AWSimagebuilderErrorForbidden`, `AWSimagebuilderErrorCallRateLimitExceeded`.
 
 @see AWSimagebuilderGetImageRecipePolicyRequest
 @see AWSimagebuilderGetImageRecipePolicyResponse
 */
- (AWSTask<AWSimagebuilderGetImageRecipePolicyResponse *> *)getImageRecipePolicy:(AWSimagebuilderGetImageRecipePolicyRequest *)request;

/**
 <p> Gets an image recipe policy. </p>
 
 @param request A container for the necessary parameters to execute the GetImageRecipePolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSimagebuilderErrorDomain` domain and the following error code: `AWSimagebuilderErrorService`, `AWSimagebuilderErrorServiceUnavailable`, `AWSimagebuilderErrorInvalidRequest`, `AWSimagebuilderErrorResourceNotFound`, `AWSimagebuilderErrorForbidden`, `AWSimagebuilderErrorCallRateLimitExceeded`.
 
 @see AWSimagebuilderGetImageRecipePolicyRequest
 @see AWSimagebuilderGetImageRecipePolicyResponse
 */
- (void)getImageRecipePolicy:(AWSimagebuilderGetImageRecipePolicyRequest *)request completionHandler:(void (^ _Nullable)(AWSimagebuilderGetImageRecipePolicyResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Gets an infrastructure configuration. </p>
 
 @param request A container for the necessary parameters to execute the GetInfrastructureConfiguration service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSimagebuilderGetInfrastructureConfigurationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSimagebuilderErrorDomain` domain and the following error code: `AWSimagebuilderErrorService`, `AWSimagebuilderErrorClient`, `AWSimagebuilderErrorServiceUnavailable`, `AWSimagebuilderErrorInvalidRequest`, `AWSimagebuilderErrorForbidden`, `AWSimagebuilderErrorCallRateLimitExceeded`.
 
 @see AWSimagebuilderGetInfrastructureConfigurationRequest
 @see AWSimagebuilderGetInfrastructureConfigurationResponse
 */
- (AWSTask<AWSimagebuilderGetInfrastructureConfigurationResponse *> *)getInfrastructureConfiguration:(AWSimagebuilderGetInfrastructureConfigurationRequest *)request;

/**
 <p> Gets an infrastructure configuration. </p>
 
 @param request A container for the necessary parameters to execute the GetInfrastructureConfiguration service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSimagebuilderErrorDomain` domain and the following error code: `AWSimagebuilderErrorService`, `AWSimagebuilderErrorClient`, `AWSimagebuilderErrorServiceUnavailable`, `AWSimagebuilderErrorInvalidRequest`, `AWSimagebuilderErrorForbidden`, `AWSimagebuilderErrorCallRateLimitExceeded`.
 
 @see AWSimagebuilderGetInfrastructureConfigurationRequest
 @see AWSimagebuilderGetInfrastructureConfigurationResponse
 */
- (void)getInfrastructureConfiguration:(AWSimagebuilderGetInfrastructureConfigurationRequest *)request completionHandler:(void (^ _Nullable)(AWSimagebuilderGetInfrastructureConfigurationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Imports a component and transforms its data into a component document. </p>
 
 @param request A container for the necessary parameters to execute the ImportComponent service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSimagebuilderImportComponentResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSimagebuilderErrorDomain` domain and the following error code: `AWSimagebuilderErrorService`, `AWSimagebuilderErrorClient`, `AWSimagebuilderErrorServiceUnavailable`, `AWSimagebuilderErrorInvalidRequest`, `AWSimagebuilderErrorIdempotentParameterMismatch`, `AWSimagebuilderErrorForbidden`, `AWSimagebuilderErrorCallRateLimitExceeded`, `AWSimagebuilderErrorInvalidVersionNumber`, `AWSimagebuilderErrorResourceInUse`, `AWSimagebuilderErrorInvalidParameterCombination`.
 
 @see AWSimagebuilderImportComponentRequest
 @see AWSimagebuilderImportComponentResponse
 */
- (AWSTask<AWSimagebuilderImportComponentResponse *> *)importComponent:(AWSimagebuilderImportComponentRequest *)request;

/**
 <p>Imports a component and transforms its data into a component document. </p>
 
 @param request A container for the necessary parameters to execute the ImportComponent service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSimagebuilderErrorDomain` domain and the following error code: `AWSimagebuilderErrorService`, `AWSimagebuilderErrorClient`, `AWSimagebuilderErrorServiceUnavailable`, `AWSimagebuilderErrorInvalidRequest`, `AWSimagebuilderErrorIdempotentParameterMismatch`, `AWSimagebuilderErrorForbidden`, `AWSimagebuilderErrorCallRateLimitExceeded`, `AWSimagebuilderErrorInvalidVersionNumber`, `AWSimagebuilderErrorResourceInUse`, `AWSimagebuilderErrorInvalidParameterCombination`.
 
 @see AWSimagebuilderImportComponentRequest
 @see AWSimagebuilderImportComponentResponse
 */
- (void)importComponent:(AWSimagebuilderImportComponentRequest *)request completionHandler:(void (^ _Nullable)(AWSimagebuilderImportComponentResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Returns the list of component build versions for the specified semantic version. </p>
 
 @param request A container for the necessary parameters to execute the ListComponentBuildVersions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSimagebuilderListComponentBuildVersionsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSimagebuilderErrorDomain` domain and the following error code: `AWSimagebuilderErrorService`, `AWSimagebuilderErrorClient`, `AWSimagebuilderErrorServiceUnavailable`, `AWSimagebuilderErrorInvalidRequest`, `AWSimagebuilderErrorInvalidPaginationToken`, `AWSimagebuilderErrorForbidden`, `AWSimagebuilderErrorCallRateLimitExceeded`.
 
 @see AWSimagebuilderListComponentBuildVersionsRequest
 @see AWSimagebuilderListComponentBuildVersionsResponse
 */
- (AWSTask<AWSimagebuilderListComponentBuildVersionsResponse *> *)listComponentBuildVersions:(AWSimagebuilderListComponentBuildVersionsRequest *)request;

/**
 <p> Returns the list of component build versions for the specified semantic version. </p>
 
 @param request A container for the necessary parameters to execute the ListComponentBuildVersions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSimagebuilderErrorDomain` domain and the following error code: `AWSimagebuilderErrorService`, `AWSimagebuilderErrorClient`, `AWSimagebuilderErrorServiceUnavailable`, `AWSimagebuilderErrorInvalidRequest`, `AWSimagebuilderErrorInvalidPaginationToken`, `AWSimagebuilderErrorForbidden`, `AWSimagebuilderErrorCallRateLimitExceeded`.
 
 @see AWSimagebuilderListComponentBuildVersionsRequest
 @see AWSimagebuilderListComponentBuildVersionsResponse
 */
- (void)listComponentBuildVersions:(AWSimagebuilderListComponentBuildVersionsRequest *)request completionHandler:(void (^ _Nullable)(AWSimagebuilderListComponentBuildVersionsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the list of component build versions for the specified semantic version. </p>
 
 @param request A container for the necessary parameters to execute the ListComponents service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSimagebuilderListComponentsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSimagebuilderErrorDomain` domain and the following error code: `AWSimagebuilderErrorService`, `AWSimagebuilderErrorClient`, `AWSimagebuilderErrorServiceUnavailable`, `AWSimagebuilderErrorInvalidRequest`, `AWSimagebuilderErrorInvalidPaginationToken`, `AWSimagebuilderErrorForbidden`, `AWSimagebuilderErrorCallRateLimitExceeded`.
 
 @see AWSimagebuilderListComponentsRequest
 @see AWSimagebuilderListComponentsResponse
 */
- (AWSTask<AWSimagebuilderListComponentsResponse *> *)listComponents:(AWSimagebuilderListComponentsRequest *)request;

/**
 <p>Returns the list of component build versions for the specified semantic version. </p>
 
 @param request A container for the necessary parameters to execute the ListComponents service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSimagebuilderErrorDomain` domain and the following error code: `AWSimagebuilderErrorService`, `AWSimagebuilderErrorClient`, `AWSimagebuilderErrorServiceUnavailable`, `AWSimagebuilderErrorInvalidRequest`, `AWSimagebuilderErrorInvalidPaginationToken`, `AWSimagebuilderErrorForbidden`, `AWSimagebuilderErrorCallRateLimitExceeded`.
 
 @see AWSimagebuilderListComponentsRequest
 @see AWSimagebuilderListComponentsResponse
 */
- (void)listComponents:(AWSimagebuilderListComponentsRequest *)request completionHandler:(void (^ _Nullable)(AWSimagebuilderListComponentsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Returns a list of distribution configurations. </p>
 
 @param request A container for the necessary parameters to execute the ListDistributionConfigurations service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSimagebuilderListDistributionConfigurationsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSimagebuilderErrorDomain` domain and the following error code: `AWSimagebuilderErrorService`, `AWSimagebuilderErrorClient`, `AWSimagebuilderErrorServiceUnavailable`, `AWSimagebuilderErrorInvalidRequest`, `AWSimagebuilderErrorInvalidPaginationToken`, `AWSimagebuilderErrorForbidden`, `AWSimagebuilderErrorCallRateLimitExceeded`.
 
 @see AWSimagebuilderListDistributionConfigurationsRequest
 @see AWSimagebuilderListDistributionConfigurationsResponse
 */
- (AWSTask<AWSimagebuilderListDistributionConfigurationsResponse *> *)listDistributionConfigurations:(AWSimagebuilderListDistributionConfigurationsRequest *)request;

/**
 <p> Returns a list of distribution configurations. </p>
 
 @param request A container for the necessary parameters to execute the ListDistributionConfigurations service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSimagebuilderErrorDomain` domain and the following error code: `AWSimagebuilderErrorService`, `AWSimagebuilderErrorClient`, `AWSimagebuilderErrorServiceUnavailable`, `AWSimagebuilderErrorInvalidRequest`, `AWSimagebuilderErrorInvalidPaginationToken`, `AWSimagebuilderErrorForbidden`, `AWSimagebuilderErrorCallRateLimitExceeded`.
 
 @see AWSimagebuilderListDistributionConfigurationsRequest
 @see AWSimagebuilderListDistributionConfigurationsResponse
 */
- (void)listDistributionConfigurations:(AWSimagebuilderListDistributionConfigurationsRequest *)request completionHandler:(void (^ _Nullable)(AWSimagebuilderListDistributionConfigurationsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Returns a list of distribution configurations. </p>
 
 @param request A container for the necessary parameters to execute the ListImageBuildVersions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSimagebuilderListImageBuildVersionsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSimagebuilderErrorDomain` domain and the following error code: `AWSimagebuilderErrorService`, `AWSimagebuilderErrorClient`, `AWSimagebuilderErrorServiceUnavailable`, `AWSimagebuilderErrorInvalidRequest`, `AWSimagebuilderErrorInvalidPaginationToken`, `AWSimagebuilderErrorForbidden`, `AWSimagebuilderErrorCallRateLimitExceeded`.
 
 @see AWSimagebuilderListImageBuildVersionsRequest
 @see AWSimagebuilderListImageBuildVersionsResponse
 */
- (AWSTask<AWSimagebuilderListImageBuildVersionsResponse *> *)listImageBuildVersions:(AWSimagebuilderListImageBuildVersionsRequest *)request;

/**
 <p> Returns a list of distribution configurations. </p>
 
 @param request A container for the necessary parameters to execute the ListImageBuildVersions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSimagebuilderErrorDomain` domain and the following error code: `AWSimagebuilderErrorService`, `AWSimagebuilderErrorClient`, `AWSimagebuilderErrorServiceUnavailable`, `AWSimagebuilderErrorInvalidRequest`, `AWSimagebuilderErrorInvalidPaginationToken`, `AWSimagebuilderErrorForbidden`, `AWSimagebuilderErrorCallRateLimitExceeded`.
 
 @see AWSimagebuilderListImageBuildVersionsRequest
 @see AWSimagebuilderListImageBuildVersionsResponse
 */
- (void)listImageBuildVersions:(AWSimagebuilderListImageBuildVersionsRequest *)request completionHandler:(void (^ _Nullable)(AWSimagebuilderListImageBuildVersionsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Returns a list of images created by the specified pipeline. </p>
 
 @param request A container for the necessary parameters to execute the ListImagePipelineImages service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSimagebuilderListImagePipelineImagesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSimagebuilderErrorDomain` domain and the following error code: `AWSimagebuilderErrorService`, `AWSimagebuilderErrorClient`, `AWSimagebuilderErrorServiceUnavailable`, `AWSimagebuilderErrorInvalidRequest`, `AWSimagebuilderErrorInvalidPaginationToken`, `AWSimagebuilderErrorResourceNotFound`, `AWSimagebuilderErrorForbidden`, `AWSimagebuilderErrorCallRateLimitExceeded`.
 
 @see AWSimagebuilderListImagePipelineImagesRequest
 @see AWSimagebuilderListImagePipelineImagesResponse
 */
- (AWSTask<AWSimagebuilderListImagePipelineImagesResponse *> *)listImagePipelineImages:(AWSimagebuilderListImagePipelineImagesRequest *)request;

/**
 <p> Returns a list of images created by the specified pipeline. </p>
 
 @param request A container for the necessary parameters to execute the ListImagePipelineImages service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSimagebuilderErrorDomain` domain and the following error code: `AWSimagebuilderErrorService`, `AWSimagebuilderErrorClient`, `AWSimagebuilderErrorServiceUnavailable`, `AWSimagebuilderErrorInvalidRequest`, `AWSimagebuilderErrorInvalidPaginationToken`, `AWSimagebuilderErrorResourceNotFound`, `AWSimagebuilderErrorForbidden`, `AWSimagebuilderErrorCallRateLimitExceeded`.
 
 @see AWSimagebuilderListImagePipelineImagesRequest
 @see AWSimagebuilderListImagePipelineImagesResponse
 */
- (void)listImagePipelineImages:(AWSimagebuilderListImagePipelineImagesRequest *)request completionHandler:(void (^ _Nullable)(AWSimagebuilderListImagePipelineImagesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of image pipelines. </p>
 
 @param request A container for the necessary parameters to execute the ListImagePipelines service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSimagebuilderListImagePipelinesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSimagebuilderErrorDomain` domain and the following error code: `AWSimagebuilderErrorService`, `AWSimagebuilderErrorClient`, `AWSimagebuilderErrorServiceUnavailable`, `AWSimagebuilderErrorInvalidRequest`, `AWSimagebuilderErrorInvalidPaginationToken`, `AWSimagebuilderErrorForbidden`, `AWSimagebuilderErrorCallRateLimitExceeded`.
 
 @see AWSimagebuilderListImagePipelinesRequest
 @see AWSimagebuilderListImagePipelinesResponse
 */
- (AWSTask<AWSimagebuilderListImagePipelinesResponse *> *)listImagePipelines:(AWSimagebuilderListImagePipelinesRequest *)request;

/**
 <p>Returns a list of image pipelines. </p>
 
 @param request A container for the necessary parameters to execute the ListImagePipelines service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSimagebuilderErrorDomain` domain and the following error code: `AWSimagebuilderErrorService`, `AWSimagebuilderErrorClient`, `AWSimagebuilderErrorServiceUnavailable`, `AWSimagebuilderErrorInvalidRequest`, `AWSimagebuilderErrorInvalidPaginationToken`, `AWSimagebuilderErrorForbidden`, `AWSimagebuilderErrorCallRateLimitExceeded`.
 
 @see AWSimagebuilderListImagePipelinesRequest
 @see AWSimagebuilderListImagePipelinesResponse
 */
- (void)listImagePipelines:(AWSimagebuilderListImagePipelinesRequest *)request completionHandler:(void (^ _Nullable)(AWSimagebuilderListImagePipelinesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Returns a list of image recipes. </p>
 
 @param request A container for the necessary parameters to execute the ListImageRecipes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSimagebuilderListImageRecipesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSimagebuilderErrorDomain` domain and the following error code: `AWSimagebuilderErrorService`, `AWSimagebuilderErrorClient`, `AWSimagebuilderErrorServiceUnavailable`, `AWSimagebuilderErrorInvalidRequest`, `AWSimagebuilderErrorInvalidPaginationToken`, `AWSimagebuilderErrorForbidden`, `AWSimagebuilderErrorCallRateLimitExceeded`.
 
 @see AWSimagebuilderListImageRecipesRequest
 @see AWSimagebuilderListImageRecipesResponse
 */
- (AWSTask<AWSimagebuilderListImageRecipesResponse *> *)listImageRecipes:(AWSimagebuilderListImageRecipesRequest *)request;

/**
 <p> Returns a list of image recipes. </p>
 
 @param request A container for the necessary parameters to execute the ListImageRecipes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSimagebuilderErrorDomain` domain and the following error code: `AWSimagebuilderErrorService`, `AWSimagebuilderErrorClient`, `AWSimagebuilderErrorServiceUnavailable`, `AWSimagebuilderErrorInvalidRequest`, `AWSimagebuilderErrorInvalidPaginationToken`, `AWSimagebuilderErrorForbidden`, `AWSimagebuilderErrorCallRateLimitExceeded`.
 
 @see AWSimagebuilderListImageRecipesRequest
 @see AWSimagebuilderListImageRecipesResponse
 */
- (void)listImageRecipes:(AWSimagebuilderListImageRecipesRequest *)request completionHandler:(void (^ _Nullable)(AWSimagebuilderListImageRecipesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Returns the list of image build versions for the specified semantic version. </p>
 
 @param request A container for the necessary parameters to execute the ListImages service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSimagebuilderListImagesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSimagebuilderErrorDomain` domain and the following error code: `AWSimagebuilderErrorService`, `AWSimagebuilderErrorClient`, `AWSimagebuilderErrorServiceUnavailable`, `AWSimagebuilderErrorInvalidRequest`, `AWSimagebuilderErrorInvalidPaginationToken`, `AWSimagebuilderErrorForbidden`, `AWSimagebuilderErrorCallRateLimitExceeded`.
 
 @see AWSimagebuilderListImagesRequest
 @see AWSimagebuilderListImagesResponse
 */
- (AWSTask<AWSimagebuilderListImagesResponse *> *)listImages:(AWSimagebuilderListImagesRequest *)request;

/**
 <p> Returns the list of image build versions for the specified semantic version. </p>
 
 @param request A container for the necessary parameters to execute the ListImages service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSimagebuilderErrorDomain` domain and the following error code: `AWSimagebuilderErrorService`, `AWSimagebuilderErrorClient`, `AWSimagebuilderErrorServiceUnavailable`, `AWSimagebuilderErrorInvalidRequest`, `AWSimagebuilderErrorInvalidPaginationToken`, `AWSimagebuilderErrorForbidden`, `AWSimagebuilderErrorCallRateLimitExceeded`.
 
 @see AWSimagebuilderListImagesRequest
 @see AWSimagebuilderListImagesResponse
 */
- (void)listImages:(AWSimagebuilderListImagesRequest *)request completionHandler:(void (^ _Nullable)(AWSimagebuilderListImagesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Returns a list of infrastructure configurations. </p>
 
 @param request A container for the necessary parameters to execute the ListInfrastructureConfigurations service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSimagebuilderListInfrastructureConfigurationsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSimagebuilderErrorDomain` domain and the following error code: `AWSimagebuilderErrorService`, `AWSimagebuilderErrorClient`, `AWSimagebuilderErrorServiceUnavailable`, `AWSimagebuilderErrorInvalidRequest`, `AWSimagebuilderErrorInvalidPaginationToken`, `AWSimagebuilderErrorForbidden`, `AWSimagebuilderErrorCallRateLimitExceeded`.
 
 @see AWSimagebuilderListInfrastructureConfigurationsRequest
 @see AWSimagebuilderListInfrastructureConfigurationsResponse
 */
- (AWSTask<AWSimagebuilderListInfrastructureConfigurationsResponse *> *)listInfrastructureConfigurations:(AWSimagebuilderListInfrastructureConfigurationsRequest *)request;

/**
 <p> Returns a list of infrastructure configurations. </p>
 
 @param request A container for the necessary parameters to execute the ListInfrastructureConfigurations service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSimagebuilderErrorDomain` domain and the following error code: `AWSimagebuilderErrorService`, `AWSimagebuilderErrorClient`, `AWSimagebuilderErrorServiceUnavailable`, `AWSimagebuilderErrorInvalidRequest`, `AWSimagebuilderErrorInvalidPaginationToken`, `AWSimagebuilderErrorForbidden`, `AWSimagebuilderErrorCallRateLimitExceeded`.
 
 @see AWSimagebuilderListInfrastructureConfigurationsRequest
 @see AWSimagebuilderListInfrastructureConfigurationsResponse
 */
- (void)listInfrastructureConfigurations:(AWSimagebuilderListInfrastructureConfigurationsRequest *)request completionHandler:(void (^ _Nullable)(AWSimagebuilderListInfrastructureConfigurationsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Returns the list of tags for the specified resource. </p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSimagebuilderListTagsForResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSimagebuilderErrorDomain` domain and the following error code: `AWSimagebuilderErrorService`, `AWSimagebuilderErrorInvalidParameter`, `AWSimagebuilderErrorResourceNotFound`.
 
 @see AWSimagebuilderListTagsForResourceRequest
 @see AWSimagebuilderListTagsForResourceResponse
 */
- (AWSTask<AWSimagebuilderListTagsForResourceResponse *> *)listTagsForResource:(AWSimagebuilderListTagsForResourceRequest *)request;

/**
 <p> Returns the list of tags for the specified resource. </p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSimagebuilderErrorDomain` domain and the following error code: `AWSimagebuilderErrorService`, `AWSimagebuilderErrorInvalidParameter`, `AWSimagebuilderErrorResourceNotFound`.
 
 @see AWSimagebuilderListTagsForResourceRequest
 @see AWSimagebuilderListTagsForResourceResponse
 */
- (void)listTagsForResource:(AWSimagebuilderListTagsForResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSimagebuilderListTagsForResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Applies a policy to a component. We recommend that you call the RAM API <a href="https://docs.aws.amazon.com/ram/latest/APIReference/API_CreateResourceShare.html">CreateResourceShare</a> to share resources. If you call the Image Builder API <code>PutComponentPolicy</code>, you must also call the RAM API <a href="https://docs.aws.amazon.com/ram/latest/APIReference/API_PromoteResourceShareCreatedFromPolicy.html">PromoteResourceShareCreatedFromPolicy</a> in order for the resource to be visible to all principals with whom the resource is shared. </p>
 
 @param request A container for the necessary parameters to execute the PutComponentPolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSimagebuilderPutComponentPolicyResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSimagebuilderErrorDomain` domain and the following error code: `AWSimagebuilderErrorService`, `AWSimagebuilderErrorClient`, `AWSimagebuilderErrorServiceUnavailable`, `AWSimagebuilderErrorInvalidRequest`, `AWSimagebuilderErrorInvalidParameterValue`, `AWSimagebuilderErrorResourceNotFound`, `AWSimagebuilderErrorForbidden`, `AWSimagebuilderErrorCallRateLimitExceeded`.
 
 @see AWSimagebuilderPutComponentPolicyRequest
 @see AWSimagebuilderPutComponentPolicyResponse
 */
- (AWSTask<AWSimagebuilderPutComponentPolicyResponse *> *)putComponentPolicy:(AWSimagebuilderPutComponentPolicyRequest *)request;

/**
 <p> Applies a policy to a component. We recommend that you call the RAM API <a href="https://docs.aws.amazon.com/ram/latest/APIReference/API_CreateResourceShare.html">CreateResourceShare</a> to share resources. If you call the Image Builder API <code>PutComponentPolicy</code>, you must also call the RAM API <a href="https://docs.aws.amazon.com/ram/latest/APIReference/API_PromoteResourceShareCreatedFromPolicy.html">PromoteResourceShareCreatedFromPolicy</a> in order for the resource to be visible to all principals with whom the resource is shared. </p>
 
 @param request A container for the necessary parameters to execute the PutComponentPolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSimagebuilderErrorDomain` domain and the following error code: `AWSimagebuilderErrorService`, `AWSimagebuilderErrorClient`, `AWSimagebuilderErrorServiceUnavailable`, `AWSimagebuilderErrorInvalidRequest`, `AWSimagebuilderErrorInvalidParameterValue`, `AWSimagebuilderErrorResourceNotFound`, `AWSimagebuilderErrorForbidden`, `AWSimagebuilderErrorCallRateLimitExceeded`.
 
 @see AWSimagebuilderPutComponentPolicyRequest
 @see AWSimagebuilderPutComponentPolicyResponse
 */
- (void)putComponentPolicy:(AWSimagebuilderPutComponentPolicyRequest *)request completionHandler:(void (^ _Nullable)(AWSimagebuilderPutComponentPolicyResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Applies a policy to an image. We recommend that you call the RAM API <a href="https://docs.aws.amazon.com/ram/latest/APIReference/API_CreateResourceShare.html">CreateResourceShare</a> to share resources. If you call the Image Builder API <code>PutImagePolicy</code>, you must also call the RAM API <a href="https://docs.aws.amazon.com/ram/latest/APIReference/API_PromoteResourceShareCreatedFromPolicy.html">PromoteResourceShareCreatedFromPolicy</a> in order for the resource to be visible to all principals with whom the resource is shared. </p>
 
 @param request A container for the necessary parameters to execute the PutImagePolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSimagebuilderPutImagePolicyResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSimagebuilderErrorDomain` domain and the following error code: `AWSimagebuilderErrorService`, `AWSimagebuilderErrorClient`, `AWSimagebuilderErrorServiceUnavailable`, `AWSimagebuilderErrorInvalidRequest`, `AWSimagebuilderErrorInvalidParameterValue`, `AWSimagebuilderErrorResourceNotFound`, `AWSimagebuilderErrorForbidden`, `AWSimagebuilderErrorCallRateLimitExceeded`.
 
 @see AWSimagebuilderPutImagePolicyRequest
 @see AWSimagebuilderPutImagePolicyResponse
 */
- (AWSTask<AWSimagebuilderPutImagePolicyResponse *> *)putImagePolicy:(AWSimagebuilderPutImagePolicyRequest *)request;

/**
 <p>Applies a policy to an image. We recommend that you call the RAM API <a href="https://docs.aws.amazon.com/ram/latest/APIReference/API_CreateResourceShare.html">CreateResourceShare</a> to share resources. If you call the Image Builder API <code>PutImagePolicy</code>, you must also call the RAM API <a href="https://docs.aws.amazon.com/ram/latest/APIReference/API_PromoteResourceShareCreatedFromPolicy.html">PromoteResourceShareCreatedFromPolicy</a> in order for the resource to be visible to all principals with whom the resource is shared. </p>
 
 @param request A container for the necessary parameters to execute the PutImagePolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSimagebuilderErrorDomain` domain and the following error code: `AWSimagebuilderErrorService`, `AWSimagebuilderErrorClient`, `AWSimagebuilderErrorServiceUnavailable`, `AWSimagebuilderErrorInvalidRequest`, `AWSimagebuilderErrorInvalidParameterValue`, `AWSimagebuilderErrorResourceNotFound`, `AWSimagebuilderErrorForbidden`, `AWSimagebuilderErrorCallRateLimitExceeded`.
 
 @see AWSimagebuilderPutImagePolicyRequest
 @see AWSimagebuilderPutImagePolicyResponse
 */
- (void)putImagePolicy:(AWSimagebuilderPutImagePolicyRequest *)request completionHandler:(void (^ _Nullable)(AWSimagebuilderPutImagePolicyResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Applies a policy to an image recipe. We recommend that you call the RAM API <a href="https://docs.aws.amazon.com/ram/latest/APIReference/API_CreateResourceShare.html">CreateResourceShare</a> to share resources. If you call the Image Builder API <code>PutImageRecipePolicy</code>, you must also call the RAM API <a href="https://docs.aws.amazon.com/ram/latest/APIReference/API_PromoteResourceShareCreatedFromPolicy.html">PromoteResourceShareCreatedFromPolicy</a> in order for the resource to be visible to all principals with whom the resource is shared. </p>
 
 @param request A container for the necessary parameters to execute the PutImageRecipePolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSimagebuilderPutImageRecipePolicyResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSimagebuilderErrorDomain` domain and the following error code: `AWSimagebuilderErrorService`, `AWSimagebuilderErrorClient`, `AWSimagebuilderErrorServiceUnavailable`, `AWSimagebuilderErrorInvalidRequest`, `AWSimagebuilderErrorInvalidParameterValue`, `AWSimagebuilderErrorResourceNotFound`, `AWSimagebuilderErrorForbidden`, `AWSimagebuilderErrorCallRateLimitExceeded`.
 
 @see AWSimagebuilderPutImageRecipePolicyRequest
 @see AWSimagebuilderPutImageRecipePolicyResponse
 */
- (AWSTask<AWSimagebuilderPutImageRecipePolicyResponse *> *)putImageRecipePolicy:(AWSimagebuilderPutImageRecipePolicyRequest *)request;

/**
 <p> Applies a policy to an image recipe. We recommend that you call the RAM API <a href="https://docs.aws.amazon.com/ram/latest/APIReference/API_CreateResourceShare.html">CreateResourceShare</a> to share resources. If you call the Image Builder API <code>PutImageRecipePolicy</code>, you must also call the RAM API <a href="https://docs.aws.amazon.com/ram/latest/APIReference/API_PromoteResourceShareCreatedFromPolicy.html">PromoteResourceShareCreatedFromPolicy</a> in order for the resource to be visible to all principals with whom the resource is shared. </p>
 
 @param request A container for the necessary parameters to execute the PutImageRecipePolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSimagebuilderErrorDomain` domain and the following error code: `AWSimagebuilderErrorService`, `AWSimagebuilderErrorClient`, `AWSimagebuilderErrorServiceUnavailable`, `AWSimagebuilderErrorInvalidRequest`, `AWSimagebuilderErrorInvalidParameterValue`, `AWSimagebuilderErrorResourceNotFound`, `AWSimagebuilderErrorForbidden`, `AWSimagebuilderErrorCallRateLimitExceeded`.
 
 @see AWSimagebuilderPutImageRecipePolicyRequest
 @see AWSimagebuilderPutImageRecipePolicyResponse
 */
- (void)putImageRecipePolicy:(AWSimagebuilderPutImageRecipePolicyRequest *)request completionHandler:(void (^ _Nullable)(AWSimagebuilderPutImageRecipePolicyResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Manually triggers a pipeline to create an image. </p>
 
 @param request A container for the necessary parameters to execute the StartImagePipelineExecution service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSimagebuilderStartImagePipelineExecutionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSimagebuilderErrorDomain` domain and the following error code: `AWSimagebuilderErrorService`, `AWSimagebuilderErrorClient`, `AWSimagebuilderErrorServiceUnavailable`, `AWSimagebuilderErrorInvalidRequest`, `AWSimagebuilderErrorResourceNotFound`, `AWSimagebuilderErrorIdempotentParameterMismatch`, `AWSimagebuilderErrorForbidden`, `AWSimagebuilderErrorCallRateLimitExceeded`, `AWSimagebuilderErrorResourceInUse`.
 
 @see AWSimagebuilderStartImagePipelineExecutionRequest
 @see AWSimagebuilderStartImagePipelineExecutionResponse
 */
- (AWSTask<AWSimagebuilderStartImagePipelineExecutionResponse *> *)startImagePipelineExecution:(AWSimagebuilderStartImagePipelineExecutionRequest *)request;

/**
 <p> Manually triggers a pipeline to create an image. </p>
 
 @param request A container for the necessary parameters to execute the StartImagePipelineExecution service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSimagebuilderErrorDomain` domain and the following error code: `AWSimagebuilderErrorService`, `AWSimagebuilderErrorClient`, `AWSimagebuilderErrorServiceUnavailable`, `AWSimagebuilderErrorInvalidRequest`, `AWSimagebuilderErrorResourceNotFound`, `AWSimagebuilderErrorIdempotentParameterMismatch`, `AWSimagebuilderErrorForbidden`, `AWSimagebuilderErrorCallRateLimitExceeded`, `AWSimagebuilderErrorResourceInUse`.
 
 @see AWSimagebuilderStartImagePipelineExecutionRequest
 @see AWSimagebuilderStartImagePipelineExecutionResponse
 */
- (void)startImagePipelineExecution:(AWSimagebuilderStartImagePipelineExecutionRequest *)request completionHandler:(void (^ _Nullable)(AWSimagebuilderStartImagePipelineExecutionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Adds a tag to a resource. </p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSimagebuilderTagResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSimagebuilderErrorDomain` domain and the following error code: `AWSimagebuilderErrorService`, `AWSimagebuilderErrorInvalidParameter`, `AWSimagebuilderErrorResourceNotFound`.
 
 @see AWSimagebuilderTagResourceRequest
 @see AWSimagebuilderTagResourceResponse
 */
- (AWSTask<AWSimagebuilderTagResourceResponse *> *)tagResource:(AWSimagebuilderTagResourceRequest *)request;

/**
 <p> Adds a tag to a resource. </p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSimagebuilderErrorDomain` domain and the following error code: `AWSimagebuilderErrorService`, `AWSimagebuilderErrorInvalidParameter`, `AWSimagebuilderErrorResourceNotFound`.
 
 @see AWSimagebuilderTagResourceRequest
 @see AWSimagebuilderTagResourceResponse
 */
- (void)tagResource:(AWSimagebuilderTagResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSimagebuilderTagResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Removes a tag from a resource. </p>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSimagebuilderUntagResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSimagebuilderErrorDomain` domain and the following error code: `AWSimagebuilderErrorService`, `AWSimagebuilderErrorInvalidParameter`, `AWSimagebuilderErrorResourceNotFound`.
 
 @see AWSimagebuilderUntagResourceRequest
 @see AWSimagebuilderUntagResourceResponse
 */
- (AWSTask<AWSimagebuilderUntagResourceResponse *> *)untagResource:(AWSimagebuilderUntagResourceRequest *)request;

/**
 <p> Removes a tag from a resource. </p>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSimagebuilderErrorDomain` domain and the following error code: `AWSimagebuilderErrorService`, `AWSimagebuilderErrorInvalidParameter`, `AWSimagebuilderErrorResourceNotFound`.
 
 @see AWSimagebuilderUntagResourceRequest
 @see AWSimagebuilderUntagResourceResponse
 */
- (void)untagResource:(AWSimagebuilderUntagResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSimagebuilderUntagResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Updates a new distribution configuration. Distribution configurations define and configure the outputs of your pipeline. </p>
 
 @param request A container for the necessary parameters to execute the UpdateDistributionConfiguration service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSimagebuilderUpdateDistributionConfigurationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSimagebuilderErrorDomain` domain and the following error code: `AWSimagebuilderErrorService`, `AWSimagebuilderErrorClient`, `AWSimagebuilderErrorServiceUnavailable`, `AWSimagebuilderErrorInvalidRequest`, `AWSimagebuilderErrorIdempotentParameterMismatch`, `AWSimagebuilderErrorForbidden`, `AWSimagebuilderErrorCallRateLimitExceeded`, `AWSimagebuilderErrorResourceInUse`, `AWSimagebuilderErrorInvalidParameterCombination`.
 
 @see AWSimagebuilderUpdateDistributionConfigurationRequest
 @see AWSimagebuilderUpdateDistributionConfigurationResponse
 */
- (AWSTask<AWSimagebuilderUpdateDistributionConfigurationResponse *> *)updateDistributionConfiguration:(AWSimagebuilderUpdateDistributionConfigurationRequest *)request;

/**
 <p> Updates a new distribution configuration. Distribution configurations define and configure the outputs of your pipeline. </p>
 
 @param request A container for the necessary parameters to execute the UpdateDistributionConfiguration service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSimagebuilderErrorDomain` domain and the following error code: `AWSimagebuilderErrorService`, `AWSimagebuilderErrorClient`, `AWSimagebuilderErrorServiceUnavailable`, `AWSimagebuilderErrorInvalidRequest`, `AWSimagebuilderErrorIdempotentParameterMismatch`, `AWSimagebuilderErrorForbidden`, `AWSimagebuilderErrorCallRateLimitExceeded`, `AWSimagebuilderErrorResourceInUse`, `AWSimagebuilderErrorInvalidParameterCombination`.
 
 @see AWSimagebuilderUpdateDistributionConfigurationRequest
 @see AWSimagebuilderUpdateDistributionConfigurationResponse
 */
- (void)updateDistributionConfiguration:(AWSimagebuilderUpdateDistributionConfigurationRequest *)request completionHandler:(void (^ _Nullable)(AWSimagebuilderUpdateDistributionConfigurationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Updates a new image pipeline. Image pipelines enable you to automate the creation and distribution of images. </p>
 
 @param request A container for the necessary parameters to execute the UpdateImagePipeline service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSimagebuilderUpdateImagePipelineResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSimagebuilderErrorDomain` domain and the following error code: `AWSimagebuilderErrorService`, `AWSimagebuilderErrorClient`, `AWSimagebuilderErrorServiceUnavailable`, `AWSimagebuilderErrorInvalidRequest`, `AWSimagebuilderErrorIdempotentParameterMismatch`, `AWSimagebuilderErrorForbidden`, `AWSimagebuilderErrorCallRateLimitExceeded`, `AWSimagebuilderErrorResourceInUse`.
 
 @see AWSimagebuilderUpdateImagePipelineRequest
 @see AWSimagebuilderUpdateImagePipelineResponse
 */
- (AWSTask<AWSimagebuilderUpdateImagePipelineResponse *> *)updateImagePipeline:(AWSimagebuilderUpdateImagePipelineRequest *)request;

/**
 <p> Updates a new image pipeline. Image pipelines enable you to automate the creation and distribution of images. </p>
 
 @param request A container for the necessary parameters to execute the UpdateImagePipeline service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSimagebuilderErrorDomain` domain and the following error code: `AWSimagebuilderErrorService`, `AWSimagebuilderErrorClient`, `AWSimagebuilderErrorServiceUnavailable`, `AWSimagebuilderErrorInvalidRequest`, `AWSimagebuilderErrorIdempotentParameterMismatch`, `AWSimagebuilderErrorForbidden`, `AWSimagebuilderErrorCallRateLimitExceeded`, `AWSimagebuilderErrorResourceInUse`.
 
 @see AWSimagebuilderUpdateImagePipelineRequest
 @see AWSimagebuilderUpdateImagePipelineResponse
 */
- (void)updateImagePipeline:(AWSimagebuilderUpdateImagePipelineRequest *)request completionHandler:(void (^ _Nullable)(AWSimagebuilderUpdateImagePipelineResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Updates a new infrastructure configuration. An infrastructure configuration defines the environment in which your image will be built and tested. </p>
 
 @param request A container for the necessary parameters to execute the UpdateInfrastructureConfiguration service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSimagebuilderUpdateInfrastructureConfigurationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSimagebuilderErrorDomain` domain and the following error code: `AWSimagebuilderErrorService`, `AWSimagebuilderErrorClient`, `AWSimagebuilderErrorServiceUnavailable`, `AWSimagebuilderErrorInvalidRequest`, `AWSimagebuilderErrorIdempotentParameterMismatch`, `AWSimagebuilderErrorForbidden`, `AWSimagebuilderErrorCallRateLimitExceeded`, `AWSimagebuilderErrorResourceInUse`.
 
 @see AWSimagebuilderUpdateInfrastructureConfigurationRequest
 @see AWSimagebuilderUpdateInfrastructureConfigurationResponse
 */
- (AWSTask<AWSimagebuilderUpdateInfrastructureConfigurationResponse *> *)updateInfrastructureConfiguration:(AWSimagebuilderUpdateInfrastructureConfigurationRequest *)request;

/**
 <p> Updates a new infrastructure configuration. An infrastructure configuration defines the environment in which your image will be built and tested. </p>
 
 @param request A container for the necessary parameters to execute the UpdateInfrastructureConfiguration service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSimagebuilderErrorDomain` domain and the following error code: `AWSimagebuilderErrorService`, `AWSimagebuilderErrorClient`, `AWSimagebuilderErrorServiceUnavailable`, `AWSimagebuilderErrorInvalidRequest`, `AWSimagebuilderErrorIdempotentParameterMismatch`, `AWSimagebuilderErrorForbidden`, `AWSimagebuilderErrorCallRateLimitExceeded`, `AWSimagebuilderErrorResourceInUse`.
 
 @see AWSimagebuilderUpdateInfrastructureConfigurationRequest
 @see AWSimagebuilderUpdateInfrastructureConfigurationResponse
 */
- (void)updateInfrastructureConfiguration:(AWSimagebuilderUpdateInfrastructureConfigurationRequest *)request completionHandler:(void (^ _Nullable)(AWSimagebuilderUpdateInfrastructureConfigurationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
