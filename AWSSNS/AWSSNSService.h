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
#import "AWSSNSModel.h"
#import "AWSSNSResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSSNS
FOUNDATION_EXPORT NSString *const AWSSNSSDKVersion;

/**
 <fullname>Amazon Simple Notification Service</fullname><p>Amazon Simple Notification Service (Amazon SNS) is a web service that enables you to build distributed web-enabled applications. Applications can use Amazon SNS to easily push real-time notification messages to interested subscribers over multiple delivery protocols. For more information about this product see the <a href="http://aws.amazon.com/sns/">Amazon SNS product page</a>. For detailed information about Amazon SNS features and their associated API calls, see the <a href="https://docs.aws.amazon.com/sns/latest/dg/">Amazon SNS Developer Guide</a>. </p><p>For information on the permissions you need to use this API, see <a href="https://docs.aws.amazon.com/sns/latest/dg/sns-authentication-and-access-control.html">Identity and access management in Amazon SNS</a> in the <i>Amazon SNS Developer Guide.</i></p><p>We also provide SDKs that enable you to access Amazon SNS from your preferred programming language. The SDKs contain functionality that automatically takes care of tasks such as: cryptographically signing your service requests, retrying requests, and handling error responses. For a list of available SDKs, go to <a href="http://aws.amazon.com/tools/">Tools for Amazon Web Services</a>. </p>
 */
@interface AWSSNS : AWSService

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

     let SNS = AWSSNS.default()

 *Objective-C*

     AWSSNS *SNS = [AWSSNS defaultSNS];

 @return The default service client.
 */
