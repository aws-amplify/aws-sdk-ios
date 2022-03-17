//
// Copyright 2010-2022 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

//! SDK version for AWSCognitoIdentityProvider
FOUNDATION_EXPORT NSString *const AWSCognitoIdentityProviderSDKVersion;

/**
 <p>Using the Amazon Cognito user pools API, you can create a user pool to manage directories and users. You can authenticate a user to obtain tokens related to user identity and access policies.</p><p>This API reference provides information about user pools in Amazon Cognito user pools.</p><p>For more information, see the <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/what-is-amazon-cognito.html">Amazon Cognito Documentation</a>.</p>
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
 <p>Adds the specified user to the specified group.</p><p>Calling this action requires developer credentials.</p>
 
 @param request A container for the necessary parameters to execute the AdminAddUserToGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderAdminAddUserToGroupRequest
 */
- (AWSTask *)adminAddUserToGroup:(AWSCognitoIdentityProviderAdminAddUserToGroupRequest *)request;

/**
 <p>Adds the specified user to the specified group.</p><p>Calling this action requires developer credentials.</p>
 
 @param request A container for the necessary parameters to execute the AdminAddUserToGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderAdminAddUserToGroupRequest
 */
- (void)adminAddUserToGroup:(AWSCognitoIdentityProviderAdminAddUserToGroupRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Confirms user registration as an admin without using a confirmation code. Works on any user.</p><p>Calling this action requires developer credentials.</p>
 
 @param request A container for the necessary parameters to execute the AdminConfirmSignUp service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderAdminConfirmSignUpResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorUnexpectedLambda`, `AWSCognitoIdentityProviderErrorUserLambdaValidation`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorTooManyFailedAttempts`, `AWSCognitoIdentityProviderErrorInvalidLambdaResponse`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorLimitExceeded`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderAdminConfirmSignUpRequest
 @see AWSCognitoIdentityProviderAdminConfirmSignUpResponse
 */
- (AWSTask<AWSCognitoIdentityProviderAdminConfirmSignUpResponse *> *)adminConfirmSignUp:(AWSCognitoIdentityProviderAdminConfirmSignUpRequest *)request;

/**
 <p>Confirms user registration as an admin without using a confirmation code. Works on any user.</p><p>Calling this action requires developer credentials.</p>
 
 @param request A container for the necessary parameters to execute the AdminConfirmSignUp service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorUnexpectedLambda`, `AWSCognitoIdentityProviderErrorUserLambdaValidation`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorTooManyFailedAttempts`, `AWSCognitoIdentityProviderErrorInvalidLambdaResponse`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorLimitExceeded`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderAdminConfirmSignUpRequest
 @see AWSCognitoIdentityProviderAdminConfirmSignUpResponse
 */
- (void)adminConfirmSignUp:(AWSCognitoIdentityProviderAdminConfirmSignUpRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderAdminConfirmSignUpResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new user in the specified user pool.</p><p>If <code>MessageAction</code> isn't set, the default is to send a welcome message via email or phone (SMS).</p><note><p>This action might generate an SMS text message. Starting June 1, 2021, US telecom carriers require you to register an origination phone number before you can send SMS messages to US phone numbers. If you use SMS text messages in Amazon Cognito, you must register a phone number with <a href="https://console.aws.amazon.com/pinpoint/home/">Amazon Pinpoint</a>. Amazon Cognito uses the registered number automatically. Otherwise, Amazon Cognito users who must receive SMS messages might not be able to sign up, activate their accounts, or sign in.</p><p>If you have never used SMS text messages with Amazon Cognito or any other Amazon Web Service, Amazon Simple Notification Service might place your account in the SMS sandbox. In <i><a href="https://docs.aws.amazon.com/sns/latest/dg/sns-sms-sandbox.html">sandbox mode</a></i>, you can send messages only to verified phone numbers. After you test your app while in the sandbox environment, you can move out of the sandbox and into production. For more information, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-identity-pools-sms-userpool-settings.html"> SMS message settings for Amazon Cognito user pools</a> in the <i>Amazon Cognito Developer Guide</i>.</p></note><p>This message is based on a template that you configured in your call to create or update a user pool. This template includes your custom sign-up instructions and placeholders for user name and temporary password.</p><p>Alternatively, you can call <code>AdminCreateUser</code> with <code>SUPPRESS</code> for the <code>MessageAction</code> parameter, and Amazon Cognito won't send any email. </p><p>In either case, the user will be in the <code>FORCE_CHANGE_PASSWORD</code> state until they sign in and change their password.</p><p><code>AdminCreateUser</code> requires developer credentials.</p>
 
 @param request A container for the necessary parameters to execute the AdminCreateUser service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderAdminCreateUserResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorUsernameExists`, `AWSCognitoIdentityProviderErrorInvalidPassword`, `AWSCognitoIdentityProviderErrorCodeDeliveryFailure`, `AWSCognitoIdentityProviderErrorUnexpectedLambda`, `AWSCognitoIdentityProviderErrorUserLambdaValidation`, `AWSCognitoIdentityProviderErrorInvalidLambdaResponse`, `AWSCognitoIdentityProviderErrorPreconditionNotMet`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleAccessPolicy`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleTrustRelationship`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUnsupportedUserState`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderAdminCreateUserRequest
 @see AWSCognitoIdentityProviderAdminCreateUserResponse
 */
- (AWSTask<AWSCognitoIdentityProviderAdminCreateUserResponse *> *)adminCreateUser:(AWSCognitoIdentityProviderAdminCreateUserRequest *)request;

/**
 <p>Creates a new user in the specified user pool.</p><p>If <code>MessageAction</code> isn't set, the default is to send a welcome message via email or phone (SMS).</p><note><p>This action might generate an SMS text message. Starting June 1, 2021, US telecom carriers require you to register an origination phone number before you can send SMS messages to US phone numbers. If you use SMS text messages in Amazon Cognito, you must register a phone number with <a href="https://console.aws.amazon.com/pinpoint/home/">Amazon Pinpoint</a>. Amazon Cognito uses the registered number automatically. Otherwise, Amazon Cognito users who must receive SMS messages might not be able to sign up, activate their accounts, or sign in.</p><p>If you have never used SMS text messages with Amazon Cognito or any other Amazon Web Service, Amazon Simple Notification Service might place your account in the SMS sandbox. In <i><a href="https://docs.aws.amazon.com/sns/latest/dg/sns-sms-sandbox.html">sandbox mode</a></i>, you can send messages only to verified phone numbers. After you test your app while in the sandbox environment, you can move out of the sandbox and into production. For more information, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-identity-pools-sms-userpool-settings.html"> SMS message settings for Amazon Cognito user pools</a> in the <i>Amazon Cognito Developer Guide</i>.</p></note><p>This message is based on a template that you configured in your call to create or update a user pool. This template includes your custom sign-up instructions and placeholders for user name and temporary password.</p><p>Alternatively, you can call <code>AdminCreateUser</code> with <code>SUPPRESS</code> for the <code>MessageAction</code> parameter, and Amazon Cognito won't send any email. </p><p>In either case, the user will be in the <code>FORCE_CHANGE_PASSWORD</code> state until they sign in and change their password.</p><p><code>AdminCreateUser</code> requires developer credentials.</p>
 
 @param request A container for the necessary parameters to execute the AdminCreateUser service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorUsernameExists`, `AWSCognitoIdentityProviderErrorInvalidPassword`, `AWSCognitoIdentityProviderErrorCodeDeliveryFailure`, `AWSCognitoIdentityProviderErrorUnexpectedLambda`, `AWSCognitoIdentityProviderErrorUserLambdaValidation`, `AWSCognitoIdentityProviderErrorInvalidLambdaResponse`, `AWSCognitoIdentityProviderErrorPreconditionNotMet`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleAccessPolicy`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleTrustRelationship`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUnsupportedUserState`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderAdminCreateUserRequest
 @see AWSCognitoIdentityProviderAdminCreateUserResponse
 */
- (void)adminCreateUser:(AWSCognitoIdentityProviderAdminCreateUserRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderAdminCreateUserResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a user as an administrator. Works on any user.</p><p>Calling this action requires developer credentials.</p>
 
 @param request A container for the necessary parameters to execute the AdminDeleteUser service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderAdminDeleteUserRequest
 */
- (AWSTask *)adminDeleteUser:(AWSCognitoIdentityProviderAdminDeleteUserRequest *)request;

/**
 <p>Deletes a user as an administrator. Works on any user.</p><p>Calling this action requires developer credentials.</p>
 
 @param request A container for the necessary parameters to execute the AdminDeleteUser service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderAdminDeleteUserRequest
 */
- (void)adminDeleteUser:(AWSCognitoIdentityProviderAdminDeleteUserRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the user attributes in a user pool as an administrator. Works on any user.</p><p>Calling this action requires developer credentials.</p>
 
 @param request A container for the necessary parameters to execute the AdminDeleteUserAttributes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderAdminDeleteUserAttributesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderAdminDeleteUserAttributesRequest
 @see AWSCognitoIdentityProviderAdminDeleteUserAttributesResponse
 */
- (AWSTask<AWSCognitoIdentityProviderAdminDeleteUserAttributesResponse *> *)adminDeleteUserAttributes:(AWSCognitoIdentityProviderAdminDeleteUserAttributesRequest *)request;

/**
 <p>Deletes the user attributes in a user pool as an administrator. Works on any user.</p><p>Calling this action requires developer credentials.</p>
 
 @param request A container for the necessary parameters to execute the AdminDeleteUserAttributes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderAdminDeleteUserAttributesRequest
 @see AWSCognitoIdentityProviderAdminDeleteUserAttributesResponse
 */
- (void)adminDeleteUserAttributes:(AWSCognitoIdentityProviderAdminDeleteUserAttributesRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderAdminDeleteUserAttributesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Prevents the user from signing in with the specified external (SAML or social) identity provider. If the user that you want to deactivate is a Amazon Cognito user pools native username + password user, they can't use their password to sign in. If the user to deactivate is a linked external identity provider (IdP) user, any link between that user and an existing user is removed. When the external user signs in again, and the user is no longer attached to the previously linked <code>DestinationUser</code>, the user must create a new user account. See <a href="https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_AdminLinkProviderForUser.html">AdminLinkProviderForUser</a>.</p><p>This action is enabled only for admin access and requires developer credentials.</p><p>The <code>ProviderName</code> must match the value specified when creating an IdP for the pool. </p><p>To deactivate a native username + password user, the <code>ProviderName</code> value must be <code>Cognito</code> and the <code>ProviderAttributeName</code> must be <code>Cognito_Subject</code>. The <code>ProviderAttributeValue</code> must be the name that is used in the user pool for the user.</p><p>The <code>ProviderAttributeName</code> must always be <code>Cognito_Subject</code> for social identity providers. The <code>ProviderAttributeValue</code> must always be the exact subject that was used when the user was originally linked as a source user.</p><p>For de-linking a SAML identity, there are two scenarios. If the linked identity has not yet been used to sign in, the <code>ProviderAttributeName</code> and <code>ProviderAttributeValue</code> must be the same values that were used for the <code>SourceUser</code> when the identities were originally linked using <code> AdminLinkProviderForUser</code> call. (If the linking was done with <code>ProviderAttributeName</code> set to <code>Cognito_Subject</code>, the same applies here). However, if the user has already signed in, the <code>ProviderAttributeName</code> must be <code>Cognito_Subject</code> and <code>ProviderAttributeValue</code> must be the subject of the SAML assertion.</p>
 
 @param request A container for the necessary parameters to execute the AdminDisableProviderForUser service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderAdminDisableProviderForUserResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorAliasExists`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderAdminDisableProviderForUserRequest
 @see AWSCognitoIdentityProviderAdminDisableProviderForUserResponse
 */
- (AWSTask<AWSCognitoIdentityProviderAdminDisableProviderForUserResponse *> *)adminDisableProviderForUser:(AWSCognitoIdentityProviderAdminDisableProviderForUserRequest *)request;

/**
 <p>Prevents the user from signing in with the specified external (SAML or social) identity provider. If the user that you want to deactivate is a Amazon Cognito user pools native username + password user, they can't use their password to sign in. If the user to deactivate is a linked external identity provider (IdP) user, any link between that user and an existing user is removed. When the external user signs in again, and the user is no longer attached to the previously linked <code>DestinationUser</code>, the user must create a new user account. See <a href="https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_AdminLinkProviderForUser.html">AdminLinkProviderForUser</a>.</p><p>This action is enabled only for admin access and requires developer credentials.</p><p>The <code>ProviderName</code> must match the value specified when creating an IdP for the pool. </p><p>To deactivate a native username + password user, the <code>ProviderName</code> value must be <code>Cognito</code> and the <code>ProviderAttributeName</code> must be <code>Cognito_Subject</code>. The <code>ProviderAttributeValue</code> must be the name that is used in the user pool for the user.</p><p>The <code>ProviderAttributeName</code> must always be <code>Cognito_Subject</code> for social identity providers. The <code>ProviderAttributeValue</code> must always be the exact subject that was used when the user was originally linked as a source user.</p><p>For de-linking a SAML identity, there are two scenarios. If the linked identity has not yet been used to sign in, the <code>ProviderAttributeName</code> and <code>ProviderAttributeValue</code> must be the same values that were used for the <code>SourceUser</code> when the identities were originally linked using <code> AdminLinkProviderForUser</code> call. (If the linking was done with <code>ProviderAttributeName</code> set to <code>Cognito_Subject</code>, the same applies here). However, if the user has already signed in, the <code>ProviderAttributeName</code> must be <code>Cognito_Subject</code> and <code>ProviderAttributeValue</code> must be the subject of the SAML assertion.</p>
 
 @param request A container for the necessary parameters to execute the AdminDisableProviderForUser service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorAliasExists`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderAdminDisableProviderForUserRequest
 @see AWSCognitoIdentityProviderAdminDisableProviderForUserResponse
 */
- (void)adminDisableProviderForUser:(AWSCognitoIdentityProviderAdminDisableProviderForUserRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderAdminDisableProviderForUserResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Disables the specified user.</p><p>Calling this action requires developer credentials.</p>
 
 @param request A container for the necessary parameters to execute the AdminDisableUser service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderAdminDisableUserResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderAdminDisableUserRequest
 @see AWSCognitoIdentityProviderAdminDisableUserResponse
 */
- (AWSTask<AWSCognitoIdentityProviderAdminDisableUserResponse *> *)adminDisableUser:(AWSCognitoIdentityProviderAdminDisableUserRequest *)request;

/**
 <p>Disables the specified user.</p><p>Calling this action requires developer credentials.</p>
 
 @param request A container for the necessary parameters to execute the AdminDisableUser service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderAdminDisableUserRequest
 @see AWSCognitoIdentityProviderAdminDisableUserResponse
 */
- (void)adminDisableUser:(AWSCognitoIdentityProviderAdminDisableUserRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderAdminDisableUserResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Enables the specified user as an administrator. Works on any user.</p><p>Calling this action requires developer credentials.</p>
 
 @param request A container for the necessary parameters to execute the AdminEnableUser service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderAdminEnableUserResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderAdminEnableUserRequest
 @see AWSCognitoIdentityProviderAdminEnableUserResponse
 */
- (AWSTask<AWSCognitoIdentityProviderAdminEnableUserResponse *> *)adminEnableUser:(AWSCognitoIdentityProviderAdminEnableUserRequest *)request;

/**
 <p>Enables the specified user as an administrator. Works on any user.</p><p>Calling this action requires developer credentials.</p>
 
 @param request A container for the necessary parameters to execute the AdminEnableUser service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderAdminEnableUserRequest
 @see AWSCognitoIdentityProviderAdminEnableUserResponse
 */
- (void)adminEnableUser:(AWSCognitoIdentityProviderAdminEnableUserRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderAdminEnableUserResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Forgets the device, as an administrator.</p><p>Calling this action requires developer credentials.</p>
 
 @param request A container for the necessary parameters to execute the AdminForgetDevice service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorInvalidUserPoolConfiguration`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderAdminForgetDeviceRequest
 */
- (AWSTask *)adminForgetDevice:(AWSCognitoIdentityProviderAdminForgetDeviceRequest *)request;

/**
 <p>Forgets the device, as an administrator.</p><p>Calling this action requires developer credentials.</p>
 
 @param request A container for the necessary parameters to execute the AdminForgetDevice service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorInvalidUserPoolConfiguration`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderAdminForgetDeviceRequest
 */
- (void)adminForgetDevice:(AWSCognitoIdentityProviderAdminForgetDeviceRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Gets the device, as an administrator.</p><p>Calling this action requires developer credentials.</p>
 
 @param request A container for the necessary parameters to execute the AdminGetDevice service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderAdminGetDeviceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorInvalidUserPoolConfiguration`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`, `AWSCognitoIdentityProviderErrorNotAuthorized`.
 
 @see AWSCognitoIdentityProviderAdminGetDeviceRequest
 @see AWSCognitoIdentityProviderAdminGetDeviceResponse
 */
- (AWSTask<AWSCognitoIdentityProviderAdminGetDeviceResponse *> *)adminGetDevice:(AWSCognitoIdentityProviderAdminGetDeviceRequest *)request;

/**
 <p>Gets the device, as an administrator.</p><p>Calling this action requires developer credentials.</p>
 
 @param request A container for the necessary parameters to execute the AdminGetDevice service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorInvalidUserPoolConfiguration`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`, `AWSCognitoIdentityProviderErrorNotAuthorized`.
 
 @see AWSCognitoIdentityProviderAdminGetDeviceRequest
 @see AWSCognitoIdentityProviderAdminGetDeviceResponse
 */
- (void)adminGetDevice:(AWSCognitoIdentityProviderAdminGetDeviceRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderAdminGetDeviceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets the specified user by user name in a user pool as an administrator. Works on any user.</p><p>Calling this action requires developer credentials.</p>
 
 @param request A container for the necessary parameters to execute the AdminGetUser service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderAdminGetUserResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderAdminGetUserRequest
 @see AWSCognitoIdentityProviderAdminGetUserResponse
 */
- (AWSTask<AWSCognitoIdentityProviderAdminGetUserResponse *> *)adminGetUser:(AWSCognitoIdentityProviderAdminGetUserRequest *)request;

/**
 <p>Gets the specified user by user name in a user pool as an administrator. Works on any user.</p><p>Calling this action requires developer credentials.</p>
 
 @param request A container for the necessary parameters to execute the AdminGetUser service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderAdminGetUserRequest
 @see AWSCognitoIdentityProviderAdminGetUserResponse
 */
- (void)adminGetUser:(AWSCognitoIdentityProviderAdminGetUserRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderAdminGetUserResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Initiates the authentication flow, as an administrator.</p><note><p>This action might generate an SMS text message. Starting June 1, 2021, US telecom carriers require you to register an origination phone number before you can send SMS messages to US phone numbers. If you use SMS text messages in Amazon Cognito, you must register a phone number with <a href="https://console.aws.amazon.com/pinpoint/home/">Amazon Pinpoint</a>. Amazon Cognito uses the registered number automatically. Otherwise, Amazon Cognito users who must receive SMS messages might not be able to sign up, activate their accounts, or sign in.</p><p>If you have never used SMS text messages with Amazon Cognito or any other Amazon Web Service, Amazon Simple Notification Service might place your account in the SMS sandbox. In <i><a href="https://docs.aws.amazon.com/sns/latest/dg/sns-sms-sandbox.html">sandbox mode</a></i>, you can send messages only to verified phone numbers. After you test your app while in the sandbox environment, you can move out of the sandbox and into production. For more information, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-identity-pools-sms-userpool-settings.html"> SMS message settings for Amazon Cognito user pools</a> in the <i>Amazon Cognito Developer Guide</i>.</p></note><p>Calling this action requires developer credentials.</p>
 
 @param request A container for the necessary parameters to execute the AdminInitiateAuth service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderAdminInitiateAuthResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`, `AWSCognitoIdentityProviderErrorUnexpectedLambda`, `AWSCognitoIdentityProviderErrorInvalidUserPoolConfiguration`, `AWSCognitoIdentityProviderErrorUserLambdaValidation`, `AWSCognitoIdentityProviderErrorInvalidLambdaResponse`, `AWSCognitoIdentityProviderErrorMFAMethodNotFound`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleAccessPolicy`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleTrustRelationship`, `AWSCognitoIdentityProviderErrorPasswordResetRequired`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorUserNotConfirmed`.
 
 @see AWSCognitoIdentityProviderAdminInitiateAuthRequest
 @see AWSCognitoIdentityProviderAdminInitiateAuthResponse
 */
- (AWSTask<AWSCognitoIdentityProviderAdminInitiateAuthResponse *> *)adminInitiateAuth:(AWSCognitoIdentityProviderAdminInitiateAuthRequest *)request;

/**
 <p>Initiates the authentication flow, as an administrator.</p><note><p>This action might generate an SMS text message. Starting June 1, 2021, US telecom carriers require you to register an origination phone number before you can send SMS messages to US phone numbers. If you use SMS text messages in Amazon Cognito, you must register a phone number with <a href="https://console.aws.amazon.com/pinpoint/home/">Amazon Pinpoint</a>. Amazon Cognito uses the registered number automatically. Otherwise, Amazon Cognito users who must receive SMS messages might not be able to sign up, activate their accounts, or sign in.</p><p>If you have never used SMS text messages with Amazon Cognito or any other Amazon Web Service, Amazon Simple Notification Service might place your account in the SMS sandbox. In <i><a href="https://docs.aws.amazon.com/sns/latest/dg/sns-sms-sandbox.html">sandbox mode</a></i>, you can send messages only to verified phone numbers. After you test your app while in the sandbox environment, you can move out of the sandbox and into production. For more information, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-identity-pools-sms-userpool-settings.html"> SMS message settings for Amazon Cognito user pools</a> in the <i>Amazon Cognito Developer Guide</i>.</p></note><p>Calling this action requires developer credentials.</p>
 
 @param request A container for the necessary parameters to execute the AdminInitiateAuth service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`, `AWSCognitoIdentityProviderErrorUnexpectedLambda`, `AWSCognitoIdentityProviderErrorInvalidUserPoolConfiguration`, `AWSCognitoIdentityProviderErrorUserLambdaValidation`, `AWSCognitoIdentityProviderErrorInvalidLambdaResponse`, `AWSCognitoIdentityProviderErrorMFAMethodNotFound`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleAccessPolicy`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleTrustRelationship`, `AWSCognitoIdentityProviderErrorPasswordResetRequired`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorUserNotConfirmed`.
 
 @see AWSCognitoIdentityProviderAdminInitiateAuthRequest
 @see AWSCognitoIdentityProviderAdminInitiateAuthResponse
 */
- (void)adminInitiateAuth:(AWSCognitoIdentityProviderAdminInitiateAuthRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderAdminInitiateAuthResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Links an existing user account in a user pool (<code>DestinationUser</code>) to an identity from an external identity provider (<code>SourceUser</code>) based on a specified attribute name and value from the external identity provider. This allows you to create a link from the existing user account to an external federated user identity that has not yet been used to sign in. You can then use the federated user identity to sign in as the existing user account. </p><p> For example, if there is an existing user with a username and password, this API links that user to a federated user identity. When the user signs in with a federated user identity, they sign in as the existing user account.</p><note><p>The maximum number of federated identities linked to a user is 5.</p></note><important><p>Because this API allows a user with an external federated identity to sign in as an existing user in the user pool, it is critical that it only be used with external identity providers and provider attributes that have been trusted by the application owner.</p></important><p>This action is administrative and requires developer credentials.</p>
 
 @param request A container for the necessary parameters to execute the AdminLinkProviderForUser service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderAdminLinkProviderForUserResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorAliasExists`, `AWSCognitoIdentityProviderErrorLimitExceeded`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderAdminLinkProviderForUserRequest
 @see AWSCognitoIdentityProviderAdminLinkProviderForUserResponse
 */
- (AWSTask<AWSCognitoIdentityProviderAdminLinkProviderForUserResponse *> *)adminLinkProviderForUser:(AWSCognitoIdentityProviderAdminLinkProviderForUserRequest *)request;

/**
 <p>Links an existing user account in a user pool (<code>DestinationUser</code>) to an identity from an external identity provider (<code>SourceUser</code>) based on a specified attribute name and value from the external identity provider. This allows you to create a link from the existing user account to an external federated user identity that has not yet been used to sign in. You can then use the federated user identity to sign in as the existing user account. </p><p> For example, if there is an existing user with a username and password, this API links that user to a federated user identity. When the user signs in with a federated user identity, they sign in as the existing user account.</p><note><p>The maximum number of federated identities linked to a user is 5.</p></note><important><p>Because this API allows a user with an external federated identity to sign in as an existing user in the user pool, it is critical that it only be used with external identity providers and provider attributes that have been trusted by the application owner.</p></important><p>This action is administrative and requires developer credentials.</p>
 
 @param request A container for the necessary parameters to execute the AdminLinkProviderForUser service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorAliasExists`, `AWSCognitoIdentityProviderErrorLimitExceeded`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderAdminLinkProviderForUserRequest
 @see AWSCognitoIdentityProviderAdminLinkProviderForUserResponse
 */
- (void)adminLinkProviderForUser:(AWSCognitoIdentityProviderAdminLinkProviderForUserRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderAdminLinkProviderForUserResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists devices, as an administrator.</p><p>Calling this action requires developer credentials.</p>
 
 @param request A container for the necessary parameters to execute the AdminListDevices service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderAdminListDevicesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidUserPoolConfiguration`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`, `AWSCognitoIdentityProviderErrorNotAuthorized`.
 
 @see AWSCognitoIdentityProviderAdminListDevicesRequest
 @see AWSCognitoIdentityProviderAdminListDevicesResponse
 */
- (AWSTask<AWSCognitoIdentityProviderAdminListDevicesResponse *> *)adminListDevices:(AWSCognitoIdentityProviderAdminListDevicesRequest *)request;

/**
 <p>Lists devices, as an administrator.</p><p>Calling this action requires developer credentials.</p>
 
 @param request A container for the necessary parameters to execute the AdminListDevices service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidUserPoolConfiguration`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`, `AWSCognitoIdentityProviderErrorNotAuthorized`.
 
 @see AWSCognitoIdentityProviderAdminListDevicesRequest
 @see AWSCognitoIdentityProviderAdminListDevicesResponse
 */
- (void)adminListDevices:(AWSCognitoIdentityProviderAdminListDevicesRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderAdminListDevicesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the groups that the user belongs to.</p><p>Calling this action requires developer credentials.</p>
 
 @param request A container for the necessary parameters to execute the AdminListGroupsForUser service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderAdminListGroupsForUserResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderAdminListGroupsForUserRequest
 @see AWSCognitoIdentityProviderAdminListGroupsForUserResponse
 */
- (AWSTask<AWSCognitoIdentityProviderAdminListGroupsForUserResponse *> *)adminListGroupsForUser:(AWSCognitoIdentityProviderAdminListGroupsForUserRequest *)request;

/**
 <p>Lists the groups that the user belongs to.</p><p>Calling this action requires developer credentials.</p>
 
 @param request A container for the necessary parameters to execute the AdminListGroupsForUser service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderAdminListGroupsForUserRequest
 @see AWSCognitoIdentityProviderAdminListGroupsForUserResponse
 */
- (void)adminListGroupsForUser:(AWSCognitoIdentityProviderAdminListGroupsForUserRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderAdminListGroupsForUserResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>A history of user activity and any risks detected as part of Amazon Cognito advanced security.</p>
 
 @param request A container for the necessary parameters to execute the AdminListUserAuthEvents service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderAdminListUserAuthEventsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorUserPoolAddOnNotEnabled`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderAdminListUserAuthEventsRequest
 @see AWSCognitoIdentityProviderAdminListUserAuthEventsResponse
 */
- (AWSTask<AWSCognitoIdentityProviderAdminListUserAuthEventsResponse *> *)adminListUserAuthEvents:(AWSCognitoIdentityProviderAdminListUserAuthEventsRequest *)request;

/**
 <p>A history of user activity and any risks detected as part of Amazon Cognito advanced security.</p>
 
 @param request A container for the necessary parameters to execute the AdminListUserAuthEvents service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorUserPoolAddOnNotEnabled`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderAdminListUserAuthEventsRequest
 @see AWSCognitoIdentityProviderAdminListUserAuthEventsResponse
 */
- (void)adminListUserAuthEvents:(AWSCognitoIdentityProviderAdminListUserAuthEventsRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderAdminListUserAuthEventsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Removes the specified user from the specified group.</p><p>Calling this action requires developer credentials.</p>
 
 @param request A container for the necessary parameters to execute the AdminRemoveUserFromGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderAdminRemoveUserFromGroupRequest
 */
- (AWSTask *)adminRemoveUserFromGroup:(AWSCognitoIdentityProviderAdminRemoveUserFromGroupRequest *)request;

/**
 <p>Removes the specified user from the specified group.</p><p>Calling this action requires developer credentials.</p>
 
 @param request A container for the necessary parameters to execute the AdminRemoveUserFromGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderAdminRemoveUserFromGroupRequest
 */
- (void)adminRemoveUserFromGroup:(AWSCognitoIdentityProviderAdminRemoveUserFromGroupRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Resets the specified user's password in a user pool as an administrator. Works on any user.</p><p>When a developer calls this API, the current password is invalidated, so it must be changed. If a user tries to sign in after the API is called, the app will get a PasswordResetRequiredException exception back and should direct the user down the flow to reset the password, which is the same as the forgot password flow. In addition, if the user pool has phone verification selected and a verified phone number exists for the user, or if email verification is selected and a verified email exists for the user, calling this API will also result in sending a message to the end user with the code to change their password.</p><note><p>This action might generate an SMS text message. Starting June 1, 2021, US telecom carriers require you to register an origination phone number before you can send SMS messages to US phone numbers. If you use SMS text messages in Amazon Cognito, you must register a phone number with <a href="https://console.aws.amazon.com/pinpoint/home/">Amazon Pinpoint</a>. Amazon Cognito uses the registered number automatically. Otherwise, Amazon Cognito users who must receive SMS messages might not be able to sign up, activate their accounts, or sign in.</p><p>If you have never used SMS text messages with Amazon Cognito or any other Amazon Web Service, Amazon Simple Notification Service might place your account in the SMS sandbox. In <i><a href="https://docs.aws.amazon.com/sns/latest/dg/sns-sms-sandbox.html">sandbox mode</a></i>, you can send messages only to verified phone numbers. After you test your app while in the sandbox environment, you can move out of the sandbox and into production. For more information, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-identity-pools-sms-userpool-settings.html"> SMS message settings for Amazon Cognito user pools</a> in the <i>Amazon Cognito Developer Guide</i>.</p></note><p>Calling this action requires developer credentials.</p>
 
 @param request A container for the necessary parameters to execute the AdminResetUserPassword service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderAdminResetUserPasswordResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorUnexpectedLambda`, `AWSCognitoIdentityProviderErrorUserLambdaValidation`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorInvalidLambdaResponse`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorLimitExceeded`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleAccessPolicy`, `AWSCognitoIdentityProviderErrorInvalidEmailRoleAccessPolicy`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleTrustRelationship`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderAdminResetUserPasswordRequest
 @see AWSCognitoIdentityProviderAdminResetUserPasswordResponse
 */
- (AWSTask<AWSCognitoIdentityProviderAdminResetUserPasswordResponse *> *)adminResetUserPassword:(AWSCognitoIdentityProviderAdminResetUserPasswordRequest *)request;

/**
 <p>Resets the specified user's password in a user pool as an administrator. Works on any user.</p><p>When a developer calls this API, the current password is invalidated, so it must be changed. If a user tries to sign in after the API is called, the app will get a PasswordResetRequiredException exception back and should direct the user down the flow to reset the password, which is the same as the forgot password flow. In addition, if the user pool has phone verification selected and a verified phone number exists for the user, or if email verification is selected and a verified email exists for the user, calling this API will also result in sending a message to the end user with the code to change their password.</p><note><p>This action might generate an SMS text message. Starting June 1, 2021, US telecom carriers require you to register an origination phone number before you can send SMS messages to US phone numbers. If you use SMS text messages in Amazon Cognito, you must register a phone number with <a href="https://console.aws.amazon.com/pinpoint/home/">Amazon Pinpoint</a>. Amazon Cognito uses the registered number automatically. Otherwise, Amazon Cognito users who must receive SMS messages might not be able to sign up, activate their accounts, or sign in.</p><p>If you have never used SMS text messages with Amazon Cognito or any other Amazon Web Service, Amazon Simple Notification Service might place your account in the SMS sandbox. In <i><a href="https://docs.aws.amazon.com/sns/latest/dg/sns-sms-sandbox.html">sandbox mode</a></i>, you can send messages only to verified phone numbers. After you test your app while in the sandbox environment, you can move out of the sandbox and into production. For more information, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-identity-pools-sms-userpool-settings.html"> SMS message settings for Amazon Cognito user pools</a> in the <i>Amazon Cognito Developer Guide</i>.</p></note><p>Calling this action requires developer credentials.</p>
 
 @param request A container for the necessary parameters to execute the AdminResetUserPassword service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorUnexpectedLambda`, `AWSCognitoIdentityProviderErrorUserLambdaValidation`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorInvalidLambdaResponse`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorLimitExceeded`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleAccessPolicy`, `AWSCognitoIdentityProviderErrorInvalidEmailRoleAccessPolicy`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleTrustRelationship`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderAdminResetUserPasswordRequest
 @see AWSCognitoIdentityProviderAdminResetUserPasswordResponse
 */
- (void)adminResetUserPassword:(AWSCognitoIdentityProviderAdminResetUserPasswordRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderAdminResetUserPasswordResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Responds to an authentication challenge, as an administrator.</p><note><p>This action might generate an SMS text message. Starting June 1, 2021, US telecom carriers require you to register an origination phone number before you can send SMS messages to US phone numbers. If you use SMS text messages in Amazon Cognito, you must register a phone number with <a href="https://console.aws.amazon.com/pinpoint/home/">Amazon Pinpoint</a>. Amazon Cognito uses the registered number automatically. Otherwise, Amazon Cognito users who must receive SMS messages might not be able to sign up, activate their accounts, or sign in.</p><p>If you have never used SMS text messages with Amazon Cognito or any other Amazon Web Service, Amazon Simple Notification Service might place your account in the SMS sandbox. In <i><a href="https://docs.aws.amazon.com/sns/latest/dg/sns-sms-sandbox.html">sandbox mode</a></i>, you can send messages only to verified phone numbers. After you test your app while in the sandbox environment, you can move out of the sandbox and into production. For more information, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-identity-pools-sms-userpool-settings.html"> SMS message settings for Amazon Cognito user pools</a> in the <i>Amazon Cognito Developer Guide</i>.</p></note><p>Calling this action requires developer credentials.</p>
 
 @param request A container for the necessary parameters to execute the AdminRespondToAuthChallenge service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderAdminRespondToAuthChallengeResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorCodeMismatch`, `AWSCognitoIdentityProviderErrorExpiredCode`, `AWSCognitoIdentityProviderErrorUnexpectedLambda`, `AWSCognitoIdentityProviderErrorInvalidPassword`, `AWSCognitoIdentityProviderErrorUserLambdaValidation`, `AWSCognitoIdentityProviderErrorInvalidLambdaResponse`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInvalidUserPoolConfiguration`, `AWSCognitoIdentityProviderErrorInternalError`, `AWSCognitoIdentityProviderErrorMFAMethodNotFound`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleAccessPolicy`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleTrustRelationship`, `AWSCognitoIdentityProviderErrorAliasExists`, `AWSCognitoIdentityProviderErrorPasswordResetRequired`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorUserNotConfirmed`, `AWSCognitoIdentityProviderErrorSoftwareTokenMFANotFound`.
 
 @see AWSCognitoIdentityProviderAdminRespondToAuthChallengeRequest
 @see AWSCognitoIdentityProviderAdminRespondToAuthChallengeResponse
 */
- (AWSTask<AWSCognitoIdentityProviderAdminRespondToAuthChallengeResponse *> *)adminRespondToAuthChallenge:(AWSCognitoIdentityProviderAdminRespondToAuthChallengeRequest *)request;

/**
 <p>Responds to an authentication challenge, as an administrator.</p><note><p>This action might generate an SMS text message. Starting June 1, 2021, US telecom carriers require you to register an origination phone number before you can send SMS messages to US phone numbers. If you use SMS text messages in Amazon Cognito, you must register a phone number with <a href="https://console.aws.amazon.com/pinpoint/home/">Amazon Pinpoint</a>. Amazon Cognito uses the registered number automatically. Otherwise, Amazon Cognito users who must receive SMS messages might not be able to sign up, activate their accounts, or sign in.</p><p>If you have never used SMS text messages with Amazon Cognito or any other Amazon Web Service, Amazon Simple Notification Service might place your account in the SMS sandbox. In <i><a href="https://docs.aws.amazon.com/sns/latest/dg/sns-sms-sandbox.html">sandbox mode</a></i>, you can send messages only to verified phone numbers. After you test your app while in the sandbox environment, you can move out of the sandbox and into production. For more information, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-identity-pools-sms-userpool-settings.html"> SMS message settings for Amazon Cognito user pools</a> in the <i>Amazon Cognito Developer Guide</i>.</p></note><p>Calling this action requires developer credentials.</p>
 
 @param request A container for the necessary parameters to execute the AdminRespondToAuthChallenge service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorCodeMismatch`, `AWSCognitoIdentityProviderErrorExpiredCode`, `AWSCognitoIdentityProviderErrorUnexpectedLambda`, `AWSCognitoIdentityProviderErrorInvalidPassword`, `AWSCognitoIdentityProviderErrorUserLambdaValidation`, `AWSCognitoIdentityProviderErrorInvalidLambdaResponse`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInvalidUserPoolConfiguration`, `AWSCognitoIdentityProviderErrorInternalError`, `AWSCognitoIdentityProviderErrorMFAMethodNotFound`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleAccessPolicy`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleTrustRelationship`, `AWSCognitoIdentityProviderErrorAliasExists`, `AWSCognitoIdentityProviderErrorPasswordResetRequired`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorUserNotConfirmed`, `AWSCognitoIdentityProviderErrorSoftwareTokenMFANotFound`.
 
 @see AWSCognitoIdentityProviderAdminRespondToAuthChallengeRequest
 @see AWSCognitoIdentityProviderAdminRespondToAuthChallengeResponse
 */
- (void)adminRespondToAuthChallenge:(AWSCognitoIdentityProviderAdminRespondToAuthChallengeRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderAdminRespondToAuthChallengeResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>The user's multi-factor authentication (MFA) preference, including which MFA options are activated, and if any are preferred. Only one factor can be set as preferred. The preferred MFA factor will be used to authenticate a user if multiple factors are activated. If multiple options are activated and no preference is set, a challenge to choose an MFA option will be returned during sign-in.</p>
 
 @param request A container for the necessary parameters to execute the AdminSetUserMFAPreference service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderAdminSetUserMFAPreferenceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorPasswordResetRequired`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorUserNotConfirmed`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderAdminSetUserMFAPreferenceRequest
 @see AWSCognitoIdentityProviderAdminSetUserMFAPreferenceResponse
 */
- (AWSTask<AWSCognitoIdentityProviderAdminSetUserMFAPreferenceResponse *> *)adminSetUserMFAPreference:(AWSCognitoIdentityProviderAdminSetUserMFAPreferenceRequest *)request;

/**
 <p>The user's multi-factor authentication (MFA) preference, including which MFA options are activated, and if any are preferred. Only one factor can be set as preferred. The preferred MFA factor will be used to authenticate a user if multiple factors are activated. If multiple options are activated and no preference is set, a challenge to choose an MFA option will be returned during sign-in.</p>
 
 @param request A container for the necessary parameters to execute the AdminSetUserMFAPreference service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorPasswordResetRequired`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorUserNotConfirmed`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderAdminSetUserMFAPreferenceRequest
 @see AWSCognitoIdentityProviderAdminSetUserMFAPreferenceResponse
 */
- (void)adminSetUserMFAPreference:(AWSCognitoIdentityProviderAdminSetUserMFAPreferenceRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderAdminSetUserMFAPreferenceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Sets the specified user's password in a user pool as an administrator. Works on any user. </p><p>The password can be temporary or permanent. If it is temporary, the user status enters the <code>FORCE_CHANGE_PASSWORD</code> state. When the user next tries to sign in, the InitiateAuth/AdminInitiateAuth response will contain the <code>NEW_PASSWORD_REQUIRED</code> challenge. If the user doesn't sign in before it expires, the user won't be able to sign in, and an administrator must reset their password. </p><p>Once the user has set a new password, or the password is permanent, the user status is set to <code>Confirmed</code>.</p>
 
 @param request A container for the necessary parameters to execute the AdminSetUserPassword service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderAdminSetUserPasswordResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorInternalError`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorInvalidPassword`.
 
 @see AWSCognitoIdentityProviderAdminSetUserPasswordRequest
 @see AWSCognitoIdentityProviderAdminSetUserPasswordResponse
 */
- (AWSTask<AWSCognitoIdentityProviderAdminSetUserPasswordResponse *> *)adminSetUserPassword:(AWSCognitoIdentityProviderAdminSetUserPasswordRequest *)request;

/**
 <p>Sets the specified user's password in a user pool as an administrator. Works on any user. </p><p>The password can be temporary or permanent. If it is temporary, the user status enters the <code>FORCE_CHANGE_PASSWORD</code> state. When the user next tries to sign in, the InitiateAuth/AdminInitiateAuth response will contain the <code>NEW_PASSWORD_REQUIRED</code> challenge. If the user doesn't sign in before it expires, the user won't be able to sign in, and an administrator must reset their password. </p><p>Once the user has set a new password, or the password is permanent, the user status is set to <code>Confirmed</code>.</p>
 
 @param request A container for the necessary parameters to execute the AdminSetUserPassword service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorInternalError`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorInvalidPassword`.
 
 @see AWSCognitoIdentityProviderAdminSetUserPasswordRequest
 @see AWSCognitoIdentityProviderAdminSetUserPasswordResponse
 */
- (void)adminSetUserPassword:(AWSCognitoIdentityProviderAdminSetUserPasswordRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderAdminSetUserPasswordResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p><i>This action is no longer supported.</i> You can use it to configure only SMS MFA. You can't use it to configure time-based one-time password (TOTP) software token MFA. To configure either type of MFA, use <a href="https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_AdminSetUserMFAPreference.html">AdminSetUserMFAPreference</a> instead.</p>
 
 @param request A container for the necessary parameters to execute the AdminSetUserSettings service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderAdminSetUserSettingsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderAdminSetUserSettingsRequest
 @see AWSCognitoIdentityProviderAdminSetUserSettingsResponse
 */
- (AWSTask<AWSCognitoIdentityProviderAdminSetUserSettingsResponse *> *)adminSetUserSettings:(AWSCognitoIdentityProviderAdminSetUserSettingsRequest *)request;

/**
 <p><i>This action is no longer supported.</i> You can use it to configure only SMS MFA. You can't use it to configure time-based one-time password (TOTP) software token MFA. To configure either type of MFA, use <a href="https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_AdminSetUserMFAPreference.html">AdminSetUserMFAPreference</a> instead.</p>
 
 @param request A container for the necessary parameters to execute the AdminSetUserSettings service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderAdminSetUserSettingsRequest
 @see AWSCognitoIdentityProviderAdminSetUserSettingsResponse
 */
- (void)adminSetUserSettings:(AWSCognitoIdentityProviderAdminSetUserSettingsRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderAdminSetUserSettingsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Provides feedback for an authentication event indicating if it was from a valid user. This feedback is used for improving the risk evaluation decision for the user pool as part of Amazon Cognito advanced security.</p>
 
 @param request A container for the necessary parameters to execute the AdminUpdateAuthEventFeedback service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderAdminUpdateAuthEventFeedbackResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorUserPoolAddOnNotEnabled`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderAdminUpdateAuthEventFeedbackRequest
 @see AWSCognitoIdentityProviderAdminUpdateAuthEventFeedbackResponse
 */
- (AWSTask<AWSCognitoIdentityProviderAdminUpdateAuthEventFeedbackResponse *> *)adminUpdateAuthEventFeedback:(AWSCognitoIdentityProviderAdminUpdateAuthEventFeedbackRequest *)request;

/**
 <p>Provides feedback for an authentication event indicating if it was from a valid user. This feedback is used for improving the risk evaluation decision for the user pool as part of Amazon Cognito advanced security.</p>
 
 @param request A container for the necessary parameters to execute the AdminUpdateAuthEventFeedback service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorUserPoolAddOnNotEnabled`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderAdminUpdateAuthEventFeedbackRequest
 @see AWSCognitoIdentityProviderAdminUpdateAuthEventFeedbackResponse
 */
- (void)adminUpdateAuthEventFeedback:(AWSCognitoIdentityProviderAdminUpdateAuthEventFeedbackRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderAdminUpdateAuthEventFeedbackResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the device status as an administrator.</p><p>Calling this action requires developer credentials.</p>
 
 @param request A container for the necessary parameters to execute the AdminUpdateDeviceStatus service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderAdminUpdateDeviceStatusResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidUserPoolConfiguration`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderAdminUpdateDeviceStatusRequest
 @see AWSCognitoIdentityProviderAdminUpdateDeviceStatusResponse
 */
- (AWSTask<AWSCognitoIdentityProviderAdminUpdateDeviceStatusResponse *> *)adminUpdateDeviceStatus:(AWSCognitoIdentityProviderAdminUpdateDeviceStatusRequest *)request;

/**
 <p>Updates the device status as an administrator.</p><p>Calling this action requires developer credentials.</p>
 
 @param request A container for the necessary parameters to execute the AdminUpdateDeviceStatus service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidUserPoolConfiguration`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderAdminUpdateDeviceStatusRequest
 @see AWSCognitoIdentityProviderAdminUpdateDeviceStatusResponse
 */
- (void)adminUpdateDeviceStatus:(AWSCognitoIdentityProviderAdminUpdateDeviceStatusRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderAdminUpdateDeviceStatusResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the specified user's attributes, including developer attributes, as an administrator. Works on any user.</p><p>For custom attributes, you must prepend the <code>custom:</code> prefix to the attribute name.</p><p>In addition to updating user attributes, this API can also be used to mark phone and email as verified.</p><note><p>This action might generate an SMS text message. Starting June 1, 2021, US telecom carriers require you to register an origination phone number before you can send SMS messages to US phone numbers. If you use SMS text messages in Amazon Cognito, you must register a phone number with <a href="https://console.aws.amazon.com/pinpoint/home/">Amazon Pinpoint</a>. Amazon Cognito uses the registered number automatically. Otherwise, Amazon Cognito users who must receive SMS messages might not be able to sign up, activate their accounts, or sign in.</p><p>If you have never used SMS text messages with Amazon Cognito or any other Amazon Web Service, Amazon Simple Notification Service might place your account in the SMS sandbox. In <i><a href="https://docs.aws.amazon.com/sns/latest/dg/sns-sms-sandbox.html">sandbox mode</a></i>, you can send messages only to verified phone numbers. After you test your app while in the sandbox environment, you can move out of the sandbox and into production. For more information, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-identity-pools-sms-userpool-settings.html"> SMS message settings for Amazon Cognito user pools</a> in the <i>Amazon Cognito Developer Guide</i>.</p></note><p>Calling this action requires developer credentials.</p>
 
 @param request A container for the necessary parameters to execute the AdminUpdateUserAttributes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderAdminUpdateUserAttributesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorUnexpectedLambda`, `AWSCognitoIdentityProviderErrorUserLambdaValidation`, `AWSCognitoIdentityProviderErrorInvalidLambdaResponse`, `AWSCognitoIdentityProviderErrorAliasExists`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorInternalError`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleAccessPolicy`, `AWSCognitoIdentityProviderErrorInvalidEmailRoleAccessPolicy`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleTrustRelationship`.
 
 @see AWSCognitoIdentityProviderAdminUpdateUserAttributesRequest
 @see AWSCognitoIdentityProviderAdminUpdateUserAttributesResponse
 */
- (AWSTask<AWSCognitoIdentityProviderAdminUpdateUserAttributesResponse *> *)adminUpdateUserAttributes:(AWSCognitoIdentityProviderAdminUpdateUserAttributesRequest *)request;

/**
 <p>Updates the specified user's attributes, including developer attributes, as an administrator. Works on any user.</p><p>For custom attributes, you must prepend the <code>custom:</code> prefix to the attribute name.</p><p>In addition to updating user attributes, this API can also be used to mark phone and email as verified.</p><note><p>This action might generate an SMS text message. Starting June 1, 2021, US telecom carriers require you to register an origination phone number before you can send SMS messages to US phone numbers. If you use SMS text messages in Amazon Cognito, you must register a phone number with <a href="https://console.aws.amazon.com/pinpoint/home/">Amazon Pinpoint</a>. Amazon Cognito uses the registered number automatically. Otherwise, Amazon Cognito users who must receive SMS messages might not be able to sign up, activate their accounts, or sign in.</p><p>If you have never used SMS text messages with Amazon Cognito or any other Amazon Web Service, Amazon Simple Notification Service might place your account in the SMS sandbox. In <i><a href="https://docs.aws.amazon.com/sns/latest/dg/sns-sms-sandbox.html">sandbox mode</a></i>, you can send messages only to verified phone numbers. After you test your app while in the sandbox environment, you can move out of the sandbox and into production. For more information, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-identity-pools-sms-userpool-settings.html"> SMS message settings for Amazon Cognito user pools</a> in the <i>Amazon Cognito Developer Guide</i>.</p></note><p>Calling this action requires developer credentials.</p>
 
 @param request A container for the necessary parameters to execute the AdminUpdateUserAttributes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorUnexpectedLambda`, `AWSCognitoIdentityProviderErrorUserLambdaValidation`, `AWSCognitoIdentityProviderErrorInvalidLambdaResponse`, `AWSCognitoIdentityProviderErrorAliasExists`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorInternalError`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleAccessPolicy`, `AWSCognitoIdentityProviderErrorInvalidEmailRoleAccessPolicy`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleTrustRelationship`.
 
 @see AWSCognitoIdentityProviderAdminUpdateUserAttributesRequest
 @see AWSCognitoIdentityProviderAdminUpdateUserAttributesResponse
 */
- (void)adminUpdateUserAttributes:(AWSCognitoIdentityProviderAdminUpdateUserAttributesRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderAdminUpdateUserAttributesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Signs out users from all devices, as an administrator. It also invalidates all refresh tokens issued to a user. The user's current access and Id tokens remain valid until their expiry. Access and Id tokens expire one hour after they're issued.</p><p>Calling this action requires developer credentials.</p>
 
 @param request A container for the necessary parameters to execute the AdminUserGlobalSignOut service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderAdminUserGlobalSignOutResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderAdminUserGlobalSignOutRequest
 @see AWSCognitoIdentityProviderAdminUserGlobalSignOutResponse
 */
- (AWSTask<AWSCognitoIdentityProviderAdminUserGlobalSignOutResponse *> *)adminUserGlobalSignOut:(AWSCognitoIdentityProviderAdminUserGlobalSignOutRequest *)request;

/**
 <p>Signs out users from all devices, as an administrator. It also invalidates all refresh tokens issued to a user. The user's current access and Id tokens remain valid until their expiry. Access and Id tokens expire one hour after they're issued.</p><p>Calling this action requires developer credentials.</p>
 
 @param request A container for the necessary parameters to execute the AdminUserGlobalSignOut service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderAdminUserGlobalSignOutRequest
 @see AWSCognitoIdentityProviderAdminUserGlobalSignOutResponse
 */
- (void)adminUserGlobalSignOut:(AWSCognitoIdentityProviderAdminUserGlobalSignOutRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderAdminUserGlobalSignOutResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a unique generated shared secret key code for the user account. The request takes an access token or a session string, but not both.</p><note><p>Calling AssociateSoftwareToken immediately disassociates the existing software token from the user account. If the user doesn't subsequently verify the software token, their account is set up to authenticate without MFA. If MFA config is set to Optional at the user pool level, the user can then log in without MFA. However, if MFA is set to Required for the user pool, the user is asked to set up a new software token MFA during sign-in.</p></note>
 
 @param request A container for the necessary parameters to execute the AssociateSoftwareToken service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderAssociateSoftwareTokenResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorConcurrentModification`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInternalError`, `AWSCognitoIdentityProviderErrorSoftwareTokenMFANotFound`.
 
 @see AWSCognitoIdentityProviderAssociateSoftwareTokenRequest
 @see AWSCognitoIdentityProviderAssociateSoftwareTokenResponse
 */
- (AWSTask<AWSCognitoIdentityProviderAssociateSoftwareTokenResponse *> *)associateSoftwareToken:(AWSCognitoIdentityProviderAssociateSoftwareTokenRequest *)request;

/**
 <p>Returns a unique generated shared secret key code for the user account. The request takes an access token or a session string, but not both.</p><note><p>Calling AssociateSoftwareToken immediately disassociates the existing software token from the user account. If the user doesn't subsequently verify the software token, their account is set up to authenticate without MFA. If MFA config is set to Optional at the user pool level, the user can then log in without MFA. However, if MFA is set to Required for the user pool, the user is asked to set up a new software token MFA during sign-in.</p></note>
 
 @param request A container for the necessary parameters to execute the AssociateSoftwareToken service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorConcurrentModification`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInternalError`, `AWSCognitoIdentityProviderErrorSoftwareTokenMFANotFound`.
 
 @see AWSCognitoIdentityProviderAssociateSoftwareTokenRequest
 @see AWSCognitoIdentityProviderAssociateSoftwareTokenResponse
 */
- (void)associateSoftwareToken:(AWSCognitoIdentityProviderAssociateSoftwareTokenRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderAssociateSoftwareTokenResponse * _Nullable response, NSError * _Nullable error))completionHandler;

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
 <p>Confirms tracking of the device. This API call is the call that begins device tracking.</p>
 
 @param request A container for the necessary parameters to execute the ConfirmDevice service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderConfirmDeviceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorInvalidPassword`, `AWSCognitoIdentityProviderErrorInvalidLambdaResponse`, `AWSCognitoIdentityProviderErrorUsernameExists`, `AWSCognitoIdentityProviderErrorInvalidUserPoolConfiguration`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorPasswordResetRequired`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorUserNotConfirmed`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderConfirmDeviceRequest
 @see AWSCognitoIdentityProviderConfirmDeviceResponse
 */
- (AWSTask<AWSCognitoIdentityProviderConfirmDeviceResponse *> *)confirmDevice:(AWSCognitoIdentityProviderConfirmDeviceRequest *)request;

/**
 <p>Confirms tracking of the device. This API call is the call that begins device tracking.</p>
 
 @param request A container for the necessary parameters to execute the ConfirmDevice service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorInvalidPassword`, `AWSCognitoIdentityProviderErrorInvalidLambdaResponse`, `AWSCognitoIdentityProviderErrorUsernameExists`, `AWSCognitoIdentityProviderErrorInvalidUserPoolConfiguration`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorPasswordResetRequired`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorUserNotConfirmed`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderConfirmDeviceRequest
 @see AWSCognitoIdentityProviderConfirmDeviceResponse
 */
- (void)confirmDevice:(AWSCognitoIdentityProviderConfirmDeviceRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderConfirmDeviceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Allows a user to enter a confirmation code to reset a forgotten password.</p>
 
 @param request A container for the necessary parameters to execute the ConfirmForgotPassword service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderConfirmForgotPasswordResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorUnexpectedLambda`, `AWSCognitoIdentityProviderErrorUserLambdaValidation`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorInvalidPassword`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorCodeMismatch`, `AWSCognitoIdentityProviderErrorExpiredCode`, `AWSCognitoIdentityProviderErrorTooManyFailedAttempts`, `AWSCognitoIdentityProviderErrorInvalidLambdaResponse`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorLimitExceeded`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorUserNotConfirmed`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderConfirmForgotPasswordRequest
 @see AWSCognitoIdentityProviderConfirmForgotPasswordResponse
 */
- (AWSTask<AWSCognitoIdentityProviderConfirmForgotPasswordResponse *> *)confirmForgotPassword:(AWSCognitoIdentityProviderConfirmForgotPasswordRequest *)request;

/**
 <p>Allows a user to enter a confirmation code to reset a forgotten password.</p>
 
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
 <p>Creates a new group in the specified user pool.</p><p>Calling this action requires developer credentials.</p>
 
 @param request A container for the necessary parameters to execute the CreateGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderCreateGroupResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorGroupExists`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorLimitExceeded`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderCreateGroupRequest
 @see AWSCognitoIdentityProviderCreateGroupResponse
 */
- (AWSTask<AWSCognitoIdentityProviderCreateGroupResponse *> *)createGroup:(AWSCognitoIdentityProviderCreateGroupRequest *)request;

/**
 <p>Creates a new group in the specified user pool.</p><p>Calling this action requires developer credentials.</p>
 
 @param request A container for the necessary parameters to execute the CreateGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorGroupExists`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorLimitExceeded`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderCreateGroupRequest
 @see AWSCognitoIdentityProviderCreateGroupResponse
 */
- (void)createGroup:(AWSCognitoIdentityProviderCreateGroupRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderCreateGroupResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates an identity provider for a user pool.</p>
 
 @param request A container for the necessary parameters to execute the CreateIdentityProvider service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderCreateIdentityProviderResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorDuplicateProvider`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorLimitExceeded`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderCreateIdentityProviderRequest
 @see AWSCognitoIdentityProviderCreateIdentityProviderResponse
 */
- (AWSTask<AWSCognitoIdentityProviderCreateIdentityProviderResponse *> *)createIdentityProvider:(AWSCognitoIdentityProviderCreateIdentityProviderRequest *)request;

/**
 <p>Creates an identity provider for a user pool.</p>
 
 @param request A container for the necessary parameters to execute the CreateIdentityProvider service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorDuplicateProvider`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorLimitExceeded`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderCreateIdentityProviderRequest
 @see AWSCognitoIdentityProviderCreateIdentityProviderResponse
 */
- (void)createIdentityProvider:(AWSCognitoIdentityProviderCreateIdentityProviderRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderCreateIdentityProviderResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new OAuth2.0 resource server and defines custom scopes within it.</p>
 
 @param request A container for the necessary parameters to execute the CreateResourceServer service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderCreateResourceServerResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorLimitExceeded`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderCreateResourceServerRequest
 @see AWSCognitoIdentityProviderCreateResourceServerResponse
 */
- (AWSTask<AWSCognitoIdentityProviderCreateResourceServerResponse *> *)createResourceServer:(AWSCognitoIdentityProviderCreateResourceServerRequest *)request;

/**
 <p>Creates a new OAuth2.0 resource server and defines custom scopes within it.</p>
 
 @param request A container for the necessary parameters to execute the CreateResourceServer service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorLimitExceeded`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderCreateResourceServerRequest
 @see AWSCognitoIdentityProviderCreateResourceServerResponse
 */
- (void)createResourceServer:(AWSCognitoIdentityProviderCreateResourceServerRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderCreateResourceServerResponse * _Nullable response, NSError * _Nullable error))completionHandler;

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
 <p>Creates a new Amazon Cognito user pool and sets the password policy for the pool.</p><note><p>This action might generate an SMS text message. Starting June 1, 2021, US telecom carriers require you to register an origination phone number before you can send SMS messages to US phone numbers. If you use SMS text messages in Amazon Cognito, you must register a phone number with <a href="https://console.aws.amazon.com/pinpoint/home/">Amazon Pinpoint</a>. Amazon Cognito uses the registered number automatically. Otherwise, Amazon Cognito users who must receive SMS messages might not be able to sign up, activate their accounts, or sign in.</p><p>If you have never used SMS text messages with Amazon Cognito or any other Amazon Web Service, Amazon Simple Notification Service might place your account in the SMS sandbox. In <i><a href="https://docs.aws.amazon.com/sns/latest/dg/sns-sms-sandbox.html">sandbox mode</a></i>, you can send messages only to verified phone numbers. After you test your app while in the sandbox environment, you can move out of the sandbox and into production. For more information, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-identity-pools-sms-userpool-settings.html"> SMS message settings for Amazon Cognito user pools</a> in the <i>Amazon Cognito Developer Guide</i>.</p></note>
 
 @param request A container for the necessary parameters to execute the CreateUserPool service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderCreateUserPoolResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorLimitExceeded`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleAccessPolicy`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleTrustRelationship`, `AWSCognitoIdentityProviderErrorInvalidEmailRoleAccessPolicy`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUserPoolTagging`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderCreateUserPoolRequest
 @see AWSCognitoIdentityProviderCreateUserPoolResponse
 */
- (AWSTask<AWSCognitoIdentityProviderCreateUserPoolResponse *> *)createUserPool:(AWSCognitoIdentityProviderCreateUserPoolRequest *)request;

/**
 <p>Creates a new Amazon Cognito user pool and sets the password policy for the pool.</p><note><p>This action might generate an SMS text message. Starting June 1, 2021, US telecom carriers require you to register an origination phone number before you can send SMS messages to US phone numbers. If you use SMS text messages in Amazon Cognito, you must register a phone number with <a href="https://console.aws.amazon.com/pinpoint/home/">Amazon Pinpoint</a>. Amazon Cognito uses the registered number automatically. Otherwise, Amazon Cognito users who must receive SMS messages might not be able to sign up, activate their accounts, or sign in.</p><p>If you have never used SMS text messages with Amazon Cognito or any other Amazon Web Service, Amazon Simple Notification Service might place your account in the SMS sandbox. In <i><a href="https://docs.aws.amazon.com/sns/latest/dg/sns-sms-sandbox.html">sandbox mode</a></i>, you can send messages only to verified phone numbers. After you test your app while in the sandbox environment, you can move out of the sandbox and into production. For more information, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-identity-pools-sms-userpool-settings.html"> SMS message settings for Amazon Cognito user pools</a> in the <i>Amazon Cognito Developer Guide</i>.</p></note>
 
 @param request A container for the necessary parameters to execute the CreateUserPool service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorLimitExceeded`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleAccessPolicy`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleTrustRelationship`, `AWSCognitoIdentityProviderErrorInvalidEmailRoleAccessPolicy`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUserPoolTagging`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderCreateUserPoolRequest
 @see AWSCognitoIdentityProviderCreateUserPoolResponse
 */
- (void)createUserPool:(AWSCognitoIdentityProviderCreateUserPoolRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderCreateUserPoolResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates the user pool client.</p><p>When you create a new user pool client, token revocation is automatically activated. For more information about revoking tokens, see <a href="https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_RevokeToken.html">RevokeToken</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateUserPoolClient service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderCreateUserPoolClientResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorLimitExceeded`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorScopeDoesNotExist`, `AWSCognitoIdentityProviderErrorInvalidOAuthFlow`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderCreateUserPoolClientRequest
 @see AWSCognitoIdentityProviderCreateUserPoolClientResponse
 */
- (AWSTask<AWSCognitoIdentityProviderCreateUserPoolClientResponse *> *)createUserPoolClient:(AWSCognitoIdentityProviderCreateUserPoolClientRequest *)request;

/**
 <p>Creates the user pool client.</p><p>When you create a new user pool client, token revocation is automatically activated. For more information about revoking tokens, see <a href="https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_RevokeToken.html">RevokeToken</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateUserPoolClient service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorLimitExceeded`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorScopeDoesNotExist`, `AWSCognitoIdentityProviderErrorInvalidOAuthFlow`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderCreateUserPoolClientRequest
 @see AWSCognitoIdentityProviderCreateUserPoolClientResponse
 */
- (void)createUserPoolClient:(AWSCognitoIdentityProviderCreateUserPoolClientRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderCreateUserPoolClientResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new domain for a user pool.</p>
 
 @param request A container for the necessary parameters to execute the CreateUserPoolDomain service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderCreateUserPoolDomainResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorLimitExceeded`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderCreateUserPoolDomainRequest
 @see AWSCognitoIdentityProviderCreateUserPoolDomainResponse
 */
- (AWSTask<AWSCognitoIdentityProviderCreateUserPoolDomainResponse *> *)createUserPoolDomain:(AWSCognitoIdentityProviderCreateUserPoolDomainRequest *)request;

/**
 <p>Creates a new domain for a user pool.</p>
 
 @param request A container for the necessary parameters to execute the CreateUserPoolDomain service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorLimitExceeded`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderCreateUserPoolDomainRequest
 @see AWSCognitoIdentityProviderCreateUserPoolDomainResponse
 */
- (void)createUserPoolDomain:(AWSCognitoIdentityProviderCreateUserPoolDomainRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderCreateUserPoolDomainResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a group.</p><p>Calling this action requires developer credentials.</p>
 
 @param request A container for the necessary parameters to execute the DeleteGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderDeleteGroupRequest
 */
- (AWSTask *)deleteGroup:(AWSCognitoIdentityProviderDeleteGroupRequest *)request;

/**
 <p>Deletes a group.</p><p>Calling this action requires developer credentials.</p>
 
 @param request A container for the necessary parameters to execute the DeleteGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderDeleteGroupRequest
 */
- (void)deleteGroup:(AWSCognitoIdentityProviderDeleteGroupRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes an identity provider for a user pool.</p>
 
 @param request A container for the necessary parameters to execute the DeleteIdentityProvider service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorUnsupportedIdentityProvider`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderDeleteIdentityProviderRequest
 */
- (AWSTask *)deleteIdentityProvider:(AWSCognitoIdentityProviderDeleteIdentityProviderRequest *)request;

/**
 <p>Deletes an identity provider for a user pool.</p>
 
 @param request A container for the necessary parameters to execute the DeleteIdentityProvider service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorUnsupportedIdentityProvider`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderDeleteIdentityProviderRequest
 */
- (void)deleteIdentityProvider:(AWSCognitoIdentityProviderDeleteIdentityProviderRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a resource server.</p>
 
 @param request A container for the necessary parameters to execute the DeleteResourceServer service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderDeleteResourceServerRequest
 */
- (AWSTask *)deleteResourceServer:(AWSCognitoIdentityProviderDeleteResourceServerRequest *)request;

/**
 <p>Deletes a resource server.</p>
 
 @param request A container for the necessary parameters to execute the DeleteResourceServer service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderDeleteResourceServerRequest
 */
- (void)deleteResourceServer:(AWSCognitoIdentityProviderDeleteResourceServerRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Allows a user to delete himself or herself.</p>
 
 @param request A container for the necessary parameters to execute the DeleteUser service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorPasswordResetRequired`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorUserNotConfirmed`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderDeleteUserRequest
 */
- (AWSTask *)deleteUser:(AWSCognitoIdentityProviderDeleteUserRequest *)request;

/**
 <p>Allows a user to delete himself or herself.</p>
 
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
 <p>Deletes a domain for a user pool.</p>
 
 @param request A container for the necessary parameters to execute the DeleteUserPoolDomain service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderDeleteUserPoolDomainResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderDeleteUserPoolDomainRequest
 @see AWSCognitoIdentityProviderDeleteUserPoolDomainResponse
 */
- (AWSTask<AWSCognitoIdentityProviderDeleteUserPoolDomainResponse *> *)deleteUserPoolDomain:(AWSCognitoIdentityProviderDeleteUserPoolDomainRequest *)request;

/**
 <p>Deletes a domain for a user pool.</p>
 
 @param request A container for the necessary parameters to execute the DeleteUserPoolDomain service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderDeleteUserPoolDomainRequest
 @see AWSCognitoIdentityProviderDeleteUserPoolDomainResponse
 */
- (void)deleteUserPoolDomain:(AWSCognitoIdentityProviderDeleteUserPoolDomainRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderDeleteUserPoolDomainResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets information about a specific identity provider.</p>
 
 @param request A container for the necessary parameters to execute the DescribeIdentityProvider service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderDescribeIdentityProviderResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderDescribeIdentityProviderRequest
 @see AWSCognitoIdentityProviderDescribeIdentityProviderResponse
 */
- (AWSTask<AWSCognitoIdentityProviderDescribeIdentityProviderResponse *> *)describeIdentityProvider:(AWSCognitoIdentityProviderDescribeIdentityProviderRequest *)request;

/**
 <p>Gets information about a specific identity provider.</p>
 
 @param request A container for the necessary parameters to execute the DescribeIdentityProvider service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderDescribeIdentityProviderRequest
 @see AWSCognitoIdentityProviderDescribeIdentityProviderResponse
 */
- (void)describeIdentityProvider:(AWSCognitoIdentityProviderDescribeIdentityProviderRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderDescribeIdentityProviderResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes a resource server.</p>
 
 @param request A container for the necessary parameters to execute the DescribeResourceServer service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderDescribeResourceServerResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderDescribeResourceServerRequest
 @see AWSCognitoIdentityProviderDescribeResourceServerResponse
 */
- (AWSTask<AWSCognitoIdentityProviderDescribeResourceServerResponse *> *)describeResourceServer:(AWSCognitoIdentityProviderDescribeResourceServerRequest *)request;

/**
 <p>Describes a resource server.</p>
 
 @param request A container for the necessary parameters to execute the DescribeResourceServer service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderDescribeResourceServerRequest
 @see AWSCognitoIdentityProviderDescribeResourceServerResponse
 */
- (void)describeResourceServer:(AWSCognitoIdentityProviderDescribeResourceServerRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderDescribeResourceServerResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the risk configuration.</p>
 
 @param request A container for the necessary parameters to execute the DescribeRiskConfiguration service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderDescribeRiskConfigurationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUserPoolAddOnNotEnabled`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderDescribeRiskConfigurationRequest
 @see AWSCognitoIdentityProviderDescribeRiskConfigurationResponse
 */
- (AWSTask<AWSCognitoIdentityProviderDescribeRiskConfigurationResponse *> *)describeRiskConfiguration:(AWSCognitoIdentityProviderDescribeRiskConfigurationRequest *)request;

/**
 <p>Describes the risk configuration.</p>
 
 @param request A container for the necessary parameters to execute the DescribeRiskConfiguration service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUserPoolAddOnNotEnabled`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderDescribeRiskConfigurationRequest
 @see AWSCognitoIdentityProviderDescribeRiskConfigurationResponse
 */
- (void)describeRiskConfiguration:(AWSCognitoIdentityProviderDescribeRiskConfigurationRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderDescribeRiskConfigurationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

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

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderDescribeUserPoolResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUserPoolTagging`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderDescribeUserPoolRequest
 @see AWSCognitoIdentityProviderDescribeUserPoolResponse
 */
- (AWSTask<AWSCognitoIdentityProviderDescribeUserPoolResponse *> *)describeUserPool:(AWSCognitoIdentityProviderDescribeUserPoolRequest *)request;

/**
 <p>Returns the configuration information and metadata of the specified user pool.</p>
 
 @param request A container for the necessary parameters to execute the DescribeUserPool service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUserPoolTagging`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderDescribeUserPoolRequest
 @see AWSCognitoIdentityProviderDescribeUserPoolResponse
 */
- (void)describeUserPool:(AWSCognitoIdentityProviderDescribeUserPoolRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderDescribeUserPoolResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Client method for returning the configuration information and metadata of the specified user pool app client.</p>
 
 @param request A container for the necessary parameters to execute the DescribeUserPoolClient service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderDescribeUserPoolClientResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderDescribeUserPoolClientRequest
 @see AWSCognitoIdentityProviderDescribeUserPoolClientResponse
 */
- (AWSTask<AWSCognitoIdentityProviderDescribeUserPoolClientResponse *> *)describeUserPoolClient:(AWSCognitoIdentityProviderDescribeUserPoolClientRequest *)request;

/**
 <p>Client method for returning the configuration information and metadata of the specified user pool app client.</p>
 
 @param request A container for the necessary parameters to execute the DescribeUserPoolClient service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderDescribeUserPoolClientRequest
 @see AWSCognitoIdentityProviderDescribeUserPoolClientResponse
 */
- (void)describeUserPoolClient:(AWSCognitoIdentityProviderDescribeUserPoolClientRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderDescribeUserPoolClientResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets information about a domain.</p>
 
 @param request A container for the necessary parameters to execute the DescribeUserPoolDomain service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderDescribeUserPoolDomainResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderDescribeUserPoolDomainRequest
 @see AWSCognitoIdentityProviderDescribeUserPoolDomainResponse
 */
- (AWSTask<AWSCognitoIdentityProviderDescribeUserPoolDomainResponse *> *)describeUserPoolDomain:(AWSCognitoIdentityProviderDescribeUserPoolDomainRequest *)request;

/**
 <p>Gets information about a domain.</p>
 
 @param request A container for the necessary parameters to execute the DescribeUserPoolDomain service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderDescribeUserPoolDomainRequest
 @see AWSCognitoIdentityProviderDescribeUserPoolDomainResponse
 */
- (void)describeUserPoolDomain:(AWSCognitoIdentityProviderDescribeUserPoolDomainRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderDescribeUserPoolDomainResponse * _Nullable response, NSError * _Nullable error))completionHandler;

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
 <p>Calling this API causes a message to be sent to the end user with a confirmation code that is required to change the user's password. For the <code>Username</code> parameter, you can use the username or user alias. The method used to send the confirmation code is sent according to the specified AccountRecoverySetting. For more information, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/how-to-recover-a-user-account.html">Recovering User Accounts</a> in the <i>Amazon Cognito Developer Guide</i>. If neither a verified phone number nor a verified email exists, an <code>InvalidParameterException</code> is thrown. To use the confirmation code for resetting the password, call <a href="https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_ConfirmForgotPassword.html">ConfirmForgotPassword</a>. </p><note><p>This action might generate an SMS text message. Starting June 1, 2021, US telecom carriers require you to register an origination phone number before you can send SMS messages to US phone numbers. If you use SMS text messages in Amazon Cognito, you must register a phone number with <a href="https://console.aws.amazon.com/pinpoint/home/">Amazon Pinpoint</a>. Amazon Cognito uses the registered number automatically. Otherwise, Amazon Cognito users who must receive SMS messages might not be able to sign up, activate their accounts, or sign in.</p><p>If you have never used SMS text messages with Amazon Cognito or any other Amazon Web Service, Amazon Simple Notification Service might place your account in the SMS sandbox. In <i><a href="https://docs.aws.amazon.com/sns/latest/dg/sns-sms-sandbox.html">sandbox mode</a></i>, you can send messages only to verified phone numbers. After you test your app while in the sandbox environment, you can move out of the sandbox and into production. For more information, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-identity-pools-sms-userpool-settings.html"> SMS message settings for Amazon Cognito user pools</a> in the <i>Amazon Cognito Developer Guide</i>.</p></note>
 
 @param request A container for the necessary parameters to execute the ForgotPassword service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderForgotPasswordResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorUnexpectedLambda`, `AWSCognitoIdentityProviderErrorUserLambdaValidation`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorInvalidLambdaResponse`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorLimitExceeded`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleAccessPolicy`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleTrustRelationship`, `AWSCognitoIdentityProviderErrorInvalidEmailRoleAccessPolicy`, `AWSCognitoIdentityProviderErrorCodeDeliveryFailure`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderForgotPasswordRequest
 @see AWSCognitoIdentityProviderForgotPasswordResponse
 */
- (AWSTask<AWSCognitoIdentityProviderForgotPasswordResponse *> *)forgotPassword:(AWSCognitoIdentityProviderForgotPasswordRequest *)request;

/**
 <p>Calling this API causes a message to be sent to the end user with a confirmation code that is required to change the user's password. For the <code>Username</code> parameter, you can use the username or user alias. The method used to send the confirmation code is sent according to the specified AccountRecoverySetting. For more information, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/how-to-recover-a-user-account.html">Recovering User Accounts</a> in the <i>Amazon Cognito Developer Guide</i>. If neither a verified phone number nor a verified email exists, an <code>InvalidParameterException</code> is thrown. To use the confirmation code for resetting the password, call <a href="https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_ConfirmForgotPassword.html">ConfirmForgotPassword</a>. </p><note><p>This action might generate an SMS text message. Starting June 1, 2021, US telecom carriers require you to register an origination phone number before you can send SMS messages to US phone numbers. If you use SMS text messages in Amazon Cognito, you must register a phone number with <a href="https://console.aws.amazon.com/pinpoint/home/">Amazon Pinpoint</a>. Amazon Cognito uses the registered number automatically. Otherwise, Amazon Cognito users who must receive SMS messages might not be able to sign up, activate their accounts, or sign in.</p><p>If you have never used SMS text messages with Amazon Cognito or any other Amazon Web Service, Amazon Simple Notification Service might place your account in the SMS sandbox. In <i><a href="https://docs.aws.amazon.com/sns/latest/dg/sns-sms-sandbox.html">sandbox mode</a></i>, you can send messages only to verified phone numbers. After you test your app while in the sandbox environment, you can move out of the sandbox and into production. For more information, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-identity-pools-sms-userpool-settings.html"> SMS message settings for Amazon Cognito user pools</a> in the <i>Amazon Cognito Developer Guide</i>.</p></note>
 
 @param request A container for the necessary parameters to execute the ForgotPassword service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorUnexpectedLambda`, `AWSCognitoIdentityProviderErrorUserLambdaValidation`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorInvalidLambdaResponse`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorLimitExceeded`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleAccessPolicy`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleTrustRelationship`, `AWSCognitoIdentityProviderErrorInvalidEmailRoleAccessPolicy`, `AWSCognitoIdentityProviderErrorCodeDeliveryFailure`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderForgotPasswordRequest
 @see AWSCognitoIdentityProviderForgotPasswordResponse
 */
- (void)forgotPassword:(AWSCognitoIdentityProviderForgotPasswordRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderForgotPasswordResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets the header information for the comma-separated value (CSV) file to be used as input for the user import job.</p>
 
 @param request A container for the necessary parameters to execute the GetCSVHeader service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderGetCSVHeaderResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderGetCSVHeaderRequest
 @see AWSCognitoIdentityProviderGetCSVHeaderResponse
 */
- (AWSTask<AWSCognitoIdentityProviderGetCSVHeaderResponse *> *)getCSVHeader:(AWSCognitoIdentityProviderGetCSVHeaderRequest *)request;

/**
 <p>Gets the header information for the comma-separated value (CSV) file to be used as input for the user import job.</p>
 
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
 <p>Gets a group.</p><p>Calling this action requires developer credentials.</p>
 
 @param request A container for the necessary parameters to execute the GetGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderGetGroupResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderGetGroupRequest
 @see AWSCognitoIdentityProviderGetGroupResponse
 */
- (AWSTask<AWSCognitoIdentityProviderGetGroupResponse *> *)getGroup:(AWSCognitoIdentityProviderGetGroupRequest *)request;

/**
 <p>Gets a group.</p><p>Calling this action requires developer credentials.</p>
 
 @param request A container for the necessary parameters to execute the GetGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderGetGroupRequest
 @see AWSCognitoIdentityProviderGetGroupResponse
 */
- (void)getGroup:(AWSCognitoIdentityProviderGetGroupRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderGetGroupResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets the specified identity provider.</p>
 
 @param request A container for the necessary parameters to execute the GetIdentityProviderByIdentifier service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderGetIdentityProviderByIdentifierResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderGetIdentityProviderByIdentifierRequest
 @see AWSCognitoIdentityProviderGetIdentityProviderByIdentifierResponse
 */
- (AWSTask<AWSCognitoIdentityProviderGetIdentityProviderByIdentifierResponse *> *)getIdentityProviderByIdentifier:(AWSCognitoIdentityProviderGetIdentityProviderByIdentifierRequest *)request;

/**
 <p>Gets the specified identity provider.</p>
 
 @param request A container for the necessary parameters to execute the GetIdentityProviderByIdentifier service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderGetIdentityProviderByIdentifierRequest
 @see AWSCognitoIdentityProviderGetIdentityProviderByIdentifierResponse
 */
- (void)getIdentityProviderByIdentifier:(AWSCognitoIdentityProviderGetIdentityProviderByIdentifierRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderGetIdentityProviderByIdentifierResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>This method takes a user pool ID, and returns the signing certificate.</p>
 
 @param request A container for the necessary parameters to execute the GetSigningCertificate service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderGetSigningCertificateResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInternalError`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorResourceNotFound`.
 
 @see AWSCognitoIdentityProviderGetSigningCertificateRequest
 @see AWSCognitoIdentityProviderGetSigningCertificateResponse
 */
- (AWSTask<AWSCognitoIdentityProviderGetSigningCertificateResponse *> *)getSigningCertificate:(AWSCognitoIdentityProviderGetSigningCertificateRequest *)request;

/**
 <p>This method takes a user pool ID, and returns the signing certificate.</p>
 
 @param request A container for the necessary parameters to execute the GetSigningCertificate service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInternalError`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorResourceNotFound`.
 
 @see AWSCognitoIdentityProviderGetSigningCertificateRequest
 @see AWSCognitoIdentityProviderGetSigningCertificateResponse
 */
- (void)getSigningCertificate:(AWSCognitoIdentityProviderGetSigningCertificateRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderGetSigningCertificateResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets the user interface (UI) Customization information for a particular app client's app UI, if any such information exists for the client. If nothing is set for the particular client, but there is an existing pool level customization (the app <code>clientId</code> is <code>ALL</code>), then that information is returned. If nothing is present, then an empty shape is returned.</p>
 
 @param request A container for the necessary parameters to execute the GetUICustomization service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderGetUICustomizationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderGetUICustomizationRequest
 @see AWSCognitoIdentityProviderGetUICustomizationResponse
 */
- (AWSTask<AWSCognitoIdentityProviderGetUICustomizationResponse *> *)getUICustomization:(AWSCognitoIdentityProviderGetUICustomizationRequest *)request;

/**
 <p>Gets the user interface (UI) Customization information for a particular app client's app UI, if any such information exists for the client. If nothing is set for the particular client, but there is an existing pool level customization (the app <code>clientId</code> is <code>ALL</code>), then that information is returned. If nothing is present, then an empty shape is returned.</p>
 
 @param request A container for the necessary parameters to execute the GetUICustomization service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderGetUICustomizationRequest
 @see AWSCognitoIdentityProviderGetUICustomizationResponse
 */
- (void)getUICustomization:(AWSCognitoIdentityProviderGetUICustomizationRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderGetUICustomizationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

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
 <p>Gets the user attribute verification code for the specified attribute name.</p><note><p>This action might generate an SMS text message. Starting June 1, 2021, US telecom carriers require you to register an origination phone number before you can send SMS messages to US phone numbers. If you use SMS text messages in Amazon Cognito, you must register a phone number with <a href="https://console.aws.amazon.com/pinpoint/home/">Amazon Pinpoint</a>. Amazon Cognito uses the registered number automatically. Otherwise, Amazon Cognito users who must receive SMS messages might not be able to sign up, activate their accounts, or sign in.</p><p>If you have never used SMS text messages with Amazon Cognito or any other Amazon Web Service, Amazon Simple Notification Service might place your account in the SMS sandbox. In <i><a href="https://docs.aws.amazon.com/sns/latest/dg/sns-sms-sandbox.html">sandbox mode</a></i>, you can send messages only to verified phone numbers. After you test your app while in the sandbox environment, you can move out of the sandbox and into production. For more information, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-identity-pools-sms-userpool-settings.html"> SMS message settings for Amazon Cognito user pools</a> in the <i>Amazon Cognito Developer Guide</i>.</p></note>
 
 @param request A container for the necessary parameters to execute the GetUserAttributeVerificationCode service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderGetUserAttributeVerificationCodeResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUnexpectedLambda`, `AWSCognitoIdentityProviderErrorUserLambdaValidation`, `AWSCognitoIdentityProviderErrorInvalidLambdaResponse`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleAccessPolicy`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleTrustRelationship`, `AWSCognitoIdentityProviderErrorInvalidEmailRoleAccessPolicy`, `AWSCognitoIdentityProviderErrorCodeDeliveryFailure`, `AWSCognitoIdentityProviderErrorLimitExceeded`, `AWSCognitoIdentityProviderErrorPasswordResetRequired`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorUserNotConfirmed`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderGetUserAttributeVerificationCodeRequest
 @see AWSCognitoIdentityProviderGetUserAttributeVerificationCodeResponse
 */
- (AWSTask<AWSCognitoIdentityProviderGetUserAttributeVerificationCodeResponse *> *)getUserAttributeVerificationCode:(AWSCognitoIdentityProviderGetUserAttributeVerificationCodeRequest *)request;

/**
 <p>Gets the user attribute verification code for the specified attribute name.</p><note><p>This action might generate an SMS text message. Starting June 1, 2021, US telecom carriers require you to register an origination phone number before you can send SMS messages to US phone numbers. If you use SMS text messages in Amazon Cognito, you must register a phone number with <a href="https://console.aws.amazon.com/pinpoint/home/">Amazon Pinpoint</a>. Amazon Cognito uses the registered number automatically. Otherwise, Amazon Cognito users who must receive SMS messages might not be able to sign up, activate their accounts, or sign in.</p><p>If you have never used SMS text messages with Amazon Cognito or any other Amazon Web Service, Amazon Simple Notification Service might place your account in the SMS sandbox. In <i><a href="https://docs.aws.amazon.com/sns/latest/dg/sns-sms-sandbox.html">sandbox mode</a></i>, you can send messages only to verified phone numbers. After you test your app while in the sandbox environment, you can move out of the sandbox and into production. For more information, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-identity-pools-sms-userpool-settings.html"> SMS message settings for Amazon Cognito user pools</a> in the <i>Amazon Cognito Developer Guide</i>.</p></note>
 
 @param request A container for the necessary parameters to execute the GetUserAttributeVerificationCode service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUnexpectedLambda`, `AWSCognitoIdentityProviderErrorUserLambdaValidation`, `AWSCognitoIdentityProviderErrorInvalidLambdaResponse`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleAccessPolicy`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleTrustRelationship`, `AWSCognitoIdentityProviderErrorInvalidEmailRoleAccessPolicy`, `AWSCognitoIdentityProviderErrorCodeDeliveryFailure`, `AWSCognitoIdentityProviderErrorLimitExceeded`, `AWSCognitoIdentityProviderErrorPasswordResetRequired`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorUserNotConfirmed`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderGetUserAttributeVerificationCodeRequest
 @see AWSCognitoIdentityProviderGetUserAttributeVerificationCodeResponse
 */
- (void)getUserAttributeVerificationCode:(AWSCognitoIdentityProviderGetUserAttributeVerificationCodeRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderGetUserAttributeVerificationCodeResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets the user pool multi-factor authentication (MFA) configuration.</p>
 
 @param request A container for the necessary parameters to execute the GetUserPoolMfaConfig service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderGetUserPoolMfaConfigResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderGetUserPoolMfaConfigRequest
 @see AWSCognitoIdentityProviderGetUserPoolMfaConfigResponse
 */
- (AWSTask<AWSCognitoIdentityProviderGetUserPoolMfaConfigResponse *> *)getUserPoolMfaConfig:(AWSCognitoIdentityProviderGetUserPoolMfaConfigRequest *)request;

/**
 <p>Gets the user pool multi-factor authentication (MFA) configuration.</p>
 
 @param request A container for the necessary parameters to execute the GetUserPoolMfaConfig service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderGetUserPoolMfaConfigRequest
 @see AWSCognitoIdentityProviderGetUserPoolMfaConfigResponse
 */
- (void)getUserPoolMfaConfig:(AWSCognitoIdentityProviderGetUserPoolMfaConfigRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderGetUserPoolMfaConfigResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Signs out users from all devices. It also invalidates all refresh tokens issued to a user. The user's current access and ID tokens remain valid until their expiry. Access and Id tokens expire one hour after they're issued.</p>
 
 @param request A container for the necessary parameters to execute the GlobalSignOut service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderGlobalSignOutResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorPasswordResetRequired`, `AWSCognitoIdentityProviderErrorUserNotConfirmed`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderGlobalSignOutRequest
 @see AWSCognitoIdentityProviderGlobalSignOutResponse
 */
- (AWSTask<AWSCognitoIdentityProviderGlobalSignOutResponse *> *)globalSignOut:(AWSCognitoIdentityProviderGlobalSignOutRequest *)request;

/**
 <p>Signs out users from all devices. It also invalidates all refresh tokens issued to a user. The user's current access and ID tokens remain valid until their expiry. Access and Id tokens expire one hour after they're issued.</p>
 
 @param request A container for the necessary parameters to execute the GlobalSignOut service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorPasswordResetRequired`, `AWSCognitoIdentityProviderErrorUserNotConfirmed`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderGlobalSignOutRequest
 @see AWSCognitoIdentityProviderGlobalSignOutResponse
 */
- (void)globalSignOut:(AWSCognitoIdentityProviderGlobalSignOutRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderGlobalSignOutResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Initiates the authentication flow.</p><note><p>This action might generate an SMS text message. Starting June 1, 2021, US telecom carriers require you to register an origination phone number before you can send SMS messages to US phone numbers. If you use SMS text messages in Amazon Cognito, you must register a phone number with <a href="https://console.aws.amazon.com/pinpoint/home/">Amazon Pinpoint</a>. Amazon Cognito uses the registered number automatically. Otherwise, Amazon Cognito users who must receive SMS messages might not be able to sign up, activate their accounts, or sign in.</p><p>If you have never used SMS text messages with Amazon Cognito or any other Amazon Web Service, Amazon Simple Notification Service might place your account in the SMS sandbox. In <i><a href="https://docs.aws.amazon.com/sns/latest/dg/sns-sms-sandbox.html">sandbox mode</a></i>, you can send messages only to verified phone numbers. After you test your app while in the sandbox environment, you can move out of the sandbox and into production. For more information, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-identity-pools-sms-userpool-settings.html"> SMS message settings for Amazon Cognito user pools</a> in the <i>Amazon Cognito Developer Guide</i>.</p></note>
 
 @param request A container for the necessary parameters to execute the InitiateAuth service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderInitiateAuthResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorUnexpectedLambda`, `AWSCognitoIdentityProviderErrorInvalidUserPoolConfiguration`, `AWSCognitoIdentityProviderErrorUserLambdaValidation`, `AWSCognitoIdentityProviderErrorInvalidLambdaResponse`, `AWSCognitoIdentityProviderErrorPasswordResetRequired`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorUserNotConfirmed`, `AWSCognitoIdentityProviderErrorInternalError`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleAccessPolicy`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleTrustRelationship`.
 
 @see AWSCognitoIdentityProviderInitiateAuthRequest
 @see AWSCognitoIdentityProviderInitiateAuthResponse
 */
- (AWSTask<AWSCognitoIdentityProviderInitiateAuthResponse *> *)initiateAuth:(AWSCognitoIdentityProviderInitiateAuthRequest *)request;

/**
 <p>Initiates the authentication flow.</p><note><p>This action might generate an SMS text message. Starting June 1, 2021, US telecom carriers require you to register an origination phone number before you can send SMS messages to US phone numbers. If you use SMS text messages in Amazon Cognito, you must register a phone number with <a href="https://console.aws.amazon.com/pinpoint/home/">Amazon Pinpoint</a>. Amazon Cognito uses the registered number automatically. Otherwise, Amazon Cognito users who must receive SMS messages might not be able to sign up, activate their accounts, or sign in.</p><p>If you have never used SMS text messages with Amazon Cognito or any other Amazon Web Service, Amazon Simple Notification Service might place your account in the SMS sandbox. In <i><a href="https://docs.aws.amazon.com/sns/latest/dg/sns-sms-sandbox.html">sandbox mode</a></i>, you can send messages only to verified phone numbers. After you test your app while in the sandbox environment, you can move out of the sandbox and into production. For more information, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-identity-pools-sms-userpool-settings.html"> SMS message settings for Amazon Cognito user pools</a> in the <i>Amazon Cognito Developer Guide</i>.</p></note>
 
 @param request A container for the necessary parameters to execute the InitiateAuth service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorUnexpectedLambda`, `AWSCognitoIdentityProviderErrorInvalidUserPoolConfiguration`, `AWSCognitoIdentityProviderErrorUserLambdaValidation`, `AWSCognitoIdentityProviderErrorInvalidLambdaResponse`, `AWSCognitoIdentityProviderErrorPasswordResetRequired`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorUserNotConfirmed`, `AWSCognitoIdentityProviderErrorInternalError`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleAccessPolicy`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleTrustRelationship`.
 
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
 <p>Lists the groups associated with a user pool.</p><p>Calling this action requires developer credentials.</p>
 
 @param request A container for the necessary parameters to execute the ListGroups service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderListGroupsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderListGroupsRequest
 @see AWSCognitoIdentityProviderListGroupsResponse
 */
- (AWSTask<AWSCognitoIdentityProviderListGroupsResponse *> *)listGroups:(AWSCognitoIdentityProviderListGroupsRequest *)request;

/**
 <p>Lists the groups associated with a user pool.</p><p>Calling this action requires developer credentials.</p>
 
 @param request A container for the necessary parameters to execute the ListGroups service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderListGroupsRequest
 @see AWSCognitoIdentityProviderListGroupsResponse
 */
- (void)listGroups:(AWSCognitoIdentityProviderListGroupsRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderListGroupsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists information about all identity providers for a user pool.</p>
 
 @param request A container for the necessary parameters to execute the ListIdentityProviders service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderListIdentityProvidersResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderListIdentityProvidersRequest
 @see AWSCognitoIdentityProviderListIdentityProvidersResponse
 */
- (AWSTask<AWSCognitoIdentityProviderListIdentityProvidersResponse *> *)listIdentityProviders:(AWSCognitoIdentityProviderListIdentityProvidersRequest *)request;

/**
 <p>Lists information about all identity providers for a user pool.</p>
 
 @param request A container for the necessary parameters to execute the ListIdentityProviders service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderListIdentityProvidersRequest
 @see AWSCognitoIdentityProviderListIdentityProvidersResponse
 */
- (void)listIdentityProviders:(AWSCognitoIdentityProviderListIdentityProvidersRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderListIdentityProvidersResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the resource servers for a user pool.</p>
 
 @param request A container for the necessary parameters to execute the ListResourceServers service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderListResourceServersResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderListResourceServersRequest
 @see AWSCognitoIdentityProviderListResourceServersResponse
 */
- (AWSTask<AWSCognitoIdentityProviderListResourceServersResponse *> *)listResourceServers:(AWSCognitoIdentityProviderListResourceServersRequest *)request;

/**
 <p>Lists the resource servers for a user pool.</p>
 
 @param request A container for the necessary parameters to execute the ListResourceServers service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderListResourceServersRequest
 @see AWSCognitoIdentityProviderListResourceServersResponse
 */
- (void)listResourceServers:(AWSCognitoIdentityProviderListResourceServersRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderListResourceServersResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the tags that are assigned to an Amazon Cognito user pool.</p><p>A tag is a label that you can apply to user pools to categorize and manage them in different ways, such as by purpose, owner, environment, or other criteria.</p><p>You can use this action up to 10 times per second, per account.</p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderListTagsForResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderListTagsForResourceRequest
 @see AWSCognitoIdentityProviderListTagsForResourceResponse
 */
- (AWSTask<AWSCognitoIdentityProviderListTagsForResourceResponse *> *)listTagsForResource:(AWSCognitoIdentityProviderListTagsForResourceRequest *)request;

/**
 <p>Lists the tags that are assigned to an Amazon Cognito user pool.</p><p>A tag is a label that you can apply to user pools to categorize and manage them in different ways, such as by purpose, owner, environment, or other criteria.</p><p>You can use this action up to 10 times per second, per account.</p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderListTagsForResourceRequest
 @see AWSCognitoIdentityProviderListTagsForResourceResponse
 */
- (void)listTagsForResource:(AWSCognitoIdentityProviderListTagsForResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderListTagsForResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

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
 <p>Lists the user pools associated with an Amazon Web Services account.</p>
 
 @param request A container for the necessary parameters to execute the ListUserPools service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderListUserPoolsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderListUserPoolsRequest
 @see AWSCognitoIdentityProviderListUserPoolsResponse
 */
- (AWSTask<AWSCognitoIdentityProviderListUserPoolsResponse *> *)listUserPools:(AWSCognitoIdentityProviderListUserPoolsRequest *)request;

/**
 <p>Lists the user pools associated with an Amazon Web Services account.</p>
 
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
 <p>Lists the users in the specified group.</p><p>Calling this action requires developer credentials.</p>
 
 @param request A container for the necessary parameters to execute the ListUsersInGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderListUsersInGroupResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderListUsersInGroupRequest
 @see AWSCognitoIdentityProviderListUsersInGroupResponse
 */
- (AWSTask<AWSCognitoIdentityProviderListUsersInGroupResponse *> *)listUsersInGroup:(AWSCognitoIdentityProviderListUsersInGroupRequest *)request;

/**
 <p>Lists the users in the specified group.</p><p>Calling this action requires developer credentials.</p>
 
 @param request A container for the necessary parameters to execute the ListUsersInGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderListUsersInGroupRequest
 @see AWSCognitoIdentityProviderListUsersInGroupResponse
 */
- (void)listUsersInGroup:(AWSCognitoIdentityProviderListUsersInGroupRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderListUsersInGroupResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Resends the confirmation (for confirmation of registration) to a specific user in the user pool.</p><note><p>This action might generate an SMS text message. Starting June 1, 2021, US telecom carriers require you to register an origination phone number before you can send SMS messages to US phone numbers. If you use SMS text messages in Amazon Cognito, you must register a phone number with <a href="https://console.aws.amazon.com/pinpoint/home/">Amazon Pinpoint</a>. Amazon Cognito uses the registered number automatically. Otherwise, Amazon Cognito users who must receive SMS messages might not be able to sign up, activate their accounts, or sign in.</p><p>If you have never used SMS text messages with Amazon Cognito or any other Amazon Web Service, Amazon Simple Notification Service might place your account in the SMS sandbox. In <i><a href="https://docs.aws.amazon.com/sns/latest/dg/sns-sms-sandbox.html">sandbox mode</a></i>, you can send messages only to verified phone numbers. After you test your app while in the sandbox environment, you can move out of the sandbox and into production. For more information, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-identity-pools-sms-userpool-settings.html"> SMS message settings for Amazon Cognito user pools</a> in the <i>Amazon Cognito Developer Guide</i>.</p></note>
 
 @param request A container for the necessary parameters to execute the ResendConfirmationCode service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderResendConfirmationCodeResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorUnexpectedLambda`, `AWSCognitoIdentityProviderErrorUserLambdaValidation`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorInvalidLambdaResponse`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorLimitExceeded`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleAccessPolicy`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleTrustRelationship`, `AWSCognitoIdentityProviderErrorInvalidEmailRoleAccessPolicy`, `AWSCognitoIdentityProviderErrorCodeDeliveryFailure`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderResendConfirmationCodeRequest
 @see AWSCognitoIdentityProviderResendConfirmationCodeResponse
 */
- (AWSTask<AWSCognitoIdentityProviderResendConfirmationCodeResponse *> *)resendConfirmationCode:(AWSCognitoIdentityProviderResendConfirmationCodeRequest *)request;

/**
 <p>Resends the confirmation (for confirmation of registration) to a specific user in the user pool.</p><note><p>This action might generate an SMS text message. Starting June 1, 2021, US telecom carriers require you to register an origination phone number before you can send SMS messages to US phone numbers. If you use SMS text messages in Amazon Cognito, you must register a phone number with <a href="https://console.aws.amazon.com/pinpoint/home/">Amazon Pinpoint</a>. Amazon Cognito uses the registered number automatically. Otherwise, Amazon Cognito users who must receive SMS messages might not be able to sign up, activate their accounts, or sign in.</p><p>If you have never used SMS text messages with Amazon Cognito or any other Amazon Web Service, Amazon Simple Notification Service might place your account in the SMS sandbox. In <i><a href="https://docs.aws.amazon.com/sns/latest/dg/sns-sms-sandbox.html">sandbox mode</a></i>, you can send messages only to verified phone numbers. After you test your app while in the sandbox environment, you can move out of the sandbox and into production. For more information, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-identity-pools-sms-userpool-settings.html"> SMS message settings for Amazon Cognito user pools</a> in the <i>Amazon Cognito Developer Guide</i>.</p></note>
 
 @param request A container for the necessary parameters to execute the ResendConfirmationCode service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorUnexpectedLambda`, `AWSCognitoIdentityProviderErrorUserLambdaValidation`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorInvalidLambdaResponse`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorLimitExceeded`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleAccessPolicy`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleTrustRelationship`, `AWSCognitoIdentityProviderErrorInvalidEmailRoleAccessPolicy`, `AWSCognitoIdentityProviderErrorCodeDeliveryFailure`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderResendConfirmationCodeRequest
 @see AWSCognitoIdentityProviderResendConfirmationCodeResponse
 */
- (void)resendConfirmationCode:(AWSCognitoIdentityProviderResendConfirmationCodeRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderResendConfirmationCodeResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Responds to the authentication challenge.</p><note><p>This action might generate an SMS text message. Starting June 1, 2021, US telecom carriers require you to register an origination phone number before you can send SMS messages to US phone numbers. If you use SMS text messages in Amazon Cognito, you must register a phone number with <a href="https://console.aws.amazon.com/pinpoint/home/">Amazon Pinpoint</a>. Amazon Cognito uses the registered number automatically. Otherwise, Amazon Cognito users who must receive SMS messages might not be able to sign up, activate their accounts, or sign in.</p><p>If you have never used SMS text messages with Amazon Cognito or any other Amazon Web Service, Amazon Simple Notification Service might place your account in the SMS sandbox. In <i><a href="https://docs.aws.amazon.com/sns/latest/dg/sns-sms-sandbox.html">sandbox mode</a></i>, you can send messages only to verified phone numbers. After you test your app while in the sandbox environment, you can move out of the sandbox and into production. For more information, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-identity-pools-sms-userpool-settings.html"> SMS message settings for Amazon Cognito user pools</a> in the <i>Amazon Cognito Developer Guide</i>.</p></note>
 
 @param request A container for the necessary parameters to execute the RespondToAuthChallenge service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderRespondToAuthChallengeResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorCodeMismatch`, `AWSCognitoIdentityProviderErrorExpiredCode`, `AWSCognitoIdentityProviderErrorUnexpectedLambda`, `AWSCognitoIdentityProviderErrorUserLambdaValidation`, `AWSCognitoIdentityProviderErrorInvalidPassword`, `AWSCognitoIdentityProviderErrorInvalidLambdaResponse`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInvalidUserPoolConfiguration`, `AWSCognitoIdentityProviderErrorMFAMethodNotFound`, `AWSCognitoIdentityProviderErrorPasswordResetRequired`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorUserNotConfirmed`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleAccessPolicy`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleTrustRelationship`, `AWSCognitoIdentityProviderErrorAliasExists`, `AWSCognitoIdentityProviderErrorInternalError`, `AWSCognitoIdentityProviderErrorSoftwareTokenMFANotFound`.
 
 @see AWSCognitoIdentityProviderRespondToAuthChallengeRequest
 @see AWSCognitoIdentityProviderRespondToAuthChallengeResponse
 */
- (AWSTask<AWSCognitoIdentityProviderRespondToAuthChallengeResponse *> *)respondToAuthChallenge:(AWSCognitoIdentityProviderRespondToAuthChallengeRequest *)request;

/**
 <p>Responds to the authentication challenge.</p><note><p>This action might generate an SMS text message. Starting June 1, 2021, US telecom carriers require you to register an origination phone number before you can send SMS messages to US phone numbers. If you use SMS text messages in Amazon Cognito, you must register a phone number with <a href="https://console.aws.amazon.com/pinpoint/home/">Amazon Pinpoint</a>. Amazon Cognito uses the registered number automatically. Otherwise, Amazon Cognito users who must receive SMS messages might not be able to sign up, activate their accounts, or sign in.</p><p>If you have never used SMS text messages with Amazon Cognito or any other Amazon Web Service, Amazon Simple Notification Service might place your account in the SMS sandbox. In <i><a href="https://docs.aws.amazon.com/sns/latest/dg/sns-sms-sandbox.html">sandbox mode</a></i>, you can send messages only to verified phone numbers. After you test your app while in the sandbox environment, you can move out of the sandbox and into production. For more information, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-identity-pools-sms-userpool-settings.html"> SMS message settings for Amazon Cognito user pools</a> in the <i>Amazon Cognito Developer Guide</i>.</p></note>
 
 @param request A container for the necessary parameters to execute the RespondToAuthChallenge service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorCodeMismatch`, `AWSCognitoIdentityProviderErrorExpiredCode`, `AWSCognitoIdentityProviderErrorUnexpectedLambda`, `AWSCognitoIdentityProviderErrorUserLambdaValidation`, `AWSCognitoIdentityProviderErrorInvalidPassword`, `AWSCognitoIdentityProviderErrorInvalidLambdaResponse`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInvalidUserPoolConfiguration`, `AWSCognitoIdentityProviderErrorMFAMethodNotFound`, `AWSCognitoIdentityProviderErrorPasswordResetRequired`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorUserNotConfirmed`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleAccessPolicy`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleTrustRelationship`, `AWSCognitoIdentityProviderErrorAliasExists`, `AWSCognitoIdentityProviderErrorInternalError`, `AWSCognitoIdentityProviderErrorSoftwareTokenMFANotFound`.
 
 @see AWSCognitoIdentityProviderRespondToAuthChallengeRequest
 @see AWSCognitoIdentityProviderRespondToAuthChallengeResponse
 */
- (void)respondToAuthChallenge:(AWSCognitoIdentityProviderRespondToAuthChallengeRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderRespondToAuthChallengeResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Revokes all of the access tokens generated by the specified refresh token. After the token is revoked, you can't use the revoked token to access Amazon Cognito authenticated APIs.</p>
 
 @param request A container for the necessary parameters to execute the RevokeToken service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderRevokeTokenResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`, `AWSCognitoIdentityProviderErrorUnauthorized`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorUnsupportedOperation`, `AWSCognitoIdentityProviderErrorUnsupportedTokenType`.
 
 @see AWSCognitoIdentityProviderRevokeTokenRequest
 @see AWSCognitoIdentityProviderRevokeTokenResponse
 */
- (AWSTask<AWSCognitoIdentityProviderRevokeTokenResponse *> *)revokeToken:(AWSCognitoIdentityProviderRevokeTokenRequest *)request;

/**
 <p>Revokes all of the access tokens generated by the specified refresh token. After the token is revoked, you can't use the revoked token to access Amazon Cognito authenticated APIs.</p>
 
 @param request A container for the necessary parameters to execute the RevokeToken service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`, `AWSCognitoIdentityProviderErrorUnauthorized`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorUnsupportedOperation`, `AWSCognitoIdentityProviderErrorUnsupportedTokenType`.
 
 @see AWSCognitoIdentityProviderRevokeTokenRequest
 @see AWSCognitoIdentityProviderRevokeTokenResponse
 */
- (void)revokeToken:(AWSCognitoIdentityProviderRevokeTokenRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderRevokeTokenResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Configures actions on detected risks. To delete the risk configuration for <code>UserPoolId</code> or <code>ClientId</code>, pass null values for all four configuration types.</p><p>To activate Amazon Cognito advanced security features, update the user pool to include the <code>UserPoolAddOns</code> key<code>AdvancedSecurityMode</code>.</p>
 
 @param request A container for the necessary parameters to execute the SetRiskConfiguration service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderSetRiskConfigurationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUserPoolAddOnNotEnabled`, `AWSCognitoIdentityProviderErrorCodeDeliveryFailure`, `AWSCognitoIdentityProviderErrorInvalidEmailRoleAccessPolicy`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderSetRiskConfigurationRequest
 @see AWSCognitoIdentityProviderSetRiskConfigurationResponse
 */
- (AWSTask<AWSCognitoIdentityProviderSetRiskConfigurationResponse *> *)setRiskConfiguration:(AWSCognitoIdentityProviderSetRiskConfigurationRequest *)request;

/**
 <p>Configures actions on detected risks. To delete the risk configuration for <code>UserPoolId</code> or <code>ClientId</code>, pass null values for all four configuration types.</p><p>To activate Amazon Cognito advanced security features, update the user pool to include the <code>UserPoolAddOns</code> key<code>AdvancedSecurityMode</code>.</p>
 
 @param request A container for the necessary parameters to execute the SetRiskConfiguration service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUserPoolAddOnNotEnabled`, `AWSCognitoIdentityProviderErrorCodeDeliveryFailure`, `AWSCognitoIdentityProviderErrorInvalidEmailRoleAccessPolicy`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderSetRiskConfigurationRequest
 @see AWSCognitoIdentityProviderSetRiskConfigurationResponse
 */
- (void)setRiskConfiguration:(AWSCognitoIdentityProviderSetRiskConfigurationRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderSetRiskConfigurationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Sets the user interface (UI) customization information for a user pool's built-in app UI.</p><p>You can specify app UI customization settings for a single client (with a specific <code>clientId</code>) or for all clients (by setting the <code>clientId</code> to <code>ALL</code>). If you specify <code>ALL</code>, the default configuration is used for every client that has no previously set UI customization. If you specify UI customization settings for a particular client, it will no longer return to the <code>ALL</code> configuration.</p><note><p>To use this API, your user pool must have a domain associated with it. Otherwise, there is no place to host the app's pages, and the service will throw an error.</p></note>
 
 @param request A container for the necessary parameters to execute the SetUICustomization service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderSetUICustomizationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderSetUICustomizationRequest
 @see AWSCognitoIdentityProviderSetUICustomizationResponse
 */
- (AWSTask<AWSCognitoIdentityProviderSetUICustomizationResponse *> *)setUICustomization:(AWSCognitoIdentityProviderSetUICustomizationRequest *)request;

/**
 <p>Sets the user interface (UI) customization information for a user pool's built-in app UI.</p><p>You can specify app UI customization settings for a single client (with a specific <code>clientId</code>) or for all clients (by setting the <code>clientId</code> to <code>ALL</code>). If you specify <code>ALL</code>, the default configuration is used for every client that has no previously set UI customization. If you specify UI customization settings for a particular client, it will no longer return to the <code>ALL</code> configuration.</p><note><p>To use this API, your user pool must have a domain associated with it. Otherwise, there is no place to host the app's pages, and the service will throw an error.</p></note>
 
 @param request A container for the necessary parameters to execute the SetUICustomization service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderSetUICustomizationRequest
 @see AWSCognitoIdentityProviderSetUICustomizationResponse
 */
- (void)setUICustomization:(AWSCognitoIdentityProviderSetUICustomizationRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderSetUICustomizationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Set the user's multi-factor authentication (MFA) method preference, including which MFA factors are activated and if any are preferred. Only one factor can be set as preferred. The preferred MFA factor will be used to authenticate a user if multiple factors are activated. If multiple options are activated and no preference is set, a challenge to choose an MFA option will be returned during sign-in. If an MFA type is activated for a user, the user will be prompted for MFA during all sign-in attempts unless device tracking is turned on and the device has been trusted. If you want MFA to be applied selectively based on the assessed risk level of sign-in attempts, deactivate MFA for users and turn on Adaptive Authentication for the user pool.</p>
 
 @param request A container for the necessary parameters to execute the SetUserMFAPreference service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderSetUserMFAPreferenceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorPasswordResetRequired`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorUserNotConfirmed`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderSetUserMFAPreferenceRequest
 @see AWSCognitoIdentityProviderSetUserMFAPreferenceResponse
 */
- (AWSTask<AWSCognitoIdentityProviderSetUserMFAPreferenceResponse *> *)setUserMFAPreference:(AWSCognitoIdentityProviderSetUserMFAPreferenceRequest *)request;

/**
 <p>Set the user's multi-factor authentication (MFA) method preference, including which MFA factors are activated and if any are preferred. Only one factor can be set as preferred. The preferred MFA factor will be used to authenticate a user if multiple factors are activated. If multiple options are activated and no preference is set, a challenge to choose an MFA option will be returned during sign-in. If an MFA type is activated for a user, the user will be prompted for MFA during all sign-in attempts unless device tracking is turned on and the device has been trusted. If you want MFA to be applied selectively based on the assessed risk level of sign-in attempts, deactivate MFA for users and turn on Adaptive Authentication for the user pool.</p>
 
 @param request A container for the necessary parameters to execute the SetUserMFAPreference service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorPasswordResetRequired`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorUserNotConfirmed`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderSetUserMFAPreferenceRequest
 @see AWSCognitoIdentityProviderSetUserMFAPreferenceResponse
 */
- (void)setUserMFAPreference:(AWSCognitoIdentityProviderSetUserMFAPreferenceRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderSetUserMFAPreferenceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Sets the user pool multi-factor authentication (MFA) configuration.</p><note><p>This action might generate an SMS text message. Starting June 1, 2021, US telecom carriers require you to register an origination phone number before you can send SMS messages to US phone numbers. If you use SMS text messages in Amazon Cognito, you must register a phone number with <a href="https://console.aws.amazon.com/pinpoint/home/">Amazon Pinpoint</a>. Amazon Cognito uses the registered number automatically. Otherwise, Amazon Cognito users who must receive SMS messages might not be able to sign up, activate their accounts, or sign in.</p><p>If you have never used SMS text messages with Amazon Cognito or any other Amazon Web Service, Amazon Simple Notification Service might place your account in the SMS sandbox. In <i><a href="https://docs.aws.amazon.com/sns/latest/dg/sns-sms-sandbox.html">sandbox mode</a></i>, you can send messages only to verified phone numbers. After you test your app while in the sandbox environment, you can move out of the sandbox and into production. For more information, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-identity-pools-sms-userpool-settings.html"> SMS message settings for Amazon Cognito user pools</a> in the <i>Amazon Cognito Developer Guide</i>.</p></note>
 
 @param request A container for the necessary parameters to execute the SetUserPoolMfaConfig service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderSetUserPoolMfaConfigResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleAccessPolicy`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleTrustRelationship`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderSetUserPoolMfaConfigRequest
 @see AWSCognitoIdentityProviderSetUserPoolMfaConfigResponse
 */
- (AWSTask<AWSCognitoIdentityProviderSetUserPoolMfaConfigResponse *> *)setUserPoolMfaConfig:(AWSCognitoIdentityProviderSetUserPoolMfaConfigRequest *)request;

/**
 <p>Sets the user pool multi-factor authentication (MFA) configuration.</p><note><p>This action might generate an SMS text message. Starting June 1, 2021, US telecom carriers require you to register an origination phone number before you can send SMS messages to US phone numbers. If you use SMS text messages in Amazon Cognito, you must register a phone number with <a href="https://console.aws.amazon.com/pinpoint/home/">Amazon Pinpoint</a>. Amazon Cognito uses the registered number automatically. Otherwise, Amazon Cognito users who must receive SMS messages might not be able to sign up, activate their accounts, or sign in.</p><p>If you have never used SMS text messages with Amazon Cognito or any other Amazon Web Service, Amazon Simple Notification Service might place your account in the SMS sandbox. In <i><a href="https://docs.aws.amazon.com/sns/latest/dg/sns-sms-sandbox.html">sandbox mode</a></i>, you can send messages only to verified phone numbers. After you test your app while in the sandbox environment, you can move out of the sandbox and into production. For more information, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-identity-pools-sms-userpool-settings.html"> SMS message settings for Amazon Cognito user pools</a> in the <i>Amazon Cognito Developer Guide</i>.</p></note>
 
 @param request A container for the necessary parameters to execute the SetUserPoolMfaConfig service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleAccessPolicy`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleTrustRelationship`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderSetUserPoolMfaConfigRequest
 @see AWSCognitoIdentityProviderSetUserPoolMfaConfigResponse
 */
- (void)setUserPoolMfaConfig:(AWSCognitoIdentityProviderSetUserPoolMfaConfigRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderSetUserPoolMfaConfigResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p><i>This action is no longer supported.</i> You can use it to configure only SMS MFA. You can't use it to configure time-based one-time password (TOTP) software token MFA. To configure either type of MFA, use <a href="https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_SetUserMFAPreference.html">SetUserMFAPreference</a> instead.</p>
 
 @param request A container for the necessary parameters to execute the SetUserSettings service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderSetUserSettingsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorPasswordResetRequired`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorUserNotConfirmed`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderSetUserSettingsRequest
 @see AWSCognitoIdentityProviderSetUserSettingsResponse
 */
- (AWSTask<AWSCognitoIdentityProviderSetUserSettingsResponse *> *)setUserSettings:(AWSCognitoIdentityProviderSetUserSettingsRequest *)request;

/**
 <p><i>This action is no longer supported.</i> You can use it to configure only SMS MFA. You can't use it to configure time-based one-time password (TOTP) software token MFA. To configure either type of MFA, use <a href="https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_SetUserMFAPreference.html">SetUserMFAPreference</a> instead.</p>
 
 @param request A container for the necessary parameters to execute the SetUserSettings service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorPasswordResetRequired`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorUserNotConfirmed`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderSetUserSettingsRequest
 @see AWSCognitoIdentityProviderSetUserSettingsResponse
 */
- (void)setUserSettings:(AWSCognitoIdentityProviderSetUserSettingsRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderSetUserSettingsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Registers the user in the specified user pool and creates a user name, password, and user attributes.</p><note><p>This action might generate an SMS text message. Starting June 1, 2021, US telecom carriers require you to register an origination phone number before you can send SMS messages to US phone numbers. If you use SMS text messages in Amazon Cognito, you must register a phone number with <a href="https://console.aws.amazon.com/pinpoint/home/">Amazon Pinpoint</a>. Amazon Cognito uses the registered number automatically. Otherwise, Amazon Cognito users who must receive SMS messages might not be able to sign up, activate their accounts, or sign in.</p><p>If you have never used SMS text messages with Amazon Cognito or any other Amazon Web Service, Amazon Simple Notification Service might place your account in the SMS sandbox. In <i><a href="https://docs.aws.amazon.com/sns/latest/dg/sns-sms-sandbox.html">sandbox mode</a></i>, you can send messages only to verified phone numbers. After you test your app while in the sandbox environment, you can move out of the sandbox and into production. For more information, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-identity-pools-sms-userpool-settings.html"> SMS message settings for Amazon Cognito user pools</a> in the <i>Amazon Cognito Developer Guide</i>.</p></note>
 
 @param request A container for the necessary parameters to execute the SignUp service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderSignUpResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorUnexpectedLambda`, `AWSCognitoIdentityProviderErrorUserLambdaValidation`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorInvalidPassword`, `AWSCognitoIdentityProviderErrorInvalidLambdaResponse`, `AWSCognitoIdentityProviderErrorUsernameExists`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleAccessPolicy`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleTrustRelationship`, `AWSCognitoIdentityProviderErrorInvalidEmailRoleAccessPolicy`, `AWSCognitoIdentityProviderErrorCodeDeliveryFailure`.
 
 @see AWSCognitoIdentityProviderSignUpRequest
 @see AWSCognitoIdentityProviderSignUpResponse
 */
- (AWSTask<AWSCognitoIdentityProviderSignUpResponse *> *)signUp:(AWSCognitoIdentityProviderSignUpRequest *)request;

/**
 <p>Registers the user in the specified user pool and creates a user name, password, and user attributes.</p><note><p>This action might generate an SMS text message. Starting June 1, 2021, US telecom carriers require you to register an origination phone number before you can send SMS messages to US phone numbers. If you use SMS text messages in Amazon Cognito, you must register a phone number with <a href="https://console.aws.amazon.com/pinpoint/home/">Amazon Pinpoint</a>. Amazon Cognito uses the registered number automatically. Otherwise, Amazon Cognito users who must receive SMS messages might not be able to sign up, activate their accounts, or sign in.</p><p>If you have never used SMS text messages with Amazon Cognito or any other Amazon Web Service, Amazon Simple Notification Service might place your account in the SMS sandbox. In <i><a href="https://docs.aws.amazon.com/sns/latest/dg/sns-sms-sandbox.html">sandbox mode</a></i>, you can send messages only to verified phone numbers. After you test your app while in the sandbox environment, you can move out of the sandbox and into production. For more information, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-identity-pools-sms-userpool-settings.html"> SMS message settings for Amazon Cognito user pools</a> in the <i>Amazon Cognito Developer Guide</i>.</p></note>
 
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
 <p>Assigns a set of tags to an Amazon Cognito user pool. A tag is a label that you can use to categorize and manage user pools in different ways, such as by purpose, owner, environment, or other criteria.</p><p>Each tag consists of a key and value, both of which you define. A key is a general category for more specific values. For example, if you have two versions of a user pool, one for testing and another for production, you might assign an <code>Environment</code> tag key to both user pools. The value of this key might be <code>Test</code> for one user pool, and <code>Production</code> for the other.</p><p>Tags are useful for cost tracking and access control. You can activate your tags so that they appear on the Billing and Cost Management console, where you can track the costs associated with your user pools. In an Identity and Access Management policy, you can constrain permissions for user pools based on specific tags or tag values.</p><p>You can use this action up to 5 times per second, per account. A user pool can have as many as 50 tags.</p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderTagResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderTagResourceRequest
 @see AWSCognitoIdentityProviderTagResourceResponse
 */
- (AWSTask<AWSCognitoIdentityProviderTagResourceResponse *> *)tagResource:(AWSCognitoIdentityProviderTagResourceRequest *)request;

/**
 <p>Assigns a set of tags to an Amazon Cognito user pool. A tag is a label that you can use to categorize and manage user pools in different ways, such as by purpose, owner, environment, or other criteria.</p><p>Each tag consists of a key and value, both of which you define. A key is a general category for more specific values. For example, if you have two versions of a user pool, one for testing and another for production, you might assign an <code>Environment</code> tag key to both user pools. The value of this key might be <code>Test</code> for one user pool, and <code>Production</code> for the other.</p><p>Tags are useful for cost tracking and access control. You can activate your tags so that they appear on the Billing and Cost Management console, where you can track the costs associated with your user pools. In an Identity and Access Management policy, you can constrain permissions for user pools based on specific tags or tag values.</p><p>You can use this action up to 5 times per second, per account. A user pool can have as many as 50 tags.</p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderTagResourceRequest
 @see AWSCognitoIdentityProviderTagResourceResponse
 */
- (void)tagResource:(AWSCognitoIdentityProviderTagResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderTagResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Removes the specified tags from an Amazon Cognito user pool. You can use this action up to 5 times per second, per account.</p>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderUntagResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderUntagResourceRequest
 @see AWSCognitoIdentityProviderUntagResourceResponse
 */
- (AWSTask<AWSCognitoIdentityProviderUntagResourceResponse *> *)untagResource:(AWSCognitoIdentityProviderUntagResourceRequest *)request;

/**
 <p>Removes the specified tags from an Amazon Cognito user pool. You can use this action up to 5 times per second, per account.</p>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderUntagResourceRequest
 @see AWSCognitoIdentityProviderUntagResourceResponse
 */
- (void)untagResource:(AWSCognitoIdentityProviderUntagResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderUntagResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Provides the feedback for an authentication event, whether it was from a valid user or not. This feedback is used for improving the risk evaluation decision for the user pool as part of Amazon Cognito advanced security.</p>
 
 @param request A container for the necessary parameters to execute the UpdateAuthEventFeedback service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderUpdateAuthEventFeedbackResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorUserPoolAddOnNotEnabled`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderUpdateAuthEventFeedbackRequest
 @see AWSCognitoIdentityProviderUpdateAuthEventFeedbackResponse
 */
- (AWSTask<AWSCognitoIdentityProviderUpdateAuthEventFeedbackResponse *> *)updateAuthEventFeedback:(AWSCognitoIdentityProviderUpdateAuthEventFeedbackRequest *)request;

/**
 <p>Provides the feedback for an authentication event, whether it was from a valid user or not. This feedback is used for improving the risk evaluation decision for the user pool as part of Amazon Cognito advanced security.</p>
 
 @param request A container for the necessary parameters to execute the UpdateAuthEventFeedback service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorUserPoolAddOnNotEnabled`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderUpdateAuthEventFeedbackRequest
 @see AWSCognitoIdentityProviderUpdateAuthEventFeedbackResponse
 */
- (void)updateAuthEventFeedback:(AWSCognitoIdentityProviderUpdateAuthEventFeedbackRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderUpdateAuthEventFeedbackResponse * _Nullable response, NSError * _Nullable error))completionHandler;

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
 <p>Updates the specified group with the specified attributes.</p><p>Calling this action requires developer credentials.</p>
 
 @param request A container for the necessary parameters to execute the UpdateGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderUpdateGroupResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderUpdateGroupRequest
 @see AWSCognitoIdentityProviderUpdateGroupResponse
 */
- (AWSTask<AWSCognitoIdentityProviderUpdateGroupResponse *> *)updateGroup:(AWSCognitoIdentityProviderUpdateGroupRequest *)request;

/**
 <p>Updates the specified group with the specified attributes.</p><p>Calling this action requires developer credentials.</p>
 
 @param request A container for the necessary parameters to execute the UpdateGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderUpdateGroupRequest
 @see AWSCognitoIdentityProviderUpdateGroupResponse
 */
- (void)updateGroup:(AWSCognitoIdentityProviderUpdateGroupRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderUpdateGroupResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates identity provider information for a user pool.</p>
 
 @param request A container for the necessary parameters to execute the UpdateIdentityProvider service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderUpdateIdentityProviderResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorUnsupportedIdentityProvider`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderUpdateIdentityProviderRequest
 @see AWSCognitoIdentityProviderUpdateIdentityProviderResponse
 */
- (AWSTask<AWSCognitoIdentityProviderUpdateIdentityProviderResponse *> *)updateIdentityProvider:(AWSCognitoIdentityProviderUpdateIdentityProviderRequest *)request;

/**
 <p>Updates identity provider information for a user pool.</p>
 
 @param request A container for the necessary parameters to execute the UpdateIdentityProvider service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorUnsupportedIdentityProvider`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderUpdateIdentityProviderRequest
 @see AWSCognitoIdentityProviderUpdateIdentityProviderResponse
 */
- (void)updateIdentityProvider:(AWSCognitoIdentityProviderUpdateIdentityProviderRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderUpdateIdentityProviderResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the name and scopes of resource server. All other fields are read-only.</p><important><p>If you don't provide a value for an attribute, it is set to the default value.</p></important>
 
 @param request A container for the necessary parameters to execute the UpdateResourceServer service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderUpdateResourceServerResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderUpdateResourceServerRequest
 @see AWSCognitoIdentityProviderUpdateResourceServerResponse
 */
- (AWSTask<AWSCognitoIdentityProviderUpdateResourceServerResponse *> *)updateResourceServer:(AWSCognitoIdentityProviderUpdateResourceServerRequest *)request;

/**
 <p>Updates the name and scopes of resource server. All other fields are read-only.</p><important><p>If you don't provide a value for an attribute, it is set to the default value.</p></important>
 
 @param request A container for the necessary parameters to execute the UpdateResourceServer service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderUpdateResourceServerRequest
 @see AWSCognitoIdentityProviderUpdateResourceServerResponse
 */
- (void)updateResourceServer:(AWSCognitoIdentityProviderUpdateResourceServerRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderUpdateResourceServerResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Allows a user to update a specific attribute (one at a time).</p><note><p>This action might generate an SMS text message. Starting June 1, 2021, US telecom carriers require you to register an origination phone number before you can send SMS messages to US phone numbers. If you use SMS text messages in Amazon Cognito, you must register a phone number with <a href="https://console.aws.amazon.com/pinpoint/home/">Amazon Pinpoint</a>. Amazon Cognito uses the registered number automatically. Otherwise, Amazon Cognito users who must receive SMS messages might not be able to sign up, activate their accounts, or sign in.</p><p>If you have never used SMS text messages with Amazon Cognito or any other Amazon Web Service, Amazon Simple Notification Service might place your account in the SMS sandbox. In <i><a href="https://docs.aws.amazon.com/sns/latest/dg/sns-sms-sandbox.html">sandbox mode</a></i>, you can send messages only to verified phone numbers. After you test your app while in the sandbox environment, you can move out of the sandbox and into production. For more information, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-identity-pools-sms-userpool-settings.html"> SMS message settings for Amazon Cognito user pools</a> in the <i>Amazon Cognito Developer Guide</i>.</p></note>
 
 @param request A container for the necessary parameters to execute the UpdateUserAttributes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderUpdateUserAttributesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorCodeMismatch`, `AWSCognitoIdentityProviderErrorExpiredCode`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUnexpectedLambda`, `AWSCognitoIdentityProviderErrorUserLambdaValidation`, `AWSCognitoIdentityProviderErrorInvalidLambdaResponse`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorAliasExists`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleAccessPolicy`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleTrustRelationship`, `AWSCognitoIdentityProviderErrorInvalidEmailRoleAccessPolicy`, `AWSCognitoIdentityProviderErrorCodeDeliveryFailure`, `AWSCognitoIdentityProviderErrorPasswordResetRequired`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorUserNotConfirmed`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderUpdateUserAttributesRequest
 @see AWSCognitoIdentityProviderUpdateUserAttributesResponse
 */
- (AWSTask<AWSCognitoIdentityProviderUpdateUserAttributesResponse *> *)updateUserAttributes:(AWSCognitoIdentityProviderUpdateUserAttributesRequest *)request;

/**
 <p>Allows a user to update a specific attribute (one at a time).</p><note><p>This action might generate an SMS text message. Starting June 1, 2021, US telecom carriers require you to register an origination phone number before you can send SMS messages to US phone numbers. If you use SMS text messages in Amazon Cognito, you must register a phone number with <a href="https://console.aws.amazon.com/pinpoint/home/">Amazon Pinpoint</a>. Amazon Cognito uses the registered number automatically. Otherwise, Amazon Cognito users who must receive SMS messages might not be able to sign up, activate their accounts, or sign in.</p><p>If you have never used SMS text messages with Amazon Cognito or any other Amazon Web Service, Amazon Simple Notification Service might place your account in the SMS sandbox. In <i><a href="https://docs.aws.amazon.com/sns/latest/dg/sns-sms-sandbox.html">sandbox mode</a></i>, you can send messages only to verified phone numbers. After you test your app while in the sandbox environment, you can move out of the sandbox and into production. For more information, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-identity-pools-sms-userpool-settings.html"> SMS message settings for Amazon Cognito user pools</a> in the <i>Amazon Cognito Developer Guide</i>.</p></note>
 
 @param request A container for the necessary parameters to execute the UpdateUserAttributes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorCodeMismatch`, `AWSCognitoIdentityProviderErrorExpiredCode`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUnexpectedLambda`, `AWSCognitoIdentityProviderErrorUserLambdaValidation`, `AWSCognitoIdentityProviderErrorInvalidLambdaResponse`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorAliasExists`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleAccessPolicy`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleTrustRelationship`, `AWSCognitoIdentityProviderErrorInvalidEmailRoleAccessPolicy`, `AWSCognitoIdentityProviderErrorCodeDeliveryFailure`, `AWSCognitoIdentityProviderErrorPasswordResetRequired`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorUserNotConfirmed`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderUpdateUserAttributesRequest
 @see AWSCognitoIdentityProviderUpdateUserAttributesResponse
 */
- (void)updateUserAttributes:(AWSCognitoIdentityProviderUpdateUserAttributesRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderUpdateUserAttributesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the specified user pool with the specified attributes. You can get a list of the current user pool settings using <a href="https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_DescribeUserPool.html">DescribeUserPool</a>. If you don't provide a value for an attribute, it will be set to the default value.</p><note><p>This action might generate an SMS text message. Starting June 1, 2021, US telecom carriers require you to register an origination phone number before you can send SMS messages to US phone numbers. If you use SMS text messages in Amazon Cognito, you must register a phone number with <a href="https://console.aws.amazon.com/pinpoint/home/">Amazon Pinpoint</a>. Amazon Cognito uses the registered number automatically. Otherwise, Amazon Cognito users who must receive SMS messages might not be able to sign up, activate their accounts, or sign in.</p><p>If you have never used SMS text messages with Amazon Cognito or any other Amazon Web Service, Amazon Simple Notification Service might place your account in the SMS sandbox. In <i><a href="https://docs.aws.amazon.com/sns/latest/dg/sns-sms-sandbox.html">sandbox mode</a></i>, you can send messages only to verified phone numbers. After you test your app while in the sandbox environment, you can move out of the sandbox and into production. For more information, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-identity-pools-sms-userpool-settings.html"> SMS message settings for Amazon Cognito user pools</a> in the <i>Amazon Cognito Developer Guide</i>.</p></note>
 
 @param request A container for the necessary parameters to execute the UpdateUserPool service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderUpdateUserPoolResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorConcurrentModification`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUserImportInProgress`, `AWSCognitoIdentityProviderErrorInternalError`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleAccessPolicy`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleTrustRelationship`, `AWSCognitoIdentityProviderErrorUserPoolTagging`, `AWSCognitoIdentityProviderErrorInvalidEmailRoleAccessPolicy`.
 
 @see AWSCognitoIdentityProviderUpdateUserPoolRequest
 @see AWSCognitoIdentityProviderUpdateUserPoolResponse
 */
- (AWSTask<AWSCognitoIdentityProviderUpdateUserPoolResponse *> *)updateUserPool:(AWSCognitoIdentityProviderUpdateUserPoolRequest *)request;

/**
 <p>Updates the specified user pool with the specified attributes. You can get a list of the current user pool settings using <a href="https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_DescribeUserPool.html">DescribeUserPool</a>. If you don't provide a value for an attribute, it will be set to the default value.</p><note><p>This action might generate an SMS text message. Starting June 1, 2021, US telecom carriers require you to register an origination phone number before you can send SMS messages to US phone numbers. If you use SMS text messages in Amazon Cognito, you must register a phone number with <a href="https://console.aws.amazon.com/pinpoint/home/">Amazon Pinpoint</a>. Amazon Cognito uses the registered number automatically. Otherwise, Amazon Cognito users who must receive SMS messages might not be able to sign up, activate their accounts, or sign in.</p><p>If you have never used SMS text messages with Amazon Cognito or any other Amazon Web Service, Amazon Simple Notification Service might place your account in the SMS sandbox. In <i><a href="https://docs.aws.amazon.com/sns/latest/dg/sns-sms-sandbox.html">sandbox mode</a></i>, you can send messages only to verified phone numbers. After you test your app while in the sandbox environment, you can move out of the sandbox and into production. For more information, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-identity-pools-sms-userpool-settings.html"> SMS message settings for Amazon Cognito user pools</a> in the <i>Amazon Cognito Developer Guide</i>.</p></note>
 
 @param request A container for the necessary parameters to execute the UpdateUserPool service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorConcurrentModification`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUserImportInProgress`, `AWSCognitoIdentityProviderErrorInternalError`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleAccessPolicy`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleTrustRelationship`, `AWSCognitoIdentityProviderErrorUserPoolTagging`, `AWSCognitoIdentityProviderErrorInvalidEmailRoleAccessPolicy`.
 
 @see AWSCognitoIdentityProviderUpdateUserPoolRequest
 @see AWSCognitoIdentityProviderUpdateUserPoolResponse
 */
- (void)updateUserPool:(AWSCognitoIdentityProviderUpdateUserPoolRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderUpdateUserPoolResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the specified user pool app client with the specified attributes. You can get a list of the current user pool app client settings using <a href="https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_DescribeUserPoolClient.html">DescribeUserPoolClient</a>.</p><important><p>If you don't provide a value for an attribute, it will be set to the default value.</p></important><p>You can also use this operation to enable token revocation for user pool clients. For more information about revoking tokens, see <a href="https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_RevokeToken.html">RevokeToken</a>.</p>
 
 @param request A container for the necessary parameters to execute the UpdateUserPoolClient service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderUpdateUserPoolClientResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorConcurrentModification`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorScopeDoesNotExist`, `AWSCognitoIdentityProviderErrorInvalidOAuthFlow`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderUpdateUserPoolClientRequest
 @see AWSCognitoIdentityProviderUpdateUserPoolClientResponse
 */
- (AWSTask<AWSCognitoIdentityProviderUpdateUserPoolClientResponse *> *)updateUserPoolClient:(AWSCognitoIdentityProviderUpdateUserPoolClientRequest *)request;

/**
 <p>Updates the specified user pool app client with the specified attributes. You can get a list of the current user pool app client settings using <a href="https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_DescribeUserPoolClient.html">DescribeUserPoolClient</a>.</p><important><p>If you don't provide a value for an attribute, it will be set to the default value.</p></important><p>You can also use this operation to enable token revocation for user pool clients. For more information about revoking tokens, see <a href="https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_RevokeToken.html">RevokeToken</a>.</p>
 
 @param request A container for the necessary parameters to execute the UpdateUserPoolClient service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorConcurrentModification`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorScopeDoesNotExist`, `AWSCognitoIdentityProviderErrorInvalidOAuthFlow`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderUpdateUserPoolClientRequest
 @see AWSCognitoIdentityProviderUpdateUserPoolClientResponse
 */
- (void)updateUserPoolClient:(AWSCognitoIdentityProviderUpdateUserPoolClientRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderUpdateUserPoolClientResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the Secure Sockets Layer (SSL) certificate for the custom domain for your user pool.</p><p>You can use this operation to provide the Amazon Resource Name (ARN) of a new certificate to Amazon Cognito. You can't use it to change the domain for a user pool.</p><p>A custom domain is used to host the Amazon Cognito hosted UI, which provides sign-up and sign-in pages for your application. When you set up a custom domain, you provide a certificate that you manage with Certificate Manager (ACM). When necessary, you can use this operation to change the certificate that you applied to your custom domain.</p><p>Usually, this is unnecessary following routine certificate renewal with ACM. When you renew your existing certificate in ACM, the ARN for your certificate remains the same, and your custom domain uses the new certificate automatically.</p><p>However, if you replace your existing certificate with a new one, ACM gives the new certificate a new ARN. To apply the new certificate to your custom domain, you must provide this ARN to Amazon Cognito.</p><p>When you add your new certificate in ACM, you must choose US East (N. Virginia) as the Amazon Web Services Region.</p><p>After you submit your request, Amazon Cognito requires up to 1 hour to distribute your new certificate to your custom domain.</p><p>For more information about adding a custom domain to your user pool, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pools-add-custom-domain.html">Using Your Own Domain for the Hosted UI</a>.</p>
 
 @param request A container for the necessary parameters to execute the UpdateUserPoolDomain service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderUpdateUserPoolDomainResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderUpdateUserPoolDomainRequest
 @see AWSCognitoIdentityProviderUpdateUserPoolDomainResponse
 */
- (AWSTask<AWSCognitoIdentityProviderUpdateUserPoolDomainResponse *> *)updateUserPoolDomain:(AWSCognitoIdentityProviderUpdateUserPoolDomainRequest *)request;

/**
 <p>Updates the Secure Sockets Layer (SSL) certificate for the custom domain for your user pool.</p><p>You can use this operation to provide the Amazon Resource Name (ARN) of a new certificate to Amazon Cognito. You can't use it to change the domain for a user pool.</p><p>A custom domain is used to host the Amazon Cognito hosted UI, which provides sign-up and sign-in pages for your application. When you set up a custom domain, you provide a certificate that you manage with Certificate Manager (ACM). When necessary, you can use this operation to change the certificate that you applied to your custom domain.</p><p>Usually, this is unnecessary following routine certificate renewal with ACM. When you renew your existing certificate in ACM, the ARN for your certificate remains the same, and your custom domain uses the new certificate automatically.</p><p>However, if you replace your existing certificate with a new one, ACM gives the new certificate a new ARN. To apply the new certificate to your custom domain, you must provide this ARN to Amazon Cognito.</p><p>When you add your new certificate in ACM, you must choose US East (N. Virginia) as the Amazon Web Services Region.</p><p>After you submit your request, Amazon Cognito requires up to 1 hour to distribute your new certificate to your custom domain.</p><p>For more information about adding a custom domain to your user pool, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pools-add-custom-domain.html">Using Your Own Domain for the Hosted UI</a>.</p>
 
 @param request A container for the necessary parameters to execute the UpdateUserPoolDomain service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderUpdateUserPoolDomainRequest
 @see AWSCognitoIdentityProviderUpdateUserPoolDomainResponse
 */
- (void)updateUserPoolDomain:(AWSCognitoIdentityProviderUpdateUserPoolDomainRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderUpdateUserPoolDomainResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Use this API to register a user's entered time-based one-time password (TOTP) code and mark the user's software token MFA status as "verified" if successful. The request takes an access token or a session string, but not both.</p>
 
 @param request A container for the necessary parameters to execute the VerifySoftwareToken service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderVerifySoftwareTokenResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidUserPoolConfiguration`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorPasswordResetRequired`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorUserNotConfirmed`, `AWSCognitoIdentityProviderErrorInternalError`, `AWSCognitoIdentityProviderErrorEnableSoftwareTokenMFA`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorSoftwareTokenMFANotFound`, `AWSCognitoIdentityProviderErrorCodeMismatch`.
 
 @see AWSCognitoIdentityProviderVerifySoftwareTokenRequest
 @see AWSCognitoIdentityProviderVerifySoftwareTokenResponse
 */
- (AWSTask<AWSCognitoIdentityProviderVerifySoftwareTokenResponse *> *)verifySoftwareToken:(AWSCognitoIdentityProviderVerifySoftwareTokenRequest *)request;

/**
 <p>Use this API to register a user's entered time-based one-time password (TOTP) code and mark the user's software token MFA status as "verified" if successful. The request takes an access token or a session string, but not both.</p>
 
 @param request A container for the necessary parameters to execute the VerifySoftwareToken service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidUserPoolConfiguration`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorPasswordResetRequired`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorUserNotConfirmed`, `AWSCognitoIdentityProviderErrorInternalError`, `AWSCognitoIdentityProviderErrorEnableSoftwareTokenMFA`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorSoftwareTokenMFANotFound`, `AWSCognitoIdentityProviderErrorCodeMismatch`.
 
 @see AWSCognitoIdentityProviderVerifySoftwareTokenRequest
 @see AWSCognitoIdentityProviderVerifySoftwareTokenResponse
 */
- (void)verifySoftwareToken:(AWSCognitoIdentityProviderVerifySoftwareTokenRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderVerifySoftwareTokenResponse * _Nullable response, NSError * _Nullable error))completionHandler;

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
