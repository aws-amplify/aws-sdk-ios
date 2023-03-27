//
// Copyright 2010-2023 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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
#import "AWSChimeSDKIdentityModel.h"
#import "AWSChimeSDKIdentityResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSChimeSDKIdentity
FOUNDATION_EXPORT NSString *const AWSChimeSDKIdentitySDKVersion;

/**
 <p>The Amazon Chime SDK Identity APIs in this section allow software developers to create and manage unique instances of their messaging applications. These APIs provide the overarching framework for creating and sending messages. For more information about the identity APIs, refer to <a href="https://docs.aws.amazon.com/chime/latest/APIReference/API_Operations_Amazon_Chime_SDK_Identity.html">Amazon Chime SDK identity</a>.</p>
 */
@interface AWSChimeSDKIdentity : AWSService

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

     let ChimeSDKIdentity = AWSChimeSDKIdentity.default()

 *Objective-C*

     AWSChimeSDKIdentity *ChimeSDKIdentity = [AWSChimeSDKIdentity defaultChimeSDKIdentity];

 @return The default service client.
 */
+ (instancetype)defaultChimeSDKIdentity;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSChimeSDKIdentity.register(with: configuration!, forKey: "USWest2ChimeSDKIdentity")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSChimeSDKIdentity registerChimeSDKIdentityWithConfiguration:configuration forKey:@"USWest2ChimeSDKIdentity"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let ChimeSDKIdentity = AWSChimeSDKIdentity(forKey: "USWest2ChimeSDKIdentity")

 *Objective-C*

     AWSChimeSDKIdentity *ChimeSDKIdentity = [AWSChimeSDKIdentity ChimeSDKIdentityForKey:@"USWest2ChimeSDKIdentity"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerChimeSDKIdentityWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerChimeSDKIdentityWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSChimeSDKIdentity.register(with: configuration!, forKey: "USWest2ChimeSDKIdentity")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSChimeSDKIdentity registerChimeSDKIdentityWithConfiguration:configuration forKey:@"USWest2ChimeSDKIdentity"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let ChimeSDKIdentity = AWSChimeSDKIdentity(forKey: "USWest2ChimeSDKIdentity")

 *Objective-C*

     AWSChimeSDKIdentity *ChimeSDKIdentity = [AWSChimeSDKIdentity ChimeSDKIdentityForKey:@"USWest2ChimeSDKIdentity"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)ChimeSDKIdentityForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removeChimeSDKIdentityForKey:(NSString *)key;

/**
 <p>Creates an Amazon Chime SDK messaging <code>AppInstance</code> under an AWS account. Only SDK messaging customers use this API. <code>CreateAppInstance</code> supports idempotency behavior as described in the AWS API Standard.</p><p>identity</p>
 
 @param request A container for the necessary parameters to execute the CreateAppInstance service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimeSDKIdentityCreateAppInstanceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeSDKIdentityErrorDomain` domain and the following error code: `AWSChimeSDKIdentityErrorBadRequest`, `AWSChimeSDKIdentityErrorConflict`, `AWSChimeSDKIdentityErrorForbidden`, `AWSChimeSDKIdentityErrorResourceLimitExceeded`, `AWSChimeSDKIdentityErrorThrottledClient`, `AWSChimeSDKIdentityErrorUnauthorizedClient`, `AWSChimeSDKIdentityErrorServiceUnavailable`, `AWSChimeSDKIdentityErrorServiceFailure`.
 
 @see AWSChimeSDKIdentityCreateAppInstanceRequest
 @see AWSChimeSDKIdentityCreateAppInstanceResponse
 */
- (AWSTask<AWSChimeSDKIdentityCreateAppInstanceResponse *> *)createAppInstance:(AWSChimeSDKIdentityCreateAppInstanceRequest *)request;

/**
 <p>Creates an Amazon Chime SDK messaging <code>AppInstance</code> under an AWS account. Only SDK messaging customers use this API. <code>CreateAppInstance</code> supports idempotency behavior as described in the AWS API Standard.</p><p>identity</p>
 
 @param request A container for the necessary parameters to execute the CreateAppInstance service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeSDKIdentityErrorDomain` domain and the following error code: `AWSChimeSDKIdentityErrorBadRequest`, `AWSChimeSDKIdentityErrorConflict`, `AWSChimeSDKIdentityErrorForbidden`, `AWSChimeSDKIdentityErrorResourceLimitExceeded`, `AWSChimeSDKIdentityErrorThrottledClient`, `AWSChimeSDKIdentityErrorUnauthorizedClient`, `AWSChimeSDKIdentityErrorServiceUnavailable`, `AWSChimeSDKIdentityErrorServiceFailure`.
 
 @see AWSChimeSDKIdentityCreateAppInstanceRequest
 @see AWSChimeSDKIdentityCreateAppInstanceResponse
 */
- (void)createAppInstance:(AWSChimeSDKIdentityCreateAppInstanceRequest *)request completionHandler:(void (^ _Nullable)(AWSChimeSDKIdentityCreateAppInstanceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Promotes an <code>AppInstanceUser</code> or <code>AppInstanceBot</code> to an <code>AppInstanceAdmin</code>. The promoted entity can perform the following actions. </p><ul><li><p><code>ChannelModerator</code> actions across all channels in the <code>AppInstance</code>.</p></li><li><p><code>DeleteChannelMessage</code> actions.</p></li></ul><p>Only an <code>AppInstanceUser</code> and <code>AppInstanceBot</code> can be promoted to an <code>AppInstanceAdmin</code> role.</p>
 
 @param request A container for the necessary parameters to execute the CreateAppInstanceAdmin service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimeSDKIdentityCreateAppInstanceAdminResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeSDKIdentityErrorDomain` domain and the following error code: `AWSChimeSDKIdentityErrorBadRequest`, `AWSChimeSDKIdentityErrorConflict`, `AWSChimeSDKIdentityErrorForbidden`, `AWSChimeSDKIdentityErrorResourceLimitExceeded`, `AWSChimeSDKIdentityErrorThrottledClient`, `AWSChimeSDKIdentityErrorUnauthorizedClient`, `AWSChimeSDKIdentityErrorServiceUnavailable`, `AWSChimeSDKIdentityErrorServiceFailure`.
 
 @see AWSChimeSDKIdentityCreateAppInstanceAdminRequest
 @see AWSChimeSDKIdentityCreateAppInstanceAdminResponse
 */
- (AWSTask<AWSChimeSDKIdentityCreateAppInstanceAdminResponse *> *)createAppInstanceAdmin:(AWSChimeSDKIdentityCreateAppInstanceAdminRequest *)request;

/**
 <p>Promotes an <code>AppInstanceUser</code> or <code>AppInstanceBot</code> to an <code>AppInstanceAdmin</code>. The promoted entity can perform the following actions. </p><ul><li><p><code>ChannelModerator</code> actions across all channels in the <code>AppInstance</code>.</p></li><li><p><code>DeleteChannelMessage</code> actions.</p></li></ul><p>Only an <code>AppInstanceUser</code> and <code>AppInstanceBot</code> can be promoted to an <code>AppInstanceAdmin</code> role.</p>
 
 @param request A container for the necessary parameters to execute the CreateAppInstanceAdmin service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeSDKIdentityErrorDomain` domain and the following error code: `AWSChimeSDKIdentityErrorBadRequest`, `AWSChimeSDKIdentityErrorConflict`, `AWSChimeSDKIdentityErrorForbidden`, `AWSChimeSDKIdentityErrorResourceLimitExceeded`, `AWSChimeSDKIdentityErrorThrottledClient`, `AWSChimeSDKIdentityErrorUnauthorizedClient`, `AWSChimeSDKIdentityErrorServiceUnavailable`, `AWSChimeSDKIdentityErrorServiceFailure`.
 
 @see AWSChimeSDKIdentityCreateAppInstanceAdminRequest
 @see AWSChimeSDKIdentityCreateAppInstanceAdminResponse
 */
- (void)createAppInstanceAdmin:(AWSChimeSDKIdentityCreateAppInstanceAdminRequest *)request completionHandler:(void (^ _Nullable)(AWSChimeSDKIdentityCreateAppInstanceAdminResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a bot under an Amazon Chime <code>AppInstance</code>. The request consists of a unique <code>Configuration</code> and <code>Name</code> for that bot.</p>
 
 @param request A container for the necessary parameters to execute the CreateAppInstanceBot service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimeSDKIdentityCreateAppInstanceBotResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeSDKIdentityErrorDomain` domain and the following error code: `AWSChimeSDKIdentityErrorBadRequest`, `AWSChimeSDKIdentityErrorConflict`, `AWSChimeSDKIdentityErrorForbidden`, `AWSChimeSDKIdentityErrorResourceLimitExceeded`, `AWSChimeSDKIdentityErrorThrottledClient`, `AWSChimeSDKIdentityErrorUnauthorizedClient`, `AWSChimeSDKIdentityErrorServiceUnavailable`, `AWSChimeSDKIdentityErrorServiceFailure`.
 
 @see AWSChimeSDKIdentityCreateAppInstanceBotRequest
 @see AWSChimeSDKIdentityCreateAppInstanceBotResponse
 */
- (AWSTask<AWSChimeSDKIdentityCreateAppInstanceBotResponse *> *)createAppInstanceBot:(AWSChimeSDKIdentityCreateAppInstanceBotRequest *)request;

/**
 <p>Creates a bot under an Amazon Chime <code>AppInstance</code>. The request consists of a unique <code>Configuration</code> and <code>Name</code> for that bot.</p>
 
 @param request A container for the necessary parameters to execute the CreateAppInstanceBot service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeSDKIdentityErrorDomain` domain and the following error code: `AWSChimeSDKIdentityErrorBadRequest`, `AWSChimeSDKIdentityErrorConflict`, `AWSChimeSDKIdentityErrorForbidden`, `AWSChimeSDKIdentityErrorResourceLimitExceeded`, `AWSChimeSDKIdentityErrorThrottledClient`, `AWSChimeSDKIdentityErrorUnauthorizedClient`, `AWSChimeSDKIdentityErrorServiceUnavailable`, `AWSChimeSDKIdentityErrorServiceFailure`.
 
 @see AWSChimeSDKIdentityCreateAppInstanceBotRequest
 @see AWSChimeSDKIdentityCreateAppInstanceBotResponse
 */
- (void)createAppInstanceBot:(AWSChimeSDKIdentityCreateAppInstanceBotRequest *)request completionHandler:(void (^ _Nullable)(AWSChimeSDKIdentityCreateAppInstanceBotResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a user under an Amazon Chime <code>AppInstance</code>. The request consists of a unique <code>appInstanceUserId</code> and <code>Name</code> for that user.</p>
 
 @param request A container for the necessary parameters to execute the CreateAppInstanceUser service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimeSDKIdentityCreateAppInstanceUserResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeSDKIdentityErrorDomain` domain and the following error code: `AWSChimeSDKIdentityErrorBadRequest`, `AWSChimeSDKIdentityErrorConflict`, `AWSChimeSDKIdentityErrorForbidden`, `AWSChimeSDKIdentityErrorResourceLimitExceeded`, `AWSChimeSDKIdentityErrorThrottledClient`, `AWSChimeSDKIdentityErrorUnauthorizedClient`, `AWSChimeSDKIdentityErrorServiceUnavailable`, `AWSChimeSDKIdentityErrorServiceFailure`.
 
 @see AWSChimeSDKIdentityCreateAppInstanceUserRequest
 @see AWSChimeSDKIdentityCreateAppInstanceUserResponse
 */
- (AWSTask<AWSChimeSDKIdentityCreateAppInstanceUserResponse *> *)createAppInstanceUser:(AWSChimeSDKIdentityCreateAppInstanceUserRequest *)request;

/**
 <p>Creates a user under an Amazon Chime <code>AppInstance</code>. The request consists of a unique <code>appInstanceUserId</code> and <code>Name</code> for that user.</p>
 
 @param request A container for the necessary parameters to execute the CreateAppInstanceUser service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeSDKIdentityErrorDomain` domain and the following error code: `AWSChimeSDKIdentityErrorBadRequest`, `AWSChimeSDKIdentityErrorConflict`, `AWSChimeSDKIdentityErrorForbidden`, `AWSChimeSDKIdentityErrorResourceLimitExceeded`, `AWSChimeSDKIdentityErrorThrottledClient`, `AWSChimeSDKIdentityErrorUnauthorizedClient`, `AWSChimeSDKIdentityErrorServiceUnavailable`, `AWSChimeSDKIdentityErrorServiceFailure`.
 
 @see AWSChimeSDKIdentityCreateAppInstanceUserRequest
 @see AWSChimeSDKIdentityCreateAppInstanceUserResponse
 */
- (void)createAppInstanceUser:(AWSChimeSDKIdentityCreateAppInstanceUserRequest *)request completionHandler:(void (^ _Nullable)(AWSChimeSDKIdentityCreateAppInstanceUserResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes an <code>AppInstance</code> and all associated data asynchronously.</p>
 
 @param request A container for the necessary parameters to execute the DeleteAppInstance service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeSDKIdentityErrorDomain` domain and the following error code: `AWSChimeSDKIdentityErrorBadRequest`, `AWSChimeSDKIdentityErrorForbidden`, `AWSChimeSDKIdentityErrorResourceLimitExceeded`, `AWSChimeSDKIdentityErrorThrottledClient`, `AWSChimeSDKIdentityErrorUnauthorizedClient`, `AWSChimeSDKIdentityErrorServiceUnavailable`, `AWSChimeSDKIdentityErrorServiceFailure`.
 
 @see AWSChimeSDKIdentityDeleteAppInstanceRequest
 */
- (AWSTask *)deleteAppInstance:(AWSChimeSDKIdentityDeleteAppInstanceRequest *)request;

/**
 <p>Deletes an <code>AppInstance</code> and all associated data asynchronously.</p>
 
 @param request A container for the necessary parameters to execute the DeleteAppInstance service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeSDKIdentityErrorDomain` domain and the following error code: `AWSChimeSDKIdentityErrorBadRequest`, `AWSChimeSDKIdentityErrorForbidden`, `AWSChimeSDKIdentityErrorResourceLimitExceeded`, `AWSChimeSDKIdentityErrorThrottledClient`, `AWSChimeSDKIdentityErrorUnauthorizedClient`, `AWSChimeSDKIdentityErrorServiceUnavailable`, `AWSChimeSDKIdentityErrorServiceFailure`.
 
 @see AWSChimeSDKIdentityDeleteAppInstanceRequest
 */
- (void)deleteAppInstance:(AWSChimeSDKIdentityDeleteAppInstanceRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Demotes an <code>AppInstanceAdmin</code> to an <code>AppInstanceUser</code> or <code>AppInstanceBot</code>. This action does not delete the user.</p>
 
 @param request A container for the necessary parameters to execute the DeleteAppInstanceAdmin service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeSDKIdentityErrorDomain` domain and the following error code: `AWSChimeSDKIdentityErrorBadRequest`, `AWSChimeSDKIdentityErrorConflict`, `AWSChimeSDKIdentityErrorForbidden`, `AWSChimeSDKIdentityErrorResourceLimitExceeded`, `AWSChimeSDKIdentityErrorThrottledClient`, `AWSChimeSDKIdentityErrorUnauthorizedClient`, `AWSChimeSDKIdentityErrorServiceUnavailable`, `AWSChimeSDKIdentityErrorServiceFailure`.
 
 @see AWSChimeSDKIdentityDeleteAppInstanceAdminRequest
 */
- (AWSTask *)deleteAppInstanceAdmin:(AWSChimeSDKIdentityDeleteAppInstanceAdminRequest *)request;

/**
 <p>Demotes an <code>AppInstanceAdmin</code> to an <code>AppInstanceUser</code> or <code>AppInstanceBot</code>. This action does not delete the user.</p>
 
 @param request A container for the necessary parameters to execute the DeleteAppInstanceAdmin service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeSDKIdentityErrorDomain` domain and the following error code: `AWSChimeSDKIdentityErrorBadRequest`, `AWSChimeSDKIdentityErrorConflict`, `AWSChimeSDKIdentityErrorForbidden`, `AWSChimeSDKIdentityErrorResourceLimitExceeded`, `AWSChimeSDKIdentityErrorThrottledClient`, `AWSChimeSDKIdentityErrorUnauthorizedClient`, `AWSChimeSDKIdentityErrorServiceUnavailable`, `AWSChimeSDKIdentityErrorServiceFailure`.
 
 @see AWSChimeSDKIdentityDeleteAppInstanceAdminRequest
 */
- (void)deleteAppInstanceAdmin:(AWSChimeSDKIdentityDeleteAppInstanceAdminRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes an <code>AppInstanceBot</code>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteAppInstanceBot service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeSDKIdentityErrorDomain` domain and the following error code: `AWSChimeSDKIdentityErrorBadRequest`, `AWSChimeSDKIdentityErrorConflict`, `AWSChimeSDKIdentityErrorForbidden`, `AWSChimeSDKIdentityErrorResourceLimitExceeded`, `AWSChimeSDKIdentityErrorThrottledClient`, `AWSChimeSDKIdentityErrorUnauthorizedClient`, `AWSChimeSDKIdentityErrorServiceUnavailable`, `AWSChimeSDKIdentityErrorServiceFailure`.
 
 @see AWSChimeSDKIdentityDeleteAppInstanceBotRequest
 */
- (AWSTask *)deleteAppInstanceBot:(AWSChimeSDKIdentityDeleteAppInstanceBotRequest *)request;

/**
 <p>Deletes an <code>AppInstanceBot</code>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteAppInstanceBot service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeSDKIdentityErrorDomain` domain and the following error code: `AWSChimeSDKIdentityErrorBadRequest`, `AWSChimeSDKIdentityErrorConflict`, `AWSChimeSDKIdentityErrorForbidden`, `AWSChimeSDKIdentityErrorResourceLimitExceeded`, `AWSChimeSDKIdentityErrorThrottledClient`, `AWSChimeSDKIdentityErrorUnauthorizedClient`, `AWSChimeSDKIdentityErrorServiceUnavailable`, `AWSChimeSDKIdentityErrorServiceFailure`.
 
 @see AWSChimeSDKIdentityDeleteAppInstanceBotRequest
 */
- (void)deleteAppInstanceBot:(AWSChimeSDKIdentityDeleteAppInstanceBotRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes an <code>AppInstanceUser</code>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteAppInstanceUser service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeSDKIdentityErrorDomain` domain and the following error code: `AWSChimeSDKIdentityErrorBadRequest`, `AWSChimeSDKIdentityErrorConflict`, `AWSChimeSDKIdentityErrorForbidden`, `AWSChimeSDKIdentityErrorResourceLimitExceeded`, `AWSChimeSDKIdentityErrorThrottledClient`, `AWSChimeSDKIdentityErrorUnauthorizedClient`, `AWSChimeSDKIdentityErrorServiceUnavailable`, `AWSChimeSDKIdentityErrorServiceFailure`.
 
 @see AWSChimeSDKIdentityDeleteAppInstanceUserRequest
 */
- (AWSTask *)deleteAppInstanceUser:(AWSChimeSDKIdentityDeleteAppInstanceUserRequest *)request;

/**
 <p>Deletes an <code>AppInstanceUser</code>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteAppInstanceUser service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeSDKIdentityErrorDomain` domain and the following error code: `AWSChimeSDKIdentityErrorBadRequest`, `AWSChimeSDKIdentityErrorConflict`, `AWSChimeSDKIdentityErrorForbidden`, `AWSChimeSDKIdentityErrorResourceLimitExceeded`, `AWSChimeSDKIdentityErrorThrottledClient`, `AWSChimeSDKIdentityErrorUnauthorizedClient`, `AWSChimeSDKIdentityErrorServiceUnavailable`, `AWSChimeSDKIdentityErrorServiceFailure`.
 
 @see AWSChimeSDKIdentityDeleteAppInstanceUserRequest
 */
- (void)deleteAppInstanceUser:(AWSChimeSDKIdentityDeleteAppInstanceUserRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deregisters an <code>AppInstanceUserEndpoint</code>.</p>
 
 @param request A container for the necessary parameters to execute the DeregisterAppInstanceUserEndpoint service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeSDKIdentityErrorDomain` domain and the following error code: `AWSChimeSDKIdentityErrorBadRequest`, `AWSChimeSDKIdentityErrorForbidden`, `AWSChimeSDKIdentityErrorThrottledClient`, `AWSChimeSDKIdentityErrorUnauthorizedClient`, `AWSChimeSDKIdentityErrorServiceUnavailable`, `AWSChimeSDKIdentityErrorServiceFailure`.
 
 @see AWSChimeSDKIdentityDeregisterAppInstanceUserEndpointRequest
 */
- (AWSTask *)deregisterAppInstanceUserEndpoint:(AWSChimeSDKIdentityDeregisterAppInstanceUserEndpointRequest *)request;

/**
 <p>Deregisters an <code>AppInstanceUserEndpoint</code>.</p>
 
 @param request A container for the necessary parameters to execute the DeregisterAppInstanceUserEndpoint service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeSDKIdentityErrorDomain` domain and the following error code: `AWSChimeSDKIdentityErrorBadRequest`, `AWSChimeSDKIdentityErrorForbidden`, `AWSChimeSDKIdentityErrorThrottledClient`, `AWSChimeSDKIdentityErrorUnauthorizedClient`, `AWSChimeSDKIdentityErrorServiceUnavailable`, `AWSChimeSDKIdentityErrorServiceFailure`.
 
 @see AWSChimeSDKIdentityDeregisterAppInstanceUserEndpointRequest
 */
- (void)deregisterAppInstanceUserEndpoint:(AWSChimeSDKIdentityDeregisterAppInstanceUserEndpointRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Returns the full details of an <code>AppInstance</code>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAppInstance service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimeSDKIdentityDescribeAppInstanceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeSDKIdentityErrorDomain` domain and the following error code: `AWSChimeSDKIdentityErrorBadRequest`, `AWSChimeSDKIdentityErrorForbidden`, `AWSChimeSDKIdentityErrorThrottledClient`, `AWSChimeSDKIdentityErrorUnauthorizedClient`, `AWSChimeSDKIdentityErrorServiceUnavailable`, `AWSChimeSDKIdentityErrorServiceFailure`.
 
 @see AWSChimeSDKIdentityDescribeAppInstanceRequest
 @see AWSChimeSDKIdentityDescribeAppInstanceResponse
 */
- (AWSTask<AWSChimeSDKIdentityDescribeAppInstanceResponse *> *)describeAppInstance:(AWSChimeSDKIdentityDescribeAppInstanceRequest *)request;

/**
 <p>Returns the full details of an <code>AppInstance</code>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAppInstance service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeSDKIdentityErrorDomain` domain and the following error code: `AWSChimeSDKIdentityErrorBadRequest`, `AWSChimeSDKIdentityErrorForbidden`, `AWSChimeSDKIdentityErrorThrottledClient`, `AWSChimeSDKIdentityErrorUnauthorizedClient`, `AWSChimeSDKIdentityErrorServiceUnavailable`, `AWSChimeSDKIdentityErrorServiceFailure`.
 
 @see AWSChimeSDKIdentityDescribeAppInstanceRequest
 @see AWSChimeSDKIdentityDescribeAppInstanceResponse
 */
- (void)describeAppInstance:(AWSChimeSDKIdentityDescribeAppInstanceRequest *)request completionHandler:(void (^ _Nullable)(AWSChimeSDKIdentityDescribeAppInstanceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the full details of an <code>AppInstanceAdmin</code>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAppInstanceAdmin service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimeSDKIdentityDescribeAppInstanceAdminResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeSDKIdentityErrorDomain` domain and the following error code: `AWSChimeSDKIdentityErrorBadRequest`, `AWSChimeSDKIdentityErrorForbidden`, `AWSChimeSDKIdentityErrorThrottledClient`, `AWSChimeSDKIdentityErrorUnauthorizedClient`, `AWSChimeSDKIdentityErrorServiceUnavailable`, `AWSChimeSDKIdentityErrorServiceFailure`.
 
 @see AWSChimeSDKIdentityDescribeAppInstanceAdminRequest
 @see AWSChimeSDKIdentityDescribeAppInstanceAdminResponse
 */
- (AWSTask<AWSChimeSDKIdentityDescribeAppInstanceAdminResponse *> *)describeAppInstanceAdmin:(AWSChimeSDKIdentityDescribeAppInstanceAdminRequest *)request;

/**
 <p>Returns the full details of an <code>AppInstanceAdmin</code>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAppInstanceAdmin service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeSDKIdentityErrorDomain` domain and the following error code: `AWSChimeSDKIdentityErrorBadRequest`, `AWSChimeSDKIdentityErrorForbidden`, `AWSChimeSDKIdentityErrorThrottledClient`, `AWSChimeSDKIdentityErrorUnauthorizedClient`, `AWSChimeSDKIdentityErrorServiceUnavailable`, `AWSChimeSDKIdentityErrorServiceFailure`.
 
 @see AWSChimeSDKIdentityDescribeAppInstanceAdminRequest
 @see AWSChimeSDKIdentityDescribeAppInstanceAdminResponse
 */
- (void)describeAppInstanceAdmin:(AWSChimeSDKIdentityDescribeAppInstanceAdminRequest *)request completionHandler:(void (^ _Nullable)(AWSChimeSDKIdentityDescribeAppInstanceAdminResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>The <code>AppInstanceBot's</code> information.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAppInstanceBot service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimeSDKIdentityDescribeAppInstanceBotResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeSDKIdentityErrorDomain` domain and the following error code: `AWSChimeSDKIdentityErrorBadRequest`, `AWSChimeSDKIdentityErrorForbidden`, `AWSChimeSDKIdentityErrorThrottledClient`, `AWSChimeSDKIdentityErrorUnauthorizedClient`, `AWSChimeSDKIdentityErrorNotFound`, `AWSChimeSDKIdentityErrorServiceUnavailable`, `AWSChimeSDKIdentityErrorServiceFailure`.
 
 @see AWSChimeSDKIdentityDescribeAppInstanceBotRequest
 @see AWSChimeSDKIdentityDescribeAppInstanceBotResponse
 */
- (AWSTask<AWSChimeSDKIdentityDescribeAppInstanceBotResponse *> *)describeAppInstanceBot:(AWSChimeSDKIdentityDescribeAppInstanceBotRequest *)request;

/**
 <p>The <code>AppInstanceBot's</code> information.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAppInstanceBot service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeSDKIdentityErrorDomain` domain and the following error code: `AWSChimeSDKIdentityErrorBadRequest`, `AWSChimeSDKIdentityErrorForbidden`, `AWSChimeSDKIdentityErrorThrottledClient`, `AWSChimeSDKIdentityErrorUnauthorizedClient`, `AWSChimeSDKIdentityErrorNotFound`, `AWSChimeSDKIdentityErrorServiceUnavailable`, `AWSChimeSDKIdentityErrorServiceFailure`.
 
 @see AWSChimeSDKIdentityDescribeAppInstanceBotRequest
 @see AWSChimeSDKIdentityDescribeAppInstanceBotResponse
 */
- (void)describeAppInstanceBot:(AWSChimeSDKIdentityDescribeAppInstanceBotRequest *)request completionHandler:(void (^ _Nullable)(AWSChimeSDKIdentityDescribeAppInstanceBotResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the full details of an <code>AppInstanceUser</code>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAppInstanceUser service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimeSDKIdentityDescribeAppInstanceUserResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeSDKIdentityErrorDomain` domain and the following error code: `AWSChimeSDKIdentityErrorBadRequest`, `AWSChimeSDKIdentityErrorForbidden`, `AWSChimeSDKIdentityErrorThrottledClient`, `AWSChimeSDKIdentityErrorUnauthorizedClient`, `AWSChimeSDKIdentityErrorServiceUnavailable`, `AWSChimeSDKIdentityErrorServiceFailure`.
 
 @see AWSChimeSDKIdentityDescribeAppInstanceUserRequest
 @see AWSChimeSDKIdentityDescribeAppInstanceUserResponse
 */
- (AWSTask<AWSChimeSDKIdentityDescribeAppInstanceUserResponse *> *)describeAppInstanceUser:(AWSChimeSDKIdentityDescribeAppInstanceUserRequest *)request;

/**
 <p>Returns the full details of an <code>AppInstanceUser</code>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAppInstanceUser service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeSDKIdentityErrorDomain` domain and the following error code: `AWSChimeSDKIdentityErrorBadRequest`, `AWSChimeSDKIdentityErrorForbidden`, `AWSChimeSDKIdentityErrorThrottledClient`, `AWSChimeSDKIdentityErrorUnauthorizedClient`, `AWSChimeSDKIdentityErrorServiceUnavailable`, `AWSChimeSDKIdentityErrorServiceFailure`.
 
 @see AWSChimeSDKIdentityDescribeAppInstanceUserRequest
 @see AWSChimeSDKIdentityDescribeAppInstanceUserResponse
 */
- (void)describeAppInstanceUser:(AWSChimeSDKIdentityDescribeAppInstanceUserRequest *)request completionHandler:(void (^ _Nullable)(AWSChimeSDKIdentityDescribeAppInstanceUserResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the full details of an <code>AppInstanceUserEndpoint</code>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAppInstanceUserEndpoint service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimeSDKIdentityDescribeAppInstanceUserEndpointResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeSDKIdentityErrorDomain` domain and the following error code: `AWSChimeSDKIdentityErrorBadRequest`, `AWSChimeSDKIdentityErrorForbidden`, `AWSChimeSDKIdentityErrorThrottledClient`, `AWSChimeSDKIdentityErrorUnauthorizedClient`, `AWSChimeSDKIdentityErrorServiceUnavailable`, `AWSChimeSDKIdentityErrorServiceFailure`.
 
 @see AWSChimeSDKIdentityDescribeAppInstanceUserEndpointRequest
 @see AWSChimeSDKIdentityDescribeAppInstanceUserEndpointResponse
 */
- (AWSTask<AWSChimeSDKIdentityDescribeAppInstanceUserEndpointResponse *> *)describeAppInstanceUserEndpoint:(AWSChimeSDKIdentityDescribeAppInstanceUserEndpointRequest *)request;

/**
 <p>Returns the full details of an <code>AppInstanceUserEndpoint</code>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAppInstanceUserEndpoint service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeSDKIdentityErrorDomain` domain and the following error code: `AWSChimeSDKIdentityErrorBadRequest`, `AWSChimeSDKIdentityErrorForbidden`, `AWSChimeSDKIdentityErrorThrottledClient`, `AWSChimeSDKIdentityErrorUnauthorizedClient`, `AWSChimeSDKIdentityErrorServiceUnavailable`, `AWSChimeSDKIdentityErrorServiceFailure`.
 
 @see AWSChimeSDKIdentityDescribeAppInstanceUserEndpointRequest
 @see AWSChimeSDKIdentityDescribeAppInstanceUserEndpointResponse
 */
- (void)describeAppInstanceUserEndpoint:(AWSChimeSDKIdentityDescribeAppInstanceUserEndpointRequest *)request completionHandler:(void (^ _Nullable)(AWSChimeSDKIdentityDescribeAppInstanceUserEndpointResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets the retention settings for an <code>AppInstance</code>.</p>
 
 @param request A container for the necessary parameters to execute the GetAppInstanceRetentionSettings service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimeSDKIdentityGetAppInstanceRetentionSettingsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeSDKIdentityErrorDomain` domain and the following error code: `AWSChimeSDKIdentityErrorBadRequest`, `AWSChimeSDKIdentityErrorForbidden`, `AWSChimeSDKIdentityErrorThrottledClient`, `AWSChimeSDKIdentityErrorUnauthorizedClient`, `AWSChimeSDKIdentityErrorServiceUnavailable`, `AWSChimeSDKIdentityErrorServiceFailure`.
 
 @see AWSChimeSDKIdentityGetAppInstanceRetentionSettingsRequest
 @see AWSChimeSDKIdentityGetAppInstanceRetentionSettingsResponse
 */
- (AWSTask<AWSChimeSDKIdentityGetAppInstanceRetentionSettingsResponse *> *)getAppInstanceRetentionSettings:(AWSChimeSDKIdentityGetAppInstanceRetentionSettingsRequest *)request;

/**
 <p>Gets the retention settings for an <code>AppInstance</code>.</p>
 
 @param request A container for the necessary parameters to execute the GetAppInstanceRetentionSettings service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeSDKIdentityErrorDomain` domain and the following error code: `AWSChimeSDKIdentityErrorBadRequest`, `AWSChimeSDKIdentityErrorForbidden`, `AWSChimeSDKIdentityErrorThrottledClient`, `AWSChimeSDKIdentityErrorUnauthorizedClient`, `AWSChimeSDKIdentityErrorServiceUnavailable`, `AWSChimeSDKIdentityErrorServiceFailure`.
 
 @see AWSChimeSDKIdentityGetAppInstanceRetentionSettingsRequest
 @see AWSChimeSDKIdentityGetAppInstanceRetentionSettingsResponse
 */
- (void)getAppInstanceRetentionSettings:(AWSChimeSDKIdentityGetAppInstanceRetentionSettingsRequest *)request completionHandler:(void (^ _Nullable)(AWSChimeSDKIdentityGetAppInstanceRetentionSettingsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of the administrators in the <code>AppInstance</code>.</p>
 
 @param request A container for the necessary parameters to execute the ListAppInstanceAdmins service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimeSDKIdentityListAppInstanceAdminsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeSDKIdentityErrorDomain` domain and the following error code: `AWSChimeSDKIdentityErrorBadRequest`, `AWSChimeSDKIdentityErrorForbidden`, `AWSChimeSDKIdentityErrorResourceLimitExceeded`, `AWSChimeSDKIdentityErrorThrottledClient`, `AWSChimeSDKIdentityErrorUnauthorizedClient`, `AWSChimeSDKIdentityErrorServiceUnavailable`, `AWSChimeSDKIdentityErrorServiceFailure`.
 
 @see AWSChimeSDKIdentityListAppInstanceAdminsRequest
 @see AWSChimeSDKIdentityListAppInstanceAdminsResponse
 */
- (AWSTask<AWSChimeSDKIdentityListAppInstanceAdminsResponse *> *)listAppInstanceAdmins:(AWSChimeSDKIdentityListAppInstanceAdminsRequest *)request;

/**
 <p>Returns a list of the administrators in the <code>AppInstance</code>.</p>
 
 @param request A container for the necessary parameters to execute the ListAppInstanceAdmins service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeSDKIdentityErrorDomain` domain and the following error code: `AWSChimeSDKIdentityErrorBadRequest`, `AWSChimeSDKIdentityErrorForbidden`, `AWSChimeSDKIdentityErrorResourceLimitExceeded`, `AWSChimeSDKIdentityErrorThrottledClient`, `AWSChimeSDKIdentityErrorUnauthorizedClient`, `AWSChimeSDKIdentityErrorServiceUnavailable`, `AWSChimeSDKIdentityErrorServiceFailure`.
 
 @see AWSChimeSDKIdentityListAppInstanceAdminsRequest
 @see AWSChimeSDKIdentityListAppInstanceAdminsResponse
 */
- (void)listAppInstanceAdmins:(AWSChimeSDKIdentityListAppInstanceAdminsRequest *)request completionHandler:(void (^ _Nullable)(AWSChimeSDKIdentityListAppInstanceAdminsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists all <code>AppInstanceBots</code> created under a single <code>AppInstance</code>.</p>
 
 @param request A container for the necessary parameters to execute the ListAppInstanceBots service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimeSDKIdentityListAppInstanceBotsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeSDKIdentityErrorDomain` domain and the following error code: `AWSChimeSDKIdentityErrorBadRequest`, `AWSChimeSDKIdentityErrorForbidden`, `AWSChimeSDKIdentityErrorResourceLimitExceeded`, `AWSChimeSDKIdentityErrorThrottledClient`, `AWSChimeSDKIdentityErrorUnauthorizedClient`, `AWSChimeSDKIdentityErrorServiceUnavailable`, `AWSChimeSDKIdentityErrorServiceFailure`.
 
 @see AWSChimeSDKIdentityListAppInstanceBotsRequest
 @see AWSChimeSDKIdentityListAppInstanceBotsResponse
 */
- (AWSTask<AWSChimeSDKIdentityListAppInstanceBotsResponse *> *)listAppInstanceBots:(AWSChimeSDKIdentityListAppInstanceBotsRequest *)request;

/**
 <p>Lists all <code>AppInstanceBots</code> created under a single <code>AppInstance</code>.</p>
 
 @param request A container for the necessary parameters to execute the ListAppInstanceBots service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeSDKIdentityErrorDomain` domain and the following error code: `AWSChimeSDKIdentityErrorBadRequest`, `AWSChimeSDKIdentityErrorForbidden`, `AWSChimeSDKIdentityErrorResourceLimitExceeded`, `AWSChimeSDKIdentityErrorThrottledClient`, `AWSChimeSDKIdentityErrorUnauthorizedClient`, `AWSChimeSDKIdentityErrorServiceUnavailable`, `AWSChimeSDKIdentityErrorServiceFailure`.
 
 @see AWSChimeSDKIdentityListAppInstanceBotsRequest
 @see AWSChimeSDKIdentityListAppInstanceBotsResponse
 */
- (void)listAppInstanceBots:(AWSChimeSDKIdentityListAppInstanceBotsRequest *)request completionHandler:(void (^ _Nullable)(AWSChimeSDKIdentityListAppInstanceBotsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists all the <code>AppInstanceUserEndpoints</code> created under a single <code>AppInstanceUser</code>.</p>
 
 @param request A container for the necessary parameters to execute the ListAppInstanceUserEndpoints service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimeSDKIdentityListAppInstanceUserEndpointsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeSDKIdentityErrorDomain` domain and the following error code: `AWSChimeSDKIdentityErrorBadRequest`, `AWSChimeSDKIdentityErrorForbidden`, `AWSChimeSDKIdentityErrorThrottledClient`, `AWSChimeSDKIdentityErrorUnauthorizedClient`, `AWSChimeSDKIdentityErrorServiceUnavailable`, `AWSChimeSDKIdentityErrorServiceFailure`.
 
 @see AWSChimeSDKIdentityListAppInstanceUserEndpointsRequest
 @see AWSChimeSDKIdentityListAppInstanceUserEndpointsResponse
 */
- (AWSTask<AWSChimeSDKIdentityListAppInstanceUserEndpointsResponse *> *)listAppInstanceUserEndpoints:(AWSChimeSDKIdentityListAppInstanceUserEndpointsRequest *)request;

/**
 <p>Lists all the <code>AppInstanceUserEndpoints</code> created under a single <code>AppInstanceUser</code>.</p>
 
 @param request A container for the necessary parameters to execute the ListAppInstanceUserEndpoints service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeSDKIdentityErrorDomain` domain and the following error code: `AWSChimeSDKIdentityErrorBadRequest`, `AWSChimeSDKIdentityErrorForbidden`, `AWSChimeSDKIdentityErrorThrottledClient`, `AWSChimeSDKIdentityErrorUnauthorizedClient`, `AWSChimeSDKIdentityErrorServiceUnavailable`, `AWSChimeSDKIdentityErrorServiceFailure`.
 
 @see AWSChimeSDKIdentityListAppInstanceUserEndpointsRequest
 @see AWSChimeSDKIdentityListAppInstanceUserEndpointsResponse
 */
- (void)listAppInstanceUserEndpoints:(AWSChimeSDKIdentityListAppInstanceUserEndpointsRequest *)request completionHandler:(void (^ _Nullable)(AWSChimeSDKIdentityListAppInstanceUserEndpointsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>List all <code>AppInstanceUsers</code> created under a single <code>AppInstance</code>.</p>
 
 @param request A container for the necessary parameters to execute the ListAppInstanceUsers service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimeSDKIdentityListAppInstanceUsersResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeSDKIdentityErrorDomain` domain and the following error code: `AWSChimeSDKIdentityErrorBadRequest`, `AWSChimeSDKIdentityErrorForbidden`, `AWSChimeSDKIdentityErrorThrottledClient`, `AWSChimeSDKIdentityErrorUnauthorizedClient`, `AWSChimeSDKIdentityErrorServiceUnavailable`, `AWSChimeSDKIdentityErrorServiceFailure`.
 
 @see AWSChimeSDKIdentityListAppInstanceUsersRequest
 @see AWSChimeSDKIdentityListAppInstanceUsersResponse
 */
- (AWSTask<AWSChimeSDKIdentityListAppInstanceUsersResponse *> *)listAppInstanceUsers:(AWSChimeSDKIdentityListAppInstanceUsersRequest *)request;

/**
 <p>List all <code>AppInstanceUsers</code> created under a single <code>AppInstance</code>.</p>
 
 @param request A container for the necessary parameters to execute the ListAppInstanceUsers service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeSDKIdentityErrorDomain` domain and the following error code: `AWSChimeSDKIdentityErrorBadRequest`, `AWSChimeSDKIdentityErrorForbidden`, `AWSChimeSDKIdentityErrorThrottledClient`, `AWSChimeSDKIdentityErrorUnauthorizedClient`, `AWSChimeSDKIdentityErrorServiceUnavailable`, `AWSChimeSDKIdentityErrorServiceFailure`.
 
 @see AWSChimeSDKIdentityListAppInstanceUsersRequest
 @see AWSChimeSDKIdentityListAppInstanceUsersResponse
 */
- (void)listAppInstanceUsers:(AWSChimeSDKIdentityListAppInstanceUsersRequest *)request completionHandler:(void (^ _Nullable)(AWSChimeSDKIdentityListAppInstanceUsersResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists all Amazon Chime <code>AppInstance</code>s created under a single AWS account.</p>
 
 @param request A container for the necessary parameters to execute the ListAppInstances service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimeSDKIdentityListAppInstancesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeSDKIdentityErrorDomain` domain and the following error code: `AWSChimeSDKIdentityErrorBadRequest`, `AWSChimeSDKIdentityErrorForbidden`, `AWSChimeSDKIdentityErrorThrottledClient`, `AWSChimeSDKIdentityErrorUnauthorizedClient`, `AWSChimeSDKIdentityErrorServiceUnavailable`, `AWSChimeSDKIdentityErrorServiceFailure`.
 
 @see AWSChimeSDKIdentityListAppInstancesRequest
 @see AWSChimeSDKIdentityListAppInstancesResponse
 */
- (AWSTask<AWSChimeSDKIdentityListAppInstancesResponse *> *)listAppInstances:(AWSChimeSDKIdentityListAppInstancesRequest *)request;

/**
 <p>Lists all Amazon Chime <code>AppInstance</code>s created under a single AWS account.</p>
 
 @param request A container for the necessary parameters to execute the ListAppInstances service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeSDKIdentityErrorDomain` domain and the following error code: `AWSChimeSDKIdentityErrorBadRequest`, `AWSChimeSDKIdentityErrorForbidden`, `AWSChimeSDKIdentityErrorThrottledClient`, `AWSChimeSDKIdentityErrorUnauthorizedClient`, `AWSChimeSDKIdentityErrorServiceUnavailable`, `AWSChimeSDKIdentityErrorServiceFailure`.
 
 @see AWSChimeSDKIdentityListAppInstancesRequest
 @see AWSChimeSDKIdentityListAppInstancesResponse
 */
- (void)listAppInstances:(AWSChimeSDKIdentityListAppInstancesRequest *)request completionHandler:(void (^ _Nullable)(AWSChimeSDKIdentityListAppInstancesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the tags applied to an Amazon Chime SDK identity resource.</p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimeSDKIdentityListTagsForResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeSDKIdentityErrorDomain` domain and the following error code: `AWSChimeSDKIdentityErrorBadRequest`, `AWSChimeSDKIdentityErrorForbidden`, `AWSChimeSDKIdentityErrorUnauthorizedClient`, `AWSChimeSDKIdentityErrorThrottledClient`, `AWSChimeSDKIdentityErrorServiceUnavailable`, `AWSChimeSDKIdentityErrorServiceFailure`.
 
 @see AWSChimeSDKIdentityListTagsForResourceRequest
 @see AWSChimeSDKIdentityListTagsForResourceResponse
 */
- (AWSTask<AWSChimeSDKIdentityListTagsForResourceResponse *> *)listTagsForResource:(AWSChimeSDKIdentityListTagsForResourceRequest *)request;

/**
 <p>Lists the tags applied to an Amazon Chime SDK identity resource.</p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeSDKIdentityErrorDomain` domain and the following error code: `AWSChimeSDKIdentityErrorBadRequest`, `AWSChimeSDKIdentityErrorForbidden`, `AWSChimeSDKIdentityErrorUnauthorizedClient`, `AWSChimeSDKIdentityErrorThrottledClient`, `AWSChimeSDKIdentityErrorServiceUnavailable`, `AWSChimeSDKIdentityErrorServiceFailure`.
 
 @see AWSChimeSDKIdentityListTagsForResourceRequest
 @see AWSChimeSDKIdentityListTagsForResourceResponse
 */
- (void)listTagsForResource:(AWSChimeSDKIdentityListTagsForResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSChimeSDKIdentityListTagsForResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Sets the amount of time in days that a given <code>AppInstance</code> retains data.</p>
 
 @param request A container for the necessary parameters to execute the PutAppInstanceRetentionSettings service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimeSDKIdentityPutAppInstanceRetentionSettingsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeSDKIdentityErrorDomain` domain and the following error code: `AWSChimeSDKIdentityErrorBadRequest`, `AWSChimeSDKIdentityErrorForbidden`, `AWSChimeSDKIdentityErrorThrottledClient`, `AWSChimeSDKIdentityErrorUnauthorizedClient`, `AWSChimeSDKIdentityErrorServiceUnavailable`, `AWSChimeSDKIdentityErrorServiceFailure`.
 
 @see AWSChimeSDKIdentityPutAppInstanceRetentionSettingsRequest
 @see AWSChimeSDKIdentityPutAppInstanceRetentionSettingsResponse
 */
- (AWSTask<AWSChimeSDKIdentityPutAppInstanceRetentionSettingsResponse *> *)putAppInstanceRetentionSettings:(AWSChimeSDKIdentityPutAppInstanceRetentionSettingsRequest *)request;

/**
 <p>Sets the amount of time in days that a given <code>AppInstance</code> retains data.</p>
 
 @param request A container for the necessary parameters to execute the PutAppInstanceRetentionSettings service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeSDKIdentityErrorDomain` domain and the following error code: `AWSChimeSDKIdentityErrorBadRequest`, `AWSChimeSDKIdentityErrorForbidden`, `AWSChimeSDKIdentityErrorThrottledClient`, `AWSChimeSDKIdentityErrorUnauthorizedClient`, `AWSChimeSDKIdentityErrorServiceUnavailable`, `AWSChimeSDKIdentityErrorServiceFailure`.
 
 @see AWSChimeSDKIdentityPutAppInstanceRetentionSettingsRequest
 @see AWSChimeSDKIdentityPutAppInstanceRetentionSettingsResponse
 */
- (void)putAppInstanceRetentionSettings:(AWSChimeSDKIdentityPutAppInstanceRetentionSettingsRequest *)request completionHandler:(void (^ _Nullable)(AWSChimeSDKIdentityPutAppInstanceRetentionSettingsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Sets the number of days before the <code>AppInstanceUser</code> is automatically deleted.</p><note><p>A background process deletes expired <code>AppInstanceUsers</code> within 6 hours of expiration. Actual deletion times may vary.</p><p>Expired <code>AppInstanceUsers</code> that have not yet been deleted appear as active, and you can update their expiration settings. The system honors the new settings.</p></note>
 
 @param request A container for the necessary parameters to execute the PutAppInstanceUserExpirationSettings service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimeSDKIdentityPutAppInstanceUserExpirationSettingsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeSDKIdentityErrorDomain` domain and the following error code: `AWSChimeSDKIdentityErrorBadRequest`, `AWSChimeSDKIdentityErrorConflict`, `AWSChimeSDKIdentityErrorForbidden`, `AWSChimeSDKIdentityErrorThrottledClient`, `AWSChimeSDKIdentityErrorUnauthorizedClient`, `AWSChimeSDKIdentityErrorServiceUnavailable`, `AWSChimeSDKIdentityErrorServiceFailure`.
 
 @see AWSChimeSDKIdentityPutAppInstanceUserExpirationSettingsRequest
 @see AWSChimeSDKIdentityPutAppInstanceUserExpirationSettingsResponse
 */
- (AWSTask<AWSChimeSDKIdentityPutAppInstanceUserExpirationSettingsResponse *> *)putAppInstanceUserExpirationSettings:(AWSChimeSDKIdentityPutAppInstanceUserExpirationSettingsRequest *)request;

/**
 <p>Sets the number of days before the <code>AppInstanceUser</code> is automatically deleted.</p><note><p>A background process deletes expired <code>AppInstanceUsers</code> within 6 hours of expiration. Actual deletion times may vary.</p><p>Expired <code>AppInstanceUsers</code> that have not yet been deleted appear as active, and you can update their expiration settings. The system honors the new settings.</p></note>
 
 @param request A container for the necessary parameters to execute the PutAppInstanceUserExpirationSettings service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeSDKIdentityErrorDomain` domain and the following error code: `AWSChimeSDKIdentityErrorBadRequest`, `AWSChimeSDKIdentityErrorConflict`, `AWSChimeSDKIdentityErrorForbidden`, `AWSChimeSDKIdentityErrorThrottledClient`, `AWSChimeSDKIdentityErrorUnauthorizedClient`, `AWSChimeSDKIdentityErrorServiceUnavailable`, `AWSChimeSDKIdentityErrorServiceFailure`.
 
 @see AWSChimeSDKIdentityPutAppInstanceUserExpirationSettingsRequest
 @see AWSChimeSDKIdentityPutAppInstanceUserExpirationSettingsResponse
 */
- (void)putAppInstanceUserExpirationSettings:(AWSChimeSDKIdentityPutAppInstanceUserExpirationSettingsRequest *)request completionHandler:(void (^ _Nullable)(AWSChimeSDKIdentityPutAppInstanceUserExpirationSettingsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Registers an endpoint under an Amazon Chime <code>AppInstanceUser</code>. The endpoint receives messages for a user. For push notifications, the endpoint is a mobile device used to receive mobile push notifications for a user.</p>
 
 @param request A container for the necessary parameters to execute the RegisterAppInstanceUserEndpoint service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimeSDKIdentityRegisterAppInstanceUserEndpointResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeSDKIdentityErrorDomain` domain and the following error code: `AWSChimeSDKIdentityErrorBadRequest`, `AWSChimeSDKIdentityErrorConflict`, `AWSChimeSDKIdentityErrorForbidden`, `AWSChimeSDKIdentityErrorResourceLimitExceeded`, `AWSChimeSDKIdentityErrorThrottledClient`, `AWSChimeSDKIdentityErrorUnauthorizedClient`, `AWSChimeSDKIdentityErrorServiceUnavailable`, `AWSChimeSDKIdentityErrorServiceFailure`.
 
 @see AWSChimeSDKIdentityRegisterAppInstanceUserEndpointRequest
 @see AWSChimeSDKIdentityRegisterAppInstanceUserEndpointResponse
 */
- (AWSTask<AWSChimeSDKIdentityRegisterAppInstanceUserEndpointResponse *> *)registerAppInstanceUserEndpoint:(AWSChimeSDKIdentityRegisterAppInstanceUserEndpointRequest *)request;

/**
 <p>Registers an endpoint under an Amazon Chime <code>AppInstanceUser</code>. The endpoint receives messages for a user. For push notifications, the endpoint is a mobile device used to receive mobile push notifications for a user.</p>
 
 @param request A container for the necessary parameters to execute the RegisterAppInstanceUserEndpoint service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeSDKIdentityErrorDomain` domain and the following error code: `AWSChimeSDKIdentityErrorBadRequest`, `AWSChimeSDKIdentityErrorConflict`, `AWSChimeSDKIdentityErrorForbidden`, `AWSChimeSDKIdentityErrorResourceLimitExceeded`, `AWSChimeSDKIdentityErrorThrottledClient`, `AWSChimeSDKIdentityErrorUnauthorizedClient`, `AWSChimeSDKIdentityErrorServiceUnavailable`, `AWSChimeSDKIdentityErrorServiceFailure`.
 
 @see AWSChimeSDKIdentityRegisterAppInstanceUserEndpointRequest
 @see AWSChimeSDKIdentityRegisterAppInstanceUserEndpointResponse
 */
- (void)registerAppInstanceUserEndpoint:(AWSChimeSDKIdentityRegisterAppInstanceUserEndpointRequest *)request completionHandler:(void (^ _Nullable)(AWSChimeSDKIdentityRegisterAppInstanceUserEndpointResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Applies the specified tags to the specified Amazon Chime SDK identity resource.</p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeSDKIdentityErrorDomain` domain and the following error code: `AWSChimeSDKIdentityErrorBadRequest`, `AWSChimeSDKIdentityErrorForbidden`, `AWSChimeSDKIdentityErrorUnauthorizedClient`, `AWSChimeSDKIdentityErrorResourceLimitExceeded`, `AWSChimeSDKIdentityErrorThrottledClient`, `AWSChimeSDKIdentityErrorServiceUnavailable`, `AWSChimeSDKIdentityErrorServiceFailure`.
 
 @see AWSChimeSDKIdentityTagResourceRequest
 */
- (AWSTask *)tagResource:(AWSChimeSDKIdentityTagResourceRequest *)request;

/**
 <p>Applies the specified tags to the specified Amazon Chime SDK identity resource.</p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeSDKIdentityErrorDomain` domain and the following error code: `AWSChimeSDKIdentityErrorBadRequest`, `AWSChimeSDKIdentityErrorForbidden`, `AWSChimeSDKIdentityErrorUnauthorizedClient`, `AWSChimeSDKIdentityErrorResourceLimitExceeded`, `AWSChimeSDKIdentityErrorThrottledClient`, `AWSChimeSDKIdentityErrorServiceUnavailable`, `AWSChimeSDKIdentityErrorServiceFailure`.
 
 @see AWSChimeSDKIdentityTagResourceRequest
 */
- (void)tagResource:(AWSChimeSDKIdentityTagResourceRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Removes the specified tags from the specified Amazon Chime SDK identity resource.</p>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeSDKIdentityErrorDomain` domain and the following error code: `AWSChimeSDKIdentityErrorBadRequest`, `AWSChimeSDKIdentityErrorForbidden`, `AWSChimeSDKIdentityErrorUnauthorizedClient`, `AWSChimeSDKIdentityErrorThrottledClient`, `AWSChimeSDKIdentityErrorServiceUnavailable`, `AWSChimeSDKIdentityErrorServiceFailure`.
 
 @see AWSChimeSDKIdentityUntagResourceRequest
 */
- (AWSTask *)untagResource:(AWSChimeSDKIdentityUntagResourceRequest *)request;

/**
 <p>Removes the specified tags from the specified Amazon Chime SDK identity resource.</p>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeSDKIdentityErrorDomain` domain and the following error code: `AWSChimeSDKIdentityErrorBadRequest`, `AWSChimeSDKIdentityErrorForbidden`, `AWSChimeSDKIdentityErrorUnauthorizedClient`, `AWSChimeSDKIdentityErrorThrottledClient`, `AWSChimeSDKIdentityErrorServiceUnavailable`, `AWSChimeSDKIdentityErrorServiceFailure`.
 
 @see AWSChimeSDKIdentityUntagResourceRequest
 */
- (void)untagResource:(AWSChimeSDKIdentityUntagResourceRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Updates <code>AppInstance</code> metadata.</p>
 
 @param request A container for the necessary parameters to execute the UpdateAppInstance service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimeSDKIdentityUpdateAppInstanceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeSDKIdentityErrorDomain` domain and the following error code: `AWSChimeSDKIdentityErrorBadRequest`, `AWSChimeSDKIdentityErrorConflict`, `AWSChimeSDKIdentityErrorForbidden`, `AWSChimeSDKIdentityErrorThrottledClient`, `AWSChimeSDKIdentityErrorUnauthorizedClient`, `AWSChimeSDKIdentityErrorServiceUnavailable`, `AWSChimeSDKIdentityErrorServiceFailure`.
 
 @see AWSChimeSDKIdentityUpdateAppInstanceRequest
 @see AWSChimeSDKIdentityUpdateAppInstanceResponse
 */
- (AWSTask<AWSChimeSDKIdentityUpdateAppInstanceResponse *> *)updateAppInstance:(AWSChimeSDKIdentityUpdateAppInstanceRequest *)request;

/**
 <p>Updates <code>AppInstance</code> metadata.</p>
 
 @param request A container for the necessary parameters to execute the UpdateAppInstance service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeSDKIdentityErrorDomain` domain and the following error code: `AWSChimeSDKIdentityErrorBadRequest`, `AWSChimeSDKIdentityErrorConflict`, `AWSChimeSDKIdentityErrorForbidden`, `AWSChimeSDKIdentityErrorThrottledClient`, `AWSChimeSDKIdentityErrorUnauthorizedClient`, `AWSChimeSDKIdentityErrorServiceUnavailable`, `AWSChimeSDKIdentityErrorServiceFailure`.
 
 @see AWSChimeSDKIdentityUpdateAppInstanceRequest
 @see AWSChimeSDKIdentityUpdateAppInstanceResponse
 */
- (void)updateAppInstance:(AWSChimeSDKIdentityUpdateAppInstanceRequest *)request completionHandler:(void (^ _Nullable)(AWSChimeSDKIdentityUpdateAppInstanceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the name and metadata of an <code>AppInstanceBot</code>.</p>
 
 @param request A container for the necessary parameters to execute the UpdateAppInstanceBot service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimeSDKIdentityUpdateAppInstanceBotResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeSDKIdentityErrorDomain` domain and the following error code: `AWSChimeSDKIdentityErrorBadRequest`, `AWSChimeSDKIdentityErrorConflict`, `AWSChimeSDKIdentityErrorForbidden`, `AWSChimeSDKIdentityErrorResourceLimitExceeded`, `AWSChimeSDKIdentityErrorThrottledClient`, `AWSChimeSDKIdentityErrorUnauthorizedClient`, `AWSChimeSDKIdentityErrorServiceUnavailable`, `AWSChimeSDKIdentityErrorServiceFailure`.
 
 @see AWSChimeSDKIdentityUpdateAppInstanceBotRequest
 @see AWSChimeSDKIdentityUpdateAppInstanceBotResponse
 */
- (AWSTask<AWSChimeSDKIdentityUpdateAppInstanceBotResponse *> *)updateAppInstanceBot:(AWSChimeSDKIdentityUpdateAppInstanceBotRequest *)request;

/**
 <p>Updates the name and metadata of an <code>AppInstanceBot</code>.</p>
 
 @param request A container for the necessary parameters to execute the UpdateAppInstanceBot service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeSDKIdentityErrorDomain` domain and the following error code: `AWSChimeSDKIdentityErrorBadRequest`, `AWSChimeSDKIdentityErrorConflict`, `AWSChimeSDKIdentityErrorForbidden`, `AWSChimeSDKIdentityErrorResourceLimitExceeded`, `AWSChimeSDKIdentityErrorThrottledClient`, `AWSChimeSDKIdentityErrorUnauthorizedClient`, `AWSChimeSDKIdentityErrorServiceUnavailable`, `AWSChimeSDKIdentityErrorServiceFailure`.
 
 @see AWSChimeSDKIdentityUpdateAppInstanceBotRequest
 @see AWSChimeSDKIdentityUpdateAppInstanceBotResponse
 */
- (void)updateAppInstanceBot:(AWSChimeSDKIdentityUpdateAppInstanceBotRequest *)request completionHandler:(void (^ _Nullable)(AWSChimeSDKIdentityUpdateAppInstanceBotResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the details of an <code>AppInstanceUser</code>. You can update names and metadata.</p>
 
 @param request A container for the necessary parameters to execute the UpdateAppInstanceUser service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimeSDKIdentityUpdateAppInstanceUserResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeSDKIdentityErrorDomain` domain and the following error code: `AWSChimeSDKIdentityErrorBadRequest`, `AWSChimeSDKIdentityErrorConflict`, `AWSChimeSDKIdentityErrorForbidden`, `AWSChimeSDKIdentityErrorResourceLimitExceeded`, `AWSChimeSDKIdentityErrorThrottledClient`, `AWSChimeSDKIdentityErrorUnauthorizedClient`, `AWSChimeSDKIdentityErrorServiceUnavailable`, `AWSChimeSDKIdentityErrorServiceFailure`.
 
 @see AWSChimeSDKIdentityUpdateAppInstanceUserRequest
 @see AWSChimeSDKIdentityUpdateAppInstanceUserResponse
 */
- (AWSTask<AWSChimeSDKIdentityUpdateAppInstanceUserResponse *> *)updateAppInstanceUser:(AWSChimeSDKIdentityUpdateAppInstanceUserRequest *)request;

/**
 <p>Updates the details of an <code>AppInstanceUser</code>. You can update names and metadata.</p>
 
 @param request A container for the necessary parameters to execute the UpdateAppInstanceUser service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeSDKIdentityErrorDomain` domain and the following error code: `AWSChimeSDKIdentityErrorBadRequest`, `AWSChimeSDKIdentityErrorConflict`, `AWSChimeSDKIdentityErrorForbidden`, `AWSChimeSDKIdentityErrorResourceLimitExceeded`, `AWSChimeSDKIdentityErrorThrottledClient`, `AWSChimeSDKIdentityErrorUnauthorizedClient`, `AWSChimeSDKIdentityErrorServiceUnavailable`, `AWSChimeSDKIdentityErrorServiceFailure`.
 
 @see AWSChimeSDKIdentityUpdateAppInstanceUserRequest
 @see AWSChimeSDKIdentityUpdateAppInstanceUserResponse
 */
- (void)updateAppInstanceUser:(AWSChimeSDKIdentityUpdateAppInstanceUserRequest *)request completionHandler:(void (^ _Nullable)(AWSChimeSDKIdentityUpdateAppInstanceUserResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the details of an <code>AppInstanceUserEndpoint</code>. You can update the name and <code>AllowMessage</code> values.</p>
 
 @param request A container for the necessary parameters to execute the UpdateAppInstanceUserEndpoint service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSChimeSDKIdentityUpdateAppInstanceUserEndpointResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSChimeSDKIdentityErrorDomain` domain and the following error code: `AWSChimeSDKIdentityErrorBadRequest`, `AWSChimeSDKIdentityErrorConflict`, `AWSChimeSDKIdentityErrorForbidden`, `AWSChimeSDKIdentityErrorThrottledClient`, `AWSChimeSDKIdentityErrorUnauthorizedClient`, `AWSChimeSDKIdentityErrorServiceUnavailable`, `AWSChimeSDKIdentityErrorServiceFailure`.
 
 @see AWSChimeSDKIdentityUpdateAppInstanceUserEndpointRequest
 @see AWSChimeSDKIdentityUpdateAppInstanceUserEndpointResponse
 */
- (AWSTask<AWSChimeSDKIdentityUpdateAppInstanceUserEndpointResponse *> *)updateAppInstanceUserEndpoint:(AWSChimeSDKIdentityUpdateAppInstanceUserEndpointRequest *)request;

/**
 <p>Updates the details of an <code>AppInstanceUserEndpoint</code>. You can update the name and <code>AllowMessage</code> values.</p>
 
 @param request A container for the necessary parameters to execute the UpdateAppInstanceUserEndpoint service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSChimeSDKIdentityErrorDomain` domain and the following error code: `AWSChimeSDKIdentityErrorBadRequest`, `AWSChimeSDKIdentityErrorConflict`, `AWSChimeSDKIdentityErrorForbidden`, `AWSChimeSDKIdentityErrorThrottledClient`, `AWSChimeSDKIdentityErrorUnauthorizedClient`, `AWSChimeSDKIdentityErrorServiceUnavailable`, `AWSChimeSDKIdentityErrorServiceFailure`.
 
 @see AWSChimeSDKIdentityUpdateAppInstanceUserEndpointRequest
 @see AWSChimeSDKIdentityUpdateAppInstanceUserEndpointResponse
 */
- (void)updateAppInstanceUserEndpoint:(AWSChimeSDKIdentityUpdateAppInstanceUserEndpointRequest *)request completionHandler:(void (^ _Nullable)(AWSChimeSDKIdentityUpdateAppInstanceUserEndpointResponse * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
