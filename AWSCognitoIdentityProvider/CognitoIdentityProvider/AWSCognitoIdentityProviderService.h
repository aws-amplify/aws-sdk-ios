//
// Copyright 2010-2017 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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
 <p>Using the Amazon Cognito Your User Pools API, you can create a user pool to manage directories and users. You can authenticate a user to obtain tokens related to user identity and access policies.</p><p>This API reference provides information about user pools in Amazon Cognito Your User Pools.</p><p>For more information, see the Amazon Cognito Documentation.</p>
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

     let CognitoIdentityProvider = AWSCognitoIdentityProvider.default()

 *Objective-C*

     AWSCognitoIdentityProvider *CognitoIdentityProvider = [AWSCognitoIdentityProvider defaultCognitoIdentityProvider];

 @return The default service client.
 */
+ (instancetype)defaultCognitoIdentityProvider;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSCognitoIdentityProvider.register(with: configuration!, forKey: "USWest2CognitoIdentityProvider")
 
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

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSCognitoIdentityProvider.register(with: configuration!, forKey: "USWest2CognitoIdentityProvider")
 
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
 <p>Adds additional user attributes to the user pool schema.</p>
 
 @param request A container for the necessary parameters to execute the AddCustomAttributes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderAddCustomAttributesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUserImportInProgress`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderAddCustomAttributesRequest
 @see AWSCognitoIdentityProviderAddCustomAttributesResponse
 */
- (AWSTask<AWSCognitoIdentityProviderAddCustomAttributesResponse *> *)addCustomAttributes:(AWSCognitoIdentityProviderAddCustomAttributesRequest *)request;

/**
 <p>Adds additional user attributes to the user pool schema.</p>
 
 @param request A container for the necessary parameters to execute the AddCustomAttributes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUserImportInProgress`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderAddCustomAttributesRequest
 @see AWSCognitoIdentityProviderAddCustomAttributesResponse
 */
