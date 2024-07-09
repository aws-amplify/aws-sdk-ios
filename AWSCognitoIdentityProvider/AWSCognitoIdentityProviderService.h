//
// Copyright 2010-2024 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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
 <p>With the Amazon Cognito user pools API, you can configure user pools and authenticate users. To authenticate users from third-party identity providers (IdPs) in this API, you can <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pools-identity-federation-consolidate-users.html">link IdP users to native user profiles</a>. Learn more about the authentication and authorization of federated users at <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pools-identity-federation.html">Adding user pool sign-in through a third party</a> and in the <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-userpools-server-contract-reference.html">User pool federation endpoints and hosted UI reference</a>.</p><p>This API reference provides detailed information about API operations and object types in Amazon Cognito.</p><p>Along with resource management operations, the Amazon Cognito user pools API includes classes of operations and authorization models for client-side and server-side authentication of users. You can interact with operations in the Amazon Cognito user pools API as any of the following subjects.</p><ol><li><p>An administrator who wants to configure user pools, app clients, users, groups, or other user pool functions.</p></li><li><p>A server-side app, like a web application, that wants to use its Amazon Web Services privileges to manage, authenticate, or authorize a user.</p></li><li><p>A client-side app, like a mobile app, that wants to make unauthenticated requests to manage, authenticate, or authorize a user.</p></li></ol><p>For more information, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a> in the <i>Amazon Cognito Developer Guide</i>.</p><p>With your Amazon Web Services SDK, you can build the logic to support operational flows in every use case for this API. You can also make direct REST API requests to <a href="https://docs.aws.amazon.com/general/latest/gr/cognito_identity.html#cognito_identity_your_user_pools_region">Amazon Cognito user pools service endpoints</a>. The following links can get you started with the <code>CognitoIdentityProvider</code> client in other supported Amazon Web Services SDKs.</p><ul><li><p><a href="https://docs.aws.amazon.com/cli/latest/reference/cognito-idp/index.html#cli-aws-cognito-idp">Amazon Web Services Command Line Interface</a></p></li><li><p><a href="https://docs.aws.amazon.com/sdkfornet/v3/apidocs/items/CognitoIdentityProvider/TCognitoIdentityProviderClient.html">Amazon Web Services SDK for .NET</a></p></li><li><p><a href="https://sdk.amazonaws.com/cpp/api/LATEST/aws-cpp-sdk-cognito-idp/html/class_aws_1_1_cognito_identity_provider_1_1_cognito_identity_provider_client.html">Amazon Web Services SDK for C++</a></p></li><li><p><a href="https://docs.aws.amazon.com/sdk-for-go/api/service/cognitoidentityprovider/#CognitoIdentityProvider">Amazon Web Services SDK for Go</a></p></li><li><p><a href="https://sdk.amazonaws.com/java/api/latest/software/amazon/awssdk/services/cognitoidentityprovider/CognitoIdentityProviderClient.html">Amazon Web Services SDK for Java V2</a></p></li><li><p><a href="https://docs.aws.amazon.com/AWSJavaScriptSDK/latest/AWS/CognitoIdentityServiceProvider.html">Amazon Web Services SDK for JavaScript</a></p></li><li><p><a href="https://docs.aws.amazon.com/aws-sdk-php/v3/api/api-cognito-idp-2016-04-18.html">Amazon Web Services SDK for PHP V3</a></p></li><li><p><a href="https://boto3.amazonaws.com/v1/documentation/api/latest/reference/services/cognito-idp.html">Amazon Web Services SDK for Python</a></p></li><li><p><a href="https://docs.aws.amazon.com/sdk-for-ruby/v3/api/Aws/CognitoIdentityProvider/Client.html">Amazon Web Services SDK for Ruby V3</a></p></li></ul><p>To get started with an Amazon Web Services SDK, see <a href="http://aws.amazon.com/developer/tools/">Tools to Build on Amazon Web Services</a>. For example actions and scenarios, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/service_code_examples_cognito-identity-provider.html">Code examples for Amazon Cognito Identity Provider using Amazon Web Services SDKs</a>.</p>
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
 <p>Adds additional user attributes to the user pool schema.</p><note><p>Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you must use IAM credentials to authorize requests, and you must grant yourself the corresponding IAM permission in a policy.</p><p class="title"><b>Learn more</b></p><ul><li><p><a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html">Signing Amazon Web Services API Requests</a></p></li><li><p><a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a></p></li></ul></note>
 
 @param request A container for the necessary parameters to execute the AddCustomAttributes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderAddCustomAttributesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUserImportInProgress`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderAddCustomAttributesRequest
 @see AWSCognitoIdentityProviderAddCustomAttributesResponse
 */
- (AWSTask<AWSCognitoIdentityProviderAddCustomAttributesResponse *> *)addCustomAttributes:(AWSCognitoIdentityProviderAddCustomAttributesRequest *)request;

/**
 <p>Adds additional user attributes to the user pool schema.</p><note><p>Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you must use IAM credentials to authorize requests, and you must grant yourself the corresponding IAM permission in a policy.</p><p class="title"><b>Learn more</b></p><ul><li><p><a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html">Signing Amazon Web Services API Requests</a></p></li><li><p><a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a></p></li></ul></note>
 
 @param request A container for the necessary parameters to execute the AddCustomAttributes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUserImportInProgress`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderAddCustomAttributesRequest
 @see AWSCognitoIdentityProviderAddCustomAttributesResponse
 */
