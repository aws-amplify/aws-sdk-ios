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
#import "AWSCognitoIdentityProviderModel.h"
#import "AWSCognitoIdentityProviderResources.h"

NS_ASSUME_NONNULL_BEGIN

/**
 
 */
@interface AWSCognitoIdentityProvider : AWSService

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

     let CognitoIdentityProvider = AWSCognitoIdentityProvider.defaultCognitoIdentityProvider()

 *Objective-C*

     AWSCognitoIdentityProvider *CognitoIdentityProvider = [AWSCognitoIdentityProvider defaultCognitoIdentityProvider];

 @return The default service client.
 */
+ (instancetype)defaultCognitoIdentityProvider;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
         let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
         let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
         AWSCognitoIdentityProvider.registerCognitoIdentityProviderWithConfiguration(configuration, forKey: "USWest2CognitoIdentityProvider")

         return true
     }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:@"USWest2CognitoIdentityProvider"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let CognitoIdentityProvider = AWSCognitoIdentityProvider(forKey: "USWest2CognitoIdentityProvider")

 *Objective-C*

     AWSCognitoIdentityProvider *CognitoIdentityProvider = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:@"USWest2CognitoIdentityProvider"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerCognitoIdentityProviderWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerCognitoIdentityProviderWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
         let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
         let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
         AWSCognitoIdentityProvider.registerCognitoIdentityProviderWithConfiguration(configuration, forKey: "USWest2CognitoIdentityProvider")

         return true
     }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:@"USWest2CognitoIdentityProvider"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let CognitoIdentityProvider = AWSCognitoIdentityProvider(forKey: "USWest2CognitoIdentityProvider")

 *Objective-C*

     AWSCognitoIdentityProvider *CognitoIdentityProvider = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:@"USWest2CognitoIdentityProvider"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)CognitoIdentityProviderForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removeCognitoIdentityProviderForKey:(NSString *)key;

/**
 AddCustomAttributes
 
 @param request A container for the necessary parameters to execute the AddCustomAttributes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderAddCustomAttributesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderAddCustomAttributesRequest
 @see AWSCognitoIdentityProviderAddCustomAttributesResponse
 */
- (AWSTask<AWSCognitoIdentityProviderAddCustomAttributesResponse *> *)addCustomAttributes:(AWSCognitoIdentityProviderAddCustomAttributesRequest *)request;

/**
 AddCustomAttributes
 
 @param request A container for the necessary parameters to execute the AddCustomAttributes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderAddCustomAttributesRequest
 @see AWSCognitoIdentityProviderAddCustomAttributesResponse
 */