- (void)addCustomAttributes:(AWSCognitoIdentityProviderAddCustomAttributesRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderAddCustomAttributesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Confirms user registration as an admin without using a confirmation code. Works on any user.</p>
 
 @param request A container for the necessary parameters to execute the AdminConfirmSignUp service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderAdminConfirmSignUpResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorUnexpectedLambda`, `AWSCognitoIdentityProviderErrorUserLambdaValidation`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorTooManyFailedAttempts`, `AWSCognitoIdentityProviderErrorInvalidLambdaResponse`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorLimitExceeded`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderAdminConfirmSignUpRequest
 @see AWSCognitoIdentityProviderAdminConfirmSignUpResponse
 */
- (AWSTask<AWSCognitoIdentityProviderAdminConfirmSignUpResponse *> *)adminConfirmSignUp:(AWSCognitoIdentityProviderAdminConfirmSignUpRequest *)request;

/**
 <p>Confirms user registration as an admin without using a confirmation code. Works on any user.</p>
 
 @param request A container for the necessary parameters to execute the AdminConfirmSignUp service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorUnexpectedLambda`, `AWSCognitoIdentityProviderErrorUserLambdaValidation`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorTooManyFailedAttempts`, `AWSCognitoIdentityProviderErrorInvalidLambdaResponse`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorLimitExceeded`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderAdminConfirmSignUpRequest
 @see AWSCognitoIdentityProviderAdminConfirmSignUpResponse
 */
- (void)adminConfirmSignUp:(AWSCognitoIdentityProviderAdminConfirmSignUpRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderAdminConfirmSignUpResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new user in the specified user pool and sends a welcome message via email or phone (SMS). This message is based on a template that you configured in your call to CreateUserPool or UpdateUserPool. This template includes your custom sign-up instructions and placeholders for user name and temporary password.</p><p>Requires developer credentials.</p>
 
 @param request A container for the necessary parameters to execute the AdminCreateUser service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderAdminCreateUserResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorUsernameExists`, `AWSCognitoIdentityProviderErrorInvalidPassword`, `AWSCognitoIdentityProviderErrorCodeDeliveryFailure`, `AWSCognitoIdentityProviderErrorUnexpectedLambda`, `AWSCognitoIdentityProviderErrorUserLambdaValidation`, `AWSCognitoIdentityProviderErrorInvalidLambdaResponse`, `AWSCognitoIdentityProviderErrorPreconditionNotMet`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleAccessPolicy`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleTrustRelationship`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUnsupportedUserState`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderAdminCreateUserRequest
 @see AWSCognitoIdentityProviderAdminCreateUserResponse
 */
- (AWSTask<AWSCognitoIdentityProviderAdminCreateUserResponse *> *)adminCreateUser:(AWSCognitoIdentityProviderAdminCreateUserRequest *)request;

/**
 <p>Creates a new user in the specified user pool and sends a welcome message via email or phone (SMS). This message is based on a template that you configured in your call to CreateUserPool or UpdateUserPool. This template includes your custom sign-up instructions and placeholders for user name and temporary password.</p><p>Requires developer credentials.</p>
 
 @param request A container for the necessary parameters to execute the AdminCreateUser service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorUsernameExists`, `AWSCognitoIdentityProviderErrorInvalidPassword`, `AWSCognitoIdentityProviderErrorCodeDeliveryFailure`, `AWSCognitoIdentityProviderErrorUnexpectedLambda`, `AWSCognitoIdentityProviderErrorUserLambdaValidation`, `AWSCognitoIdentityProviderErrorInvalidLambdaResponse`, `AWSCognitoIdentityProviderErrorPreconditionNotMet`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleAccessPolicy`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleTrustRelationship`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUnsupportedUserState`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderAdminCreateUserRequest
 @see AWSCognitoIdentityProviderAdminCreateUserResponse
 */
- (void)adminCreateUser:(AWSCognitoIdentityProviderAdminCreateUserRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderAdminCreateUserResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a user as an administrator. Works on any user.</p>
 
 @param request A container for the necessary parameters to execute the AdminDeleteUser service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderAdminDeleteUserRequest
 */
- (AWSTask *)adminDeleteUser:(AWSCognitoIdentityProviderAdminDeleteUserRequest *)request;

/**
 <p>Deletes a user as an administrator. Works on any user.</p>
 
 @param request A container for the necessary parameters to execute the AdminDeleteUser service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderAdminDeleteUserRequest
 */
- (void)adminDeleteUser:(AWSCognitoIdentityProviderAdminDeleteUserRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the user attributes in a user pool as an administrator. Works on any user.</p>
 
 @param request A container for the necessary parameters to execute the AdminDeleteUserAttributes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderAdminDeleteUserAttributesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderAdminDeleteUserAttributesRequest
 @see AWSCognitoIdentityProviderAdminDeleteUserAttributesResponse
 */
- (AWSTask<AWSCognitoIdentityProviderAdminDeleteUserAttributesResponse *> *)adminDeleteUserAttributes:(AWSCognitoIdentityProviderAdminDeleteUserAttributesRequest *)request;

/**
 <p>Deletes the user attributes in a user pool as an administrator. Works on any user.</p>
 
 @param request A container for the necessary parameters to execute the AdminDeleteUserAttributes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderAdminDeleteUserAttributesRequest
 @see AWSCognitoIdentityProviderAdminDeleteUserAttributesResponse
 */
- (void)adminDeleteUserAttributes:(AWSCognitoIdentityProviderAdminDeleteUserAttributesRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderAdminDeleteUserAttributesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Disables the specified user as an administrator. Works on any user.</p>
 
 @param request A container for the necessary parameters to execute the AdminDisableUser service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderAdminDisableUserResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderAdminDisableUserRequest
 @see AWSCognitoIdentityProviderAdminDisableUserResponse
 */
- (AWSTask<AWSCognitoIdentityProviderAdminDisableUserResponse *> *)adminDisableUser:(AWSCognitoIdentityProviderAdminDisableUserRequest *)request;

/**
 <p>Disables the specified user as an administrator. Works on any user.</p>
 
 @param request A container for the necessary parameters to execute the AdminDisableUser service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderAdminDisableUserRequest
 @see AWSCognitoIdentityProviderAdminDisableUserResponse
 */
- (void)adminDisableUser:(AWSCognitoIdentityProviderAdminDisableUserRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderAdminDisableUserResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Enables the specified user as an administrator. Works on any user.</p>
 
 @param request A container for the necessary parameters to execute the AdminEnableUser service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderAdminEnableUserResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderAdminEnableUserRequest
 @see AWSCognitoIdentityProviderAdminEnableUserResponse
 */
- (AWSTask<AWSCognitoIdentityProviderAdminEnableUserResponse *> *)adminEnableUser:(AWSCognitoIdentityProviderAdminEnableUserRequest *)request;

/**
 <p>Enables the specified user as an administrator. Works on any user.</p>
 
 @param request A container for the necessary parameters to execute the AdminEnableUser service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderAdminEnableUserRequest
 @see AWSCognitoIdentityProviderAdminEnableUserResponse
 */
- (void)adminEnableUser:(AWSCognitoIdentityProviderAdminEnableUserRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderAdminEnableUserResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Forgets the device, as an administrator.</p>
 
 @param request A container for the necessary parameters to execute the AdminForgetDevice service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorInvalidUserPoolConfiguration`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderAdminForgetDeviceRequest
 */
- (AWSTask *)adminForgetDevice:(AWSCognitoIdentityProviderAdminForgetDeviceRequest *)request;

/**
 <p>Forgets the device, as an administrator.</p>
 
 @param request A container for the necessary parameters to execute the AdminForgetDevice service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorInvalidUserPoolConfiguration`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderAdminForgetDeviceRequest
 */
- (void)adminForgetDevice:(AWSCognitoIdentityProviderAdminForgetDeviceRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Gets the device, as an administrator.</p>
 
 @param request A container for the necessary parameters to execute the AdminGetDevice service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderAdminGetDeviceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorInvalidUserPoolConfiguration`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`, `AWSCognitoIdentityProviderErrorNotAuthorized`.
 
 @see AWSCognitoIdentityProviderAdminGetDeviceRequest
 @see AWSCognitoIdentityProviderAdminGetDeviceResponse
 */
- (AWSTask<AWSCognitoIdentityProviderAdminGetDeviceResponse *> *)adminGetDevice:(AWSCognitoIdentityProviderAdminGetDeviceRequest *)request;

/**
 <p>Gets the device, as an administrator.</p>
 
 @param request A container for the necessary parameters to execute the AdminGetDevice service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorInvalidUserPoolConfiguration`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`, `AWSCognitoIdentityProviderErrorNotAuthorized`.
 
 @see AWSCognitoIdentityProviderAdminGetDeviceRequest
 @see AWSCognitoIdentityProviderAdminGetDeviceResponse
 */
- (void)adminGetDevice:(AWSCognitoIdentityProviderAdminGetDeviceRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderAdminGetDeviceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets the specified user by user name in a user pool as an administrator. Works on any user.</p>
 
 @param request A container for the necessary parameters to execute the AdminGetUser service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderAdminGetUserResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderAdminGetUserRequest
 @see AWSCognitoIdentityProviderAdminGetUserResponse
 */
- (AWSTask<AWSCognitoIdentityProviderAdminGetUserResponse *> *)adminGetUser:(AWSCognitoIdentityProviderAdminGetUserRequest *)request;

/**
 <p>Gets the specified user by user name in a user pool as an administrator. Works on any user.</p>
 
 @param request A container for the necessary parameters to execute the AdminGetUser service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderAdminGetUserRequest
 @see AWSCognitoIdentityProviderAdminGetUserResponse
 */
- (void)adminGetUser:(AWSCognitoIdentityProviderAdminGetUserRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderAdminGetUserResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Initiates the authentication flow, as an administrator.</p>
 
 @param request A container for the necessary parameters to execute the AdminInitiateAuth service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderAdminInitiateAuthResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`, `AWSCognitoIdentityProviderErrorUnexpectedLambda`, `AWSCognitoIdentityProviderErrorInvalidUserPoolConfiguration`, `AWSCognitoIdentityProviderErrorUserLambdaValidation`, `AWSCognitoIdentityProviderErrorInvalidLambdaResponse`, `AWSCognitoIdentityProviderErrorMFAMethodNotFound`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleAccessPolicy`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleTrustRelationship`, `AWSCognitoIdentityProviderErrorPasswordResetRequired`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorUserNotConfirmed`.
 
 @see AWSCognitoIdentityProviderAdminInitiateAuthRequest
 @see AWSCognitoIdentityProviderAdminInitiateAuthResponse
 */
- (AWSTask<AWSCognitoIdentityProviderAdminInitiateAuthResponse *> *)adminInitiateAuth:(AWSCognitoIdentityProviderAdminInitiateAuthRequest *)request;

/**
 <p>Initiates the authentication flow, as an administrator.</p>
 
 @param request A container for the necessary parameters to execute the AdminInitiateAuth service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`, `AWSCognitoIdentityProviderErrorUnexpectedLambda`, `AWSCognitoIdentityProviderErrorInvalidUserPoolConfiguration`, `AWSCognitoIdentityProviderErrorUserLambdaValidation`, `AWSCognitoIdentityProviderErrorInvalidLambdaResponse`, `AWSCognitoIdentityProviderErrorMFAMethodNotFound`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleAccessPolicy`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleTrustRelationship`, `AWSCognitoIdentityProviderErrorPasswordResetRequired`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorUserNotConfirmed`.
 
 @see AWSCognitoIdentityProviderAdminInitiateAuthRequest
 @see AWSCognitoIdentityProviderAdminInitiateAuthResponse
 */
- (void)adminInitiateAuth:(AWSCognitoIdentityProviderAdminInitiateAuthRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderAdminInitiateAuthResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists devices, as an administrator.</p>
 
 @param request A container for the necessary parameters to execute the AdminListDevices service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderAdminListDevicesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidUserPoolConfiguration`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`, `AWSCognitoIdentityProviderErrorNotAuthorized`.
 
 @see AWSCognitoIdentityProviderAdminListDevicesRequest
 @see AWSCognitoIdentityProviderAdminListDevicesResponse
 */
- (AWSTask<AWSCognitoIdentityProviderAdminListDevicesResponse *> *)adminListDevices:(AWSCognitoIdentityProviderAdminListDevicesRequest *)request;

/**
 <p>Lists devices, as an administrator.</p>
 
 @param request A container for the necessary parameters to execute the AdminListDevices service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidUserPoolConfiguration`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`, `AWSCognitoIdentityProviderErrorNotAuthorized`.
 
 @see AWSCognitoIdentityProviderAdminListDevicesRequest
 @see AWSCognitoIdentityProviderAdminListDevicesResponse
 */
- (void)adminListDevices:(AWSCognitoIdentityProviderAdminListDevicesRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderAdminListDevicesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Resets the specified user's password in a user pool as an administrator. Works on any user.</p><p>When a developer calls this API, the current password is invalidated, so it must be changed. If a user tries to sign in after the API is called, the app will get a PasswordResetRequiredException exception back and should direct the user down the flow to reset the password, which is the same as the forgot password flow. In addition, if the user pool has phone verification selected and a verified phone number exists for the user, or if email verification is selected and a verified email exists for the user, calling this API will also result in sending a message to the end user with the code to change their password.</p>
 
 @param request A container for the necessary parameters to execute the AdminResetUserPassword service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderAdminResetUserPasswordResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorUnexpectedLambda`, `AWSCognitoIdentityProviderErrorUserLambdaValidation`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorInvalidLambdaResponse`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorLimitExceeded`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderAdminResetUserPasswordRequest
 @see AWSCognitoIdentityProviderAdminResetUserPasswordResponse
 */
- (AWSTask<AWSCognitoIdentityProviderAdminResetUserPasswordResponse *> *)adminResetUserPassword:(AWSCognitoIdentityProviderAdminResetUserPasswordRequest *)request;

/**
 <p>Resets the specified user's password in a user pool as an administrator. Works on any user.</p><p>When a developer calls this API, the current password is invalidated, so it must be changed. If a user tries to sign in after the API is called, the app will get a PasswordResetRequiredException exception back and should direct the user down the flow to reset the password, which is the same as the forgot password flow. In addition, if the user pool has phone verification selected and a verified phone number exists for the user, or if email verification is selected and a verified email exists for the user, calling this API will also result in sending a message to the end user with the code to change their password.</p>
 
 @param request A container for the necessary parameters to execute the AdminResetUserPassword service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorUnexpectedLambda`, `AWSCognitoIdentityProviderErrorUserLambdaValidation`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorInvalidLambdaResponse`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorLimitExceeded`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderAdminResetUserPasswordRequest
 @see AWSCognitoIdentityProviderAdminResetUserPasswordResponse
 */
- (void)adminResetUserPassword:(AWSCognitoIdentityProviderAdminResetUserPasswordRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderAdminResetUserPasswordResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Responds to an authentication challenge, as an administrator.</p>
 
 @param request A container for the necessary parameters to execute the AdminRespondToAuthChallenge service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderAdminRespondToAuthChallengeResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorCodeMismatch`, `AWSCognitoIdentityProviderErrorExpiredCode`, `AWSCognitoIdentityProviderErrorUnexpectedLambda`, `AWSCognitoIdentityProviderErrorInvalidPassword`, `AWSCognitoIdentityProviderErrorUserLambdaValidation`, `AWSCognitoIdentityProviderErrorInvalidLambdaResponse`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInvalidUserPoolConfiguration`, `AWSCognitoIdentityProviderErrorInternalError`, `AWSCognitoIdentityProviderErrorMFAMethodNotFound`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleAccessPolicy`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleTrustRelationship`, `AWSCognitoIdentityProviderErrorAliasExists`, `AWSCognitoIdentityProviderErrorPasswordResetRequired`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorUserNotConfirmed`.
 
 @see AWSCognitoIdentityProviderAdminRespondToAuthChallengeRequest
 @see AWSCognitoIdentityProviderAdminRespondToAuthChallengeResponse
 */
- (AWSTask<AWSCognitoIdentityProviderAdminRespondToAuthChallengeResponse *> *)adminRespondToAuthChallenge:(AWSCognitoIdentityProviderAdminRespondToAuthChallengeRequest *)request;

/**
 <p>Responds to an authentication challenge, as an administrator.</p>
 
 @param request A container for the necessary parameters to execute the AdminRespondToAuthChallenge service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorCodeMismatch`, `AWSCognitoIdentityProviderErrorExpiredCode`, `AWSCognitoIdentityProviderErrorUnexpectedLambda`, `AWSCognitoIdentityProviderErrorInvalidPassword`, `AWSCognitoIdentityProviderErrorUserLambdaValidation`, `AWSCognitoIdentityProviderErrorInvalidLambdaResponse`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInvalidUserPoolConfiguration`, `AWSCognitoIdentityProviderErrorInternalError`, `AWSCognitoIdentityProviderErrorMFAMethodNotFound`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleAccessPolicy`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleTrustRelationship`, `AWSCognitoIdentityProviderErrorAliasExists`, `AWSCognitoIdentityProviderErrorPasswordResetRequired`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorUserNotConfirmed`.
 
 @see AWSCognitoIdentityProviderAdminRespondToAuthChallengeRequest
 @see AWSCognitoIdentityProviderAdminRespondToAuthChallengeResponse
 */
- (void)adminRespondToAuthChallenge:(AWSCognitoIdentityProviderAdminRespondToAuthChallengeRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderAdminRespondToAuthChallengeResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Sets all the user settings for a specified user name. Works on any user.</p>
 
 @param request A container for the necessary parameters to execute the AdminSetUserSettings service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderAdminSetUserSettingsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderAdminSetUserSettingsRequest
 @see AWSCognitoIdentityProviderAdminSetUserSettingsResponse
 */
- (AWSTask<AWSCognitoIdentityProviderAdminSetUserSettingsResponse *> *)adminSetUserSettings:(AWSCognitoIdentityProviderAdminSetUserSettingsRequest *)request;

/**
 <p>Sets all the user settings for a specified user name. Works on any user.</p>
 
 @param request A container for the necessary parameters to execute the AdminSetUserSettings service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderAdminSetUserSettingsRequest
 @see AWSCognitoIdentityProviderAdminSetUserSettingsResponse
 */
- (void)adminSetUserSettings:(AWSCognitoIdentityProviderAdminSetUserSettingsRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderAdminSetUserSettingsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the device status as an administrator.</p>
 
 @param request A container for the necessary parameters to execute the AdminUpdateDeviceStatus service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderAdminUpdateDeviceStatusResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidUserPoolConfiguration`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderAdminUpdateDeviceStatusRequest
 @see AWSCognitoIdentityProviderAdminUpdateDeviceStatusResponse
 */
- (AWSTask<AWSCognitoIdentityProviderAdminUpdateDeviceStatusResponse *> *)adminUpdateDeviceStatus:(AWSCognitoIdentityProviderAdminUpdateDeviceStatusRequest *)request;

/**
 <p>Updates the device status as an administrator.</p>
 
 @param request A container for the necessary parameters to execute the AdminUpdateDeviceStatus service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidUserPoolConfiguration`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderAdminUpdateDeviceStatusRequest
 @see AWSCognitoIdentityProviderAdminUpdateDeviceStatusResponse
 */
- (void)adminUpdateDeviceStatus:(AWSCognitoIdentityProviderAdminUpdateDeviceStatusRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderAdminUpdateDeviceStatusResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the specified user's attributes, including developer attributes, as an administrator. Works on any user.</p>
 
 @param request A container for the necessary parameters to execute the AdminUpdateUserAttributes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderAdminUpdateUserAttributesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorUnexpectedLambda`, `AWSCognitoIdentityProviderErrorUserLambdaValidation`, `AWSCognitoIdentityProviderErrorInvalidLambdaResponse`, `AWSCognitoIdentityProviderErrorAliasExists`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderAdminUpdateUserAttributesRequest
 @see AWSCognitoIdentityProviderAdminUpdateUserAttributesResponse
 */
- (AWSTask<AWSCognitoIdentityProviderAdminUpdateUserAttributesResponse *> *)adminUpdateUserAttributes:(AWSCognitoIdentityProviderAdminUpdateUserAttributesRequest *)request;

/**
 <p>Updates the specified user's attributes, including developer attributes, as an administrator. Works on any user.</p>
 
 @param request A container for the necessary parameters to execute the AdminUpdateUserAttributes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorUnexpectedLambda`, `AWSCognitoIdentityProviderErrorUserLambdaValidation`, `AWSCognitoIdentityProviderErrorInvalidLambdaResponse`, `AWSCognitoIdentityProviderErrorAliasExists`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderAdminUpdateUserAttributesRequest
 @see AWSCognitoIdentityProviderAdminUpdateUserAttributesResponse
 */
- (void)adminUpdateUserAttributes:(AWSCognitoIdentityProviderAdminUpdateUserAttributesRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderAdminUpdateUserAttributesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Signs out users from all devices, as an administrator.</p>
 
 @param request A container for the necessary parameters to execute the AdminUserGlobalSignOut service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderAdminUserGlobalSignOutResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderAdminUserGlobalSignOutRequest
 @see AWSCognitoIdentityProviderAdminUserGlobalSignOutResponse
 */
- (AWSTask<AWSCognitoIdentityProviderAdminUserGlobalSignOutResponse *> *)adminUserGlobalSignOut:(AWSCognitoIdentityProviderAdminUserGlobalSignOutRequest *)request;

/**
 <p>Signs out users from all devices, as an administrator.</p>
 
 @param request A container for the necessary parameters to execute the AdminUserGlobalSignOut service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderAdminUserGlobalSignOutRequest
 @see AWSCognitoIdentityProviderAdminUserGlobalSignOutResponse
 */
- (void)adminUserGlobalSignOut:(AWSCognitoIdentityProviderAdminUserGlobalSignOutRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderAdminUserGlobalSignOutResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Changes the password for a specified user in a user pool.</p>
 
 @param request A container for the necessary parameters to execute the ChangePassword service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderChangePasswordResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorInvalidPassword`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorLimitExceeded`, `AWSCognitoIdentityProviderErrorPasswordResetRequired`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorUserNotConfirmed`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderChangePasswordRequest
 @see AWSCognitoIdentityProviderChangePasswordResponse
 */
- (AWSTask<AWSCognitoIdentityProviderChangePasswordResponse *> *)changePassword:(AWSCognitoIdentityProviderChangePasswordRequest *)request;

/**
 <p>Changes the password for a specified user in a user pool.</p>
 
 @param request A container for the necessary parameters to execute the ChangePassword service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorInvalidPassword`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorLimitExceeded`, `AWSCognitoIdentityProviderErrorPasswordResetRequired`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorUserNotConfirmed`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderChangePasswordRequest
 @see AWSCognitoIdentityProviderChangePasswordResponse
 */
- (void)changePassword:(AWSCognitoIdentityProviderChangePasswordRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderChangePasswordResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Confirms tracking of the device. This API call is the call that beings device tracking.</p>
 
 @param request A container for the necessary parameters to execute the ConfirmDevice service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderConfirmDeviceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorInvalidPassword`, `AWSCognitoIdentityProviderErrorInvalidLambdaResponse`, `AWSCognitoIdentityProviderErrorUsernameExists`, `AWSCognitoIdentityProviderErrorInvalidUserPoolConfiguration`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorPasswordResetRequired`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorUserNotConfirmed`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderConfirmDeviceRequest
 @see AWSCognitoIdentityProviderConfirmDeviceResponse
 */
- (AWSTask<AWSCognitoIdentityProviderConfirmDeviceResponse *> *)confirmDevice:(AWSCognitoIdentityProviderConfirmDeviceRequest *)request;

/**
 <p>Confirms tracking of the device. This API call is the call that beings device tracking.</p>
 
 @param request A container for the necessary parameters to execute the ConfirmDevice service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorInvalidPassword`, `AWSCognitoIdentityProviderErrorInvalidLambdaResponse`, `AWSCognitoIdentityProviderErrorUsernameExists`, `AWSCognitoIdentityProviderErrorInvalidUserPoolConfiguration`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorPasswordResetRequired`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorUserNotConfirmed`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderConfirmDeviceRequest
 @see AWSCognitoIdentityProviderConfirmDeviceResponse
 */
- (void)confirmDevice:(AWSCognitoIdentityProviderConfirmDeviceRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderConfirmDeviceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Allows a user to enter a code provided when they reset their password to update their password.</p>
 
 @param request A container for the necessary parameters to execute the ConfirmForgotPassword service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderConfirmForgotPasswordResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorUnexpectedLambda`, `AWSCognitoIdentityProviderErrorUserLambdaValidation`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorInvalidPassword`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorCodeMismatch`, `AWSCognitoIdentityProviderErrorExpiredCode`, `AWSCognitoIdentityProviderErrorTooManyFailedAttempts`, `AWSCognitoIdentityProviderErrorInvalidLambdaResponse`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorLimitExceeded`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorUserNotConfirmed`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderConfirmForgotPasswordRequest
 @see AWSCognitoIdentityProviderConfirmForgotPasswordResponse
 */
- (AWSTask<AWSCognitoIdentityProviderConfirmForgotPasswordResponse *> *)confirmForgotPassword:(AWSCognitoIdentityProviderConfirmForgotPasswordRequest *)request;

/**
 <p>Allows a user to enter a code provided when they reset their password to update their password.</p>
 
 @param request A container for the necessary parameters to execute the ConfirmForgotPassword service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorUnexpectedLambda`, `AWSCognitoIdentityProviderErrorUserLambdaValidation`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorInvalidPassword`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorCodeMismatch`, `AWSCognitoIdentityProviderErrorExpiredCode`, `AWSCognitoIdentityProviderErrorTooManyFailedAttempts`, `AWSCognitoIdentityProviderErrorInvalidLambdaResponse`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorLimitExceeded`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorUserNotConfirmed`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderConfirmForgotPasswordRequest
 @see AWSCognitoIdentityProviderConfirmForgotPasswordResponse
 */
- (void)confirmForgotPassword:(AWSCognitoIdentityProviderConfirmForgotPasswordRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderConfirmForgotPasswordResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Confirms registration of a user and handles the existing alias from a previous user.</p>
 
 @param request A container for the necessary parameters to execute the ConfirmSignUp service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderConfirmSignUpResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorUnexpectedLambda`, `AWSCognitoIdentityProviderErrorUserLambdaValidation`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorTooManyFailedAttempts`, `AWSCognitoIdentityProviderErrorCodeMismatch`, `AWSCognitoIdentityProviderErrorExpiredCode`, `AWSCognitoIdentityProviderErrorInvalidLambdaResponse`, `AWSCognitoIdentityProviderErrorAliasExists`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorLimitExceeded`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderConfirmSignUpRequest
 @see AWSCognitoIdentityProviderConfirmSignUpResponse
 */
- (AWSTask<AWSCognitoIdentityProviderConfirmSignUpResponse *> *)confirmSignUp:(AWSCognitoIdentityProviderConfirmSignUpRequest *)request;

/**
 <p>Confirms registration of a user and handles the existing alias from a previous user.</p>
 
 @param request A container for the necessary parameters to execute the ConfirmSignUp service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorUnexpectedLambda`, `AWSCognitoIdentityProviderErrorUserLambdaValidation`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorTooManyFailedAttempts`, `AWSCognitoIdentityProviderErrorCodeMismatch`, `AWSCognitoIdentityProviderErrorExpiredCode`, `AWSCognitoIdentityProviderErrorInvalidLambdaResponse`, `AWSCognitoIdentityProviderErrorAliasExists`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorLimitExceeded`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderConfirmSignUpRequest
 @see AWSCognitoIdentityProviderConfirmSignUpResponse
 */
- (void)confirmSignUp:(AWSCognitoIdentityProviderConfirmSignUpRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderConfirmSignUpResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates the user import job.</p>
 
 @param request A container for the necessary parameters to execute the CreateUserImportJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderCreateUserImportJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorPreconditionNotMet`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorLimitExceeded`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderCreateUserImportJobRequest
 @see AWSCognitoIdentityProviderCreateUserImportJobResponse
 */
- (AWSTask<AWSCognitoIdentityProviderCreateUserImportJobResponse *> *)createUserImportJob:(AWSCognitoIdentityProviderCreateUserImportJobRequest *)request;

/**
 <p>Creates the user import job.</p>
 
 @param request A container for the necessary parameters to execute the CreateUserImportJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorPreconditionNotMet`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorLimitExceeded`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderCreateUserImportJobRequest
 @see AWSCognitoIdentityProviderCreateUserImportJobResponse
 */
- (void)createUserImportJob:(AWSCognitoIdentityProviderCreateUserImportJobRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderCreateUserImportJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new Amazon Cognito user pool and sets the password policy for the pool.</p>
 
 @param request A container for the necessary parameters to execute the CreateUserPool service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderCreateUserPoolResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorLimitExceeded`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleAccessPolicy`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleTrustRelationship`, `AWSCognitoIdentityProviderErrorInvalidEmailRoleAccessPolicy`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderCreateUserPoolRequest
 @see AWSCognitoIdentityProviderCreateUserPoolResponse
 */
- (AWSTask<AWSCognitoIdentityProviderCreateUserPoolResponse *> *)createUserPool:(AWSCognitoIdentityProviderCreateUserPoolRequest *)request;

/**
 <p>Creates a new Amazon Cognito user pool and sets the password policy for the pool.</p>
 
 @param request A container for the necessary parameters to execute the CreateUserPool service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorLimitExceeded`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleAccessPolicy`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleTrustRelationship`, `AWSCognitoIdentityProviderErrorInvalidEmailRoleAccessPolicy`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderCreateUserPoolRequest
 @see AWSCognitoIdentityProviderCreateUserPoolResponse
 */
- (void)createUserPool:(AWSCognitoIdentityProviderCreateUserPoolRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderCreateUserPoolResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates the user pool client.</p>
 
 @param request A container for the necessary parameters to execute the CreateUserPoolClient service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderCreateUserPoolClientResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorLimitExceeded`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderCreateUserPoolClientRequest
 @see AWSCognitoIdentityProviderCreateUserPoolClientResponse
 */
- (AWSTask<AWSCognitoIdentityProviderCreateUserPoolClientResponse *> *)createUserPoolClient:(AWSCognitoIdentityProviderCreateUserPoolClientRequest *)request;

/**
 <p>Creates the user pool client.</p>
 
 @param request A container for the necessary parameters to execute the CreateUserPoolClient service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorLimitExceeded`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderCreateUserPoolClientRequest
 @see AWSCognitoIdentityProviderCreateUserPoolClientResponse
 */
- (void)createUserPoolClient:(AWSCognitoIdentityProviderCreateUserPoolClientRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderCreateUserPoolClientResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Allows a user to delete one's self.</p>
 
 @param request A container for the necessary parameters to execute the DeleteUser service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorPasswordResetRequired`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorUserNotConfirmed`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderDeleteUserRequest
 */
- (AWSTask *)deleteUser:(AWSCognitoIdentityProviderDeleteUserRequest *)request;

/**
 <p>Allows a user to delete one's self.</p>
 
 @param request A container for the necessary parameters to execute the DeleteUser service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorPasswordResetRequired`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorUserNotConfirmed`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderDeleteUserRequest
 */
- (void)deleteUser:(AWSCognitoIdentityProviderDeleteUserRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the attributes for a user.</p>
 
 @param request A container for the necessary parameters to execute the DeleteUserAttributes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderDeleteUserAttributesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorPasswordResetRequired`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorUserNotConfirmed`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderDeleteUserAttributesRequest
 @see AWSCognitoIdentityProviderDeleteUserAttributesResponse
 */
- (AWSTask<AWSCognitoIdentityProviderDeleteUserAttributesResponse *> *)deleteUserAttributes:(AWSCognitoIdentityProviderDeleteUserAttributesRequest *)request;

/**
 <p>Deletes the attributes for a user.</p>
 
 @param request A container for the necessary parameters to execute the DeleteUserAttributes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorPasswordResetRequired`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorUserNotConfirmed`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderDeleteUserAttributesRequest
 @see AWSCognitoIdentityProviderDeleteUserAttributesResponse
 */
- (void)deleteUserAttributes:(AWSCognitoIdentityProviderDeleteUserAttributesRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderDeleteUserAttributesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified Amazon Cognito user pool.</p>
 
 @param request A container for the necessary parameters to execute the DeleteUserPool service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUserImportInProgress`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderDeleteUserPoolRequest
 */
- (AWSTask *)deleteUserPool:(AWSCognitoIdentityProviderDeleteUserPoolRequest *)request;

/**
 <p>Deletes the specified Amazon Cognito user pool.</p>
 
 @param request A container for the necessary parameters to execute the DeleteUserPool service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUserImportInProgress`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderDeleteUserPoolRequest
 */
- (void)deleteUserPool:(AWSCognitoIdentityProviderDeleteUserPoolRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Allows the developer to delete the user pool client.</p>
 
 @param request A container for the necessary parameters to execute the DeleteUserPoolClient service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderDeleteUserPoolClientRequest
 */
- (AWSTask *)deleteUserPoolClient:(AWSCognitoIdentityProviderDeleteUserPoolClientRequest *)request;

/**
 <p>Allows the developer to delete the user pool client.</p>
 
 @param request A container for the necessary parameters to execute the DeleteUserPoolClient service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderDeleteUserPoolClientRequest
 */
- (void)deleteUserPoolClient:(AWSCognitoIdentityProviderDeleteUserPoolClientRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Describes the user import job.</p>
 
 @param request A container for the necessary parameters to execute the DescribeUserImportJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderDescribeUserImportJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderDescribeUserImportJobRequest
 @see AWSCognitoIdentityProviderDescribeUserImportJobResponse
 */
- (AWSTask<AWSCognitoIdentityProviderDescribeUserImportJobResponse *> *)describeUserImportJob:(AWSCognitoIdentityProviderDescribeUserImportJobRequest *)request;

/**
 <p>Describes the user import job.</p>
 
 @param request A container for the necessary parameters to execute the DescribeUserImportJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderDescribeUserImportJobRequest
 @see AWSCognitoIdentityProviderDescribeUserImportJobResponse
 */
- (void)describeUserImportJob:(AWSCognitoIdentityProviderDescribeUserImportJobRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderDescribeUserImportJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the configuration information and metadata of the specified user pool.</p>
 
 @param request A container for the necessary parameters to execute the DescribeUserPool service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderDescribeUserPoolResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderDescribeUserPoolRequest
 @see AWSCognitoIdentityProviderDescribeUserPoolResponse
 */
- (AWSTask<AWSCognitoIdentityProviderDescribeUserPoolResponse *> *)describeUserPool:(AWSCognitoIdentityProviderDescribeUserPoolRequest *)request;

/**
 <p>Returns the configuration information and metadata of the specified user pool.</p>
 
 @param request A container for the necessary parameters to execute the DescribeUserPool service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderDescribeUserPoolRequest
 @see AWSCognitoIdentityProviderDescribeUserPoolResponse
 */
- (void)describeUserPool:(AWSCognitoIdentityProviderDescribeUserPoolRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderDescribeUserPoolResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Client method for returning the configuration information and metadata of the specified user pool client.</p>
 
 @param request A container for the necessary parameters to execute the DescribeUserPoolClient service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderDescribeUserPoolClientResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderDescribeUserPoolClientRequest
 @see AWSCognitoIdentityProviderDescribeUserPoolClientResponse
 */
- (AWSTask<AWSCognitoIdentityProviderDescribeUserPoolClientResponse *> *)describeUserPoolClient:(AWSCognitoIdentityProviderDescribeUserPoolClientRequest *)request;

/**
 <p>Client method for returning the configuration information and metadata of the specified user pool client.</p>
 
 @param request A container for the necessary parameters to execute the DescribeUserPoolClient service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderDescribeUserPoolClientRequest
 @see AWSCognitoIdentityProviderDescribeUserPoolClientResponse
 */
- (void)describeUserPoolClient:(AWSCognitoIdentityProviderDescribeUserPoolClientRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderDescribeUserPoolClientResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Forgets the specified device.</p>
 
 @param request A container for the necessary parameters to execute the ForgetDevice service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInvalidUserPoolConfiguration`, `AWSCognitoIdentityProviderErrorPasswordResetRequired`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorUserNotConfirmed`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderForgetDeviceRequest
 */
- (AWSTask *)forgetDevice:(AWSCognitoIdentityProviderForgetDeviceRequest *)request;

/**
 <p>Forgets the specified device.</p>
 
 @param request A container for the necessary parameters to execute the ForgetDevice service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInvalidUserPoolConfiguration`, `AWSCognitoIdentityProviderErrorPasswordResetRequired`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorUserNotConfirmed`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderForgetDeviceRequest
 */
- (void)forgetDevice:(AWSCognitoIdentityProviderForgetDeviceRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the password for the specified client ID or username.</p>
 
 @param request A container for the necessary parameters to execute the ForgotPassword service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderForgotPasswordResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorUnexpectedLambda`, `AWSCognitoIdentityProviderErrorUserLambdaValidation`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorInvalidLambdaResponse`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorLimitExceeded`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleAccessPolicy`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleTrustRelationship`, `AWSCognitoIdentityProviderErrorInvalidEmailRoleAccessPolicy`, `AWSCognitoIdentityProviderErrorCodeDeliveryFailure`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorUserNotConfirmed`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderForgotPasswordRequest
 @see AWSCognitoIdentityProviderForgotPasswordResponse
 */
- (AWSTask<AWSCognitoIdentityProviderForgotPasswordResponse *> *)forgotPassword:(AWSCognitoIdentityProviderForgotPasswordRequest *)request;

/**
 <p>Retrieves the password for the specified client ID or username.</p>
 
 @param request A container for the necessary parameters to execute the ForgotPassword service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorUnexpectedLambda`, `AWSCognitoIdentityProviderErrorUserLambdaValidation`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorInvalidLambdaResponse`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorLimitExceeded`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleAccessPolicy`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleTrustRelationship`, `AWSCognitoIdentityProviderErrorInvalidEmailRoleAccessPolicy`, `AWSCognitoIdentityProviderErrorCodeDeliveryFailure`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorUserNotConfirmed`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderForgotPasswordRequest
 @see AWSCognitoIdentityProviderForgotPasswordResponse
 */
- (void)forgotPassword:(AWSCognitoIdentityProviderForgotPasswordRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderForgotPasswordResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets the header information for the .csv file to be used as input for the user import job.</p>
 
 @param request A container for the necessary parameters to execute the GetCSVHeader service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderGetCSVHeaderResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderGetCSVHeaderRequest
 @see AWSCognitoIdentityProviderGetCSVHeaderResponse
 */
- (AWSTask<AWSCognitoIdentityProviderGetCSVHeaderResponse *> *)getCSVHeader:(AWSCognitoIdentityProviderGetCSVHeaderRequest *)request;

/**
 <p>Gets the header information for the .csv file to be used as input for the user import job.</p>
 
 @param request A container for the necessary parameters to execute the GetCSVHeader service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderGetCSVHeaderRequest
 @see AWSCognitoIdentityProviderGetCSVHeaderResponse
 */
- (void)getCSVHeader:(AWSCognitoIdentityProviderGetCSVHeaderRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderGetCSVHeaderResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets the device.</p>
 
 @param request A container for the necessary parameters to execute the GetDevice service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderGetDeviceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorInvalidUserPoolConfiguration`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorPasswordResetRequired`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorUserNotConfirmed`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderGetDeviceRequest
 @see AWSCognitoIdentityProviderGetDeviceResponse
 */
- (AWSTask<AWSCognitoIdentityProviderGetDeviceResponse *> *)getDevice:(AWSCognitoIdentityProviderGetDeviceRequest *)request;

/**
 <p>Gets the device.</p>
 
 @param request A container for the necessary parameters to execute the GetDevice service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorInvalidUserPoolConfiguration`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorPasswordResetRequired`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorUserNotConfirmed`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderGetDeviceRequest
 @see AWSCognitoIdentityProviderGetDeviceResponse
 */
- (void)getDevice:(AWSCognitoIdentityProviderGetDeviceRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderGetDeviceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets the user attributes and metadata for a user.</p>
 
 @param request A container for the necessary parameters to execute the GetUser service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderGetUserResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorPasswordResetRequired`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorUserNotConfirmed`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderGetUserRequest
 @see AWSCognitoIdentityProviderGetUserResponse
 */
- (AWSTask<AWSCognitoIdentityProviderGetUserResponse *> *)getUser:(AWSCognitoIdentityProviderGetUserRequest *)request;

/**
 <p>Gets the user attributes and metadata for a user.</p>
 
 @param request A container for the necessary parameters to execute the GetUser service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorPasswordResetRequired`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorUserNotConfirmed`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderGetUserRequest
 @see AWSCognitoIdentityProviderGetUserResponse
 */
- (void)getUser:(AWSCognitoIdentityProviderGetUserRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderGetUserResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets the user attribute verification code for the specified attribute name.</p>
 
 @param request A container for the necessary parameters to execute the GetUserAttributeVerificationCode service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderGetUserAttributeVerificationCodeResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUnexpectedLambda`, `AWSCognitoIdentityProviderErrorUserLambdaValidation`, `AWSCognitoIdentityProviderErrorInvalidLambdaResponse`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleAccessPolicy`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleTrustRelationship`, `AWSCognitoIdentityProviderErrorInvalidEmailRoleAccessPolicy`, `AWSCognitoIdentityProviderErrorCodeDeliveryFailure`, `AWSCognitoIdentityProviderErrorLimitExceeded`, `AWSCognitoIdentityProviderErrorPasswordResetRequired`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorUserNotConfirmed`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderGetUserAttributeVerificationCodeRequest
 @see AWSCognitoIdentityProviderGetUserAttributeVerificationCodeResponse
 */
- (AWSTask<AWSCognitoIdentityProviderGetUserAttributeVerificationCodeResponse *> *)getUserAttributeVerificationCode:(AWSCognitoIdentityProviderGetUserAttributeVerificationCodeRequest *)request;

/**
 <p>Gets the user attribute verification code for the specified attribute name.</p>
 
 @param request A container for the necessary parameters to execute the GetUserAttributeVerificationCode service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUnexpectedLambda`, `AWSCognitoIdentityProviderErrorUserLambdaValidation`, `AWSCognitoIdentityProviderErrorInvalidLambdaResponse`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleAccessPolicy`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleTrustRelationship`, `AWSCognitoIdentityProviderErrorInvalidEmailRoleAccessPolicy`, `AWSCognitoIdentityProviderErrorCodeDeliveryFailure`, `AWSCognitoIdentityProviderErrorLimitExceeded`, `AWSCognitoIdentityProviderErrorPasswordResetRequired`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorUserNotConfirmed`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderGetUserAttributeVerificationCodeRequest
 @see AWSCognitoIdentityProviderGetUserAttributeVerificationCodeResponse
 */
- (void)getUserAttributeVerificationCode:(AWSCognitoIdentityProviderGetUserAttributeVerificationCodeRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderGetUserAttributeVerificationCodeResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Signs out users from all devices.</p>
 
 @param request A container for the necessary parameters to execute the GlobalSignOut service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderGlobalSignOutResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorPasswordResetRequired`, `AWSCognitoIdentityProviderErrorUserNotConfirmed`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderGlobalSignOutRequest
 @see AWSCognitoIdentityProviderGlobalSignOutResponse
 */
- (AWSTask<AWSCognitoIdentityProviderGlobalSignOutResponse *> *)globalSignOut:(AWSCognitoIdentityProviderGlobalSignOutRequest *)request;

/**
 <p>Signs out users from all devices.</p>
 
 @param request A container for the necessary parameters to execute the GlobalSignOut service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorPasswordResetRequired`, `AWSCognitoIdentityProviderErrorUserNotConfirmed`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderGlobalSignOutRequest
 @see AWSCognitoIdentityProviderGlobalSignOutResponse
 */
- (void)globalSignOut:(AWSCognitoIdentityProviderGlobalSignOutRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderGlobalSignOutResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Initiates the authentication flow.</p>
 
 @param request A container for the necessary parameters to execute the InitiateAuth service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderInitiateAuthResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorUnexpectedLambda`, `AWSCognitoIdentityProviderErrorInvalidUserPoolConfiguration`, `AWSCognitoIdentityProviderErrorUserLambdaValidation`, `AWSCognitoIdentityProviderErrorInvalidLambdaResponse`, `AWSCognitoIdentityProviderErrorPasswordResetRequired`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorUserNotConfirmed`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderInitiateAuthRequest
 @see AWSCognitoIdentityProviderInitiateAuthResponse
 */
- (AWSTask<AWSCognitoIdentityProviderInitiateAuthResponse *> *)initiateAuth:(AWSCognitoIdentityProviderInitiateAuthRequest *)request;

/**
 <p>Initiates the authentication flow.</p>
 
 @param request A container for the necessary parameters to execute the InitiateAuth service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorUnexpectedLambda`, `AWSCognitoIdentityProviderErrorInvalidUserPoolConfiguration`, `AWSCognitoIdentityProviderErrorUserLambdaValidation`, `AWSCognitoIdentityProviderErrorInvalidLambdaResponse`, `AWSCognitoIdentityProviderErrorPasswordResetRequired`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorUserNotConfirmed`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderInitiateAuthRequest
 @see AWSCognitoIdentityProviderInitiateAuthResponse
 */
- (void)initiateAuth:(AWSCognitoIdentityProviderInitiateAuthRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderInitiateAuthResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the devices.</p>
 
 @param request A container for the necessary parameters to execute the ListDevices service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderListDevicesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorInvalidUserPoolConfiguration`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorPasswordResetRequired`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorUserNotConfirmed`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderListDevicesRequest
 @see AWSCognitoIdentityProviderListDevicesResponse
 */
- (AWSTask<AWSCognitoIdentityProviderListDevicesResponse *> *)listDevices:(AWSCognitoIdentityProviderListDevicesRequest *)request;

/**
 <p>Lists the devices.</p>
 
 @param request A container for the necessary parameters to execute the ListDevices service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorInvalidUserPoolConfiguration`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorPasswordResetRequired`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorUserNotConfirmed`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderListDevicesRequest
 @see AWSCognitoIdentityProviderListDevicesResponse
 */
- (void)listDevices:(AWSCognitoIdentityProviderListDevicesRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderListDevicesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the user import jobs.</p>
 
 @param request A container for the necessary parameters to execute the ListUserImportJobs service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderListUserImportJobsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderListUserImportJobsRequest
 @see AWSCognitoIdentityProviderListUserImportJobsResponse
 */
- (AWSTask<AWSCognitoIdentityProviderListUserImportJobsResponse *> *)listUserImportJobs:(AWSCognitoIdentityProviderListUserImportJobsRequest *)request;

/**
 <p>Lists the user import jobs.</p>
 
 @param request A container for the necessary parameters to execute the ListUserImportJobs service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderListUserImportJobsRequest
 @see AWSCognitoIdentityProviderListUserImportJobsResponse
 */
- (void)listUserImportJobs:(AWSCognitoIdentityProviderListUserImportJobsRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderListUserImportJobsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the clients that have been created for the specified user pool.</p>
 
 @param request A container for the necessary parameters to execute the ListUserPoolClients service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderListUserPoolClientsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderListUserPoolClientsRequest
 @see AWSCognitoIdentityProviderListUserPoolClientsResponse
 */
- (AWSTask<AWSCognitoIdentityProviderListUserPoolClientsResponse *> *)listUserPoolClients:(AWSCognitoIdentityProviderListUserPoolClientsRequest *)request;

/**
 <p>Lists the clients that have been created for the specified user pool.</p>
 
 @param request A container for the necessary parameters to execute the ListUserPoolClients service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderListUserPoolClientsRequest
 @see AWSCognitoIdentityProviderListUserPoolClientsResponse
 */
- (void)listUserPoolClients:(AWSCognitoIdentityProviderListUserPoolClientsRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderListUserPoolClientsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the user pools associated with an AWS account.</p>
 
 @param request A container for the necessary parameters to execute the ListUserPools service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderListUserPoolsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderListUserPoolsRequest
 @see AWSCognitoIdentityProviderListUserPoolsResponse
 */
- (AWSTask<AWSCognitoIdentityProviderListUserPoolsResponse *> *)listUserPools:(AWSCognitoIdentityProviderListUserPoolsRequest *)request;

/**
 <p>Lists the user pools associated with an AWS account.</p>
 
 @param request A container for the necessary parameters to execute the ListUserPools service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderListUserPoolsRequest
 @see AWSCognitoIdentityProviderListUserPoolsResponse
 */
- (void)listUserPools:(AWSCognitoIdentityProviderListUserPoolsRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderListUserPoolsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the users in the Amazon Cognito user pool.</p>
 
 @param request A container for the necessary parameters to execute the ListUsers service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderListUsersResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderListUsersRequest
 @see AWSCognitoIdentityProviderListUsersResponse
 */
- (AWSTask<AWSCognitoIdentityProviderListUsersResponse *> *)listUsers:(AWSCognitoIdentityProviderListUsersRequest *)request;

/**
 <p>Lists the users in the Amazon Cognito user pool.</p>
 
 @param request A container for the necessary parameters to execute the ListUsers service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderListUsersRequest
 @see AWSCognitoIdentityProviderListUsersResponse
 */
- (void)listUsers:(AWSCognitoIdentityProviderListUsersRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderListUsersResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Resends the confirmation (for confirmation of registration) to a specific user in the user pool.</p>
 
 @param request A container for the necessary parameters to execute the ResendConfirmationCode service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderResendConfirmationCodeResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorUnexpectedLambda`, `AWSCognitoIdentityProviderErrorUserLambdaValidation`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorInvalidLambdaResponse`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorLimitExceeded`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleAccessPolicy`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleTrustRelationship`, `AWSCognitoIdentityProviderErrorInvalidEmailRoleAccessPolicy`, `AWSCognitoIdentityProviderErrorCodeDeliveryFailure`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderResendConfirmationCodeRequest
 @see AWSCognitoIdentityProviderResendConfirmationCodeResponse
 */
- (AWSTask<AWSCognitoIdentityProviderResendConfirmationCodeResponse *> *)resendConfirmationCode:(AWSCognitoIdentityProviderResendConfirmationCodeRequest *)request;

/**
 <p>Resends the confirmation (for confirmation of registration) to a specific user in the user pool.</p>
 
 @param request A container for the necessary parameters to execute the ResendConfirmationCode service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorUnexpectedLambda`, `AWSCognitoIdentityProviderErrorUserLambdaValidation`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorInvalidLambdaResponse`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorLimitExceeded`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleAccessPolicy`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleTrustRelationship`, `AWSCognitoIdentityProviderErrorInvalidEmailRoleAccessPolicy`, `AWSCognitoIdentityProviderErrorCodeDeliveryFailure`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderResendConfirmationCodeRequest
 @see AWSCognitoIdentityProviderResendConfirmationCodeResponse
 */
- (void)resendConfirmationCode:(AWSCognitoIdentityProviderResendConfirmationCodeRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderResendConfirmationCodeResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Responds to the authentication challenge.</p>
 
 @param request A container for the necessary parameters to execute the RespondToAuthChallenge service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderRespondToAuthChallengeResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorCodeMismatch`, `AWSCognitoIdentityProviderErrorExpiredCode`, `AWSCognitoIdentityProviderErrorUnexpectedLambda`, `AWSCognitoIdentityProviderErrorUserLambdaValidation`, `AWSCognitoIdentityProviderErrorInvalidPassword`, `AWSCognitoIdentityProviderErrorInvalidLambdaResponse`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInvalidUserPoolConfiguration`, `AWSCognitoIdentityProviderErrorMFAMethodNotFound`, `AWSCognitoIdentityProviderErrorPasswordResetRequired`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorUserNotConfirmed`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleAccessPolicy`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleTrustRelationship`, `AWSCognitoIdentityProviderErrorAliasExists`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderRespondToAuthChallengeRequest
 @see AWSCognitoIdentityProviderRespondToAuthChallengeResponse
 */
- (AWSTask<AWSCognitoIdentityProviderRespondToAuthChallengeResponse *> *)respondToAuthChallenge:(AWSCognitoIdentityProviderRespondToAuthChallengeRequest *)request;

/**
 <p>Responds to the authentication challenge.</p>
 
 @param request A container for the necessary parameters to execute the RespondToAuthChallenge service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorCodeMismatch`, `AWSCognitoIdentityProviderErrorExpiredCode`, `AWSCognitoIdentityProviderErrorUnexpectedLambda`, `AWSCognitoIdentityProviderErrorUserLambdaValidation`, `AWSCognitoIdentityProviderErrorInvalidPassword`, `AWSCognitoIdentityProviderErrorInvalidLambdaResponse`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInvalidUserPoolConfiguration`, `AWSCognitoIdentityProviderErrorMFAMethodNotFound`, `AWSCognitoIdentityProviderErrorPasswordResetRequired`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorUserNotConfirmed`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleAccessPolicy`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleTrustRelationship`, `AWSCognitoIdentityProviderErrorAliasExists`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderRespondToAuthChallengeRequest
 @see AWSCognitoIdentityProviderRespondToAuthChallengeResponse
 */
- (void)respondToAuthChallenge:(AWSCognitoIdentityProviderRespondToAuthChallengeRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderRespondToAuthChallengeResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Sets the user settings like multi-factor authentication (MFA). If MFA is to be removed for a particular attribute pass the attribute with code delivery as null. If null list is passed, all MFA options are removed.</p>
 
 @param request A container for the necessary parameters to execute the SetUserSettings service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderSetUserSettingsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorPasswordResetRequired`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorUserNotConfirmed`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderSetUserSettingsRequest
 @see AWSCognitoIdentityProviderSetUserSettingsResponse
 */
- (AWSTask<AWSCognitoIdentityProviderSetUserSettingsResponse *> *)setUserSettings:(AWSCognitoIdentityProviderSetUserSettingsRequest *)request;

/**
 <p>Sets the user settings like multi-factor authentication (MFA). If MFA is to be removed for a particular attribute pass the attribute with code delivery as null. If null list is passed, all MFA options are removed.</p>
 
 @param request A container for the necessary parameters to execute the SetUserSettings service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorPasswordResetRequired`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorUserNotConfirmed`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderSetUserSettingsRequest
 @see AWSCognitoIdentityProviderSetUserSettingsResponse
 */
- (void)setUserSettings:(AWSCognitoIdentityProviderSetUserSettingsRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderSetUserSettingsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Registers the user in the specified user pool and creates a user name, password, and user attributes.</p>
 
 @param request A container for the necessary parameters to execute the SignUp service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderSignUpResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorUnexpectedLambda`, `AWSCognitoIdentityProviderErrorUserLambdaValidation`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorInvalidPassword`, `AWSCognitoIdentityProviderErrorInvalidLambdaResponse`, `AWSCognitoIdentityProviderErrorUsernameExists`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleAccessPolicy`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleTrustRelationship`, `AWSCognitoIdentityProviderErrorInvalidEmailRoleAccessPolicy`, `AWSCognitoIdentityProviderErrorCodeDeliveryFailure`.
 
 @see AWSCognitoIdentityProviderSignUpRequest
 @see AWSCognitoIdentityProviderSignUpResponse
 */
- (AWSTask<AWSCognitoIdentityProviderSignUpResponse *> *)signUp:(AWSCognitoIdentityProviderSignUpRequest *)request;

/**
 <p>Registers the user in the specified user pool and creates a user name, password, and user attributes.</p>
 
 @param request A container for the necessary parameters to execute the SignUp service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorUnexpectedLambda`, `AWSCognitoIdentityProviderErrorUserLambdaValidation`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorInvalidPassword`, `AWSCognitoIdentityProviderErrorInvalidLambdaResponse`, `AWSCognitoIdentityProviderErrorUsernameExists`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleAccessPolicy`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleTrustRelationship`, `AWSCognitoIdentityProviderErrorInvalidEmailRoleAccessPolicy`, `AWSCognitoIdentityProviderErrorCodeDeliveryFailure`.
 
 @see AWSCognitoIdentityProviderSignUpRequest
 @see AWSCognitoIdentityProviderSignUpResponse
 */
- (void)signUp:(AWSCognitoIdentityProviderSignUpRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderSignUpResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Starts the user import.</p>
 
 @param request A container for the necessary parameters to execute the StartUserImportJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderStartUserImportJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`, `AWSCognitoIdentityProviderErrorPreconditionNotMet`, `AWSCognitoIdentityProviderErrorNotAuthorized`.
 
 @see AWSCognitoIdentityProviderStartUserImportJobRequest
 @see AWSCognitoIdentityProviderStartUserImportJobResponse
 */
- (AWSTask<AWSCognitoIdentityProviderStartUserImportJobResponse *> *)startUserImportJob:(AWSCognitoIdentityProviderStartUserImportJobRequest *)request;

/**
 <p>Starts the user import.</p>
 
 @param request A container for the necessary parameters to execute the StartUserImportJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`, `AWSCognitoIdentityProviderErrorPreconditionNotMet`, `AWSCognitoIdentityProviderErrorNotAuthorized`.
 
 @see AWSCognitoIdentityProviderStartUserImportJobRequest
 @see AWSCognitoIdentityProviderStartUserImportJobResponse
 */
- (void)startUserImportJob:(AWSCognitoIdentityProviderStartUserImportJobRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderStartUserImportJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Stops the user import job.</p>
 
 @param request A container for the necessary parameters to execute the StopUserImportJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderStopUserImportJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`, `AWSCognitoIdentityProviderErrorPreconditionNotMet`, `AWSCognitoIdentityProviderErrorNotAuthorized`.
 
 @see AWSCognitoIdentityProviderStopUserImportJobRequest
 @see AWSCognitoIdentityProviderStopUserImportJobResponse
 */
- (AWSTask<AWSCognitoIdentityProviderStopUserImportJobResponse *> *)stopUserImportJob:(AWSCognitoIdentityProviderStopUserImportJobRequest *)request;

/**
 <p>Stops the user import job.</p>
 
 @param request A container for the necessary parameters to execute the StopUserImportJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`, `AWSCognitoIdentityProviderErrorPreconditionNotMet`, `AWSCognitoIdentityProviderErrorNotAuthorized`.
 
 @see AWSCognitoIdentityProviderStopUserImportJobRequest
 @see AWSCognitoIdentityProviderStopUserImportJobResponse
 */
- (void)stopUserImportJob:(AWSCognitoIdentityProviderStopUserImportJobRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderStopUserImportJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the device status.</p>
 
 @param request A container for the necessary parameters to execute the UpdateDeviceStatus service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderUpdateDeviceStatusResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorInvalidUserPoolConfiguration`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorPasswordResetRequired`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorUserNotConfirmed`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderUpdateDeviceStatusRequest
 @see AWSCognitoIdentityProviderUpdateDeviceStatusResponse
 */
- (AWSTask<AWSCognitoIdentityProviderUpdateDeviceStatusResponse *> *)updateDeviceStatus:(AWSCognitoIdentityProviderUpdateDeviceStatusRequest *)request;

/**
 <p>Updates the device status.</p>
 
 @param request A container for the necessary parameters to execute the UpdateDeviceStatus service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorInvalidUserPoolConfiguration`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorPasswordResetRequired`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorUserNotConfirmed`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderUpdateDeviceStatusRequest
 @see AWSCognitoIdentityProviderUpdateDeviceStatusResponse
 */
- (void)updateDeviceStatus:(AWSCognitoIdentityProviderUpdateDeviceStatusRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderUpdateDeviceStatusResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Allows a user to update a specific attribute (one at a time).</p>
 
 @param request A container for the necessary parameters to execute the UpdateUserAttributes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderUpdateUserAttributesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorCodeMismatch`, `AWSCognitoIdentityProviderErrorExpiredCode`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUnexpectedLambda`, `AWSCognitoIdentityProviderErrorUserLambdaValidation`, `AWSCognitoIdentityProviderErrorInvalidLambdaResponse`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorAliasExists`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleAccessPolicy`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleTrustRelationship`, `AWSCognitoIdentityProviderErrorInvalidEmailRoleAccessPolicy`, `AWSCognitoIdentityProviderErrorCodeDeliveryFailure`, `AWSCognitoIdentityProviderErrorPasswordResetRequired`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorUserNotConfirmed`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderUpdateUserAttributesRequest
 @see AWSCognitoIdentityProviderUpdateUserAttributesResponse
 */
- (AWSTask<AWSCognitoIdentityProviderUpdateUserAttributesResponse *> *)updateUserAttributes:(AWSCognitoIdentityProviderUpdateUserAttributesRequest *)request;

/**
 <p>Allows a user to update a specific attribute (one at a time).</p>
 
 @param request A container for the necessary parameters to execute the UpdateUserAttributes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorCodeMismatch`, `AWSCognitoIdentityProviderErrorExpiredCode`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUnexpectedLambda`, `AWSCognitoIdentityProviderErrorUserLambdaValidation`, `AWSCognitoIdentityProviderErrorInvalidLambdaResponse`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorAliasExists`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleAccessPolicy`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleTrustRelationship`, `AWSCognitoIdentityProviderErrorInvalidEmailRoleAccessPolicy`, `AWSCognitoIdentityProviderErrorCodeDeliveryFailure`, `AWSCognitoIdentityProviderErrorPasswordResetRequired`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorUserNotConfirmed`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderUpdateUserAttributesRequest
 @see AWSCognitoIdentityProviderUpdateUserAttributesResponse
 */
- (void)updateUserAttributes:(AWSCognitoIdentityProviderUpdateUserAttributesRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderUpdateUserAttributesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the specified user pool with the specified attributes.</p>
 
 @param request A container for the necessary parameters to execute the UpdateUserPool service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderUpdateUserPoolResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorConcurrentModification`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUserImportInProgress`, `AWSCognitoIdentityProviderErrorInternalError`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleAccessPolicy`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleTrustRelationship`, `AWSCognitoIdentityProviderErrorInvalidEmailRoleAccessPolicy`.
 
 @see AWSCognitoIdentityProviderUpdateUserPoolRequest
 @see AWSCognitoIdentityProviderUpdateUserPoolResponse
 */
- (AWSTask<AWSCognitoIdentityProviderUpdateUserPoolResponse *> *)updateUserPool:(AWSCognitoIdentityProviderUpdateUserPoolRequest *)request;

/**
 <p>Updates the specified user pool with the specified attributes.</p>
 
 @param request A container for the necessary parameters to execute the UpdateUserPool service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorConcurrentModification`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUserImportInProgress`, `AWSCognitoIdentityProviderErrorInternalError`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleAccessPolicy`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleTrustRelationship`, `AWSCognitoIdentityProviderErrorInvalidEmailRoleAccessPolicy`.
 
 @see AWSCognitoIdentityProviderUpdateUserPoolRequest
 @see AWSCognitoIdentityProviderUpdateUserPoolResponse
 */
- (void)updateUserPool:(AWSCognitoIdentityProviderUpdateUserPoolRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderUpdateUserPoolResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Allows the developer to update the specified user pool client and password policy.</p>
 
 @param request A container for the necessary parameters to execute the UpdateUserPoolClient service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderUpdateUserPoolClientResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderUpdateUserPoolClientRequest
 @see AWSCognitoIdentityProviderUpdateUserPoolClientResponse
 */
- (AWSTask<AWSCognitoIdentityProviderUpdateUserPoolClientResponse *> *)updateUserPoolClient:(AWSCognitoIdentityProviderUpdateUserPoolClientRequest *)request;

/**
 <p>Allows the developer to update the specified user pool client and password policy.</p>
 
 @param request A container for the necessary parameters to execute the UpdateUserPoolClient service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderUpdateUserPoolClientRequest
 @see AWSCognitoIdentityProviderUpdateUserPoolClientResponse
 */
- (void)updateUserPoolClient:(AWSCognitoIdentityProviderUpdateUserPoolClientRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderUpdateUserPoolClientResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Verifies the specified user attributes in the user pool.</p>
 
 @param request A container for the necessary parameters to execute the VerifyUserAttribute service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderVerifyUserAttributeResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorCodeMismatch`, `AWSCognitoIdentityProviderErrorExpiredCode`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorLimitExceeded`, `AWSCognitoIdentityProviderErrorPasswordResetRequired`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorUserNotConfirmed`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderVerifyUserAttributeRequest
 @see AWSCognitoIdentityProviderVerifyUserAttributeResponse
 */
- (AWSTask<AWSCognitoIdentityProviderVerifyUserAttributeResponse *> *)verifyUserAttribute:(AWSCognitoIdentityProviderVerifyUserAttributeRequest *)request;

/**
 <p>Verifies the specified user attributes in the user pool.</p>
 
 @param request A container for the necessary parameters to execute the VerifyUserAttribute service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorCodeMismatch`, `AWSCognitoIdentityProviderErrorExpiredCode`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorLimitExceeded`, `AWSCognitoIdentityProviderErrorPasswordResetRequired`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorUserNotConfirmed`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderVerifyUserAttributeRequest
 @see AWSCognitoIdentityProviderVerifyUserAttributeResponse
 */
- (void)verifyUserAttribute:(AWSCognitoIdentityProviderVerifyUserAttributeRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderVerifyUserAttributeResponse * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
