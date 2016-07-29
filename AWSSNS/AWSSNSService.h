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
#import "AWSSNSModel.h"
#import "AWSSNSResources.h"

NS_ASSUME_NONNULL_BEGIN

/**
 <fullname>Amazon Simple Notification Service</fullname><p>Amazon Simple Notification Service (Amazon SNS) is a web service that enables you to build distributed web-enabled applications. Applications can use Amazon SNS to easily push real-time notification messages to interested subscribers over multiple delivery protocols. For more information about this product see <a href="http://aws.amazon.com/sns/">http://aws.amazon.com/sns</a>. For detailed information about Amazon SNS features and their associated API calls, see the <a href="http://docs.aws.amazon.com/sns/latest/dg/">Amazon SNS Developer Guide</a>. </p><p>We also provide SDKs that enable you to access Amazon SNS from your preferred programming language. The SDKs contain functionality that automatically takes care of tasks such as: cryptographically signing your service requests, retrying requests, and handling error responses. For a list of available SDKs, go to <a href="http://aws.amazon.com/tools/">Tools for Amazon Web Services</a>. </p>
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

     let SNS = AWSSNS.defaultSNS()

 *Objective-C*

     AWSSNS *SNS = [AWSSNS defaultSNS];

 @return The default service client.
 */
+ (instancetype)defaultSNS;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
         let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
         let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
         AWSSNS.registerSNSWithConfiguration(configuration, forKey: "USWest2SNS")

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

     func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
         let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
         let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
         AWSSNS.registerSNSWithConfiguration(configuration, forKey: "USWest2SNS")

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
 <p>Adds a statement to a topic's access control policy, granting access for the specified AWS accounts to the specified actions.</p>
 
 @param request A container for the necessary parameters to execute the AddPermission service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorInvalidParameter`, `AWSSNSErrorInternalError`, `AWSSNSErrorAuthorizationError`, `AWSSNSErrorNotFound`.
 
 @see AWSSNSAddPermissionInput
 */
- (AWSTask *)addPermission:(AWSSNSAddPermissionInput *)request;

/**
 <p>Adds a statement to a topic's access control policy, granting access for the specified AWS accounts to the specified actions.</p>
 
 @param request A container for the necessary parameters to execute the AddPermission service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorInvalidParameter`, `AWSSNSErrorInternalError`, `AWSSNSErrorAuthorizationError`, `AWSSNSErrorNotFound`.
 
 @see AWSSNSAddPermissionInput
 */