- (void)addCustomAttributes:(AWSCognitoIdentityProviderAddCustomAttributesRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderAddCustomAttributesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 AdminConfirmSignUp
 
 @param request A container for the necessary parameters to execute the AdminConfirmSignUp service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderAdminConfirmSignUpResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorUnexpectedLambda`, `AWSCognitoIdentityProviderErrorUserLambdaValidation`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorTooManyFailedAttempts`, `AWSCognitoIdentityProviderErrorInvalidLambdaResponse`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderAdminConfirmSignUpRequest
 @see AWSCognitoIdentityProviderAdminConfirmSignUpResponse
 */
- (AWSTask<AWSCognitoIdentityProviderAdminConfirmSignUpResponse *> *)adminConfirmSignUp:(AWSCognitoIdentityProviderAdminConfirmSignUpRequest *)request;

/**
 AdminConfirmSignUp
 
 @param request A container for the necessary parameters to execute the AdminConfirmSignUp service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorUnexpectedLambda`, `AWSCognitoIdentityProviderErrorUserLambdaValidation`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorTooManyFailedAttempts`, `AWSCognitoIdentityProviderErrorInvalidLambdaResponse`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderAdminConfirmSignUpRequest
 @see AWSCognitoIdentityProviderAdminConfirmSignUpResponse
 */
- (void)adminConfirmSignUp:(AWSCognitoIdentityProviderAdminConfirmSignUpRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderAdminConfirmSignUpResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 AdminDeleteUser
 
 @param request A container for the necessary parameters to execute the AdminDeleteUser service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderAdminDeleteUserRequest
 */
- (AWSTask *)adminDeleteUser:(AWSCognitoIdentityProviderAdminDeleteUserRequest *)request;

/**
 AdminDeleteUser
 
 @param request A container for the necessary parameters to execute the AdminDeleteUser service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderAdminDeleteUserRequest
 */
- (void)adminDeleteUser:(AWSCognitoIdentityProviderAdminDeleteUserRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 AdminDeleteUserAttributes
 
 @param request A container for the necessary parameters to execute the AdminDeleteUserAttributes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderAdminDeleteUserAttributesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderAdminDeleteUserAttributesRequest
 @see AWSCognitoIdentityProviderAdminDeleteUserAttributesResponse
 */
- (AWSTask<AWSCognitoIdentityProviderAdminDeleteUserAttributesResponse *> *)adminDeleteUserAttributes:(AWSCognitoIdentityProviderAdminDeleteUserAttributesRequest *)request;

/**
 AdminDeleteUserAttributes
 
 @param request A container for the necessary parameters to execute the AdminDeleteUserAttributes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderAdminDeleteUserAttributesRequest
 @see AWSCognitoIdentityProviderAdminDeleteUserAttributesResponse
 */
- (void)adminDeleteUserAttributes:(AWSCognitoIdentityProviderAdminDeleteUserAttributesRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderAdminDeleteUserAttributesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 AdminDisableUser
 
 @param request A container for the necessary parameters to execute the AdminDisableUser service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderAdminDisableUserResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderAdminDisableUserRequest
 @see AWSCognitoIdentityProviderAdminDisableUserResponse
 */
- (AWSTask<AWSCognitoIdentityProviderAdminDisableUserResponse *> *)adminDisableUser:(AWSCognitoIdentityProviderAdminDisableUserRequest *)request;

/**
 AdminDisableUser
 
 @param request A container for the necessary parameters to execute the AdminDisableUser service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderAdminDisableUserRequest
 @see AWSCognitoIdentityProviderAdminDisableUserResponse
 */
- (void)adminDisableUser:(AWSCognitoIdentityProviderAdminDisableUserRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderAdminDisableUserResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 AdminEnableUser
 
 @param request A container for the necessary parameters to execute the AdminEnableUser service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderAdminEnableUserResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderAdminEnableUserRequest
 @see AWSCognitoIdentityProviderAdminEnableUserResponse
 */
- (AWSTask<AWSCognitoIdentityProviderAdminEnableUserResponse *> *)adminEnableUser:(AWSCognitoIdentityProviderAdminEnableUserRequest *)request;

/**
 AdminEnableUser
 
 @param request A container for the necessary parameters to execute the AdminEnableUser service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderAdminEnableUserRequest
 @see AWSCognitoIdentityProviderAdminEnableUserResponse
 */
- (void)adminEnableUser:(AWSCognitoIdentityProviderAdminEnableUserRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderAdminEnableUserResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 AdminGetUser
 
 @param request A container for the necessary parameters to execute the AdminGetUser service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderAdminGetUserResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderAdminGetUserRequest
 @see AWSCognitoIdentityProviderAdminGetUserResponse
 */
- (AWSTask<AWSCognitoIdentityProviderAdminGetUserResponse *> *)adminGetUser:(AWSCognitoIdentityProviderAdminGetUserRequest *)request;

/**
 AdminGetUser
 
 @param request A container for the necessary parameters to execute the AdminGetUser service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderAdminGetUserRequest
 @see AWSCognitoIdentityProviderAdminGetUserResponse
 */
- (void)adminGetUser:(AWSCognitoIdentityProviderAdminGetUserRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderAdminGetUserResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 AdminResetUserPassword
 
 @param request A container for the necessary parameters to execute the AdminResetUserPassword service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderAdminResetUserPasswordResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorUnexpectedLambda`, `AWSCognitoIdentityProviderErrorUserLambdaValidation`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorInvalidLambdaResponse`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderAdminResetUserPasswordRequest
 @see AWSCognitoIdentityProviderAdminResetUserPasswordResponse
 */
- (AWSTask<AWSCognitoIdentityProviderAdminResetUserPasswordResponse *> *)adminResetUserPassword:(AWSCognitoIdentityProviderAdminResetUserPasswordRequest *)request;

/**
 AdminResetUserPassword
 
 @param request A container for the necessary parameters to execute the AdminResetUserPassword service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorUnexpectedLambda`, `AWSCognitoIdentityProviderErrorUserLambdaValidation`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorInvalidLambdaResponse`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderAdminResetUserPasswordRequest
 @see AWSCognitoIdentityProviderAdminResetUserPasswordResponse
 */
- (void)adminResetUserPassword:(AWSCognitoIdentityProviderAdminResetUserPasswordRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderAdminResetUserPasswordResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 AdminSetUserSettings
 
 @param request A container for the necessary parameters to execute the AdminSetUserSettings service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderAdminSetUserSettingsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorNotAuthorized`.
 
 @see AWSCognitoIdentityProviderAdminSetUserSettingsRequest
 @see AWSCognitoIdentityProviderAdminSetUserSettingsResponse
 */
- (AWSTask<AWSCognitoIdentityProviderAdminSetUserSettingsResponse *> *)adminSetUserSettings:(AWSCognitoIdentityProviderAdminSetUserSettingsRequest *)request;

/**
 AdminSetUserSettings
 
 @param request A container for the necessary parameters to execute the AdminSetUserSettings service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorNotAuthorized`.
 
 @see AWSCognitoIdentityProviderAdminSetUserSettingsRequest
 @see AWSCognitoIdentityProviderAdminSetUserSettingsResponse
 */
- (void)adminSetUserSettings:(AWSCognitoIdentityProviderAdminSetUserSettingsRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderAdminSetUserSettingsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 AdminUpdateUserAttributes
 
 @param request A container for the necessary parameters to execute the AdminUpdateUserAttributes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderAdminUpdateUserAttributesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorUnexpectedLambda`, `AWSCognitoIdentityProviderErrorUserLambdaValidation`, `AWSCognitoIdentityProviderErrorInvalidLambdaResponse`, `AWSCognitoIdentityProviderErrorAliasExists`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderAdminUpdateUserAttributesRequest
 @see AWSCognitoIdentityProviderAdminUpdateUserAttributesResponse
 */
- (AWSTask<AWSCognitoIdentityProviderAdminUpdateUserAttributesResponse *> *)adminUpdateUserAttributes:(AWSCognitoIdentityProviderAdminUpdateUserAttributesRequest *)request;

/**
 AdminUpdateUserAttributes
 
 @param request A container for the necessary parameters to execute the AdminUpdateUserAttributes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorUnexpectedLambda`, `AWSCognitoIdentityProviderErrorUserLambdaValidation`, `AWSCognitoIdentityProviderErrorInvalidLambdaResponse`, `AWSCognitoIdentityProviderErrorAliasExists`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderAdminUpdateUserAttributesRequest
 @see AWSCognitoIdentityProviderAdminUpdateUserAttributesResponse
 */
- (void)adminUpdateUserAttributes:(AWSCognitoIdentityProviderAdminUpdateUserAttributesRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderAdminUpdateUserAttributesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Authenticate
 
 @param request A container for the necessary parameters to execute the Authenticate service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderAuthenticateResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUnexpectedLambda`, `AWSCognitoIdentityProviderErrorUserLambdaValidation`, `AWSCognitoIdentityProviderErrorInvalidLambdaResponse`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderAuthenticateRequest
 @see AWSCognitoIdentityProviderAuthenticateResponse
 */
- (AWSTask<AWSCognitoIdentityProviderAuthenticateResponse *> *)authenticate:(AWSCognitoIdentityProviderAuthenticateRequest *)request;

/**
 Authenticate
 
 @param request A container for the necessary parameters to execute the Authenticate service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUnexpectedLambda`, `AWSCognitoIdentityProviderErrorUserLambdaValidation`, `AWSCognitoIdentityProviderErrorInvalidLambdaResponse`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderAuthenticateRequest
 @see AWSCognitoIdentityProviderAuthenticateResponse
 */
- (void)authenticate:(AWSCognitoIdentityProviderAuthenticateRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderAuthenticateResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 ChangePassword
 
 @param request A container for the necessary parameters to execute the ChangePassword service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderChangePasswordResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorInvalidPassword`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderChangePasswordRequest
 @see AWSCognitoIdentityProviderChangePasswordResponse
 */
- (AWSTask<AWSCognitoIdentityProviderChangePasswordResponse *> *)changePassword:(AWSCognitoIdentityProviderChangePasswordRequest *)request;

/**
 ChangePassword
 
 @param request A container for the necessary parameters to execute the ChangePassword service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorInvalidPassword`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderChangePasswordRequest
 @see AWSCognitoIdentityProviderChangePasswordResponse
 */
- (void)changePassword:(AWSCognitoIdentityProviderChangePasswordRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderChangePasswordResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 ConfirmForgotPassword
 
 @param request A container for the necessary parameters to execute the ConfirmForgotPassword service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderConfirmForgotPasswordResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorUnexpectedLambda`, `AWSCognitoIdentityProviderErrorUserLambdaValidation`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorInvalidPassword`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorCodeMismatch`, `AWSCognitoIdentityProviderErrorExpiredCode`, `AWSCognitoIdentityProviderErrorTooManyFailedAttempts`, `AWSCognitoIdentityProviderErrorInvalidLambdaResponse`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderConfirmForgotPasswordRequest
 @see AWSCognitoIdentityProviderConfirmForgotPasswordResponse
 */
- (AWSTask<AWSCognitoIdentityProviderConfirmForgotPasswordResponse *> *)confirmForgotPassword:(AWSCognitoIdentityProviderConfirmForgotPasswordRequest *)request;

/**
 ConfirmForgotPassword
 
 @param request A container for the necessary parameters to execute the ConfirmForgotPassword service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorUnexpectedLambda`, `AWSCognitoIdentityProviderErrorUserLambdaValidation`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorInvalidPassword`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorCodeMismatch`, `AWSCognitoIdentityProviderErrorExpiredCode`, `AWSCognitoIdentityProviderErrorTooManyFailedAttempts`, `AWSCognitoIdentityProviderErrorInvalidLambdaResponse`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderConfirmForgotPasswordRequest
 @see AWSCognitoIdentityProviderConfirmForgotPasswordResponse
 */
- (void)confirmForgotPassword:(AWSCognitoIdentityProviderConfirmForgotPasswordRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderConfirmForgotPasswordResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 ConfirmSignUp
 
 @param request A container for the necessary parameters to execute the ConfirmSignUp service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderConfirmSignUpResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorUnexpectedLambda`, `AWSCognitoIdentityProviderErrorUserLambdaValidation`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorTooManyFailedAttempts`, `AWSCognitoIdentityProviderErrorCodeMismatch`, `AWSCognitoIdentityProviderErrorExpiredCode`, `AWSCognitoIdentityProviderErrorInvalidLambdaResponse`, `AWSCognitoIdentityProviderErrorAliasExists`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderConfirmSignUpRequest
 @see AWSCognitoIdentityProviderConfirmSignUpResponse
 */
- (AWSTask<AWSCognitoIdentityProviderConfirmSignUpResponse *> *)confirmSignUp:(AWSCognitoIdentityProviderConfirmSignUpRequest *)request;

/**
 ConfirmSignUp
 
 @param request A container for the necessary parameters to execute the ConfirmSignUp service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorUnexpectedLambda`, `AWSCognitoIdentityProviderErrorUserLambdaValidation`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorTooManyFailedAttempts`, `AWSCognitoIdentityProviderErrorCodeMismatch`, `AWSCognitoIdentityProviderErrorExpiredCode`, `AWSCognitoIdentityProviderErrorInvalidLambdaResponse`, `AWSCognitoIdentityProviderErrorAliasExists`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderConfirmSignUpRequest
 @see AWSCognitoIdentityProviderConfirmSignUpResponse
 */
- (void)confirmSignUp:(AWSCognitoIdentityProviderConfirmSignUpRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderConfirmSignUpResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 CreateUserPool
 
 @param request A container for the necessary parameters to execute the CreateUserPool service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderCreateUserPoolResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderCreateUserPoolRequest
 @see AWSCognitoIdentityProviderCreateUserPoolResponse
 */
- (AWSTask<AWSCognitoIdentityProviderCreateUserPoolResponse *> *)createUserPool:(AWSCognitoIdentityProviderCreateUserPoolRequest *)request;

/**
 CreateUserPool
 
 @param request A container for the necessary parameters to execute the CreateUserPool service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderCreateUserPoolRequest
 @see AWSCognitoIdentityProviderCreateUserPoolResponse
 */
- (void)createUserPool:(AWSCognitoIdentityProviderCreateUserPoolRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderCreateUserPoolResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 CreateUserPoolClient
 
 @param request A container for the necessary parameters to execute the CreateUserPoolClient service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderCreateUserPoolClientResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderCreateUserPoolClientRequest
 @see AWSCognitoIdentityProviderCreateUserPoolClientResponse
 */
- (AWSTask<AWSCognitoIdentityProviderCreateUserPoolClientResponse *> *)createUserPoolClient:(AWSCognitoIdentityProviderCreateUserPoolClientRequest *)request;

/**
 CreateUserPoolClient
 
 @param request A container for the necessary parameters to execute the CreateUserPoolClient service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderCreateUserPoolClientRequest
 @see AWSCognitoIdentityProviderCreateUserPoolClientResponse
 */
- (void)createUserPoolClient:(AWSCognitoIdentityProviderCreateUserPoolClientRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderCreateUserPoolClientResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 DeleteUser
 
 @param request A container for the necessary parameters to execute the DeleteUser service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderDeleteUserRequest
 */
- (AWSTask *)deleteUser:(AWSCognitoIdentityProviderDeleteUserRequest *)request;

/**
 DeleteUser
 
 @param request A container for the necessary parameters to execute the DeleteUser service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderDeleteUserRequest
 */
- (void)deleteUser:(AWSCognitoIdentityProviderDeleteUserRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 DeleteUserAttributes
 
 @param request A container for the necessary parameters to execute the DeleteUserAttributes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderDeleteUserAttributesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderDeleteUserAttributesRequest
 @see AWSCognitoIdentityProviderDeleteUserAttributesResponse
 */
- (AWSTask<AWSCognitoIdentityProviderDeleteUserAttributesResponse *> *)deleteUserAttributes:(AWSCognitoIdentityProviderDeleteUserAttributesRequest *)request;

/**
 DeleteUserAttributes
 
 @param request A container for the necessary parameters to execute the DeleteUserAttributes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderDeleteUserAttributesRequest
 @see AWSCognitoIdentityProviderDeleteUserAttributesResponse
 */
- (void)deleteUserAttributes:(AWSCognitoIdentityProviderDeleteUserAttributesRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderDeleteUserAttributesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 DeleteUserPool
 
 @param request A container for the necessary parameters to execute the DeleteUserPool service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderDeleteUserPoolRequest
 */
- (AWSTask *)deleteUserPool:(AWSCognitoIdentityProviderDeleteUserPoolRequest *)request;

/**
 DeleteUserPool
 
 @param request A container for the necessary parameters to execute the DeleteUserPool service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderDeleteUserPoolRequest
 */
- (void)deleteUserPool:(AWSCognitoIdentityProviderDeleteUserPoolRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 DeleteUserPoolClient
 
 @param request A container for the necessary parameters to execute the DeleteUserPoolClient service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderDeleteUserPoolClientRequest
 */
- (AWSTask *)deleteUserPoolClient:(AWSCognitoIdentityProviderDeleteUserPoolClientRequest *)request;

/**
 DeleteUserPoolClient
 
 @param request A container for the necessary parameters to execute the DeleteUserPoolClient service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderDeleteUserPoolClientRequest
 */
- (void)deleteUserPoolClient:(AWSCognitoIdentityProviderDeleteUserPoolClientRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 DescribeUserPool
 
 @param request A container for the necessary parameters to execute the DescribeUserPool service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderDescribeUserPoolResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderDescribeUserPoolRequest
 @see AWSCognitoIdentityProviderDescribeUserPoolResponse
 */
- (AWSTask<AWSCognitoIdentityProviderDescribeUserPoolResponse *> *)describeUserPool:(AWSCognitoIdentityProviderDescribeUserPoolRequest *)request;

/**
 DescribeUserPool
 
 @param request A container for the necessary parameters to execute the DescribeUserPool service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderDescribeUserPoolRequest
 @see AWSCognitoIdentityProviderDescribeUserPoolResponse
 */
- (void)describeUserPool:(AWSCognitoIdentityProviderDescribeUserPoolRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderDescribeUserPoolResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 DescribeUserPoolClient
 
 @param request A container for the necessary parameters to execute the DescribeUserPoolClient service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderDescribeUserPoolClientResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderDescribeUserPoolClientRequest
 @see AWSCognitoIdentityProviderDescribeUserPoolClientResponse
 */
- (AWSTask<AWSCognitoIdentityProviderDescribeUserPoolClientResponse *> *)describeUserPoolClient:(AWSCognitoIdentityProviderDescribeUserPoolClientRequest *)request;

/**
 DescribeUserPoolClient
 
 @param request A container for the necessary parameters to execute the DescribeUserPoolClient service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderDescribeUserPoolClientRequest
 @see AWSCognitoIdentityProviderDescribeUserPoolClientResponse
 */
- (void)describeUserPoolClient:(AWSCognitoIdentityProviderDescribeUserPoolClientRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderDescribeUserPoolClientResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 EnhanceAuth
 
 @param request A container for the necessary parameters to execute the EnhanceAuth service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderEnhanceAuthResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorCodeMismatch`, `AWSCognitoIdentityProviderErrorExpiredCode`, `AWSCognitoIdentityProviderErrorUnexpectedLambda`, `AWSCognitoIdentityProviderErrorUserLambdaValidation`, `AWSCognitoIdentityProviderErrorInvalidLambdaResponse`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderEnhanceAuthRequest
 @see AWSCognitoIdentityProviderEnhanceAuthResponse
 */
- (AWSTask<AWSCognitoIdentityProviderEnhanceAuthResponse *> *)enhanceAuth:(AWSCognitoIdentityProviderEnhanceAuthRequest *)request;

/**
 EnhanceAuth
 
 @param request A container for the necessary parameters to execute the EnhanceAuth service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorCodeMismatch`, `AWSCognitoIdentityProviderErrorExpiredCode`, `AWSCognitoIdentityProviderErrorUnexpectedLambda`, `AWSCognitoIdentityProviderErrorUserLambdaValidation`, `AWSCognitoIdentityProviderErrorInvalidLambdaResponse`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderEnhanceAuthRequest
 @see AWSCognitoIdentityProviderEnhanceAuthResponse
 */
- (void)enhanceAuth:(AWSCognitoIdentityProviderEnhanceAuthRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderEnhanceAuthResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 ForgotPassword
 
 @param request A container for the necessary parameters to execute the ForgotPassword service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderForgotPasswordResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorUnexpectedLambda`, `AWSCognitoIdentityProviderErrorUserLambdaValidation`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorInvalidLambdaResponse`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderForgotPasswordRequest
 @see AWSCognitoIdentityProviderForgotPasswordResponse
 */
- (AWSTask<AWSCognitoIdentityProviderForgotPasswordResponse *> *)forgotPassword:(AWSCognitoIdentityProviderForgotPasswordRequest *)request;

/**
 ForgotPassword
 
 @param request A container for the necessary parameters to execute the ForgotPassword service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorUnexpectedLambda`, `AWSCognitoIdentityProviderErrorUserLambdaValidation`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorInvalidLambdaResponse`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderForgotPasswordRequest
 @see AWSCognitoIdentityProviderForgotPasswordResponse
 */
- (void)forgotPassword:(AWSCognitoIdentityProviderForgotPasswordRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderForgotPasswordResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 GetAuthenticationDetails
 
 @param request A container for the necessary parameters to execute the GetAuthenticationDetails service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderGetAuthenticationDetailsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorUnexpectedLambda`, `AWSCognitoIdentityProviderErrorUserLambdaValidation`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorInvalidLambdaResponse`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderGetAuthenticationDetailsRequest
 @see AWSCognitoIdentityProviderGetAuthenticationDetailsResponse
 */
- (AWSTask<AWSCognitoIdentityProviderGetAuthenticationDetailsResponse *> *)getAuthenticationDetails:(AWSCognitoIdentityProviderGetAuthenticationDetailsRequest *)request;

/**
 GetAuthenticationDetails
 
 @param request A container for the necessary parameters to execute the GetAuthenticationDetails service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorUnexpectedLambda`, `AWSCognitoIdentityProviderErrorUserLambdaValidation`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorInvalidLambdaResponse`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderGetAuthenticationDetailsRequest
 @see AWSCognitoIdentityProviderGetAuthenticationDetailsResponse
 */
- (void)getAuthenticationDetails:(AWSCognitoIdentityProviderGetAuthenticationDetailsRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderGetAuthenticationDetailsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 GetJWKS
 
 @param request A container for the necessary parameters to execute the GetJWKS service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderGetJWKSResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderGetJWKSRequest
 @see AWSCognitoIdentityProviderGetJWKSResponse
 */
- (AWSTask<AWSCognitoIdentityProviderGetJWKSResponse *> *)getJWKS:(AWSCognitoIdentityProviderGetJWKSRequest *)request;

/**
 GetJWKS
 
 @param request A container for the necessary parameters to execute the GetJWKS service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderGetJWKSRequest
 @see AWSCognitoIdentityProviderGetJWKSResponse
 */
- (void)getJWKS:(AWSCognitoIdentityProviderGetJWKSRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderGetJWKSResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 GetOpenIdConfiguration
 
 @param request A container for the necessary parameters to execute the GetOpenIdConfiguration service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderGetOpenIdConfigurationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderGetOpenIdConfigurationRequest
 @see AWSCognitoIdentityProviderGetOpenIdConfigurationResponse
 */
- (AWSTask<AWSCognitoIdentityProviderGetOpenIdConfigurationResponse *> *)getOpenIdConfiguration:(AWSCognitoIdentityProviderGetOpenIdConfigurationRequest *)request;

/**
 GetOpenIdConfiguration
 
 @param request A container for the necessary parameters to execute the GetOpenIdConfiguration service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderGetOpenIdConfigurationRequest
 @see AWSCognitoIdentityProviderGetOpenIdConfigurationResponse
 */
- (void)getOpenIdConfiguration:(AWSCognitoIdentityProviderGetOpenIdConfigurationRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderGetOpenIdConfigurationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 GetUser
 
 @param request A container for the necessary parameters to execute the GetUser service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderGetUserResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderGetUserRequest
 @see AWSCognitoIdentityProviderGetUserResponse
 */
- (AWSTask<AWSCognitoIdentityProviderGetUserResponse *> *)getUser:(AWSCognitoIdentityProviderGetUserRequest *)request;

/**
 GetUser
 
 @param request A container for the necessary parameters to execute the GetUser service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderGetUserRequest
 @see AWSCognitoIdentityProviderGetUserResponse
 */
- (void)getUser:(AWSCognitoIdentityProviderGetUserRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderGetUserResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 GetUserAttributeVerificationCode
 
 @param request A container for the necessary parameters to execute the GetUserAttributeVerificationCode service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderGetUserAttributeVerificationCodeResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUnexpectedLambda`, `AWSCognitoIdentityProviderErrorUserLambdaValidation`, `AWSCognitoIdentityProviderErrorInvalidLambdaResponse`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderGetUserAttributeVerificationCodeRequest
 @see AWSCognitoIdentityProviderGetUserAttributeVerificationCodeResponse
 */
- (AWSTask<AWSCognitoIdentityProviderGetUserAttributeVerificationCodeResponse *> *)getUserAttributeVerificationCode:(AWSCognitoIdentityProviderGetUserAttributeVerificationCodeRequest *)request;

/**
 GetUserAttributeVerificationCode
 
 @param request A container for the necessary parameters to execute the GetUserAttributeVerificationCode service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUnexpectedLambda`, `AWSCognitoIdentityProviderErrorUserLambdaValidation`, `AWSCognitoIdentityProviderErrorInvalidLambdaResponse`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderGetUserAttributeVerificationCodeRequest
 @see AWSCognitoIdentityProviderGetUserAttributeVerificationCodeResponse
 */
- (void)getUserAttributeVerificationCode:(AWSCognitoIdentityProviderGetUserAttributeVerificationCodeRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderGetUserAttributeVerificationCodeResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 ListUserPoolClients
 
 @param request A container for the necessary parameters to execute the ListUserPoolClients service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderListUserPoolClientsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderListUserPoolClientsRequest
 @see AWSCognitoIdentityProviderListUserPoolClientsResponse
 */
- (AWSTask<AWSCognitoIdentityProviderListUserPoolClientsResponse *> *)listUserPoolClients:(AWSCognitoIdentityProviderListUserPoolClientsRequest *)request;

/**
 ListUserPoolClients
 
 @param request A container for the necessary parameters to execute the ListUserPoolClients service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderListUserPoolClientsRequest
 @see AWSCognitoIdentityProviderListUserPoolClientsResponse
 */
- (void)listUserPoolClients:(AWSCognitoIdentityProviderListUserPoolClientsRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderListUserPoolClientsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 ListUserPools
 
 @param request A container for the necessary parameters to execute the ListUserPools service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderListUserPoolsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderListUserPoolsRequest
 @see AWSCognitoIdentityProviderListUserPoolsResponse
 */
- (AWSTask<AWSCognitoIdentityProviderListUserPoolsResponse *> *)listUserPools:(AWSCognitoIdentityProviderListUserPoolsRequest *)request;

/**
 ListUserPools
 
 @param request A container for the necessary parameters to execute the ListUserPools service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderListUserPoolsRequest
 @see AWSCognitoIdentityProviderListUserPoolsResponse
 */
- (void)listUserPools:(AWSCognitoIdentityProviderListUserPoolsRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderListUserPoolsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 ListUsers
 
 @param request A container for the necessary parameters to execute the ListUsers service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderListUsersResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderListUsersRequest
 @see AWSCognitoIdentityProviderListUsersResponse
 */
- (AWSTask<AWSCognitoIdentityProviderListUsersResponse *> *)listUsers:(AWSCognitoIdentityProviderListUsersRequest *)request;

/**
 ListUsers
 
 @param request A container for the necessary parameters to execute the ListUsers service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderListUsersRequest
 @see AWSCognitoIdentityProviderListUsersResponse
 */
- (void)listUsers:(AWSCognitoIdentityProviderListUsersRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderListUsersResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 RefreshTokens
 
 @param request A container for the necessary parameters to execute the RefreshTokens service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderRefreshTokensResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderRefreshTokensRequest
 @see AWSCognitoIdentityProviderRefreshTokensResponse
 */
- (AWSTask<AWSCognitoIdentityProviderRefreshTokensResponse *> *)refreshTokens:(AWSCognitoIdentityProviderRefreshTokensRequest *)request;

/**
 RefreshTokens
 
 @param request A container for the necessary parameters to execute the RefreshTokens service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderRefreshTokensRequest
 @see AWSCognitoIdentityProviderRefreshTokensResponse
 */
- (void)refreshTokens:(AWSCognitoIdentityProviderRefreshTokensRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderRefreshTokensResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 ResendConfirmationCode
 
 @param request A container for the necessary parameters to execute the ResendConfirmationCode service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderResendConfirmationCodeResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorUnexpectedLambda`, `AWSCognitoIdentityProviderErrorUserLambdaValidation`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorInvalidLambdaResponse`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderResendConfirmationCodeRequest
 @see AWSCognitoIdentityProviderResendConfirmationCodeResponse
 */
- (AWSTask<AWSCognitoIdentityProviderResendConfirmationCodeResponse *> *)resendConfirmationCode:(AWSCognitoIdentityProviderResendConfirmationCodeRequest *)request;

/**
 ResendConfirmationCode
 
 @param request A container for the necessary parameters to execute the ResendConfirmationCode service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorUnexpectedLambda`, `AWSCognitoIdentityProviderErrorUserLambdaValidation`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorInvalidLambdaResponse`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderResendConfirmationCodeRequest
 @see AWSCognitoIdentityProviderResendConfirmationCodeResponse
 */
- (void)resendConfirmationCode:(AWSCognitoIdentityProviderResendConfirmationCodeRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderResendConfirmationCodeResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 SetUserSettings
 
 @param request A container for the necessary parameters to execute the SetUserSettings service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderSetUserSettingsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorNotAuthorized`.
 
 @see AWSCognitoIdentityProviderSetUserSettingsRequest
 @see AWSCognitoIdentityProviderSetUserSettingsResponse
 */
- (AWSTask<AWSCognitoIdentityProviderSetUserSettingsResponse *> *)setUserSettings:(AWSCognitoIdentityProviderSetUserSettingsRequest *)request;

/**
 SetUserSettings
 
 @param request A container for the necessary parameters to execute the SetUserSettings service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorNotAuthorized`.
 
 @see AWSCognitoIdentityProviderSetUserSettingsRequest
 @see AWSCognitoIdentityProviderSetUserSettingsResponse
 */
- (void)setUserSettings:(AWSCognitoIdentityProviderSetUserSettingsRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderSetUserSettingsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 SignUp
 
 @param request A container for the necessary parameters to execute the SignUp service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderSignUpResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorUnexpectedLambda`, `AWSCognitoIdentityProviderErrorUserLambdaValidation`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorInvalidPassword`, `AWSCognitoIdentityProviderErrorInvalidLambdaResponse`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderSignUpRequest
 @see AWSCognitoIdentityProviderSignUpResponse
 */
- (AWSTask<AWSCognitoIdentityProviderSignUpResponse *> *)signUp:(AWSCognitoIdentityProviderSignUpRequest *)request;

/**
 SignUp
 
 @param request A container for the necessary parameters to execute the SignUp service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorUnexpectedLambda`, `AWSCognitoIdentityProviderErrorUserLambdaValidation`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorInvalidPassword`, `AWSCognitoIdentityProviderErrorInvalidLambdaResponse`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderSignUpRequest
 @see AWSCognitoIdentityProviderSignUpResponse
 */
- (void)signUp:(AWSCognitoIdentityProviderSignUpRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderSignUpResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 UpdateUserAttributes
 
 @param request A container for the necessary parameters to execute the UpdateUserAttributes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderUpdateUserAttributesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorCodeMismatch`, `AWSCognitoIdentityProviderErrorExpiredCode`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUnexpectedLambda`, `AWSCognitoIdentityProviderErrorUserLambdaValidation`, `AWSCognitoIdentityProviderErrorInvalidLambdaResponse`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorAliasExists`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderUpdateUserAttributesRequest
 @see AWSCognitoIdentityProviderUpdateUserAttributesResponse
 */
- (AWSTask<AWSCognitoIdentityProviderUpdateUserAttributesResponse *> *)updateUserAttributes:(AWSCognitoIdentityProviderUpdateUserAttributesRequest *)request;

/**
 UpdateUserAttributes
 
 @param request A container for the necessary parameters to execute the UpdateUserAttributes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorCodeMismatch`, `AWSCognitoIdentityProviderErrorExpiredCode`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUnexpectedLambda`, `AWSCognitoIdentityProviderErrorUserLambdaValidation`, `AWSCognitoIdentityProviderErrorInvalidLambdaResponse`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorAliasExists`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderUpdateUserAttributesRequest
 @see AWSCognitoIdentityProviderUpdateUserAttributesResponse
 */
- (void)updateUserAttributes:(AWSCognitoIdentityProviderUpdateUserAttributesRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderUpdateUserAttributesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 UpdateUserPool
 
 @param request A container for the necessary parameters to execute the UpdateUserPool service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderUpdateUserPoolResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorConcurrentModification`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderUpdateUserPoolRequest
 @see AWSCognitoIdentityProviderUpdateUserPoolResponse
 */
- (AWSTask<AWSCognitoIdentityProviderUpdateUserPoolResponse *> *)updateUserPool:(AWSCognitoIdentityProviderUpdateUserPoolRequest *)request;

/**
 UpdateUserPool
 
 @param request A container for the necessary parameters to execute the UpdateUserPool service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorConcurrentModification`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderUpdateUserPoolRequest
 @see AWSCognitoIdentityProviderUpdateUserPoolResponse
 */
- (void)updateUserPool:(AWSCognitoIdentityProviderUpdateUserPoolRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderUpdateUserPoolResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 UpdateUserPoolClient
 
 @param request A container for the necessary parameters to execute the UpdateUserPoolClient service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderUpdateUserPoolClientResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderUpdateUserPoolClientRequest
 @see AWSCognitoIdentityProviderUpdateUserPoolClientResponse
 */
- (AWSTask<AWSCognitoIdentityProviderUpdateUserPoolClientResponse *> *)updateUserPoolClient:(AWSCognitoIdentityProviderUpdateUserPoolClientRequest *)request;

/**
 UpdateUserPoolClient
 
 @param request A container for the necessary parameters to execute the UpdateUserPoolClient service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderUpdateUserPoolClientRequest
 @see AWSCognitoIdentityProviderUpdateUserPoolClientResponse
 */
- (void)updateUserPoolClient:(AWSCognitoIdentityProviderUpdateUserPoolClientRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderUpdateUserPoolClientResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 VerifyUserAttribute
 
 @param request A container for the necessary parameters to execute the VerifyUserAttribute service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderVerifyUserAttributeResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorCodeMismatch`, `AWSCognitoIdentityProviderErrorExpiredCode`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderVerifyUserAttributeRequest
 @see AWSCognitoIdentityProviderVerifyUserAttributeResponse
 */
- (AWSTask<AWSCognitoIdentityProviderVerifyUserAttributeResponse *> *)verifyUserAttribute:(AWSCognitoIdentityProviderVerifyUserAttributeRequest *)request;

/**
 VerifyUserAttribute
 
 @param request A container for the necessary parameters to execute the VerifyUserAttribute service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorCodeMismatch`, `AWSCognitoIdentityProviderErrorExpiredCode`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderVerifyUserAttributeRequest
 @see AWSCognitoIdentityProviderVerifyUserAttributeResponse
 */
- (void)verifyUserAttribute:(AWSCognitoIdentityProviderVerifyUserAttributeRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderVerifyUserAttributeResponse * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