- (void)addCustomAttributes:(AWSCognitoIdentityProviderAddCustomAttributesRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderAddCustomAttributesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Adds a user to a group. A user who is in a group can present a preferred-role claim to an identity pool, and populates a <code>cognito:groups</code> claim to their access and identity tokens.</p><note><p>Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you must use IAM credentials to authorize requests, and you must grant yourself the corresponding IAM permission in a policy.</p><p class="title"><b>Learn more</b></p><ul><li><p><a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html">Signing Amazon Web Services API Requests</a></p></li><li><p><a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a></p></li></ul></note>
 
 @param request A container for the necessary parameters to execute the AdminAddUserToGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderAdminAddUserToGroupRequest
 */
- (AWSTask *)adminAddUserToGroup:(AWSCognitoIdentityProviderAdminAddUserToGroupRequest *)request;

/**
 <p>Adds a user to a group. A user who is in a group can present a preferred-role claim to an identity pool, and populates a <code>cognito:groups</code> claim to their access and identity tokens.</p><note><p>Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you must use IAM credentials to authorize requests, and you must grant yourself the corresponding IAM permission in a policy.</p><p class="title"><b>Learn more</b></p><ul><li><p><a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html">Signing Amazon Web Services API Requests</a></p></li><li><p><a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a></p></li></ul></note>
 
 @param request A container for the necessary parameters to execute the AdminAddUserToGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderAdminAddUserToGroupRequest
 */
- (void)adminAddUserToGroup:(AWSCognitoIdentityProviderAdminAddUserToGroupRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>This IAM-authenticated API operation provides a code that Amazon Cognito sent to your user when they signed up in your user pool. After your user enters their code, they confirm ownership of the email address or phone number that they provided, and their user account becomes active. Depending on your user pool configuration, your users will receive their confirmation code in an email or SMS message.</p><p>Local users who signed up in your user pool are the only type of user who can confirm sign-up with a code. Users who federate through an external identity provider (IdP) have already been confirmed by their IdP. Administrator-created users confirm their accounts when they respond to their invitation email message and choose a password.</p><note><p>Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you must use IAM credentials to authorize requests, and you must grant yourself the corresponding IAM permission in a policy.</p><p class="title"><b>Learn more</b></p><ul><li><p><a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html">Signing Amazon Web Services API Requests</a></p></li><li><p><a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a></p></li></ul></note>
 
 @param request A container for the necessary parameters to execute the AdminConfirmSignUp service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderAdminConfirmSignUpResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorUnexpectedLambda`, `AWSCognitoIdentityProviderErrorUserLambdaValidation`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorTooManyFailedAttempts`, `AWSCognitoIdentityProviderErrorInvalidLambdaResponse`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorLimitExceeded`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderAdminConfirmSignUpRequest
 @see AWSCognitoIdentityProviderAdminConfirmSignUpResponse
 */
- (AWSTask<AWSCognitoIdentityProviderAdminConfirmSignUpResponse *> *)adminConfirmSignUp:(AWSCognitoIdentityProviderAdminConfirmSignUpRequest *)request;

/**
 <p>This IAM-authenticated API operation provides a code that Amazon Cognito sent to your user when they signed up in your user pool. After your user enters their code, they confirm ownership of the email address or phone number that they provided, and their user account becomes active. Depending on your user pool configuration, your users will receive their confirmation code in an email or SMS message.</p><p>Local users who signed up in your user pool are the only type of user who can confirm sign-up with a code. Users who federate through an external identity provider (IdP) have already been confirmed by their IdP. Administrator-created users confirm their accounts when they respond to their invitation email message and choose a password.</p><note><p>Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you must use IAM credentials to authorize requests, and you must grant yourself the corresponding IAM permission in a policy.</p><p class="title"><b>Learn more</b></p><ul><li><p><a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html">Signing Amazon Web Services API Requests</a></p></li><li><p><a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a></p></li></ul></note>
 
 @param request A container for the necessary parameters to execute the AdminConfirmSignUp service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorUnexpectedLambda`, `AWSCognitoIdentityProviderErrorUserLambdaValidation`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorTooManyFailedAttempts`, `AWSCognitoIdentityProviderErrorInvalidLambdaResponse`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorLimitExceeded`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderAdminConfirmSignUpRequest
 @see AWSCognitoIdentityProviderAdminConfirmSignUpResponse
 */
- (void)adminConfirmSignUp:(AWSCognitoIdentityProviderAdminConfirmSignUpRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderAdminConfirmSignUpResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new user in the specified user pool.</p><p>If <code>MessageAction</code> isn't set, the default is to send a welcome message via email or phone (SMS).</p><note><p>This action might generate an SMS text message. Starting June 1, 2021, US telecom carriers require you to register an origination phone number before you can send SMS messages to US phone numbers. If you use SMS text messages in Amazon Cognito, you must register a phone number with <a href="https://console.aws.amazon.com/pinpoint/home/">Amazon Pinpoint</a>. Amazon Cognito uses the registered number automatically. Otherwise, Amazon Cognito users who must receive SMS messages might not be able to sign up, activate their accounts, or sign in.</p><p>If you have never used SMS text messages with Amazon Cognito or any other Amazon Web Service, Amazon Simple Notification Service might place your account in the SMS sandbox. In <i><a href="https://docs.aws.amazon.com/sns/latest/dg/sns-sms-sandbox.html">sandbox mode</a></i>, you can send messages only to verified phone numbers. After you test your app while in the sandbox environment, you can move out of the sandbox and into production. For more information, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pool-sms-settings.html"> SMS message settings for Amazon Cognito user pools</a> in the <i>Amazon Cognito Developer Guide</i>.</p></note><p>This message is based on a template that you configured in your call to create or update a user pool. This template includes your custom sign-up instructions and placeholders for user name and temporary password.</p><p>Alternatively, you can call <code>AdminCreateUser</code> with <code>SUPPRESS</code> for the <code>MessageAction</code> parameter, and Amazon Cognito won't send any email. </p><p>In either case, the user will be in the <code>FORCE_CHANGE_PASSWORD</code> state until they sign in and change their password.</p><note><p>Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you must use IAM credentials to authorize requests, and you must grant yourself the corresponding IAM permission in a policy.</p><p class="title"><b>Learn more</b></p><ul><li><p><a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html">Signing Amazon Web Services API Requests</a></p></li><li><p><a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a></p></li></ul></note>
 
 @param request A container for the necessary parameters to execute the AdminCreateUser service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderAdminCreateUserResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorUsernameExists`, `AWSCognitoIdentityProviderErrorInvalidPassword`, `AWSCognitoIdentityProviderErrorCodeDeliveryFailure`, `AWSCognitoIdentityProviderErrorUnexpectedLambda`, `AWSCognitoIdentityProviderErrorUserLambdaValidation`, `AWSCognitoIdentityProviderErrorInvalidLambdaResponse`, `AWSCognitoIdentityProviderErrorPreconditionNotMet`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleAccessPolicy`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleTrustRelationship`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUnsupportedUserState`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderAdminCreateUserRequest
 @see AWSCognitoIdentityProviderAdminCreateUserResponse
 */
- (AWSTask<AWSCognitoIdentityProviderAdminCreateUserResponse *> *)adminCreateUser:(AWSCognitoIdentityProviderAdminCreateUserRequest *)request;

/**
 <p>Creates a new user in the specified user pool.</p><p>If <code>MessageAction</code> isn't set, the default is to send a welcome message via email or phone (SMS).</p><note><p>This action might generate an SMS text message. Starting June 1, 2021, US telecom carriers require you to register an origination phone number before you can send SMS messages to US phone numbers. If you use SMS text messages in Amazon Cognito, you must register a phone number with <a href="https://console.aws.amazon.com/pinpoint/home/">Amazon Pinpoint</a>. Amazon Cognito uses the registered number automatically. Otherwise, Amazon Cognito users who must receive SMS messages might not be able to sign up, activate their accounts, or sign in.</p><p>If you have never used SMS text messages with Amazon Cognito or any other Amazon Web Service, Amazon Simple Notification Service might place your account in the SMS sandbox. In <i><a href="https://docs.aws.amazon.com/sns/latest/dg/sns-sms-sandbox.html">sandbox mode</a></i>, you can send messages only to verified phone numbers. After you test your app while in the sandbox environment, you can move out of the sandbox and into production. For more information, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pool-sms-settings.html"> SMS message settings for Amazon Cognito user pools</a> in the <i>Amazon Cognito Developer Guide</i>.</p></note><p>This message is based on a template that you configured in your call to create or update a user pool. This template includes your custom sign-up instructions and placeholders for user name and temporary password.</p><p>Alternatively, you can call <code>AdminCreateUser</code> with <code>SUPPRESS</code> for the <code>MessageAction</code> parameter, and Amazon Cognito won't send any email. </p><p>In either case, the user will be in the <code>FORCE_CHANGE_PASSWORD</code> state until they sign in and change their password.</p><note><p>Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you must use IAM credentials to authorize requests, and you must grant yourself the corresponding IAM permission in a policy.</p><p class="title"><b>Learn more</b></p><ul><li><p><a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html">Signing Amazon Web Services API Requests</a></p></li><li><p><a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a></p></li></ul></note>
 
 @param request A container for the necessary parameters to execute the AdminCreateUser service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorUsernameExists`, `AWSCognitoIdentityProviderErrorInvalidPassword`, `AWSCognitoIdentityProviderErrorCodeDeliveryFailure`, `AWSCognitoIdentityProviderErrorUnexpectedLambda`, `AWSCognitoIdentityProviderErrorUserLambdaValidation`, `AWSCognitoIdentityProviderErrorInvalidLambdaResponse`, `AWSCognitoIdentityProviderErrorPreconditionNotMet`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleAccessPolicy`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleTrustRelationship`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUnsupportedUserState`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderAdminCreateUserRequest
 @see AWSCognitoIdentityProviderAdminCreateUserResponse
 */
- (void)adminCreateUser:(AWSCognitoIdentityProviderAdminCreateUserRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderAdminCreateUserResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a user as an administrator. Works on any user.</p><note><p>Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you must use IAM credentials to authorize requests, and you must grant yourself the corresponding IAM permission in a policy.</p><p class="title"><b>Learn more</b></p><ul><li><p><a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html">Signing Amazon Web Services API Requests</a></p></li><li><p><a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a></p></li></ul></note>
 
 @param request A container for the necessary parameters to execute the AdminDeleteUser service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderAdminDeleteUserRequest
 */
- (AWSTask *)adminDeleteUser:(AWSCognitoIdentityProviderAdminDeleteUserRequest *)request;

/**
 <p>Deletes a user as an administrator. Works on any user.</p><note><p>Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you must use IAM credentials to authorize requests, and you must grant yourself the corresponding IAM permission in a policy.</p><p class="title"><b>Learn more</b></p><ul><li><p><a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html">Signing Amazon Web Services API Requests</a></p></li><li><p><a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a></p></li></ul></note>
 
 @param request A container for the necessary parameters to execute the AdminDeleteUser service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderAdminDeleteUserRequest
 */
- (void)adminDeleteUser:(AWSCognitoIdentityProviderAdminDeleteUserRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the user attributes in a user pool as an administrator. Works on any user.</p><note><p>Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you must use IAM credentials to authorize requests, and you must grant yourself the corresponding IAM permission in a policy.</p><p class="title"><b>Learn more</b></p><ul><li><p><a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html">Signing Amazon Web Services API Requests</a></p></li><li><p><a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a></p></li></ul></note>
 
 @param request A container for the necessary parameters to execute the AdminDeleteUserAttributes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderAdminDeleteUserAttributesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderAdminDeleteUserAttributesRequest
 @see AWSCognitoIdentityProviderAdminDeleteUserAttributesResponse
 */
- (AWSTask<AWSCognitoIdentityProviderAdminDeleteUserAttributesResponse *> *)adminDeleteUserAttributes:(AWSCognitoIdentityProviderAdminDeleteUserAttributesRequest *)request;

/**
 <p>Deletes the user attributes in a user pool as an administrator. Works on any user.</p><note><p>Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you must use IAM credentials to authorize requests, and you must grant yourself the corresponding IAM permission in a policy.</p><p class="title"><b>Learn more</b></p><ul><li><p><a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html">Signing Amazon Web Services API Requests</a></p></li><li><p><a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a></p></li></ul></note>
 
 @param request A container for the necessary parameters to execute the AdminDeleteUserAttributes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderAdminDeleteUserAttributesRequest
 @see AWSCognitoIdentityProviderAdminDeleteUserAttributesResponse
 */
- (void)adminDeleteUserAttributes:(AWSCognitoIdentityProviderAdminDeleteUserAttributesRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderAdminDeleteUserAttributesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Prevents the user from signing in with the specified external (SAML or social) identity provider (IdP). If the user that you want to deactivate is a Amazon Cognito user pools native username + password user, they can't use their password to sign in. If the user to deactivate is a linked external IdP user, any link between that user and an existing user is removed. When the external user signs in again, and the user is no longer attached to the previously linked <code>DestinationUser</code>, the user must create a new user account. See <a href="https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_AdminLinkProviderForUser.html">AdminLinkProviderForUser</a>.</p><p>The <code>ProviderName</code> must match the value specified when creating an IdP for the pool. </p><p>To deactivate a native username + password user, the <code>ProviderName</code> value must be <code>Cognito</code> and the <code>ProviderAttributeName</code> must be <code>Cognito_Subject</code>. The <code>ProviderAttributeValue</code> must be the name that is used in the user pool for the user.</p><p>The <code>ProviderAttributeName</code> must always be <code>Cognito_Subject</code> for social IdPs. The <code>ProviderAttributeValue</code> must always be the exact subject that was used when the user was originally linked as a source user.</p><p>For de-linking a SAML identity, there are two scenarios. If the linked identity has not yet been used to sign in, the <code>ProviderAttributeName</code> and <code>ProviderAttributeValue</code> must be the same values that were used for the <code>SourceUser</code> when the identities were originally linked using <code> AdminLinkProviderForUser</code> call. (If the linking was done with <code>ProviderAttributeName</code> set to <code>Cognito_Subject</code>, the same applies here). However, if the user has already signed in, the <code>ProviderAttributeName</code> must be <code>Cognito_Subject</code> and <code>ProviderAttributeValue</code> must be the subject of the SAML assertion.</p><note><p>Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you must use IAM credentials to authorize requests, and you must grant yourself the corresponding IAM permission in a policy.</p><p class="title"><b>Learn more</b></p><ul><li><p><a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html">Signing Amazon Web Services API Requests</a></p></li><li><p><a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a></p></li></ul></note>
 
 @param request A container for the necessary parameters to execute the AdminDisableProviderForUser service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderAdminDisableProviderForUserResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorAliasExists`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderAdminDisableProviderForUserRequest
 @see AWSCognitoIdentityProviderAdminDisableProviderForUserResponse
 */
- (AWSTask<AWSCognitoIdentityProviderAdminDisableProviderForUserResponse *> *)adminDisableProviderForUser:(AWSCognitoIdentityProviderAdminDisableProviderForUserRequest *)request;

/**
 <p>Prevents the user from signing in with the specified external (SAML or social) identity provider (IdP). If the user that you want to deactivate is a Amazon Cognito user pools native username + password user, they can't use their password to sign in. If the user to deactivate is a linked external IdP user, any link between that user and an existing user is removed. When the external user signs in again, and the user is no longer attached to the previously linked <code>DestinationUser</code>, the user must create a new user account. See <a href="https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_AdminLinkProviderForUser.html">AdminLinkProviderForUser</a>.</p><p>The <code>ProviderName</code> must match the value specified when creating an IdP for the pool. </p><p>To deactivate a native username + password user, the <code>ProviderName</code> value must be <code>Cognito</code> and the <code>ProviderAttributeName</code> must be <code>Cognito_Subject</code>. The <code>ProviderAttributeValue</code> must be the name that is used in the user pool for the user.</p><p>The <code>ProviderAttributeName</code> must always be <code>Cognito_Subject</code> for social IdPs. The <code>ProviderAttributeValue</code> must always be the exact subject that was used when the user was originally linked as a source user.</p><p>For de-linking a SAML identity, there are two scenarios. If the linked identity has not yet been used to sign in, the <code>ProviderAttributeName</code> and <code>ProviderAttributeValue</code> must be the same values that were used for the <code>SourceUser</code> when the identities were originally linked using <code> AdminLinkProviderForUser</code> call. (If the linking was done with <code>ProviderAttributeName</code> set to <code>Cognito_Subject</code>, the same applies here). However, if the user has already signed in, the <code>ProviderAttributeName</code> must be <code>Cognito_Subject</code> and <code>ProviderAttributeValue</code> must be the subject of the SAML assertion.</p><note><p>Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you must use IAM credentials to authorize requests, and you must grant yourself the corresponding IAM permission in a policy.</p><p class="title"><b>Learn more</b></p><ul><li><p><a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html">Signing Amazon Web Services API Requests</a></p></li><li><p><a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a></p></li></ul></note>
 
 @param request A container for the necessary parameters to execute the AdminDisableProviderForUser service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorAliasExists`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderAdminDisableProviderForUserRequest
 @see AWSCognitoIdentityProviderAdminDisableProviderForUserResponse
 */
- (void)adminDisableProviderForUser:(AWSCognitoIdentityProviderAdminDisableProviderForUserRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderAdminDisableProviderForUserResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deactivates a user and revokes all access tokens for the user. A deactivated user can't sign in, but still appears in the responses to <code>GetUser</code> and <code>ListUsers</code> API requests.</p><note><p>Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you must use IAM credentials to authorize requests, and you must grant yourself the corresponding IAM permission in a policy.</p><p class="title"><b>Learn more</b></p><ul><li><p><a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html">Signing Amazon Web Services API Requests</a></p></li><li><p><a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a></p></li></ul></note>
 
 @param request A container for the necessary parameters to execute the AdminDisableUser service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderAdminDisableUserResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderAdminDisableUserRequest
 @see AWSCognitoIdentityProviderAdminDisableUserResponse
 */
- (AWSTask<AWSCognitoIdentityProviderAdminDisableUserResponse *> *)adminDisableUser:(AWSCognitoIdentityProviderAdminDisableUserRequest *)request;

/**
 <p>Deactivates a user and revokes all access tokens for the user. A deactivated user can't sign in, but still appears in the responses to <code>GetUser</code> and <code>ListUsers</code> API requests.</p><note><p>Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you must use IAM credentials to authorize requests, and you must grant yourself the corresponding IAM permission in a policy.</p><p class="title"><b>Learn more</b></p><ul><li><p><a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html">Signing Amazon Web Services API Requests</a></p></li><li><p><a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a></p></li></ul></note>
 
 @param request A container for the necessary parameters to execute the AdminDisableUser service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderAdminDisableUserRequest
 @see AWSCognitoIdentityProviderAdminDisableUserResponse
 */
- (void)adminDisableUser:(AWSCognitoIdentityProviderAdminDisableUserRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderAdminDisableUserResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Enables the specified user as an administrator. Works on any user.</p><note><p>Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you must use IAM credentials to authorize requests, and you must grant yourself the corresponding IAM permission in a policy.</p><p class="title"><b>Learn more</b></p><ul><li><p><a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html">Signing Amazon Web Services API Requests</a></p></li><li><p><a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a></p></li></ul></note>
 
 @param request A container for the necessary parameters to execute the AdminEnableUser service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderAdminEnableUserResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderAdminEnableUserRequest
 @see AWSCognitoIdentityProviderAdminEnableUserResponse
 */
- (AWSTask<AWSCognitoIdentityProviderAdminEnableUserResponse *> *)adminEnableUser:(AWSCognitoIdentityProviderAdminEnableUserRequest *)request;

/**
 <p>Enables the specified user as an administrator. Works on any user.</p><note><p>Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you must use IAM credentials to authorize requests, and you must grant yourself the corresponding IAM permission in a policy.</p><p class="title"><b>Learn more</b></p><ul><li><p><a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html">Signing Amazon Web Services API Requests</a></p></li><li><p><a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a></p></li></ul></note>
 
 @param request A container for the necessary parameters to execute the AdminEnableUser service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderAdminEnableUserRequest
 @see AWSCognitoIdentityProviderAdminEnableUserResponse
 */
- (void)adminEnableUser:(AWSCognitoIdentityProviderAdminEnableUserRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderAdminEnableUserResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Forgets the device, as an administrator.</p><note><p>Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you must use IAM credentials to authorize requests, and you must grant yourself the corresponding IAM permission in a policy.</p><p class="title"><b>Learn more</b></p><ul><li><p><a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html">Signing Amazon Web Services API Requests</a></p></li><li><p><a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a></p></li></ul></note>
 
 @param request A container for the necessary parameters to execute the AdminForgetDevice service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorInvalidUserPoolConfiguration`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderAdminForgetDeviceRequest
 */
- (AWSTask *)adminForgetDevice:(AWSCognitoIdentityProviderAdminForgetDeviceRequest *)request;

/**
 <p>Forgets the device, as an administrator.</p><note><p>Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you must use IAM credentials to authorize requests, and you must grant yourself the corresponding IAM permission in a policy.</p><p class="title"><b>Learn more</b></p><ul><li><p><a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html">Signing Amazon Web Services API Requests</a></p></li><li><p><a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a></p></li></ul></note>
 
 @param request A container for the necessary parameters to execute the AdminForgetDevice service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorInvalidUserPoolConfiguration`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderAdminForgetDeviceRequest
 */
- (void)adminForgetDevice:(AWSCognitoIdentityProviderAdminForgetDeviceRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Gets the device, as an administrator.</p><note><p>Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you must use IAM credentials to authorize requests, and you must grant yourself the corresponding IAM permission in a policy.</p><p class="title"><b>Learn more</b></p><ul><li><p><a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html">Signing Amazon Web Services API Requests</a></p></li><li><p><a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a></p></li></ul></note>
 
 @param request A container for the necessary parameters to execute the AdminGetDevice service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderAdminGetDeviceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorInvalidUserPoolConfiguration`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`, `AWSCognitoIdentityProviderErrorNotAuthorized`.
 
 @see AWSCognitoIdentityProviderAdminGetDeviceRequest
 @see AWSCognitoIdentityProviderAdminGetDeviceResponse
 */
- (AWSTask<AWSCognitoIdentityProviderAdminGetDeviceResponse *> *)adminGetDevice:(AWSCognitoIdentityProviderAdminGetDeviceRequest *)request;

/**
 <p>Gets the device, as an administrator.</p><note><p>Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you must use IAM credentials to authorize requests, and you must grant yourself the corresponding IAM permission in a policy.</p><p class="title"><b>Learn more</b></p><ul><li><p><a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html">Signing Amazon Web Services API Requests</a></p></li><li><p><a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a></p></li></ul></note>
 
 @param request A container for the necessary parameters to execute the AdminGetDevice service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorInvalidUserPoolConfiguration`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`, `AWSCognitoIdentityProviderErrorNotAuthorized`.
 
 @see AWSCognitoIdentityProviderAdminGetDeviceRequest
 @see AWSCognitoIdentityProviderAdminGetDeviceResponse
 */
- (void)adminGetDevice:(AWSCognitoIdentityProviderAdminGetDeviceRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderAdminGetDeviceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets the specified user by user name in a user pool as an administrator. Works on any user.</p><note><p>Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you must use IAM credentials to authorize requests, and you must grant yourself the corresponding IAM permission in a policy.</p><p class="title"><b>Learn more</b></p><ul><li><p><a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html">Signing Amazon Web Services API Requests</a></p></li><li><p><a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a></p></li></ul></note>
 
 @param request A container for the necessary parameters to execute the AdminGetUser service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderAdminGetUserResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderAdminGetUserRequest
 @see AWSCognitoIdentityProviderAdminGetUserResponse
 */
- (AWSTask<AWSCognitoIdentityProviderAdminGetUserResponse *> *)adminGetUser:(AWSCognitoIdentityProviderAdminGetUserRequest *)request;

/**
 <p>Gets the specified user by user name in a user pool as an administrator. Works on any user.</p><note><p>Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you must use IAM credentials to authorize requests, and you must grant yourself the corresponding IAM permission in a policy.</p><p class="title"><b>Learn more</b></p><ul><li><p><a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html">Signing Amazon Web Services API Requests</a></p></li><li><p><a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a></p></li></ul></note>
 
 @param request A container for the necessary parameters to execute the AdminGetUser service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderAdminGetUserRequest
 @see AWSCognitoIdentityProviderAdminGetUserResponse
 */
- (void)adminGetUser:(AWSCognitoIdentityProviderAdminGetUserRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderAdminGetUserResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Initiates the authentication flow, as an administrator.</p><note><p>This action might generate an SMS text message. Starting June 1, 2021, US telecom carriers require you to register an origination phone number before you can send SMS messages to US phone numbers. If you use SMS text messages in Amazon Cognito, you must register a phone number with <a href="https://console.aws.amazon.com/pinpoint/home/">Amazon Pinpoint</a>. Amazon Cognito uses the registered number automatically. Otherwise, Amazon Cognito users who must receive SMS messages might not be able to sign up, activate their accounts, or sign in.</p><p>If you have never used SMS text messages with Amazon Cognito or any other Amazon Web Service, Amazon Simple Notification Service might place your account in the SMS sandbox. In <i><a href="https://docs.aws.amazon.com/sns/latest/dg/sns-sms-sandbox.html">sandbox mode</a></i>, you can send messages only to verified phone numbers. After you test your app while in the sandbox environment, you can move out of the sandbox and into production. For more information, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pool-sms-settings.html"> SMS message settings for Amazon Cognito user pools</a> in the <i>Amazon Cognito Developer Guide</i>.</p></note><note><p>Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you must use IAM credentials to authorize requests, and you must grant yourself the corresponding IAM permission in a policy.</p><p class="title"><b>Learn more</b></p><ul><li><p><a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html">Signing Amazon Web Services API Requests</a></p></li><li><p><a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a></p></li></ul></note>
 
 @param request A container for the necessary parameters to execute the AdminInitiateAuth service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderAdminInitiateAuthResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`, `AWSCognitoIdentityProviderErrorUnexpectedLambda`, `AWSCognitoIdentityProviderErrorInvalidUserPoolConfiguration`, `AWSCognitoIdentityProviderErrorUserLambdaValidation`, `AWSCognitoIdentityProviderErrorInvalidLambdaResponse`, `AWSCognitoIdentityProviderErrorMFAMethodNotFound`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleAccessPolicy`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleTrustRelationship`, `AWSCognitoIdentityProviderErrorPasswordResetRequired`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorUserNotConfirmed`.
 
 @see AWSCognitoIdentityProviderAdminInitiateAuthRequest
 @see AWSCognitoIdentityProviderAdminInitiateAuthResponse
 */
- (AWSTask<AWSCognitoIdentityProviderAdminInitiateAuthResponse *> *)adminInitiateAuth:(AWSCognitoIdentityProviderAdminInitiateAuthRequest *)request;

/**
 <p>Initiates the authentication flow, as an administrator.</p><note><p>This action might generate an SMS text message. Starting June 1, 2021, US telecom carriers require you to register an origination phone number before you can send SMS messages to US phone numbers. If you use SMS text messages in Amazon Cognito, you must register a phone number with <a href="https://console.aws.amazon.com/pinpoint/home/">Amazon Pinpoint</a>. Amazon Cognito uses the registered number automatically. Otherwise, Amazon Cognito users who must receive SMS messages might not be able to sign up, activate their accounts, or sign in.</p><p>If you have never used SMS text messages with Amazon Cognito or any other Amazon Web Service, Amazon Simple Notification Service might place your account in the SMS sandbox. In <i><a href="https://docs.aws.amazon.com/sns/latest/dg/sns-sms-sandbox.html">sandbox mode</a></i>, you can send messages only to verified phone numbers. After you test your app while in the sandbox environment, you can move out of the sandbox and into production. For more information, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pool-sms-settings.html"> SMS message settings for Amazon Cognito user pools</a> in the <i>Amazon Cognito Developer Guide</i>.</p></note><note><p>Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you must use IAM credentials to authorize requests, and you must grant yourself the corresponding IAM permission in a policy.</p><p class="title"><b>Learn more</b></p><ul><li><p><a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html">Signing Amazon Web Services API Requests</a></p></li><li><p><a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a></p></li></ul></note>
 
 @param request A container for the necessary parameters to execute the AdminInitiateAuth service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`, `AWSCognitoIdentityProviderErrorUnexpectedLambda`, `AWSCognitoIdentityProviderErrorInvalidUserPoolConfiguration`, `AWSCognitoIdentityProviderErrorUserLambdaValidation`, `AWSCognitoIdentityProviderErrorInvalidLambdaResponse`, `AWSCognitoIdentityProviderErrorMFAMethodNotFound`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleAccessPolicy`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleTrustRelationship`, `AWSCognitoIdentityProviderErrorPasswordResetRequired`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorUserNotConfirmed`.
 
 @see AWSCognitoIdentityProviderAdminInitiateAuthRequest
 @see AWSCognitoIdentityProviderAdminInitiateAuthResponse
 */
- (void)adminInitiateAuth:(AWSCognitoIdentityProviderAdminInitiateAuthRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderAdminInitiateAuthResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Links an existing user account in a user pool (<code>DestinationUser</code>) to an identity from an external IdP (<code>SourceUser</code>) based on a specified attribute name and value from the external IdP. This allows you to create a link from the existing user account to an external federated user identity that has not yet been used to sign in. You can then use the federated user identity to sign in as the existing user account. </p><p> For example, if there is an existing user with a username and password, this API links that user to a federated user identity. When the user signs in with a federated user identity, they sign in as the existing user account.</p><note><p>The maximum number of federated identities linked to a user is five.</p></note><important><p>Because this API allows a user with an external federated identity to sign in as an existing user in the user pool, it is critical that it only be used with external IdPs and provider attributes that have been trusted by the application owner.</p></important><note><p>Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you must use IAM credentials to authorize requests, and you must grant yourself the corresponding IAM permission in a policy.</p><p class="title"><b>Learn more</b></p><ul><li><p><a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html">Signing Amazon Web Services API Requests</a></p></li><li><p><a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a></p></li></ul></note>
 
 @param request A container for the necessary parameters to execute the AdminLinkProviderForUser service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderAdminLinkProviderForUserResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorAliasExists`, `AWSCognitoIdentityProviderErrorLimitExceeded`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderAdminLinkProviderForUserRequest
 @see AWSCognitoIdentityProviderAdminLinkProviderForUserResponse
 */
- (AWSTask<AWSCognitoIdentityProviderAdminLinkProviderForUserResponse *> *)adminLinkProviderForUser:(AWSCognitoIdentityProviderAdminLinkProviderForUserRequest *)request;

/**
 <p>Links an existing user account in a user pool (<code>DestinationUser</code>) to an identity from an external IdP (<code>SourceUser</code>) based on a specified attribute name and value from the external IdP. This allows you to create a link from the existing user account to an external federated user identity that has not yet been used to sign in. You can then use the federated user identity to sign in as the existing user account. </p><p> For example, if there is an existing user with a username and password, this API links that user to a federated user identity. When the user signs in with a federated user identity, they sign in as the existing user account.</p><note><p>The maximum number of federated identities linked to a user is five.</p></note><important><p>Because this API allows a user with an external federated identity to sign in as an existing user in the user pool, it is critical that it only be used with external IdPs and provider attributes that have been trusted by the application owner.</p></important><note><p>Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you must use IAM credentials to authorize requests, and you must grant yourself the corresponding IAM permission in a policy.</p><p class="title"><b>Learn more</b></p><ul><li><p><a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html">Signing Amazon Web Services API Requests</a></p></li><li><p><a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a></p></li></ul></note>
 
 @param request A container for the necessary parameters to execute the AdminLinkProviderForUser service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorAliasExists`, `AWSCognitoIdentityProviderErrorLimitExceeded`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderAdminLinkProviderForUserRequest
 @see AWSCognitoIdentityProviderAdminLinkProviderForUserResponse
 */
- (void)adminLinkProviderForUser:(AWSCognitoIdentityProviderAdminLinkProviderForUserRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderAdminLinkProviderForUserResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists devices, as an administrator.</p><note><p>Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you must use IAM credentials to authorize requests, and you must grant yourself the corresponding IAM permission in a policy.</p><p class="title"><b>Learn more</b></p><ul><li><p><a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html">Signing Amazon Web Services API Requests</a></p></li><li><p><a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a></p></li></ul></note>
 
 @param request A container for the necessary parameters to execute the AdminListDevices service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderAdminListDevicesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidUserPoolConfiguration`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`, `AWSCognitoIdentityProviderErrorNotAuthorized`.
 
 @see AWSCognitoIdentityProviderAdminListDevicesRequest
 @see AWSCognitoIdentityProviderAdminListDevicesResponse
 */
- (AWSTask<AWSCognitoIdentityProviderAdminListDevicesResponse *> *)adminListDevices:(AWSCognitoIdentityProviderAdminListDevicesRequest *)request;

/**
 <p>Lists devices, as an administrator.</p><note><p>Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you must use IAM credentials to authorize requests, and you must grant yourself the corresponding IAM permission in a policy.</p><p class="title"><b>Learn more</b></p><ul><li><p><a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html">Signing Amazon Web Services API Requests</a></p></li><li><p><a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a></p></li></ul></note>
 
 @param request A container for the necessary parameters to execute the AdminListDevices service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidUserPoolConfiguration`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`, `AWSCognitoIdentityProviderErrorNotAuthorized`.
 
 @see AWSCognitoIdentityProviderAdminListDevicesRequest
 @see AWSCognitoIdentityProviderAdminListDevicesResponse
 */
- (void)adminListDevices:(AWSCognitoIdentityProviderAdminListDevicesRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderAdminListDevicesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the groups that a user belongs to.</p><note><p>Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you must use IAM credentials to authorize requests, and you must grant yourself the corresponding IAM permission in a policy.</p><p class="title"><b>Learn more</b></p><ul><li><p><a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html">Signing Amazon Web Services API Requests</a></p></li><li><p><a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a></p></li></ul></note>
 
 @param request A container for the necessary parameters to execute the AdminListGroupsForUser service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderAdminListGroupsForUserResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderAdminListGroupsForUserRequest
 @see AWSCognitoIdentityProviderAdminListGroupsForUserResponse
 */
- (AWSTask<AWSCognitoIdentityProviderAdminListGroupsForUserResponse *> *)adminListGroupsForUser:(AWSCognitoIdentityProviderAdminListGroupsForUserRequest *)request;

/**
 <p>Lists the groups that a user belongs to.</p><note><p>Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you must use IAM credentials to authorize requests, and you must grant yourself the corresponding IAM permission in a policy.</p><p class="title"><b>Learn more</b></p><ul><li><p><a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html">Signing Amazon Web Services API Requests</a></p></li><li><p><a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a></p></li></ul></note>
 
 @param request A container for the necessary parameters to execute the AdminListGroupsForUser service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderAdminListGroupsForUserRequest
 @see AWSCognitoIdentityProviderAdminListGroupsForUserResponse
 */
- (void)adminListGroupsForUser:(AWSCognitoIdentityProviderAdminListGroupsForUserRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderAdminListGroupsForUserResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>A history of user activity and any risks detected as part of Amazon Cognito advanced security.</p><note><p>Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you must use IAM credentials to authorize requests, and you must grant yourself the corresponding IAM permission in a policy.</p><p class="title"><b>Learn more</b></p><ul><li><p><a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html">Signing Amazon Web Services API Requests</a></p></li><li><p><a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a></p></li></ul></note>
 
 @param request A container for the necessary parameters to execute the AdminListUserAuthEvents service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderAdminListUserAuthEventsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorUserPoolAddOnNotEnabled`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderAdminListUserAuthEventsRequest
 @see AWSCognitoIdentityProviderAdminListUserAuthEventsResponse
 */
- (AWSTask<AWSCognitoIdentityProviderAdminListUserAuthEventsResponse *> *)adminListUserAuthEvents:(AWSCognitoIdentityProviderAdminListUserAuthEventsRequest *)request;

/**
 <p>A history of user activity and any risks detected as part of Amazon Cognito advanced security.</p><note><p>Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you must use IAM credentials to authorize requests, and you must grant yourself the corresponding IAM permission in a policy.</p><p class="title"><b>Learn more</b></p><ul><li><p><a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html">Signing Amazon Web Services API Requests</a></p></li><li><p><a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a></p></li></ul></note>
 
 @param request A container for the necessary parameters to execute the AdminListUserAuthEvents service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorUserPoolAddOnNotEnabled`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderAdminListUserAuthEventsRequest
 @see AWSCognitoIdentityProviderAdminListUserAuthEventsResponse
 */
- (void)adminListUserAuthEvents:(AWSCognitoIdentityProviderAdminListUserAuthEventsRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderAdminListUserAuthEventsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Removes the specified user from the specified group.</p><note><p>Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you must use IAM credentials to authorize requests, and you must grant yourself the corresponding IAM permission in a policy.</p><p class="title"><b>Learn more</b></p><ul><li><p><a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html">Signing Amazon Web Services API Requests</a></p></li><li><p><a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a></p></li></ul></note>
 
 @param request A container for the necessary parameters to execute the AdminRemoveUserFromGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderAdminRemoveUserFromGroupRequest
 */
- (AWSTask *)adminRemoveUserFromGroup:(AWSCognitoIdentityProviderAdminRemoveUserFromGroupRequest *)request;

/**
 <p>Removes the specified user from the specified group.</p><note><p>Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you must use IAM credentials to authorize requests, and you must grant yourself the corresponding IAM permission in a policy.</p><p class="title"><b>Learn more</b></p><ul><li><p><a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html">Signing Amazon Web Services API Requests</a></p></li><li><p><a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a></p></li></ul></note>
 
 @param request A container for the necessary parameters to execute the AdminRemoveUserFromGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderAdminRemoveUserFromGroupRequest
 */
- (void)adminRemoveUserFromGroup:(AWSCognitoIdentityProviderAdminRemoveUserFromGroupRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Resets the specified user's password in a user pool as an administrator. Works on any user.</p><p>To use this API operation, your user pool must have self-service account recovery configured. Use <a href="https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_AdminSetUserPassword.html">AdminSetUserPassword</a> if you manage passwords as an administrator.</p><note><p>This action might generate an SMS text message. Starting June 1, 2021, US telecom carriers require you to register an origination phone number before you can send SMS messages to US phone numbers. If you use SMS text messages in Amazon Cognito, you must register a phone number with <a href="https://console.aws.amazon.com/pinpoint/home/">Amazon Pinpoint</a>. Amazon Cognito uses the registered number automatically. Otherwise, Amazon Cognito users who must receive SMS messages might not be able to sign up, activate their accounts, or sign in.</p><p>If you have never used SMS text messages with Amazon Cognito or any other Amazon Web Service, Amazon Simple Notification Service might place your account in the SMS sandbox. In <i><a href="https://docs.aws.amazon.com/sns/latest/dg/sns-sms-sandbox.html">sandbox mode</a></i>, you can send messages only to verified phone numbers. After you test your app while in the sandbox environment, you can move out of the sandbox and into production. For more information, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pool-sms-settings.html"> SMS message settings for Amazon Cognito user pools</a> in the <i>Amazon Cognito Developer Guide</i>.</p></note><p>Deactivates a user's password, requiring them to change it. If a user tries to sign in after the API is called, Amazon Cognito responds with a <code>PasswordResetRequiredException</code> error. Your app must then perform the actions that reset your user's password: the forgot-password flow. In addition, if the user pool has phone verification selected and a verified phone number exists for the user, or if email verification is selected and a verified email exists for the user, calling this API will also result in sending a message to the end user with the code to change their password.</p><note><p>Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you must use IAM credentials to authorize requests, and you must grant yourself the corresponding IAM permission in a policy.</p><p class="title"><b>Learn more</b></p><ul><li><p><a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html">Signing Amazon Web Services API Requests</a></p></li><li><p><a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a></p></li></ul></note>
 
 @param request A container for the necessary parameters to execute the AdminResetUserPassword service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderAdminResetUserPasswordResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorUnexpectedLambda`, `AWSCognitoIdentityProviderErrorUserLambdaValidation`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorInvalidLambdaResponse`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorLimitExceeded`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleAccessPolicy`, `AWSCognitoIdentityProviderErrorInvalidEmailRoleAccessPolicy`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleTrustRelationship`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderAdminResetUserPasswordRequest
 @see AWSCognitoIdentityProviderAdminResetUserPasswordResponse
 */
- (AWSTask<AWSCognitoIdentityProviderAdminResetUserPasswordResponse *> *)adminResetUserPassword:(AWSCognitoIdentityProviderAdminResetUserPasswordRequest *)request;

/**
 <p>Resets the specified user's password in a user pool as an administrator. Works on any user.</p><p>To use this API operation, your user pool must have self-service account recovery configured. Use <a href="https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_AdminSetUserPassword.html">AdminSetUserPassword</a> if you manage passwords as an administrator.</p><note><p>This action might generate an SMS text message. Starting June 1, 2021, US telecom carriers require you to register an origination phone number before you can send SMS messages to US phone numbers. If you use SMS text messages in Amazon Cognito, you must register a phone number with <a href="https://console.aws.amazon.com/pinpoint/home/">Amazon Pinpoint</a>. Amazon Cognito uses the registered number automatically. Otherwise, Amazon Cognito users who must receive SMS messages might not be able to sign up, activate their accounts, or sign in.</p><p>If you have never used SMS text messages with Amazon Cognito or any other Amazon Web Service, Amazon Simple Notification Service might place your account in the SMS sandbox. In <i><a href="https://docs.aws.amazon.com/sns/latest/dg/sns-sms-sandbox.html">sandbox mode</a></i>, you can send messages only to verified phone numbers. After you test your app while in the sandbox environment, you can move out of the sandbox and into production. For more information, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pool-sms-settings.html"> SMS message settings for Amazon Cognito user pools</a> in the <i>Amazon Cognito Developer Guide</i>.</p></note><p>Deactivates a user's password, requiring them to change it. If a user tries to sign in after the API is called, Amazon Cognito responds with a <code>PasswordResetRequiredException</code> error. Your app must then perform the actions that reset your user's password: the forgot-password flow. In addition, if the user pool has phone verification selected and a verified phone number exists for the user, or if email verification is selected and a verified email exists for the user, calling this API will also result in sending a message to the end user with the code to change their password.</p><note><p>Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you must use IAM credentials to authorize requests, and you must grant yourself the corresponding IAM permission in a policy.</p><p class="title"><b>Learn more</b></p><ul><li><p><a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html">Signing Amazon Web Services API Requests</a></p></li><li><p><a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a></p></li></ul></note>
 
 @param request A container for the necessary parameters to execute the AdminResetUserPassword service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorUnexpectedLambda`, `AWSCognitoIdentityProviderErrorUserLambdaValidation`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorInvalidLambdaResponse`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorLimitExceeded`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleAccessPolicy`, `AWSCognitoIdentityProviderErrorInvalidEmailRoleAccessPolicy`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleTrustRelationship`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderAdminResetUserPasswordRequest
 @see AWSCognitoIdentityProviderAdminResetUserPasswordResponse
 */
- (void)adminResetUserPassword:(AWSCognitoIdentityProviderAdminResetUserPasswordRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderAdminResetUserPasswordResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Some API operations in a user pool generate a challenge, like a prompt for an MFA code, for device authentication that bypasses MFA, or for a custom authentication challenge. An <code>AdminRespondToAuthChallenge</code> API request provides the answer to that challenge, like a code or a secure remote password (SRP). The parameters of a response to an authentication challenge vary with the type of challenge.</p><p>For more information about custom authentication challenges, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pool-lambda-challenge.html">Custom authentication challenge Lambda triggers</a>.</p><note><p>This action might generate an SMS text message. Starting June 1, 2021, US telecom carriers require you to register an origination phone number before you can send SMS messages to US phone numbers. If you use SMS text messages in Amazon Cognito, you must register a phone number with <a href="https://console.aws.amazon.com/pinpoint/home/">Amazon Pinpoint</a>. Amazon Cognito uses the registered number automatically. Otherwise, Amazon Cognito users who must receive SMS messages might not be able to sign up, activate their accounts, or sign in.</p><p>If you have never used SMS text messages with Amazon Cognito or any other Amazon Web Service, Amazon Simple Notification Service might place your account in the SMS sandbox. In <i><a href="https://docs.aws.amazon.com/sns/latest/dg/sns-sms-sandbox.html">sandbox mode</a></i>, you can send messages only to verified phone numbers. After you test your app while in the sandbox environment, you can move out of the sandbox and into production. For more information, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pool-sms-settings.html"> SMS message settings for Amazon Cognito user pools</a> in the <i>Amazon Cognito Developer Guide</i>.</p></note><note><p>Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you must use IAM credentials to authorize requests, and you must grant yourself the corresponding IAM permission in a policy.</p><p class="title"><b>Learn more</b></p><ul><li><p><a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html">Signing Amazon Web Services API Requests</a></p></li><li><p><a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a></p></li></ul></note>
 
 @param request A container for the necessary parameters to execute the AdminRespondToAuthChallenge service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderAdminRespondToAuthChallengeResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorCodeMismatch`, `AWSCognitoIdentityProviderErrorExpiredCode`, `AWSCognitoIdentityProviderErrorUnexpectedLambda`, `AWSCognitoIdentityProviderErrorInvalidPassword`, `AWSCognitoIdentityProviderErrorUserLambdaValidation`, `AWSCognitoIdentityProviderErrorInvalidLambdaResponse`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInvalidUserPoolConfiguration`, `AWSCognitoIdentityProviderErrorInternalError`, `AWSCognitoIdentityProviderErrorMFAMethodNotFound`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleAccessPolicy`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleTrustRelationship`, `AWSCognitoIdentityProviderErrorAliasExists`, `AWSCognitoIdentityProviderErrorPasswordResetRequired`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorUserNotConfirmed`, `AWSCognitoIdentityProviderErrorSoftwareTokenMFANotFound`.
 
 @see AWSCognitoIdentityProviderAdminRespondToAuthChallengeRequest
 @see AWSCognitoIdentityProviderAdminRespondToAuthChallengeResponse
 */
- (AWSTask<AWSCognitoIdentityProviderAdminRespondToAuthChallengeResponse *> *)adminRespondToAuthChallenge:(AWSCognitoIdentityProviderAdminRespondToAuthChallengeRequest *)request;

/**
 <p>Some API operations in a user pool generate a challenge, like a prompt for an MFA code, for device authentication that bypasses MFA, or for a custom authentication challenge. An <code>AdminRespondToAuthChallenge</code> API request provides the answer to that challenge, like a code or a secure remote password (SRP). The parameters of a response to an authentication challenge vary with the type of challenge.</p><p>For more information about custom authentication challenges, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pool-lambda-challenge.html">Custom authentication challenge Lambda triggers</a>.</p><note><p>This action might generate an SMS text message. Starting June 1, 2021, US telecom carriers require you to register an origination phone number before you can send SMS messages to US phone numbers. If you use SMS text messages in Amazon Cognito, you must register a phone number with <a href="https://console.aws.amazon.com/pinpoint/home/">Amazon Pinpoint</a>. Amazon Cognito uses the registered number automatically. Otherwise, Amazon Cognito users who must receive SMS messages might not be able to sign up, activate their accounts, or sign in.</p><p>If you have never used SMS text messages with Amazon Cognito or any other Amazon Web Service, Amazon Simple Notification Service might place your account in the SMS sandbox. In <i><a href="https://docs.aws.amazon.com/sns/latest/dg/sns-sms-sandbox.html">sandbox mode</a></i>, you can send messages only to verified phone numbers. After you test your app while in the sandbox environment, you can move out of the sandbox and into production. For more information, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pool-sms-settings.html"> SMS message settings for Amazon Cognito user pools</a> in the <i>Amazon Cognito Developer Guide</i>.</p></note><note><p>Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you must use IAM credentials to authorize requests, and you must grant yourself the corresponding IAM permission in a policy.</p><p class="title"><b>Learn more</b></p><ul><li><p><a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html">Signing Amazon Web Services API Requests</a></p></li><li><p><a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a></p></li></ul></note>
 
 @param request A container for the necessary parameters to execute the AdminRespondToAuthChallenge service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorCodeMismatch`, `AWSCognitoIdentityProviderErrorExpiredCode`, `AWSCognitoIdentityProviderErrorUnexpectedLambda`, `AWSCognitoIdentityProviderErrorInvalidPassword`, `AWSCognitoIdentityProviderErrorUserLambdaValidation`, `AWSCognitoIdentityProviderErrorInvalidLambdaResponse`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInvalidUserPoolConfiguration`, `AWSCognitoIdentityProviderErrorInternalError`, `AWSCognitoIdentityProviderErrorMFAMethodNotFound`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleAccessPolicy`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleTrustRelationship`, `AWSCognitoIdentityProviderErrorAliasExists`, `AWSCognitoIdentityProviderErrorPasswordResetRequired`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorUserNotConfirmed`, `AWSCognitoIdentityProviderErrorSoftwareTokenMFANotFound`.
 
 @see AWSCognitoIdentityProviderAdminRespondToAuthChallengeRequest
 @see AWSCognitoIdentityProviderAdminRespondToAuthChallengeResponse
 */
- (void)adminRespondToAuthChallenge:(AWSCognitoIdentityProviderAdminRespondToAuthChallengeRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderAdminRespondToAuthChallengeResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>The user's multi-factor authentication (MFA) preference, including which MFA options are activated, and if any are preferred. Only one factor can be set as preferred. The preferred MFA factor will be used to authenticate a user if multiple factors are activated. If multiple options are activated and no preference is set, a challenge to choose an MFA option will be returned during sign-in.</p><note><p>Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you must use IAM credentials to authorize requests, and you must grant yourself the corresponding IAM permission in a policy.</p><p class="title"><b>Learn more</b></p><ul><li><p><a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html">Signing Amazon Web Services API Requests</a></p></li><li><p><a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a></p></li></ul></note>
 
 @param request A container for the necessary parameters to execute the AdminSetUserMFAPreference service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderAdminSetUserMFAPreferenceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorPasswordResetRequired`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorUserNotConfirmed`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderAdminSetUserMFAPreferenceRequest
 @see AWSCognitoIdentityProviderAdminSetUserMFAPreferenceResponse
 */
- (AWSTask<AWSCognitoIdentityProviderAdminSetUserMFAPreferenceResponse *> *)adminSetUserMFAPreference:(AWSCognitoIdentityProviderAdminSetUserMFAPreferenceRequest *)request;

/**
 <p>The user's multi-factor authentication (MFA) preference, including which MFA options are activated, and if any are preferred. Only one factor can be set as preferred. The preferred MFA factor will be used to authenticate a user if multiple factors are activated. If multiple options are activated and no preference is set, a challenge to choose an MFA option will be returned during sign-in.</p><note><p>Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you must use IAM credentials to authorize requests, and you must grant yourself the corresponding IAM permission in a policy.</p><p class="title"><b>Learn more</b></p><ul><li><p><a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html">Signing Amazon Web Services API Requests</a></p></li><li><p><a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a></p></li></ul></note>
 
 @param request A container for the necessary parameters to execute the AdminSetUserMFAPreference service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorPasswordResetRequired`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorUserNotConfirmed`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderAdminSetUserMFAPreferenceRequest
 @see AWSCognitoIdentityProviderAdminSetUserMFAPreferenceResponse
 */
- (void)adminSetUserMFAPreference:(AWSCognitoIdentityProviderAdminSetUserMFAPreferenceRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderAdminSetUserMFAPreferenceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Sets the specified user's password in a user pool as an administrator. Works on any user. </p><p>The password can be temporary or permanent. If it is temporary, the user status enters the <code>FORCE_CHANGE_PASSWORD</code> state. When the user next tries to sign in, the InitiateAuth/AdminInitiateAuth response will contain the <code>NEW_PASSWORD_REQUIRED</code> challenge. If the user doesn't sign in before it expires, the user won't be able to sign in, and an administrator must reset their password. </p><p>Once the user has set a new password, or the password is permanent, the user status is set to <code>Confirmed</code>.</p><p><code>AdminSetUserPassword</code> can set a password for the user profile that Amazon Cognito creates for third-party federated users. When you set a password, the federated user's status changes from <code>EXTERNAL_PROVIDER</code> to <code>CONFIRMED</code>. A user in this state can sign in as a federated user, and initiate authentication flows in the API like a linked native user. They can also modify their password and attributes in token-authenticated API requests like <code>ChangePassword</code> and <code>UpdateUserAttributes</code>. As a best security practice and to keep users in sync with your external IdP, don't set passwords on federated user profiles. To set up a federated user for native sign-in with a linked native user, refer to <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pools-identity-federation-consolidate-users.html">Linking federated users to an existing user profile</a>.</p><note><p>Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you must use IAM credentials to authorize requests, and you must grant yourself the corresponding IAM permission in a policy.</p><p class="title"><b>Learn more</b></p><ul><li><p><a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html">Signing Amazon Web Services API Requests</a></p></li><li><p><a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a></p></li></ul></note>
 
 @param request A container for the necessary parameters to execute the AdminSetUserPassword service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderAdminSetUserPasswordResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorInternalError`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorInvalidPassword`.
 
 @see AWSCognitoIdentityProviderAdminSetUserPasswordRequest
 @see AWSCognitoIdentityProviderAdminSetUserPasswordResponse
 */
- (AWSTask<AWSCognitoIdentityProviderAdminSetUserPasswordResponse *> *)adminSetUserPassword:(AWSCognitoIdentityProviderAdminSetUserPasswordRequest *)request;

/**
 <p>Sets the specified user's password in a user pool as an administrator. Works on any user. </p><p>The password can be temporary or permanent. If it is temporary, the user status enters the <code>FORCE_CHANGE_PASSWORD</code> state. When the user next tries to sign in, the InitiateAuth/AdminInitiateAuth response will contain the <code>NEW_PASSWORD_REQUIRED</code> challenge. If the user doesn't sign in before it expires, the user won't be able to sign in, and an administrator must reset their password. </p><p>Once the user has set a new password, or the password is permanent, the user status is set to <code>Confirmed</code>.</p><p><code>AdminSetUserPassword</code> can set a password for the user profile that Amazon Cognito creates for third-party federated users. When you set a password, the federated user's status changes from <code>EXTERNAL_PROVIDER</code> to <code>CONFIRMED</code>. A user in this state can sign in as a federated user, and initiate authentication flows in the API like a linked native user. They can also modify their password and attributes in token-authenticated API requests like <code>ChangePassword</code> and <code>UpdateUserAttributes</code>. As a best security practice and to keep users in sync with your external IdP, don't set passwords on federated user profiles. To set up a federated user for native sign-in with a linked native user, refer to <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pools-identity-federation-consolidate-users.html">Linking federated users to an existing user profile</a>.</p><note><p>Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you must use IAM credentials to authorize requests, and you must grant yourself the corresponding IAM permission in a policy.</p><p class="title"><b>Learn more</b></p><ul><li><p><a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html">Signing Amazon Web Services API Requests</a></p></li><li><p><a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a></p></li></ul></note>
 
 @param request A container for the necessary parameters to execute the AdminSetUserPassword service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorInternalError`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorInvalidPassword`.
 
 @see AWSCognitoIdentityProviderAdminSetUserPasswordRequest
 @see AWSCognitoIdentityProviderAdminSetUserPasswordResponse
 */
- (void)adminSetUserPassword:(AWSCognitoIdentityProviderAdminSetUserPasswordRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderAdminSetUserPasswordResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p><i>This action is no longer supported.</i> You can use it to configure only SMS MFA. You can't use it to configure time-based one-time password (TOTP) software token MFA. To configure either type of MFA, use <a href="https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_AdminSetUserMFAPreference.html">AdminSetUserMFAPreference</a> instead.</p><note><p>Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you must use IAM credentials to authorize requests, and you must grant yourself the corresponding IAM permission in a policy.</p><p class="title"><b>Learn more</b></p><ul><li><p><a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html">Signing Amazon Web Services API Requests</a></p></li><li><p><a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a></p></li></ul></note>
 
 @param request A container for the necessary parameters to execute the AdminSetUserSettings service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderAdminSetUserSettingsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderAdminSetUserSettingsRequest
 @see AWSCognitoIdentityProviderAdminSetUserSettingsResponse
 */
- (AWSTask<AWSCognitoIdentityProviderAdminSetUserSettingsResponse *> *)adminSetUserSettings:(AWSCognitoIdentityProviderAdminSetUserSettingsRequest *)request;

/**
 <p><i>This action is no longer supported.</i> You can use it to configure only SMS MFA. You can't use it to configure time-based one-time password (TOTP) software token MFA. To configure either type of MFA, use <a href="https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_AdminSetUserMFAPreference.html">AdminSetUserMFAPreference</a> instead.</p><note><p>Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you must use IAM credentials to authorize requests, and you must grant yourself the corresponding IAM permission in a policy.</p><p class="title"><b>Learn more</b></p><ul><li><p><a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html">Signing Amazon Web Services API Requests</a></p></li><li><p><a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a></p></li></ul></note>
 
 @param request A container for the necessary parameters to execute the AdminSetUserSettings service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderAdminSetUserSettingsRequest
 @see AWSCognitoIdentityProviderAdminSetUserSettingsResponse
 */
- (void)adminSetUserSettings:(AWSCognitoIdentityProviderAdminSetUserSettingsRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderAdminSetUserSettingsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Provides feedback for an authentication event indicating if it was from a valid user. This feedback is used for improving the risk evaluation decision for the user pool as part of Amazon Cognito advanced security.</p><note><p>Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you must use IAM credentials to authorize requests, and you must grant yourself the corresponding IAM permission in a policy.</p><p class="title"><b>Learn more</b></p><ul><li><p><a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html">Signing Amazon Web Services API Requests</a></p></li><li><p><a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a></p></li></ul></note>
 
 @param request A container for the necessary parameters to execute the AdminUpdateAuthEventFeedback service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderAdminUpdateAuthEventFeedbackResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorUserPoolAddOnNotEnabled`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderAdminUpdateAuthEventFeedbackRequest
 @see AWSCognitoIdentityProviderAdminUpdateAuthEventFeedbackResponse
 */
- (AWSTask<AWSCognitoIdentityProviderAdminUpdateAuthEventFeedbackResponse *> *)adminUpdateAuthEventFeedback:(AWSCognitoIdentityProviderAdminUpdateAuthEventFeedbackRequest *)request;

/**
 <p>Provides feedback for an authentication event indicating if it was from a valid user. This feedback is used for improving the risk evaluation decision for the user pool as part of Amazon Cognito advanced security.</p><note><p>Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you must use IAM credentials to authorize requests, and you must grant yourself the corresponding IAM permission in a policy.</p><p class="title"><b>Learn more</b></p><ul><li><p><a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html">Signing Amazon Web Services API Requests</a></p></li><li><p><a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a></p></li></ul></note>
 
 @param request A container for the necessary parameters to execute the AdminUpdateAuthEventFeedback service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorUserPoolAddOnNotEnabled`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderAdminUpdateAuthEventFeedbackRequest
 @see AWSCognitoIdentityProviderAdminUpdateAuthEventFeedbackResponse
 */
- (void)adminUpdateAuthEventFeedback:(AWSCognitoIdentityProviderAdminUpdateAuthEventFeedbackRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderAdminUpdateAuthEventFeedbackResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the device status as an administrator.</p><note><p>Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you must use IAM credentials to authorize requests, and you must grant yourself the corresponding IAM permission in a policy.</p><p class="title"><b>Learn more</b></p><ul><li><p><a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html">Signing Amazon Web Services API Requests</a></p></li><li><p><a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a></p></li></ul></note>
 
 @param request A container for the necessary parameters to execute the AdminUpdateDeviceStatus service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderAdminUpdateDeviceStatusResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidUserPoolConfiguration`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderAdminUpdateDeviceStatusRequest
 @see AWSCognitoIdentityProviderAdminUpdateDeviceStatusResponse
 */
- (AWSTask<AWSCognitoIdentityProviderAdminUpdateDeviceStatusResponse *> *)adminUpdateDeviceStatus:(AWSCognitoIdentityProviderAdminUpdateDeviceStatusRequest *)request;

/**
 <p>Updates the device status as an administrator.</p><note><p>Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you must use IAM credentials to authorize requests, and you must grant yourself the corresponding IAM permission in a policy.</p><p class="title"><b>Learn more</b></p><ul><li><p><a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html">Signing Amazon Web Services API Requests</a></p></li><li><p><a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a></p></li></ul></note>
 
 @param request A container for the necessary parameters to execute the AdminUpdateDeviceStatus service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidUserPoolConfiguration`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderAdminUpdateDeviceStatusRequest
 @see AWSCognitoIdentityProviderAdminUpdateDeviceStatusResponse
 */
- (void)adminUpdateDeviceStatus:(AWSCognitoIdentityProviderAdminUpdateDeviceStatusRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderAdminUpdateDeviceStatusResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This action might generate an SMS text message. Starting June 1, 2021, US telecom carriers require you to register an origination phone number before you can send SMS messages to US phone numbers. If you use SMS text messages in Amazon Cognito, you must register a phone number with <a href="https://console.aws.amazon.com/pinpoint/home/">Amazon Pinpoint</a>. Amazon Cognito uses the registered number automatically. Otherwise, Amazon Cognito users who must receive SMS messages might not be able to sign up, activate their accounts, or sign in.</p><p>If you have never used SMS text messages with Amazon Cognito or any other Amazon Web Service, Amazon Simple Notification Service might place your account in the SMS sandbox. In <i><a href="https://docs.aws.amazon.com/sns/latest/dg/sns-sms-sandbox.html">sandbox mode</a></i>, you can send messages only to verified phone numbers. After you test your app while in the sandbox environment, you can move out of the sandbox and into production. For more information, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pool-sms-settings.html"> SMS message settings for Amazon Cognito user pools</a> in the <i>Amazon Cognito Developer Guide</i>.</p></note><p>Updates the specified user's attributes, including developer attributes, as an administrator. Works on any user. To delete an attribute from your user, submit the attribute in your API request with a blank value.</p><p>For custom attributes, you must prepend the <code>custom:</code> prefix to the attribute name.</p><p>In addition to updating user attributes, this API can also be used to mark phone and email as verified.</p><note><p>Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you must use IAM credentials to authorize requests, and you must grant yourself the corresponding IAM permission in a policy.</p><p class="title"><b>Learn more</b></p><ul><li><p><a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html">Signing Amazon Web Services API Requests</a></p></li><li><p><a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a></p></li></ul></note>
 
 @param request A container for the necessary parameters to execute the AdminUpdateUserAttributes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderAdminUpdateUserAttributesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorUnexpectedLambda`, `AWSCognitoIdentityProviderErrorUserLambdaValidation`, `AWSCognitoIdentityProviderErrorInvalidLambdaResponse`, `AWSCognitoIdentityProviderErrorAliasExists`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorInternalError`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleAccessPolicy`, `AWSCognitoIdentityProviderErrorInvalidEmailRoleAccessPolicy`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleTrustRelationship`.
 
 @see AWSCognitoIdentityProviderAdminUpdateUserAttributesRequest
 @see AWSCognitoIdentityProviderAdminUpdateUserAttributesResponse
 */
- (AWSTask<AWSCognitoIdentityProviderAdminUpdateUserAttributesResponse *> *)adminUpdateUserAttributes:(AWSCognitoIdentityProviderAdminUpdateUserAttributesRequest *)request;

/**
 <note><p>This action might generate an SMS text message. Starting June 1, 2021, US telecom carriers require you to register an origination phone number before you can send SMS messages to US phone numbers. If you use SMS text messages in Amazon Cognito, you must register a phone number with <a href="https://console.aws.amazon.com/pinpoint/home/">Amazon Pinpoint</a>. Amazon Cognito uses the registered number automatically. Otherwise, Amazon Cognito users who must receive SMS messages might not be able to sign up, activate their accounts, or sign in.</p><p>If you have never used SMS text messages with Amazon Cognito or any other Amazon Web Service, Amazon Simple Notification Service might place your account in the SMS sandbox. In <i><a href="https://docs.aws.amazon.com/sns/latest/dg/sns-sms-sandbox.html">sandbox mode</a></i>, you can send messages only to verified phone numbers. After you test your app while in the sandbox environment, you can move out of the sandbox and into production. For more information, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pool-sms-settings.html"> SMS message settings for Amazon Cognito user pools</a> in the <i>Amazon Cognito Developer Guide</i>.</p></note><p>Updates the specified user's attributes, including developer attributes, as an administrator. Works on any user. To delete an attribute from your user, submit the attribute in your API request with a blank value.</p><p>For custom attributes, you must prepend the <code>custom:</code> prefix to the attribute name.</p><p>In addition to updating user attributes, this API can also be used to mark phone and email as verified.</p><note><p>Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you must use IAM credentials to authorize requests, and you must grant yourself the corresponding IAM permission in a policy.</p><p class="title"><b>Learn more</b></p><ul><li><p><a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html">Signing Amazon Web Services API Requests</a></p></li><li><p><a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a></p></li></ul></note>
 
 @param request A container for the necessary parameters to execute the AdminUpdateUserAttributes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorUnexpectedLambda`, `AWSCognitoIdentityProviderErrorUserLambdaValidation`, `AWSCognitoIdentityProviderErrorInvalidLambdaResponse`, `AWSCognitoIdentityProviderErrorAliasExists`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorInternalError`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleAccessPolicy`, `AWSCognitoIdentityProviderErrorInvalidEmailRoleAccessPolicy`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleTrustRelationship`.
 
 @see AWSCognitoIdentityProviderAdminUpdateUserAttributesRequest
 @see AWSCognitoIdentityProviderAdminUpdateUserAttributesResponse
 */
- (void)adminUpdateUserAttributes:(AWSCognitoIdentityProviderAdminUpdateUserAttributesRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderAdminUpdateUserAttributesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Invalidates the identity, access, and refresh tokens that Amazon Cognito issued to a user. Call this operation with your administrative credentials when your user signs out of your app. This results in the following behavior. </p><ul><li><p>Amazon Cognito no longer accepts <i>token-authorized</i> user operations that you authorize with a signed-out user's access tokens. For more information, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a>.</p><p>Amazon Cognito returns an <code>Access Token has been revoked</code> error when your app attempts to authorize a user pools API request with a revoked access token that contains the scope <code>aws.cognito.signin.user.admin</code>.</p></li><li><p>Amazon Cognito no longer accepts a signed-out user's ID token in a <a href="https://docs.aws.amazon.com/cognitoidentity/latest/APIReference/API_GetId.html">GetId </a> request to an identity pool with <code>ServerSideTokenCheck</code> enabled for its user pool IdP configuration in <a href="https://docs.aws.amazon.com/cognitoidentity/latest/APIReference/API_CognitoIdentityProvider.html">CognitoIdentityProvider</a>.</p></li><li><p>Amazon Cognito no longer accepts a signed-out user's refresh tokens in refresh requests.</p></li></ul><p>Other requests might be valid until your user's token expires.</p><note><p>Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you must use IAM credentials to authorize requests, and you must grant yourself the corresponding IAM permission in a policy.</p><p class="title"><b>Learn more</b></p><ul><li><p><a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html">Signing Amazon Web Services API Requests</a></p></li><li><p><a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a></p></li></ul></note>
 
 @param request A container for the necessary parameters to execute the AdminUserGlobalSignOut service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderAdminUserGlobalSignOutResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderAdminUserGlobalSignOutRequest
 @see AWSCognitoIdentityProviderAdminUserGlobalSignOutResponse
 */
- (AWSTask<AWSCognitoIdentityProviderAdminUserGlobalSignOutResponse *> *)adminUserGlobalSignOut:(AWSCognitoIdentityProviderAdminUserGlobalSignOutRequest *)request;

/**
 <p>Invalidates the identity, access, and refresh tokens that Amazon Cognito issued to a user. Call this operation with your administrative credentials when your user signs out of your app. This results in the following behavior. </p><ul><li><p>Amazon Cognito no longer accepts <i>token-authorized</i> user operations that you authorize with a signed-out user's access tokens. For more information, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a>.</p><p>Amazon Cognito returns an <code>Access Token has been revoked</code> error when your app attempts to authorize a user pools API request with a revoked access token that contains the scope <code>aws.cognito.signin.user.admin</code>.</p></li><li><p>Amazon Cognito no longer accepts a signed-out user's ID token in a <a href="https://docs.aws.amazon.com/cognitoidentity/latest/APIReference/API_GetId.html">GetId </a> request to an identity pool with <code>ServerSideTokenCheck</code> enabled for its user pool IdP configuration in <a href="https://docs.aws.amazon.com/cognitoidentity/latest/APIReference/API_CognitoIdentityProvider.html">CognitoIdentityProvider</a>.</p></li><li><p>Amazon Cognito no longer accepts a signed-out user's refresh tokens in refresh requests.</p></li></ul><p>Other requests might be valid until your user's token expires.</p><note><p>Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you must use IAM credentials to authorize requests, and you must grant yourself the corresponding IAM permission in a policy.</p><p class="title"><b>Learn more</b></p><ul><li><p><a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html">Signing Amazon Web Services API Requests</a></p></li><li><p><a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a></p></li></ul></note>
 
 @param request A container for the necessary parameters to execute the AdminUserGlobalSignOut service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderAdminUserGlobalSignOutRequest
 @see AWSCognitoIdentityProviderAdminUserGlobalSignOutResponse
 */
- (void)adminUserGlobalSignOut:(AWSCognitoIdentityProviderAdminUserGlobalSignOutRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderAdminUserGlobalSignOutResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Begins setup of time-based one-time password (TOTP) multi-factor authentication (MFA) for a user, with a unique private key that Amazon Cognito generates and returns in the API response. You can authorize an <code>AssociateSoftwareToken</code> request with either the user's access token, or a session string from a challenge response that you received from Amazon Cognito.</p><note><p>Amazon Cognito disassociates an existing software token when you verify the new token in a <a href="https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_VerifySoftwareToken.html"> VerifySoftwareToken</a> API request. If you don't verify the software token and your user pool doesn't require MFA, the user can then authenticate with user name and password credentials alone. If your user pool requires TOTP MFA, Amazon Cognito generates an <code>MFA_SETUP</code> or <code>SOFTWARE_TOKEN_SETUP</code> challenge each time your user signs. Complete setup with <code>AssociateSoftwareToken</code> and <code>VerifySoftwareToken</code>.</p><p>After you set up software token MFA for your user, Amazon Cognito generates a <code>SOFTWARE_TOKEN_MFA</code> challenge when they authenticate. Respond to this challenge with your user's TOTP.</p></note><note><p>Amazon Cognito doesn't evaluate Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you can't use IAM credentials to authorize requests, and you can't grant IAM permissions in policies. For more information about authorization models in Amazon Cognito, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a>.</p></note>
 
 @param request A container for the necessary parameters to execute the AssociateSoftwareToken service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderAssociateSoftwareTokenResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorConcurrentModification`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInternalError`, `AWSCognitoIdentityProviderErrorSoftwareTokenMFANotFound`, `AWSCognitoIdentityProviderErrorForbidden`.
 
 @see AWSCognitoIdentityProviderAssociateSoftwareTokenRequest
 @see AWSCognitoIdentityProviderAssociateSoftwareTokenResponse
 */
- (AWSTask<AWSCognitoIdentityProviderAssociateSoftwareTokenResponse *> *)associateSoftwareToken:(AWSCognitoIdentityProviderAssociateSoftwareTokenRequest *)request;

/**
 <p>Begins setup of time-based one-time password (TOTP) multi-factor authentication (MFA) for a user, with a unique private key that Amazon Cognito generates and returns in the API response. You can authorize an <code>AssociateSoftwareToken</code> request with either the user's access token, or a session string from a challenge response that you received from Amazon Cognito.</p><note><p>Amazon Cognito disassociates an existing software token when you verify the new token in a <a href="https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_VerifySoftwareToken.html"> VerifySoftwareToken</a> API request. If you don't verify the software token and your user pool doesn't require MFA, the user can then authenticate with user name and password credentials alone. If your user pool requires TOTP MFA, Amazon Cognito generates an <code>MFA_SETUP</code> or <code>SOFTWARE_TOKEN_SETUP</code> challenge each time your user signs. Complete setup with <code>AssociateSoftwareToken</code> and <code>VerifySoftwareToken</code>.</p><p>After you set up software token MFA for your user, Amazon Cognito generates a <code>SOFTWARE_TOKEN_MFA</code> challenge when they authenticate. Respond to this challenge with your user's TOTP.</p></note><note><p>Amazon Cognito doesn't evaluate Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you can't use IAM credentials to authorize requests, and you can't grant IAM permissions in policies. For more information about authorization models in Amazon Cognito, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a>.</p></note>
 
 @param request A container for the necessary parameters to execute the AssociateSoftwareToken service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorConcurrentModification`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInternalError`, `AWSCognitoIdentityProviderErrorSoftwareTokenMFANotFound`, `AWSCognitoIdentityProviderErrorForbidden`.
 
 @see AWSCognitoIdentityProviderAssociateSoftwareTokenRequest
 @see AWSCognitoIdentityProviderAssociateSoftwareTokenResponse
 */
- (void)associateSoftwareToken:(AWSCognitoIdentityProviderAssociateSoftwareTokenRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderAssociateSoftwareTokenResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Changes the password for a specified user in a user pool.</p><p>Authorize this action with a signed-in user's access token. It must include the scope <code>aws.cognito.signin.user.admin</code>.</p><note><p>Amazon Cognito doesn't evaluate Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you can't use IAM credentials to authorize requests, and you can't grant IAM permissions in policies. For more information about authorization models in Amazon Cognito, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a>.</p></note>
 
 @param request A container for the necessary parameters to execute the ChangePassword service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderChangePasswordResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorInvalidPassword`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorLimitExceeded`, `AWSCognitoIdentityProviderErrorPasswordResetRequired`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorUserNotConfirmed`, `AWSCognitoIdentityProviderErrorInternalError`, `AWSCognitoIdentityProviderErrorForbidden`.
 
 @see AWSCognitoIdentityProviderChangePasswordRequest
 @see AWSCognitoIdentityProviderChangePasswordResponse
 */
- (AWSTask<AWSCognitoIdentityProviderChangePasswordResponse *> *)changePassword:(AWSCognitoIdentityProviderChangePasswordRequest *)request;

/**
 <p>Changes the password for a specified user in a user pool.</p><p>Authorize this action with a signed-in user's access token. It must include the scope <code>aws.cognito.signin.user.admin</code>.</p><note><p>Amazon Cognito doesn't evaluate Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you can't use IAM credentials to authorize requests, and you can't grant IAM permissions in policies. For more information about authorization models in Amazon Cognito, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a>.</p></note>
 
 @param request A container for the necessary parameters to execute the ChangePassword service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorInvalidPassword`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorLimitExceeded`, `AWSCognitoIdentityProviderErrorPasswordResetRequired`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorUserNotConfirmed`, `AWSCognitoIdentityProviderErrorInternalError`, `AWSCognitoIdentityProviderErrorForbidden`.
 
 @see AWSCognitoIdentityProviderChangePasswordRequest
 @see AWSCognitoIdentityProviderChangePasswordResponse
 */
- (void)changePassword:(AWSCognitoIdentityProviderChangePasswordRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderChangePasswordResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Confirms tracking of the device. This API call is the call that begins device tracking. For more information about device authentication, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/amazon-cognito-user-pools-device-tracking.html">Working with user devices in your user pool</a>.</p><p>Authorize this action with a signed-in user's access token. It must include the scope <code>aws.cognito.signin.user.admin</code>.</p><note><p>Amazon Cognito doesn't evaluate Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you can't use IAM credentials to authorize requests, and you can't grant IAM permissions in policies. For more information about authorization models in Amazon Cognito, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a>.</p></note>
 
 @param request A container for the necessary parameters to execute the ConfirmDevice service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderConfirmDeviceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorInvalidPassword`, `AWSCognitoIdentityProviderErrorInvalidLambdaResponse`, `AWSCognitoIdentityProviderErrorUsernameExists`, `AWSCognitoIdentityProviderErrorInvalidUserPoolConfiguration`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorPasswordResetRequired`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorUserNotConfirmed`, `AWSCognitoIdentityProviderErrorInternalError`, `AWSCognitoIdentityProviderErrorForbidden`.
 
 @see AWSCognitoIdentityProviderConfirmDeviceRequest
 @see AWSCognitoIdentityProviderConfirmDeviceResponse
 */
- (AWSTask<AWSCognitoIdentityProviderConfirmDeviceResponse *> *)confirmDevice:(AWSCognitoIdentityProviderConfirmDeviceRequest *)request;

/**
 <p>Confirms tracking of the device. This API call is the call that begins device tracking. For more information about device authentication, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/amazon-cognito-user-pools-device-tracking.html">Working with user devices in your user pool</a>.</p><p>Authorize this action with a signed-in user's access token. It must include the scope <code>aws.cognito.signin.user.admin</code>.</p><note><p>Amazon Cognito doesn't evaluate Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you can't use IAM credentials to authorize requests, and you can't grant IAM permissions in policies. For more information about authorization models in Amazon Cognito, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a>.</p></note>
 
 @param request A container for the necessary parameters to execute the ConfirmDevice service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorInvalidPassword`, `AWSCognitoIdentityProviderErrorInvalidLambdaResponse`, `AWSCognitoIdentityProviderErrorUsernameExists`, `AWSCognitoIdentityProviderErrorInvalidUserPoolConfiguration`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorPasswordResetRequired`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorUserNotConfirmed`, `AWSCognitoIdentityProviderErrorInternalError`, `AWSCognitoIdentityProviderErrorForbidden`.
 
 @see AWSCognitoIdentityProviderConfirmDeviceRequest
 @see AWSCognitoIdentityProviderConfirmDeviceResponse
 */
- (void)confirmDevice:(AWSCognitoIdentityProviderConfirmDeviceRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderConfirmDeviceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Allows a user to enter a confirmation code to reset a forgotten password.</p><note><p>Amazon Cognito doesn't evaluate Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you can't use IAM credentials to authorize requests, and you can't grant IAM permissions in policies. For more information about authorization models in Amazon Cognito, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a>.</p></note>
 
 @param request A container for the necessary parameters to execute the ConfirmForgotPassword service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderConfirmForgotPasswordResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorUnexpectedLambda`, `AWSCognitoIdentityProviderErrorUserLambdaValidation`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorInvalidPassword`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorCodeMismatch`, `AWSCognitoIdentityProviderErrorExpiredCode`, `AWSCognitoIdentityProviderErrorTooManyFailedAttempts`, `AWSCognitoIdentityProviderErrorInvalidLambdaResponse`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorLimitExceeded`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorUserNotConfirmed`, `AWSCognitoIdentityProviderErrorInternalError`, `AWSCognitoIdentityProviderErrorForbidden`.
 
 @see AWSCognitoIdentityProviderConfirmForgotPasswordRequest
 @see AWSCognitoIdentityProviderConfirmForgotPasswordResponse
 */
- (AWSTask<AWSCognitoIdentityProviderConfirmForgotPasswordResponse *> *)confirmForgotPassword:(AWSCognitoIdentityProviderConfirmForgotPasswordRequest *)request;

/**
 <p>Allows a user to enter a confirmation code to reset a forgotten password.</p><note><p>Amazon Cognito doesn't evaluate Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you can't use IAM credentials to authorize requests, and you can't grant IAM permissions in policies. For more information about authorization models in Amazon Cognito, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a>.</p></note>
 
 @param request A container for the necessary parameters to execute the ConfirmForgotPassword service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorUnexpectedLambda`, `AWSCognitoIdentityProviderErrorUserLambdaValidation`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorInvalidPassword`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorCodeMismatch`, `AWSCognitoIdentityProviderErrorExpiredCode`, `AWSCognitoIdentityProviderErrorTooManyFailedAttempts`, `AWSCognitoIdentityProviderErrorInvalidLambdaResponse`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorLimitExceeded`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorUserNotConfirmed`, `AWSCognitoIdentityProviderErrorInternalError`, `AWSCognitoIdentityProviderErrorForbidden`.
 
 @see AWSCognitoIdentityProviderConfirmForgotPasswordRequest
 @see AWSCognitoIdentityProviderConfirmForgotPasswordResponse
 */
- (void)confirmForgotPassword:(AWSCognitoIdentityProviderConfirmForgotPasswordRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderConfirmForgotPasswordResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>This public API operation provides a code that Amazon Cognito sent to your user when they signed up in your user pool via the <a href="https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_SignUp.html">SignUp</a> API operation. After your user enters their code, they confirm ownership of the email address or phone number that they provided, and their user account becomes active. Depending on your user pool configuration, your users will receive their confirmation code in an email or SMS message.</p><p>Local users who signed up in your user pool are the only type of user who can confirm sign-up with a code. Users who federate through an external identity provider (IdP) have already been confirmed by their IdP. Administrator-created users, users created with the <a href="https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_AdminCreateUser.html">AdminCreateUser</a> API operation, confirm their accounts when they respond to their invitation email message and choose a password. They do not receive a confirmation code. Instead, they receive a temporary password.</p><note><p>Amazon Cognito doesn't evaluate Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you can't use IAM credentials to authorize requests, and you can't grant IAM permissions in policies. For more information about authorization models in Amazon Cognito, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a>.</p></note>
 
 @param request A container for the necessary parameters to execute the ConfirmSignUp service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderConfirmSignUpResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorUnexpectedLambda`, `AWSCognitoIdentityProviderErrorUserLambdaValidation`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorTooManyFailedAttempts`, `AWSCognitoIdentityProviderErrorCodeMismatch`, `AWSCognitoIdentityProviderErrorExpiredCode`, `AWSCognitoIdentityProviderErrorInvalidLambdaResponse`, `AWSCognitoIdentityProviderErrorAliasExists`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorLimitExceeded`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorInternalError`, `AWSCognitoIdentityProviderErrorForbidden`.
 
 @see AWSCognitoIdentityProviderConfirmSignUpRequest
 @see AWSCognitoIdentityProviderConfirmSignUpResponse
 */
- (AWSTask<AWSCognitoIdentityProviderConfirmSignUpResponse *> *)confirmSignUp:(AWSCognitoIdentityProviderConfirmSignUpRequest *)request;

/**
 <p>This public API operation provides a code that Amazon Cognito sent to your user when they signed up in your user pool via the <a href="https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_SignUp.html">SignUp</a> API operation. After your user enters their code, they confirm ownership of the email address or phone number that they provided, and their user account becomes active. Depending on your user pool configuration, your users will receive their confirmation code in an email or SMS message.</p><p>Local users who signed up in your user pool are the only type of user who can confirm sign-up with a code. Users who federate through an external identity provider (IdP) have already been confirmed by their IdP. Administrator-created users, users created with the <a href="https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_AdminCreateUser.html">AdminCreateUser</a> API operation, confirm their accounts when they respond to their invitation email message and choose a password. They do not receive a confirmation code. Instead, they receive a temporary password.</p><note><p>Amazon Cognito doesn't evaluate Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you can't use IAM credentials to authorize requests, and you can't grant IAM permissions in policies. For more information about authorization models in Amazon Cognito, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a>.</p></note>
 
 @param request A container for the necessary parameters to execute the ConfirmSignUp service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorUnexpectedLambda`, `AWSCognitoIdentityProviderErrorUserLambdaValidation`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorTooManyFailedAttempts`, `AWSCognitoIdentityProviderErrorCodeMismatch`, `AWSCognitoIdentityProviderErrorExpiredCode`, `AWSCognitoIdentityProviderErrorInvalidLambdaResponse`, `AWSCognitoIdentityProviderErrorAliasExists`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorLimitExceeded`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorInternalError`, `AWSCognitoIdentityProviderErrorForbidden`.
 
 @see AWSCognitoIdentityProviderConfirmSignUpRequest
 @see AWSCognitoIdentityProviderConfirmSignUpResponse
 */
- (void)confirmSignUp:(AWSCognitoIdentityProviderConfirmSignUpRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderConfirmSignUpResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new group in the specified user pool.</p><note><p>Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you must use IAM credentials to authorize requests, and you must grant yourself the corresponding IAM permission in a policy.</p><p class="title"><b>Learn more</b></p><ul><li><p><a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html">Signing Amazon Web Services API Requests</a></p></li><li><p><a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a></p></li></ul></note>
 
 @param request A container for the necessary parameters to execute the CreateGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderCreateGroupResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorGroupExists`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorLimitExceeded`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderCreateGroupRequest
 @see AWSCognitoIdentityProviderCreateGroupResponse
 */
- (AWSTask<AWSCognitoIdentityProviderCreateGroupResponse *> *)createGroup:(AWSCognitoIdentityProviderCreateGroupRequest *)request;

/**
 <p>Creates a new group in the specified user pool.</p><note><p>Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you must use IAM credentials to authorize requests, and you must grant yourself the corresponding IAM permission in a policy.</p><p class="title"><b>Learn more</b></p><ul><li><p><a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html">Signing Amazon Web Services API Requests</a></p></li><li><p><a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a></p></li></ul></note>
 
 @param request A container for the necessary parameters to execute the CreateGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorGroupExists`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorLimitExceeded`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderCreateGroupRequest
 @see AWSCognitoIdentityProviderCreateGroupResponse
 */
- (void)createGroup:(AWSCognitoIdentityProviderCreateGroupRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderCreateGroupResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Adds a configuration and trust relationship between a third-party identity provider (IdP) and a user pool.</p><note><p>Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you must use IAM credentials to authorize requests, and you must grant yourself the corresponding IAM permission in a policy.</p><p class="title"><b>Learn more</b></p><ul><li><p><a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html">Signing Amazon Web Services API Requests</a></p></li><li><p><a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a></p></li></ul></note>
 
 @param request A container for the necessary parameters to execute the CreateIdentityProvider service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderCreateIdentityProviderResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorDuplicateProvider`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorLimitExceeded`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderCreateIdentityProviderRequest
 @see AWSCognitoIdentityProviderCreateIdentityProviderResponse
 */
- (AWSTask<AWSCognitoIdentityProviderCreateIdentityProviderResponse *> *)createIdentityProvider:(AWSCognitoIdentityProviderCreateIdentityProviderRequest *)request;

/**
 <p>Adds a configuration and trust relationship between a third-party identity provider (IdP) and a user pool.</p><note><p>Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you must use IAM credentials to authorize requests, and you must grant yourself the corresponding IAM permission in a policy.</p><p class="title"><b>Learn more</b></p><ul><li><p><a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html">Signing Amazon Web Services API Requests</a></p></li><li><p><a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a></p></li></ul></note>
 
 @param request A container for the necessary parameters to execute the CreateIdentityProvider service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorDuplicateProvider`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorLimitExceeded`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderCreateIdentityProviderRequest
 @see AWSCognitoIdentityProviderCreateIdentityProviderResponse
 */
- (void)createIdentityProvider:(AWSCognitoIdentityProviderCreateIdentityProviderRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderCreateIdentityProviderResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new OAuth2.0 resource server and defines custom scopes within it.</p><note><p>Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you must use IAM credentials to authorize requests, and you must grant yourself the corresponding IAM permission in a policy.</p><p class="title"><b>Learn more</b></p><ul><li><p><a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html">Signing Amazon Web Services API Requests</a></p></li><li><p><a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a></p></li></ul></note>
 
 @param request A container for the necessary parameters to execute the CreateResourceServer service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderCreateResourceServerResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorLimitExceeded`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderCreateResourceServerRequest
 @see AWSCognitoIdentityProviderCreateResourceServerResponse
 */
- (AWSTask<AWSCognitoIdentityProviderCreateResourceServerResponse *> *)createResourceServer:(AWSCognitoIdentityProviderCreateResourceServerRequest *)request;

/**
 <p>Creates a new OAuth2.0 resource server and defines custom scopes within it.</p><note><p>Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you must use IAM credentials to authorize requests, and you must grant yourself the corresponding IAM permission in a policy.</p><p class="title"><b>Learn more</b></p><ul><li><p><a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html">Signing Amazon Web Services API Requests</a></p></li><li><p><a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a></p></li></ul></note>
 
 @param request A container for the necessary parameters to execute the CreateResourceServer service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorLimitExceeded`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderCreateResourceServerRequest
 @see AWSCognitoIdentityProviderCreateResourceServerResponse
 */
- (void)createResourceServer:(AWSCognitoIdentityProviderCreateResourceServerRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderCreateResourceServerResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a user import job.</p><note><p>Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you must use IAM credentials to authorize requests, and you must grant yourself the corresponding IAM permission in a policy.</p><p class="title"><b>Learn more</b></p><ul><li><p><a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html">Signing Amazon Web Services API Requests</a></p></li><li><p><a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a></p></li></ul></note>
 
 @param request A container for the necessary parameters to execute the CreateUserImportJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderCreateUserImportJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorPreconditionNotMet`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorLimitExceeded`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderCreateUserImportJobRequest
 @see AWSCognitoIdentityProviderCreateUserImportJobResponse
 */
- (AWSTask<AWSCognitoIdentityProviderCreateUserImportJobResponse *> *)createUserImportJob:(AWSCognitoIdentityProviderCreateUserImportJobRequest *)request;

/**
 <p>Creates a user import job.</p><note><p>Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you must use IAM credentials to authorize requests, and you must grant yourself the corresponding IAM permission in a policy.</p><p class="title"><b>Learn more</b></p><ul><li><p><a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html">Signing Amazon Web Services API Requests</a></p></li><li><p><a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a></p></li></ul></note>
 
 @param request A container for the necessary parameters to execute the CreateUserImportJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorPreconditionNotMet`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorLimitExceeded`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderCreateUserImportJobRequest
 @see AWSCognitoIdentityProviderCreateUserImportJobResponse
 */
- (void)createUserImportJob:(AWSCognitoIdentityProviderCreateUserImportJobRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderCreateUserImportJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This action might generate an SMS text message. Starting June 1, 2021, US telecom carriers require you to register an origination phone number before you can send SMS messages to US phone numbers. If you use SMS text messages in Amazon Cognito, you must register a phone number with <a href="https://console.aws.amazon.com/pinpoint/home/">Amazon Pinpoint</a>. Amazon Cognito uses the registered number automatically. Otherwise, Amazon Cognito users who must receive SMS messages might not be able to sign up, activate their accounts, or sign in.</p><p>If you have never used SMS text messages with Amazon Cognito or any other Amazon Web Service, Amazon Simple Notification Service might place your account in the SMS sandbox. In <i><a href="https://docs.aws.amazon.com/sns/latest/dg/sns-sms-sandbox.html">sandbox mode</a></i>, you can send messages only to verified phone numbers. After you test your app while in the sandbox environment, you can move out of the sandbox and into production. For more information, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pool-sms-settings.html"> SMS message settings for Amazon Cognito user pools</a> in the <i>Amazon Cognito Developer Guide</i>.</p></note><p>Creates a new Amazon Cognito user pool and sets the password policy for the pool.</p><important><p>If you don't provide a value for an attribute, Amazon Cognito sets it to its default value.</p></important><note><p>Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you must use IAM credentials to authorize requests, and you must grant yourself the corresponding IAM permission in a policy.</p><p class="title"><b>Learn more</b></p><ul><li><p><a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html">Signing Amazon Web Services API Requests</a></p></li><li><p><a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a></p></li></ul></note>
 
 @param request A container for the necessary parameters to execute the CreateUserPool service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderCreateUserPoolResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorLimitExceeded`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleAccessPolicy`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleTrustRelationship`, `AWSCognitoIdentityProviderErrorInvalidEmailRoleAccessPolicy`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUserPoolTagging`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderCreateUserPoolRequest
 @see AWSCognitoIdentityProviderCreateUserPoolResponse
 */
- (AWSTask<AWSCognitoIdentityProviderCreateUserPoolResponse *> *)createUserPool:(AWSCognitoIdentityProviderCreateUserPoolRequest *)request;

/**
 <note><p>This action might generate an SMS text message. Starting June 1, 2021, US telecom carriers require you to register an origination phone number before you can send SMS messages to US phone numbers. If you use SMS text messages in Amazon Cognito, you must register a phone number with <a href="https://console.aws.amazon.com/pinpoint/home/">Amazon Pinpoint</a>. Amazon Cognito uses the registered number automatically. Otherwise, Amazon Cognito users who must receive SMS messages might not be able to sign up, activate their accounts, or sign in.</p><p>If you have never used SMS text messages with Amazon Cognito or any other Amazon Web Service, Amazon Simple Notification Service might place your account in the SMS sandbox. In <i><a href="https://docs.aws.amazon.com/sns/latest/dg/sns-sms-sandbox.html">sandbox mode</a></i>, you can send messages only to verified phone numbers. After you test your app while in the sandbox environment, you can move out of the sandbox and into production. For more information, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pool-sms-settings.html"> SMS message settings for Amazon Cognito user pools</a> in the <i>Amazon Cognito Developer Guide</i>.</p></note><p>Creates a new Amazon Cognito user pool and sets the password policy for the pool.</p><important><p>If you don't provide a value for an attribute, Amazon Cognito sets it to its default value.</p></important><note><p>Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you must use IAM credentials to authorize requests, and you must grant yourself the corresponding IAM permission in a policy.</p><p class="title"><b>Learn more</b></p><ul><li><p><a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html">Signing Amazon Web Services API Requests</a></p></li><li><p><a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a></p></li></ul></note>
 
 @param request A container for the necessary parameters to execute the CreateUserPool service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorLimitExceeded`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleAccessPolicy`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleTrustRelationship`, `AWSCognitoIdentityProviderErrorInvalidEmailRoleAccessPolicy`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUserPoolTagging`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderCreateUserPoolRequest
 @see AWSCognitoIdentityProviderCreateUserPoolResponse
 */
- (void)createUserPool:(AWSCognitoIdentityProviderCreateUserPoolRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderCreateUserPoolResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates the user pool client.</p><p>When you create a new user pool client, token revocation is automatically activated. For more information about revoking tokens, see <a href="https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_RevokeToken.html">RevokeToken</a>.</p><important><p>If you don't provide a value for an attribute, Amazon Cognito sets it to its default value.</p></important><note><p>Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you must use IAM credentials to authorize requests, and you must grant yourself the corresponding IAM permission in a policy.</p><p class="title"><b>Learn more</b></p><ul><li><p><a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html">Signing Amazon Web Services API Requests</a></p></li><li><p><a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a></p></li></ul></note>
 
 @param request A container for the necessary parameters to execute the CreateUserPoolClient service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderCreateUserPoolClientResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorLimitExceeded`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorScopeDoesNotExist`, `AWSCognitoIdentityProviderErrorInvalidOAuthFlow`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderCreateUserPoolClientRequest
 @see AWSCognitoIdentityProviderCreateUserPoolClientResponse
 */
- (AWSTask<AWSCognitoIdentityProviderCreateUserPoolClientResponse *> *)createUserPoolClient:(AWSCognitoIdentityProviderCreateUserPoolClientRequest *)request;

/**
 <p>Creates the user pool client.</p><p>When you create a new user pool client, token revocation is automatically activated. For more information about revoking tokens, see <a href="https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_RevokeToken.html">RevokeToken</a>.</p><important><p>If you don't provide a value for an attribute, Amazon Cognito sets it to its default value.</p></important><note><p>Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you must use IAM credentials to authorize requests, and you must grant yourself the corresponding IAM permission in a policy.</p><p class="title"><b>Learn more</b></p><ul><li><p><a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html">Signing Amazon Web Services API Requests</a></p></li><li><p><a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a></p></li></ul></note>
 
 @param request A container for the necessary parameters to execute the CreateUserPoolClient service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorLimitExceeded`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorScopeDoesNotExist`, `AWSCognitoIdentityProviderErrorInvalidOAuthFlow`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderCreateUserPoolClientRequest
 @see AWSCognitoIdentityProviderCreateUserPoolClientResponse
 */
- (void)createUserPoolClient:(AWSCognitoIdentityProviderCreateUserPoolClientRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderCreateUserPoolClientResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new domain for a user pool.</p><note><p>Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you must use IAM credentials to authorize requests, and you must grant yourself the corresponding IAM permission in a policy.</p><p class="title"><b>Learn more</b></p><ul><li><p><a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html">Signing Amazon Web Services API Requests</a></p></li><li><p><a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a></p></li></ul></note>
 
 @param request A container for the necessary parameters to execute the CreateUserPoolDomain service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderCreateUserPoolDomainResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorLimitExceeded`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderCreateUserPoolDomainRequest
 @see AWSCognitoIdentityProviderCreateUserPoolDomainResponse
 */
- (AWSTask<AWSCognitoIdentityProviderCreateUserPoolDomainResponse *> *)createUserPoolDomain:(AWSCognitoIdentityProviderCreateUserPoolDomainRequest *)request;

/**
 <p>Creates a new domain for a user pool.</p><note><p>Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you must use IAM credentials to authorize requests, and you must grant yourself the corresponding IAM permission in a policy.</p><p class="title"><b>Learn more</b></p><ul><li><p><a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html">Signing Amazon Web Services API Requests</a></p></li><li><p><a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a></p></li></ul></note>
 
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
 <p>Deletes an IdP for a user pool.</p>
 
 @param request A container for the necessary parameters to execute the DeleteIdentityProvider service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorUnsupportedIdentityProvider`, `AWSCognitoIdentityProviderErrorConcurrentModification`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderDeleteIdentityProviderRequest
 */
- (AWSTask *)deleteIdentityProvider:(AWSCognitoIdentityProviderDeleteIdentityProviderRequest *)request;

/**
 <p>Deletes an IdP for a user pool.</p>
 
 @param request A container for the necessary parameters to execute the DeleteIdentityProvider service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorUnsupportedIdentityProvider`, `AWSCognitoIdentityProviderErrorConcurrentModification`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`.
 
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
 <p>Allows a user to delete their own user profile.</p><p>Authorize this action with a signed-in user's access token. It must include the scope <code>aws.cognito.signin.user.admin</code>.</p><note><p>Amazon Cognito doesn't evaluate Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you can't use IAM credentials to authorize requests, and you can't grant IAM permissions in policies. For more information about authorization models in Amazon Cognito, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a>.</p></note>
 
 @param request A container for the necessary parameters to execute the DeleteUser service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorPasswordResetRequired`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorUserNotConfirmed`, `AWSCognitoIdentityProviderErrorInternalError`, `AWSCognitoIdentityProviderErrorForbidden`.
 
 @see AWSCognitoIdentityProviderDeleteUserRequest
 */
- (AWSTask *)deleteUser:(AWSCognitoIdentityProviderDeleteUserRequest *)request;

/**
 <p>Allows a user to delete their own user profile.</p><p>Authorize this action with a signed-in user's access token. It must include the scope <code>aws.cognito.signin.user.admin</code>.</p><note><p>Amazon Cognito doesn't evaluate Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you can't use IAM credentials to authorize requests, and you can't grant IAM permissions in policies. For more information about authorization models in Amazon Cognito, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a>.</p></note>
 
 @param request A container for the necessary parameters to execute the DeleteUser service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorPasswordResetRequired`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorUserNotConfirmed`, `AWSCognitoIdentityProviderErrorInternalError`, `AWSCognitoIdentityProviderErrorForbidden`.
 
 @see AWSCognitoIdentityProviderDeleteUserRequest
 */
- (void)deleteUser:(AWSCognitoIdentityProviderDeleteUserRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the attributes for a user.</p><p>Authorize this action with a signed-in user's access token. It must include the scope <code>aws.cognito.signin.user.admin</code>.</p><note><p>Amazon Cognito doesn't evaluate Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you can't use IAM credentials to authorize requests, and you can't grant IAM permissions in policies. For more information about authorization models in Amazon Cognito, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a>.</p></note>
 
 @param request A container for the necessary parameters to execute the DeleteUserAttributes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderDeleteUserAttributesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorPasswordResetRequired`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorUserNotConfirmed`, `AWSCognitoIdentityProviderErrorInternalError`, `AWSCognitoIdentityProviderErrorForbidden`.
 
 @see AWSCognitoIdentityProviderDeleteUserAttributesRequest
 @see AWSCognitoIdentityProviderDeleteUserAttributesResponse
 */
- (AWSTask<AWSCognitoIdentityProviderDeleteUserAttributesResponse *> *)deleteUserAttributes:(AWSCognitoIdentityProviderDeleteUserAttributesRequest *)request;

/**
 <p>Deletes the attributes for a user.</p><p>Authorize this action with a signed-in user's access token. It must include the scope <code>aws.cognito.signin.user.admin</code>.</p><note><p>Amazon Cognito doesn't evaluate Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you can't use IAM credentials to authorize requests, and you can't grant IAM permissions in policies. For more information about authorization models in Amazon Cognito, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a>.</p></note>
 
 @param request A container for the necessary parameters to execute the DeleteUserAttributes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorPasswordResetRequired`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorUserNotConfirmed`, `AWSCognitoIdentityProviderErrorInternalError`, `AWSCognitoIdentityProviderErrorForbidden`.
 
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

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorConcurrentModification`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderDeleteUserPoolClientRequest
 */
- (AWSTask *)deleteUserPoolClient:(AWSCognitoIdentityProviderDeleteUserPoolClientRequest *)request;

/**
 <p>Allows the developer to delete the user pool client.</p>
 
 @param request A container for the necessary parameters to execute the DeleteUserPoolClient service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorConcurrentModification`, `AWSCognitoIdentityProviderErrorInternalError`.
 
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
 <p>Gets information about a specific IdP.</p>
 
 @param request A container for the necessary parameters to execute the DescribeIdentityProvider service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderDescribeIdentityProviderResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderDescribeIdentityProviderRequest
 @see AWSCognitoIdentityProviderDescribeIdentityProviderResponse
 */
- (AWSTask<AWSCognitoIdentityProviderDescribeIdentityProviderResponse *> *)describeIdentityProvider:(AWSCognitoIdentityProviderDescribeIdentityProviderRequest *)request;

/**
 <p>Gets information about a specific IdP.</p>
 
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
 <p>Returns the configuration information and metadata of the specified user pool.</p><note><p>Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you must use IAM credentials to authorize requests, and you must grant yourself the corresponding IAM permission in a policy.</p><p class="title"><b>Learn more</b></p><ul><li><p><a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html">Signing Amazon Web Services API Requests</a></p></li><li><p><a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a></p></li></ul></note>
 
 @param request A container for the necessary parameters to execute the DescribeUserPool service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderDescribeUserPoolResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUserPoolTagging`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderDescribeUserPoolRequest
 @see AWSCognitoIdentityProviderDescribeUserPoolResponse
 */
- (AWSTask<AWSCognitoIdentityProviderDescribeUserPoolResponse *> *)describeUserPool:(AWSCognitoIdentityProviderDescribeUserPoolRequest *)request;

/**
 <p>Returns the configuration information and metadata of the specified user pool.</p><note><p>Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you must use IAM credentials to authorize requests, and you must grant yourself the corresponding IAM permission in a policy.</p><p class="title"><b>Learn more</b></p><ul><li><p><a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html">Signing Amazon Web Services API Requests</a></p></li><li><p><a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a></p></li></ul></note>
 
 @param request A container for the necessary parameters to execute the DescribeUserPool service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUserPoolTagging`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderDescribeUserPoolRequest
 @see AWSCognitoIdentityProviderDescribeUserPoolResponse
 */
- (void)describeUserPool:(AWSCognitoIdentityProviderDescribeUserPoolRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderDescribeUserPoolResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Client method for returning the configuration information and metadata of the specified user pool app client.</p><note><p>Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you must use IAM credentials to authorize requests, and you must grant yourself the corresponding IAM permission in a policy.</p><p class="title"><b>Learn more</b></p><ul><li><p><a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html">Signing Amazon Web Services API Requests</a></p></li><li><p><a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a></p></li></ul></note>
 
 @param request A container for the necessary parameters to execute the DescribeUserPoolClient service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderDescribeUserPoolClientResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderDescribeUserPoolClientRequest
 @see AWSCognitoIdentityProviderDescribeUserPoolClientResponse
 */
- (AWSTask<AWSCognitoIdentityProviderDescribeUserPoolClientResponse *> *)describeUserPoolClient:(AWSCognitoIdentityProviderDescribeUserPoolClientRequest *)request;

/**
 <p>Client method for returning the configuration information and metadata of the specified user pool app client.</p><note><p>Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you must use IAM credentials to authorize requests, and you must grant yourself the corresponding IAM permission in a policy.</p><p class="title"><b>Learn more</b></p><ul><li><p><a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html">Signing Amazon Web Services API Requests</a></p></li><li><p><a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a></p></li></ul></note>
 
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
 <p>Forgets the specified device. For more information about device authentication, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/amazon-cognito-user-pools-device-tracking.html">Working with user devices in your user pool</a>.</p><p>Authorize this action with a signed-in user's access token. It must include the scope <code>aws.cognito.signin.user.admin</code>.</p><note><p>Amazon Cognito doesn't evaluate Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you can't use IAM credentials to authorize requests, and you can't grant IAM permissions in policies. For more information about authorization models in Amazon Cognito, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a>.</p></note>
 
 @param request A container for the necessary parameters to execute the ForgetDevice service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInvalidUserPoolConfiguration`, `AWSCognitoIdentityProviderErrorPasswordResetRequired`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorUserNotConfirmed`, `AWSCognitoIdentityProviderErrorInternalError`, `AWSCognitoIdentityProviderErrorForbidden`.
 
 @see AWSCognitoIdentityProviderForgetDeviceRequest
 */
- (AWSTask *)forgetDevice:(AWSCognitoIdentityProviderForgetDeviceRequest *)request;

/**
 <p>Forgets the specified device. For more information about device authentication, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/amazon-cognito-user-pools-device-tracking.html">Working with user devices in your user pool</a>.</p><p>Authorize this action with a signed-in user's access token. It must include the scope <code>aws.cognito.signin.user.admin</code>.</p><note><p>Amazon Cognito doesn't evaluate Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you can't use IAM credentials to authorize requests, and you can't grant IAM permissions in policies. For more information about authorization models in Amazon Cognito, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a>.</p></note>
 
 @param request A container for the necessary parameters to execute the ForgetDevice service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInvalidUserPoolConfiguration`, `AWSCognitoIdentityProviderErrorPasswordResetRequired`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorUserNotConfirmed`, `AWSCognitoIdentityProviderErrorInternalError`, `AWSCognitoIdentityProviderErrorForbidden`.
 
 @see AWSCognitoIdentityProviderForgetDeviceRequest
 */
- (void)forgetDevice:(AWSCognitoIdentityProviderForgetDeviceRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Calling this API causes a message to be sent to the end user with a confirmation code that is required to change the user's password. For the <code>Username</code> parameter, you can use the username or user alias. The method used to send the confirmation code is sent according to the specified AccountRecoverySetting. For more information, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/how-to-recover-a-user-account.html">Recovering User Accounts</a> in the <i>Amazon Cognito Developer Guide</i>. To use the confirmation code for resetting the password, call <a href="https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_ConfirmForgotPassword.html">ConfirmForgotPassword</a>. </p><p>If neither a verified phone number nor a verified email exists, this API returns <code>InvalidParameterException</code>. If your app client has a client secret and you don't provide a <code>SECRET_HASH</code> parameter, this API returns <code>NotAuthorizedException</code>.</p><p>To use this API operation, your user pool must have self-service account recovery configured. Use <a href="https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_AdminSetUserPassword.html">AdminSetUserPassword</a> if you manage passwords as an administrator.</p><note><p>Amazon Cognito doesn't evaluate Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you can't use IAM credentials to authorize requests, and you can't grant IAM permissions in policies. For more information about authorization models in Amazon Cognito, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a>.</p></note><note><p>This action might generate an SMS text message. Starting June 1, 2021, US telecom carriers require you to register an origination phone number before you can send SMS messages to US phone numbers. If you use SMS text messages in Amazon Cognito, you must register a phone number with <a href="https://console.aws.amazon.com/pinpoint/home/">Amazon Pinpoint</a>. Amazon Cognito uses the registered number automatically. Otherwise, Amazon Cognito users who must receive SMS messages might not be able to sign up, activate their accounts, or sign in.</p><p>If you have never used SMS text messages with Amazon Cognito or any other Amazon Web Service, Amazon Simple Notification Service might place your account in the SMS sandbox. In <i><a href="https://docs.aws.amazon.com/sns/latest/dg/sns-sms-sandbox.html">sandbox mode</a></i>, you can send messages only to verified phone numbers. After you test your app while in the sandbox environment, you can move out of the sandbox and into production. For more information, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pool-sms-settings.html"> SMS message settings for Amazon Cognito user pools</a> in the <i>Amazon Cognito Developer Guide</i>.</p></note>
 
 @param request A container for the necessary parameters to execute the ForgotPassword service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderForgotPasswordResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorUnexpectedLambda`, `AWSCognitoIdentityProviderErrorUserLambdaValidation`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorInvalidLambdaResponse`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorLimitExceeded`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleAccessPolicy`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleTrustRelationship`, `AWSCognitoIdentityProviderErrorInvalidEmailRoleAccessPolicy`, `AWSCognitoIdentityProviderErrorCodeDeliveryFailure`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorInternalError`, `AWSCognitoIdentityProviderErrorForbidden`.
 
 @see AWSCognitoIdentityProviderForgotPasswordRequest
 @see AWSCognitoIdentityProviderForgotPasswordResponse
 */
- (AWSTask<AWSCognitoIdentityProviderForgotPasswordResponse *> *)forgotPassword:(AWSCognitoIdentityProviderForgotPasswordRequest *)request;

/**
 <p>Calling this API causes a message to be sent to the end user with a confirmation code that is required to change the user's password. For the <code>Username</code> parameter, you can use the username or user alias. The method used to send the confirmation code is sent according to the specified AccountRecoverySetting. For more information, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/how-to-recover-a-user-account.html">Recovering User Accounts</a> in the <i>Amazon Cognito Developer Guide</i>. To use the confirmation code for resetting the password, call <a href="https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_ConfirmForgotPassword.html">ConfirmForgotPassword</a>. </p><p>If neither a verified phone number nor a verified email exists, this API returns <code>InvalidParameterException</code>. If your app client has a client secret and you don't provide a <code>SECRET_HASH</code> parameter, this API returns <code>NotAuthorizedException</code>.</p><p>To use this API operation, your user pool must have self-service account recovery configured. Use <a href="https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_AdminSetUserPassword.html">AdminSetUserPassword</a> if you manage passwords as an administrator.</p><note><p>Amazon Cognito doesn't evaluate Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you can't use IAM credentials to authorize requests, and you can't grant IAM permissions in policies. For more information about authorization models in Amazon Cognito, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a>.</p></note><note><p>This action might generate an SMS text message. Starting June 1, 2021, US telecom carriers require you to register an origination phone number before you can send SMS messages to US phone numbers. If you use SMS text messages in Amazon Cognito, you must register a phone number with <a href="https://console.aws.amazon.com/pinpoint/home/">Amazon Pinpoint</a>. Amazon Cognito uses the registered number automatically. Otherwise, Amazon Cognito users who must receive SMS messages might not be able to sign up, activate their accounts, or sign in.</p><p>If you have never used SMS text messages with Amazon Cognito or any other Amazon Web Service, Amazon Simple Notification Service might place your account in the SMS sandbox. In <i><a href="https://docs.aws.amazon.com/sns/latest/dg/sns-sms-sandbox.html">sandbox mode</a></i>, you can send messages only to verified phone numbers. After you test your app while in the sandbox environment, you can move out of the sandbox and into production. For more information, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pool-sms-settings.html"> SMS message settings for Amazon Cognito user pools</a> in the <i>Amazon Cognito Developer Guide</i>.</p></note>
 
 @param request A container for the necessary parameters to execute the ForgotPassword service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorUnexpectedLambda`, `AWSCognitoIdentityProviderErrorUserLambdaValidation`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorInvalidLambdaResponse`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorLimitExceeded`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleAccessPolicy`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleTrustRelationship`, `AWSCognitoIdentityProviderErrorInvalidEmailRoleAccessPolicy`, `AWSCognitoIdentityProviderErrorCodeDeliveryFailure`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorInternalError`, `AWSCognitoIdentityProviderErrorForbidden`.
 
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
 <p>Gets the device. For more information about device authentication, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/amazon-cognito-user-pools-device-tracking.html">Working with user devices in your user pool</a>.</p><p>Authorize this action with a signed-in user's access token. It must include the scope <code>aws.cognito.signin.user.admin</code>.</p><note><p>Amazon Cognito doesn't evaluate Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you can't use IAM credentials to authorize requests, and you can't grant IAM permissions in policies. For more information about authorization models in Amazon Cognito, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a>.</p></note>
 
 @param request A container for the necessary parameters to execute the GetDevice service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderGetDeviceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorInvalidUserPoolConfiguration`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorPasswordResetRequired`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorUserNotConfirmed`, `AWSCognitoIdentityProviderErrorInternalError`, `AWSCognitoIdentityProviderErrorForbidden`.
 
 @see AWSCognitoIdentityProviderGetDeviceRequest
 @see AWSCognitoIdentityProviderGetDeviceResponse
 */
- (AWSTask<AWSCognitoIdentityProviderGetDeviceResponse *> *)getDevice:(AWSCognitoIdentityProviderGetDeviceRequest *)request;

/**
 <p>Gets the device. For more information about device authentication, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/amazon-cognito-user-pools-device-tracking.html">Working with user devices in your user pool</a>.</p><p>Authorize this action with a signed-in user's access token. It must include the scope <code>aws.cognito.signin.user.admin</code>.</p><note><p>Amazon Cognito doesn't evaluate Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you can't use IAM credentials to authorize requests, and you can't grant IAM permissions in policies. For more information about authorization models in Amazon Cognito, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a>.</p></note>
 
 @param request A container for the necessary parameters to execute the GetDevice service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorInvalidUserPoolConfiguration`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorPasswordResetRequired`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorUserNotConfirmed`, `AWSCognitoIdentityProviderErrorInternalError`, `AWSCognitoIdentityProviderErrorForbidden`.
 
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
 <p>Gets the specified IdP.</p>
 
 @param request A container for the necessary parameters to execute the GetIdentityProviderByIdentifier service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderGetIdentityProviderByIdentifierResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderGetIdentityProviderByIdentifierRequest
 @see AWSCognitoIdentityProviderGetIdentityProviderByIdentifierResponse
 */
- (AWSTask<AWSCognitoIdentityProviderGetIdentityProviderByIdentifierResponse *> *)getIdentityProviderByIdentifier:(AWSCognitoIdentityProviderGetIdentityProviderByIdentifierRequest *)request;

/**
 <p>Gets the specified IdP.</p>
 
 @param request A container for the necessary parameters to execute the GetIdentityProviderByIdentifier service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderGetIdentityProviderByIdentifierRequest
 @see AWSCognitoIdentityProviderGetIdentityProviderByIdentifierResponse
 */
- (void)getIdentityProviderByIdentifier:(AWSCognitoIdentityProviderGetIdentityProviderByIdentifierRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderGetIdentityProviderByIdentifierResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets the detailed activity logging configuration for a user pool.</p>
 
 @param request A container for the necessary parameters to execute the GetLogDeliveryConfiguration service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderGetLogDeliveryConfigurationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorInternalError`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorResourceNotFound`.
 
 @see AWSCognitoIdentityProviderGetLogDeliveryConfigurationRequest
 @see AWSCognitoIdentityProviderGetLogDeliveryConfigurationResponse
 */
- (AWSTask<AWSCognitoIdentityProviderGetLogDeliveryConfigurationResponse *> *)getLogDeliveryConfiguration:(AWSCognitoIdentityProviderGetLogDeliveryConfigurationRequest *)request;

/**
 <p>Gets the detailed activity logging configuration for a user pool.</p>
 
 @param request A container for the necessary parameters to execute the GetLogDeliveryConfiguration service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorInternalError`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorResourceNotFound`.
 
 @see AWSCognitoIdentityProviderGetLogDeliveryConfigurationRequest
 @see AWSCognitoIdentityProviderGetLogDeliveryConfigurationResponse
 */
- (void)getLogDeliveryConfiguration:(AWSCognitoIdentityProviderGetLogDeliveryConfigurationRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderGetLogDeliveryConfigurationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>This method takes a user pool ID, and returns the signing certificate. The issued certificate is valid for 10 years from the date of issue.</p><p>Amazon Cognito issues and assigns a new signing certificate annually. This process returns a new value in the response to <code>GetSigningCertificate</code>, but doesn't invalidate the original certificate.</p>
 
 @param request A container for the necessary parameters to execute the GetSigningCertificate service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderGetSigningCertificateResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInternalError`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorResourceNotFound`.
 
 @see AWSCognitoIdentityProviderGetSigningCertificateRequest
 @see AWSCognitoIdentityProviderGetSigningCertificateResponse
 */
- (AWSTask<AWSCognitoIdentityProviderGetSigningCertificateResponse *> *)getSigningCertificate:(AWSCognitoIdentityProviderGetSigningCertificateRequest *)request;

/**
 <p>This method takes a user pool ID, and returns the signing certificate. The issued certificate is valid for 10 years from the date of issue.</p><p>Amazon Cognito issues and assigns a new signing certificate annually. This process returns a new value in the response to <code>GetSigningCertificate</code>, but doesn't invalidate the original certificate.</p>
 
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
 <p>Gets the user attributes and metadata for a user.</p><p>Authorize this action with a signed-in user's access token. It must include the scope <code>aws.cognito.signin.user.admin</code>.</p><note><p>Amazon Cognito doesn't evaluate Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you can't use IAM credentials to authorize requests, and you can't grant IAM permissions in policies. For more information about authorization models in Amazon Cognito, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a>.</p></note>
 
 @param request A container for the necessary parameters to execute the GetUser service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderGetUserResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorPasswordResetRequired`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorUserNotConfirmed`, `AWSCognitoIdentityProviderErrorInternalError`, `AWSCognitoIdentityProviderErrorForbidden`.
 
 @see AWSCognitoIdentityProviderGetUserRequest
 @see AWSCognitoIdentityProviderGetUserResponse
 */
- (AWSTask<AWSCognitoIdentityProviderGetUserResponse *> *)getUser:(AWSCognitoIdentityProviderGetUserRequest *)request;

/**
 <p>Gets the user attributes and metadata for a user.</p><p>Authorize this action with a signed-in user's access token. It must include the scope <code>aws.cognito.signin.user.admin</code>.</p><note><p>Amazon Cognito doesn't evaluate Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you can't use IAM credentials to authorize requests, and you can't grant IAM permissions in policies. For more information about authorization models in Amazon Cognito, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a>.</p></note>
 
 @param request A container for the necessary parameters to execute the GetUser service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorPasswordResetRequired`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorUserNotConfirmed`, `AWSCognitoIdentityProviderErrorInternalError`, `AWSCognitoIdentityProviderErrorForbidden`.
 
 @see AWSCognitoIdentityProviderGetUserRequest
 @see AWSCognitoIdentityProviderGetUserResponse
 */
- (void)getUser:(AWSCognitoIdentityProviderGetUserRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderGetUserResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Generates a user attribute verification code for the specified attribute name. Sends a message to a user with a code that they must return in a VerifyUserAttribute request.</p><p>Authorize this action with a signed-in user's access token. It must include the scope <code>aws.cognito.signin.user.admin</code>.</p><note><p>Amazon Cognito doesn't evaluate Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you can't use IAM credentials to authorize requests, and you can't grant IAM permissions in policies. For more information about authorization models in Amazon Cognito, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a>.</p></note><note><p>This action might generate an SMS text message. Starting June 1, 2021, US telecom carriers require you to register an origination phone number before you can send SMS messages to US phone numbers. If you use SMS text messages in Amazon Cognito, you must register a phone number with <a href="https://console.aws.amazon.com/pinpoint/home/">Amazon Pinpoint</a>. Amazon Cognito uses the registered number automatically. Otherwise, Amazon Cognito users who must receive SMS messages might not be able to sign up, activate their accounts, or sign in.</p><p>If you have never used SMS text messages with Amazon Cognito or any other Amazon Web Service, Amazon Simple Notification Service might place your account in the SMS sandbox. In <i><a href="https://docs.aws.amazon.com/sns/latest/dg/sns-sms-sandbox.html">sandbox mode</a></i>, you can send messages only to verified phone numbers. After you test your app while in the sandbox environment, you can move out of the sandbox and into production. For more information, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pool-sms-settings.html"> SMS message settings for Amazon Cognito user pools</a> in the <i>Amazon Cognito Developer Guide</i>.</p></note>
 
 @param request A container for the necessary parameters to execute the GetUserAttributeVerificationCode service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderGetUserAttributeVerificationCodeResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUnexpectedLambda`, `AWSCognitoIdentityProviderErrorUserLambdaValidation`, `AWSCognitoIdentityProviderErrorInvalidLambdaResponse`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleAccessPolicy`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleTrustRelationship`, `AWSCognitoIdentityProviderErrorInvalidEmailRoleAccessPolicy`, `AWSCognitoIdentityProviderErrorCodeDeliveryFailure`, `AWSCognitoIdentityProviderErrorLimitExceeded`, `AWSCognitoIdentityProviderErrorPasswordResetRequired`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorUserNotConfirmed`, `AWSCognitoIdentityProviderErrorInternalError`, `AWSCognitoIdentityProviderErrorForbidden`.
 
 @see AWSCognitoIdentityProviderGetUserAttributeVerificationCodeRequest
 @see AWSCognitoIdentityProviderGetUserAttributeVerificationCodeResponse
 */
- (AWSTask<AWSCognitoIdentityProviderGetUserAttributeVerificationCodeResponse *> *)getUserAttributeVerificationCode:(AWSCognitoIdentityProviderGetUserAttributeVerificationCodeRequest *)request;

/**
 <p>Generates a user attribute verification code for the specified attribute name. Sends a message to a user with a code that they must return in a VerifyUserAttribute request.</p><p>Authorize this action with a signed-in user's access token. It must include the scope <code>aws.cognito.signin.user.admin</code>.</p><note><p>Amazon Cognito doesn't evaluate Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you can't use IAM credentials to authorize requests, and you can't grant IAM permissions in policies. For more information about authorization models in Amazon Cognito, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a>.</p></note><note><p>This action might generate an SMS text message. Starting June 1, 2021, US telecom carriers require you to register an origination phone number before you can send SMS messages to US phone numbers. If you use SMS text messages in Amazon Cognito, you must register a phone number with <a href="https://console.aws.amazon.com/pinpoint/home/">Amazon Pinpoint</a>. Amazon Cognito uses the registered number automatically. Otherwise, Amazon Cognito users who must receive SMS messages might not be able to sign up, activate their accounts, or sign in.</p><p>If you have never used SMS text messages with Amazon Cognito or any other Amazon Web Service, Amazon Simple Notification Service might place your account in the SMS sandbox. In <i><a href="https://docs.aws.amazon.com/sns/latest/dg/sns-sms-sandbox.html">sandbox mode</a></i>, you can send messages only to verified phone numbers. After you test your app while in the sandbox environment, you can move out of the sandbox and into production. For more information, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pool-sms-settings.html"> SMS message settings for Amazon Cognito user pools</a> in the <i>Amazon Cognito Developer Guide</i>.</p></note>
 
 @param request A container for the necessary parameters to execute the GetUserAttributeVerificationCode service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUnexpectedLambda`, `AWSCognitoIdentityProviderErrorUserLambdaValidation`, `AWSCognitoIdentityProviderErrorInvalidLambdaResponse`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleAccessPolicy`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleTrustRelationship`, `AWSCognitoIdentityProviderErrorInvalidEmailRoleAccessPolicy`, `AWSCognitoIdentityProviderErrorCodeDeliveryFailure`, `AWSCognitoIdentityProviderErrorLimitExceeded`, `AWSCognitoIdentityProviderErrorPasswordResetRequired`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorUserNotConfirmed`, `AWSCognitoIdentityProviderErrorInternalError`, `AWSCognitoIdentityProviderErrorForbidden`.
 
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
 <p>Invalidates the identity, access, and refresh tokens that Amazon Cognito issued to a user. Call this operation when your user signs out of your app. This results in the following behavior. </p><ul><li><p>Amazon Cognito no longer accepts <i>token-authorized</i> user operations that you authorize with a signed-out user's access tokens. For more information, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a>.</p><p>Amazon Cognito returns an <code>Access Token has been revoked</code> error when your app attempts to authorize a user pools API request with a revoked access token that contains the scope <code>aws.cognito.signin.user.admin</code>.</p></li><li><p>Amazon Cognito no longer accepts a signed-out user's ID token in a <a href="https://docs.aws.amazon.com/cognitoidentity/latest/APIReference/API_GetId.html">GetId </a> request to an identity pool with <code>ServerSideTokenCheck</code> enabled for its user pool IdP configuration in <a href="https://docs.aws.amazon.com/cognitoidentity/latest/APIReference/API_CognitoIdentityProvider.html">CognitoIdentityProvider</a>.</p></li><li><p>Amazon Cognito no longer accepts a signed-out user's refresh tokens in refresh requests.</p></li></ul><p>Other requests might be valid until your user's token expires.</p><p>Authorize this action with a signed-in user's access token. It must include the scope <code>aws.cognito.signin.user.admin</code>.</p><note><p>Amazon Cognito doesn't evaluate Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you can't use IAM credentials to authorize requests, and you can't grant IAM permissions in policies. For more information about authorization models in Amazon Cognito, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a>.</p></note>
 
 @param request A container for the necessary parameters to execute the GlobalSignOut service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderGlobalSignOutResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorPasswordResetRequired`, `AWSCognitoIdentityProviderErrorUserNotConfirmed`, `AWSCognitoIdentityProviderErrorInternalError`, `AWSCognitoIdentityProviderErrorForbidden`.
 
 @see AWSCognitoIdentityProviderGlobalSignOutRequest
 @see AWSCognitoIdentityProviderGlobalSignOutResponse
 */
- (AWSTask<AWSCognitoIdentityProviderGlobalSignOutResponse *> *)globalSignOut:(AWSCognitoIdentityProviderGlobalSignOutRequest *)request;

/**
 <p>Invalidates the identity, access, and refresh tokens that Amazon Cognito issued to a user. Call this operation when your user signs out of your app. This results in the following behavior. </p><ul><li><p>Amazon Cognito no longer accepts <i>token-authorized</i> user operations that you authorize with a signed-out user's access tokens. For more information, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a>.</p><p>Amazon Cognito returns an <code>Access Token has been revoked</code> error when your app attempts to authorize a user pools API request with a revoked access token that contains the scope <code>aws.cognito.signin.user.admin</code>.</p></li><li><p>Amazon Cognito no longer accepts a signed-out user's ID token in a <a href="https://docs.aws.amazon.com/cognitoidentity/latest/APIReference/API_GetId.html">GetId </a> request to an identity pool with <code>ServerSideTokenCheck</code> enabled for its user pool IdP configuration in <a href="https://docs.aws.amazon.com/cognitoidentity/latest/APIReference/API_CognitoIdentityProvider.html">CognitoIdentityProvider</a>.</p></li><li><p>Amazon Cognito no longer accepts a signed-out user's refresh tokens in refresh requests.</p></li></ul><p>Other requests might be valid until your user's token expires.</p><p>Authorize this action with a signed-in user's access token. It must include the scope <code>aws.cognito.signin.user.admin</code>.</p><note><p>Amazon Cognito doesn't evaluate Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you can't use IAM credentials to authorize requests, and you can't grant IAM permissions in policies. For more information about authorization models in Amazon Cognito, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a>.</p></note>
 
 @param request A container for the necessary parameters to execute the GlobalSignOut service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorPasswordResetRequired`, `AWSCognitoIdentityProviderErrorUserNotConfirmed`, `AWSCognitoIdentityProviderErrorInternalError`, `AWSCognitoIdentityProviderErrorForbidden`.
 
 @see AWSCognitoIdentityProviderGlobalSignOutRequest
 @see AWSCognitoIdentityProviderGlobalSignOutResponse
 */
- (void)globalSignOut:(AWSCognitoIdentityProviderGlobalSignOutRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderGlobalSignOutResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Initiates sign-in for a user in the Amazon Cognito user directory. You can't sign in a user with a federated IdP with <code>InitiateAuth</code>. For more information, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pools-identity-federation.html"> Adding user pool sign-in through a third party</a>.</p><note><p>Amazon Cognito doesn't evaluate Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you can't use IAM credentials to authorize requests, and you can't grant IAM permissions in policies. For more information about authorization models in Amazon Cognito, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a>.</p></note><note><p>This action might generate an SMS text message. Starting June 1, 2021, US telecom carriers require you to register an origination phone number before you can send SMS messages to US phone numbers. If you use SMS text messages in Amazon Cognito, you must register a phone number with <a href="https://console.aws.amazon.com/pinpoint/home/">Amazon Pinpoint</a>. Amazon Cognito uses the registered number automatically. Otherwise, Amazon Cognito users who must receive SMS messages might not be able to sign up, activate their accounts, or sign in.</p><p>If you have never used SMS text messages with Amazon Cognito or any other Amazon Web Service, Amazon Simple Notification Service might place your account in the SMS sandbox. In <i><a href="https://docs.aws.amazon.com/sns/latest/dg/sns-sms-sandbox.html">sandbox mode</a></i>, you can send messages only to verified phone numbers. After you test your app while in the sandbox environment, you can move out of the sandbox and into production. For more information, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pool-sms-settings.html"> SMS message settings for Amazon Cognito user pools</a> in the <i>Amazon Cognito Developer Guide</i>.</p></note>
 
 @param request A container for the necessary parameters to execute the InitiateAuth service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderInitiateAuthResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorUnexpectedLambda`, `AWSCognitoIdentityProviderErrorInvalidUserPoolConfiguration`, `AWSCognitoIdentityProviderErrorUserLambdaValidation`, `AWSCognitoIdentityProviderErrorInvalidLambdaResponse`, `AWSCognitoIdentityProviderErrorPasswordResetRequired`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorUserNotConfirmed`, `AWSCognitoIdentityProviderErrorInternalError`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleAccessPolicy`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleTrustRelationship`, `AWSCognitoIdentityProviderErrorForbidden`.
 
 @see AWSCognitoIdentityProviderInitiateAuthRequest
 @see AWSCognitoIdentityProviderInitiateAuthResponse
 */
- (AWSTask<AWSCognitoIdentityProviderInitiateAuthResponse *> *)initiateAuth:(AWSCognitoIdentityProviderInitiateAuthRequest *)request;

/**
 <p>Initiates sign-in for a user in the Amazon Cognito user directory. You can't sign in a user with a federated IdP with <code>InitiateAuth</code>. For more information, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pools-identity-federation.html"> Adding user pool sign-in through a third party</a>.</p><note><p>Amazon Cognito doesn't evaluate Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you can't use IAM credentials to authorize requests, and you can't grant IAM permissions in policies. For more information about authorization models in Amazon Cognito, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a>.</p></note><note><p>This action might generate an SMS text message. Starting June 1, 2021, US telecom carriers require you to register an origination phone number before you can send SMS messages to US phone numbers. If you use SMS text messages in Amazon Cognito, you must register a phone number with <a href="https://console.aws.amazon.com/pinpoint/home/">Amazon Pinpoint</a>. Amazon Cognito uses the registered number automatically. Otherwise, Amazon Cognito users who must receive SMS messages might not be able to sign up, activate their accounts, or sign in.</p><p>If you have never used SMS text messages with Amazon Cognito or any other Amazon Web Service, Amazon Simple Notification Service might place your account in the SMS sandbox. In <i><a href="https://docs.aws.amazon.com/sns/latest/dg/sns-sms-sandbox.html">sandbox mode</a></i>, you can send messages only to verified phone numbers. After you test your app while in the sandbox environment, you can move out of the sandbox and into production. For more information, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pool-sms-settings.html"> SMS message settings for Amazon Cognito user pools</a> in the <i>Amazon Cognito Developer Guide</i>.</p></note>
 
 @param request A container for the necessary parameters to execute the InitiateAuth service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorUnexpectedLambda`, `AWSCognitoIdentityProviderErrorInvalidUserPoolConfiguration`, `AWSCognitoIdentityProviderErrorUserLambdaValidation`, `AWSCognitoIdentityProviderErrorInvalidLambdaResponse`, `AWSCognitoIdentityProviderErrorPasswordResetRequired`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorUserNotConfirmed`, `AWSCognitoIdentityProviderErrorInternalError`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleAccessPolicy`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleTrustRelationship`, `AWSCognitoIdentityProviderErrorForbidden`.
 
 @see AWSCognitoIdentityProviderInitiateAuthRequest
 @see AWSCognitoIdentityProviderInitiateAuthResponse
 */
- (void)initiateAuth:(AWSCognitoIdentityProviderInitiateAuthRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderInitiateAuthResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the sign-in devices that Amazon Cognito has registered to the current user. For more information about device authentication, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/amazon-cognito-user-pools-device-tracking.html">Working with user devices in your user pool</a>.</p><p>Authorize this action with a signed-in user's access token. It must include the scope <code>aws.cognito.signin.user.admin</code>.</p><note><p>Amazon Cognito doesn't evaluate Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you can't use IAM credentials to authorize requests, and you can't grant IAM permissions in policies. For more information about authorization models in Amazon Cognito, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a>.</p></note>
 
 @param request A container for the necessary parameters to execute the ListDevices service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderListDevicesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorInvalidUserPoolConfiguration`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorPasswordResetRequired`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorUserNotConfirmed`, `AWSCognitoIdentityProviderErrorInternalError`, `AWSCognitoIdentityProviderErrorForbidden`.
 
 @see AWSCognitoIdentityProviderListDevicesRequest
 @see AWSCognitoIdentityProviderListDevicesResponse
 */
- (AWSTask<AWSCognitoIdentityProviderListDevicesResponse *> *)listDevices:(AWSCognitoIdentityProviderListDevicesRequest *)request;

/**
 <p>Lists the sign-in devices that Amazon Cognito has registered to the current user. For more information about device authentication, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/amazon-cognito-user-pools-device-tracking.html">Working with user devices in your user pool</a>.</p><p>Authorize this action with a signed-in user's access token. It must include the scope <code>aws.cognito.signin.user.admin</code>.</p><note><p>Amazon Cognito doesn't evaluate Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you can't use IAM credentials to authorize requests, and you can't grant IAM permissions in policies. For more information about authorization models in Amazon Cognito, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a>.</p></note>
 
 @param request A container for the necessary parameters to execute the ListDevices service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorInvalidUserPoolConfiguration`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorPasswordResetRequired`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorUserNotConfirmed`, `AWSCognitoIdentityProviderErrorInternalError`, `AWSCognitoIdentityProviderErrorForbidden`.
 
 @see AWSCognitoIdentityProviderListDevicesRequest
 @see AWSCognitoIdentityProviderListDevicesResponse
 */
- (void)listDevices:(AWSCognitoIdentityProviderListDevicesRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderListDevicesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the groups associated with a user pool.</p><note><p>Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you must use IAM credentials to authorize requests, and you must grant yourself the corresponding IAM permission in a policy.</p><p class="title"><b>Learn more</b></p><ul><li><p><a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html">Signing Amazon Web Services API Requests</a></p></li><li><p><a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a></p></li></ul></note>
 
 @param request A container for the necessary parameters to execute the ListGroups service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderListGroupsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderListGroupsRequest
 @see AWSCognitoIdentityProviderListGroupsResponse
 */
- (AWSTask<AWSCognitoIdentityProviderListGroupsResponse *> *)listGroups:(AWSCognitoIdentityProviderListGroupsRequest *)request;

/**
 <p>Lists the groups associated with a user pool.</p><note><p>Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you must use IAM credentials to authorize requests, and you must grant yourself the corresponding IAM permission in a policy.</p><p class="title"><b>Learn more</b></p><ul><li><p><a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html">Signing Amazon Web Services API Requests</a></p></li><li><p><a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a></p></li></ul></note>
 
 @param request A container for the necessary parameters to execute the ListGroups service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderListGroupsRequest
 @see AWSCognitoIdentityProviderListGroupsResponse
 */
- (void)listGroups:(AWSCognitoIdentityProviderListGroupsRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderListGroupsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists information about all IdPs for a user pool.</p><note><p>Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you must use IAM credentials to authorize requests, and you must grant yourself the corresponding IAM permission in a policy.</p><p class="title"><b>Learn more</b></p><ul><li><p><a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html">Signing Amazon Web Services API Requests</a></p></li><li><p><a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a></p></li></ul></note>
 
 @param request A container for the necessary parameters to execute the ListIdentityProviders service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderListIdentityProvidersResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderListIdentityProvidersRequest
 @see AWSCognitoIdentityProviderListIdentityProvidersResponse
 */
- (AWSTask<AWSCognitoIdentityProviderListIdentityProvidersResponse *> *)listIdentityProviders:(AWSCognitoIdentityProviderListIdentityProvidersRequest *)request;

/**
 <p>Lists information about all IdPs for a user pool.</p><note><p>Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you must use IAM credentials to authorize requests, and you must grant yourself the corresponding IAM permission in a policy.</p><p class="title"><b>Learn more</b></p><ul><li><p><a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html">Signing Amazon Web Services API Requests</a></p></li><li><p><a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a></p></li></ul></note>
 
 @param request A container for the necessary parameters to execute the ListIdentityProviders service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderListIdentityProvidersRequest
 @see AWSCognitoIdentityProviderListIdentityProvidersResponse
 */
- (void)listIdentityProviders:(AWSCognitoIdentityProviderListIdentityProvidersRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderListIdentityProvidersResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the resource servers for a user pool.</p><note><p>Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you must use IAM credentials to authorize requests, and you must grant yourself the corresponding IAM permission in a policy.</p><p class="title"><b>Learn more</b></p><ul><li><p><a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html">Signing Amazon Web Services API Requests</a></p></li><li><p><a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a></p></li></ul></note>
 
 @param request A container for the necessary parameters to execute the ListResourceServers service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderListResourceServersResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderListResourceServersRequest
 @see AWSCognitoIdentityProviderListResourceServersResponse
 */
- (AWSTask<AWSCognitoIdentityProviderListResourceServersResponse *> *)listResourceServers:(AWSCognitoIdentityProviderListResourceServersRequest *)request;

/**
 <p>Lists the resource servers for a user pool.</p><note><p>Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you must use IAM credentials to authorize requests, and you must grant yourself the corresponding IAM permission in a policy.</p><p class="title"><b>Learn more</b></p><ul><li><p><a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html">Signing Amazon Web Services API Requests</a></p></li><li><p><a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a></p></li></ul></note>
 
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
 <p>Lists user import jobs for a user pool.</p><note><p>Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you must use IAM credentials to authorize requests, and you must grant yourself the corresponding IAM permission in a policy.</p><p class="title"><b>Learn more</b></p><ul><li><p><a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html">Signing Amazon Web Services API Requests</a></p></li><li><p><a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a></p></li></ul></note>
 
 @param request A container for the necessary parameters to execute the ListUserImportJobs service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderListUserImportJobsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderListUserImportJobsRequest
 @see AWSCognitoIdentityProviderListUserImportJobsResponse
 */
- (AWSTask<AWSCognitoIdentityProviderListUserImportJobsResponse *> *)listUserImportJobs:(AWSCognitoIdentityProviderListUserImportJobsRequest *)request;

/**
 <p>Lists user import jobs for a user pool.</p><note><p>Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you must use IAM credentials to authorize requests, and you must grant yourself the corresponding IAM permission in a policy.</p><p class="title"><b>Learn more</b></p><ul><li><p><a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html">Signing Amazon Web Services API Requests</a></p></li><li><p><a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a></p></li></ul></note>
 
 @param request A container for the necessary parameters to execute the ListUserImportJobs service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderListUserImportJobsRequest
 @see AWSCognitoIdentityProviderListUserImportJobsResponse
 */
- (void)listUserImportJobs:(AWSCognitoIdentityProviderListUserImportJobsRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderListUserImportJobsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the clients that have been created for the specified user pool.</p><note><p>Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you must use IAM credentials to authorize requests, and you must grant yourself the corresponding IAM permission in a policy.</p><p class="title"><b>Learn more</b></p><ul><li><p><a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html">Signing Amazon Web Services API Requests</a></p></li><li><p><a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a></p></li></ul></note>
 
 @param request A container for the necessary parameters to execute the ListUserPoolClients service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderListUserPoolClientsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderListUserPoolClientsRequest
 @see AWSCognitoIdentityProviderListUserPoolClientsResponse
 */
- (AWSTask<AWSCognitoIdentityProviderListUserPoolClientsResponse *> *)listUserPoolClients:(AWSCognitoIdentityProviderListUserPoolClientsRequest *)request;

/**
 <p>Lists the clients that have been created for the specified user pool.</p><note><p>Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you must use IAM credentials to authorize requests, and you must grant yourself the corresponding IAM permission in a policy.</p><p class="title"><b>Learn more</b></p><ul><li><p><a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html">Signing Amazon Web Services API Requests</a></p></li><li><p><a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a></p></li></ul></note>
 
 @param request A container for the necessary parameters to execute the ListUserPoolClients service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderListUserPoolClientsRequest
 @see AWSCognitoIdentityProviderListUserPoolClientsResponse
 */
- (void)listUserPoolClients:(AWSCognitoIdentityProviderListUserPoolClientsRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderListUserPoolClientsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the user pools associated with an Amazon Web Services account.</p><note><p>Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you must use IAM credentials to authorize requests, and you must grant yourself the corresponding IAM permission in a policy.</p><p class="title"><b>Learn more</b></p><ul><li><p><a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html">Signing Amazon Web Services API Requests</a></p></li><li><p><a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a></p></li></ul></note>
 
 @param request A container for the necessary parameters to execute the ListUserPools service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderListUserPoolsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderListUserPoolsRequest
 @see AWSCognitoIdentityProviderListUserPoolsResponse
 */
- (AWSTask<AWSCognitoIdentityProviderListUserPoolsResponse *> *)listUserPools:(AWSCognitoIdentityProviderListUserPoolsRequest *)request;

/**
 <p>Lists the user pools associated with an Amazon Web Services account.</p><note><p>Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you must use IAM credentials to authorize requests, and you must grant yourself the corresponding IAM permission in a policy.</p><p class="title"><b>Learn more</b></p><ul><li><p><a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html">Signing Amazon Web Services API Requests</a></p></li><li><p><a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a></p></li></ul></note>
 
 @param request A container for the necessary parameters to execute the ListUserPools service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderListUserPoolsRequest
 @see AWSCognitoIdentityProviderListUserPoolsResponse
 */
- (void)listUserPools:(AWSCognitoIdentityProviderListUserPoolsRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderListUserPoolsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists users and their basic details in a user pool.</p><note><p>Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you must use IAM credentials to authorize requests, and you must grant yourself the corresponding IAM permission in a policy.</p><p class="title"><b>Learn more</b></p><ul><li><p><a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html">Signing Amazon Web Services API Requests</a></p></li><li><p><a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a></p></li></ul></note>
 
 @param request A container for the necessary parameters to execute the ListUsers service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderListUsersResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderListUsersRequest
 @see AWSCognitoIdentityProviderListUsersResponse
 */
- (AWSTask<AWSCognitoIdentityProviderListUsersResponse *> *)listUsers:(AWSCognitoIdentityProviderListUsersRequest *)request;

/**
 <p>Lists users and their basic details in a user pool.</p><note><p>Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you must use IAM credentials to authorize requests, and you must grant yourself the corresponding IAM permission in a policy.</p><p class="title"><b>Learn more</b></p><ul><li><p><a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html">Signing Amazon Web Services API Requests</a></p></li><li><p><a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a></p></li></ul></note>
 
 @param request A container for the necessary parameters to execute the ListUsers service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderListUsersRequest
 @see AWSCognitoIdentityProviderListUsersResponse
 */
- (void)listUsers:(AWSCognitoIdentityProviderListUsersRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderListUsersResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the users in the specified group.</p><note><p>Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you must use IAM credentials to authorize requests, and you must grant yourself the corresponding IAM permission in a policy.</p><p class="title"><b>Learn more</b></p><ul><li><p><a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html">Signing Amazon Web Services API Requests</a></p></li><li><p><a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a></p></li></ul></note>
 
 @param request A container for the necessary parameters to execute the ListUsersInGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderListUsersInGroupResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderListUsersInGroupRequest
 @see AWSCognitoIdentityProviderListUsersInGroupResponse
 */
- (AWSTask<AWSCognitoIdentityProviderListUsersInGroupResponse *> *)listUsersInGroup:(AWSCognitoIdentityProviderListUsersInGroupRequest *)request;

/**
 <p>Lists the users in the specified group.</p><note><p>Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you must use IAM credentials to authorize requests, and you must grant yourself the corresponding IAM permission in a policy.</p><p class="title"><b>Learn more</b></p><ul><li><p><a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html">Signing Amazon Web Services API Requests</a></p></li><li><p><a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a></p></li></ul></note>
 
 @param request A container for the necessary parameters to execute the ListUsersInGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderListUsersInGroupRequest
 @see AWSCognitoIdentityProviderListUsersInGroupResponse
 */
- (void)listUsersInGroup:(AWSCognitoIdentityProviderListUsersInGroupRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderListUsersInGroupResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Resends the confirmation (for confirmation of registration) to a specific user in the user pool.</p><note><p>Amazon Cognito doesn't evaluate Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you can't use IAM credentials to authorize requests, and you can't grant IAM permissions in policies. For more information about authorization models in Amazon Cognito, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a>.</p></note><note><p>This action might generate an SMS text message. Starting June 1, 2021, US telecom carriers require you to register an origination phone number before you can send SMS messages to US phone numbers. If you use SMS text messages in Amazon Cognito, you must register a phone number with <a href="https://console.aws.amazon.com/pinpoint/home/">Amazon Pinpoint</a>. Amazon Cognito uses the registered number automatically. Otherwise, Amazon Cognito users who must receive SMS messages might not be able to sign up, activate their accounts, or sign in.</p><p>If you have never used SMS text messages with Amazon Cognito or any other Amazon Web Service, Amazon Simple Notification Service might place your account in the SMS sandbox. In <i><a href="https://docs.aws.amazon.com/sns/latest/dg/sns-sms-sandbox.html">sandbox mode</a></i>, you can send messages only to verified phone numbers. After you test your app while in the sandbox environment, you can move out of the sandbox and into production. For more information, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pool-sms-settings.html"> SMS message settings for Amazon Cognito user pools</a> in the <i>Amazon Cognito Developer Guide</i>.</p></note>
 
 @param request A container for the necessary parameters to execute the ResendConfirmationCode service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderResendConfirmationCodeResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorUnexpectedLambda`, `AWSCognitoIdentityProviderErrorUserLambdaValidation`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorInvalidLambdaResponse`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorLimitExceeded`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleAccessPolicy`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleTrustRelationship`, `AWSCognitoIdentityProviderErrorInvalidEmailRoleAccessPolicy`, `AWSCognitoIdentityProviderErrorCodeDeliveryFailure`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorInternalError`, `AWSCognitoIdentityProviderErrorForbidden`.
 
 @see AWSCognitoIdentityProviderResendConfirmationCodeRequest
 @see AWSCognitoIdentityProviderResendConfirmationCodeResponse
 */
- (AWSTask<AWSCognitoIdentityProviderResendConfirmationCodeResponse *> *)resendConfirmationCode:(AWSCognitoIdentityProviderResendConfirmationCodeRequest *)request;

/**
 <p>Resends the confirmation (for confirmation of registration) to a specific user in the user pool.</p><note><p>Amazon Cognito doesn't evaluate Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you can't use IAM credentials to authorize requests, and you can't grant IAM permissions in policies. For more information about authorization models in Amazon Cognito, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a>.</p></note><note><p>This action might generate an SMS text message. Starting June 1, 2021, US telecom carriers require you to register an origination phone number before you can send SMS messages to US phone numbers. If you use SMS text messages in Amazon Cognito, you must register a phone number with <a href="https://console.aws.amazon.com/pinpoint/home/">Amazon Pinpoint</a>. Amazon Cognito uses the registered number automatically. Otherwise, Amazon Cognito users who must receive SMS messages might not be able to sign up, activate their accounts, or sign in.</p><p>If you have never used SMS text messages with Amazon Cognito or any other Amazon Web Service, Amazon Simple Notification Service might place your account in the SMS sandbox. In <i><a href="https://docs.aws.amazon.com/sns/latest/dg/sns-sms-sandbox.html">sandbox mode</a></i>, you can send messages only to verified phone numbers. After you test your app while in the sandbox environment, you can move out of the sandbox and into production. For more information, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pool-sms-settings.html"> SMS message settings for Amazon Cognito user pools</a> in the <i>Amazon Cognito Developer Guide</i>.</p></note>
 
 @param request A container for the necessary parameters to execute the ResendConfirmationCode service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorUnexpectedLambda`, `AWSCognitoIdentityProviderErrorUserLambdaValidation`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorInvalidLambdaResponse`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorLimitExceeded`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleAccessPolicy`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleTrustRelationship`, `AWSCognitoIdentityProviderErrorInvalidEmailRoleAccessPolicy`, `AWSCognitoIdentityProviderErrorCodeDeliveryFailure`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorInternalError`, `AWSCognitoIdentityProviderErrorForbidden`.
 
 @see AWSCognitoIdentityProviderResendConfirmationCodeRequest
 @see AWSCognitoIdentityProviderResendConfirmationCodeResponse
 */
- (void)resendConfirmationCode:(AWSCognitoIdentityProviderResendConfirmationCodeRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderResendConfirmationCodeResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Some API operations in a user pool generate a challenge, like a prompt for an MFA code, for device authentication that bypasses MFA, or for a custom authentication challenge. A <code>RespondToAuthChallenge</code> API request provides the answer to that challenge, like a code or a secure remote password (SRP). The parameters of a response to an authentication challenge vary with the type of challenge.</p><p>For more information about custom authentication challenges, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pool-lambda-challenge.html">Custom authentication challenge Lambda triggers</a>.</p><note><p>Amazon Cognito doesn't evaluate Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you can't use IAM credentials to authorize requests, and you can't grant IAM permissions in policies. For more information about authorization models in Amazon Cognito, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a>.</p></note><note><p>This action might generate an SMS text message. Starting June 1, 2021, US telecom carriers require you to register an origination phone number before you can send SMS messages to US phone numbers. If you use SMS text messages in Amazon Cognito, you must register a phone number with <a href="https://console.aws.amazon.com/pinpoint/home/">Amazon Pinpoint</a>. Amazon Cognito uses the registered number automatically. Otherwise, Amazon Cognito users who must receive SMS messages might not be able to sign up, activate their accounts, or sign in.</p><p>If you have never used SMS text messages with Amazon Cognito or any other Amazon Web Service, Amazon Simple Notification Service might place your account in the SMS sandbox. In <i><a href="https://docs.aws.amazon.com/sns/latest/dg/sns-sms-sandbox.html">sandbox mode</a></i>, you can send messages only to verified phone numbers. After you test your app while in the sandbox environment, you can move out of the sandbox and into production. For more information, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pool-sms-settings.html"> SMS message settings for Amazon Cognito user pools</a> in the <i>Amazon Cognito Developer Guide</i>.</p></note>
 
 @param request A container for the necessary parameters to execute the RespondToAuthChallenge service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderRespondToAuthChallengeResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorCodeMismatch`, `AWSCognitoIdentityProviderErrorExpiredCode`, `AWSCognitoIdentityProviderErrorUnexpectedLambda`, `AWSCognitoIdentityProviderErrorUserLambdaValidation`, `AWSCognitoIdentityProviderErrorInvalidPassword`, `AWSCognitoIdentityProviderErrorInvalidLambdaResponse`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInvalidUserPoolConfiguration`, `AWSCognitoIdentityProviderErrorMFAMethodNotFound`, `AWSCognitoIdentityProviderErrorPasswordResetRequired`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorUserNotConfirmed`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleAccessPolicy`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleTrustRelationship`, `AWSCognitoIdentityProviderErrorAliasExists`, `AWSCognitoIdentityProviderErrorInternalError`, `AWSCognitoIdentityProviderErrorSoftwareTokenMFANotFound`, `AWSCognitoIdentityProviderErrorForbidden`.
 
 @see AWSCognitoIdentityProviderRespondToAuthChallengeRequest
 @see AWSCognitoIdentityProviderRespondToAuthChallengeResponse
 */
- (AWSTask<AWSCognitoIdentityProviderRespondToAuthChallengeResponse *> *)respondToAuthChallenge:(AWSCognitoIdentityProviderRespondToAuthChallengeRequest *)request;

/**
 <p>Some API operations in a user pool generate a challenge, like a prompt for an MFA code, for device authentication that bypasses MFA, or for a custom authentication challenge. A <code>RespondToAuthChallenge</code> API request provides the answer to that challenge, like a code or a secure remote password (SRP). The parameters of a response to an authentication challenge vary with the type of challenge.</p><p>For more information about custom authentication challenges, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pool-lambda-challenge.html">Custom authentication challenge Lambda triggers</a>.</p><note><p>Amazon Cognito doesn't evaluate Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you can't use IAM credentials to authorize requests, and you can't grant IAM permissions in policies. For more information about authorization models in Amazon Cognito, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a>.</p></note><note><p>This action might generate an SMS text message. Starting June 1, 2021, US telecom carriers require you to register an origination phone number before you can send SMS messages to US phone numbers. If you use SMS text messages in Amazon Cognito, you must register a phone number with <a href="https://console.aws.amazon.com/pinpoint/home/">Amazon Pinpoint</a>. Amazon Cognito uses the registered number automatically. Otherwise, Amazon Cognito users who must receive SMS messages might not be able to sign up, activate their accounts, or sign in.</p><p>If you have never used SMS text messages with Amazon Cognito or any other Amazon Web Service, Amazon Simple Notification Service might place your account in the SMS sandbox. In <i><a href="https://docs.aws.amazon.com/sns/latest/dg/sns-sms-sandbox.html">sandbox mode</a></i>, you can send messages only to verified phone numbers. After you test your app while in the sandbox environment, you can move out of the sandbox and into production. For more information, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pool-sms-settings.html"> SMS message settings for Amazon Cognito user pools</a> in the <i>Amazon Cognito Developer Guide</i>.</p></note>
 
 @param request A container for the necessary parameters to execute the RespondToAuthChallenge service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorCodeMismatch`, `AWSCognitoIdentityProviderErrorExpiredCode`, `AWSCognitoIdentityProviderErrorUnexpectedLambda`, `AWSCognitoIdentityProviderErrorUserLambdaValidation`, `AWSCognitoIdentityProviderErrorInvalidPassword`, `AWSCognitoIdentityProviderErrorInvalidLambdaResponse`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInvalidUserPoolConfiguration`, `AWSCognitoIdentityProviderErrorMFAMethodNotFound`, `AWSCognitoIdentityProviderErrorPasswordResetRequired`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorUserNotConfirmed`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleAccessPolicy`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleTrustRelationship`, `AWSCognitoIdentityProviderErrorAliasExists`, `AWSCognitoIdentityProviderErrorInternalError`, `AWSCognitoIdentityProviderErrorSoftwareTokenMFANotFound`, `AWSCognitoIdentityProviderErrorForbidden`.
 
 @see AWSCognitoIdentityProviderRespondToAuthChallengeRequest
 @see AWSCognitoIdentityProviderRespondToAuthChallengeResponse
 */
- (void)respondToAuthChallenge:(AWSCognitoIdentityProviderRespondToAuthChallengeRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderRespondToAuthChallengeResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Revokes all of the access tokens generated by, and at the same time as, the specified refresh token. After a token is revoked, you can't use the revoked token to access Amazon Cognito user APIs, or to authorize access to your resource server.</p><note><p>Amazon Cognito doesn't evaluate Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you can't use IAM credentials to authorize requests, and you can't grant IAM permissions in policies. For more information about authorization models in Amazon Cognito, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a>.</p></note>
 
 @param request A container for the necessary parameters to execute the RevokeToken service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderRevokeTokenResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`, `AWSCognitoIdentityProviderErrorUnauthorized`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorUnsupportedOperation`, `AWSCognitoIdentityProviderErrorUnsupportedTokenType`, `AWSCognitoIdentityProviderErrorForbidden`.
 
 @see AWSCognitoIdentityProviderRevokeTokenRequest
 @see AWSCognitoIdentityProviderRevokeTokenResponse
 */
- (AWSTask<AWSCognitoIdentityProviderRevokeTokenResponse *> *)revokeToken:(AWSCognitoIdentityProviderRevokeTokenRequest *)request;

/**
 <p>Revokes all of the access tokens generated by, and at the same time as, the specified refresh token. After a token is revoked, you can't use the revoked token to access Amazon Cognito user APIs, or to authorize access to your resource server.</p><note><p>Amazon Cognito doesn't evaluate Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you can't use IAM credentials to authorize requests, and you can't grant IAM permissions in policies. For more information about authorization models in Amazon Cognito, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a>.</p></note>
 
 @param request A container for the necessary parameters to execute the RevokeToken service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`, `AWSCognitoIdentityProviderErrorUnauthorized`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorUnsupportedOperation`, `AWSCognitoIdentityProviderErrorUnsupportedTokenType`, `AWSCognitoIdentityProviderErrorForbidden`.
 
 @see AWSCognitoIdentityProviderRevokeTokenRequest
 @see AWSCognitoIdentityProviderRevokeTokenResponse
 */
- (void)revokeToken:(AWSCognitoIdentityProviderRevokeTokenRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderRevokeTokenResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Sets up or modifies the detailed activity logging configuration of a user pool.</p>
 
 @param request A container for the necessary parameters to execute the SetLogDeliveryConfiguration service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderSetLogDeliveryConfigurationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorInternalError`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorResourceNotFound`.
 
 @see AWSCognitoIdentityProviderSetLogDeliveryConfigurationRequest
 @see AWSCognitoIdentityProviderSetLogDeliveryConfigurationResponse
 */
- (AWSTask<AWSCognitoIdentityProviderSetLogDeliveryConfigurationResponse *> *)setLogDeliveryConfiguration:(AWSCognitoIdentityProviderSetLogDeliveryConfigurationRequest *)request;

/**
 <p>Sets up or modifies the detailed activity logging configuration of a user pool.</p>
 
 @param request A container for the necessary parameters to execute the SetLogDeliveryConfiguration service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorInternalError`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorResourceNotFound`.
 
 @see AWSCognitoIdentityProviderSetLogDeliveryConfigurationRequest
 @see AWSCognitoIdentityProviderSetLogDeliveryConfigurationResponse
 */
- (void)setLogDeliveryConfiguration:(AWSCognitoIdentityProviderSetLogDeliveryConfigurationRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderSetLogDeliveryConfigurationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

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
 <p>Set the user's multi-factor authentication (MFA) method preference, including which MFA factors are activated and if any are preferred. Only one factor can be set as preferred. The preferred MFA factor will be used to authenticate a user if multiple factors are activated. If multiple options are activated and no preference is set, a challenge to choose an MFA option will be returned during sign-in. If an MFA type is activated for a user, the user will be prompted for MFA during all sign-in attempts unless device tracking is turned on and the device has been trusted. If you want MFA to be applied selectively based on the assessed risk level of sign-in attempts, deactivate MFA for users and turn on Adaptive Authentication for the user pool.</p><p>Authorize this action with a signed-in user's access token. It must include the scope <code>aws.cognito.signin.user.admin</code>.</p><note><p>Amazon Cognito doesn't evaluate Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you can't use IAM credentials to authorize requests, and you can't grant IAM permissions in policies. For more information about authorization models in Amazon Cognito, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a>.</p></note>
 
 @param request A container for the necessary parameters to execute the SetUserMFAPreference service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderSetUserMFAPreferenceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorPasswordResetRequired`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorUserNotConfirmed`, `AWSCognitoIdentityProviderErrorInternalError`, `AWSCognitoIdentityProviderErrorForbidden`.
 
 @see AWSCognitoIdentityProviderSetUserMFAPreferenceRequest
 @see AWSCognitoIdentityProviderSetUserMFAPreferenceResponse
 */
- (AWSTask<AWSCognitoIdentityProviderSetUserMFAPreferenceResponse *> *)setUserMFAPreference:(AWSCognitoIdentityProviderSetUserMFAPreferenceRequest *)request;

/**
 <p>Set the user's multi-factor authentication (MFA) method preference, including which MFA factors are activated and if any are preferred. Only one factor can be set as preferred. The preferred MFA factor will be used to authenticate a user if multiple factors are activated. If multiple options are activated and no preference is set, a challenge to choose an MFA option will be returned during sign-in. If an MFA type is activated for a user, the user will be prompted for MFA during all sign-in attempts unless device tracking is turned on and the device has been trusted. If you want MFA to be applied selectively based on the assessed risk level of sign-in attempts, deactivate MFA for users and turn on Adaptive Authentication for the user pool.</p><p>Authorize this action with a signed-in user's access token. It must include the scope <code>aws.cognito.signin.user.admin</code>.</p><note><p>Amazon Cognito doesn't evaluate Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you can't use IAM credentials to authorize requests, and you can't grant IAM permissions in policies. For more information about authorization models in Amazon Cognito, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a>.</p></note>
 
 @param request A container for the necessary parameters to execute the SetUserMFAPreference service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorPasswordResetRequired`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorUserNotConfirmed`, `AWSCognitoIdentityProviderErrorInternalError`, `AWSCognitoIdentityProviderErrorForbidden`.
 
 @see AWSCognitoIdentityProviderSetUserMFAPreferenceRequest
 @see AWSCognitoIdentityProviderSetUserMFAPreferenceResponse
 */
- (void)setUserMFAPreference:(AWSCognitoIdentityProviderSetUserMFAPreferenceRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderSetUserMFAPreferenceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Sets the user pool multi-factor authentication (MFA) configuration.</p><note><p>This action might generate an SMS text message. Starting June 1, 2021, US telecom carriers require you to register an origination phone number before you can send SMS messages to US phone numbers. If you use SMS text messages in Amazon Cognito, you must register a phone number with <a href="https://console.aws.amazon.com/pinpoint/home/">Amazon Pinpoint</a>. Amazon Cognito uses the registered number automatically. Otherwise, Amazon Cognito users who must receive SMS messages might not be able to sign up, activate their accounts, or sign in.</p><p>If you have never used SMS text messages with Amazon Cognito or any other Amazon Web Service, Amazon Simple Notification Service might place your account in the SMS sandbox. In <i><a href="https://docs.aws.amazon.com/sns/latest/dg/sns-sms-sandbox.html">sandbox mode</a></i>, you can send messages only to verified phone numbers. After you test your app while in the sandbox environment, you can move out of the sandbox and into production. For more information, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pool-sms-settings.html"> SMS message settings for Amazon Cognito user pools</a> in the <i>Amazon Cognito Developer Guide</i>.</p></note>
 
 @param request A container for the necessary parameters to execute the SetUserPoolMfaConfig service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderSetUserPoolMfaConfigResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorConcurrentModification`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleAccessPolicy`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleTrustRelationship`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderSetUserPoolMfaConfigRequest
 @see AWSCognitoIdentityProviderSetUserPoolMfaConfigResponse
 */
- (AWSTask<AWSCognitoIdentityProviderSetUserPoolMfaConfigResponse *> *)setUserPoolMfaConfig:(AWSCognitoIdentityProviderSetUserPoolMfaConfigRequest *)request;

/**
 <p>Sets the user pool multi-factor authentication (MFA) configuration.</p><note><p>This action might generate an SMS text message. Starting June 1, 2021, US telecom carriers require you to register an origination phone number before you can send SMS messages to US phone numbers. If you use SMS text messages in Amazon Cognito, you must register a phone number with <a href="https://console.aws.amazon.com/pinpoint/home/">Amazon Pinpoint</a>. Amazon Cognito uses the registered number automatically. Otherwise, Amazon Cognito users who must receive SMS messages might not be able to sign up, activate their accounts, or sign in.</p><p>If you have never used SMS text messages with Amazon Cognito or any other Amazon Web Service, Amazon Simple Notification Service might place your account in the SMS sandbox. In <i><a href="https://docs.aws.amazon.com/sns/latest/dg/sns-sms-sandbox.html">sandbox mode</a></i>, you can send messages only to verified phone numbers. After you test your app while in the sandbox environment, you can move out of the sandbox and into production. For more information, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pool-sms-settings.html"> SMS message settings for Amazon Cognito user pools</a> in the <i>Amazon Cognito Developer Guide</i>.</p></note>
 
 @param request A container for the necessary parameters to execute the SetUserPoolMfaConfig service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorConcurrentModification`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleAccessPolicy`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleTrustRelationship`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderSetUserPoolMfaConfigRequest
 @see AWSCognitoIdentityProviderSetUserPoolMfaConfigResponse
 */
- (void)setUserPoolMfaConfig:(AWSCognitoIdentityProviderSetUserPoolMfaConfigRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderSetUserPoolMfaConfigResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p><i>This action is no longer supported.</i> You can use it to configure only SMS MFA. You can't use it to configure time-based one-time password (TOTP) software token MFA. To configure either type of MFA, use <a href="https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_SetUserMFAPreference.html">SetUserMFAPreference</a> instead.</p><p>Authorize this action with a signed-in user's access token. It must include the scope <code>aws.cognito.signin.user.admin</code>.</p><note><p>Amazon Cognito doesn't evaluate Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you can't use IAM credentials to authorize requests, and you can't grant IAM permissions in policies. For more information about authorization models in Amazon Cognito, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a>.</p></note>
 
 @param request A container for the necessary parameters to execute the SetUserSettings service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderSetUserSettingsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorPasswordResetRequired`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorUserNotConfirmed`, `AWSCognitoIdentityProviderErrorInternalError`, `AWSCognitoIdentityProviderErrorForbidden`.
 
 @see AWSCognitoIdentityProviderSetUserSettingsRequest
 @see AWSCognitoIdentityProviderSetUserSettingsResponse
 */
- (AWSTask<AWSCognitoIdentityProviderSetUserSettingsResponse *> *)setUserSettings:(AWSCognitoIdentityProviderSetUserSettingsRequest *)request;

/**
 <p><i>This action is no longer supported.</i> You can use it to configure only SMS MFA. You can't use it to configure time-based one-time password (TOTP) software token MFA. To configure either type of MFA, use <a href="https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_SetUserMFAPreference.html">SetUserMFAPreference</a> instead.</p><p>Authorize this action with a signed-in user's access token. It must include the scope <code>aws.cognito.signin.user.admin</code>.</p><note><p>Amazon Cognito doesn't evaluate Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you can't use IAM credentials to authorize requests, and you can't grant IAM permissions in policies. For more information about authorization models in Amazon Cognito, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a>.</p></note>
 
 @param request A container for the necessary parameters to execute the SetUserSettings service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorPasswordResetRequired`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorUserNotConfirmed`, `AWSCognitoIdentityProviderErrorInternalError`, `AWSCognitoIdentityProviderErrorForbidden`.
 
 @see AWSCognitoIdentityProviderSetUserSettingsRequest
 @see AWSCognitoIdentityProviderSetUserSettingsResponse
 */
- (void)setUserSettings:(AWSCognitoIdentityProviderSetUserSettingsRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderSetUserSettingsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Registers the user in the specified user pool and creates a user name, password, and user attributes.</p><note><p>Amazon Cognito doesn't evaluate Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you can't use IAM credentials to authorize requests, and you can't grant IAM permissions in policies. For more information about authorization models in Amazon Cognito, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a>.</p></note><note><p>This action might generate an SMS text message. Starting June 1, 2021, US telecom carriers require you to register an origination phone number before you can send SMS messages to US phone numbers. If you use SMS text messages in Amazon Cognito, you must register a phone number with <a href="https://console.aws.amazon.com/pinpoint/home/">Amazon Pinpoint</a>. Amazon Cognito uses the registered number automatically. Otherwise, Amazon Cognito users who must receive SMS messages might not be able to sign up, activate their accounts, or sign in.</p><p>If you have never used SMS text messages with Amazon Cognito or any other Amazon Web Service, Amazon Simple Notification Service might place your account in the SMS sandbox. In <i><a href="https://docs.aws.amazon.com/sns/latest/dg/sns-sms-sandbox.html">sandbox mode</a></i>, you can send messages only to verified phone numbers. After you test your app while in the sandbox environment, you can move out of the sandbox and into production. For more information, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pool-sms-settings.html"> SMS message settings for Amazon Cognito user pools</a> in the <i>Amazon Cognito Developer Guide</i>.</p></note>
 
 @param request A container for the necessary parameters to execute the SignUp service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderSignUpResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorUnexpectedLambda`, `AWSCognitoIdentityProviderErrorUserLambdaValidation`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorInvalidPassword`, `AWSCognitoIdentityProviderErrorInvalidLambdaResponse`, `AWSCognitoIdentityProviderErrorUsernameExists`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`, `AWSCognitoIdentityProviderErrorLimitExceeded`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleAccessPolicy`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleTrustRelationship`, `AWSCognitoIdentityProviderErrorInvalidEmailRoleAccessPolicy`, `AWSCognitoIdentityProviderErrorCodeDeliveryFailure`, `AWSCognitoIdentityProviderErrorForbidden`.
 
 @see AWSCognitoIdentityProviderSignUpRequest
 @see AWSCognitoIdentityProviderSignUpResponse
 */
- (AWSTask<AWSCognitoIdentityProviderSignUpResponse *> *)signUp:(AWSCognitoIdentityProviderSignUpRequest *)request;

/**
 <p>Registers the user in the specified user pool and creates a user name, password, and user attributes.</p><note><p>Amazon Cognito doesn't evaluate Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you can't use IAM credentials to authorize requests, and you can't grant IAM permissions in policies. For more information about authorization models in Amazon Cognito, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a>.</p></note><note><p>This action might generate an SMS text message. Starting June 1, 2021, US telecom carriers require you to register an origination phone number before you can send SMS messages to US phone numbers. If you use SMS text messages in Amazon Cognito, you must register a phone number with <a href="https://console.aws.amazon.com/pinpoint/home/">Amazon Pinpoint</a>. Amazon Cognito uses the registered number automatically. Otherwise, Amazon Cognito users who must receive SMS messages might not be able to sign up, activate their accounts, or sign in.</p><p>If you have never used SMS text messages with Amazon Cognito or any other Amazon Web Service, Amazon Simple Notification Service might place your account in the SMS sandbox. In <i><a href="https://docs.aws.amazon.com/sns/latest/dg/sns-sms-sandbox.html">sandbox mode</a></i>, you can send messages only to verified phone numbers. After you test your app while in the sandbox environment, you can move out of the sandbox and into production. For more information, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pool-sms-settings.html"> SMS message settings for Amazon Cognito user pools</a> in the <i>Amazon Cognito Developer Guide</i>.</p></note>
 
 @param request A container for the necessary parameters to execute the SignUp service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorUnexpectedLambda`, `AWSCognitoIdentityProviderErrorUserLambdaValidation`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorInvalidPassword`, `AWSCognitoIdentityProviderErrorInvalidLambdaResponse`, `AWSCognitoIdentityProviderErrorUsernameExists`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`, `AWSCognitoIdentityProviderErrorLimitExceeded`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleAccessPolicy`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleTrustRelationship`, `AWSCognitoIdentityProviderErrorInvalidEmailRoleAccessPolicy`, `AWSCognitoIdentityProviderErrorCodeDeliveryFailure`, `AWSCognitoIdentityProviderErrorForbidden`.
 
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
 <p>Provides the feedback for an authentication event, whether it was from a valid user or not. This feedback is used for improving the risk evaluation decision for the user pool as part of Amazon Cognito advanced security.</p><note><p>Amazon Cognito doesn't evaluate Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you can't use IAM credentials to authorize requests, and you can't grant IAM permissions in policies. For more information about authorization models in Amazon Cognito, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a>.</p></note>
 
 @param request A container for the necessary parameters to execute the UpdateAuthEventFeedback service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderUpdateAuthEventFeedbackResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorUserPoolAddOnNotEnabled`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderUpdateAuthEventFeedbackRequest
 @see AWSCognitoIdentityProviderUpdateAuthEventFeedbackResponse
 */
- (AWSTask<AWSCognitoIdentityProviderUpdateAuthEventFeedbackResponse *> *)updateAuthEventFeedback:(AWSCognitoIdentityProviderUpdateAuthEventFeedbackRequest *)request;

/**
 <p>Provides the feedback for an authentication event, whether it was from a valid user or not. This feedback is used for improving the risk evaluation decision for the user pool as part of Amazon Cognito advanced security.</p><note><p>Amazon Cognito doesn't evaluate Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you can't use IAM credentials to authorize requests, and you can't grant IAM permissions in policies. For more information about authorization models in Amazon Cognito, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a>.</p></note>
 
 @param request A container for the necessary parameters to execute the UpdateAuthEventFeedback service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorUserPoolAddOnNotEnabled`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderUpdateAuthEventFeedbackRequest
 @see AWSCognitoIdentityProviderUpdateAuthEventFeedbackResponse
 */
- (void)updateAuthEventFeedback:(AWSCognitoIdentityProviderUpdateAuthEventFeedbackRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderUpdateAuthEventFeedbackResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the device status. For more information about device authentication, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/amazon-cognito-user-pools-device-tracking.html">Working with user devices in your user pool</a>.</p><p>Authorize this action with a signed-in user's access token. It must include the scope <code>aws.cognito.signin.user.admin</code>.</p><note><p>Amazon Cognito doesn't evaluate Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you can't use IAM credentials to authorize requests, and you can't grant IAM permissions in policies. For more information about authorization models in Amazon Cognito, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a>.</p></note>
 
 @param request A container for the necessary parameters to execute the UpdateDeviceStatus service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderUpdateDeviceStatusResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorInvalidUserPoolConfiguration`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorPasswordResetRequired`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorUserNotConfirmed`, `AWSCognitoIdentityProviderErrorInternalError`, `AWSCognitoIdentityProviderErrorForbidden`.
 
 @see AWSCognitoIdentityProviderUpdateDeviceStatusRequest
 @see AWSCognitoIdentityProviderUpdateDeviceStatusResponse
 */
- (AWSTask<AWSCognitoIdentityProviderUpdateDeviceStatusResponse *> *)updateDeviceStatus:(AWSCognitoIdentityProviderUpdateDeviceStatusRequest *)request;

/**
 <p>Updates the device status. For more information about device authentication, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/amazon-cognito-user-pools-device-tracking.html">Working with user devices in your user pool</a>.</p><p>Authorize this action with a signed-in user's access token. It must include the scope <code>aws.cognito.signin.user.admin</code>.</p><note><p>Amazon Cognito doesn't evaluate Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you can't use IAM credentials to authorize requests, and you can't grant IAM permissions in policies. For more information about authorization models in Amazon Cognito, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a>.</p></note>
 
 @param request A container for the necessary parameters to execute the UpdateDeviceStatus service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorInvalidUserPoolConfiguration`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorPasswordResetRequired`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorUserNotConfirmed`, `AWSCognitoIdentityProviderErrorInternalError`, `AWSCognitoIdentityProviderErrorForbidden`.
 
 @see AWSCognitoIdentityProviderUpdateDeviceStatusRequest
 @see AWSCognitoIdentityProviderUpdateDeviceStatusResponse
 */
- (void)updateDeviceStatus:(AWSCognitoIdentityProviderUpdateDeviceStatusRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderUpdateDeviceStatusResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the specified group with the specified attributes.</p><note><p>Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you must use IAM credentials to authorize requests, and you must grant yourself the corresponding IAM permission in a policy.</p><p class="title"><b>Learn more</b></p><ul><li><p><a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html">Signing Amazon Web Services API Requests</a></p></li><li><p><a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a></p></li></ul></note>
 
 @param request A container for the necessary parameters to execute the UpdateGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderUpdateGroupResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderUpdateGroupRequest
 @see AWSCognitoIdentityProviderUpdateGroupResponse
 */
- (AWSTask<AWSCognitoIdentityProviderUpdateGroupResponse *> *)updateGroup:(AWSCognitoIdentityProviderUpdateGroupRequest *)request;

/**
 <p>Updates the specified group with the specified attributes.</p><note><p>Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you must use IAM credentials to authorize requests, and you must grant yourself the corresponding IAM permission in a policy.</p><p class="title"><b>Learn more</b></p><ul><li><p><a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html">Signing Amazon Web Services API Requests</a></p></li><li><p><a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a></p></li></ul></note>
 
 @param request A container for the necessary parameters to execute the UpdateGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderUpdateGroupRequest
 @see AWSCognitoIdentityProviderUpdateGroupResponse
 */
- (void)updateGroup:(AWSCognitoIdentityProviderUpdateGroupRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderUpdateGroupResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates IdP information for a user pool.</p><note><p>Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you must use IAM credentials to authorize requests, and you must grant yourself the corresponding IAM permission in a policy.</p><p class="title"><b>Learn more</b></p><ul><li><p><a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html">Signing Amazon Web Services API Requests</a></p></li><li><p><a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a></p></li></ul></note>
 
 @param request A container for the necessary parameters to execute the UpdateIdentityProvider service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderUpdateIdentityProviderResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorUnsupportedIdentityProvider`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorConcurrentModification`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderUpdateIdentityProviderRequest
 @see AWSCognitoIdentityProviderUpdateIdentityProviderResponse
 */
- (AWSTask<AWSCognitoIdentityProviderUpdateIdentityProviderResponse *> *)updateIdentityProvider:(AWSCognitoIdentityProviderUpdateIdentityProviderRequest *)request;

/**
 <p>Updates IdP information for a user pool.</p><note><p>Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you must use IAM credentials to authorize requests, and you must grant yourself the corresponding IAM permission in a policy.</p><p class="title"><b>Learn more</b></p><ul><li><p><a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html">Signing Amazon Web Services API Requests</a></p></li><li><p><a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a></p></li></ul></note>
 
 @param request A container for the necessary parameters to execute the UpdateIdentityProvider service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorUnsupportedIdentityProvider`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorConcurrentModification`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderUpdateIdentityProviderRequest
 @see AWSCognitoIdentityProviderUpdateIdentityProviderResponse
 */
- (void)updateIdentityProvider:(AWSCognitoIdentityProviderUpdateIdentityProviderRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderUpdateIdentityProviderResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the name and scopes of resource server. All other fields are read-only.</p><important><p>If you don't provide a value for an attribute, it is set to the default value.</p></important><note><p>Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you must use IAM credentials to authorize requests, and you must grant yourself the corresponding IAM permission in a policy.</p><p class="title"><b>Learn more</b></p><ul><li><p><a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html">Signing Amazon Web Services API Requests</a></p></li><li><p><a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a></p></li></ul></note>
 
 @param request A container for the necessary parameters to execute the UpdateResourceServer service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderUpdateResourceServerResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderUpdateResourceServerRequest
 @see AWSCognitoIdentityProviderUpdateResourceServerResponse
 */
- (AWSTask<AWSCognitoIdentityProviderUpdateResourceServerResponse *> *)updateResourceServer:(AWSCognitoIdentityProviderUpdateResourceServerRequest *)request;

/**
 <p>Updates the name and scopes of resource server. All other fields are read-only.</p><important><p>If you don't provide a value for an attribute, it is set to the default value.</p></important><note><p>Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you must use IAM credentials to authorize requests, and you must grant yourself the corresponding IAM permission in a policy.</p><p class="title"><b>Learn more</b></p><ul><li><p><a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html">Signing Amazon Web Services API Requests</a></p></li><li><p><a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a></p></li></ul></note>
 
 @param request A container for the necessary parameters to execute the UpdateResourceServer service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderUpdateResourceServerRequest
 @see AWSCognitoIdentityProviderUpdateResourceServerResponse
 */
- (void)updateResourceServer:(AWSCognitoIdentityProviderUpdateResourceServerRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderUpdateResourceServerResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>With this operation, your users can update one or more of their attributes with their own credentials. You authorize this API request with the user's access token. To delete an attribute from your user, submit the attribute in your API request with a blank value. Custom attribute values in this request must include the <code>custom:</code> prefix.</p><p>Authorize this action with a signed-in user's access token. It must include the scope <code>aws.cognito.signin.user.admin</code>.</p><note><p>Amazon Cognito doesn't evaluate Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you can't use IAM credentials to authorize requests, and you can't grant IAM permissions in policies. For more information about authorization models in Amazon Cognito, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a>.</p></note><note><p>This action might generate an SMS text message. Starting June 1, 2021, US telecom carriers require you to register an origination phone number before you can send SMS messages to US phone numbers. If you use SMS text messages in Amazon Cognito, you must register a phone number with <a href="https://console.aws.amazon.com/pinpoint/home/">Amazon Pinpoint</a>. Amazon Cognito uses the registered number automatically. Otherwise, Amazon Cognito users who must receive SMS messages might not be able to sign up, activate their accounts, or sign in.</p><p>If you have never used SMS text messages with Amazon Cognito or any other Amazon Web Service, Amazon Simple Notification Service might place your account in the SMS sandbox. In <i><a href="https://docs.aws.amazon.com/sns/latest/dg/sns-sms-sandbox.html">sandbox mode</a></i>, you can send messages only to verified phone numbers. After you test your app while in the sandbox environment, you can move out of the sandbox and into production. For more information, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pool-sms-settings.html"> SMS message settings for Amazon Cognito user pools</a> in the <i>Amazon Cognito Developer Guide</i>.</p></note>
 
 @param request A container for the necessary parameters to execute the UpdateUserAttributes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderUpdateUserAttributesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorCodeMismatch`, `AWSCognitoIdentityProviderErrorExpiredCode`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUnexpectedLambda`, `AWSCognitoIdentityProviderErrorUserLambdaValidation`, `AWSCognitoIdentityProviderErrorInvalidLambdaResponse`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorAliasExists`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleAccessPolicy`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleTrustRelationship`, `AWSCognitoIdentityProviderErrorInvalidEmailRoleAccessPolicy`, `AWSCognitoIdentityProviderErrorCodeDeliveryFailure`, `AWSCognitoIdentityProviderErrorPasswordResetRequired`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorUserNotConfirmed`, `AWSCognitoIdentityProviderErrorInternalError`, `AWSCognitoIdentityProviderErrorForbidden`.
 
 @see AWSCognitoIdentityProviderUpdateUserAttributesRequest
 @see AWSCognitoIdentityProviderUpdateUserAttributesResponse
 */
- (AWSTask<AWSCognitoIdentityProviderUpdateUserAttributesResponse *> *)updateUserAttributes:(AWSCognitoIdentityProviderUpdateUserAttributesRequest *)request;

/**
 <p>With this operation, your users can update one or more of their attributes with their own credentials. You authorize this API request with the user's access token. To delete an attribute from your user, submit the attribute in your API request with a blank value. Custom attribute values in this request must include the <code>custom:</code> prefix.</p><p>Authorize this action with a signed-in user's access token. It must include the scope <code>aws.cognito.signin.user.admin</code>.</p><note><p>Amazon Cognito doesn't evaluate Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you can't use IAM credentials to authorize requests, and you can't grant IAM permissions in policies. For more information about authorization models in Amazon Cognito, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a>.</p></note><note><p>This action might generate an SMS text message. Starting June 1, 2021, US telecom carriers require you to register an origination phone number before you can send SMS messages to US phone numbers. If you use SMS text messages in Amazon Cognito, you must register a phone number with <a href="https://console.aws.amazon.com/pinpoint/home/">Amazon Pinpoint</a>. Amazon Cognito uses the registered number automatically. Otherwise, Amazon Cognito users who must receive SMS messages might not be able to sign up, activate their accounts, or sign in.</p><p>If you have never used SMS text messages with Amazon Cognito or any other Amazon Web Service, Amazon Simple Notification Service might place your account in the SMS sandbox. In <i><a href="https://docs.aws.amazon.com/sns/latest/dg/sns-sms-sandbox.html">sandbox mode</a></i>, you can send messages only to verified phone numbers. After you test your app while in the sandbox environment, you can move out of the sandbox and into production. For more information, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pool-sms-settings.html"> SMS message settings for Amazon Cognito user pools</a> in the <i>Amazon Cognito Developer Guide</i>.</p></note>
 
 @param request A container for the necessary parameters to execute the UpdateUserAttributes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorCodeMismatch`, `AWSCognitoIdentityProviderErrorExpiredCode`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUnexpectedLambda`, `AWSCognitoIdentityProviderErrorUserLambdaValidation`, `AWSCognitoIdentityProviderErrorInvalidLambdaResponse`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorAliasExists`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleAccessPolicy`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleTrustRelationship`, `AWSCognitoIdentityProviderErrorInvalidEmailRoleAccessPolicy`, `AWSCognitoIdentityProviderErrorCodeDeliveryFailure`, `AWSCognitoIdentityProviderErrorPasswordResetRequired`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorUserNotConfirmed`, `AWSCognitoIdentityProviderErrorInternalError`, `AWSCognitoIdentityProviderErrorForbidden`.
 
 @see AWSCognitoIdentityProviderUpdateUserAttributesRequest
 @see AWSCognitoIdentityProviderUpdateUserAttributesResponse
 */
- (void)updateUserAttributes:(AWSCognitoIdentityProviderUpdateUserAttributesRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderUpdateUserAttributesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This action might generate an SMS text message. Starting June 1, 2021, US telecom carriers require you to register an origination phone number before you can send SMS messages to US phone numbers. If you use SMS text messages in Amazon Cognito, you must register a phone number with <a href="https://console.aws.amazon.com/pinpoint/home/">Amazon Pinpoint</a>. Amazon Cognito uses the registered number automatically. Otherwise, Amazon Cognito users who must receive SMS messages might not be able to sign up, activate their accounts, or sign in.</p><p>If you have never used SMS text messages with Amazon Cognito or any other Amazon Web Service, Amazon Simple Notification Service might place your account in the SMS sandbox. In <i><a href="https://docs.aws.amazon.com/sns/latest/dg/sns-sms-sandbox.html">sandbox mode</a></i>, you can send messages only to verified phone numbers. After you test your app while in the sandbox environment, you can move out of the sandbox and into production. For more information, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pool-sms-settings.html"> SMS message settings for Amazon Cognito user pools</a> in the <i>Amazon Cognito Developer Guide</i>.</p></note><p>Updates the specified user pool with the specified attributes. You can get a list of the current user pool settings using <a href="https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_DescribeUserPool.html">DescribeUserPool</a>.</p><important><p>If you don't provide a value for an attribute, Amazon Cognito sets it to its default value.</p></important><note><p>Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you must use IAM credentials to authorize requests, and you must grant yourself the corresponding IAM permission in a policy.</p><p class="title"><b>Learn more</b></p><ul><li><p><a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html">Signing Amazon Web Services API Requests</a></p></li><li><p><a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a></p></li></ul></note>
 
 @param request A container for the necessary parameters to execute the UpdateUserPool service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderUpdateUserPoolResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorConcurrentModification`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUserImportInProgress`, `AWSCognitoIdentityProviderErrorInternalError`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleAccessPolicy`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleTrustRelationship`, `AWSCognitoIdentityProviderErrorUserPoolTagging`, `AWSCognitoIdentityProviderErrorInvalidEmailRoleAccessPolicy`.
 
 @see AWSCognitoIdentityProviderUpdateUserPoolRequest
 @see AWSCognitoIdentityProviderUpdateUserPoolResponse
 */
- (AWSTask<AWSCognitoIdentityProviderUpdateUserPoolResponse *> *)updateUserPool:(AWSCognitoIdentityProviderUpdateUserPoolRequest *)request;

/**
 <note><p>This action might generate an SMS text message. Starting June 1, 2021, US telecom carriers require you to register an origination phone number before you can send SMS messages to US phone numbers. If you use SMS text messages in Amazon Cognito, you must register a phone number with <a href="https://console.aws.amazon.com/pinpoint/home/">Amazon Pinpoint</a>. Amazon Cognito uses the registered number automatically. Otherwise, Amazon Cognito users who must receive SMS messages might not be able to sign up, activate their accounts, or sign in.</p><p>If you have never used SMS text messages with Amazon Cognito or any other Amazon Web Service, Amazon Simple Notification Service might place your account in the SMS sandbox. In <i><a href="https://docs.aws.amazon.com/sns/latest/dg/sns-sms-sandbox.html">sandbox mode</a></i>, you can send messages only to verified phone numbers. After you test your app while in the sandbox environment, you can move out of the sandbox and into production. For more information, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pool-sms-settings.html"> SMS message settings for Amazon Cognito user pools</a> in the <i>Amazon Cognito Developer Guide</i>.</p></note><p>Updates the specified user pool with the specified attributes. You can get a list of the current user pool settings using <a href="https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_DescribeUserPool.html">DescribeUserPool</a>.</p><important><p>If you don't provide a value for an attribute, Amazon Cognito sets it to its default value.</p></important><note><p>Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you must use IAM credentials to authorize requests, and you must grant yourself the corresponding IAM permission in a policy.</p><p class="title"><b>Learn more</b></p><ul><li><p><a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html">Signing Amazon Web Services API Requests</a></p></li><li><p><a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a></p></li></ul></note>
 
 @param request A container for the necessary parameters to execute the UpdateUserPool service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorConcurrentModification`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorUserImportInProgress`, `AWSCognitoIdentityProviderErrorInternalError`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleAccessPolicy`, `AWSCognitoIdentityProviderErrorInvalidSmsRoleTrustRelationship`, `AWSCognitoIdentityProviderErrorUserPoolTagging`, `AWSCognitoIdentityProviderErrorInvalidEmailRoleAccessPolicy`.
 
 @see AWSCognitoIdentityProviderUpdateUserPoolRequest
 @see AWSCognitoIdentityProviderUpdateUserPoolResponse
 */
- (void)updateUserPool:(AWSCognitoIdentityProviderUpdateUserPoolRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderUpdateUserPoolResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the specified user pool app client with the specified attributes. You can get a list of the current user pool app client settings using <a href="https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_DescribeUserPoolClient.html">DescribeUserPoolClient</a>.</p><important><p>If you don't provide a value for an attribute, Amazon Cognito sets it to its default value.</p></important><p>You can also use this operation to enable token revocation for user pool clients. For more information about revoking tokens, see <a href="https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_RevokeToken.html">RevokeToken</a>.</p><note><p>Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you must use IAM credentials to authorize requests, and you must grant yourself the corresponding IAM permission in a policy.</p><p class="title"><b>Learn more</b></p><ul><li><p><a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html">Signing Amazon Web Services API Requests</a></p></li><li><p><a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a></p></li></ul></note>
 
 @param request A container for the necessary parameters to execute the UpdateUserPoolClient service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderUpdateUserPoolClientResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorConcurrentModification`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorScopeDoesNotExist`, `AWSCognitoIdentityProviderErrorInvalidOAuthFlow`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderUpdateUserPoolClientRequest
 @see AWSCognitoIdentityProviderUpdateUserPoolClientResponse
 */
- (AWSTask<AWSCognitoIdentityProviderUpdateUserPoolClientResponse *> *)updateUserPoolClient:(AWSCognitoIdentityProviderUpdateUserPoolClientRequest *)request;

/**
 <p>Updates the specified user pool app client with the specified attributes. You can get a list of the current user pool app client settings using <a href="https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_DescribeUserPoolClient.html">DescribeUserPoolClient</a>.</p><important><p>If you don't provide a value for an attribute, Amazon Cognito sets it to its default value.</p></important><p>You can also use this operation to enable token revocation for user pool clients. For more information about revoking tokens, see <a href="https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_RevokeToken.html">RevokeToken</a>.</p><note><p>Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you must use IAM credentials to authorize requests, and you must grant yourself the corresponding IAM permission in a policy.</p><p class="title"><b>Learn more</b></p><ul><li><p><a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html">Signing Amazon Web Services API Requests</a></p></li><li><p><a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a></p></li></ul></note>
 
 @param request A container for the necessary parameters to execute the UpdateUserPoolClient service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorConcurrentModification`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorScopeDoesNotExist`, `AWSCognitoIdentityProviderErrorInvalidOAuthFlow`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderUpdateUserPoolClientRequest
 @see AWSCognitoIdentityProviderUpdateUserPoolClientResponse
 */
- (void)updateUserPoolClient:(AWSCognitoIdentityProviderUpdateUserPoolClientRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderUpdateUserPoolClientResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the Secure Sockets Layer (SSL) certificate for the custom domain for your user pool.</p><p>You can use this operation to provide the Amazon Resource Name (ARN) of a new certificate to Amazon Cognito. You can't use it to change the domain for a user pool.</p><p>A custom domain is used to host the Amazon Cognito hosted UI, which provides sign-up and sign-in pages for your application. When you set up a custom domain, you provide a certificate that you manage with Certificate Manager (ACM). When necessary, you can use this operation to change the certificate that you applied to your custom domain.</p><p>Usually, this is unnecessary following routine certificate renewal with ACM. When you renew your existing certificate in ACM, the ARN for your certificate remains the same, and your custom domain uses the new certificate automatically.</p><p>However, if you replace your existing certificate with a new one, ACM gives the new certificate a new ARN. To apply the new certificate to your custom domain, you must provide this ARN to Amazon Cognito.</p><p>When you add your new certificate in ACM, you must choose US East (N. Virginia) as the Amazon Web Services Region.</p><p>After you submit your request, Amazon Cognito requires up to 1 hour to distribute your new certificate to your custom domain.</p><p>For more information about adding a custom domain to your user pool, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pools-add-custom-domain.html">Using Your Own Domain for the Hosted UI</a>.</p><note><p>Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you must use IAM credentials to authorize requests, and you must grant yourself the corresponding IAM permission in a policy.</p><p class="title"><b>Learn more</b></p><ul><li><p><a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html">Signing Amazon Web Services API Requests</a></p></li><li><p><a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a></p></li></ul></note>
 
 @param request A container for the necessary parameters to execute the UpdateUserPoolDomain service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderUpdateUserPoolDomainResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderUpdateUserPoolDomainRequest
 @see AWSCognitoIdentityProviderUpdateUserPoolDomainResponse
 */
- (AWSTask<AWSCognitoIdentityProviderUpdateUserPoolDomainResponse *> *)updateUserPoolDomain:(AWSCognitoIdentityProviderUpdateUserPoolDomainRequest *)request;

/**
 <p>Updates the Secure Sockets Layer (SSL) certificate for the custom domain for your user pool.</p><p>You can use this operation to provide the Amazon Resource Name (ARN) of a new certificate to Amazon Cognito. You can't use it to change the domain for a user pool.</p><p>A custom domain is used to host the Amazon Cognito hosted UI, which provides sign-up and sign-in pages for your application. When you set up a custom domain, you provide a certificate that you manage with Certificate Manager (ACM). When necessary, you can use this operation to change the certificate that you applied to your custom domain.</p><p>Usually, this is unnecessary following routine certificate renewal with ACM. When you renew your existing certificate in ACM, the ARN for your certificate remains the same, and your custom domain uses the new certificate automatically.</p><p>However, if you replace your existing certificate with a new one, ACM gives the new certificate a new ARN. To apply the new certificate to your custom domain, you must provide this ARN to Amazon Cognito.</p><p>When you add your new certificate in ACM, you must choose US East (N. Virginia) as the Amazon Web Services Region.</p><p>After you submit your request, Amazon Cognito requires up to 1 hour to distribute your new certificate to your custom domain.</p><p>For more information about adding a custom domain to your user pool, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pools-add-custom-domain.html">Using Your Own Domain for the Hosted UI</a>.</p><note><p>Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you must use IAM credentials to authorize requests, and you must grant yourself the corresponding IAM permission in a policy.</p><p class="title"><b>Learn more</b></p><ul><li><p><a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-signing.html">Signing Amazon Web Services API Requests</a></p></li><li><p><a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a></p></li></ul></note>
 
 @param request A container for the necessary parameters to execute the UpdateUserPoolDomain service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorInternalError`.
 
 @see AWSCognitoIdentityProviderUpdateUserPoolDomainRequest
 @see AWSCognitoIdentityProviderUpdateUserPoolDomainResponse
 */
- (void)updateUserPoolDomain:(AWSCognitoIdentityProviderUpdateUserPoolDomainRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderUpdateUserPoolDomainResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Use this API to register a user's entered time-based one-time password (TOTP) code and mark the user's software token MFA status as "verified" if successful. The request takes an access token or a session string, but not both.</p><note><p>Amazon Cognito doesn't evaluate Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you can't use IAM credentials to authorize requests, and you can't grant IAM permissions in policies. For more information about authorization models in Amazon Cognito, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a>.</p></note>
 
 @param request A container for the necessary parameters to execute the VerifySoftwareToken service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderVerifySoftwareTokenResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidUserPoolConfiguration`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorPasswordResetRequired`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorUserNotConfirmed`, `AWSCognitoIdentityProviderErrorInternalError`, `AWSCognitoIdentityProviderErrorEnableSoftwareTokenMFA`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorSoftwareTokenMFANotFound`, `AWSCognitoIdentityProviderErrorCodeMismatch`, `AWSCognitoIdentityProviderErrorForbidden`.
 
 @see AWSCognitoIdentityProviderVerifySoftwareTokenRequest
 @see AWSCognitoIdentityProviderVerifySoftwareTokenResponse
 */
- (AWSTask<AWSCognitoIdentityProviderVerifySoftwareTokenResponse *> *)verifySoftwareToken:(AWSCognitoIdentityProviderVerifySoftwareTokenRequest *)request;

/**
 <p>Use this API to register a user's entered time-based one-time password (TOTP) code and mark the user's software token MFA status as "verified" if successful. The request takes an access token or a session string, but not both.</p><note><p>Amazon Cognito doesn't evaluate Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you can't use IAM credentials to authorize requests, and you can't grant IAM permissions in policies. For more information about authorization models in Amazon Cognito, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a>.</p></note>
 
 @param request A container for the necessary parameters to execute the VerifySoftwareToken service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidUserPoolConfiguration`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorPasswordResetRequired`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorUserNotConfirmed`, `AWSCognitoIdentityProviderErrorInternalError`, `AWSCognitoIdentityProviderErrorEnableSoftwareTokenMFA`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorSoftwareTokenMFANotFound`, `AWSCognitoIdentityProviderErrorCodeMismatch`, `AWSCognitoIdentityProviderErrorForbidden`.
 
 @see AWSCognitoIdentityProviderVerifySoftwareTokenRequest
 @see AWSCognitoIdentityProviderVerifySoftwareTokenResponse
 */
- (void)verifySoftwareToken:(AWSCognitoIdentityProviderVerifySoftwareTokenRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderVerifySoftwareTokenResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Verifies the specified user attributes in the user pool.</p><p> If your user pool requires verification before Amazon Cognito updates the attribute value, VerifyUserAttribute updates the affected attribute to its pending value. For more information, see <a href="https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_UserAttributeUpdateSettingsType.html"> UserAttributeUpdateSettingsType</a>. </p><p>Authorize this action with a signed-in user's access token. It must include the scope <code>aws.cognito.signin.user.admin</code>.</p><note><p>Amazon Cognito doesn't evaluate Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you can't use IAM credentials to authorize requests, and you can't grant IAM permissions in policies. For more information about authorization models in Amazon Cognito, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a>.</p></note>
 
 @param request A container for the necessary parameters to execute the VerifyUserAttribute service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoIdentityProviderVerifyUserAttributeResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorCodeMismatch`, `AWSCognitoIdentityProviderErrorExpiredCode`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorLimitExceeded`, `AWSCognitoIdentityProviderErrorPasswordResetRequired`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorUserNotConfirmed`, `AWSCognitoIdentityProviderErrorInternalError`, `AWSCognitoIdentityProviderErrorAliasExists`, `AWSCognitoIdentityProviderErrorForbidden`.
 
 @see AWSCognitoIdentityProviderVerifyUserAttributeRequest
 @see AWSCognitoIdentityProviderVerifyUserAttributeResponse
 */
- (AWSTask<AWSCognitoIdentityProviderVerifyUserAttributeResponse *> *)verifyUserAttribute:(AWSCognitoIdentityProviderVerifyUserAttributeRequest *)request;

/**
 <p>Verifies the specified user attributes in the user pool.</p><p> If your user pool requires verification before Amazon Cognito updates the attribute value, VerifyUserAttribute updates the affected attribute to its pending value. For more information, see <a href="https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_UserAttributeUpdateSettingsType.html"> UserAttributeUpdateSettingsType</a>. </p><p>Authorize this action with a signed-in user's access token. It must include the scope <code>aws.cognito.signin.user.admin</code>.</p><note><p>Amazon Cognito doesn't evaluate Identity and Access Management (IAM) policies in requests for this API operation. For this operation, you can't use IAM credentials to authorize requests, and you can't grant IAM permissions in policies. For more information about authorization models in Amazon Cognito, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pools-API-operations.html">Using the Amazon Cognito user pools API and user pool endpoints</a>.</p></note>
 
 @param request A container for the necessary parameters to execute the VerifyUserAttribute service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCognitoIdentityProviderErrorDomain` domain and the following error code: `AWSCognitoIdentityProviderErrorResourceNotFound`, `AWSCognitoIdentityProviderErrorInvalidParameter`, `AWSCognitoIdentityProviderErrorCodeMismatch`, `AWSCognitoIdentityProviderErrorExpiredCode`, `AWSCognitoIdentityProviderErrorNotAuthorized`, `AWSCognitoIdentityProviderErrorTooManyRequests`, `AWSCognitoIdentityProviderErrorLimitExceeded`, `AWSCognitoIdentityProviderErrorPasswordResetRequired`, `AWSCognitoIdentityProviderErrorUserNotFound`, `AWSCognitoIdentityProviderErrorUserNotConfirmed`, `AWSCognitoIdentityProviderErrorInternalError`, `AWSCognitoIdentityProviderErrorAliasExists`, `AWSCognitoIdentityProviderErrorForbidden`.
 
 @see AWSCognitoIdentityProviderVerifyUserAttributeRequest
 @see AWSCognitoIdentityProviderVerifyUserAttributeResponse
 */
- (void)verifyUserAttribute:(AWSCognitoIdentityProviderVerifyUserAttributeRequest *)request completionHandler:(void (^ _Nullable)(AWSCognitoIdentityProviderVerifyUserAttributeResponse * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