+ (instancetype)defaultSNS;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSSNS.register(with: configuration!, forKey: "USWest2SNS")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSSNS registerSNSWithConfiguration:configuration forKey:@"USWest2SNS"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let SNS = AWSSNS(forKey: "USWest2SNS")

 *Objective-C*

     AWSSNS *SNS = [AWSSNS SNSForKey:@"USWest2SNS"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerSNSWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerSNSWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSSNS.register(with: configuration!, forKey: "USWest2SNS")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSSNS registerSNSWithConfiguration:configuration forKey:@"USWest2SNS"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let SNS = AWSSNS(forKey: "USWest2SNS")

 *Objective-C*

     AWSSNS *SNS = [AWSSNS SNSForKey:@"USWest2SNS"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)SNSForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removeSNSForKey:(NSString *)key;

/**
 <p>Adds a statement to a topic's access control policy, granting access for the specified Amazon Web Services accounts to the specified actions.</p><note><p>To remove the ability to change topic permissions, you must deny permissions to the <code>AddPermission</code>, <code>RemovePermission</code>, and <code>SetTopicAttributes</code> actions in your IAM policy.</p></note>
 
 @param request A container for the necessary parameters to execute the AddPermission service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorInvalidParameter`, `AWSSNSErrorInternalError`, `AWSSNSErrorAuthorizationError`, `AWSSNSErrorNotFound`.
 
 @see AWSSNSAddPermissionInput
 */
- (AWSTask *)addPermission:(AWSSNSAddPermissionInput *)request;

/**
 <p>Adds a statement to a topic's access control policy, granting access for the specified Amazon Web Services accounts to the specified actions.</p><note><p>To remove the ability to change topic permissions, you must deny permissions to the <code>AddPermission</code>, <code>RemovePermission</code>, and <code>SetTopicAttributes</code> actions in your IAM policy.</p></note>
 
 @param request A container for the necessary parameters to execute the AddPermission service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorInvalidParameter`, `AWSSNSErrorInternalError`, `AWSSNSErrorAuthorizationError`, `AWSSNSErrorNotFound`.
 
 @see AWSSNSAddPermissionInput
 */
- (void)addPermission:(AWSSNSAddPermissionInput *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Accepts a phone number and indicates whether the phone holder has opted out of receiving SMS messages from your Amazon Web Services account. You cannot send SMS messages to a number that is opted out.</p><p>To resume sending messages, you can opt in the number by using the <code>OptInPhoneNumber</code> action.</p>
 
 @param request A container for the necessary parameters to execute the CheckIfPhoneNumberIsOptedOut service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSNSCheckIfPhoneNumberIsOptedOutResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorThrottled`, `AWSSNSErrorInternalError`, `AWSSNSErrorAuthorizationError`, `AWSSNSErrorInvalidParameter`.
 
 @see AWSSNSCheckIfPhoneNumberIsOptedOutInput
 @see AWSSNSCheckIfPhoneNumberIsOptedOutResponse
 */
- (AWSTask<AWSSNSCheckIfPhoneNumberIsOptedOutResponse *> *)checkIfPhoneNumberIsOptedOut:(AWSSNSCheckIfPhoneNumberIsOptedOutInput *)request;

/**
 <p>Accepts a phone number and indicates whether the phone holder has opted out of receiving SMS messages from your Amazon Web Services account. You cannot send SMS messages to a number that is opted out.</p><p>To resume sending messages, you can opt in the number by using the <code>OptInPhoneNumber</code> action.</p>
 
 @param request A container for the necessary parameters to execute the CheckIfPhoneNumberIsOptedOut service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorThrottled`, `AWSSNSErrorInternalError`, `AWSSNSErrorAuthorizationError`, `AWSSNSErrorInvalidParameter`.
 
 @see AWSSNSCheckIfPhoneNumberIsOptedOutInput
 @see AWSSNSCheckIfPhoneNumberIsOptedOutResponse
 */
- (void)checkIfPhoneNumberIsOptedOut:(AWSSNSCheckIfPhoneNumberIsOptedOutInput *)request completionHandler:(void (^ _Nullable)(AWSSNSCheckIfPhoneNumberIsOptedOutResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Verifies an endpoint owner's intent to receive messages by validating the token sent to the endpoint by an earlier <code>Subscribe</code> action. If the token is valid, the action creates a new subscription and returns its Amazon Resource Name (ARN). This call requires an AWS signature only when the <code>AuthenticateOnUnsubscribe</code> flag is set to "true".</p>
 
 @param request A container for the necessary parameters to execute the ConfirmSubscription service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSNSConfirmSubscriptionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorSubscriptionLimitExceeded`, `AWSSNSErrorInvalidParameter`, `AWSSNSErrorNotFound`, `AWSSNSErrorInternalError`, `AWSSNSErrorAuthorizationError`, `AWSSNSErrorFilterPolicyLimitExceeded`, `AWSSNSErrorReplayLimitExceeded`.
 
 @see AWSSNSConfirmSubscriptionInput
 @see AWSSNSConfirmSubscriptionResponse
 */
- (AWSTask<AWSSNSConfirmSubscriptionResponse *> *)confirmSubscription:(AWSSNSConfirmSubscriptionInput *)request;

/**
 <p>Verifies an endpoint owner's intent to receive messages by validating the token sent to the endpoint by an earlier <code>Subscribe</code> action. If the token is valid, the action creates a new subscription and returns its Amazon Resource Name (ARN). This call requires an AWS signature only when the <code>AuthenticateOnUnsubscribe</code> flag is set to "true".</p>
 
 @param request A container for the necessary parameters to execute the ConfirmSubscription service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorSubscriptionLimitExceeded`, `AWSSNSErrorInvalidParameter`, `AWSSNSErrorNotFound`, `AWSSNSErrorInternalError`, `AWSSNSErrorAuthorizationError`, `AWSSNSErrorFilterPolicyLimitExceeded`, `AWSSNSErrorReplayLimitExceeded`.
 
 @see AWSSNSConfirmSubscriptionInput
 @see AWSSNSConfirmSubscriptionResponse
 */
- (void)confirmSubscription:(AWSSNSConfirmSubscriptionInput *)request completionHandler:(void (^ _Nullable)(AWSSNSConfirmSubscriptionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a platform application object for one of the supported push notification services, such as APNS and GCM (Firebase Cloud Messaging), to which devices and mobile apps may register. You must specify <code>PlatformPrincipal</code> and <code>PlatformCredential</code> attributes when using the <code>CreatePlatformApplication</code> action.</p><p><code>PlatformPrincipal</code> and <code>PlatformCredential</code> are received from the notification service.</p><ul><li><p>For ADM, <code>PlatformPrincipal</code> is <code>client id</code> and <code>PlatformCredential</code> is <code>client secret</code>.</p></li><li><p>For APNS and <code>APNS_SANDBOX</code> using certificate credentials, <code>PlatformPrincipal</code> is <code>SSL certificate</code> and <code>PlatformCredential</code> is <code>private key</code>.</p></li><li><p>For APNS and <code>APNS_SANDBOX</code> using token credentials, <code>PlatformPrincipal</code> is <code>signing key ID</code> and <code>PlatformCredential</code> is <code>signing key</code>.</p></li><li><p>For Baidu, <code>PlatformPrincipal</code> is <code>API key</code> and <code>PlatformCredential</code> is <code>secret key</code>.</p></li><li><p>For GCM (Firebase Cloud Messaging) using key credentials, there is no <code>PlatformPrincipal</code>. The <code>PlatformCredential</code> is <code>API key</code>.</p></li><li><p>For GCM (Firebase Cloud Messaging) using token credentials, there is no <code>PlatformPrincipal</code>. The <code>PlatformCredential</code> is a JSON formatted private key file. When using the Amazon Web Services CLI, the file must be in string format and special characters must be ignored. To format the file correctly, Amazon SNS recommends using the following command: <code>SERVICE_JSON=`jq @json &lt;&lt;&lt; cat service.json`</code>.</p></li><li><p>For MPNS, <code>PlatformPrincipal</code> is <code>TLS certificate</code> and <code>PlatformCredential</code> is <code>private key</code>.</p></li><li><p>For WNS, <code>PlatformPrincipal</code> is <code>Package Security Identifier</code> and <code>PlatformCredential</code> is <code>secret key</code>.</p></li></ul><p>You can use the returned <code>PlatformApplicationArn</code> as an attribute for the <code>CreatePlatformEndpoint</code> action.</p>
 
 @param request A container for the necessary parameters to execute the CreatePlatformApplication service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSNSCreatePlatformApplicationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorInvalidParameter`, `AWSSNSErrorInternalError`, `AWSSNSErrorAuthorizationError`.
 
 @see AWSSNSCreatePlatformApplicationInput
 @see AWSSNSCreatePlatformApplicationResponse
 */
- (AWSTask<AWSSNSCreatePlatformApplicationResponse *> *)createPlatformApplication:(AWSSNSCreatePlatformApplicationInput *)request;

/**
 <p>Creates a platform application object for one of the supported push notification services, such as APNS and GCM (Firebase Cloud Messaging), to which devices and mobile apps may register. You must specify <code>PlatformPrincipal</code> and <code>PlatformCredential</code> attributes when using the <code>CreatePlatformApplication</code> action.</p><p><code>PlatformPrincipal</code> and <code>PlatformCredential</code> are received from the notification service.</p><ul><li><p>For ADM, <code>PlatformPrincipal</code> is <code>client id</code> and <code>PlatformCredential</code> is <code>client secret</code>.</p></li><li><p>For APNS and <code>APNS_SANDBOX</code> using certificate credentials, <code>PlatformPrincipal</code> is <code>SSL certificate</code> and <code>PlatformCredential</code> is <code>private key</code>.</p></li><li><p>For APNS and <code>APNS_SANDBOX</code> using token credentials, <code>PlatformPrincipal</code> is <code>signing key ID</code> and <code>PlatformCredential</code> is <code>signing key</code>.</p></li><li><p>For Baidu, <code>PlatformPrincipal</code> is <code>API key</code> and <code>PlatformCredential</code> is <code>secret key</code>.</p></li><li><p>For GCM (Firebase Cloud Messaging) using key credentials, there is no <code>PlatformPrincipal</code>. The <code>PlatformCredential</code> is <code>API key</code>.</p></li><li><p>For GCM (Firebase Cloud Messaging) using token credentials, there is no <code>PlatformPrincipal</code>. The <code>PlatformCredential</code> is a JSON formatted private key file. When using the Amazon Web Services CLI, the file must be in string format and special characters must be ignored. To format the file correctly, Amazon SNS recommends using the following command: <code>SERVICE_JSON=`jq @json &lt;&lt;&lt; cat service.json`</code>.</p></li><li><p>For MPNS, <code>PlatformPrincipal</code> is <code>TLS certificate</code> and <code>PlatformCredential</code> is <code>private key</code>.</p></li><li><p>For WNS, <code>PlatformPrincipal</code> is <code>Package Security Identifier</code> and <code>PlatformCredential</code> is <code>secret key</code>.</p></li></ul><p>You can use the returned <code>PlatformApplicationArn</code> as an attribute for the <code>CreatePlatformEndpoint</code> action.</p>
 
 @param request A container for the necessary parameters to execute the CreatePlatformApplication service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorInvalidParameter`, `AWSSNSErrorInternalError`, `AWSSNSErrorAuthorizationError`.
 
 @see AWSSNSCreatePlatformApplicationInput
 @see AWSSNSCreatePlatformApplicationResponse
 */
- (void)createPlatformApplication:(AWSSNSCreatePlatformApplicationInput *)request completionHandler:(void (^ _Nullable)(AWSSNSCreatePlatformApplicationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates an endpoint for a device and mobile app on one of the supported push notification services, such as GCM (Firebase Cloud Messaging) and APNS. <code>CreatePlatformEndpoint</code> requires the <code>PlatformApplicationArn</code> that is returned from <code>CreatePlatformApplication</code>. You can use the returned <code>EndpointArn</code> to send a message to a mobile app or by the <code>Subscribe</code> action for subscription to a topic. The <code>CreatePlatformEndpoint</code> action is idempotent, so if the requester already owns an endpoint with the same device token and attributes, that endpoint's ARN is returned without creating a new endpoint. For more information, see <a href="https://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html">Using Amazon SNS Mobile Push Notifications</a>. </p><p>When using <code>CreatePlatformEndpoint</code> with Baidu, two attributes must be provided: ChannelId and UserId. The token field must also contain the ChannelId. For more information, see <a href="https://docs.aws.amazon.com/sns/latest/dg/SNSMobilePushBaiduEndpoint.html">Creating an Amazon SNS Endpoint for Baidu</a>. </p>
 
 @param request A container for the necessary parameters to execute the CreatePlatformEndpoint service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSNSCreateEndpointResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorInvalidParameter`, `AWSSNSErrorInternalError`, `AWSSNSErrorAuthorizationError`, `AWSSNSErrorNotFound`.
 
 @see AWSSNSCreatePlatformEndpointInput
 @see AWSSNSCreateEndpointResponse
 */
- (AWSTask<AWSSNSCreateEndpointResponse *> *)createPlatformEndpoint:(AWSSNSCreatePlatformEndpointInput *)request;

/**
 <p>Creates an endpoint for a device and mobile app on one of the supported push notification services, such as GCM (Firebase Cloud Messaging) and APNS. <code>CreatePlatformEndpoint</code> requires the <code>PlatformApplicationArn</code> that is returned from <code>CreatePlatformApplication</code>. You can use the returned <code>EndpointArn</code> to send a message to a mobile app or by the <code>Subscribe</code> action for subscription to a topic. The <code>CreatePlatformEndpoint</code> action is idempotent, so if the requester already owns an endpoint with the same device token and attributes, that endpoint's ARN is returned without creating a new endpoint. For more information, see <a href="https://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html">Using Amazon SNS Mobile Push Notifications</a>. </p><p>When using <code>CreatePlatformEndpoint</code> with Baidu, two attributes must be provided: ChannelId and UserId. The token field must also contain the ChannelId. For more information, see <a href="https://docs.aws.amazon.com/sns/latest/dg/SNSMobilePushBaiduEndpoint.html">Creating an Amazon SNS Endpoint for Baidu</a>. </p>
 
 @param request A container for the necessary parameters to execute the CreatePlatformEndpoint service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorInvalidParameter`, `AWSSNSErrorInternalError`, `AWSSNSErrorAuthorizationError`, `AWSSNSErrorNotFound`.
 
 @see AWSSNSCreatePlatformEndpointInput
 @see AWSSNSCreateEndpointResponse
 */
- (void)createPlatformEndpoint:(AWSSNSCreatePlatformEndpointInput *)request completionHandler:(void (^ _Nullable)(AWSSNSCreateEndpointResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Adds a destination phone number to an Amazon Web Services account in the SMS sandbox and sends a one-time password (OTP) to that phone number.</p><p>When you start using Amazon SNS to send SMS messages, your Amazon Web Services account is in the <i>SMS sandbox</i>. The SMS sandbox provides a safe environment for you to try Amazon SNS features without risking your reputation as an SMS sender. While your Amazon Web Services account is in the SMS sandbox, you can use all of the features of Amazon SNS. However, you can send SMS messages only to verified destination phone numbers. For more information, including how to move out of the sandbox to send messages without restrictions, see <a href="https://docs.aws.amazon.com/sns/latest/dg/sns-sms-sandbox.html">SMS sandbox</a> in the <i>Amazon SNS Developer Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateSMSSandboxPhoneNumber service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSNSCreateSMSSandboxPhoneNumberResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorAuthorizationError`, `AWSSNSErrorInternalError`, `AWSSNSErrorInvalidParameter`, `AWSSNSErrorOptedOut`, `AWSSNSErrorUserError`, `AWSSNSErrorThrottled`.
 
 @see AWSSNSCreateSMSSandboxPhoneNumberInput
 @see AWSSNSCreateSMSSandboxPhoneNumberResult
 */
- (AWSTask<AWSSNSCreateSMSSandboxPhoneNumberResult *> *)createSMSSandboxPhoneNumber:(AWSSNSCreateSMSSandboxPhoneNumberInput *)request;

/**
 <p>Adds a destination phone number to an Amazon Web Services account in the SMS sandbox and sends a one-time password (OTP) to that phone number.</p><p>When you start using Amazon SNS to send SMS messages, your Amazon Web Services account is in the <i>SMS sandbox</i>. The SMS sandbox provides a safe environment for you to try Amazon SNS features without risking your reputation as an SMS sender. While your Amazon Web Services account is in the SMS sandbox, you can use all of the features of Amazon SNS. However, you can send SMS messages only to verified destination phone numbers. For more information, including how to move out of the sandbox to send messages without restrictions, see <a href="https://docs.aws.amazon.com/sns/latest/dg/sns-sms-sandbox.html">SMS sandbox</a> in the <i>Amazon SNS Developer Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateSMSSandboxPhoneNumber service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorAuthorizationError`, `AWSSNSErrorInternalError`, `AWSSNSErrorInvalidParameter`, `AWSSNSErrorOptedOut`, `AWSSNSErrorUserError`, `AWSSNSErrorThrottled`.
 
 @see AWSSNSCreateSMSSandboxPhoneNumberInput
 @see AWSSNSCreateSMSSandboxPhoneNumberResult
 */
- (void)createSMSSandboxPhoneNumber:(AWSSNSCreateSMSSandboxPhoneNumberInput *)request completionHandler:(void (^ _Nullable)(AWSSNSCreateSMSSandboxPhoneNumberResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a topic to which notifications can be published. Users can create at most 100,000 standard topics (at most 1,000 FIFO topics). For more information, see <a href="https://docs.aws.amazon.com/sns/latest/dg/sns-create-topic.html">Creating an Amazon SNS topic</a> in the <i>Amazon SNS Developer Guide</i>. This action is idempotent, so if the requester already owns a topic with the specified name, that topic's ARN is returned without creating a new topic.</p>
 
 @param request A container for the necessary parameters to execute the CreateTopic service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSNSCreateTopicResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorInvalidParameter`, `AWSSNSErrorTopicLimitExceeded`, `AWSSNSErrorInternalError`, `AWSSNSErrorAuthorizationError`, `AWSSNSErrorInvalidSecurity`, `AWSSNSErrorTagLimitExceeded`, `AWSSNSErrorStaleTag`, `AWSSNSErrorTagPolicy`, `AWSSNSErrorConcurrentAccess`.
 
 @see AWSSNSCreateTopicInput
 @see AWSSNSCreateTopicResponse
 */
- (AWSTask<AWSSNSCreateTopicResponse *> *)createTopic:(AWSSNSCreateTopicInput *)request;

/**
 <p>Creates a topic to which notifications can be published. Users can create at most 100,000 standard topics (at most 1,000 FIFO topics). For more information, see <a href="https://docs.aws.amazon.com/sns/latest/dg/sns-create-topic.html">Creating an Amazon SNS topic</a> in the <i>Amazon SNS Developer Guide</i>. This action is idempotent, so if the requester already owns a topic with the specified name, that topic's ARN is returned without creating a new topic.</p>
 
 @param request A container for the necessary parameters to execute the CreateTopic service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorInvalidParameter`, `AWSSNSErrorTopicLimitExceeded`, `AWSSNSErrorInternalError`, `AWSSNSErrorAuthorizationError`, `AWSSNSErrorInvalidSecurity`, `AWSSNSErrorTagLimitExceeded`, `AWSSNSErrorStaleTag`, `AWSSNSErrorTagPolicy`, `AWSSNSErrorConcurrentAccess`.
 
 @see AWSSNSCreateTopicInput
 @see AWSSNSCreateTopicResponse
 */
- (void)createTopic:(AWSSNSCreateTopicInput *)request completionHandler:(void (^ _Nullable)(AWSSNSCreateTopicResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the endpoint for a device and mobile app from Amazon SNS. This action is idempotent. For more information, see <a href="https://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html">Using Amazon SNS Mobile Push Notifications</a>. </p><p>When you delete an endpoint that is also subscribed to a topic, then you must also unsubscribe the endpoint from the topic.</p>
 
 @param request A container for the necessary parameters to execute the DeleteEndpoint service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorInvalidParameter`, `AWSSNSErrorInternalError`, `AWSSNSErrorAuthorizationError`.
 
 @see AWSSNSDeleteEndpointInput
 */
- (AWSTask *)deleteEndpoint:(AWSSNSDeleteEndpointInput *)request;

/**
 <p>Deletes the endpoint for a device and mobile app from Amazon SNS. This action is idempotent. For more information, see <a href="https://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html">Using Amazon SNS Mobile Push Notifications</a>. </p><p>When you delete an endpoint that is also subscribed to a topic, then you must also unsubscribe the endpoint from the topic.</p>
 
 @param request A container for the necessary parameters to execute the DeleteEndpoint service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorInvalidParameter`, `AWSSNSErrorInternalError`, `AWSSNSErrorAuthorizationError`.
 
 @see AWSSNSDeleteEndpointInput
 */
- (void)deleteEndpoint:(AWSSNSDeleteEndpointInput *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a platform application object for one of the supported push notification services, such as APNS and GCM (Firebase Cloud Messaging). For more information, see <a href="https://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html">Using Amazon SNS Mobile Push Notifications</a>. </p>
 
 @param request A container for the necessary parameters to execute the DeletePlatformApplication service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorInvalidParameter`, `AWSSNSErrorInternalError`, `AWSSNSErrorAuthorizationError`.
 
 @see AWSSNSDeletePlatformApplicationInput
 */
- (AWSTask *)deletePlatformApplication:(AWSSNSDeletePlatformApplicationInput *)request;

/**
 <p>Deletes a platform application object for one of the supported push notification services, such as APNS and GCM (Firebase Cloud Messaging). For more information, see <a href="https://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html">Using Amazon SNS Mobile Push Notifications</a>. </p>
 
 @param request A container for the necessary parameters to execute the DeletePlatformApplication service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorInvalidParameter`, `AWSSNSErrorInternalError`, `AWSSNSErrorAuthorizationError`.
 
 @see AWSSNSDeletePlatformApplicationInput
 */
- (void)deletePlatformApplication:(AWSSNSDeletePlatformApplicationInput *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes an Amazon Web Services account's verified or pending phone number from the SMS sandbox.</p><p>When you start using Amazon SNS to send SMS messages, your Amazon Web Services account is in the <i>SMS sandbox</i>. The SMS sandbox provides a safe environment for you to try Amazon SNS features without risking your reputation as an SMS sender. While your Amazon Web Services account is in the SMS sandbox, you can use all of the features of Amazon SNS. However, you can send SMS messages only to verified destination phone numbers. For more information, including how to move out of the sandbox to send messages without restrictions, see <a href="https://docs.aws.amazon.com/sns/latest/dg/sns-sms-sandbox.html">SMS sandbox</a> in the <i>Amazon SNS Developer Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteSMSSandboxPhoneNumber service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSNSDeleteSMSSandboxPhoneNumberResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorAuthorizationError`, `AWSSNSErrorInternalError`, `AWSSNSErrorInvalidParameter`, `AWSSNSErrorResourceNotFound`, `AWSSNSErrorUserError`, `AWSSNSErrorThrottled`.
 
 @see AWSSNSDeleteSMSSandboxPhoneNumberInput
 @see AWSSNSDeleteSMSSandboxPhoneNumberResult
 */
- (AWSTask<AWSSNSDeleteSMSSandboxPhoneNumberResult *> *)deleteSMSSandboxPhoneNumber:(AWSSNSDeleteSMSSandboxPhoneNumberInput *)request;

/**
 <p>Deletes an Amazon Web Services account's verified or pending phone number from the SMS sandbox.</p><p>When you start using Amazon SNS to send SMS messages, your Amazon Web Services account is in the <i>SMS sandbox</i>. The SMS sandbox provides a safe environment for you to try Amazon SNS features without risking your reputation as an SMS sender. While your Amazon Web Services account is in the SMS sandbox, you can use all of the features of Amazon SNS. However, you can send SMS messages only to verified destination phone numbers. For more information, including how to move out of the sandbox to send messages without restrictions, see <a href="https://docs.aws.amazon.com/sns/latest/dg/sns-sms-sandbox.html">SMS sandbox</a> in the <i>Amazon SNS Developer Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteSMSSandboxPhoneNumber service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorAuthorizationError`, `AWSSNSErrorInternalError`, `AWSSNSErrorInvalidParameter`, `AWSSNSErrorResourceNotFound`, `AWSSNSErrorUserError`, `AWSSNSErrorThrottled`.
 
 @see AWSSNSDeleteSMSSandboxPhoneNumberInput
 @see AWSSNSDeleteSMSSandboxPhoneNumberResult
 */
- (void)deleteSMSSandboxPhoneNumber:(AWSSNSDeleteSMSSandboxPhoneNumberInput *)request completionHandler:(void (^ _Nullable)(AWSSNSDeleteSMSSandboxPhoneNumberResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a topic and all its subscriptions. Deleting a topic might prevent some messages previously sent to the topic from being delivered to subscribers. This action is idempotent, so deleting a topic that does not exist does not result in an error.</p>
 
 @param request A container for the necessary parameters to execute the DeleteTopic service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorInvalidParameter`, `AWSSNSErrorInvalidState`, `AWSSNSErrorInternalError`, `AWSSNSErrorAuthorizationError`, `AWSSNSErrorNotFound`, `AWSSNSErrorStaleTag`, `AWSSNSErrorTagPolicy`, `AWSSNSErrorConcurrentAccess`.
 
 @see AWSSNSDeleteTopicInput
 */
- (AWSTask *)deleteTopic:(AWSSNSDeleteTopicInput *)request;

/**
 <p>Deletes a topic and all its subscriptions. Deleting a topic might prevent some messages previously sent to the topic from being delivered to subscribers. This action is idempotent, so deleting a topic that does not exist does not result in an error.</p>
 
 @param request A container for the necessary parameters to execute the DeleteTopic service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorInvalidParameter`, `AWSSNSErrorInvalidState`, `AWSSNSErrorInternalError`, `AWSSNSErrorAuthorizationError`, `AWSSNSErrorNotFound`, `AWSSNSErrorStaleTag`, `AWSSNSErrorTagPolicy`, `AWSSNSErrorConcurrentAccess`.
 
 @see AWSSNSDeleteTopicInput
 */
- (void)deleteTopic:(AWSSNSDeleteTopicInput *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the specified inline <code>DataProtectionPolicy</code> document that is stored in the specified Amazon SNS topic. </p>
 
 @param request A container for the necessary parameters to execute the GetDataProtectionPolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSNSGetDataProtectionPolicyResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorInvalidParameter`, `AWSSNSErrorInternalError`, `AWSSNSErrorNotFound`, `AWSSNSErrorAuthorizationError`, `AWSSNSErrorInvalidSecurity`.
 
 @see AWSSNSGetDataProtectionPolicyInput
 @see AWSSNSGetDataProtectionPolicyResponse
 */
- (AWSTask<AWSSNSGetDataProtectionPolicyResponse *> *)getDataProtectionPolicy:(AWSSNSGetDataProtectionPolicyInput *)request;

/**
 <p>Retrieves the specified inline <code>DataProtectionPolicy</code> document that is stored in the specified Amazon SNS topic. </p>
 
 @param request A container for the necessary parameters to execute the GetDataProtectionPolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorInvalidParameter`, `AWSSNSErrorInternalError`, `AWSSNSErrorNotFound`, `AWSSNSErrorAuthorizationError`, `AWSSNSErrorInvalidSecurity`.
 
 @see AWSSNSGetDataProtectionPolicyInput
 @see AWSSNSGetDataProtectionPolicyResponse
 */
- (void)getDataProtectionPolicy:(AWSSNSGetDataProtectionPolicyInput *)request completionHandler:(void (^ _Nullable)(AWSSNSGetDataProtectionPolicyResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the endpoint attributes for a device on one of the supported push notification services, such as GCM (Firebase Cloud Messaging) and APNS. For more information, see <a href="https://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html">Using Amazon SNS Mobile Push Notifications</a>. </p>
 
 @param request A container for the necessary parameters to execute the GetEndpointAttributes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSNSGetEndpointAttributesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorInvalidParameter`, `AWSSNSErrorInternalError`, `AWSSNSErrorAuthorizationError`, `AWSSNSErrorNotFound`.
 
 @see AWSSNSGetEndpointAttributesInput
 @see AWSSNSGetEndpointAttributesResponse
 */
- (AWSTask<AWSSNSGetEndpointAttributesResponse *> *)getEndpointAttributes:(AWSSNSGetEndpointAttributesInput *)request;

/**
 <p>Retrieves the endpoint attributes for a device on one of the supported push notification services, such as GCM (Firebase Cloud Messaging) and APNS. For more information, see <a href="https://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html">Using Amazon SNS Mobile Push Notifications</a>. </p>
 
 @param request A container for the necessary parameters to execute the GetEndpointAttributes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorInvalidParameter`, `AWSSNSErrorInternalError`, `AWSSNSErrorAuthorizationError`, `AWSSNSErrorNotFound`.
 
 @see AWSSNSGetEndpointAttributesInput
 @see AWSSNSGetEndpointAttributesResponse
 */
- (void)getEndpointAttributes:(AWSSNSGetEndpointAttributesInput *)request completionHandler:(void (^ _Nullable)(AWSSNSGetEndpointAttributesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the attributes of the platform application object for the supported push notification services, such as APNS and GCM (Firebase Cloud Messaging). For more information, see <a href="https://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html">Using Amazon SNS Mobile Push Notifications</a>. </p>
 
 @param request A container for the necessary parameters to execute the GetPlatformApplicationAttributes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSNSGetPlatformApplicationAttributesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorInvalidParameter`, `AWSSNSErrorInternalError`, `AWSSNSErrorAuthorizationError`, `AWSSNSErrorNotFound`.
 
 @see AWSSNSGetPlatformApplicationAttributesInput
 @see AWSSNSGetPlatformApplicationAttributesResponse
 */
- (AWSTask<AWSSNSGetPlatformApplicationAttributesResponse *> *)getPlatformApplicationAttributes:(AWSSNSGetPlatformApplicationAttributesInput *)request;

/**
 <p>Retrieves the attributes of the platform application object for the supported push notification services, such as APNS and GCM (Firebase Cloud Messaging). For more information, see <a href="https://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html">Using Amazon SNS Mobile Push Notifications</a>. </p>
 
 @param request A container for the necessary parameters to execute the GetPlatformApplicationAttributes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorInvalidParameter`, `AWSSNSErrorInternalError`, `AWSSNSErrorAuthorizationError`, `AWSSNSErrorNotFound`.
 
 @see AWSSNSGetPlatformApplicationAttributesInput
 @see AWSSNSGetPlatformApplicationAttributesResponse
 */
- (void)getPlatformApplicationAttributes:(AWSSNSGetPlatformApplicationAttributesInput *)request completionHandler:(void (^ _Nullable)(AWSSNSGetPlatformApplicationAttributesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the settings for sending SMS messages from your Amazon Web Services account.</p><p>These settings are set with the <code>SetSMSAttributes</code> action.</p>
 
 @param request A container for the necessary parameters to execute the GetSMSAttributes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSNSGetSMSAttributesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorThrottled`, `AWSSNSErrorInternalError`, `AWSSNSErrorAuthorizationError`, `AWSSNSErrorInvalidParameter`.
 
 @see AWSSNSGetSMSAttributesInput
 @see AWSSNSGetSMSAttributesResponse
 */
- (AWSTask<AWSSNSGetSMSAttributesResponse *> *)getSMSAttributes:(AWSSNSGetSMSAttributesInput *)request;

/**
 <p>Returns the settings for sending SMS messages from your Amazon Web Services account.</p><p>These settings are set with the <code>SetSMSAttributes</code> action.</p>
 
 @param request A container for the necessary parameters to execute the GetSMSAttributes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorThrottled`, `AWSSNSErrorInternalError`, `AWSSNSErrorAuthorizationError`, `AWSSNSErrorInvalidParameter`.
 
 @see AWSSNSGetSMSAttributesInput
 @see AWSSNSGetSMSAttributesResponse
 */
- (void)getSMSAttributes:(AWSSNSGetSMSAttributesInput *)request completionHandler:(void (^ _Nullable)(AWSSNSGetSMSAttributesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the SMS sandbox status for the calling Amazon Web Services account in the target Amazon Web Services Region.</p><p>When you start using Amazon SNS to send SMS messages, your Amazon Web Services account is in the <i>SMS sandbox</i>. The SMS sandbox provides a safe environment for you to try Amazon SNS features without risking your reputation as an SMS sender. While your Amazon Web Services account is in the SMS sandbox, you can use all of the features of Amazon SNS. However, you can send SMS messages only to verified destination phone numbers. For more information, including how to move out of the sandbox to send messages without restrictions, see <a href="https://docs.aws.amazon.com/sns/latest/dg/sns-sms-sandbox.html">SMS sandbox</a> in the <i>Amazon SNS Developer Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the GetSMSSandboxAccountStatus service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSNSGetSMSSandboxAccountStatusResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorAuthorizationError`, `AWSSNSErrorInternalError`, `AWSSNSErrorThrottled`.
 
 @see AWSSNSGetSMSSandboxAccountStatusInput
 @see AWSSNSGetSMSSandboxAccountStatusResult
 */
- (AWSTask<AWSSNSGetSMSSandboxAccountStatusResult *> *)getSMSSandboxAccountStatus:(AWSSNSGetSMSSandboxAccountStatusInput *)request;

/**
 <p>Retrieves the SMS sandbox status for the calling Amazon Web Services account in the target Amazon Web Services Region.</p><p>When you start using Amazon SNS to send SMS messages, your Amazon Web Services account is in the <i>SMS sandbox</i>. The SMS sandbox provides a safe environment for you to try Amazon SNS features without risking your reputation as an SMS sender. While your Amazon Web Services account is in the SMS sandbox, you can use all of the features of Amazon SNS. However, you can send SMS messages only to verified destination phone numbers. For more information, including how to move out of the sandbox to send messages without restrictions, see <a href="https://docs.aws.amazon.com/sns/latest/dg/sns-sms-sandbox.html">SMS sandbox</a> in the <i>Amazon SNS Developer Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the GetSMSSandboxAccountStatus service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorAuthorizationError`, `AWSSNSErrorInternalError`, `AWSSNSErrorThrottled`.
 
 @see AWSSNSGetSMSSandboxAccountStatusInput
 @see AWSSNSGetSMSSandboxAccountStatusResult
 */
- (void)getSMSSandboxAccountStatus:(AWSSNSGetSMSSandboxAccountStatusInput *)request completionHandler:(void (^ _Nullable)(AWSSNSGetSMSSandboxAccountStatusResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns all of the properties of a subscription.</p>
 
 @param request A container for the necessary parameters to execute the GetSubscriptionAttributes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSNSGetSubscriptionAttributesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorInvalidParameter`, `AWSSNSErrorInternalError`, `AWSSNSErrorNotFound`, `AWSSNSErrorAuthorizationError`.
 
 @see AWSSNSGetSubscriptionAttributesInput
 @see AWSSNSGetSubscriptionAttributesResponse
 */
- (AWSTask<AWSSNSGetSubscriptionAttributesResponse *> *)getSubscriptionAttributes:(AWSSNSGetSubscriptionAttributesInput *)request;

/**
 <p>Returns all of the properties of a subscription.</p>
 
 @param request A container for the necessary parameters to execute the GetSubscriptionAttributes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorInvalidParameter`, `AWSSNSErrorInternalError`, `AWSSNSErrorNotFound`, `AWSSNSErrorAuthorizationError`.
 
 @see AWSSNSGetSubscriptionAttributesInput
 @see AWSSNSGetSubscriptionAttributesResponse
 */
- (void)getSubscriptionAttributes:(AWSSNSGetSubscriptionAttributesInput *)request completionHandler:(void (^ _Nullable)(AWSSNSGetSubscriptionAttributesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns all of the properties of a topic. Topic properties returned might differ based on the authorization of the user.</p>
 
 @param request A container for the necessary parameters to execute the GetTopicAttributes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSNSGetTopicAttributesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorInvalidParameter`, `AWSSNSErrorInternalError`, `AWSSNSErrorNotFound`, `AWSSNSErrorAuthorizationError`, `AWSSNSErrorInvalidSecurity`.
 
 @see AWSSNSGetTopicAttributesInput
 @see AWSSNSGetTopicAttributesResponse
 */
- (AWSTask<AWSSNSGetTopicAttributesResponse *> *)getTopicAttributes:(AWSSNSGetTopicAttributesInput *)request;

/**
 <p>Returns all of the properties of a topic. Topic properties returned might differ based on the authorization of the user.</p>
 
 @param request A container for the necessary parameters to execute the GetTopicAttributes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorInvalidParameter`, `AWSSNSErrorInternalError`, `AWSSNSErrorNotFound`, `AWSSNSErrorAuthorizationError`, `AWSSNSErrorInvalidSecurity`.
 
 @see AWSSNSGetTopicAttributesInput
 @see AWSSNSGetTopicAttributesResponse
 */
- (void)getTopicAttributes:(AWSSNSGetTopicAttributesInput *)request completionHandler:(void (^ _Nullable)(AWSSNSGetTopicAttributesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the endpoints and endpoint attributes for devices in a supported push notification service, such as GCM (Firebase Cloud Messaging) and APNS. The results for <code>ListEndpointsByPlatformApplication</code> are paginated and return a limited list of endpoints, up to 100. If additional records are available after the first page results, then a NextToken string will be returned. To receive the next page, you call <code>ListEndpointsByPlatformApplication</code> again using the NextToken string received from the previous call. When there are no more records to return, NextToken will be null. For more information, see <a href="https://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html">Using Amazon SNS Mobile Push Notifications</a>. </p><p>This action is throttled at 30 transactions per second (TPS).</p>
 
 @param request A container for the necessary parameters to execute the ListEndpointsByPlatformApplication service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSNSListEndpointsByPlatformApplicationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorInvalidParameter`, `AWSSNSErrorInternalError`, `AWSSNSErrorAuthorizationError`, `AWSSNSErrorNotFound`.
 
 @see AWSSNSListEndpointsByPlatformApplicationInput
 @see AWSSNSListEndpointsByPlatformApplicationResponse
 */
- (AWSTask<AWSSNSListEndpointsByPlatformApplicationResponse *> *)listEndpointsByPlatformApplication:(AWSSNSListEndpointsByPlatformApplicationInput *)request;

/**
 <p>Lists the endpoints and endpoint attributes for devices in a supported push notification service, such as GCM (Firebase Cloud Messaging) and APNS. The results for <code>ListEndpointsByPlatformApplication</code> are paginated and return a limited list of endpoints, up to 100. If additional records are available after the first page results, then a NextToken string will be returned. To receive the next page, you call <code>ListEndpointsByPlatformApplication</code> again using the NextToken string received from the previous call. When there are no more records to return, NextToken will be null. For more information, see <a href="https://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html">Using Amazon SNS Mobile Push Notifications</a>. </p><p>This action is throttled at 30 transactions per second (TPS).</p>
 
 @param request A container for the necessary parameters to execute the ListEndpointsByPlatformApplication service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorInvalidParameter`, `AWSSNSErrorInternalError`, `AWSSNSErrorAuthorizationError`, `AWSSNSErrorNotFound`.
 
 @see AWSSNSListEndpointsByPlatformApplicationInput
 @see AWSSNSListEndpointsByPlatformApplicationResponse
 */
- (void)listEndpointsByPlatformApplication:(AWSSNSListEndpointsByPlatformApplicationInput *)request completionHandler:(void (^ _Nullable)(AWSSNSListEndpointsByPlatformApplicationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the calling Amazon Web Services account's dedicated origination numbers and their metadata. For more information about origination numbers, see <a href="https://docs.aws.amazon.com/sns/latest/dg/channels-sms-originating-identities-origination-numbers.html">Origination numbers</a> in the <i>Amazon SNS Developer Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the ListOriginationNumbers service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSNSListOriginationNumbersResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorInternalError`, `AWSSNSErrorAuthorizationError`, `AWSSNSErrorThrottled`, `AWSSNSErrorInvalidParameter`, `AWSSNSErrorValidation`.
 
 @see AWSSNSListOriginationNumbersRequest
 @see AWSSNSListOriginationNumbersResult
 */
- (AWSTask<AWSSNSListOriginationNumbersResult *> *)listOriginationNumbers:(AWSSNSListOriginationNumbersRequest *)request;

/**
 <p>Lists the calling Amazon Web Services account's dedicated origination numbers and their metadata. For more information about origination numbers, see <a href="https://docs.aws.amazon.com/sns/latest/dg/channels-sms-originating-identities-origination-numbers.html">Origination numbers</a> in the <i>Amazon SNS Developer Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the ListOriginationNumbers service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorInternalError`, `AWSSNSErrorAuthorizationError`, `AWSSNSErrorThrottled`, `AWSSNSErrorInvalidParameter`, `AWSSNSErrorValidation`.
 
 @see AWSSNSListOriginationNumbersRequest
 @see AWSSNSListOriginationNumbersResult
 */
- (void)listOriginationNumbers:(AWSSNSListOriginationNumbersRequest *)request completionHandler:(void (^ _Nullable)(AWSSNSListOriginationNumbersResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of phone numbers that are opted out, meaning you cannot send SMS messages to them.</p><p>The results for <code>ListPhoneNumbersOptedOut</code> are paginated, and each page returns up to 100 phone numbers. If additional phone numbers are available after the first page of results, then a <code>NextToken</code> string will be returned. To receive the next page, you call <code>ListPhoneNumbersOptedOut</code> again using the <code>NextToken</code> string received from the previous call. When there are no more records to return, <code>NextToken</code> will be null.</p>
 
 @param request A container for the necessary parameters to execute the ListPhoneNumbersOptedOut service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSNSListPhoneNumbersOptedOutResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorThrottled`, `AWSSNSErrorInternalError`, `AWSSNSErrorAuthorizationError`, `AWSSNSErrorInvalidParameter`.
 
 @see AWSSNSListPhoneNumbersOptedOutInput
 @see AWSSNSListPhoneNumbersOptedOutResponse
 */
- (AWSTask<AWSSNSListPhoneNumbersOptedOutResponse *> *)listPhoneNumbersOptedOut:(AWSSNSListPhoneNumbersOptedOutInput *)request;

/**
 <p>Returns a list of phone numbers that are opted out, meaning you cannot send SMS messages to them.</p><p>The results for <code>ListPhoneNumbersOptedOut</code> are paginated, and each page returns up to 100 phone numbers. If additional phone numbers are available after the first page of results, then a <code>NextToken</code> string will be returned. To receive the next page, you call <code>ListPhoneNumbersOptedOut</code> again using the <code>NextToken</code> string received from the previous call. When there are no more records to return, <code>NextToken</code> will be null.</p>
 
 @param request A container for the necessary parameters to execute the ListPhoneNumbersOptedOut service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorThrottled`, `AWSSNSErrorInternalError`, `AWSSNSErrorAuthorizationError`, `AWSSNSErrorInvalidParameter`.
 
 @see AWSSNSListPhoneNumbersOptedOutInput
 @see AWSSNSListPhoneNumbersOptedOutResponse
 */
- (void)listPhoneNumbersOptedOut:(AWSSNSListPhoneNumbersOptedOutInput *)request completionHandler:(void (^ _Nullable)(AWSSNSListPhoneNumbersOptedOutResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the platform application objects for the supported push notification services, such as APNS and GCM (Firebase Cloud Messaging). The results for <code>ListPlatformApplications</code> are paginated and return a limited list of applications, up to 100. If additional records are available after the first page results, then a NextToken string will be returned. To receive the next page, you call <code>ListPlatformApplications</code> using the NextToken string received from the previous call. When there are no more records to return, <code>NextToken</code> will be null. For more information, see <a href="https://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html">Using Amazon SNS Mobile Push Notifications</a>. </p><p>This action is throttled at 15 transactions per second (TPS).</p>
 
 @param request A container for the necessary parameters to execute the ListPlatformApplications service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSNSListPlatformApplicationsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorInvalidParameter`, `AWSSNSErrorInternalError`, `AWSSNSErrorAuthorizationError`.
 
 @see AWSSNSListPlatformApplicationsInput
 @see AWSSNSListPlatformApplicationsResponse
 */
- (AWSTask<AWSSNSListPlatformApplicationsResponse *> *)listPlatformApplications:(AWSSNSListPlatformApplicationsInput *)request;

/**
 <p>Lists the platform application objects for the supported push notification services, such as APNS and GCM (Firebase Cloud Messaging). The results for <code>ListPlatformApplications</code> are paginated and return a limited list of applications, up to 100. If additional records are available after the first page results, then a NextToken string will be returned. To receive the next page, you call <code>ListPlatformApplications</code> using the NextToken string received from the previous call. When there are no more records to return, <code>NextToken</code> will be null. For more information, see <a href="https://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html">Using Amazon SNS Mobile Push Notifications</a>. </p><p>This action is throttled at 15 transactions per second (TPS).</p>
 
 @param request A container for the necessary parameters to execute the ListPlatformApplications service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorInvalidParameter`, `AWSSNSErrorInternalError`, `AWSSNSErrorAuthorizationError`.
 
 @see AWSSNSListPlatformApplicationsInput
 @see AWSSNSListPlatformApplicationsResponse
 */
- (void)listPlatformApplications:(AWSSNSListPlatformApplicationsInput *)request completionHandler:(void (^ _Nullable)(AWSSNSListPlatformApplicationsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the calling Amazon Web Services account's current verified and pending destination phone numbers in the SMS sandbox.</p><p>When you start using Amazon SNS to send SMS messages, your Amazon Web Services account is in the <i>SMS sandbox</i>. The SMS sandbox provides a safe environment for you to try Amazon SNS features without risking your reputation as an SMS sender. While your Amazon Web Services account is in the SMS sandbox, you can use all of the features of Amazon SNS. However, you can send SMS messages only to verified destination phone numbers. For more information, including how to move out of the sandbox to send messages without restrictions, see <a href="https://docs.aws.amazon.com/sns/latest/dg/sns-sms-sandbox.html">SMS sandbox</a> in the <i>Amazon SNS Developer Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the ListSMSSandboxPhoneNumbers service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSNSListSMSSandboxPhoneNumbersResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorAuthorizationError`, `AWSSNSErrorInternalError`, `AWSSNSErrorInvalidParameter`, `AWSSNSErrorResourceNotFound`, `AWSSNSErrorThrottled`.
 
 @see AWSSNSListSMSSandboxPhoneNumbersInput
 @see AWSSNSListSMSSandboxPhoneNumbersResult
 */
- (AWSTask<AWSSNSListSMSSandboxPhoneNumbersResult *> *)listSMSSandboxPhoneNumbers:(AWSSNSListSMSSandboxPhoneNumbersInput *)request;

/**
 <p>Lists the calling Amazon Web Services account's current verified and pending destination phone numbers in the SMS sandbox.</p><p>When you start using Amazon SNS to send SMS messages, your Amazon Web Services account is in the <i>SMS sandbox</i>. The SMS sandbox provides a safe environment for you to try Amazon SNS features without risking your reputation as an SMS sender. While your Amazon Web Services account is in the SMS sandbox, you can use all of the features of Amazon SNS. However, you can send SMS messages only to verified destination phone numbers. For more information, including how to move out of the sandbox to send messages without restrictions, see <a href="https://docs.aws.amazon.com/sns/latest/dg/sns-sms-sandbox.html">SMS sandbox</a> in the <i>Amazon SNS Developer Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the ListSMSSandboxPhoneNumbers service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorAuthorizationError`, `AWSSNSErrorInternalError`, `AWSSNSErrorInvalidParameter`, `AWSSNSErrorResourceNotFound`, `AWSSNSErrorThrottled`.
 
 @see AWSSNSListSMSSandboxPhoneNumbersInput
 @see AWSSNSListSMSSandboxPhoneNumbersResult
 */
- (void)listSMSSandboxPhoneNumbers:(AWSSNSListSMSSandboxPhoneNumbersInput *)request completionHandler:(void (^ _Nullable)(AWSSNSListSMSSandboxPhoneNumbersResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of the requester's subscriptions. Each call returns a limited list of subscriptions, up to 100. If there are more subscriptions, a <code>NextToken</code> is also returned. Use the <code>NextToken</code> parameter in a new <code>ListSubscriptions</code> call to get further results.</p><p>This action is throttled at 30 transactions per second (TPS).</p>
 
 @param request A container for the necessary parameters to execute the ListSubscriptions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSNSListSubscriptionsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorInvalidParameter`, `AWSSNSErrorInternalError`, `AWSSNSErrorAuthorizationError`.
 
 @see AWSSNSListSubscriptionsInput
 @see AWSSNSListSubscriptionsResponse
 */
- (AWSTask<AWSSNSListSubscriptionsResponse *> *)listSubscriptions:(AWSSNSListSubscriptionsInput *)request;

/**
 <p>Returns a list of the requester's subscriptions. Each call returns a limited list of subscriptions, up to 100. If there are more subscriptions, a <code>NextToken</code> is also returned. Use the <code>NextToken</code> parameter in a new <code>ListSubscriptions</code> call to get further results.</p><p>This action is throttled at 30 transactions per second (TPS).</p>
 
 @param request A container for the necessary parameters to execute the ListSubscriptions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorInvalidParameter`, `AWSSNSErrorInternalError`, `AWSSNSErrorAuthorizationError`.
 
 @see AWSSNSListSubscriptionsInput
 @see AWSSNSListSubscriptionsResponse
 */
- (void)listSubscriptions:(AWSSNSListSubscriptionsInput *)request completionHandler:(void (^ _Nullable)(AWSSNSListSubscriptionsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of the subscriptions to a specific topic. Each call returns a limited list of subscriptions, up to 100. If there are more subscriptions, a <code>NextToken</code> is also returned. Use the <code>NextToken</code> parameter in a new <code>ListSubscriptionsByTopic</code> call to get further results.</p><p>This action is throttled at 30 transactions per second (TPS).</p>
 
 @param request A container for the necessary parameters to execute the ListSubscriptionsByTopic service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSNSListSubscriptionsByTopicResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorInvalidParameter`, `AWSSNSErrorInternalError`, `AWSSNSErrorNotFound`, `AWSSNSErrorAuthorizationError`.
 
 @see AWSSNSListSubscriptionsByTopicInput
 @see AWSSNSListSubscriptionsByTopicResponse
 */
- (AWSTask<AWSSNSListSubscriptionsByTopicResponse *> *)listSubscriptionsByTopic:(AWSSNSListSubscriptionsByTopicInput *)request;

/**
 <p>Returns a list of the subscriptions to a specific topic. Each call returns a limited list of subscriptions, up to 100. If there are more subscriptions, a <code>NextToken</code> is also returned. Use the <code>NextToken</code> parameter in a new <code>ListSubscriptionsByTopic</code> call to get further results.</p><p>This action is throttled at 30 transactions per second (TPS).</p>
 
 @param request A container for the necessary parameters to execute the ListSubscriptionsByTopic service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorInvalidParameter`, `AWSSNSErrorInternalError`, `AWSSNSErrorNotFound`, `AWSSNSErrorAuthorizationError`.
 
 @see AWSSNSListSubscriptionsByTopicInput
 @see AWSSNSListSubscriptionsByTopicResponse
 */
- (void)listSubscriptionsByTopic:(AWSSNSListSubscriptionsByTopicInput *)request completionHandler:(void (^ _Nullable)(AWSSNSListSubscriptionsByTopicResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>List all tags added to the specified Amazon SNS topic. For an overview, see <a href="https://docs.aws.amazon.com/sns/latest/dg/sns-tags.html">Amazon SNS Tags</a> in the <i>Amazon Simple Notification Service Developer Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSNSListTagsForResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorResourceNotFound`, `AWSSNSErrorTagPolicy`, `AWSSNSErrorInvalidParameter`, `AWSSNSErrorAuthorizationError`, `AWSSNSErrorConcurrentAccess`.
 
 @see AWSSNSListTagsForResourceRequest
 @see AWSSNSListTagsForResourceResponse
 */
- (AWSTask<AWSSNSListTagsForResourceResponse *> *)listTagsForResource:(AWSSNSListTagsForResourceRequest *)request;

/**
 <p>List all tags added to the specified Amazon SNS topic. For an overview, see <a href="https://docs.aws.amazon.com/sns/latest/dg/sns-tags.html">Amazon SNS Tags</a> in the <i>Amazon Simple Notification Service Developer Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorResourceNotFound`, `AWSSNSErrorTagPolicy`, `AWSSNSErrorInvalidParameter`, `AWSSNSErrorAuthorizationError`, `AWSSNSErrorConcurrentAccess`.
 
 @see AWSSNSListTagsForResourceRequest
 @see AWSSNSListTagsForResourceResponse
 */
- (void)listTagsForResource:(AWSSNSListTagsForResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSSNSListTagsForResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of the requester's topics. Each call returns a limited list of topics, up to 100. If there are more topics, a <code>NextToken</code> is also returned. Use the <code>NextToken</code> parameter in a new <code>ListTopics</code> call to get further results.</p><p>This action is throttled at 30 transactions per second (TPS).</p>
 
 @param request A container for the necessary parameters to execute the ListTopics service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSNSListTopicsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorInvalidParameter`, `AWSSNSErrorInternalError`, `AWSSNSErrorAuthorizationError`.
 
 @see AWSSNSListTopicsInput
 @see AWSSNSListTopicsResponse
 */
- (AWSTask<AWSSNSListTopicsResponse *> *)listTopics:(AWSSNSListTopicsInput *)request;

/**
 <p>Returns a list of the requester's topics. Each call returns a limited list of topics, up to 100. If there are more topics, a <code>NextToken</code> is also returned. Use the <code>NextToken</code> parameter in a new <code>ListTopics</code> call to get further results.</p><p>This action is throttled at 30 transactions per second (TPS).</p>
 
 @param request A container for the necessary parameters to execute the ListTopics service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorInvalidParameter`, `AWSSNSErrorInternalError`, `AWSSNSErrorAuthorizationError`.
 
 @see AWSSNSListTopicsInput
 @see AWSSNSListTopicsResponse
 */
- (void)listTopics:(AWSSNSListTopicsInput *)request completionHandler:(void (^ _Nullable)(AWSSNSListTopicsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Use this request to opt in a phone number that is opted out, which enables you to resume sending SMS messages to the number.</p><p>You can opt in a phone number only once every 30 days.</p>
 
 @param request A container for the necessary parameters to execute the OptInPhoneNumber service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSNSOptInPhoneNumberResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorThrottled`, `AWSSNSErrorInternalError`, `AWSSNSErrorAuthorizationError`, `AWSSNSErrorInvalidParameter`.
 
 @see AWSSNSOptInPhoneNumberInput
 @see AWSSNSOptInPhoneNumberResponse
 */
- (AWSTask<AWSSNSOptInPhoneNumberResponse *> *)optInPhoneNumber:(AWSSNSOptInPhoneNumberInput *)request;

/**
 <p>Use this request to opt in a phone number that is opted out, which enables you to resume sending SMS messages to the number.</p><p>You can opt in a phone number only once every 30 days.</p>
 
 @param request A container for the necessary parameters to execute the OptInPhoneNumber service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorThrottled`, `AWSSNSErrorInternalError`, `AWSSNSErrorAuthorizationError`, `AWSSNSErrorInvalidParameter`.
 
 @see AWSSNSOptInPhoneNumberInput
 @see AWSSNSOptInPhoneNumberResponse
 */
- (void)optInPhoneNumber:(AWSSNSOptInPhoneNumberInput *)request completionHandler:(void (^ _Nullable)(AWSSNSOptInPhoneNumberResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Sends a message to an Amazon SNS topic, a text message (SMS message) directly to a phone number, or a message to a mobile platform endpoint (when you specify the <code>TargetArn</code>).</p><p>If you send a message to a topic, Amazon SNS delivers the message to each endpoint that is subscribed to the topic. The format of the message depends on the notification protocol for each subscribed endpoint.</p><p>When a <code>messageId</code> is returned, the message is saved and Amazon SNS immediately delivers it to subscribers.</p><p>To use the <code>Publish</code> action for publishing a message to a mobile endpoint, such as an app on a Kindle device or mobile phone, you must specify the EndpointArn for the TargetArn parameter. The EndpointArn is returned when making a call with the <code>CreatePlatformEndpoint</code> action. </p><p>For more information about formatting messages, see <a href="https://docs.aws.amazon.com/sns/latest/dg/mobile-push-send-custommessage.html">Send Custom Platform-Specific Payloads in Messages to Mobile Devices</a>. </p><important><p>You can publish messages only to topics and endpoints in the same Amazon Web Services Region.</p></important>
 
 @param request A container for the necessary parameters to execute the Publish service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSNSPublishResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorInvalidParameter`, `AWSSNSErrorInvalidParameterValue`, `AWSSNSErrorInternalError`, `AWSSNSErrorNotFound`, `AWSSNSErrorEndpointDisabled`, `AWSSNSErrorPlatformApplicationDisabled`, `AWSSNSErrorAuthorizationError`, `AWSSNSErrorKMSDisabled`, `AWSSNSErrorKMSInvalidState`, `AWSSNSErrorKMSNotFound`, `AWSSNSErrorKMSOptInRequired`, `AWSSNSErrorKMSThrottling`, `AWSSNSErrorKMSAccessDenied`, `AWSSNSErrorInvalidSecurity`, `AWSSNSErrorValidation`.
 
 @see AWSSNSPublishInput
 @see AWSSNSPublishResponse
 */
- (AWSTask<AWSSNSPublishResponse *> *)publish:(AWSSNSPublishInput *)request;

/**
 <p>Sends a message to an Amazon SNS topic, a text message (SMS message) directly to a phone number, or a message to a mobile platform endpoint (when you specify the <code>TargetArn</code>).</p><p>If you send a message to a topic, Amazon SNS delivers the message to each endpoint that is subscribed to the topic. The format of the message depends on the notification protocol for each subscribed endpoint.</p><p>When a <code>messageId</code> is returned, the message is saved and Amazon SNS immediately delivers it to subscribers.</p><p>To use the <code>Publish</code> action for publishing a message to a mobile endpoint, such as an app on a Kindle device or mobile phone, you must specify the EndpointArn for the TargetArn parameter. The EndpointArn is returned when making a call with the <code>CreatePlatformEndpoint</code> action. </p><p>For more information about formatting messages, see <a href="https://docs.aws.amazon.com/sns/latest/dg/mobile-push-send-custommessage.html">Send Custom Platform-Specific Payloads in Messages to Mobile Devices</a>. </p><important><p>You can publish messages only to topics and endpoints in the same Amazon Web Services Region.</p></important>
 
 @param request A container for the necessary parameters to execute the Publish service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorInvalidParameter`, `AWSSNSErrorInvalidParameterValue`, `AWSSNSErrorInternalError`, `AWSSNSErrorNotFound`, `AWSSNSErrorEndpointDisabled`, `AWSSNSErrorPlatformApplicationDisabled`, `AWSSNSErrorAuthorizationError`, `AWSSNSErrorKMSDisabled`, `AWSSNSErrorKMSInvalidState`, `AWSSNSErrorKMSNotFound`, `AWSSNSErrorKMSOptInRequired`, `AWSSNSErrorKMSThrottling`, `AWSSNSErrorKMSAccessDenied`, `AWSSNSErrorInvalidSecurity`, `AWSSNSErrorValidation`.
 
 @see AWSSNSPublishInput
 @see AWSSNSPublishResponse
 */
- (void)publish:(AWSSNSPublishInput *)request completionHandler:(void (^ _Nullable)(AWSSNSPublishResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Publishes up to ten messages to the specified topic. This is a batch version of <code>Publish</code>. For FIFO topics, multiple messages within a single batch are published in the order they are sent, and messages are deduplicated within the batch and across batches for 5 minutes.</p><p>The result of publishing each message is reported individually in the response. Because the batch request can result in a combination of successful and unsuccessful actions, you should check for batch errors even when the call returns an HTTP status code of <code>200</code>.</p><p>The maximum allowed individual message size and the maximum total payload size (the sum of the individual lengths of all of the batched messages) are both 256 KB (262,144 bytes). </p><p>Some actions take lists of parameters. These lists are specified using the <code>param.n</code> notation. Values of <code>n</code> are integers starting from 1. For example, a parameter list with two elements looks like this: </p><p>&amp;AttributeName.1=first</p><p>&amp;AttributeName.2=second</p><p>If you send a batch message to a topic, Amazon SNS publishes the batch message to each endpoint that is subscribed to the topic. The format of the batch message depends on the notification protocol for each subscribed endpoint.</p><p>When a <code>messageId</code> is returned, the batch message is saved and Amazon SNS immediately delivers the message to subscribers.</p>
 
 @param request A container for the necessary parameters to execute the PublishBatch service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSNSPublishBatchResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorInvalidParameter`, `AWSSNSErrorInvalidParameterValue`, `AWSSNSErrorInternalError`, `AWSSNSErrorNotFound`, `AWSSNSErrorEndpointDisabled`, `AWSSNSErrorPlatformApplicationDisabled`, `AWSSNSErrorAuthorizationError`, `AWSSNSErrorBatchEntryIdsNotDistinct`, `AWSSNSErrorBatchRequestTooLong`, `AWSSNSErrorEmptyBatchRequest`, `AWSSNSErrorInvalidBatchEntryId`, `AWSSNSErrorTooManyEntriesInBatchRequest`, `AWSSNSErrorKMSDisabled`, `AWSSNSErrorKMSInvalidState`, `AWSSNSErrorKMSNotFound`, `AWSSNSErrorKMSOptInRequired`, `AWSSNSErrorKMSThrottling`, `AWSSNSErrorKMSAccessDenied`, `AWSSNSErrorInvalidSecurity`, `AWSSNSErrorValidation`.
 
 @see AWSSNSPublishBatchInput
 @see AWSSNSPublishBatchResponse
 */
- (AWSTask<AWSSNSPublishBatchResponse *> *)publishBatch:(AWSSNSPublishBatchInput *)request;

/**
 <p>Publishes up to ten messages to the specified topic. This is a batch version of <code>Publish</code>. For FIFO topics, multiple messages within a single batch are published in the order they are sent, and messages are deduplicated within the batch and across batches for 5 minutes.</p><p>The result of publishing each message is reported individually in the response. Because the batch request can result in a combination of successful and unsuccessful actions, you should check for batch errors even when the call returns an HTTP status code of <code>200</code>.</p><p>The maximum allowed individual message size and the maximum total payload size (the sum of the individual lengths of all of the batched messages) are both 256 KB (262,144 bytes). </p><p>Some actions take lists of parameters. These lists are specified using the <code>param.n</code> notation. Values of <code>n</code> are integers starting from 1. For example, a parameter list with two elements looks like this: </p><p>&amp;AttributeName.1=first</p><p>&amp;AttributeName.2=second</p><p>If you send a batch message to a topic, Amazon SNS publishes the batch message to each endpoint that is subscribed to the topic. The format of the batch message depends on the notification protocol for each subscribed endpoint.</p><p>When a <code>messageId</code> is returned, the batch message is saved and Amazon SNS immediately delivers the message to subscribers.</p>
 
 @param request A container for the necessary parameters to execute the PublishBatch service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorInvalidParameter`, `AWSSNSErrorInvalidParameterValue`, `AWSSNSErrorInternalError`, `AWSSNSErrorNotFound`, `AWSSNSErrorEndpointDisabled`, `AWSSNSErrorPlatformApplicationDisabled`, `AWSSNSErrorAuthorizationError`, `AWSSNSErrorBatchEntryIdsNotDistinct`, `AWSSNSErrorBatchRequestTooLong`, `AWSSNSErrorEmptyBatchRequest`, `AWSSNSErrorInvalidBatchEntryId`, `AWSSNSErrorTooManyEntriesInBatchRequest`, `AWSSNSErrorKMSDisabled`, `AWSSNSErrorKMSInvalidState`, `AWSSNSErrorKMSNotFound`, `AWSSNSErrorKMSOptInRequired`, `AWSSNSErrorKMSThrottling`, `AWSSNSErrorKMSAccessDenied`, `AWSSNSErrorInvalidSecurity`, `AWSSNSErrorValidation`.
 
 @see AWSSNSPublishBatchInput
 @see AWSSNSPublishBatchResponse
 */
- (void)publishBatch:(AWSSNSPublishBatchInput *)request completionHandler:(void (^ _Nullable)(AWSSNSPublishBatchResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Adds or updates an inline policy document that is stored in the specified Amazon SNS topic.</p>
 
 @param request A container for the necessary parameters to execute the PutDataProtectionPolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorInvalidParameter`, `AWSSNSErrorInternalError`, `AWSSNSErrorNotFound`, `AWSSNSErrorAuthorizationError`, `AWSSNSErrorInvalidSecurity`.
 
 @see AWSSNSPutDataProtectionPolicyInput
 */
- (AWSTask *)putDataProtectionPolicy:(AWSSNSPutDataProtectionPolicyInput *)request;

/**
 <p>Adds or updates an inline policy document that is stored in the specified Amazon SNS topic.</p>
 
 @param request A container for the necessary parameters to execute the PutDataProtectionPolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorInvalidParameter`, `AWSSNSErrorInternalError`, `AWSSNSErrorNotFound`, `AWSSNSErrorAuthorizationError`, `AWSSNSErrorInvalidSecurity`.
 
 @see AWSSNSPutDataProtectionPolicyInput
 */
- (void)putDataProtectionPolicy:(AWSSNSPutDataProtectionPolicyInput *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Removes a statement from a topic's access control policy.</p><note><p>To remove the ability to change topic permissions, you must deny permissions to the <code>AddPermission</code>, <code>RemovePermission</code>, and <code>SetTopicAttributes</code> actions in your IAM policy.</p></note>
 
 @param request A container for the necessary parameters to execute the RemovePermission service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorInvalidParameter`, `AWSSNSErrorInternalError`, `AWSSNSErrorAuthorizationError`, `AWSSNSErrorNotFound`.
 
 @see AWSSNSRemovePermissionInput
 */
- (AWSTask *)removePermission:(AWSSNSRemovePermissionInput *)request;

/**
 <p>Removes a statement from a topic's access control policy.</p><note><p>To remove the ability to change topic permissions, you must deny permissions to the <code>AddPermission</code>, <code>RemovePermission</code>, and <code>SetTopicAttributes</code> actions in your IAM policy.</p></note>
 
 @param request A container for the necessary parameters to execute the RemovePermission service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorInvalidParameter`, `AWSSNSErrorInternalError`, `AWSSNSErrorAuthorizationError`, `AWSSNSErrorNotFound`.
 
 @see AWSSNSRemovePermissionInput
 */
- (void)removePermission:(AWSSNSRemovePermissionInput *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Sets the attributes for an endpoint for a device on one of the supported push notification services, such as GCM (Firebase Cloud Messaging) and APNS. For more information, see <a href="https://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html">Using Amazon SNS Mobile Push Notifications</a>. </p>
 
 @param request A container for the necessary parameters to execute the SetEndpointAttributes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorInvalidParameter`, `AWSSNSErrorInternalError`, `AWSSNSErrorAuthorizationError`, `AWSSNSErrorNotFound`.
 
 @see AWSSNSSetEndpointAttributesInput
 */
- (AWSTask *)setEndpointAttributes:(AWSSNSSetEndpointAttributesInput *)request;

/**
 <p>Sets the attributes for an endpoint for a device on one of the supported push notification services, such as GCM (Firebase Cloud Messaging) and APNS. For more information, see <a href="https://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html">Using Amazon SNS Mobile Push Notifications</a>. </p>
 
 @param request A container for the necessary parameters to execute the SetEndpointAttributes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorInvalidParameter`, `AWSSNSErrorInternalError`, `AWSSNSErrorAuthorizationError`, `AWSSNSErrorNotFound`.
 
 @see AWSSNSSetEndpointAttributesInput
 */
- (void)setEndpointAttributes:(AWSSNSSetEndpointAttributesInput *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Sets the attributes of the platform application object for the supported push notification services, such as APNS and GCM (Firebase Cloud Messaging). For more information, see <a href="https://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html">Using Amazon SNS Mobile Push Notifications</a>. For information on configuring attributes for message delivery status, see <a href="https://docs.aws.amazon.com/sns/latest/dg/sns-msg-status.html">Using Amazon SNS Application Attributes for Message Delivery Status</a>. </p>
 
 @param request A container for the necessary parameters to execute the SetPlatformApplicationAttributes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorInvalidParameter`, `AWSSNSErrorInternalError`, `AWSSNSErrorAuthorizationError`, `AWSSNSErrorNotFound`.
 
 @see AWSSNSSetPlatformApplicationAttributesInput
 */
- (AWSTask *)setPlatformApplicationAttributes:(AWSSNSSetPlatformApplicationAttributesInput *)request;

/**
 <p>Sets the attributes of the platform application object for the supported push notification services, such as APNS and GCM (Firebase Cloud Messaging). For more information, see <a href="https://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html">Using Amazon SNS Mobile Push Notifications</a>. For information on configuring attributes for message delivery status, see <a href="https://docs.aws.amazon.com/sns/latest/dg/sns-msg-status.html">Using Amazon SNS Application Attributes for Message Delivery Status</a>. </p>
 
 @param request A container for the necessary parameters to execute the SetPlatformApplicationAttributes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorInvalidParameter`, `AWSSNSErrorInternalError`, `AWSSNSErrorAuthorizationError`, `AWSSNSErrorNotFound`.
 
 @see AWSSNSSetPlatformApplicationAttributesInput
 */
- (void)setPlatformApplicationAttributes:(AWSSNSSetPlatformApplicationAttributesInput *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Use this request to set the default settings for sending SMS messages and receiving daily SMS usage reports.</p><p>You can override some of these settings for a single message when you use the <code>Publish</code> action with the <code>MessageAttributes.entry.N</code> parameter. For more information, see <a href="https://docs.aws.amazon.com/sns/latest/dg/sms_publish-to-phone.html">Publishing to a mobile phone</a> in the <i>Amazon SNS Developer Guide</i>.</p><note><p>To use this operation, you must grant the Amazon SNS service principal (<code>sns.amazonaws.com</code>) permission to perform the <code>s3:ListBucket</code> action. </p></note>
 
 @param request A container for the necessary parameters to execute the SetSMSAttributes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSNSSetSMSAttributesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorInvalidParameter`, `AWSSNSErrorThrottled`, `AWSSNSErrorInternalError`, `AWSSNSErrorAuthorizationError`.
 
 @see AWSSNSSetSMSAttributesInput
 @see AWSSNSSetSMSAttributesResponse
 */
- (AWSTask<AWSSNSSetSMSAttributesResponse *> *)setSMSAttributes:(AWSSNSSetSMSAttributesInput *)request;

/**
 <p>Use this request to set the default settings for sending SMS messages and receiving daily SMS usage reports.</p><p>You can override some of these settings for a single message when you use the <code>Publish</code> action with the <code>MessageAttributes.entry.N</code> parameter. For more information, see <a href="https://docs.aws.amazon.com/sns/latest/dg/sms_publish-to-phone.html">Publishing to a mobile phone</a> in the <i>Amazon SNS Developer Guide</i>.</p><note><p>To use this operation, you must grant the Amazon SNS service principal (<code>sns.amazonaws.com</code>) permission to perform the <code>s3:ListBucket</code> action. </p></note>
 
 @param request A container for the necessary parameters to execute the SetSMSAttributes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorInvalidParameter`, `AWSSNSErrorThrottled`, `AWSSNSErrorInternalError`, `AWSSNSErrorAuthorizationError`.
 
 @see AWSSNSSetSMSAttributesInput
 @see AWSSNSSetSMSAttributesResponse
 */
- (void)setSMSAttributes:(AWSSNSSetSMSAttributesInput *)request completionHandler:(void (^ _Nullable)(AWSSNSSetSMSAttributesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Allows a subscription owner to set an attribute of the subscription to a new value.</p>
 
 @param request A container for the necessary parameters to execute the SetSubscriptionAttributes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorInvalidParameter`, `AWSSNSErrorFilterPolicyLimitExceeded`, `AWSSNSErrorReplayLimitExceeded`, `AWSSNSErrorInternalError`, `AWSSNSErrorNotFound`, `AWSSNSErrorAuthorizationError`.
 
 @see AWSSNSSetSubscriptionAttributesInput
 */
- (AWSTask *)setSubscriptionAttributes:(AWSSNSSetSubscriptionAttributesInput *)request;

/**
 <p>Allows a subscription owner to set an attribute of the subscription to a new value.</p>
 
 @param request A container for the necessary parameters to execute the SetSubscriptionAttributes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorInvalidParameter`, `AWSSNSErrorFilterPolicyLimitExceeded`, `AWSSNSErrorReplayLimitExceeded`, `AWSSNSErrorInternalError`, `AWSSNSErrorNotFound`, `AWSSNSErrorAuthorizationError`.
 
 @see AWSSNSSetSubscriptionAttributesInput
 */
- (void)setSubscriptionAttributes:(AWSSNSSetSubscriptionAttributesInput *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Allows a topic owner to set an attribute of the topic to a new value.</p><note><p>To remove the ability to change topic permissions, you must deny permissions to the <code>AddPermission</code>, <code>RemovePermission</code>, and <code>SetTopicAttributes</code> actions in your IAM policy.</p></note>
 
 @param request A container for the necessary parameters to execute the SetTopicAttributes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorInvalidParameter`, `AWSSNSErrorInternalError`, `AWSSNSErrorNotFound`, `AWSSNSErrorAuthorizationError`, `AWSSNSErrorInvalidSecurity`.
 
 @see AWSSNSSetTopicAttributesInput
 */
- (AWSTask *)setTopicAttributes:(AWSSNSSetTopicAttributesInput *)request;

/**
 <p>Allows a topic owner to set an attribute of the topic to a new value.</p><note><p>To remove the ability to change topic permissions, you must deny permissions to the <code>AddPermission</code>, <code>RemovePermission</code>, and <code>SetTopicAttributes</code> actions in your IAM policy.</p></note>
 
 @param request A container for the necessary parameters to execute the SetTopicAttributes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorInvalidParameter`, `AWSSNSErrorInternalError`, `AWSSNSErrorNotFound`, `AWSSNSErrorAuthorizationError`, `AWSSNSErrorInvalidSecurity`.
 
 @see AWSSNSSetTopicAttributesInput
 */
- (void)setTopicAttributes:(AWSSNSSetTopicAttributesInput *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Subscribes an endpoint to an Amazon SNS topic. If the endpoint type is HTTP/S or email, or if the endpoint and the topic are not in the same Amazon Web Services account, the endpoint owner must run the <code>ConfirmSubscription</code> action to confirm the subscription.</p><p>You call the <code>ConfirmSubscription</code> action with the token from the subscription response. Confirmation tokens are valid for two days.</p><p>This action is throttled at 100 transactions per second (TPS).</p>
 
 @param request A container for the necessary parameters to execute the Subscribe service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSNSSubscribeResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorSubscriptionLimitExceeded`, `AWSSNSErrorFilterPolicyLimitExceeded`, `AWSSNSErrorReplayLimitExceeded`, `AWSSNSErrorInvalidParameter`, `AWSSNSErrorInternalError`, `AWSSNSErrorNotFound`, `AWSSNSErrorAuthorizationError`, `AWSSNSErrorInvalidSecurity`.
 
 @see AWSSNSSubscribeInput
 @see AWSSNSSubscribeResponse
 */
- (AWSTask<AWSSNSSubscribeResponse *> *)subscribe:(AWSSNSSubscribeInput *)request;

/**
 <p>Subscribes an endpoint to an Amazon SNS topic. If the endpoint type is HTTP/S or email, or if the endpoint and the topic are not in the same Amazon Web Services account, the endpoint owner must run the <code>ConfirmSubscription</code> action to confirm the subscription.</p><p>You call the <code>ConfirmSubscription</code> action with the token from the subscription response. Confirmation tokens are valid for two days.</p><p>This action is throttled at 100 transactions per second (TPS).</p>
 
 @param request A container for the necessary parameters to execute the Subscribe service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorSubscriptionLimitExceeded`, `AWSSNSErrorFilterPolicyLimitExceeded`, `AWSSNSErrorReplayLimitExceeded`, `AWSSNSErrorInvalidParameter`, `AWSSNSErrorInternalError`, `AWSSNSErrorNotFound`, `AWSSNSErrorAuthorizationError`, `AWSSNSErrorInvalidSecurity`.
 
 @see AWSSNSSubscribeInput
 @see AWSSNSSubscribeResponse
 */
- (void)subscribe:(AWSSNSSubscribeInput *)request completionHandler:(void (^ _Nullable)(AWSSNSSubscribeResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Add tags to the specified Amazon SNS topic. For an overview, see <a href="https://docs.aws.amazon.com/sns/latest/dg/sns-tags.html">Amazon SNS Tags</a> in the <i>Amazon SNS Developer Guide</i>.</p><p>When you use topic tags, keep the following guidelines in mind:</p><ul><li><p>Adding more than 50 tags to a topic isn't recommended.</p></li><li><p>Tags don't have any semantic meaning. Amazon SNS interprets tags as character strings.</p></li><li><p>Tags are case-sensitive.</p></li><li><p>A new tag with a key identical to that of an existing tag overwrites the existing tag.</p></li><li><p>Tagging actions are limited to 10 TPS per Amazon Web Services account, per Amazon Web Services Region. If your application requires a higher throughput, file a <a href="https://console.aws.amazon.com/support/home#/case/create?issueType=technical">technical support request</a>.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the TagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSNSTagResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorResourceNotFound`, `AWSSNSErrorTagLimitExceeded`, `AWSSNSErrorStaleTag`, `AWSSNSErrorTagPolicy`, `AWSSNSErrorInvalidParameter`, `AWSSNSErrorAuthorizationError`, `AWSSNSErrorConcurrentAccess`.
 
 @see AWSSNSTagResourceRequest
 @see AWSSNSTagResourceResponse
 */
- (AWSTask<AWSSNSTagResourceResponse *> *)tagResource:(AWSSNSTagResourceRequest *)request;

/**
 <p>Add tags to the specified Amazon SNS topic. For an overview, see <a href="https://docs.aws.amazon.com/sns/latest/dg/sns-tags.html">Amazon SNS Tags</a> in the <i>Amazon SNS Developer Guide</i>.</p><p>When you use topic tags, keep the following guidelines in mind:</p><ul><li><p>Adding more than 50 tags to a topic isn't recommended.</p></li><li><p>Tags don't have any semantic meaning. Amazon SNS interprets tags as character strings.</p></li><li><p>Tags are case-sensitive.</p></li><li><p>A new tag with a key identical to that of an existing tag overwrites the existing tag.</p></li><li><p>Tagging actions are limited to 10 TPS per Amazon Web Services account, per Amazon Web Services Region. If your application requires a higher throughput, file a <a href="https://console.aws.amazon.com/support/home#/case/create?issueType=technical">technical support request</a>.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the TagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorResourceNotFound`, `AWSSNSErrorTagLimitExceeded`, `AWSSNSErrorStaleTag`, `AWSSNSErrorTagPolicy`, `AWSSNSErrorInvalidParameter`, `AWSSNSErrorAuthorizationError`, `AWSSNSErrorConcurrentAccess`.
 
 @see AWSSNSTagResourceRequest
 @see AWSSNSTagResourceResponse
 */
- (void)tagResource:(AWSSNSTagResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSSNSTagResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a subscription. If the subscription requires authentication for deletion, only the owner of the subscription or the topic's owner can unsubscribe, and an Amazon Web Services signature is required. If the <code>Unsubscribe</code> call does not require authentication and the requester is not the subscription owner, a final cancellation message is delivered to the endpoint, so that the endpoint owner can easily resubscribe to the topic if the <code>Unsubscribe</code> request was unintended.</p><note><p>Amazon SQS queue subscriptions require authentication for deletion. Only the owner of the subscription, or the owner of the topic can unsubscribe using the required Amazon Web Services signature.</p></note><p>This action is throttled at 100 transactions per second (TPS).</p>
 
 @param request A container for the necessary parameters to execute the Unsubscribe service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorInvalidParameter`, `AWSSNSErrorInternalError`, `AWSSNSErrorAuthorizationError`, `AWSSNSErrorNotFound`, `AWSSNSErrorInvalidSecurity`.
 
 @see AWSSNSUnsubscribeInput
 */
- (AWSTask *)unsubscribe:(AWSSNSUnsubscribeInput *)request;

/**
 <p>Deletes a subscription. If the subscription requires authentication for deletion, only the owner of the subscription or the topic's owner can unsubscribe, and an Amazon Web Services signature is required. If the <code>Unsubscribe</code> call does not require authentication and the requester is not the subscription owner, a final cancellation message is delivered to the endpoint, so that the endpoint owner can easily resubscribe to the topic if the <code>Unsubscribe</code> request was unintended.</p><note><p>Amazon SQS queue subscriptions require authentication for deletion. Only the owner of the subscription, or the owner of the topic can unsubscribe using the required Amazon Web Services signature.</p></note><p>This action is throttled at 100 transactions per second (TPS).</p>
 
 @param request A container for the necessary parameters to execute the Unsubscribe service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorInvalidParameter`, `AWSSNSErrorInternalError`, `AWSSNSErrorAuthorizationError`, `AWSSNSErrorNotFound`, `AWSSNSErrorInvalidSecurity`.
 
 @see AWSSNSUnsubscribeInput
 */
- (void)unsubscribe:(AWSSNSUnsubscribeInput *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Remove tags from the specified Amazon SNS topic. For an overview, see <a href="https://docs.aws.amazon.com/sns/latest/dg/sns-tags.html">Amazon SNS Tags</a> in the <i>Amazon SNS Developer Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSNSUntagResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorResourceNotFound`, `AWSSNSErrorTagLimitExceeded`, `AWSSNSErrorStaleTag`, `AWSSNSErrorTagPolicy`, `AWSSNSErrorInvalidParameter`, `AWSSNSErrorAuthorizationError`, `AWSSNSErrorConcurrentAccess`.
 
 @see AWSSNSUntagResourceRequest
 @see AWSSNSUntagResourceResponse
 */
- (AWSTask<AWSSNSUntagResourceResponse *> *)untagResource:(AWSSNSUntagResourceRequest *)request;

/**
 <p>Remove tags from the specified Amazon SNS topic. For an overview, see <a href="https://docs.aws.amazon.com/sns/latest/dg/sns-tags.html">Amazon SNS Tags</a> in the <i>Amazon SNS Developer Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorResourceNotFound`, `AWSSNSErrorTagLimitExceeded`, `AWSSNSErrorStaleTag`, `AWSSNSErrorTagPolicy`, `AWSSNSErrorInvalidParameter`, `AWSSNSErrorAuthorizationError`, `AWSSNSErrorConcurrentAccess`.
 
 @see AWSSNSUntagResourceRequest
 @see AWSSNSUntagResourceResponse
 */
- (void)untagResource:(AWSSNSUntagResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSSNSUntagResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Verifies a destination phone number with a one-time password (OTP) for the calling Amazon Web Services account.</p><p>When you start using Amazon SNS to send SMS messages, your Amazon Web Services account is in the <i>SMS sandbox</i>. The SMS sandbox provides a safe environment for you to try Amazon SNS features without risking your reputation as an SMS sender. While your Amazon Web Services account is in the SMS sandbox, you can use all of the features of Amazon SNS. However, you can send SMS messages only to verified destination phone numbers. For more information, including how to move out of the sandbox to send messages without restrictions, see <a href="https://docs.aws.amazon.com/sns/latest/dg/sns-sms-sandbox.html">SMS sandbox</a> in the <i>Amazon SNS Developer Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the VerifySMSSandboxPhoneNumber service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSNSVerifySMSSandboxPhoneNumberResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorAuthorizationError`, `AWSSNSErrorInternalError`, `AWSSNSErrorInvalidParameter`, `AWSSNSErrorResourceNotFound`, `AWSSNSErrorVerification`, `AWSSNSErrorThrottled`.
 
 @see AWSSNSVerifySMSSandboxPhoneNumberInput
 @see AWSSNSVerifySMSSandboxPhoneNumberResult
 */
- (AWSTask<AWSSNSVerifySMSSandboxPhoneNumberResult *> *)verifySMSSandboxPhoneNumber:(AWSSNSVerifySMSSandboxPhoneNumberInput *)request;

/**
 <p>Verifies a destination phone number with a one-time password (OTP) for the calling Amazon Web Services account.</p><p>When you start using Amazon SNS to send SMS messages, your Amazon Web Services account is in the <i>SMS sandbox</i>. The SMS sandbox provides a safe environment for you to try Amazon SNS features without risking your reputation as an SMS sender. While your Amazon Web Services account is in the SMS sandbox, you can use all of the features of Amazon SNS. However, you can send SMS messages only to verified destination phone numbers. For more information, including how to move out of the sandbox to send messages without restrictions, see <a href="https://docs.aws.amazon.com/sns/latest/dg/sns-sms-sandbox.html">SMS sandbox</a> in the <i>Amazon SNS Developer Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the VerifySMSSandboxPhoneNumber service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorAuthorizationError`, `AWSSNSErrorInternalError`, `AWSSNSErrorInvalidParameter`, `AWSSNSErrorResourceNotFound`, `AWSSNSErrorVerification`, `AWSSNSErrorThrottled`.
 
 @see AWSSNSVerifySMSSandboxPhoneNumberInput
 @see AWSSNSVerifySMSSandboxPhoneNumberResult
 */
- (void)verifySMSSandboxPhoneNumber:(AWSSNSVerifySMSSandboxPhoneNumberInput *)request completionHandler:(void (^ _Nullable)(AWSSNSVerifySMSSandboxPhoneNumberResult * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
