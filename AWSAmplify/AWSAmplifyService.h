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
#import "AWSAmplifyModel.h"
#import "AWSAmplifyResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSAmplify
FOUNDATION_EXPORT NSString *const AWSAmplifySDKVersion;

/**
 <p> Welcome to the AWS Amplify API documentation. This reference provides descriptions of the actions and data types for the Amplify API.</p><p>Amplify enables developers to develop and deploy cloud-powered mobile and web apps. The Amplify Console provides a continuous delivery and hosting service for web applications. For more information, see the <a href="https://docs.aws.amazon.com/amplify/latest/userguide/welcome.html">Amplify Console User Guide</a>. The Amplify Framework is a comprehensive set of SDKs, libraries, tools, and documentation for client app development. For more information, see the <a href="https://aws-amplify.github.io/docs/">Amplify Framework.</a></p>
 */
@interface AWSAmplify : AWSService

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

     let Amplify = AWSAmplify.default()

 *Objective-C*

     AWSAmplify *Amplify = [AWSAmplify defaultAmplify];

 @return The default service client.
 */
+ (instancetype)defaultAmplify;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSAmplify.register(with: configuration!, forKey: "USWest2Amplify")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSAmplify registerAmplifyWithConfiguration:configuration forKey:@"USWest2Amplify"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Amplify = AWSAmplify(forKey: "USWest2Amplify")

 *Objective-C*

     AWSAmplify *Amplify = [AWSAmplify AmplifyForKey:@"USWest2Amplify"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerAmplifyWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerAmplifyWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSAmplify.register(with: configuration!, forKey: "USWest2Amplify")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSAmplify registerAmplifyWithConfiguration:configuration forKey:@"USWest2Amplify"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Amplify = AWSAmplify(forKey: "USWest2Amplify")

 *Objective-C*

     AWSAmplify *Amplify = [AWSAmplify AmplifyForKey:@"USWest2Amplify"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)AmplifyForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removeAmplifyForKey:(NSString *)key;

/**
 <p> Creates a new Amplify app. </p>
 
 @param request A container for the necessary parameters to execute the CreateApp service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAmplifyCreateAppResult`. On failed execution, `task.error` may contain an `NSError` with `AWSAmplifyErrorDomain` domain and the following error code: `AWSAmplifyErrorBadRequest`, `AWSAmplifyErrorUnauthorized`, `AWSAmplifyErrorInternalFailure`, `AWSAmplifyErrorLimitExceeded`, `AWSAmplifyErrorDependentServiceFailure`.
 
 @see AWSAmplifyCreateAppRequest
 @see AWSAmplifyCreateAppResult
 */
- (AWSTask<AWSAmplifyCreateAppResult *> *)createApp:(AWSAmplifyCreateAppRequest *)request;

/**
 <p> Creates a new Amplify app. </p>
 
 @param request A container for the necessary parameters to execute the CreateApp service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAmplifyErrorDomain` domain and the following error code: `AWSAmplifyErrorBadRequest`, `AWSAmplifyErrorUnauthorized`, `AWSAmplifyErrorInternalFailure`, `AWSAmplifyErrorLimitExceeded`, `AWSAmplifyErrorDependentServiceFailure`.
 
 @see AWSAmplifyCreateAppRequest
 @see AWSAmplifyCreateAppResult
 */
- (void)createApp:(AWSAmplifyCreateAppRequest *)request completionHandler:(void (^ _Nullable)(AWSAmplifyCreateAppResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Creates a new backend environment for an Amplify app. </p>
 
 @param request A container for the necessary parameters to execute the CreateBackendEnvironment service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAmplifyCreateBackendEnvironmentResult`. On failed execution, `task.error` may contain an `NSError` with `AWSAmplifyErrorDomain` domain and the following error code: `AWSAmplifyErrorBadRequest`, `AWSAmplifyErrorUnauthorized`, `AWSAmplifyErrorNotFound`, `AWSAmplifyErrorInternalFailure`, `AWSAmplifyErrorLimitExceeded`.
 
 @see AWSAmplifyCreateBackendEnvironmentRequest
 @see AWSAmplifyCreateBackendEnvironmentResult
 */
- (AWSTask<AWSAmplifyCreateBackendEnvironmentResult *> *)createBackendEnvironment:(AWSAmplifyCreateBackendEnvironmentRequest *)request;

/**
 <p> Creates a new backend environment for an Amplify app. </p>
 
 @param request A container for the necessary parameters to execute the CreateBackendEnvironment service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAmplifyErrorDomain` domain and the following error code: `AWSAmplifyErrorBadRequest`, `AWSAmplifyErrorUnauthorized`, `AWSAmplifyErrorNotFound`, `AWSAmplifyErrorInternalFailure`, `AWSAmplifyErrorLimitExceeded`.
 
 @see AWSAmplifyCreateBackendEnvironmentRequest
 @see AWSAmplifyCreateBackendEnvironmentResult
 */
- (void)createBackendEnvironment:(AWSAmplifyCreateBackendEnvironmentRequest *)request completionHandler:(void (^ _Nullable)(AWSAmplifyCreateBackendEnvironmentResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Creates a new branch for an Amplify app. </p>
 
 @param request A container for the necessary parameters to execute the CreateBranch service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAmplifyCreateBranchResult`. On failed execution, `task.error` may contain an `NSError` with `AWSAmplifyErrorDomain` domain and the following error code: `AWSAmplifyErrorBadRequest`, `AWSAmplifyErrorUnauthorized`, `AWSAmplifyErrorNotFound`, `AWSAmplifyErrorInternalFailure`, `AWSAmplifyErrorLimitExceeded`, `AWSAmplifyErrorDependentServiceFailure`.
 
 @see AWSAmplifyCreateBranchRequest
 @see AWSAmplifyCreateBranchResult
 */
- (AWSTask<AWSAmplifyCreateBranchResult *> *)createBranch:(AWSAmplifyCreateBranchRequest *)request;

/**
 <p> Creates a new branch for an Amplify app. </p>
 
 @param request A container for the necessary parameters to execute the CreateBranch service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAmplifyErrorDomain` domain and the following error code: `AWSAmplifyErrorBadRequest`, `AWSAmplifyErrorUnauthorized`, `AWSAmplifyErrorNotFound`, `AWSAmplifyErrorInternalFailure`, `AWSAmplifyErrorLimitExceeded`, `AWSAmplifyErrorDependentServiceFailure`.
 
 @see AWSAmplifyCreateBranchRequest
 @see AWSAmplifyCreateBranchResult
 */
- (void)createBranch:(AWSAmplifyCreateBranchRequest *)request completionHandler:(void (^ _Nullable)(AWSAmplifyCreateBranchResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Creates a deployment for a manually deployed Amplify app. Manually deployed apps are not connected to a repository. </p>
 
 @param request A container for the necessary parameters to execute the CreateDeployment service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAmplifyCreateDeploymentResult`. On failed execution, `task.error` may contain an `NSError` with `AWSAmplifyErrorDomain` domain and the following error code: `AWSAmplifyErrorBadRequest`, `AWSAmplifyErrorUnauthorized`, `AWSAmplifyErrorInternalFailure`, `AWSAmplifyErrorLimitExceeded`.
 
 @see AWSAmplifyCreateDeploymentRequest
 @see AWSAmplifyCreateDeploymentResult
 */
- (AWSTask<AWSAmplifyCreateDeploymentResult *> *)createDeployment:(AWSAmplifyCreateDeploymentRequest *)request;

/**
 <p> Creates a deployment for a manually deployed Amplify app. Manually deployed apps are not connected to a repository. </p>
 
 @param request A container for the necessary parameters to execute the CreateDeployment service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAmplifyErrorDomain` domain and the following error code: `AWSAmplifyErrorBadRequest`, `AWSAmplifyErrorUnauthorized`, `AWSAmplifyErrorInternalFailure`, `AWSAmplifyErrorLimitExceeded`.
 
 @see AWSAmplifyCreateDeploymentRequest
 @see AWSAmplifyCreateDeploymentResult
 */
- (void)createDeployment:(AWSAmplifyCreateDeploymentRequest *)request completionHandler:(void (^ _Nullable)(AWSAmplifyCreateDeploymentResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Creates a new domain association for an Amplify app. This action associates a custom domain with the Amplify app </p>
 
 @param request A container for the necessary parameters to execute the CreateDomainAssociation service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAmplifyCreateDomainAssociationResult`. On failed execution, `task.error` may contain an `NSError` with `AWSAmplifyErrorDomain` domain and the following error code: `AWSAmplifyErrorBadRequest`, `AWSAmplifyErrorUnauthorized`, `AWSAmplifyErrorNotFound`, `AWSAmplifyErrorInternalFailure`, `AWSAmplifyErrorLimitExceeded`, `AWSAmplifyErrorDependentServiceFailure`.
 
 @see AWSAmplifyCreateDomainAssociationRequest
 @see AWSAmplifyCreateDomainAssociationResult
 */
- (AWSTask<AWSAmplifyCreateDomainAssociationResult *> *)createDomainAssociation:(AWSAmplifyCreateDomainAssociationRequest *)request;

/**
 <p> Creates a new domain association for an Amplify app. This action associates a custom domain with the Amplify app </p>
 
 @param request A container for the necessary parameters to execute the CreateDomainAssociation service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAmplifyErrorDomain` domain and the following error code: `AWSAmplifyErrorBadRequest`, `AWSAmplifyErrorUnauthorized`, `AWSAmplifyErrorNotFound`, `AWSAmplifyErrorInternalFailure`, `AWSAmplifyErrorLimitExceeded`, `AWSAmplifyErrorDependentServiceFailure`.
 
 @see AWSAmplifyCreateDomainAssociationRequest
 @see AWSAmplifyCreateDomainAssociationResult
 */
- (void)createDomainAssociation:(AWSAmplifyCreateDomainAssociationRequest *)request completionHandler:(void (^ _Nullable)(AWSAmplifyCreateDomainAssociationResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Creates a new webhook on an Amplify app. </p>
 
 @param request A container for the necessary parameters to execute the CreateWebhook service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAmplifyCreateWebhookResult`. On failed execution, `task.error` may contain an `NSError` with `AWSAmplifyErrorDomain` domain and the following error code: `AWSAmplifyErrorBadRequest`, `AWSAmplifyErrorUnauthorized`, `AWSAmplifyErrorNotFound`, `AWSAmplifyErrorInternalFailure`, `AWSAmplifyErrorLimitExceeded`, `AWSAmplifyErrorDependentServiceFailure`.
 
 @see AWSAmplifyCreateWebhookRequest
 @see AWSAmplifyCreateWebhookResult
 */
- (AWSTask<AWSAmplifyCreateWebhookResult *> *)createWebhook:(AWSAmplifyCreateWebhookRequest *)request;

/**
 <p> Creates a new webhook on an Amplify app. </p>
 
 @param request A container for the necessary parameters to execute the CreateWebhook service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAmplifyErrorDomain` domain and the following error code: `AWSAmplifyErrorBadRequest`, `AWSAmplifyErrorUnauthorized`, `AWSAmplifyErrorNotFound`, `AWSAmplifyErrorInternalFailure`, `AWSAmplifyErrorLimitExceeded`, `AWSAmplifyErrorDependentServiceFailure`.
 
 @see AWSAmplifyCreateWebhookRequest
 @see AWSAmplifyCreateWebhookResult
 */
- (void)createWebhook:(AWSAmplifyCreateWebhookRequest *)request completionHandler:(void (^ _Nullable)(AWSAmplifyCreateWebhookResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Deletes an existing Amplify app specified by an app ID. </p>
 
 @param request A container for the necessary parameters to execute the DeleteApp service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAmplifyDeleteAppResult`. On failed execution, `task.error` may contain an `NSError` with `AWSAmplifyErrorDomain` domain and the following error code: `AWSAmplifyErrorBadRequest`, `AWSAmplifyErrorNotFound`, `AWSAmplifyErrorUnauthorized`, `AWSAmplifyErrorInternalFailure`, `AWSAmplifyErrorDependentServiceFailure`.
 
 @see AWSAmplifyDeleteAppRequest
 @see AWSAmplifyDeleteAppResult
 */
- (AWSTask<AWSAmplifyDeleteAppResult *> *)deleteApp:(AWSAmplifyDeleteAppRequest *)request;

/**
 <p> Deletes an existing Amplify app specified by an app ID. </p>
 
 @param request A container for the necessary parameters to execute the DeleteApp service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAmplifyErrorDomain` domain and the following error code: `AWSAmplifyErrorBadRequest`, `AWSAmplifyErrorNotFound`, `AWSAmplifyErrorUnauthorized`, `AWSAmplifyErrorInternalFailure`, `AWSAmplifyErrorDependentServiceFailure`.
 
 @see AWSAmplifyDeleteAppRequest
 @see AWSAmplifyDeleteAppResult
 */
- (void)deleteApp:(AWSAmplifyDeleteAppRequest *)request completionHandler:(void (^ _Nullable)(AWSAmplifyDeleteAppResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Deletes a backend environment for an Amplify app. </p>
 
 @param request A container for the necessary parameters to execute the DeleteBackendEnvironment service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAmplifyDeleteBackendEnvironmentResult`. On failed execution, `task.error` may contain an `NSError` with `AWSAmplifyErrorDomain` domain and the following error code: `AWSAmplifyErrorBadRequest`, `AWSAmplifyErrorUnauthorized`, `AWSAmplifyErrorNotFound`, `AWSAmplifyErrorInternalFailure`, `AWSAmplifyErrorDependentServiceFailure`.
 
 @see AWSAmplifyDeleteBackendEnvironmentRequest
 @see AWSAmplifyDeleteBackendEnvironmentResult
 */
- (AWSTask<AWSAmplifyDeleteBackendEnvironmentResult *> *)deleteBackendEnvironment:(AWSAmplifyDeleteBackendEnvironmentRequest *)request;

/**
 <p> Deletes a backend environment for an Amplify app. </p>
 
 @param request A container for the necessary parameters to execute the DeleteBackendEnvironment service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAmplifyErrorDomain` domain and the following error code: `AWSAmplifyErrorBadRequest`, `AWSAmplifyErrorUnauthorized`, `AWSAmplifyErrorNotFound`, `AWSAmplifyErrorInternalFailure`, `AWSAmplifyErrorDependentServiceFailure`.
 
 @see AWSAmplifyDeleteBackendEnvironmentRequest
 @see AWSAmplifyDeleteBackendEnvironmentResult
 */
- (void)deleteBackendEnvironment:(AWSAmplifyDeleteBackendEnvironmentRequest *)request completionHandler:(void (^ _Nullable)(AWSAmplifyDeleteBackendEnvironmentResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Deletes a branch for an Amplify app. </p>
 
 @param request A container for the necessary parameters to execute the DeleteBranch service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAmplifyDeleteBranchResult`. On failed execution, `task.error` may contain an `NSError` with `AWSAmplifyErrorDomain` domain and the following error code: `AWSAmplifyErrorBadRequest`, `AWSAmplifyErrorUnauthorized`, `AWSAmplifyErrorNotFound`, `AWSAmplifyErrorInternalFailure`, `AWSAmplifyErrorDependentServiceFailure`.
 
 @see AWSAmplifyDeleteBranchRequest
 @see AWSAmplifyDeleteBranchResult
 */
- (AWSTask<AWSAmplifyDeleteBranchResult *> *)deleteBranch:(AWSAmplifyDeleteBranchRequest *)request;

/**
 <p> Deletes a branch for an Amplify app. </p>
 
 @param request A container for the necessary parameters to execute the DeleteBranch service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAmplifyErrorDomain` domain and the following error code: `AWSAmplifyErrorBadRequest`, `AWSAmplifyErrorUnauthorized`, `AWSAmplifyErrorNotFound`, `AWSAmplifyErrorInternalFailure`, `AWSAmplifyErrorDependentServiceFailure`.
 
 @see AWSAmplifyDeleteBranchRequest
 @see AWSAmplifyDeleteBranchResult
 */
- (void)deleteBranch:(AWSAmplifyDeleteBranchRequest *)request completionHandler:(void (^ _Nullable)(AWSAmplifyDeleteBranchResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Deletes a domain association for an Amplify app. </p>
 
 @param request A container for the necessary parameters to execute the DeleteDomainAssociation service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAmplifyDeleteDomainAssociationResult`. On failed execution, `task.error` may contain an `NSError` with `AWSAmplifyErrorDomain` domain and the following error code: `AWSAmplifyErrorBadRequest`, `AWSAmplifyErrorUnauthorized`, `AWSAmplifyErrorNotFound`, `AWSAmplifyErrorInternalFailure`, `AWSAmplifyErrorDependentServiceFailure`.
 
 @see AWSAmplifyDeleteDomainAssociationRequest
 @see AWSAmplifyDeleteDomainAssociationResult
 */
- (AWSTask<AWSAmplifyDeleteDomainAssociationResult *> *)deleteDomainAssociation:(AWSAmplifyDeleteDomainAssociationRequest *)request;

/**
 <p> Deletes a domain association for an Amplify app. </p>
 
 @param request A container for the necessary parameters to execute the DeleteDomainAssociation service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAmplifyErrorDomain` domain and the following error code: `AWSAmplifyErrorBadRequest`, `AWSAmplifyErrorUnauthorized`, `AWSAmplifyErrorNotFound`, `AWSAmplifyErrorInternalFailure`, `AWSAmplifyErrorDependentServiceFailure`.
 
 @see AWSAmplifyDeleteDomainAssociationRequest
 @see AWSAmplifyDeleteDomainAssociationResult
 */
- (void)deleteDomainAssociation:(AWSAmplifyDeleteDomainAssociationRequest *)request completionHandler:(void (^ _Nullable)(AWSAmplifyDeleteDomainAssociationResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Deletes a job for a branch of an Amplify app. </p>
 
 @param request A container for the necessary parameters to execute the DeleteJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAmplifyDeleteJobResult`. On failed execution, `task.error` may contain an `NSError` with `AWSAmplifyErrorDomain` domain and the following error code: `AWSAmplifyErrorBadRequest`, `AWSAmplifyErrorUnauthorized`, `AWSAmplifyErrorInternalFailure`, `AWSAmplifyErrorNotFound`, `AWSAmplifyErrorLimitExceeded`.
 
 @see AWSAmplifyDeleteJobRequest
 @see AWSAmplifyDeleteJobResult
 */
- (AWSTask<AWSAmplifyDeleteJobResult *> *)deleteJob:(AWSAmplifyDeleteJobRequest *)request;

/**
 <p> Deletes a job for a branch of an Amplify app. </p>
 
 @param request A container for the necessary parameters to execute the DeleteJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAmplifyErrorDomain` domain and the following error code: `AWSAmplifyErrorBadRequest`, `AWSAmplifyErrorUnauthorized`, `AWSAmplifyErrorInternalFailure`, `AWSAmplifyErrorNotFound`, `AWSAmplifyErrorLimitExceeded`.
 
 @see AWSAmplifyDeleteJobRequest
 @see AWSAmplifyDeleteJobResult
 */
- (void)deleteJob:(AWSAmplifyDeleteJobRequest *)request completionHandler:(void (^ _Nullable)(AWSAmplifyDeleteJobResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Deletes a webhook. </p>
 
 @param request A container for the necessary parameters to execute the DeleteWebhook service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAmplifyDeleteWebhookResult`. On failed execution, `task.error` may contain an `NSError` with `AWSAmplifyErrorDomain` domain and the following error code: `AWSAmplifyErrorBadRequest`, `AWSAmplifyErrorUnauthorized`, `AWSAmplifyErrorInternalFailure`, `AWSAmplifyErrorNotFound`, `AWSAmplifyErrorLimitExceeded`.
 
 @see AWSAmplifyDeleteWebhookRequest
 @see AWSAmplifyDeleteWebhookResult
 */
- (AWSTask<AWSAmplifyDeleteWebhookResult *> *)deleteWebhook:(AWSAmplifyDeleteWebhookRequest *)request;

/**
 <p> Deletes a webhook. </p>
 
 @param request A container for the necessary parameters to execute the DeleteWebhook service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAmplifyErrorDomain` domain and the following error code: `AWSAmplifyErrorBadRequest`, `AWSAmplifyErrorUnauthorized`, `AWSAmplifyErrorInternalFailure`, `AWSAmplifyErrorNotFound`, `AWSAmplifyErrorLimitExceeded`.
 
 @see AWSAmplifyDeleteWebhookRequest
 @see AWSAmplifyDeleteWebhookResult
 */
- (void)deleteWebhook:(AWSAmplifyDeleteWebhookRequest *)request completionHandler:(void (^ _Nullable)(AWSAmplifyDeleteWebhookResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Returns the website access logs for a specific time range using a presigned URL. </p>
 
 @param request A container for the necessary parameters to execute the GenerateAccessLogs service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAmplifyGenerateAccessLogsResult`. On failed execution, `task.error` may contain an `NSError` with `AWSAmplifyErrorDomain` domain and the following error code: `AWSAmplifyErrorNotFound`, `AWSAmplifyErrorBadRequest`, `AWSAmplifyErrorUnauthorized`, `AWSAmplifyErrorInternalFailure`.
 
 @see AWSAmplifyGenerateAccessLogsRequest
 @see AWSAmplifyGenerateAccessLogsResult
 */
- (AWSTask<AWSAmplifyGenerateAccessLogsResult *> *)generateAccessLogs:(AWSAmplifyGenerateAccessLogsRequest *)request;

/**
 <p> Returns the website access logs for a specific time range using a presigned URL. </p>
 
 @param request A container for the necessary parameters to execute the GenerateAccessLogs service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAmplifyErrorDomain` domain and the following error code: `AWSAmplifyErrorNotFound`, `AWSAmplifyErrorBadRequest`, `AWSAmplifyErrorUnauthorized`, `AWSAmplifyErrorInternalFailure`.
 
 @see AWSAmplifyGenerateAccessLogsRequest
 @see AWSAmplifyGenerateAccessLogsResult
 */
- (void)generateAccessLogs:(AWSAmplifyGenerateAccessLogsRequest *)request completionHandler:(void (^ _Nullable)(AWSAmplifyGenerateAccessLogsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Returns an existing Amplify app by appID. </p>
 
 @param request A container for the necessary parameters to execute the GetApp service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAmplifyGetAppResult`. On failed execution, `task.error` may contain an `NSError` with `AWSAmplifyErrorDomain` domain and the following error code: `AWSAmplifyErrorBadRequest`, `AWSAmplifyErrorNotFound`, `AWSAmplifyErrorUnauthorized`, `AWSAmplifyErrorInternalFailure`.
 
 @see AWSAmplifyGetAppRequest
 @see AWSAmplifyGetAppResult
 */
- (AWSTask<AWSAmplifyGetAppResult *> *)getApp:(AWSAmplifyGetAppRequest *)request;

/**
 <p> Returns an existing Amplify app by appID. </p>
 
 @param request A container for the necessary parameters to execute the GetApp service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAmplifyErrorDomain` domain and the following error code: `AWSAmplifyErrorBadRequest`, `AWSAmplifyErrorNotFound`, `AWSAmplifyErrorUnauthorized`, `AWSAmplifyErrorInternalFailure`.
 
 @see AWSAmplifyGetAppRequest
 @see AWSAmplifyGetAppResult
 */
- (void)getApp:(AWSAmplifyGetAppRequest *)request completionHandler:(void (^ _Nullable)(AWSAmplifyGetAppResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Returns the artifact info that corresponds to an artifact id. </p>
 
 @param request A container for the necessary parameters to execute the GetArtifactUrl service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAmplifyGetArtifactUrlResult`. On failed execution, `task.error` may contain an `NSError` with `AWSAmplifyErrorDomain` domain and the following error code: `AWSAmplifyErrorBadRequest`, `AWSAmplifyErrorUnauthorized`, `AWSAmplifyErrorInternalFailure`, `AWSAmplifyErrorNotFound`, `AWSAmplifyErrorLimitExceeded`.
 
 @see AWSAmplifyGetArtifactUrlRequest
 @see AWSAmplifyGetArtifactUrlResult
 */
- (AWSTask<AWSAmplifyGetArtifactUrlResult *> *)getArtifactUrl:(AWSAmplifyGetArtifactUrlRequest *)request;

/**
 <p> Returns the artifact info that corresponds to an artifact id. </p>
 
 @param request A container for the necessary parameters to execute the GetArtifactUrl service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAmplifyErrorDomain` domain and the following error code: `AWSAmplifyErrorBadRequest`, `AWSAmplifyErrorUnauthorized`, `AWSAmplifyErrorInternalFailure`, `AWSAmplifyErrorNotFound`, `AWSAmplifyErrorLimitExceeded`.
 
 @see AWSAmplifyGetArtifactUrlRequest
 @see AWSAmplifyGetArtifactUrlResult
 */
- (void)getArtifactUrl:(AWSAmplifyGetArtifactUrlRequest *)request completionHandler:(void (^ _Nullable)(AWSAmplifyGetArtifactUrlResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Returns a backend environment for an Amplify app. </p>
 
 @param request A container for the necessary parameters to execute the GetBackendEnvironment service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAmplifyGetBackendEnvironmentResult`. On failed execution, `task.error` may contain an `NSError` with `AWSAmplifyErrorDomain` domain and the following error code: `AWSAmplifyErrorBadRequest`, `AWSAmplifyErrorUnauthorized`, `AWSAmplifyErrorNotFound`, `AWSAmplifyErrorInternalFailure`.
 
 @see AWSAmplifyGetBackendEnvironmentRequest
 @see AWSAmplifyGetBackendEnvironmentResult
 */
- (AWSTask<AWSAmplifyGetBackendEnvironmentResult *> *)getBackendEnvironment:(AWSAmplifyGetBackendEnvironmentRequest *)request;

/**
 <p> Returns a backend environment for an Amplify app. </p>
 
 @param request A container for the necessary parameters to execute the GetBackendEnvironment service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAmplifyErrorDomain` domain and the following error code: `AWSAmplifyErrorBadRequest`, `AWSAmplifyErrorUnauthorized`, `AWSAmplifyErrorNotFound`, `AWSAmplifyErrorInternalFailure`.
 
 @see AWSAmplifyGetBackendEnvironmentRequest
 @see AWSAmplifyGetBackendEnvironmentResult
 */
- (void)getBackendEnvironment:(AWSAmplifyGetBackendEnvironmentRequest *)request completionHandler:(void (^ _Nullable)(AWSAmplifyGetBackendEnvironmentResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Returns a branch for an Amplify app. </p>
 
 @param request A container for the necessary parameters to execute the GetBranch service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAmplifyGetBranchResult`. On failed execution, `task.error` may contain an `NSError` with `AWSAmplifyErrorDomain` domain and the following error code: `AWSAmplifyErrorBadRequest`, `AWSAmplifyErrorUnauthorized`, `AWSAmplifyErrorNotFound`, `AWSAmplifyErrorInternalFailure`.
 
 @see AWSAmplifyGetBranchRequest
 @see AWSAmplifyGetBranchResult
 */
- (AWSTask<AWSAmplifyGetBranchResult *> *)getBranch:(AWSAmplifyGetBranchRequest *)request;

/**
 <p> Returns a branch for an Amplify app. </p>
 
 @param request A container for the necessary parameters to execute the GetBranch service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAmplifyErrorDomain` domain and the following error code: `AWSAmplifyErrorBadRequest`, `AWSAmplifyErrorUnauthorized`, `AWSAmplifyErrorNotFound`, `AWSAmplifyErrorInternalFailure`.
 
 @see AWSAmplifyGetBranchRequest
 @see AWSAmplifyGetBranchResult
 */
- (void)getBranch:(AWSAmplifyGetBranchRequest *)request completionHandler:(void (^ _Nullable)(AWSAmplifyGetBranchResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Returns the domain information for an Amplify app. </p>
 
 @param request A container for the necessary parameters to execute the GetDomainAssociation service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAmplifyGetDomainAssociationResult`. On failed execution, `task.error` may contain an `NSError` with `AWSAmplifyErrorDomain` domain and the following error code: `AWSAmplifyErrorBadRequest`, `AWSAmplifyErrorUnauthorized`, `AWSAmplifyErrorNotFound`, `AWSAmplifyErrorInternalFailure`.
 
 @see AWSAmplifyGetDomainAssociationRequest
 @see AWSAmplifyGetDomainAssociationResult
 */
- (AWSTask<AWSAmplifyGetDomainAssociationResult *> *)getDomainAssociation:(AWSAmplifyGetDomainAssociationRequest *)request;

/**
 <p> Returns the domain information for an Amplify app. </p>
 
 @param request A container for the necessary parameters to execute the GetDomainAssociation service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAmplifyErrorDomain` domain and the following error code: `AWSAmplifyErrorBadRequest`, `AWSAmplifyErrorUnauthorized`, `AWSAmplifyErrorNotFound`, `AWSAmplifyErrorInternalFailure`.
 
 @see AWSAmplifyGetDomainAssociationRequest
 @see AWSAmplifyGetDomainAssociationResult
 */
- (void)getDomainAssociation:(AWSAmplifyGetDomainAssociationRequest *)request completionHandler:(void (^ _Nullable)(AWSAmplifyGetDomainAssociationResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Returns a job for a branch of an Amplify app. </p>
 
 @param request A container for the necessary parameters to execute the GetJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAmplifyGetJobResult`. On failed execution, `task.error` may contain an `NSError` with `AWSAmplifyErrorDomain` domain and the following error code: `AWSAmplifyErrorBadRequest`, `AWSAmplifyErrorUnauthorized`, `AWSAmplifyErrorInternalFailure`, `AWSAmplifyErrorNotFound`, `AWSAmplifyErrorLimitExceeded`.
 
 @see AWSAmplifyGetJobRequest
 @see AWSAmplifyGetJobResult
 */
- (AWSTask<AWSAmplifyGetJobResult *> *)getJob:(AWSAmplifyGetJobRequest *)request;

/**
 <p> Returns a job for a branch of an Amplify app. </p>
 
 @param request A container for the necessary parameters to execute the GetJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAmplifyErrorDomain` domain and the following error code: `AWSAmplifyErrorBadRequest`, `AWSAmplifyErrorUnauthorized`, `AWSAmplifyErrorInternalFailure`, `AWSAmplifyErrorNotFound`, `AWSAmplifyErrorLimitExceeded`.
 
 @see AWSAmplifyGetJobRequest
 @see AWSAmplifyGetJobResult
 */
- (void)getJob:(AWSAmplifyGetJobRequest *)request completionHandler:(void (^ _Nullable)(AWSAmplifyGetJobResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Returns the webhook information that corresponds to a specified webhook ID. </p>
 
 @param request A container for the necessary parameters to execute the GetWebhook service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAmplifyGetWebhookResult`. On failed execution, `task.error` may contain an `NSError` with `AWSAmplifyErrorDomain` domain and the following error code: `AWSAmplifyErrorBadRequest`, `AWSAmplifyErrorUnauthorized`, `AWSAmplifyErrorInternalFailure`, `AWSAmplifyErrorNotFound`, `AWSAmplifyErrorLimitExceeded`.
 
 @see AWSAmplifyGetWebhookRequest
 @see AWSAmplifyGetWebhookResult
 */
- (AWSTask<AWSAmplifyGetWebhookResult *> *)getWebhook:(AWSAmplifyGetWebhookRequest *)request;

/**
 <p> Returns the webhook information that corresponds to a specified webhook ID. </p>
 
 @param request A container for the necessary parameters to execute the GetWebhook service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAmplifyErrorDomain` domain and the following error code: `AWSAmplifyErrorBadRequest`, `AWSAmplifyErrorUnauthorized`, `AWSAmplifyErrorInternalFailure`, `AWSAmplifyErrorNotFound`, `AWSAmplifyErrorLimitExceeded`.
 
 @see AWSAmplifyGetWebhookRequest
 @see AWSAmplifyGetWebhookResult
 */
- (void)getWebhook:(AWSAmplifyGetWebhookRequest *)request completionHandler:(void (^ _Nullable)(AWSAmplifyGetWebhookResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Returns a list of the existing Amplify apps. </p>
 
 @param request A container for the necessary parameters to execute the ListApps service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAmplifyListAppsResult`. On failed execution, `task.error` may contain an `NSError` with `AWSAmplifyErrorDomain` domain and the following error code: `AWSAmplifyErrorBadRequest`, `AWSAmplifyErrorUnauthorized`, `AWSAmplifyErrorInternalFailure`.
 
 @see AWSAmplifyListAppsRequest
 @see AWSAmplifyListAppsResult
 */
- (AWSTask<AWSAmplifyListAppsResult *> *)listApps:(AWSAmplifyListAppsRequest *)request;

/**
 <p> Returns a list of the existing Amplify apps. </p>
 
 @param request A container for the necessary parameters to execute the ListApps service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAmplifyErrorDomain` domain and the following error code: `AWSAmplifyErrorBadRequest`, `AWSAmplifyErrorUnauthorized`, `AWSAmplifyErrorInternalFailure`.
 
 @see AWSAmplifyListAppsRequest
 @see AWSAmplifyListAppsResult
 */
- (void)listApps:(AWSAmplifyListAppsRequest *)request completionHandler:(void (^ _Nullable)(AWSAmplifyListAppsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Returns a list of artifacts for a specified app, branch, and job. </p>
 
 @param request A container for the necessary parameters to execute the ListArtifacts service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAmplifyListArtifactsResult`. On failed execution, `task.error` may contain an `NSError` with `AWSAmplifyErrorDomain` domain and the following error code: `AWSAmplifyErrorBadRequest`, `AWSAmplifyErrorUnauthorized`, `AWSAmplifyErrorInternalFailure`, `AWSAmplifyErrorLimitExceeded`.
 
 @see AWSAmplifyListArtifactsRequest
 @see AWSAmplifyListArtifactsResult
 */
- (AWSTask<AWSAmplifyListArtifactsResult *> *)listArtifacts:(AWSAmplifyListArtifactsRequest *)request;

/**
 <p> Returns a list of artifacts for a specified app, branch, and job. </p>
 
 @param request A container for the necessary parameters to execute the ListArtifacts service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAmplifyErrorDomain` domain and the following error code: `AWSAmplifyErrorBadRequest`, `AWSAmplifyErrorUnauthorized`, `AWSAmplifyErrorInternalFailure`, `AWSAmplifyErrorLimitExceeded`.
 
 @see AWSAmplifyListArtifactsRequest
 @see AWSAmplifyListArtifactsResult
 */
- (void)listArtifacts:(AWSAmplifyListArtifactsRequest *)request completionHandler:(void (^ _Nullable)(AWSAmplifyListArtifactsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Lists the backend environments for an Amplify app. </p>
 
 @param request A container for the necessary parameters to execute the ListBackendEnvironments service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAmplifyListBackendEnvironmentsResult`. On failed execution, `task.error` may contain an `NSError` with `AWSAmplifyErrorDomain` domain and the following error code: `AWSAmplifyErrorBadRequest`, `AWSAmplifyErrorUnauthorized`, `AWSAmplifyErrorInternalFailure`.
 
 @see AWSAmplifyListBackendEnvironmentsRequest
 @see AWSAmplifyListBackendEnvironmentsResult
 */
- (AWSTask<AWSAmplifyListBackendEnvironmentsResult *> *)listBackendEnvironments:(AWSAmplifyListBackendEnvironmentsRequest *)request;

/**
 <p> Lists the backend environments for an Amplify app. </p>
 
 @param request A container for the necessary parameters to execute the ListBackendEnvironments service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAmplifyErrorDomain` domain and the following error code: `AWSAmplifyErrorBadRequest`, `AWSAmplifyErrorUnauthorized`, `AWSAmplifyErrorInternalFailure`.
 
 @see AWSAmplifyListBackendEnvironmentsRequest
 @see AWSAmplifyListBackendEnvironmentsResult
 */
- (void)listBackendEnvironments:(AWSAmplifyListBackendEnvironmentsRequest *)request completionHandler:(void (^ _Nullable)(AWSAmplifyListBackendEnvironmentsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Lists the branches of an Amplify app. </p>
 
 @param request A container for the necessary parameters to execute the ListBranches service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAmplifyListBranchesResult`. On failed execution, `task.error` may contain an `NSError` with `AWSAmplifyErrorDomain` domain and the following error code: `AWSAmplifyErrorBadRequest`, `AWSAmplifyErrorUnauthorized`, `AWSAmplifyErrorInternalFailure`.
 
 @see AWSAmplifyListBranchesRequest
 @see AWSAmplifyListBranchesResult
 */
- (AWSTask<AWSAmplifyListBranchesResult *> *)listBranches:(AWSAmplifyListBranchesRequest *)request;

/**
 <p> Lists the branches of an Amplify app. </p>
 
 @param request A container for the necessary parameters to execute the ListBranches service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAmplifyErrorDomain` domain and the following error code: `AWSAmplifyErrorBadRequest`, `AWSAmplifyErrorUnauthorized`, `AWSAmplifyErrorInternalFailure`.
 
 @see AWSAmplifyListBranchesRequest
 @see AWSAmplifyListBranchesResult
 */
- (void)listBranches:(AWSAmplifyListBranchesRequest *)request completionHandler:(void (^ _Nullable)(AWSAmplifyListBranchesResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Returns the domain associations for an Amplify app. </p>
 
 @param request A container for the necessary parameters to execute the ListDomainAssociations service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAmplifyListDomainAssociationsResult`. On failed execution, `task.error` may contain an `NSError` with `AWSAmplifyErrorDomain` domain and the following error code: `AWSAmplifyErrorBadRequest`, `AWSAmplifyErrorUnauthorized`, `AWSAmplifyErrorInternalFailure`.
 
 @see AWSAmplifyListDomainAssociationsRequest
 @see AWSAmplifyListDomainAssociationsResult
 */
- (AWSTask<AWSAmplifyListDomainAssociationsResult *> *)listDomainAssociations:(AWSAmplifyListDomainAssociationsRequest *)request;

/**
 <p> Returns the domain associations for an Amplify app. </p>
 
 @param request A container for the necessary parameters to execute the ListDomainAssociations service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAmplifyErrorDomain` domain and the following error code: `AWSAmplifyErrorBadRequest`, `AWSAmplifyErrorUnauthorized`, `AWSAmplifyErrorInternalFailure`.
 
 @see AWSAmplifyListDomainAssociationsRequest
 @see AWSAmplifyListDomainAssociationsResult
 */
- (void)listDomainAssociations:(AWSAmplifyListDomainAssociationsRequest *)request completionHandler:(void (^ _Nullable)(AWSAmplifyListDomainAssociationsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Lists the jobs for a branch of an Amplify app. </p>
 
 @param request A container for the necessary parameters to execute the ListJobs service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAmplifyListJobsResult`. On failed execution, `task.error` may contain an `NSError` with `AWSAmplifyErrorDomain` domain and the following error code: `AWSAmplifyErrorBadRequest`, `AWSAmplifyErrorUnauthorized`, `AWSAmplifyErrorInternalFailure`, `AWSAmplifyErrorLimitExceeded`.
 
 @see AWSAmplifyListJobsRequest
 @see AWSAmplifyListJobsResult
 */
- (AWSTask<AWSAmplifyListJobsResult *> *)listJobs:(AWSAmplifyListJobsRequest *)request;

/**
 <p> Lists the jobs for a branch of an Amplify app. </p>
 
 @param request A container for the necessary parameters to execute the ListJobs service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAmplifyErrorDomain` domain and the following error code: `AWSAmplifyErrorBadRequest`, `AWSAmplifyErrorUnauthorized`, `AWSAmplifyErrorInternalFailure`, `AWSAmplifyErrorLimitExceeded`.
 
 @see AWSAmplifyListJobsRequest
 @see AWSAmplifyListJobsResult
 */
- (void)listJobs:(AWSAmplifyListJobsRequest *)request completionHandler:(void (^ _Nullable)(AWSAmplifyListJobsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Returns a list of tags for a specified Amazon Resource Name (ARN). </p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAmplifyListTagsForResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSAmplifyErrorDomain` domain and the following error code: `AWSAmplifyErrorInternalFailure`, `AWSAmplifyErrorBadRequest`, `AWSAmplifyErrorResourceNotFound`.
 
 @see AWSAmplifyListTagsForResourceRequest
 @see AWSAmplifyListTagsForResourceResponse
 */
- (AWSTask<AWSAmplifyListTagsForResourceResponse *> *)listTagsForResource:(AWSAmplifyListTagsForResourceRequest *)request;

/**
 <p> Returns a list of tags for a specified Amazon Resource Name (ARN). </p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAmplifyErrorDomain` domain and the following error code: `AWSAmplifyErrorInternalFailure`, `AWSAmplifyErrorBadRequest`, `AWSAmplifyErrorResourceNotFound`.
 
 @see AWSAmplifyListTagsForResourceRequest
 @see AWSAmplifyListTagsForResourceResponse
 */
- (void)listTagsForResource:(AWSAmplifyListTagsForResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSAmplifyListTagsForResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Returns a list of webhooks for an Amplify app. </p>
 
 @param request A container for the necessary parameters to execute the ListWebhooks service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAmplifyListWebhooksResult`. On failed execution, `task.error` may contain an `NSError` with `AWSAmplifyErrorDomain` domain and the following error code: `AWSAmplifyErrorBadRequest`, `AWSAmplifyErrorUnauthorized`, `AWSAmplifyErrorInternalFailure`, `AWSAmplifyErrorLimitExceeded`.
 
 @see AWSAmplifyListWebhooksRequest
 @see AWSAmplifyListWebhooksResult
 */
- (AWSTask<AWSAmplifyListWebhooksResult *> *)listWebhooks:(AWSAmplifyListWebhooksRequest *)request;

/**
 <p> Returns a list of webhooks for an Amplify app. </p>
 
 @param request A container for the necessary parameters to execute the ListWebhooks service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAmplifyErrorDomain` domain and the following error code: `AWSAmplifyErrorBadRequest`, `AWSAmplifyErrorUnauthorized`, `AWSAmplifyErrorInternalFailure`, `AWSAmplifyErrorLimitExceeded`.
 
 @see AWSAmplifyListWebhooksRequest
 @see AWSAmplifyListWebhooksResult
 */
- (void)listWebhooks:(AWSAmplifyListWebhooksRequest *)request completionHandler:(void (^ _Nullable)(AWSAmplifyListWebhooksResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Starts a deployment for a manually deployed app. Manually deployed apps are not connected to a repository. </p>
 
 @param request A container for the necessary parameters to execute the StartDeployment service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAmplifyStartDeploymentResult`. On failed execution, `task.error` may contain an `NSError` with `AWSAmplifyErrorDomain` domain and the following error code: `AWSAmplifyErrorBadRequest`, `AWSAmplifyErrorUnauthorized`, `AWSAmplifyErrorInternalFailure`, `AWSAmplifyErrorNotFound`, `AWSAmplifyErrorLimitExceeded`.
 
 @see AWSAmplifyStartDeploymentRequest
 @see AWSAmplifyStartDeploymentResult
 */
- (AWSTask<AWSAmplifyStartDeploymentResult *> *)startDeployment:(AWSAmplifyStartDeploymentRequest *)request;

/**
 <p> Starts a deployment for a manually deployed app. Manually deployed apps are not connected to a repository. </p>
 
 @param request A container for the necessary parameters to execute the StartDeployment service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAmplifyErrorDomain` domain and the following error code: `AWSAmplifyErrorBadRequest`, `AWSAmplifyErrorUnauthorized`, `AWSAmplifyErrorInternalFailure`, `AWSAmplifyErrorNotFound`, `AWSAmplifyErrorLimitExceeded`.
 
 @see AWSAmplifyStartDeploymentRequest
 @see AWSAmplifyStartDeploymentResult
 */
- (void)startDeployment:(AWSAmplifyStartDeploymentRequest *)request completionHandler:(void (^ _Nullable)(AWSAmplifyStartDeploymentResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Starts a new job for a branch of an Amplify app. </p>
 
 @param request A container for the necessary parameters to execute the StartJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAmplifyStartJobResult`. On failed execution, `task.error` may contain an `NSError` with `AWSAmplifyErrorDomain` domain and the following error code: `AWSAmplifyErrorBadRequest`, `AWSAmplifyErrorUnauthorized`, `AWSAmplifyErrorInternalFailure`, `AWSAmplifyErrorNotFound`, `AWSAmplifyErrorLimitExceeded`.
 
 @see AWSAmplifyStartJobRequest
 @see AWSAmplifyStartJobResult
 */
- (AWSTask<AWSAmplifyStartJobResult *> *)startJob:(AWSAmplifyStartJobRequest *)request;

/**
 <p> Starts a new job for a branch of an Amplify app. </p>
 
 @param request A container for the necessary parameters to execute the StartJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAmplifyErrorDomain` domain and the following error code: `AWSAmplifyErrorBadRequest`, `AWSAmplifyErrorUnauthorized`, `AWSAmplifyErrorInternalFailure`, `AWSAmplifyErrorNotFound`, `AWSAmplifyErrorLimitExceeded`.
 
 @see AWSAmplifyStartJobRequest
 @see AWSAmplifyStartJobResult
 */
- (void)startJob:(AWSAmplifyStartJobRequest *)request completionHandler:(void (^ _Nullable)(AWSAmplifyStartJobResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Stops a job that is in progress for a branch of an Amplify app. </p>
 
 @param request A container for the necessary parameters to execute the StopJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAmplifyStopJobResult`. On failed execution, `task.error` may contain an `NSError` with `AWSAmplifyErrorDomain` domain and the following error code: `AWSAmplifyErrorBadRequest`, `AWSAmplifyErrorUnauthorized`, `AWSAmplifyErrorInternalFailure`, `AWSAmplifyErrorNotFound`, `AWSAmplifyErrorLimitExceeded`.
 
 @see AWSAmplifyStopJobRequest
 @see AWSAmplifyStopJobResult
 */
- (AWSTask<AWSAmplifyStopJobResult *> *)stopJob:(AWSAmplifyStopJobRequest *)request;

/**
 <p> Stops a job that is in progress for a branch of an Amplify app. </p>
 
 @param request A container for the necessary parameters to execute the StopJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAmplifyErrorDomain` domain and the following error code: `AWSAmplifyErrorBadRequest`, `AWSAmplifyErrorUnauthorized`, `AWSAmplifyErrorInternalFailure`, `AWSAmplifyErrorNotFound`, `AWSAmplifyErrorLimitExceeded`.
 
 @see AWSAmplifyStopJobRequest
 @see AWSAmplifyStopJobResult
 */
- (void)stopJob:(AWSAmplifyStopJobRequest *)request completionHandler:(void (^ _Nullable)(AWSAmplifyStopJobResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Tags the resource with a tag key and value. </p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAmplifyTagResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSAmplifyErrorDomain` domain and the following error code: `AWSAmplifyErrorInternalFailure`, `AWSAmplifyErrorBadRequest`, `AWSAmplifyErrorResourceNotFound`.
 
 @see AWSAmplifyTagResourceRequest
 @see AWSAmplifyTagResourceResponse
 */
- (AWSTask<AWSAmplifyTagResourceResponse *> *)tagResource:(AWSAmplifyTagResourceRequest *)request;

/**
 <p> Tags the resource with a tag key and value. </p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAmplifyErrorDomain` domain and the following error code: `AWSAmplifyErrorInternalFailure`, `AWSAmplifyErrorBadRequest`, `AWSAmplifyErrorResourceNotFound`.
 
 @see AWSAmplifyTagResourceRequest
 @see AWSAmplifyTagResourceResponse
 */
- (void)tagResource:(AWSAmplifyTagResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSAmplifyTagResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Untags a resource with a specified Amazon Resource Name (ARN). </p>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAmplifyUntagResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSAmplifyErrorDomain` domain and the following error code: `AWSAmplifyErrorInternalFailure`, `AWSAmplifyErrorBadRequest`, `AWSAmplifyErrorResourceNotFound`.
 
 @see AWSAmplifyUntagResourceRequest
 @see AWSAmplifyUntagResourceResponse
 */
- (AWSTask<AWSAmplifyUntagResourceResponse *> *)untagResource:(AWSAmplifyUntagResourceRequest *)request;

/**
 <p> Untags a resource with a specified Amazon Resource Name (ARN). </p>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAmplifyErrorDomain` domain and the following error code: `AWSAmplifyErrorInternalFailure`, `AWSAmplifyErrorBadRequest`, `AWSAmplifyErrorResourceNotFound`.
 
 @see AWSAmplifyUntagResourceRequest
 @see AWSAmplifyUntagResourceResponse
 */
- (void)untagResource:(AWSAmplifyUntagResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSAmplifyUntagResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Updates an existing Amplify app. </p>
 
 @param request A container for the necessary parameters to execute the UpdateApp service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAmplifyUpdateAppResult`. On failed execution, `task.error` may contain an `NSError` with `AWSAmplifyErrorDomain` domain and the following error code: `AWSAmplifyErrorBadRequest`, `AWSAmplifyErrorNotFound`, `AWSAmplifyErrorUnauthorized`, `AWSAmplifyErrorInternalFailure`.
 
 @see AWSAmplifyUpdateAppRequest
 @see AWSAmplifyUpdateAppResult
 */
- (AWSTask<AWSAmplifyUpdateAppResult *> *)updateApp:(AWSAmplifyUpdateAppRequest *)request;

/**
 <p> Updates an existing Amplify app. </p>
 
 @param request A container for the necessary parameters to execute the UpdateApp service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAmplifyErrorDomain` domain and the following error code: `AWSAmplifyErrorBadRequest`, `AWSAmplifyErrorNotFound`, `AWSAmplifyErrorUnauthorized`, `AWSAmplifyErrorInternalFailure`.
 
 @see AWSAmplifyUpdateAppRequest
 @see AWSAmplifyUpdateAppResult
 */
- (void)updateApp:(AWSAmplifyUpdateAppRequest *)request completionHandler:(void (^ _Nullable)(AWSAmplifyUpdateAppResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Updates a branch for an Amplify app. </p>
 
 @param request A container for the necessary parameters to execute the UpdateBranch service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAmplifyUpdateBranchResult`. On failed execution, `task.error` may contain an `NSError` with `AWSAmplifyErrorDomain` domain and the following error code: `AWSAmplifyErrorBadRequest`, `AWSAmplifyErrorUnauthorized`, `AWSAmplifyErrorNotFound`, `AWSAmplifyErrorInternalFailure`, `AWSAmplifyErrorDependentServiceFailure`.
 
 @see AWSAmplifyUpdateBranchRequest
 @see AWSAmplifyUpdateBranchResult
 */
- (AWSTask<AWSAmplifyUpdateBranchResult *> *)updateBranch:(AWSAmplifyUpdateBranchRequest *)request;

/**
 <p> Updates a branch for an Amplify app. </p>
 
 @param request A container for the necessary parameters to execute the UpdateBranch service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAmplifyErrorDomain` domain and the following error code: `AWSAmplifyErrorBadRequest`, `AWSAmplifyErrorUnauthorized`, `AWSAmplifyErrorNotFound`, `AWSAmplifyErrorInternalFailure`, `AWSAmplifyErrorDependentServiceFailure`.
 
 @see AWSAmplifyUpdateBranchRequest
 @see AWSAmplifyUpdateBranchResult
 */
- (void)updateBranch:(AWSAmplifyUpdateBranchRequest *)request completionHandler:(void (^ _Nullable)(AWSAmplifyUpdateBranchResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Creates a new domain association for an Amplify app.</p>
 
 @param request A container for the necessary parameters to execute the UpdateDomainAssociation service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAmplifyUpdateDomainAssociationResult`. On failed execution, `task.error` may contain an `NSError` with `AWSAmplifyErrorDomain` domain and the following error code: `AWSAmplifyErrorBadRequest`, `AWSAmplifyErrorUnauthorized`, `AWSAmplifyErrorNotFound`, `AWSAmplifyErrorInternalFailure`, `AWSAmplifyErrorDependentServiceFailure`.
 
 @see AWSAmplifyUpdateDomainAssociationRequest
 @see AWSAmplifyUpdateDomainAssociationResult
 */
- (AWSTask<AWSAmplifyUpdateDomainAssociationResult *> *)updateDomainAssociation:(AWSAmplifyUpdateDomainAssociationRequest *)request;

/**
 <p> Creates a new domain association for an Amplify app.</p>
 
 @param request A container for the necessary parameters to execute the UpdateDomainAssociation service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAmplifyErrorDomain` domain and the following error code: `AWSAmplifyErrorBadRequest`, `AWSAmplifyErrorUnauthorized`, `AWSAmplifyErrorNotFound`, `AWSAmplifyErrorInternalFailure`, `AWSAmplifyErrorDependentServiceFailure`.
 
 @see AWSAmplifyUpdateDomainAssociationRequest
 @see AWSAmplifyUpdateDomainAssociationResult
 */
- (void)updateDomainAssociation:(AWSAmplifyUpdateDomainAssociationRequest *)request completionHandler:(void (^ _Nullable)(AWSAmplifyUpdateDomainAssociationResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Updates a webhook. </p>
 
 @param request A container for the necessary parameters to execute the UpdateWebhook service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAmplifyUpdateWebhookResult`. On failed execution, `task.error` may contain an `NSError` with `AWSAmplifyErrorDomain` domain and the following error code: `AWSAmplifyErrorBadRequest`, `AWSAmplifyErrorUnauthorized`, `AWSAmplifyErrorNotFound`, `AWSAmplifyErrorInternalFailure`, `AWSAmplifyErrorDependentServiceFailure`.
 
 @see AWSAmplifyUpdateWebhookRequest
 @see AWSAmplifyUpdateWebhookResult
 */
- (AWSTask<AWSAmplifyUpdateWebhookResult *> *)updateWebhook:(AWSAmplifyUpdateWebhookRequest *)request;

/**
 <p> Updates a webhook. </p>
 
 @param request A container for the necessary parameters to execute the UpdateWebhook service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAmplifyErrorDomain` domain and the following error code: `AWSAmplifyErrorBadRequest`, `AWSAmplifyErrorUnauthorized`, `AWSAmplifyErrorNotFound`, `AWSAmplifyErrorInternalFailure`, `AWSAmplifyErrorDependentServiceFailure`.
 
 @see AWSAmplifyUpdateWebhookRequest
 @see AWSAmplifyUpdateWebhookResult
 */
- (void)updateWebhook:(AWSAmplifyUpdateWebhookRequest *)request completionHandler:(void (^ _Nullable)(AWSAmplifyUpdateWebhookResult * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