- (void)addPermission:(AWSSNSAddPermissionInput *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Accepts a phone number and indicates whether the phone holder has opted out of receiving SMS messages from your account. You cannot send SMS messages to a number that is opted out.</p><p>To resume sending messages, you can opt in the number by using the <code>OptInPhoneNumber</code> action.</p>
 
 @param request A container for the necessary parameters to execute the CheckIfPhoneNumberIsOptedOut service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSNSCheckIfPhoneNumberIsOptedOutResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorThrottled`, `AWSSNSErrorInternalError`, `AWSSNSErrorInvalidParameter`.
 
 @see AWSSNSCheckIfPhoneNumberIsOptedOutInput
 @see AWSSNSCheckIfPhoneNumberIsOptedOutResponse
 */
- (AWSTask<AWSSNSCheckIfPhoneNumberIsOptedOutResponse *> *)checkIfPhoneNumberIsOptedOut:(AWSSNSCheckIfPhoneNumberIsOptedOutInput *)request;

/**
 <p>Accepts a phone number and indicates whether the phone holder has opted out of receiving SMS messages from your account. You cannot send SMS messages to a number that is opted out.</p><p>To resume sending messages, you can opt in the number by using the <code>OptInPhoneNumber</code> action.</p>
 
 @param request A container for the necessary parameters to execute the CheckIfPhoneNumberIsOptedOut service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorThrottled`, `AWSSNSErrorInternalError`, `AWSSNSErrorInvalidParameter`.
 
 @see AWSSNSCheckIfPhoneNumberIsOptedOutInput
 @see AWSSNSCheckIfPhoneNumberIsOptedOutResponse
 */
- (void)checkIfPhoneNumberIsOptedOut:(AWSSNSCheckIfPhoneNumberIsOptedOutInput *)request completionHandler:(void (^ _Nullable)(AWSSNSCheckIfPhoneNumberIsOptedOutResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Verifies an endpoint owner's intent to receive messages by validating the token sent to the endpoint by an earlier <code>Subscribe</code> action. If the token is valid, the action creates a new subscription and returns its Amazon Resource Name (ARN). This call requires an AWS signature only when the <code>AuthenticateOnUnsubscribe</code> flag is set to "true".</p>
 
 @param request A container for the necessary parameters to execute the ConfirmSubscription service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSNSConfirmSubscriptionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorSubscriptionLimitExceeded`, `AWSSNSErrorInvalidParameter`, `AWSSNSErrorNotFound`, `AWSSNSErrorInternalError`, `AWSSNSErrorAuthorizationError`.
 
 @see AWSSNSConfirmSubscriptionInput
 @see AWSSNSConfirmSubscriptionResponse
 */
- (AWSTask<AWSSNSConfirmSubscriptionResponse *> *)confirmSubscription:(AWSSNSConfirmSubscriptionInput *)request;

/**
 <p>Verifies an endpoint owner's intent to receive messages by validating the token sent to the endpoint by an earlier <code>Subscribe</code> action. If the token is valid, the action creates a new subscription and returns its Amazon Resource Name (ARN). This call requires an AWS signature only when the <code>AuthenticateOnUnsubscribe</code> flag is set to "true".</p>
 
 @param request A container for the necessary parameters to execute the ConfirmSubscription service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorSubscriptionLimitExceeded`, `AWSSNSErrorInvalidParameter`, `AWSSNSErrorNotFound`, `AWSSNSErrorInternalError`, `AWSSNSErrorAuthorizationError`.
 
 @see AWSSNSConfirmSubscriptionInput
 @see AWSSNSConfirmSubscriptionResponse
 */
- (void)confirmSubscription:(AWSSNSConfirmSubscriptionInput *)request completionHandler:(void (^ _Nullable)(AWSSNSConfirmSubscriptionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a platform application object for one of the supported push notification services, such as APNS and GCM, to which devices and mobile apps may register. You must specify PlatformPrincipal and PlatformCredential attributes when using the <code>CreatePlatformApplication</code> action. The PlatformPrincipal is received from the notification service. For APNS/APNS_SANDBOX, PlatformPrincipal is "SSL certificate". For GCM, PlatformPrincipal is not applicable. For ADM, PlatformPrincipal is "client id". The PlatformCredential is also received from the notification service. For WNS, PlatformPrincipal is "Package Security Identifier". For MPNS, PlatformPrincipal is "TLS certificate". For Baidu, PlatformPrincipal is "API key".</p><p>For APNS/APNS_SANDBOX, PlatformCredential is "private key". For GCM, PlatformCredential is "API key". For ADM, PlatformCredential is "client secret". For WNS, PlatformCredential is "secret key". For MPNS, PlatformCredential is "private key". For Baidu, PlatformCredential is "secret key". The PlatformApplicationArn that is returned when using <code>CreatePlatformApplication</code> is then used as an attribute for the <code>CreatePlatformEndpoint</code> action. For more information, see <a href="http://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html">Using Amazon SNS Mobile Push Notifications</a>. For more information about obtaining the PlatformPrincipal and PlatformCredential for each of the supported push notification services, see <a href="http://docs.aws.amazon.com/sns/latest/dg/mobile-push-apns.html">Getting Started with Apple Push Notification Service</a>, <a href="http://docs.aws.amazon.com/sns/latest/dg/mobile-push-adm.html">Getting Started with Amazon Device Messaging</a>, <a href="http://docs.aws.amazon.com/sns/latest/dg/mobile-push-baidu.html">Getting Started with Baidu Cloud Push</a>, <a href="http://docs.aws.amazon.com/sns/latest/dg/mobile-push-gcm.html">Getting Started with Google Cloud Messaging for Android</a>, <a href="http://docs.aws.amazon.com/sns/latest/dg/mobile-push-mpns.html">Getting Started with MPNS</a>, or <a href="http://docs.aws.amazon.com/sns/latest/dg/mobile-push-wns.html">Getting Started with WNS</a>. </p>
 
 @param request A container for the necessary parameters to execute the CreatePlatformApplication service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSNSCreatePlatformApplicationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorInvalidParameter`, `AWSSNSErrorInternalError`, `AWSSNSErrorAuthorizationError`.
 
 @see AWSSNSCreatePlatformApplicationInput
 @see AWSSNSCreatePlatformApplicationResponse
 */
- (AWSTask<AWSSNSCreatePlatformApplicationResponse *> *)createPlatformApplication:(AWSSNSCreatePlatformApplicationInput *)request;

/**
 <p>Creates a platform application object for one of the supported push notification services, such as APNS and GCM, to which devices and mobile apps may register. You must specify PlatformPrincipal and PlatformCredential attributes when using the <code>CreatePlatformApplication</code> action. The PlatformPrincipal is received from the notification service. For APNS/APNS_SANDBOX, PlatformPrincipal is "SSL certificate". For GCM, PlatformPrincipal is not applicable. For ADM, PlatformPrincipal is "client id". The PlatformCredential is also received from the notification service. For WNS, PlatformPrincipal is "Package Security Identifier". For MPNS, PlatformPrincipal is "TLS certificate". For Baidu, PlatformPrincipal is "API key".</p><p>For APNS/APNS_SANDBOX, PlatformCredential is "private key". For GCM, PlatformCredential is "API key". For ADM, PlatformCredential is "client secret". For WNS, PlatformCredential is "secret key". For MPNS, PlatformCredential is "private key". For Baidu, PlatformCredential is "secret key". The PlatformApplicationArn that is returned when using <code>CreatePlatformApplication</code> is then used as an attribute for the <code>CreatePlatformEndpoint</code> action. For more information, see <a href="http://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html">Using Amazon SNS Mobile Push Notifications</a>. For more information about obtaining the PlatformPrincipal and PlatformCredential for each of the supported push notification services, see <a href="http://docs.aws.amazon.com/sns/latest/dg/mobile-push-apns.html">Getting Started with Apple Push Notification Service</a>, <a href="http://docs.aws.amazon.com/sns/latest/dg/mobile-push-adm.html">Getting Started with Amazon Device Messaging</a>, <a href="http://docs.aws.amazon.com/sns/latest/dg/mobile-push-baidu.html">Getting Started with Baidu Cloud Push</a>, <a href="http://docs.aws.amazon.com/sns/latest/dg/mobile-push-gcm.html">Getting Started with Google Cloud Messaging for Android</a>, <a href="http://docs.aws.amazon.com/sns/latest/dg/mobile-push-mpns.html">Getting Started with MPNS</a>, or <a href="http://docs.aws.amazon.com/sns/latest/dg/mobile-push-wns.html">Getting Started with WNS</a>. </p>
 
 @param request A container for the necessary parameters to execute the CreatePlatformApplication service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorInvalidParameter`, `AWSSNSErrorInternalError`, `AWSSNSErrorAuthorizationError`.
 
 @see AWSSNSCreatePlatformApplicationInput
 @see AWSSNSCreatePlatformApplicationResponse
 */
- (void)createPlatformApplication:(AWSSNSCreatePlatformApplicationInput *)request completionHandler:(void (^ _Nullable)(AWSSNSCreatePlatformApplicationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates an endpoint for a device and mobile app on one of the supported push notification services, such as GCM and APNS. <code>CreatePlatformEndpoint</code> requires the PlatformApplicationArn that is returned from <code>CreatePlatformApplication</code>. The EndpointArn that is returned when using <code>CreatePlatformEndpoint</code> can then be used by the <code>Publish</code> action to send a message to a mobile app or by the <code>Subscribe</code> action for subscription to a topic. The <code>CreatePlatformEndpoint</code> action is idempotent, so if the requester already owns an endpoint with the same device token and attributes, that endpoint's ARN is returned without creating a new endpoint. For more information, see <a href="http://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html">Using Amazon SNS Mobile Push Notifications</a>. </p><p>When using <code>CreatePlatformEndpoint</code> with Baidu, two attributes must be provided: ChannelId and UserId. The token field must also contain the ChannelId. For more information, see <a href="http://docs.aws.amazon.com/sns/latest/dg/SNSMobilePushBaiduEndpoint.html">Creating an Amazon SNS Endpoint for Baidu</a>. </p>
 
 @param request A container for the necessary parameters to execute the CreatePlatformEndpoint service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSNSCreateEndpointResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorInvalidParameter`, `AWSSNSErrorInternalError`, `AWSSNSErrorAuthorizationError`, `AWSSNSErrorNotFound`.
 
 @see AWSSNSCreatePlatformEndpointInput
 @see AWSSNSCreateEndpointResponse
 */
- (AWSTask<AWSSNSCreateEndpointResponse *> *)createPlatformEndpoint:(AWSSNSCreatePlatformEndpointInput *)request;

/**
 <p>Creates an endpoint for a device and mobile app on one of the supported push notification services, such as GCM and APNS. <code>CreatePlatformEndpoint</code> requires the PlatformApplicationArn that is returned from <code>CreatePlatformApplication</code>. The EndpointArn that is returned when using <code>CreatePlatformEndpoint</code> can then be used by the <code>Publish</code> action to send a message to a mobile app or by the <code>Subscribe</code> action for subscription to a topic. The <code>CreatePlatformEndpoint</code> action is idempotent, so if the requester already owns an endpoint with the same device token and attributes, that endpoint's ARN is returned without creating a new endpoint. For more information, see <a href="http://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html">Using Amazon SNS Mobile Push Notifications</a>. </p><p>When using <code>CreatePlatformEndpoint</code> with Baidu, two attributes must be provided: ChannelId and UserId. The token field must also contain the ChannelId. For more information, see <a href="http://docs.aws.amazon.com/sns/latest/dg/SNSMobilePushBaiduEndpoint.html">Creating an Amazon SNS Endpoint for Baidu</a>. </p>
 
 @param request A container for the necessary parameters to execute the CreatePlatformEndpoint service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorInvalidParameter`, `AWSSNSErrorInternalError`, `AWSSNSErrorAuthorizationError`, `AWSSNSErrorNotFound`.
 
 @see AWSSNSCreatePlatformEndpointInput
 @see AWSSNSCreateEndpointResponse
 */
- (void)createPlatformEndpoint:(AWSSNSCreatePlatformEndpointInput *)request completionHandler:(void (^ _Nullable)(AWSSNSCreateEndpointResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a topic to which notifications can be published. Users can create at most 100,000 topics. For more information, see <a href="http://aws.amazon.com/sns/">http://aws.amazon.com/sns</a>. This action is idempotent, so if the requester already owns a topic with the specified name, that topic's ARN is returned without creating a new topic.</p>
 
 @param request A container for the necessary parameters to execute the CreateTopic service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSNSCreateTopicResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorInvalidParameter`, `AWSSNSErrorTopicLimitExceeded`, `AWSSNSErrorInternalError`, `AWSSNSErrorAuthorizationError`.
 
 @see AWSSNSCreateTopicInput
 @see AWSSNSCreateTopicResponse
 */
- (AWSTask<AWSSNSCreateTopicResponse *> *)createTopic:(AWSSNSCreateTopicInput *)request;

/**
 <p>Creates a topic to which notifications can be published. Users can create at most 100,000 topics. For more information, see <a href="http://aws.amazon.com/sns/">http://aws.amazon.com/sns</a>. This action is idempotent, so if the requester already owns a topic with the specified name, that topic's ARN is returned without creating a new topic.</p>
 
 @param request A container for the necessary parameters to execute the CreateTopic service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorInvalidParameter`, `AWSSNSErrorTopicLimitExceeded`, `AWSSNSErrorInternalError`, `AWSSNSErrorAuthorizationError`.
 
 @see AWSSNSCreateTopicInput
 @see AWSSNSCreateTopicResponse
 */
- (void)createTopic:(AWSSNSCreateTopicInput *)request completionHandler:(void (^ _Nullable)(AWSSNSCreateTopicResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the endpoint for a device and mobile app from Amazon SNS. This action is idempotent. For more information, see <a href="http://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html">Using Amazon SNS Mobile Push Notifications</a>. </p><p>When you delete an endpoint that is also subscribed to a topic, then you must also unsubscribe the endpoint from the topic. </p>
 
 @param request A container for the necessary parameters to execute the DeleteEndpoint service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorInvalidParameter`, `AWSSNSErrorInternalError`, `AWSSNSErrorAuthorizationError`.
 
 @see AWSSNSDeleteEndpointInput
 */
- (AWSTask *)deleteEndpoint:(AWSSNSDeleteEndpointInput *)request;

/**
 <p>Deletes the endpoint for a device and mobile app from Amazon SNS. This action is idempotent. For more information, see <a href="http://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html">Using Amazon SNS Mobile Push Notifications</a>. </p><p>When you delete an endpoint that is also subscribed to a topic, then you must also unsubscribe the endpoint from the topic. </p>
 
 @param request A container for the necessary parameters to execute the DeleteEndpoint service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorInvalidParameter`, `AWSSNSErrorInternalError`, `AWSSNSErrorAuthorizationError`.
 
 @see AWSSNSDeleteEndpointInput
 */
- (void)deleteEndpoint:(AWSSNSDeleteEndpointInput *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a platform application object for one of the supported push notification services, such as APNS and GCM. For more information, see <a href="http://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html">Using Amazon SNS Mobile Push Notifications</a>. </p>
 
 @param request A container for the necessary parameters to execute the DeletePlatformApplication service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorInvalidParameter`, `AWSSNSErrorInternalError`, `AWSSNSErrorAuthorizationError`.
 
 @see AWSSNSDeletePlatformApplicationInput
 */
- (AWSTask *)deletePlatformApplication:(AWSSNSDeletePlatformApplicationInput *)request;

/**
 <p>Deletes a platform application object for one of the supported push notification services, such as APNS and GCM. For more information, see <a href="http://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html">Using Amazon SNS Mobile Push Notifications</a>. </p>
 
 @param request A container for the necessary parameters to execute the DeletePlatformApplication service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorInvalidParameter`, `AWSSNSErrorInternalError`, `AWSSNSErrorAuthorizationError`.
 
 @see AWSSNSDeletePlatformApplicationInput
 */
- (void)deletePlatformApplication:(AWSSNSDeletePlatformApplicationInput *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a topic and all its subscriptions. Deleting a topic might prevent some messages previously sent to the topic from being delivered to subscribers. This action is idempotent, so deleting a topic that does not exist does not result in an error.</p>
 
 @param request A container for the necessary parameters to execute the DeleteTopic service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorInvalidParameter`, `AWSSNSErrorInternalError`, `AWSSNSErrorAuthorizationError`, `AWSSNSErrorNotFound`.
 
 @see AWSSNSDeleteTopicInput
 */
- (AWSTask *)deleteTopic:(AWSSNSDeleteTopicInput *)request;

/**
 <p>Deletes a topic and all its subscriptions. Deleting a topic might prevent some messages previously sent to the topic from being delivered to subscribers. This action is idempotent, so deleting a topic that does not exist does not result in an error.</p>
 
 @param request A container for the necessary parameters to execute the DeleteTopic service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorInvalidParameter`, `AWSSNSErrorInternalError`, `AWSSNSErrorAuthorizationError`, `AWSSNSErrorNotFound`.
 
 @see AWSSNSDeleteTopicInput
 */
- (void)deleteTopic:(AWSSNSDeleteTopicInput *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the endpoint attributes for a device on one of the supported push notification services, such as GCM and APNS. For more information, see <a href="http://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html">Using Amazon SNS Mobile Push Notifications</a>. </p>
 
 @param request A container for the necessary parameters to execute the GetEndpointAttributes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSNSGetEndpointAttributesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorInvalidParameter`, `AWSSNSErrorInternalError`, `AWSSNSErrorAuthorizationError`, `AWSSNSErrorNotFound`.
 
 @see AWSSNSGetEndpointAttributesInput
 @see AWSSNSGetEndpointAttributesResponse
 */
- (AWSTask<AWSSNSGetEndpointAttributesResponse *> *)getEndpointAttributes:(AWSSNSGetEndpointAttributesInput *)request;

/**
 <p>Retrieves the endpoint attributes for a device on one of the supported push notification services, such as GCM and APNS. For more information, see <a href="http://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html">Using Amazon SNS Mobile Push Notifications</a>. </p>
 
 @param request A container for the necessary parameters to execute the GetEndpointAttributes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorInvalidParameter`, `AWSSNSErrorInternalError`, `AWSSNSErrorAuthorizationError`, `AWSSNSErrorNotFound`.
 
 @see AWSSNSGetEndpointAttributesInput
 @see AWSSNSGetEndpointAttributesResponse
 */
- (void)getEndpointAttributes:(AWSSNSGetEndpointAttributesInput *)request completionHandler:(void (^ _Nullable)(AWSSNSGetEndpointAttributesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the attributes of the platform application object for the supported push notification services, such as APNS and GCM. For more information, see <a href="http://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html">Using Amazon SNS Mobile Push Notifications</a>. </p>
 
 @param request A container for the necessary parameters to execute the GetPlatformApplicationAttributes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSNSGetPlatformApplicationAttributesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorInvalidParameter`, `AWSSNSErrorInternalError`, `AWSSNSErrorAuthorizationError`, `AWSSNSErrorNotFound`.
 
 @see AWSSNSGetPlatformApplicationAttributesInput
 @see AWSSNSGetPlatformApplicationAttributesResponse
 */
- (AWSTask<AWSSNSGetPlatformApplicationAttributesResponse *> *)getPlatformApplicationAttributes:(AWSSNSGetPlatformApplicationAttributesInput *)request;

/**
 <p>Retrieves the attributes of the platform application object for the supported push notification services, such as APNS and GCM. For more information, see <a href="http://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html">Using Amazon SNS Mobile Push Notifications</a>. </p>
 
 @param request A container for the necessary parameters to execute the GetPlatformApplicationAttributes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorInvalidParameter`, `AWSSNSErrorInternalError`, `AWSSNSErrorAuthorizationError`, `AWSSNSErrorNotFound`.
 
 @see AWSSNSGetPlatformApplicationAttributesInput
 @see AWSSNSGetPlatformApplicationAttributesResponse
 */
- (void)getPlatformApplicationAttributes:(AWSSNSGetPlatformApplicationAttributesInput *)request completionHandler:(void (^ _Nullable)(AWSSNSGetPlatformApplicationAttributesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the settings for sending SMS messages from your account.</p><p>These settings are set with the <code>SetSMSAttributes</code> action.</p>
 
 @param request A container for the necessary parameters to execute the GetSMSAttributes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSNSGetSMSAttributesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorThrottled`, `AWSSNSErrorInternalError`, `AWSSNSErrorInvalidParameter`.
 
 @see AWSSNSGetSMSAttributesInput
 @see AWSSNSGetSMSAttributesResponse
 */
- (AWSTask<AWSSNSGetSMSAttributesResponse *> *)getSMSAttributes:(AWSSNSGetSMSAttributesInput *)request;

/**
 <p>Returns the settings for sending SMS messages from your account.</p><p>These settings are set with the <code>SetSMSAttributes</code> action.</p>
 
 @param request A container for the necessary parameters to execute the GetSMSAttributes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorThrottled`, `AWSSNSErrorInternalError`, `AWSSNSErrorInvalidParameter`.
 
 @see AWSSNSGetSMSAttributesInput
 @see AWSSNSGetSMSAttributesResponse
 */
- (void)getSMSAttributes:(AWSSNSGetSMSAttributesInput *)request completionHandler:(void (^ _Nullable)(AWSSNSGetSMSAttributesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

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
 <p>Returns all of the properties of a topic. Topic properties returned might differ based on the authorization of the user. </p>
 
 @param request A container for the necessary parameters to execute the GetTopicAttributes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSNSGetTopicAttributesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorInvalidParameter`, `AWSSNSErrorInternalError`, `AWSSNSErrorNotFound`, `AWSSNSErrorAuthorizationError`.
 
 @see AWSSNSGetTopicAttributesInput
 @see AWSSNSGetTopicAttributesResponse
 */
- (AWSTask<AWSSNSGetTopicAttributesResponse *> *)getTopicAttributes:(AWSSNSGetTopicAttributesInput *)request;

/**
 <p>Returns all of the properties of a topic. Topic properties returned might differ based on the authorization of the user. </p>
 
 @param request A container for the necessary parameters to execute the GetTopicAttributes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorInvalidParameter`, `AWSSNSErrorInternalError`, `AWSSNSErrorNotFound`, `AWSSNSErrorAuthorizationError`.
 
 @see AWSSNSGetTopicAttributesInput
 @see AWSSNSGetTopicAttributesResponse
 */
- (void)getTopicAttributes:(AWSSNSGetTopicAttributesInput *)request completionHandler:(void (^ _Nullable)(AWSSNSGetTopicAttributesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the endpoints and endpoint attributes for devices in a supported push notification service, such as GCM and APNS. The results for <code>ListEndpointsByPlatformApplication</code> are paginated and return a limited list of endpoints, up to 100. If additional records are available after the first page results, then a NextToken string will be returned. To receive the next page, you call <code>ListEndpointsByPlatformApplication</code> again using the NextToken string received from the previous call. When there are no more records to return, NextToken will be null. For more information, see <a href="http://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html">Using Amazon SNS Mobile Push Notifications</a>. </p>
 
 @param request A container for the necessary parameters to execute the ListEndpointsByPlatformApplication service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSNSListEndpointsByPlatformApplicationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorInvalidParameter`, `AWSSNSErrorInternalError`, `AWSSNSErrorAuthorizationError`, `AWSSNSErrorNotFound`.
 
 @see AWSSNSListEndpointsByPlatformApplicationInput
 @see AWSSNSListEndpointsByPlatformApplicationResponse
 */
- (AWSTask<AWSSNSListEndpointsByPlatformApplicationResponse *> *)listEndpointsByPlatformApplication:(AWSSNSListEndpointsByPlatformApplicationInput *)request;

/**
 <p>Lists the endpoints and endpoint attributes for devices in a supported push notification service, such as GCM and APNS. The results for <code>ListEndpointsByPlatformApplication</code> are paginated and return a limited list of endpoints, up to 100. If additional records are available after the first page results, then a NextToken string will be returned. To receive the next page, you call <code>ListEndpointsByPlatformApplication</code> again using the NextToken string received from the previous call. When there are no more records to return, NextToken will be null. For more information, see <a href="http://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html">Using Amazon SNS Mobile Push Notifications</a>. </p>
 
 @param request A container for the necessary parameters to execute the ListEndpointsByPlatformApplication service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorInvalidParameter`, `AWSSNSErrorInternalError`, `AWSSNSErrorAuthorizationError`, `AWSSNSErrorNotFound`.
 
 @see AWSSNSListEndpointsByPlatformApplicationInput
 @see AWSSNSListEndpointsByPlatformApplicationResponse
 */
- (void)listEndpointsByPlatformApplication:(AWSSNSListEndpointsByPlatformApplicationInput *)request completionHandler:(void (^ _Nullable)(AWSSNSListEndpointsByPlatformApplicationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of phone numbers that are opted out, meaning you cannot send SMS messages to them.</p><p>The results for <code>ListPhoneNumbersOptedOut</code> are paginated, and each page returns up to 100 phone numbers. If additional phone numbers are available after the first page of results, then a <code>NextToken</code> string will be returned. To receive the next page, you call <code>ListPhoneNumbersOptedOut</code> again using the <code>NextToken</code> string received from the previous call. When there are no more records to return, <code>NextToken</code> will be null.</p>
 
 @param request A container for the necessary parameters to execute the ListPhoneNumbersOptedOut service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSNSListPhoneNumbersOptedOutResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorThrottled`, `AWSSNSErrorInternalError`, `AWSSNSErrorInvalidParameter`.
 
 @see AWSSNSListPhoneNumbersOptedOutInput
 @see AWSSNSListPhoneNumbersOptedOutResponse
 */
- (AWSTask<AWSSNSListPhoneNumbersOptedOutResponse *> *)listPhoneNumbersOptedOut:(AWSSNSListPhoneNumbersOptedOutInput *)request;

/**
 <p>Returns a list of phone numbers that are opted out, meaning you cannot send SMS messages to them.</p><p>The results for <code>ListPhoneNumbersOptedOut</code> are paginated, and each page returns up to 100 phone numbers. If additional phone numbers are available after the first page of results, then a <code>NextToken</code> string will be returned. To receive the next page, you call <code>ListPhoneNumbersOptedOut</code> again using the <code>NextToken</code> string received from the previous call. When there are no more records to return, <code>NextToken</code> will be null.</p>
 
 @param request A container for the necessary parameters to execute the ListPhoneNumbersOptedOut service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorThrottled`, `AWSSNSErrorInternalError`, `AWSSNSErrorInvalidParameter`.
 
 @see AWSSNSListPhoneNumbersOptedOutInput
 @see AWSSNSListPhoneNumbersOptedOutResponse
 */
- (void)listPhoneNumbersOptedOut:(AWSSNSListPhoneNumbersOptedOutInput *)request completionHandler:(void (^ _Nullable)(AWSSNSListPhoneNumbersOptedOutResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the platform application objects for the supported push notification services, such as APNS and GCM. The results for <code>ListPlatformApplications</code> are paginated and return a limited list of applications, up to 100. If additional records are available after the first page results, then a NextToken string will be returned. To receive the next page, you call <code>ListPlatformApplications</code> using the NextToken string received from the previous call. When there are no more records to return, NextToken will be null. For more information, see <a href="http://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html">Using Amazon SNS Mobile Push Notifications</a>. </p>
 
 @param request A container for the necessary parameters to execute the ListPlatformApplications service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSNSListPlatformApplicationsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorInvalidParameter`, `AWSSNSErrorInternalError`, `AWSSNSErrorAuthorizationError`.
 
 @see AWSSNSListPlatformApplicationsInput
 @see AWSSNSListPlatformApplicationsResponse
 */
- (AWSTask<AWSSNSListPlatformApplicationsResponse *> *)listPlatformApplications:(AWSSNSListPlatformApplicationsInput *)request;

/**
 <p>Lists the platform application objects for the supported push notification services, such as APNS and GCM. The results for <code>ListPlatformApplications</code> are paginated and return a limited list of applications, up to 100. If additional records are available after the first page results, then a NextToken string will be returned. To receive the next page, you call <code>ListPlatformApplications</code> using the NextToken string received from the previous call. When there are no more records to return, NextToken will be null. For more information, see <a href="http://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html">Using Amazon SNS Mobile Push Notifications</a>. </p>
 
 @param request A container for the necessary parameters to execute the ListPlatformApplications service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorInvalidParameter`, `AWSSNSErrorInternalError`, `AWSSNSErrorAuthorizationError`.
 
 @see AWSSNSListPlatformApplicationsInput
 @see AWSSNSListPlatformApplicationsResponse
 */
- (void)listPlatformApplications:(AWSSNSListPlatformApplicationsInput *)request completionHandler:(void (^ _Nullable)(AWSSNSListPlatformApplicationsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of the requester's subscriptions. Each call returns a limited list of subscriptions, up to 100. If there are more subscriptions, a <code>NextToken</code> is also returned. Use the <code>NextToken</code> parameter in a new <code>ListSubscriptions</code> call to get further results.</p>
 
 @param request A container for the necessary parameters to execute the ListSubscriptions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSNSListSubscriptionsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorInvalidParameter`, `AWSSNSErrorInternalError`, `AWSSNSErrorAuthorizationError`.
 
 @see AWSSNSListSubscriptionsInput
 @see AWSSNSListSubscriptionsResponse
 */
- (AWSTask<AWSSNSListSubscriptionsResponse *> *)listSubscriptions:(AWSSNSListSubscriptionsInput *)request;

/**
 <p>Returns a list of the requester's subscriptions. Each call returns a limited list of subscriptions, up to 100. If there are more subscriptions, a <code>NextToken</code> is also returned. Use the <code>NextToken</code> parameter in a new <code>ListSubscriptions</code> call to get further results.</p>
 
 @param request A container for the necessary parameters to execute the ListSubscriptions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorInvalidParameter`, `AWSSNSErrorInternalError`, `AWSSNSErrorAuthorizationError`.
 
 @see AWSSNSListSubscriptionsInput
 @see AWSSNSListSubscriptionsResponse
 */
- (void)listSubscriptions:(AWSSNSListSubscriptionsInput *)request completionHandler:(void (^ _Nullable)(AWSSNSListSubscriptionsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of the subscriptions to a specific topic. Each call returns a limited list of subscriptions, up to 100. If there are more subscriptions, a <code>NextToken</code> is also returned. Use the <code>NextToken</code> parameter in a new <code>ListSubscriptionsByTopic</code> call to get further results.</p>
 
 @param request A container for the necessary parameters to execute the ListSubscriptionsByTopic service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSNSListSubscriptionsByTopicResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorInvalidParameter`, `AWSSNSErrorInternalError`, `AWSSNSErrorNotFound`, `AWSSNSErrorAuthorizationError`.
 
 @see AWSSNSListSubscriptionsByTopicInput
 @see AWSSNSListSubscriptionsByTopicResponse
 */
- (AWSTask<AWSSNSListSubscriptionsByTopicResponse *> *)listSubscriptionsByTopic:(AWSSNSListSubscriptionsByTopicInput *)request;

/**
 <p>Returns a list of the subscriptions to a specific topic. Each call returns a limited list of subscriptions, up to 100. If there are more subscriptions, a <code>NextToken</code> is also returned. Use the <code>NextToken</code> parameter in a new <code>ListSubscriptionsByTopic</code> call to get further results.</p>
 
 @param request A container for the necessary parameters to execute the ListSubscriptionsByTopic service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorInvalidParameter`, `AWSSNSErrorInternalError`, `AWSSNSErrorNotFound`, `AWSSNSErrorAuthorizationError`.
 
 @see AWSSNSListSubscriptionsByTopicInput
 @see AWSSNSListSubscriptionsByTopicResponse
 */
- (void)listSubscriptionsByTopic:(AWSSNSListSubscriptionsByTopicInput *)request completionHandler:(void (^ _Nullable)(AWSSNSListSubscriptionsByTopicResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of the requester's topics. Each call returns a limited list of topics, up to 100. If there are more topics, a <code>NextToken</code> is also returned. Use the <code>NextToken</code> parameter in a new <code>ListTopics</code> call to get further results.</p>
 
 @param request A container for the necessary parameters to execute the ListTopics service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSNSListTopicsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorInvalidParameter`, `AWSSNSErrorInternalError`, `AWSSNSErrorAuthorizationError`.
 
 @see AWSSNSListTopicsInput
 @see AWSSNSListTopicsResponse
 */
- (AWSTask<AWSSNSListTopicsResponse *> *)listTopics:(AWSSNSListTopicsInput *)request;

/**
 <p>Returns a list of the requester's topics. Each call returns a limited list of topics, up to 100. If there are more topics, a <code>NextToken</code> is also returned. Use the <code>NextToken</code> parameter in a new <code>ListTopics</code> call to get further results.</p>
 
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

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSNSOptInPhoneNumberResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorThrottled`, `AWSSNSErrorInternalError`, `AWSSNSErrorInvalidParameter`.
 
 @see AWSSNSOptInPhoneNumberInput
 @see AWSSNSOptInPhoneNumberResponse
 */
- (AWSTask<AWSSNSOptInPhoneNumberResponse *> *)optInPhoneNumber:(AWSSNSOptInPhoneNumberInput *)request;

/**
 <p>Use this request to opt in a phone number that is opted out, which enables you to resume sending SMS messages to the number.</p><p>You can opt in a phone number only once every 30 days.</p>
 
 @param request A container for the necessary parameters to execute the OptInPhoneNumber service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorThrottled`, `AWSSNSErrorInternalError`, `AWSSNSErrorInvalidParameter`.
 
 @see AWSSNSOptInPhoneNumberInput
 @see AWSSNSOptInPhoneNumberResponse
 */
- (void)optInPhoneNumber:(AWSSNSOptInPhoneNumberInput *)request completionHandler:(void (^ _Nullable)(AWSSNSOptInPhoneNumberResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Sends a message to all of a topic's subscribed endpoints. When a <code>messageId</code> is returned, the message has been saved and Amazon SNS will attempt to deliver it to the topic's subscribers shortly. The format of the outgoing message to each subscribed endpoint depends on the notification protocol.</p><p>To use the <code>Publish</code> action for sending a message to a mobile endpoint, such as an app on a Kindle device or mobile phone, you must specify the EndpointArn for the TargetArn parameter. The EndpointArn is returned when making a call with the <code>CreatePlatformEndpoint</code> action. The second example below shows a request and response for publishing to a mobile endpoint. </p><p>For more information about formatting messages, see <a href="http://docs.aws.amazon.com/sns/latest/dg/mobile-push-send-custommessage.html">Send Custom Platform-Specific Payloads in Messages to Mobile Devices</a>. </p>
 
 @param request A container for the necessary parameters to execute the Publish service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSNSPublishResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorInvalidParameter`, `AWSSNSErrorInvalidParameterValue`, `AWSSNSErrorInternalError`, `AWSSNSErrorNotFound`, `AWSSNSErrorEndpointDisabled`, `AWSSNSErrorPlatformApplicationDisabled`, `AWSSNSErrorAuthorizationError`.
 
 @see AWSSNSPublishInput
 @see AWSSNSPublishResponse
 */
- (AWSTask<AWSSNSPublishResponse *> *)publish:(AWSSNSPublishInput *)request;

/**
 <p>Sends a message to all of a topic's subscribed endpoints. When a <code>messageId</code> is returned, the message has been saved and Amazon SNS will attempt to deliver it to the topic's subscribers shortly. The format of the outgoing message to each subscribed endpoint depends on the notification protocol.</p><p>To use the <code>Publish</code> action for sending a message to a mobile endpoint, such as an app on a Kindle device or mobile phone, you must specify the EndpointArn for the TargetArn parameter. The EndpointArn is returned when making a call with the <code>CreatePlatformEndpoint</code> action. The second example below shows a request and response for publishing to a mobile endpoint. </p><p>For more information about formatting messages, see <a href="http://docs.aws.amazon.com/sns/latest/dg/mobile-push-send-custommessage.html">Send Custom Platform-Specific Payloads in Messages to Mobile Devices</a>. </p>
 
 @param request A container for the necessary parameters to execute the Publish service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorInvalidParameter`, `AWSSNSErrorInvalidParameterValue`, `AWSSNSErrorInternalError`, `AWSSNSErrorNotFound`, `AWSSNSErrorEndpointDisabled`, `AWSSNSErrorPlatformApplicationDisabled`, `AWSSNSErrorAuthorizationError`.
 
 @see AWSSNSPublishInput
 @see AWSSNSPublishResponse
 */
- (void)publish:(AWSSNSPublishInput *)request completionHandler:(void (^ _Nullable)(AWSSNSPublishResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Removes a statement from a topic's access control policy.</p>
 
 @param request A container for the necessary parameters to execute the RemovePermission service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorInvalidParameter`, `AWSSNSErrorInternalError`, `AWSSNSErrorAuthorizationError`, `AWSSNSErrorNotFound`.
 
 @see AWSSNSRemovePermissionInput
 */
- (AWSTask *)removePermission:(AWSSNSRemovePermissionInput *)request;

/**
 <p>Removes a statement from a topic's access control policy.</p>
 
 @param request A container for the necessary parameters to execute the RemovePermission service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorInvalidParameter`, `AWSSNSErrorInternalError`, `AWSSNSErrorAuthorizationError`, `AWSSNSErrorNotFound`.
 
 @see AWSSNSRemovePermissionInput
 */
- (void)removePermission:(AWSSNSRemovePermissionInput *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Sets the attributes for an endpoint for a device on one of the supported push notification services, such as GCM and APNS. For more information, see <a href="http://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html">Using Amazon SNS Mobile Push Notifications</a>. </p>
 
 @param request A container for the necessary parameters to execute the SetEndpointAttributes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorInvalidParameter`, `AWSSNSErrorInternalError`, `AWSSNSErrorAuthorizationError`, `AWSSNSErrorNotFound`.
 
 @see AWSSNSSetEndpointAttributesInput
 */
- (AWSTask *)setEndpointAttributes:(AWSSNSSetEndpointAttributesInput *)request;

/**
 <p>Sets the attributes for an endpoint for a device on one of the supported push notification services, such as GCM and APNS. For more information, see <a href="http://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html">Using Amazon SNS Mobile Push Notifications</a>. </p>
 
 @param request A container for the necessary parameters to execute the SetEndpointAttributes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorInvalidParameter`, `AWSSNSErrorInternalError`, `AWSSNSErrorAuthorizationError`, `AWSSNSErrorNotFound`.
 
 @see AWSSNSSetEndpointAttributesInput
 */
- (void)setEndpointAttributes:(AWSSNSSetEndpointAttributesInput *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Sets the attributes of the platform application object for the supported push notification services, such as APNS and GCM. For more information, see <a href="http://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html">Using Amazon SNS Mobile Push Notifications</a>. For information on configuring attributes for message delivery status, see <a href="http://docs.aws.amazon.com/sns/latest/dg/sns-msg-status.html">Using Amazon SNS Application Attributes for Message Delivery Status</a>. </p>
 
 @param request A container for the necessary parameters to execute the SetPlatformApplicationAttributes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorInvalidParameter`, `AWSSNSErrorInternalError`, `AWSSNSErrorAuthorizationError`, `AWSSNSErrorNotFound`.
 
 @see AWSSNSSetPlatformApplicationAttributesInput
 */
- (AWSTask *)setPlatformApplicationAttributes:(AWSSNSSetPlatformApplicationAttributesInput *)request;

/**
 <p>Sets the attributes of the platform application object for the supported push notification services, such as APNS and GCM. For more information, see <a href="http://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html">Using Amazon SNS Mobile Push Notifications</a>. For information on configuring attributes for message delivery status, see <a href="http://docs.aws.amazon.com/sns/latest/dg/sns-msg-status.html">Using Amazon SNS Application Attributes for Message Delivery Status</a>. </p>
 
 @param request A container for the necessary parameters to execute the SetPlatformApplicationAttributes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorInvalidParameter`, `AWSSNSErrorInternalError`, `AWSSNSErrorAuthorizationError`, `AWSSNSErrorNotFound`.
 
 @see AWSSNSSetPlatformApplicationAttributesInput
 */
- (void)setPlatformApplicationAttributes:(AWSSNSSetPlatformApplicationAttributesInput *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Use this request to set the default settings for sending SMS messages and receiving daily SMS usage reports.</p><p>You can override some of these settings for a single message when you use the <code>Publish</code> action with the <code>MessageAttributes.entry.N</code> parameter. For more information, see <a href="http://docs.aws.amazon.com/sns/latest/dg/sms_publish-to-phone.html">Sending an SMS Message</a> in the <i>Amazon SNS Developer Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the SetSMSAttributes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSNSSetSMSAttributesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorInvalidParameter`, `AWSSNSErrorThrottled`, `AWSSNSErrorInternalError`.
 
 @see AWSSNSSetSMSAttributesInput
 @see AWSSNSSetSMSAttributesResponse
 */
- (AWSTask<AWSSNSSetSMSAttributesResponse *> *)setSMSAttributes:(AWSSNSSetSMSAttributesInput *)request;

/**
 <p>Use this request to set the default settings for sending SMS messages and receiving daily SMS usage reports.</p><p>You can override some of these settings for a single message when you use the <code>Publish</code> action with the <code>MessageAttributes.entry.N</code> parameter. For more information, see <a href="http://docs.aws.amazon.com/sns/latest/dg/sms_publish-to-phone.html">Sending an SMS Message</a> in the <i>Amazon SNS Developer Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the SetSMSAttributes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorInvalidParameter`, `AWSSNSErrorThrottled`, `AWSSNSErrorInternalError`.
 
 @see AWSSNSSetSMSAttributesInput
 @see AWSSNSSetSMSAttributesResponse
 */
- (void)setSMSAttributes:(AWSSNSSetSMSAttributesInput *)request completionHandler:(void (^ _Nullable)(AWSSNSSetSMSAttributesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Allows a subscription owner to set an attribute of the topic to a new value.</p>
 
 @param request A container for the necessary parameters to execute the SetSubscriptionAttributes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorInvalidParameter`, `AWSSNSErrorInternalError`, `AWSSNSErrorNotFound`, `AWSSNSErrorAuthorizationError`.
 
 @see AWSSNSSetSubscriptionAttributesInput
 */
- (AWSTask *)setSubscriptionAttributes:(AWSSNSSetSubscriptionAttributesInput *)request;

/**
 <p>Allows a subscription owner to set an attribute of the topic to a new value.</p>
 
 @param request A container for the necessary parameters to execute the SetSubscriptionAttributes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorInvalidParameter`, `AWSSNSErrorInternalError`, `AWSSNSErrorNotFound`, `AWSSNSErrorAuthorizationError`.
 
 @see AWSSNSSetSubscriptionAttributesInput
 */
- (void)setSubscriptionAttributes:(AWSSNSSetSubscriptionAttributesInput *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Allows a topic owner to set an attribute of the topic to a new value.</p>
 
 @param request A container for the necessary parameters to execute the SetTopicAttributes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorInvalidParameter`, `AWSSNSErrorInternalError`, `AWSSNSErrorNotFound`, `AWSSNSErrorAuthorizationError`.
 
 @see AWSSNSSetTopicAttributesInput
 */
- (AWSTask *)setTopicAttributes:(AWSSNSSetTopicAttributesInput *)request;

/**
 <p>Allows a topic owner to set an attribute of the topic to a new value.</p>
 
 @param request A container for the necessary parameters to execute the SetTopicAttributes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorInvalidParameter`, `AWSSNSErrorInternalError`, `AWSSNSErrorNotFound`, `AWSSNSErrorAuthorizationError`.
 
 @see AWSSNSSetTopicAttributesInput
 */
- (void)setTopicAttributes:(AWSSNSSetTopicAttributesInput *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Prepares to subscribe an endpoint by sending the endpoint a confirmation message. To actually create a subscription, the endpoint owner must call the <code>ConfirmSubscription</code> action with the token from the confirmation message. Confirmation tokens are valid for three days.</p>
 
 @param request A container for the necessary parameters to execute the Subscribe service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSNSSubscribeResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorSubscriptionLimitExceeded`, `AWSSNSErrorInvalidParameter`, `AWSSNSErrorInternalError`, `AWSSNSErrorNotFound`, `AWSSNSErrorAuthorizationError`.
 
 @see AWSSNSSubscribeInput
 @see AWSSNSSubscribeResponse
 */
- (AWSTask<AWSSNSSubscribeResponse *> *)subscribe:(AWSSNSSubscribeInput *)request;

/**
 <p>Prepares to subscribe an endpoint by sending the endpoint a confirmation message. To actually create a subscription, the endpoint owner must call the <code>ConfirmSubscription</code> action with the token from the confirmation message. Confirmation tokens are valid for three days.</p>
 
 @param request A container for the necessary parameters to execute the Subscribe service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorSubscriptionLimitExceeded`, `AWSSNSErrorInvalidParameter`, `AWSSNSErrorInternalError`, `AWSSNSErrorNotFound`, `AWSSNSErrorAuthorizationError`.
 
 @see AWSSNSSubscribeInput
 @see AWSSNSSubscribeResponse
 */
- (void)subscribe:(AWSSNSSubscribeInput *)request completionHandler:(void (^ _Nullable)(AWSSNSSubscribeResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a subscription. If the subscription requires authentication for deletion, only the owner of the subscription or the topic's owner can unsubscribe, and an AWS signature is required. If the <code>Unsubscribe</code> call does not require authentication and the requester is not the subscription owner, a final cancellation message is delivered to the endpoint, so that the endpoint owner can easily resubscribe to the topic if the <code>Unsubscribe</code> request was unintended.</p>
 
 @param request A container for the necessary parameters to execute the Unsubscribe service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorInvalidParameter`, `AWSSNSErrorInternalError`, `AWSSNSErrorAuthorizationError`, `AWSSNSErrorNotFound`.
 
 @see AWSSNSUnsubscribeInput
 */
- (AWSTask *)unsubscribe:(AWSSNSUnsubscribeInput *)request;

/**
 <p>Deletes a subscription. If the subscription requires authentication for deletion, only the owner of the subscription or the topic's owner can unsubscribe, and an AWS signature is required. If the <code>Unsubscribe</code> call does not require authentication and the requester is not the subscription owner, a final cancellation message is delivered to the endpoint, so that the endpoint owner can easily resubscribe to the topic if the <code>Unsubscribe</code> request was unintended.</p>
 
 @param request A container for the necessary parameters to execute the Unsubscribe service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSNSErrorDomain` domain and the following error code: `AWSSNSErrorInvalidParameter`, `AWSSNSErrorInternalError`, `AWSSNSErrorAuthorizationError`, `AWSSNSErrorNotFound`.
 
 @see AWSSNSUnsubscribeInput
 */
- (void)unsubscribe:(AWSSNSUnsubscribeInput *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
