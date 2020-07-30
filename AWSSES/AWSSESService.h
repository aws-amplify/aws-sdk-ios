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
#import "AWSSESModel.h"
#import "AWSSESResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSSES
FOUNDATION_EXPORT NSString *const AWSSESSDKVersion;

/**
 <fullname>Amazon SES API v2</fullname><p>Welcome to the Amazon SES API v2 Reference. This guide provides information about the Amazon SES API v2, including supported operations, data types, parameters, and schemas.</p><p><a href="https://aws.amazon.com/pinpoint">Amazon SES</a> is an AWS service that you can use to send email messages to your customers.</p><p>If you're new to Amazon SES API v2, you might find it helpful to also review the <a href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/">Amazon Simple Email Service Developer Guide</a>. The <i>Amazon SES Developer Guide</i> provides information and code samples that demonstrate how to use Amazon SES API v2 features programmatically.</p><p>The Amazon SES API v2 is available in several AWS Regions and it provides an endpoint for each of these Regions. For a list of all the Regions and endpoints where the API is currently available, see <a href="https://docs.aws.amazon.com/general/latest/gr/rande.html#ses_region">AWS Service Endpoints</a> in the <i>Amazon Web Services General Reference</i>. To learn more about AWS Regions, see <a href="https://docs.aws.amazon.com/general/latest/gr/rande-manage.html">Managing AWS Regions</a> in the <i>Amazon Web Services General Reference</i>.</p><p>In each Region, AWS maintains multiple Availability Zones. These Availability Zones are physically isolated from each other, but are united by private, low-latency, high-throughput, and highly redundant network connections. These Availability Zones enable us to provide very high levels of availability and redundancy, while also minimizing latency. To learn more about the number of Availability Zones that are available in each Region, see <a href="http://aws.amazon.com/about-aws/global-infrastructure/">AWS Global Infrastructure</a>.</p>
 */
@interface AWSSES : AWSService

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

     let SES = AWSSES.default()

 *Objective-C*

     AWSSES *SES = [AWSSES defaultSES];

 @return The default service client.
 */
+ (instancetype)defaultSES;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSSES.register(with: configuration!, forKey: "USWest2SES")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSSES registerSESWithConfiguration:configuration forKey:@"USWest2SES"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let SES = AWSSES(forKey: "USWest2SES")

 *Objective-C*

     AWSSES *SES = [AWSSES SESForKey:@"USWest2SES"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerSESWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerSESWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSSES.register(with: configuration!, forKey: "USWest2SES")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSSES registerSESWithConfiguration:configuration forKey:@"USWest2SES"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let SES = AWSSES(forKey: "USWest2SES")

 *Objective-C*

     AWSSES *SES = [AWSSES SESForKey:@"USWest2SES"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)SESForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removeSESForKey:(NSString *)key;

/**
 <p>Create a configuration set. <i>Configuration sets</i> are groups of rules that you can apply to the emails that you send. You apply a configuration set to an email by specifying the name of the configuration set when you call the Amazon SES API v2. When you apply a configuration set to an email, all of the rules in that configuration set are applied to the email. </p>
 
 @param request A container for the necessary parameters to execute the CreateConfigurationSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESCreateConfigurationSetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorAlreadyExists`, `AWSSESErrorNotFound`, `AWSSESErrorTooManyRequests`, `AWSSESErrorLimitExceeded`, `AWSSESErrorBadRequest`, `AWSSESErrorConcurrentModification`.
 
 @see AWSSESCreateConfigurationSetRequest
 @see AWSSESCreateConfigurationSetResponse
 */
- (AWSTask<AWSSESCreateConfigurationSetResponse *> *)createConfigurationSet:(AWSSESCreateConfigurationSetRequest *)request;

/**
 <p>Create a configuration set. <i>Configuration sets</i> are groups of rules that you can apply to the emails that you send. You apply a configuration set to an email by specifying the name of the configuration set when you call the Amazon SES API v2. When you apply a configuration set to an email, all of the rules in that configuration set are applied to the email. </p>
 
 @param request A container for the necessary parameters to execute the CreateConfigurationSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorAlreadyExists`, `AWSSESErrorNotFound`, `AWSSESErrorTooManyRequests`, `AWSSESErrorLimitExceeded`, `AWSSESErrorBadRequest`, `AWSSESErrorConcurrentModification`.
 
 @see AWSSESCreateConfigurationSetRequest
 @see AWSSESCreateConfigurationSetResponse
 */
- (void)createConfigurationSet:(AWSSESCreateConfigurationSetRequest *)request completionHandler:(void (^ _Nullable)(AWSSESCreateConfigurationSetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Create an event destination. <i>Events</i> include message sends, deliveries, opens, clicks, bounces, and complaints. <i>Event destinations</i> are places that you can send information about these events to. For example, you can send event data to Amazon SNS to receive notifications when you receive bounces or complaints, or you can use Amazon Kinesis Data Firehose to stream data to Amazon S3 for long-term storage.</p><p>A single configuration set can include more than one event destination.</p>
 
 @param request A container for the necessary parameters to execute the CreateConfigurationSetEventDestination service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESCreateConfigurationSetEventDestinationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorNotFound`, `AWSSESErrorAlreadyExists`, `AWSSESErrorLimitExceeded`, `AWSSESErrorTooManyRequests`, `AWSSESErrorBadRequest`.
 
 @see AWSSESCreateConfigurationSetEventDestinationRequest
 @see AWSSESCreateConfigurationSetEventDestinationResponse
 */
- (AWSTask<AWSSESCreateConfigurationSetEventDestinationResponse *> *)createConfigurationSetEventDestination:(AWSSESCreateConfigurationSetEventDestinationRequest *)request;

/**
 <p>Create an event destination. <i>Events</i> include message sends, deliveries, opens, clicks, bounces, and complaints. <i>Event destinations</i> are places that you can send information about these events to. For example, you can send event data to Amazon SNS to receive notifications when you receive bounces or complaints, or you can use Amazon Kinesis Data Firehose to stream data to Amazon S3 for long-term storage.</p><p>A single configuration set can include more than one event destination.</p>
 
 @param request A container for the necessary parameters to execute the CreateConfigurationSetEventDestination service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorNotFound`, `AWSSESErrorAlreadyExists`, `AWSSESErrorLimitExceeded`, `AWSSESErrorTooManyRequests`, `AWSSESErrorBadRequest`.
 
 @see AWSSESCreateConfigurationSetEventDestinationRequest
 @see AWSSESCreateConfigurationSetEventDestinationResponse
 */
- (void)createConfigurationSetEventDestination:(AWSSESCreateConfigurationSetEventDestinationRequest *)request completionHandler:(void (^ _Nullable)(AWSSESCreateConfigurationSetEventDestinationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new custom verification email template.</p><p>For more information about custom verification email templates, see <a href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/send-email-verify-address-custom.html">Using Custom Verification Email Templates</a> in the <i>Amazon SES Developer Guide</i>.</p><p>You can execute this operation no more than once per second.</p>
 
 @param request A container for the necessary parameters to execute the CreateCustomVerificationEmailTemplate service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESCreateCustomVerificationEmailTemplateResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorBadRequest`, `AWSSESErrorAlreadyExists`, `AWSSESErrorNotFound`, `AWSSESErrorTooManyRequests`, `AWSSESErrorLimitExceeded`.
 
 @see AWSSESCreateCustomVerificationEmailTemplateRequest
 @see AWSSESCreateCustomVerificationEmailTemplateResponse
 */
- (AWSTask<AWSSESCreateCustomVerificationEmailTemplateResponse *> *)createCustomVerificationEmailTemplate:(AWSSESCreateCustomVerificationEmailTemplateRequest *)request;

/**
 <p>Creates a new custom verification email template.</p><p>For more information about custom verification email templates, see <a href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/send-email-verify-address-custom.html">Using Custom Verification Email Templates</a> in the <i>Amazon SES Developer Guide</i>.</p><p>You can execute this operation no more than once per second.</p>
 
 @param request A container for the necessary parameters to execute the CreateCustomVerificationEmailTemplate service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorBadRequest`, `AWSSESErrorAlreadyExists`, `AWSSESErrorNotFound`, `AWSSESErrorTooManyRequests`, `AWSSESErrorLimitExceeded`.
 
 @see AWSSESCreateCustomVerificationEmailTemplateRequest
 @see AWSSESCreateCustomVerificationEmailTemplateResponse
 */
- (void)createCustomVerificationEmailTemplate:(AWSSESCreateCustomVerificationEmailTemplateRequest *)request completionHandler:(void (^ _Nullable)(AWSSESCreateCustomVerificationEmailTemplateResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Create a new pool of dedicated IP addresses. A pool can include one or more dedicated IP addresses that are associated with your AWS account. You can associate a pool with a configuration set. When you send an email that uses that configuration set, the message is sent from one of the addresses in the associated pool.</p>
 
 @param request A container for the necessary parameters to execute the CreateDedicatedIpPool service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESCreateDedicatedIpPoolResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorAlreadyExists`, `AWSSESErrorLimitExceeded`, `AWSSESErrorTooManyRequests`, `AWSSESErrorBadRequest`, `AWSSESErrorConcurrentModification`.
 
 @see AWSSESCreateDedicatedIpPoolRequest
 @see AWSSESCreateDedicatedIpPoolResponse
 */
- (AWSTask<AWSSESCreateDedicatedIpPoolResponse *> *)createDedicatedIpPool:(AWSSESCreateDedicatedIpPoolRequest *)request;

/**
 <p>Create a new pool of dedicated IP addresses. A pool can include one or more dedicated IP addresses that are associated with your AWS account. You can associate a pool with a configuration set. When you send an email that uses that configuration set, the message is sent from one of the addresses in the associated pool.</p>
 
 @param request A container for the necessary parameters to execute the CreateDedicatedIpPool service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorAlreadyExists`, `AWSSESErrorLimitExceeded`, `AWSSESErrorTooManyRequests`, `AWSSESErrorBadRequest`, `AWSSESErrorConcurrentModification`.
 
 @see AWSSESCreateDedicatedIpPoolRequest
 @see AWSSESCreateDedicatedIpPoolResponse
 */
- (void)createDedicatedIpPool:(AWSSESCreateDedicatedIpPoolRequest *)request completionHandler:(void (^ _Nullable)(AWSSESCreateDedicatedIpPoolResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Create a new predictive inbox placement test. Predictive inbox placement tests can help you predict how your messages will be handled by various email providers around the world. When you perform a predictive inbox placement test, you provide a sample message that contains the content that you plan to send to your customers. Amazon SES then sends that message to special email addresses spread across several major email providers. After about 24 hours, the test is complete, and you can use the <code>GetDeliverabilityTestReport</code> operation to view the results of the test.</p>
 
 @param request A container for the necessary parameters to execute the CreateDeliverabilityTestReport service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESCreateDeliverabilityTestReportResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorAccountSuspended`, `AWSSESErrorSendingPaused`, `AWSSESErrorMessageRejected`, `AWSSESErrorMailFromDomainNotVerified`, `AWSSESErrorNotFound`, `AWSSESErrorTooManyRequests`, `AWSSESErrorLimitExceeded`, `AWSSESErrorBadRequest`, `AWSSESErrorConcurrentModification`.
 
 @see AWSSESCreateDeliverabilityTestReportRequest
 @see AWSSESCreateDeliverabilityTestReportResponse
 */
- (AWSTask<AWSSESCreateDeliverabilityTestReportResponse *> *)createDeliverabilityTestReport:(AWSSESCreateDeliverabilityTestReportRequest *)request;

/**
 <p>Create a new predictive inbox placement test. Predictive inbox placement tests can help you predict how your messages will be handled by various email providers around the world. When you perform a predictive inbox placement test, you provide a sample message that contains the content that you plan to send to your customers. Amazon SES then sends that message to special email addresses spread across several major email providers. After about 24 hours, the test is complete, and you can use the <code>GetDeliverabilityTestReport</code> operation to view the results of the test.</p>
 
 @param request A container for the necessary parameters to execute the CreateDeliverabilityTestReport service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorAccountSuspended`, `AWSSESErrorSendingPaused`, `AWSSESErrorMessageRejected`, `AWSSESErrorMailFromDomainNotVerified`, `AWSSESErrorNotFound`, `AWSSESErrorTooManyRequests`, `AWSSESErrorLimitExceeded`, `AWSSESErrorBadRequest`, `AWSSESErrorConcurrentModification`.
 
 @see AWSSESCreateDeliverabilityTestReportRequest
 @see AWSSESCreateDeliverabilityTestReportResponse
 */
- (void)createDeliverabilityTestReport:(AWSSESCreateDeliverabilityTestReportRequest *)request completionHandler:(void (^ _Nullable)(AWSSESCreateDeliverabilityTestReportResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Starts the process of verifying an email identity. An <i>identity</i> is an email address or domain that you use when you send email. Before you can use an identity to send email, you first have to verify it. By verifying an identity, you demonstrate that you're the owner of the identity, and that you've given Amazon SES API v2 permission to send email from the identity.</p><p>When you verify an email address, Amazon SES sends an email to the address. Your email address is verified as soon as you follow the link in the verification email. </p><p>When you verify a domain without specifying the <code>DkimSigningAttributes</code> object, this operation provides a set of DKIM tokens. You can convert these tokens into CNAME records, which you then add to the DNS configuration for your domain. Your domain is verified when Amazon SES detects these records in the DNS configuration for your domain. This verification method is known as <a href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/easy-dkim.html">Easy DKIM</a>.</p><p>Alternatively, you can perform the verification process by providing your own public-private key pair. This verification method is known as Bring Your Own DKIM (BYODKIM). To use BYODKIM, your call to the <code>CreateEmailIdentity</code> operation has to include the <code>DkimSigningAttributes</code> object. When you specify this object, you provide a selector (a component of the DNS record name that identifies the public key that you want to use for DKIM authentication) and a private key.</p>
 
 @param request A container for the necessary parameters to execute the CreateEmailIdentity service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESCreateEmailIdentityResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorAlreadyExists`, `AWSSESErrorLimitExceeded`, `AWSSESErrorTooManyRequests`, `AWSSESErrorBadRequest`, `AWSSESErrorConcurrentModification`.
 
 @see AWSSESCreateEmailIdentityRequest
 @see AWSSESCreateEmailIdentityResponse
 */
- (AWSTask<AWSSESCreateEmailIdentityResponse *> *)createEmailIdentity:(AWSSESCreateEmailIdentityRequest *)request;

/**
 <p>Starts the process of verifying an email identity. An <i>identity</i> is an email address or domain that you use when you send email. Before you can use an identity to send email, you first have to verify it. By verifying an identity, you demonstrate that you're the owner of the identity, and that you've given Amazon SES API v2 permission to send email from the identity.</p><p>When you verify an email address, Amazon SES sends an email to the address. Your email address is verified as soon as you follow the link in the verification email. </p><p>When you verify a domain without specifying the <code>DkimSigningAttributes</code> object, this operation provides a set of DKIM tokens. You can convert these tokens into CNAME records, which you then add to the DNS configuration for your domain. Your domain is verified when Amazon SES detects these records in the DNS configuration for your domain. This verification method is known as <a href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/easy-dkim.html">Easy DKIM</a>.</p><p>Alternatively, you can perform the verification process by providing your own public-private key pair. This verification method is known as Bring Your Own DKIM (BYODKIM). To use BYODKIM, your call to the <code>CreateEmailIdentity</code> operation has to include the <code>DkimSigningAttributes</code> object. When you specify this object, you provide a selector (a component of the DNS record name that identifies the public key that you want to use for DKIM authentication) and a private key.</p>
 
 @param request A container for the necessary parameters to execute the CreateEmailIdentity service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorAlreadyExists`, `AWSSESErrorLimitExceeded`, `AWSSESErrorTooManyRequests`, `AWSSESErrorBadRequest`, `AWSSESErrorConcurrentModification`.
 
 @see AWSSESCreateEmailIdentityRequest
 @see AWSSESCreateEmailIdentityResponse
 */
- (void)createEmailIdentity:(AWSSESCreateEmailIdentityRequest *)request completionHandler:(void (^ _Nullable)(AWSSESCreateEmailIdentityResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates the specified sending authorization policy for the given identity (an email address or a domain).</p><note><p>This API is for the identity owner only. If you have not verified the identity, this API will return an error.</p></note><p>Sending authorization is a feature that enables an identity owner to authorize other senders to use its identities. For information about using sending authorization, see the <a href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/sending-authorization.html">Amazon SES Developer Guide</a>.</p><p>You can execute this operation no more than once per second.</p>
 
 @param request A container for the necessary parameters to execute the CreateEmailIdentityPolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESCreateEmailIdentityPolicyResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorNotFound`, `AWSSESErrorAlreadyExists`, `AWSSESErrorTooManyRequests`, `AWSSESErrorLimitExceeded`, `AWSSESErrorBadRequest`.
 
 @see AWSSESCreateEmailIdentityPolicyRequest
 @see AWSSESCreateEmailIdentityPolicyResponse
 */
- (AWSTask<AWSSESCreateEmailIdentityPolicyResponse *> *)createEmailIdentityPolicy:(AWSSESCreateEmailIdentityPolicyRequest *)request;

/**
 <p>Creates the specified sending authorization policy for the given identity (an email address or a domain).</p><note><p>This API is for the identity owner only. If you have not verified the identity, this API will return an error.</p></note><p>Sending authorization is a feature that enables an identity owner to authorize other senders to use its identities. For information about using sending authorization, see the <a href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/sending-authorization.html">Amazon SES Developer Guide</a>.</p><p>You can execute this operation no more than once per second.</p>
 
 @param request A container for the necessary parameters to execute the CreateEmailIdentityPolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorNotFound`, `AWSSESErrorAlreadyExists`, `AWSSESErrorTooManyRequests`, `AWSSESErrorLimitExceeded`, `AWSSESErrorBadRequest`.
 
 @see AWSSESCreateEmailIdentityPolicyRequest
 @see AWSSESCreateEmailIdentityPolicyResponse
 */
- (void)createEmailIdentityPolicy:(AWSSESCreateEmailIdentityPolicyRequest *)request completionHandler:(void (^ _Nullable)(AWSSESCreateEmailIdentityPolicyResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates an email template. Email templates enable you to send personalized email to one or more destinations in a single API operation. For more information, see the <a href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/send-personalized-email-api.html">Amazon SES Developer Guide</a>.</p><p>You can execute this operation no more than once per second.</p>
 
 @param request A container for the necessary parameters to execute the CreateEmailTemplate service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESCreateEmailTemplateResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorAlreadyExists`, `AWSSESErrorTooManyRequests`, `AWSSESErrorBadRequest`, `AWSSESErrorLimitExceeded`.
 
 @see AWSSESCreateEmailTemplateRequest
 @see AWSSESCreateEmailTemplateResponse
 */
- (AWSTask<AWSSESCreateEmailTemplateResponse *> *)createEmailTemplate:(AWSSESCreateEmailTemplateRequest *)request;

/**
 <p>Creates an email template. Email templates enable you to send personalized email to one or more destinations in a single API operation. For more information, see the <a href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/send-personalized-email-api.html">Amazon SES Developer Guide</a>.</p><p>You can execute this operation no more than once per second.</p>
 
 @param request A container for the necessary parameters to execute the CreateEmailTemplate service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorAlreadyExists`, `AWSSESErrorTooManyRequests`, `AWSSESErrorBadRequest`, `AWSSESErrorLimitExceeded`.
 
 @see AWSSESCreateEmailTemplateRequest
 @see AWSSESCreateEmailTemplateResponse
 */
- (void)createEmailTemplate:(AWSSESCreateEmailTemplateRequest *)request completionHandler:(void (^ _Nullable)(AWSSESCreateEmailTemplateResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Delete an existing configuration set.</p><p><i>Configuration sets</i> are groups of rules that you can apply to the emails you send. You apply a configuration set to an email by including a reference to the configuration set in the headers of the email. When you apply a configuration set to an email, all of the rules in that configuration set are applied to the email.</p>
 
 @param request A container for the necessary parameters to execute the DeleteConfigurationSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESDeleteConfigurationSetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorNotFound`, `AWSSESErrorTooManyRequests`, `AWSSESErrorBadRequest`, `AWSSESErrorConcurrentModification`.
 
 @see AWSSESDeleteConfigurationSetRequest
 @see AWSSESDeleteConfigurationSetResponse
 */
- (AWSTask<AWSSESDeleteConfigurationSetResponse *> *)deleteConfigurationSet:(AWSSESDeleteConfigurationSetRequest *)request;

/**
 <p>Delete an existing configuration set.</p><p><i>Configuration sets</i> are groups of rules that you can apply to the emails you send. You apply a configuration set to an email by including a reference to the configuration set in the headers of the email. When you apply a configuration set to an email, all of the rules in that configuration set are applied to the email.</p>
 
 @param request A container for the necessary parameters to execute the DeleteConfigurationSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorNotFound`, `AWSSESErrorTooManyRequests`, `AWSSESErrorBadRequest`, `AWSSESErrorConcurrentModification`.
 
 @see AWSSESDeleteConfigurationSetRequest
 @see AWSSESDeleteConfigurationSetResponse
 */
- (void)deleteConfigurationSet:(AWSSESDeleteConfigurationSetRequest *)request completionHandler:(void (^ _Nullable)(AWSSESDeleteConfigurationSetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Delete an event destination.</p><p><i>Events</i> include message sends, deliveries, opens, clicks, bounces, and complaints. <i>Event destinations</i> are places that you can send information about these events to. For example, you can send event data to Amazon SNS to receive notifications when you receive bounces or complaints, or you can use Amazon Kinesis Data Firehose to stream data to Amazon S3 for long-term storage.</p>
 
 @param request A container for the necessary parameters to execute the DeleteConfigurationSetEventDestination service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESDeleteConfigurationSetEventDestinationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorNotFound`, `AWSSESErrorTooManyRequests`, `AWSSESErrorBadRequest`.
 
 @see AWSSESDeleteConfigurationSetEventDestinationRequest
 @see AWSSESDeleteConfigurationSetEventDestinationResponse
 */
- (AWSTask<AWSSESDeleteConfigurationSetEventDestinationResponse *> *)deleteConfigurationSetEventDestination:(AWSSESDeleteConfigurationSetEventDestinationRequest *)request;

/**
 <p>Delete an event destination.</p><p><i>Events</i> include message sends, deliveries, opens, clicks, bounces, and complaints. <i>Event destinations</i> are places that you can send information about these events to. For example, you can send event data to Amazon SNS to receive notifications when you receive bounces or complaints, or you can use Amazon Kinesis Data Firehose to stream data to Amazon S3 for long-term storage.</p>
 
 @param request A container for the necessary parameters to execute the DeleteConfigurationSetEventDestination service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorNotFound`, `AWSSESErrorTooManyRequests`, `AWSSESErrorBadRequest`.
 
 @see AWSSESDeleteConfigurationSetEventDestinationRequest
 @see AWSSESDeleteConfigurationSetEventDestinationResponse
 */
- (void)deleteConfigurationSetEventDestination:(AWSSESDeleteConfigurationSetEventDestinationRequest *)request completionHandler:(void (^ _Nullable)(AWSSESDeleteConfigurationSetEventDestinationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes an existing custom verification email template.</p><p>For more information about custom verification email templates, see <a href="https://docs.aws.amazon.com/es/latest/DeveloperGuide/send-email-verify-address-custom.html">Using Custom Verification Email Templates</a> in the <i>Amazon SES Developer Guide</i>.</p><p>You can execute this operation no more than once per second.</p>
 
 @param request A container for the necessary parameters to execute the DeleteCustomVerificationEmailTemplate service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESDeleteCustomVerificationEmailTemplateResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorNotFound`, `AWSSESErrorTooManyRequests`, `AWSSESErrorBadRequest`.
 
 @see AWSSESDeleteCustomVerificationEmailTemplateRequest
 @see AWSSESDeleteCustomVerificationEmailTemplateResponse
 */
- (AWSTask<AWSSESDeleteCustomVerificationEmailTemplateResponse *> *)deleteCustomVerificationEmailTemplate:(AWSSESDeleteCustomVerificationEmailTemplateRequest *)request;

/**
 <p>Deletes an existing custom verification email template.</p><p>For more information about custom verification email templates, see <a href="https://docs.aws.amazon.com/es/latest/DeveloperGuide/send-email-verify-address-custom.html">Using Custom Verification Email Templates</a> in the <i>Amazon SES Developer Guide</i>.</p><p>You can execute this operation no more than once per second.</p>
 
 @param request A container for the necessary parameters to execute the DeleteCustomVerificationEmailTemplate service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorNotFound`, `AWSSESErrorTooManyRequests`, `AWSSESErrorBadRequest`.
 
 @see AWSSESDeleteCustomVerificationEmailTemplateRequest
 @see AWSSESDeleteCustomVerificationEmailTemplateResponse
 */
- (void)deleteCustomVerificationEmailTemplate:(AWSSESDeleteCustomVerificationEmailTemplateRequest *)request completionHandler:(void (^ _Nullable)(AWSSESDeleteCustomVerificationEmailTemplateResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Delete a dedicated IP pool.</p>
 
 @param request A container for the necessary parameters to execute the DeleteDedicatedIpPool service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESDeleteDedicatedIpPoolResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorNotFound`, `AWSSESErrorTooManyRequests`, `AWSSESErrorBadRequest`, `AWSSESErrorConcurrentModification`.
 
 @see AWSSESDeleteDedicatedIpPoolRequest
 @see AWSSESDeleteDedicatedIpPoolResponse
 */
- (AWSTask<AWSSESDeleteDedicatedIpPoolResponse *> *)deleteDedicatedIpPool:(AWSSESDeleteDedicatedIpPoolRequest *)request;

/**
 <p>Delete a dedicated IP pool.</p>
 
 @param request A container for the necessary parameters to execute the DeleteDedicatedIpPool service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorNotFound`, `AWSSESErrorTooManyRequests`, `AWSSESErrorBadRequest`, `AWSSESErrorConcurrentModification`.
 
 @see AWSSESDeleteDedicatedIpPoolRequest
 @see AWSSESDeleteDedicatedIpPoolResponse
 */
- (void)deleteDedicatedIpPool:(AWSSESDeleteDedicatedIpPoolRequest *)request completionHandler:(void (^ _Nullable)(AWSSESDeleteDedicatedIpPoolResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes an email identity. An identity can be either an email address or a domain name.</p>
 
 @param request A container for the necessary parameters to execute the DeleteEmailIdentity service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESDeleteEmailIdentityResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorNotFound`, `AWSSESErrorTooManyRequests`, `AWSSESErrorBadRequest`, `AWSSESErrorConcurrentModification`.
 
 @see AWSSESDeleteEmailIdentityRequest
 @see AWSSESDeleteEmailIdentityResponse
 */
- (AWSTask<AWSSESDeleteEmailIdentityResponse *> *)deleteEmailIdentity:(AWSSESDeleteEmailIdentityRequest *)request;

/**
 <p>Deletes an email identity. An identity can be either an email address or a domain name.</p>
 
 @param request A container for the necessary parameters to execute the DeleteEmailIdentity service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorNotFound`, `AWSSESErrorTooManyRequests`, `AWSSESErrorBadRequest`, `AWSSESErrorConcurrentModification`.
 
 @see AWSSESDeleteEmailIdentityRequest
 @see AWSSESDeleteEmailIdentityResponse
 */
- (void)deleteEmailIdentity:(AWSSESDeleteEmailIdentityRequest *)request completionHandler:(void (^ _Nullable)(AWSSESDeleteEmailIdentityResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified sending authorization policy for the given identity (an email address or a domain). This API returns successfully even if a policy with the specified name does not exist.</p><note><p>This API is for the identity owner only. If you have not verified the identity, this API will return an error.</p></note><p>Sending authorization is a feature that enables an identity owner to authorize other senders to use its identities. For information about using sending authorization, see the <a href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/sending-authorization.html">Amazon SES Developer Guide</a>.</p><p>You can execute this operation no more than once per second.</p>
 
 @param request A container for the necessary parameters to execute the DeleteEmailIdentityPolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESDeleteEmailIdentityPolicyResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorNotFound`, `AWSSESErrorTooManyRequests`, `AWSSESErrorBadRequest`.
 
 @see AWSSESDeleteEmailIdentityPolicyRequest
 @see AWSSESDeleteEmailIdentityPolicyResponse
 */
- (AWSTask<AWSSESDeleteEmailIdentityPolicyResponse *> *)deleteEmailIdentityPolicy:(AWSSESDeleteEmailIdentityPolicyRequest *)request;

/**
 <p>Deletes the specified sending authorization policy for the given identity (an email address or a domain). This API returns successfully even if a policy with the specified name does not exist.</p><note><p>This API is for the identity owner only. If you have not verified the identity, this API will return an error.</p></note><p>Sending authorization is a feature that enables an identity owner to authorize other senders to use its identities. For information about using sending authorization, see the <a href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/sending-authorization.html">Amazon SES Developer Guide</a>.</p><p>You can execute this operation no more than once per second.</p>
 
 @param request A container for the necessary parameters to execute the DeleteEmailIdentityPolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorNotFound`, `AWSSESErrorTooManyRequests`, `AWSSESErrorBadRequest`.
 
 @see AWSSESDeleteEmailIdentityPolicyRequest
 @see AWSSESDeleteEmailIdentityPolicyResponse
 */
- (void)deleteEmailIdentityPolicy:(AWSSESDeleteEmailIdentityPolicyRequest *)request completionHandler:(void (^ _Nullable)(AWSSESDeleteEmailIdentityPolicyResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes an email template.</p><p>You can execute this operation no more than once per second.</p>
 
 @param request A container for the necessary parameters to execute the DeleteEmailTemplate service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESDeleteEmailTemplateResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorNotFound`, `AWSSESErrorTooManyRequests`, `AWSSESErrorBadRequest`.
 
 @see AWSSESDeleteEmailTemplateRequest
 @see AWSSESDeleteEmailTemplateResponse
 */
- (AWSTask<AWSSESDeleteEmailTemplateResponse *> *)deleteEmailTemplate:(AWSSESDeleteEmailTemplateRequest *)request;

/**
 <p>Deletes an email template.</p><p>You can execute this operation no more than once per second.</p>
 
 @param request A container for the necessary parameters to execute the DeleteEmailTemplate service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorNotFound`, `AWSSESErrorTooManyRequests`, `AWSSESErrorBadRequest`.
 
 @see AWSSESDeleteEmailTemplateRequest
 @see AWSSESDeleteEmailTemplateResponse
 */
- (void)deleteEmailTemplate:(AWSSESDeleteEmailTemplateRequest *)request completionHandler:(void (^ _Nullable)(AWSSESDeleteEmailTemplateResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Removes an email address from the suppression list for your account.</p>
 
 @param request A container for the necessary parameters to execute the DeleteSuppressedDestination service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESDeleteSuppressedDestinationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorNotFound`, `AWSSESErrorBadRequest`, `AWSSESErrorTooManyRequests`.
 
 @see AWSSESDeleteSuppressedDestinationRequest
 @see AWSSESDeleteSuppressedDestinationResponse
 */
- (AWSTask<AWSSESDeleteSuppressedDestinationResponse *> *)deleteSuppressedDestination:(AWSSESDeleteSuppressedDestinationRequest *)request;

/**
 <p>Removes an email address from the suppression list for your account.</p>
 
 @param request A container for the necessary parameters to execute the DeleteSuppressedDestination service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorNotFound`, `AWSSESErrorBadRequest`, `AWSSESErrorTooManyRequests`.
 
 @see AWSSESDeleteSuppressedDestinationRequest
 @see AWSSESDeleteSuppressedDestinationResponse
 */
- (void)deleteSuppressedDestination:(AWSSESDeleteSuppressedDestinationRequest *)request completionHandler:(void (^ _Nullable)(AWSSESDeleteSuppressedDestinationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Obtain information about the email-sending status and capabilities of your Amazon SES account in the current AWS Region.</p>
 
 @param request A container for the necessary parameters to execute the GetAccount service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESGetAccountResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorTooManyRequests`, `AWSSESErrorBadRequest`.
 
 @see AWSSESGetAccountRequest
 @see AWSSESGetAccountResponse
 */
- (AWSTask<AWSSESGetAccountResponse *> *)getAccount:(AWSSESGetAccountRequest *)request;

/**
 <p>Obtain information about the email-sending status and capabilities of your Amazon SES account in the current AWS Region.</p>
 
 @param request A container for the necessary parameters to execute the GetAccount service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorTooManyRequests`, `AWSSESErrorBadRequest`.
 
 @see AWSSESGetAccountRequest
 @see AWSSESGetAccountResponse
 */
- (void)getAccount:(AWSSESGetAccountRequest *)request completionHandler:(void (^ _Nullable)(AWSSESGetAccountResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieve a list of the blacklists that your dedicated IP addresses appear on.</p>
 
 @param request A container for the necessary parameters to execute the GetBlacklistReports service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESGetBlacklistReportsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorTooManyRequests`, `AWSSESErrorNotFound`, `AWSSESErrorBadRequest`.
 
 @see AWSSESGetBlacklistReportsRequest
 @see AWSSESGetBlacklistReportsResponse
 */
- (AWSTask<AWSSESGetBlacklistReportsResponse *> *)getBlacklistReports:(AWSSESGetBlacklistReportsRequest *)request;

/**
 <p>Retrieve a list of the blacklists that your dedicated IP addresses appear on.</p>
 
 @param request A container for the necessary parameters to execute the GetBlacklistReports service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorTooManyRequests`, `AWSSESErrorNotFound`, `AWSSESErrorBadRequest`.
 
 @see AWSSESGetBlacklistReportsRequest
 @see AWSSESGetBlacklistReportsResponse
 */
- (void)getBlacklistReports:(AWSSESGetBlacklistReportsRequest *)request completionHandler:(void (^ _Nullable)(AWSSESGetBlacklistReportsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Get information about an existing configuration set, including the dedicated IP pool that it's associated with, whether or not it's enabled for sending email, and more.</p><p><i>Configuration sets</i> are groups of rules that you can apply to the emails you send. You apply a configuration set to an email by including a reference to the configuration set in the headers of the email. When you apply a configuration set to an email, all of the rules in that configuration set are applied to the email.</p>
 
 @param request A container for the necessary parameters to execute the GetConfigurationSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESGetConfigurationSetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorNotFound`, `AWSSESErrorTooManyRequests`, `AWSSESErrorBadRequest`.
 
 @see AWSSESGetConfigurationSetRequest
 @see AWSSESGetConfigurationSetResponse
 */
- (AWSTask<AWSSESGetConfigurationSetResponse *> *)getConfigurationSet:(AWSSESGetConfigurationSetRequest *)request;

/**
 <p>Get information about an existing configuration set, including the dedicated IP pool that it's associated with, whether or not it's enabled for sending email, and more.</p><p><i>Configuration sets</i> are groups of rules that you can apply to the emails you send. You apply a configuration set to an email by including a reference to the configuration set in the headers of the email. When you apply a configuration set to an email, all of the rules in that configuration set are applied to the email.</p>
 
 @param request A container for the necessary parameters to execute the GetConfigurationSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorNotFound`, `AWSSESErrorTooManyRequests`, `AWSSESErrorBadRequest`.
 
 @see AWSSESGetConfigurationSetRequest
 @see AWSSESGetConfigurationSetResponse
 */
- (void)getConfigurationSet:(AWSSESGetConfigurationSetRequest *)request completionHandler:(void (^ _Nullable)(AWSSESGetConfigurationSetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieve a list of event destinations that are associated with a configuration set.</p><p><i>Events</i> include message sends, deliveries, opens, clicks, bounces, and complaints. <i>Event destinations</i> are places that you can send information about these events to. For example, you can send event data to Amazon SNS to receive notifications when you receive bounces or complaints, or you can use Amazon Kinesis Data Firehose to stream data to Amazon S3 for long-term storage.</p>
 
 @param request A container for the necessary parameters to execute the GetConfigurationSetEventDestinations service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESGetConfigurationSetEventDestinationsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorNotFound`, `AWSSESErrorTooManyRequests`, `AWSSESErrorBadRequest`.
 
 @see AWSSESGetConfigurationSetEventDestinationsRequest
 @see AWSSESGetConfigurationSetEventDestinationsResponse
 */
- (AWSTask<AWSSESGetConfigurationSetEventDestinationsResponse *> *)getConfigurationSetEventDestinations:(AWSSESGetConfigurationSetEventDestinationsRequest *)request;

/**
 <p>Retrieve a list of event destinations that are associated with a configuration set.</p><p><i>Events</i> include message sends, deliveries, opens, clicks, bounces, and complaints. <i>Event destinations</i> are places that you can send information about these events to. For example, you can send event data to Amazon SNS to receive notifications when you receive bounces or complaints, or you can use Amazon Kinesis Data Firehose to stream data to Amazon S3 for long-term storage.</p>
 
 @param request A container for the necessary parameters to execute the GetConfigurationSetEventDestinations service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorNotFound`, `AWSSESErrorTooManyRequests`, `AWSSESErrorBadRequest`.
 
 @see AWSSESGetConfigurationSetEventDestinationsRequest
 @see AWSSESGetConfigurationSetEventDestinationsResponse
 */
- (void)getConfigurationSetEventDestinations:(AWSSESGetConfigurationSetEventDestinationsRequest *)request completionHandler:(void (^ _Nullable)(AWSSESGetConfigurationSetEventDestinationsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the custom email verification template for the template name you specify.</p><p>For more information about custom verification email templates, see <a href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/send-email-verify-address-custom.html">Using Custom Verification Email Templates</a> in the <i>Amazon SES Developer Guide</i>.</p><p>You can execute this operation no more than once per second.</p>
 
 @param request A container for the necessary parameters to execute the GetCustomVerificationEmailTemplate service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESGetCustomVerificationEmailTemplateResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorNotFound`, `AWSSESErrorTooManyRequests`, `AWSSESErrorBadRequest`.
 
 @see AWSSESGetCustomVerificationEmailTemplateRequest
 @see AWSSESGetCustomVerificationEmailTemplateResponse
 */
- (AWSTask<AWSSESGetCustomVerificationEmailTemplateResponse *> *)getCustomVerificationEmailTemplate:(AWSSESGetCustomVerificationEmailTemplateRequest *)request;

/**
 <p>Returns the custom email verification template for the template name you specify.</p><p>For more information about custom verification email templates, see <a href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/send-email-verify-address-custom.html">Using Custom Verification Email Templates</a> in the <i>Amazon SES Developer Guide</i>.</p><p>You can execute this operation no more than once per second.</p>
 
 @param request A container for the necessary parameters to execute the GetCustomVerificationEmailTemplate service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorNotFound`, `AWSSESErrorTooManyRequests`, `AWSSESErrorBadRequest`.
 
 @see AWSSESGetCustomVerificationEmailTemplateRequest
 @see AWSSESGetCustomVerificationEmailTemplateResponse
 */
- (void)getCustomVerificationEmailTemplate:(AWSSESGetCustomVerificationEmailTemplateRequest *)request completionHandler:(void (^ _Nullable)(AWSSESGetCustomVerificationEmailTemplateResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Get information about a dedicated IP address, including the name of the dedicated IP pool that it's associated with, as well information about the automatic warm-up process for the address.</p>
 
 @param request A container for the necessary parameters to execute the GetDedicatedIp service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESGetDedicatedIpResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorTooManyRequests`, `AWSSESErrorNotFound`, `AWSSESErrorBadRequest`.
 
 @see AWSSESGetDedicatedIpRequest
 @see AWSSESGetDedicatedIpResponse
 */
- (AWSTask<AWSSESGetDedicatedIpResponse *> *)getDedicatedIp:(AWSSESGetDedicatedIpRequest *)request;

/**
 <p>Get information about a dedicated IP address, including the name of the dedicated IP pool that it's associated with, as well information about the automatic warm-up process for the address.</p>
 
 @param request A container for the necessary parameters to execute the GetDedicatedIp service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorTooManyRequests`, `AWSSESErrorNotFound`, `AWSSESErrorBadRequest`.
 
 @see AWSSESGetDedicatedIpRequest
 @see AWSSESGetDedicatedIpResponse
 */
- (void)getDedicatedIp:(AWSSESGetDedicatedIpRequest *)request completionHandler:(void (^ _Nullable)(AWSSESGetDedicatedIpResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>List the dedicated IP addresses that are associated with your AWS account.</p>
 
 @param request A container for the necessary parameters to execute the GetDedicatedIps service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESGetDedicatedIpsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorTooManyRequests`, `AWSSESErrorNotFound`, `AWSSESErrorBadRequest`.
 
 @see AWSSESGetDedicatedIpsRequest
 @see AWSSESGetDedicatedIpsResponse
 */
- (AWSTask<AWSSESGetDedicatedIpsResponse *> *)getDedicatedIps:(AWSSESGetDedicatedIpsRequest *)request;

/**
 <p>List the dedicated IP addresses that are associated with your AWS account.</p>
 
 @param request A container for the necessary parameters to execute the GetDedicatedIps service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorTooManyRequests`, `AWSSESErrorNotFound`, `AWSSESErrorBadRequest`.
 
 @see AWSSESGetDedicatedIpsRequest
 @see AWSSESGetDedicatedIpsResponse
 */
- (void)getDedicatedIps:(AWSSESGetDedicatedIpsRequest *)request completionHandler:(void (^ _Nullable)(AWSSESGetDedicatedIpsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieve information about the status of the Deliverability dashboard for your account. When the Deliverability dashboard is enabled, you gain access to reputation, deliverability, and other metrics for the domains that you use to send email. You also gain the ability to perform predictive inbox placement tests.</p><p>When you use the Deliverability dashboard, you pay a monthly subscription charge, in addition to any other fees that you accrue by using Amazon SES and other AWS services. For more information about the features and cost of a Deliverability dashboard subscription, see <a href="http://aws.amazon.com/ses/pricing/">Amazon SES Pricing</a>.</p>
 
 @param request A container for the necessary parameters to execute the GetDeliverabilityDashboardOptions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESGetDeliverabilityDashboardOptionsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorTooManyRequests`, `AWSSESErrorLimitExceeded`, `AWSSESErrorBadRequest`.
 
 @see AWSSESGetDeliverabilityDashboardOptionsRequest
 @see AWSSESGetDeliverabilityDashboardOptionsResponse
 */
- (AWSTask<AWSSESGetDeliverabilityDashboardOptionsResponse *> *)getDeliverabilityDashboardOptions:(AWSSESGetDeliverabilityDashboardOptionsRequest *)request;

/**
 <p>Retrieve information about the status of the Deliverability dashboard for your account. When the Deliverability dashboard is enabled, you gain access to reputation, deliverability, and other metrics for the domains that you use to send email. You also gain the ability to perform predictive inbox placement tests.</p><p>When you use the Deliverability dashboard, you pay a monthly subscription charge, in addition to any other fees that you accrue by using Amazon SES and other AWS services. For more information about the features and cost of a Deliverability dashboard subscription, see <a href="http://aws.amazon.com/ses/pricing/">Amazon SES Pricing</a>.</p>
 
 @param request A container for the necessary parameters to execute the GetDeliverabilityDashboardOptions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorTooManyRequests`, `AWSSESErrorLimitExceeded`, `AWSSESErrorBadRequest`.
 
 @see AWSSESGetDeliverabilityDashboardOptionsRequest
 @see AWSSESGetDeliverabilityDashboardOptionsResponse
 */
- (void)getDeliverabilityDashboardOptions:(AWSSESGetDeliverabilityDashboardOptionsRequest *)request completionHandler:(void (^ _Nullable)(AWSSESGetDeliverabilityDashboardOptionsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieve the results of a predictive inbox placement test.</p>
 
 @param request A container for the necessary parameters to execute the GetDeliverabilityTestReport service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESGetDeliverabilityTestReportResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorTooManyRequests`, `AWSSESErrorNotFound`, `AWSSESErrorBadRequest`.
 
 @see AWSSESGetDeliverabilityTestReportRequest
 @see AWSSESGetDeliverabilityTestReportResponse
 */
- (AWSTask<AWSSESGetDeliverabilityTestReportResponse *> *)getDeliverabilityTestReport:(AWSSESGetDeliverabilityTestReportRequest *)request;

/**
 <p>Retrieve the results of a predictive inbox placement test.</p>
 
 @param request A container for the necessary parameters to execute the GetDeliverabilityTestReport service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorTooManyRequests`, `AWSSESErrorNotFound`, `AWSSESErrorBadRequest`.
 
 @see AWSSESGetDeliverabilityTestReportRequest
 @see AWSSESGetDeliverabilityTestReportResponse
 */
- (void)getDeliverabilityTestReport:(AWSSESGetDeliverabilityTestReportRequest *)request completionHandler:(void (^ _Nullable)(AWSSESGetDeliverabilityTestReportResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieve all the deliverability data for a specific campaign. This data is available for a campaign only if the campaign sent email by using a domain that the Deliverability dashboard is enabled for.</p>
 
 @param request A container for the necessary parameters to execute the GetDomainDeliverabilityCampaign service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESGetDomainDeliverabilityCampaignResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorTooManyRequests`, `AWSSESErrorBadRequest`, `AWSSESErrorNotFound`.
 
 @see AWSSESGetDomainDeliverabilityCampaignRequest
 @see AWSSESGetDomainDeliverabilityCampaignResponse
 */
- (AWSTask<AWSSESGetDomainDeliverabilityCampaignResponse *> *)getDomainDeliverabilityCampaign:(AWSSESGetDomainDeliverabilityCampaignRequest *)request;

/**
 <p>Retrieve all the deliverability data for a specific campaign. This data is available for a campaign only if the campaign sent email by using a domain that the Deliverability dashboard is enabled for.</p>
 
 @param request A container for the necessary parameters to execute the GetDomainDeliverabilityCampaign service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorTooManyRequests`, `AWSSESErrorBadRequest`, `AWSSESErrorNotFound`.
 
 @see AWSSESGetDomainDeliverabilityCampaignRequest
 @see AWSSESGetDomainDeliverabilityCampaignResponse
 */
- (void)getDomainDeliverabilityCampaign:(AWSSESGetDomainDeliverabilityCampaignRequest *)request completionHandler:(void (^ _Nullable)(AWSSESGetDomainDeliverabilityCampaignResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieve inbox placement and engagement rates for the domains that you use to send email.</p>
 
 @param request A container for the necessary parameters to execute the GetDomainStatisticsReport service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESGetDomainStatisticsReportResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorTooManyRequests`, `AWSSESErrorNotFound`, `AWSSESErrorBadRequest`.
 
 @see AWSSESGetDomainStatisticsReportRequest
 @see AWSSESGetDomainStatisticsReportResponse
 */
- (AWSTask<AWSSESGetDomainStatisticsReportResponse *> *)getDomainStatisticsReport:(AWSSESGetDomainStatisticsReportRequest *)request;

/**
 <p>Retrieve inbox placement and engagement rates for the domains that you use to send email.</p>
 
 @param request A container for the necessary parameters to execute the GetDomainStatisticsReport service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorTooManyRequests`, `AWSSESErrorNotFound`, `AWSSESErrorBadRequest`.
 
 @see AWSSESGetDomainStatisticsReportRequest
 @see AWSSESGetDomainStatisticsReportResponse
 */
- (void)getDomainStatisticsReport:(AWSSESGetDomainStatisticsReportRequest *)request completionHandler:(void (^ _Nullable)(AWSSESGetDomainStatisticsReportResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Provides information about a specific identity, including the identity's verification status, sending authorization policies, its DKIM authentication status, and its custom Mail-From settings.</p>
 
 @param request A container for the necessary parameters to execute the GetEmailIdentity service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESGetEmailIdentityResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorNotFound`, `AWSSESErrorTooManyRequests`, `AWSSESErrorBadRequest`.
 
 @see AWSSESGetEmailIdentityRequest
 @see AWSSESGetEmailIdentityResponse
 */
- (AWSTask<AWSSESGetEmailIdentityResponse *> *)getEmailIdentity:(AWSSESGetEmailIdentityRequest *)request;

/**
 <p>Provides information about a specific identity, including the identity's verification status, sending authorization policies, its DKIM authentication status, and its custom Mail-From settings.</p>
 
 @param request A container for the necessary parameters to execute the GetEmailIdentity service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorNotFound`, `AWSSESErrorTooManyRequests`, `AWSSESErrorBadRequest`.
 
 @see AWSSESGetEmailIdentityRequest
 @see AWSSESGetEmailIdentityResponse
 */
- (void)getEmailIdentity:(AWSSESGetEmailIdentityRequest *)request completionHandler:(void (^ _Nullable)(AWSSESGetEmailIdentityResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the requested sending authorization policies for the given identity (an email address or a domain). The policies are returned as a map of policy names to policy contents. You can retrieve a maximum of 20 policies at a time.</p><note><p>This API is for the identity owner only. If you have not verified the identity, this API will return an error.</p></note><p>Sending authorization is a feature that enables an identity owner to authorize other senders to use its identities. For information about using sending authorization, see the <a href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/sending-authorization.html">Amazon SES Developer Guide</a>.</p><p>You can execute this operation no more than once per second.</p>
 
 @param request A container for the necessary parameters to execute the GetEmailIdentityPolicies service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESGetEmailIdentityPoliciesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorNotFound`, `AWSSESErrorTooManyRequests`, `AWSSESErrorBadRequest`.
 
 @see AWSSESGetEmailIdentityPoliciesRequest
 @see AWSSESGetEmailIdentityPoliciesResponse
 */
- (AWSTask<AWSSESGetEmailIdentityPoliciesResponse *> *)getEmailIdentityPolicies:(AWSSESGetEmailIdentityPoliciesRequest *)request;

/**
 <p>Returns the requested sending authorization policies for the given identity (an email address or a domain). The policies are returned as a map of policy names to policy contents. You can retrieve a maximum of 20 policies at a time.</p><note><p>This API is for the identity owner only. If you have not verified the identity, this API will return an error.</p></note><p>Sending authorization is a feature that enables an identity owner to authorize other senders to use its identities. For information about using sending authorization, see the <a href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/sending-authorization.html">Amazon SES Developer Guide</a>.</p><p>You can execute this operation no more than once per second.</p>
 
 @param request A container for the necessary parameters to execute the GetEmailIdentityPolicies service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorNotFound`, `AWSSESErrorTooManyRequests`, `AWSSESErrorBadRequest`.
 
 @see AWSSESGetEmailIdentityPoliciesRequest
 @see AWSSESGetEmailIdentityPoliciesResponse
 */
- (void)getEmailIdentityPolicies:(AWSSESGetEmailIdentityPoliciesRequest *)request completionHandler:(void (^ _Nullable)(AWSSESGetEmailIdentityPoliciesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Displays the template object (which includes the subject line, HTML part and text part) for the template you specify.</p><p>You can execute this operation no more than once per second.</p>
 
 @param request A container for the necessary parameters to execute the GetEmailTemplate service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESGetEmailTemplateResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorNotFound`, `AWSSESErrorTooManyRequests`, `AWSSESErrorBadRequest`.
 
 @see AWSSESGetEmailTemplateRequest
 @see AWSSESGetEmailTemplateResponse
 */
- (AWSTask<AWSSESGetEmailTemplateResponse *> *)getEmailTemplate:(AWSSESGetEmailTemplateRequest *)request;

/**
 <p>Displays the template object (which includes the subject line, HTML part and text part) for the template you specify.</p><p>You can execute this operation no more than once per second.</p>
 
 @param request A container for the necessary parameters to execute the GetEmailTemplate service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorNotFound`, `AWSSESErrorTooManyRequests`, `AWSSESErrorBadRequest`.
 
 @see AWSSESGetEmailTemplateRequest
 @see AWSSESGetEmailTemplateResponse
 */
- (void)getEmailTemplate:(AWSSESGetEmailTemplateRequest *)request completionHandler:(void (^ _Nullable)(AWSSESGetEmailTemplateResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves information about a specific email address that's on the suppression list for your account.</p>
 
 @param request A container for the necessary parameters to execute the GetSuppressedDestination service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESGetSuppressedDestinationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorBadRequest`, `AWSSESErrorTooManyRequests`, `AWSSESErrorNotFound`.
 
 @see AWSSESGetSuppressedDestinationRequest
 @see AWSSESGetSuppressedDestinationResponse
 */
- (AWSTask<AWSSESGetSuppressedDestinationResponse *> *)getSuppressedDestination:(AWSSESGetSuppressedDestinationRequest *)request;

/**
 <p>Retrieves information about a specific email address that's on the suppression list for your account.</p>
 
 @param request A container for the necessary parameters to execute the GetSuppressedDestination service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorBadRequest`, `AWSSESErrorTooManyRequests`, `AWSSESErrorNotFound`.
 
 @see AWSSESGetSuppressedDestinationRequest
 @see AWSSESGetSuppressedDestinationResponse
 */
- (void)getSuppressedDestination:(AWSSESGetSuppressedDestinationRequest *)request completionHandler:(void (^ _Nullable)(AWSSESGetSuppressedDestinationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>List all of the configuration sets associated with your account in the current region.</p><p><i>Configuration sets</i> are groups of rules that you can apply to the emails you send. You apply a configuration set to an email by including a reference to the configuration set in the headers of the email. When you apply a configuration set to an email, all of the rules in that configuration set are applied to the email.</p>
 
 @param request A container for the necessary parameters to execute the ListConfigurationSets service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESListConfigurationSetsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorTooManyRequests`, `AWSSESErrorBadRequest`.
 
 @see AWSSESListConfigurationSetsRequest
 @see AWSSESListConfigurationSetsResponse
 */
- (AWSTask<AWSSESListConfigurationSetsResponse *> *)listConfigurationSets:(AWSSESListConfigurationSetsRequest *)request;

/**
 <p>List all of the configuration sets associated with your account in the current region.</p><p><i>Configuration sets</i> are groups of rules that you can apply to the emails you send. You apply a configuration set to an email by including a reference to the configuration set in the headers of the email. When you apply a configuration set to an email, all of the rules in that configuration set are applied to the email.</p>
 
 @param request A container for the necessary parameters to execute the ListConfigurationSets service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorTooManyRequests`, `AWSSESErrorBadRequest`.
 
 @see AWSSESListConfigurationSetsRequest
 @see AWSSESListConfigurationSetsResponse
 */
- (void)listConfigurationSets:(AWSSESListConfigurationSetsRequest *)request completionHandler:(void (^ _Nullable)(AWSSESListConfigurationSetsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the existing custom verification email templates for your account in the current AWS Region.</p><p>For more information about custom verification email templates, see <a href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/send-email-verify-address-custom.html">Using Custom Verification Email Templates</a> in the <i>Amazon SES Developer Guide</i>.</p><p>You can execute this operation no more than once per second.</p>
 
 @param request A container for the necessary parameters to execute the ListCustomVerificationEmailTemplates service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESListCustomVerificationEmailTemplatesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorTooManyRequests`, `AWSSESErrorBadRequest`.
 
 @see AWSSESListCustomVerificationEmailTemplatesRequest
 @see AWSSESListCustomVerificationEmailTemplatesResponse
 */
- (AWSTask<AWSSESListCustomVerificationEmailTemplatesResponse *> *)listCustomVerificationEmailTemplates:(AWSSESListCustomVerificationEmailTemplatesRequest *)request;

/**
 <p>Lists the existing custom verification email templates for your account in the current AWS Region.</p><p>For more information about custom verification email templates, see <a href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/send-email-verify-address-custom.html">Using Custom Verification Email Templates</a> in the <i>Amazon SES Developer Guide</i>.</p><p>You can execute this operation no more than once per second.</p>
 
 @param request A container for the necessary parameters to execute the ListCustomVerificationEmailTemplates service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorTooManyRequests`, `AWSSESErrorBadRequest`.
 
 @see AWSSESListCustomVerificationEmailTemplatesRequest
 @see AWSSESListCustomVerificationEmailTemplatesResponse
 */
- (void)listCustomVerificationEmailTemplates:(AWSSESListCustomVerificationEmailTemplatesRequest *)request completionHandler:(void (^ _Nullable)(AWSSESListCustomVerificationEmailTemplatesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>List all of the dedicated IP pools that exist in your AWS account in the current Region.</p>
 
 @param request A container for the necessary parameters to execute the ListDedicatedIpPools service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESListDedicatedIpPoolsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorTooManyRequests`, `AWSSESErrorBadRequest`.
 
 @see AWSSESListDedicatedIpPoolsRequest
 @see AWSSESListDedicatedIpPoolsResponse
 */
- (AWSTask<AWSSESListDedicatedIpPoolsResponse *> *)listDedicatedIpPools:(AWSSESListDedicatedIpPoolsRequest *)request;

/**
 <p>List all of the dedicated IP pools that exist in your AWS account in the current Region.</p>
 
 @param request A container for the necessary parameters to execute the ListDedicatedIpPools service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorTooManyRequests`, `AWSSESErrorBadRequest`.
 
 @see AWSSESListDedicatedIpPoolsRequest
 @see AWSSESListDedicatedIpPoolsResponse
 */
- (void)listDedicatedIpPools:(AWSSESListDedicatedIpPoolsRequest *)request completionHandler:(void (^ _Nullable)(AWSSESListDedicatedIpPoolsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Show a list of the predictive inbox placement tests that you've performed, regardless of their statuses. For predictive inbox placement tests that are complete, you can use the <code>GetDeliverabilityTestReport</code> operation to view the results.</p>
 
 @param request A container for the necessary parameters to execute the ListDeliverabilityTestReports service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESListDeliverabilityTestReportsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorTooManyRequests`, `AWSSESErrorNotFound`, `AWSSESErrorBadRequest`.
 
 @see AWSSESListDeliverabilityTestReportsRequest
 @see AWSSESListDeliverabilityTestReportsResponse
 */
- (AWSTask<AWSSESListDeliverabilityTestReportsResponse *> *)listDeliverabilityTestReports:(AWSSESListDeliverabilityTestReportsRequest *)request;

/**
 <p>Show a list of the predictive inbox placement tests that you've performed, regardless of their statuses. For predictive inbox placement tests that are complete, you can use the <code>GetDeliverabilityTestReport</code> operation to view the results.</p>
 
 @param request A container for the necessary parameters to execute the ListDeliverabilityTestReports service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorTooManyRequests`, `AWSSESErrorNotFound`, `AWSSESErrorBadRequest`.
 
 @see AWSSESListDeliverabilityTestReportsRequest
 @see AWSSESListDeliverabilityTestReportsResponse
 */
- (void)listDeliverabilityTestReports:(AWSSESListDeliverabilityTestReportsRequest *)request completionHandler:(void (^ _Nullable)(AWSSESListDeliverabilityTestReportsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieve deliverability data for all the campaigns that used a specific domain to send email during a specified time range. This data is available for a domain only if you enabled the Deliverability dashboard for the domain.</p>
 
 @param request A container for the necessary parameters to execute the ListDomainDeliverabilityCampaigns service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESListDomainDeliverabilityCampaignsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorTooManyRequests`, `AWSSESErrorBadRequest`, `AWSSESErrorNotFound`.
 
 @see AWSSESListDomainDeliverabilityCampaignsRequest
 @see AWSSESListDomainDeliverabilityCampaignsResponse
 */
- (AWSTask<AWSSESListDomainDeliverabilityCampaignsResponse *> *)listDomainDeliverabilityCampaigns:(AWSSESListDomainDeliverabilityCampaignsRequest *)request;

/**
 <p>Retrieve deliverability data for all the campaigns that used a specific domain to send email during a specified time range. This data is available for a domain only if you enabled the Deliverability dashboard for the domain.</p>
 
 @param request A container for the necessary parameters to execute the ListDomainDeliverabilityCampaigns service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorTooManyRequests`, `AWSSESErrorBadRequest`, `AWSSESErrorNotFound`.
 
 @see AWSSESListDomainDeliverabilityCampaignsRequest
 @see AWSSESListDomainDeliverabilityCampaignsResponse
 */
- (void)listDomainDeliverabilityCampaigns:(AWSSESListDomainDeliverabilityCampaignsRequest *)request completionHandler:(void (^ _Nullable)(AWSSESListDomainDeliverabilityCampaignsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of all of the email identities that are associated with your AWS account. An identity can be either an email address or a domain. This operation returns identities that are verified as well as those that aren't. This operation returns identities that are associated with Amazon SES and Amazon Pinpoint.</p>
 
 @param request A container for the necessary parameters to execute the ListEmailIdentities service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESListEmailIdentitiesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorTooManyRequests`, `AWSSESErrorBadRequest`.
 
 @see AWSSESListEmailIdentitiesRequest
 @see AWSSESListEmailIdentitiesResponse
 */
- (AWSTask<AWSSESListEmailIdentitiesResponse *> *)listEmailIdentities:(AWSSESListEmailIdentitiesRequest *)request;

/**
 <p>Returns a list of all of the email identities that are associated with your AWS account. An identity can be either an email address or a domain. This operation returns identities that are verified as well as those that aren't. This operation returns identities that are associated with Amazon SES and Amazon Pinpoint.</p>
 
 @param request A container for the necessary parameters to execute the ListEmailIdentities service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorTooManyRequests`, `AWSSESErrorBadRequest`.
 
 @see AWSSESListEmailIdentitiesRequest
 @see AWSSESListEmailIdentitiesResponse
 */
- (void)listEmailIdentities:(AWSSESListEmailIdentitiesRequest *)request completionHandler:(void (^ _Nullable)(AWSSESListEmailIdentitiesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the email templates present in your Amazon SES account in the current AWS Region.</p><p>You can execute this operation no more than once per second.</p>
 
 @param request A container for the necessary parameters to execute the ListEmailTemplates service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESListEmailTemplatesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorTooManyRequests`, `AWSSESErrorBadRequest`.
 
 @see AWSSESListEmailTemplatesRequest
 @see AWSSESListEmailTemplatesResponse
 */
- (AWSTask<AWSSESListEmailTemplatesResponse *> *)listEmailTemplates:(AWSSESListEmailTemplatesRequest *)request;

/**
 <p>Lists the email templates present in your Amazon SES account in the current AWS Region.</p><p>You can execute this operation no more than once per second.</p>
 
 @param request A container for the necessary parameters to execute the ListEmailTemplates service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorTooManyRequests`, `AWSSESErrorBadRequest`.
 
 @see AWSSESListEmailTemplatesRequest
 @see AWSSESListEmailTemplatesResponse
 */
- (void)listEmailTemplates:(AWSSESListEmailTemplatesRequest *)request completionHandler:(void (^ _Nullable)(AWSSESListEmailTemplatesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves a list of email addresses that are on the suppression list for your account.</p>
 
 @param request A container for the necessary parameters to execute the ListSuppressedDestinations service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESListSuppressedDestinationsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorBadRequest`, `AWSSESErrorTooManyRequests`, `AWSSESErrorInvalidNextToken`.
 
 @see AWSSESListSuppressedDestinationsRequest
 @see AWSSESListSuppressedDestinationsResponse
 */
- (AWSTask<AWSSESListSuppressedDestinationsResponse *> *)listSuppressedDestinations:(AWSSESListSuppressedDestinationsRequest *)request;

/**
 <p>Retrieves a list of email addresses that are on the suppression list for your account.</p>
 
 @param request A container for the necessary parameters to execute the ListSuppressedDestinations service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorBadRequest`, `AWSSESErrorTooManyRequests`, `AWSSESErrorInvalidNextToken`.
 
 @see AWSSESListSuppressedDestinationsRequest
 @see AWSSESListSuppressedDestinationsResponse
 */
- (void)listSuppressedDestinations:(AWSSESListSuppressedDestinationsRequest *)request completionHandler:(void (^ _Nullable)(AWSSESListSuppressedDestinationsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieve a list of the tags (keys and values) that are associated with a specified resource. A <i>tag</i> is a label that you optionally define and associate with a resource. Each tag consists of a required <i>tag key</i> and an optional associated <i>tag value</i>. A tag key is a general label that acts as a category for more specific tag values. A tag value acts as a descriptor within a tag key.</p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESListTagsForResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorBadRequest`, `AWSSESErrorNotFound`, `AWSSESErrorTooManyRequests`.
 
 @see AWSSESListTagsForResourceRequest
 @see AWSSESListTagsForResourceResponse
 */
- (AWSTask<AWSSESListTagsForResourceResponse *> *)listTagsForResource:(AWSSESListTagsForResourceRequest *)request;

/**
 <p>Retrieve a list of the tags (keys and values) that are associated with a specified resource. A <i>tag</i> is a label that you optionally define and associate with a resource. Each tag consists of a required <i>tag key</i> and an optional associated <i>tag value</i>. A tag key is a general label that acts as a category for more specific tag values. A tag value acts as a descriptor within a tag key.</p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorBadRequest`, `AWSSESErrorNotFound`, `AWSSESErrorTooManyRequests`.
 
 @see AWSSESListTagsForResourceRequest
 @see AWSSESListTagsForResourceResponse
 */
- (void)listTagsForResource:(AWSSESListTagsForResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSSESListTagsForResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Enable or disable the automatic warm-up feature for dedicated IP addresses.</p>
 
 @param request A container for the necessary parameters to execute the PutAccountDedicatedIpWarmupAttributes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESPutAccountDedicatedIpWarmupAttributesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorTooManyRequests`, `AWSSESErrorBadRequest`.
 
 @see AWSSESPutAccountDedicatedIpWarmupAttributesRequest
 @see AWSSESPutAccountDedicatedIpWarmupAttributesResponse
 */
- (AWSTask<AWSSESPutAccountDedicatedIpWarmupAttributesResponse *> *)putAccountDedicatedIpWarmupAttributes:(AWSSESPutAccountDedicatedIpWarmupAttributesRequest *)request;

/**
 <p>Enable or disable the automatic warm-up feature for dedicated IP addresses.</p>
 
 @param request A container for the necessary parameters to execute the PutAccountDedicatedIpWarmupAttributes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorTooManyRequests`, `AWSSESErrorBadRequest`.
 
 @see AWSSESPutAccountDedicatedIpWarmupAttributesRequest
 @see AWSSESPutAccountDedicatedIpWarmupAttributesResponse
 */
- (void)putAccountDedicatedIpWarmupAttributes:(AWSSESPutAccountDedicatedIpWarmupAttributesRequest *)request completionHandler:(void (^ _Nullable)(AWSSESPutAccountDedicatedIpWarmupAttributesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Update your Amazon SES account details.</p>
 
 @param request A container for the necessary parameters to execute the PutAccountDetails service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESPutAccountDetailsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorTooManyRequests`, `AWSSESErrorBadRequest`, `AWSSESErrorConflict`.
 
 @see AWSSESPutAccountDetailsRequest
 @see AWSSESPutAccountDetailsResponse
 */
- (AWSTask<AWSSESPutAccountDetailsResponse *> *)putAccountDetails:(AWSSESPutAccountDetailsRequest *)request;

/**
 <p>Update your Amazon SES account details.</p>
 
 @param request A container for the necessary parameters to execute the PutAccountDetails service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorTooManyRequests`, `AWSSESErrorBadRequest`, `AWSSESErrorConflict`.
 
 @see AWSSESPutAccountDetailsRequest
 @see AWSSESPutAccountDetailsResponse
 */
- (void)putAccountDetails:(AWSSESPutAccountDetailsRequest *)request completionHandler:(void (^ _Nullable)(AWSSESPutAccountDetailsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Enable or disable the ability of your account to send email.</p>
 
 @param request A container for the necessary parameters to execute the PutAccountSendingAttributes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESPutAccountSendingAttributesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorTooManyRequests`, `AWSSESErrorBadRequest`.
 
 @see AWSSESPutAccountSendingAttributesRequest
 @see AWSSESPutAccountSendingAttributesResponse
 */
- (AWSTask<AWSSESPutAccountSendingAttributesResponse *> *)putAccountSendingAttributes:(AWSSESPutAccountSendingAttributesRequest *)request;

/**
 <p>Enable or disable the ability of your account to send email.</p>
 
 @param request A container for the necessary parameters to execute the PutAccountSendingAttributes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorTooManyRequests`, `AWSSESErrorBadRequest`.
 
 @see AWSSESPutAccountSendingAttributesRequest
 @see AWSSESPutAccountSendingAttributesResponse
 */
- (void)putAccountSendingAttributes:(AWSSESPutAccountSendingAttributesRequest *)request completionHandler:(void (^ _Nullable)(AWSSESPutAccountSendingAttributesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Change the settings for the account-level suppression list.</p>
 
 @param request A container for the necessary parameters to execute the PutAccountSuppressionAttributes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESPutAccountSuppressionAttributesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorTooManyRequests`, `AWSSESErrorBadRequest`.
 
 @see AWSSESPutAccountSuppressionAttributesRequest
 @see AWSSESPutAccountSuppressionAttributesResponse
 */
- (AWSTask<AWSSESPutAccountSuppressionAttributesResponse *> *)putAccountSuppressionAttributes:(AWSSESPutAccountSuppressionAttributesRequest *)request;

/**
 <p>Change the settings for the account-level suppression list.</p>
 
 @param request A container for the necessary parameters to execute the PutAccountSuppressionAttributes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorTooManyRequests`, `AWSSESErrorBadRequest`.
 
 @see AWSSESPutAccountSuppressionAttributesRequest
 @see AWSSESPutAccountSuppressionAttributesResponse
 */
- (void)putAccountSuppressionAttributes:(AWSSESPutAccountSuppressionAttributesRequest *)request completionHandler:(void (^ _Nullable)(AWSSESPutAccountSuppressionAttributesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Associate a configuration set with a dedicated IP pool. You can use dedicated IP pools to create groups of dedicated IP addresses for sending specific types of email.</p>
 
 @param request A container for the necessary parameters to execute the PutConfigurationSetDeliveryOptions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESPutConfigurationSetDeliveryOptionsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorNotFound`, `AWSSESErrorTooManyRequests`, `AWSSESErrorBadRequest`.
 
 @see AWSSESPutConfigurationSetDeliveryOptionsRequest
 @see AWSSESPutConfigurationSetDeliveryOptionsResponse
 */
- (AWSTask<AWSSESPutConfigurationSetDeliveryOptionsResponse *> *)putConfigurationSetDeliveryOptions:(AWSSESPutConfigurationSetDeliveryOptionsRequest *)request;

/**
 <p>Associate a configuration set with a dedicated IP pool. You can use dedicated IP pools to create groups of dedicated IP addresses for sending specific types of email.</p>
 
 @param request A container for the necessary parameters to execute the PutConfigurationSetDeliveryOptions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorNotFound`, `AWSSESErrorTooManyRequests`, `AWSSESErrorBadRequest`.
 
 @see AWSSESPutConfigurationSetDeliveryOptionsRequest
 @see AWSSESPutConfigurationSetDeliveryOptionsResponse
 */
- (void)putConfigurationSetDeliveryOptions:(AWSSESPutConfigurationSetDeliveryOptionsRequest *)request completionHandler:(void (^ _Nullable)(AWSSESPutConfigurationSetDeliveryOptionsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Enable or disable collection of reputation metrics for emails that you send using a particular configuration set in a specific AWS Region.</p>
 
 @param request A container for the necessary parameters to execute the PutConfigurationSetReputationOptions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESPutConfigurationSetReputationOptionsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorNotFound`, `AWSSESErrorTooManyRequests`, `AWSSESErrorBadRequest`.
 
 @see AWSSESPutConfigurationSetReputationOptionsRequest
 @see AWSSESPutConfigurationSetReputationOptionsResponse
 */
- (AWSTask<AWSSESPutConfigurationSetReputationOptionsResponse *> *)putConfigurationSetReputationOptions:(AWSSESPutConfigurationSetReputationOptionsRequest *)request;

/**
 <p>Enable or disable collection of reputation metrics for emails that you send using a particular configuration set in a specific AWS Region.</p>
 
 @param request A container for the necessary parameters to execute the PutConfigurationSetReputationOptions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorNotFound`, `AWSSESErrorTooManyRequests`, `AWSSESErrorBadRequest`.
 
 @see AWSSESPutConfigurationSetReputationOptionsRequest
 @see AWSSESPutConfigurationSetReputationOptionsResponse
 */
- (void)putConfigurationSetReputationOptions:(AWSSESPutConfigurationSetReputationOptionsRequest *)request completionHandler:(void (^ _Nullable)(AWSSESPutConfigurationSetReputationOptionsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Enable or disable email sending for messages that use a particular configuration set in a specific AWS Region.</p>
 
 @param request A container for the necessary parameters to execute the PutConfigurationSetSendingOptions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESPutConfigurationSetSendingOptionsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorNotFound`, `AWSSESErrorTooManyRequests`, `AWSSESErrorBadRequest`.
 
 @see AWSSESPutConfigurationSetSendingOptionsRequest
 @see AWSSESPutConfigurationSetSendingOptionsResponse
 */
- (AWSTask<AWSSESPutConfigurationSetSendingOptionsResponse *> *)putConfigurationSetSendingOptions:(AWSSESPutConfigurationSetSendingOptionsRequest *)request;

/**
 <p>Enable or disable email sending for messages that use a particular configuration set in a specific AWS Region.</p>
 
 @param request A container for the necessary parameters to execute the PutConfigurationSetSendingOptions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorNotFound`, `AWSSESErrorTooManyRequests`, `AWSSESErrorBadRequest`.
 
 @see AWSSESPutConfigurationSetSendingOptionsRequest
 @see AWSSESPutConfigurationSetSendingOptionsResponse
 */
- (void)putConfigurationSetSendingOptions:(AWSSESPutConfigurationSetSendingOptionsRequest *)request completionHandler:(void (^ _Nullable)(AWSSESPutConfigurationSetSendingOptionsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Specify the account suppression list preferences for a configuration set.</p>
 
 @param request A container for the necessary parameters to execute the PutConfigurationSetSuppressionOptions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESPutConfigurationSetSuppressionOptionsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorNotFound`, `AWSSESErrorTooManyRequests`, `AWSSESErrorBadRequest`.
 
 @see AWSSESPutConfigurationSetSuppressionOptionsRequest
 @see AWSSESPutConfigurationSetSuppressionOptionsResponse
 */
- (AWSTask<AWSSESPutConfigurationSetSuppressionOptionsResponse *> *)putConfigurationSetSuppressionOptions:(AWSSESPutConfigurationSetSuppressionOptionsRequest *)request;

/**
 <p>Specify the account suppression list preferences for a configuration set.</p>
 
 @param request A container for the necessary parameters to execute the PutConfigurationSetSuppressionOptions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorNotFound`, `AWSSESErrorTooManyRequests`, `AWSSESErrorBadRequest`.
 
 @see AWSSESPutConfigurationSetSuppressionOptionsRequest
 @see AWSSESPutConfigurationSetSuppressionOptionsResponse
 */
- (void)putConfigurationSetSuppressionOptions:(AWSSESPutConfigurationSetSuppressionOptionsRequest *)request completionHandler:(void (^ _Nullable)(AWSSESPutConfigurationSetSuppressionOptionsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Specify a custom domain to use for open and click tracking elements in email that you send.</p>
 
 @param request A container for the necessary parameters to execute the PutConfigurationSetTrackingOptions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESPutConfigurationSetTrackingOptionsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorNotFound`, `AWSSESErrorTooManyRequests`, `AWSSESErrorBadRequest`.
 
 @see AWSSESPutConfigurationSetTrackingOptionsRequest
 @see AWSSESPutConfigurationSetTrackingOptionsResponse
 */
- (AWSTask<AWSSESPutConfigurationSetTrackingOptionsResponse *> *)putConfigurationSetTrackingOptions:(AWSSESPutConfigurationSetTrackingOptionsRequest *)request;

/**
 <p>Specify a custom domain to use for open and click tracking elements in email that you send.</p>
 
 @param request A container for the necessary parameters to execute the PutConfigurationSetTrackingOptions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorNotFound`, `AWSSESErrorTooManyRequests`, `AWSSESErrorBadRequest`.
 
 @see AWSSESPutConfigurationSetTrackingOptionsRequest
 @see AWSSESPutConfigurationSetTrackingOptionsResponse
 */
- (void)putConfigurationSetTrackingOptions:(AWSSESPutConfigurationSetTrackingOptionsRequest *)request completionHandler:(void (^ _Nullable)(AWSSESPutConfigurationSetTrackingOptionsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Move a dedicated IP address to an existing dedicated IP pool.</p><note><p>The dedicated IP address that you specify must already exist, and must be associated with your AWS account. </p><p>The dedicated IP pool you specify must already exist. You can create a new pool by using the <code>CreateDedicatedIpPool</code> operation.</p></note>
 
 @param request A container for the necessary parameters to execute the PutDedicatedIpInPool service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESPutDedicatedIpInPoolResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorNotFound`, `AWSSESErrorTooManyRequests`, `AWSSESErrorBadRequest`.
 
 @see AWSSESPutDedicatedIpInPoolRequest
 @see AWSSESPutDedicatedIpInPoolResponse
 */
- (AWSTask<AWSSESPutDedicatedIpInPoolResponse *> *)putDedicatedIpInPool:(AWSSESPutDedicatedIpInPoolRequest *)request;

/**
 <p>Move a dedicated IP address to an existing dedicated IP pool.</p><note><p>The dedicated IP address that you specify must already exist, and must be associated with your AWS account. </p><p>The dedicated IP pool you specify must already exist. You can create a new pool by using the <code>CreateDedicatedIpPool</code> operation.</p></note>
 
 @param request A container for the necessary parameters to execute the PutDedicatedIpInPool service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorNotFound`, `AWSSESErrorTooManyRequests`, `AWSSESErrorBadRequest`.
 
 @see AWSSESPutDedicatedIpInPoolRequest
 @see AWSSESPutDedicatedIpInPoolResponse
 */
- (void)putDedicatedIpInPool:(AWSSESPutDedicatedIpInPoolRequest *)request completionHandler:(void (^ _Nullable)(AWSSESPutDedicatedIpInPoolResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p/>
 
 @param request A container for the necessary parameters to execute the PutDedicatedIpWarmupAttributes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESPutDedicatedIpWarmupAttributesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorNotFound`, `AWSSESErrorTooManyRequests`, `AWSSESErrorBadRequest`.
 
 @see AWSSESPutDedicatedIpWarmupAttributesRequest
 @see AWSSESPutDedicatedIpWarmupAttributesResponse
 */
- (AWSTask<AWSSESPutDedicatedIpWarmupAttributesResponse *> *)putDedicatedIpWarmupAttributes:(AWSSESPutDedicatedIpWarmupAttributesRequest *)request;

/**
 <p/>
 
 @param request A container for the necessary parameters to execute the PutDedicatedIpWarmupAttributes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorNotFound`, `AWSSESErrorTooManyRequests`, `AWSSESErrorBadRequest`.
 
 @see AWSSESPutDedicatedIpWarmupAttributesRequest
 @see AWSSESPutDedicatedIpWarmupAttributesResponse
 */
- (void)putDedicatedIpWarmupAttributes:(AWSSESPutDedicatedIpWarmupAttributesRequest *)request completionHandler:(void (^ _Nullable)(AWSSESPutDedicatedIpWarmupAttributesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Enable or disable the Deliverability dashboard. When you enable the Deliverability dashboard, you gain access to reputation, deliverability, and other metrics for the domains that you use to send email. You also gain the ability to perform predictive inbox placement tests.</p><p>When you use the Deliverability dashboard, you pay a monthly subscription charge, in addition to any other fees that you accrue by using Amazon SES and other AWS services. For more information about the features and cost of a Deliverability dashboard subscription, see <a href="http://aws.amazon.com/ses/pricing/">Amazon SES Pricing</a>.</p>
 
 @param request A container for the necessary parameters to execute the PutDeliverabilityDashboardOption service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESPutDeliverabilityDashboardOptionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorAlreadyExists`, `AWSSESErrorNotFound`, `AWSSESErrorTooManyRequests`, `AWSSESErrorLimitExceeded`, `AWSSESErrorBadRequest`.
 
 @see AWSSESPutDeliverabilityDashboardOptionRequest
 @see AWSSESPutDeliverabilityDashboardOptionResponse
 */
- (AWSTask<AWSSESPutDeliverabilityDashboardOptionResponse *> *)putDeliverabilityDashboardOption:(AWSSESPutDeliverabilityDashboardOptionRequest *)request;

/**
 <p>Enable or disable the Deliverability dashboard. When you enable the Deliverability dashboard, you gain access to reputation, deliverability, and other metrics for the domains that you use to send email. You also gain the ability to perform predictive inbox placement tests.</p><p>When you use the Deliverability dashboard, you pay a monthly subscription charge, in addition to any other fees that you accrue by using Amazon SES and other AWS services. For more information about the features and cost of a Deliverability dashboard subscription, see <a href="http://aws.amazon.com/ses/pricing/">Amazon SES Pricing</a>.</p>
 
 @param request A container for the necessary parameters to execute the PutDeliverabilityDashboardOption service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorAlreadyExists`, `AWSSESErrorNotFound`, `AWSSESErrorTooManyRequests`, `AWSSESErrorLimitExceeded`, `AWSSESErrorBadRequest`.
 
 @see AWSSESPutDeliverabilityDashboardOptionRequest
 @see AWSSESPutDeliverabilityDashboardOptionResponse
 */
- (void)putDeliverabilityDashboardOption:(AWSSESPutDeliverabilityDashboardOptionRequest *)request completionHandler:(void (^ _Nullable)(AWSSESPutDeliverabilityDashboardOptionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Used to enable or disable DKIM authentication for an email identity.</p>
 
 @param request A container for the necessary parameters to execute the PutEmailIdentityDkimAttributes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESPutEmailIdentityDkimAttributesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorNotFound`, `AWSSESErrorTooManyRequests`, `AWSSESErrorBadRequest`.
 
 @see AWSSESPutEmailIdentityDkimAttributesRequest
 @see AWSSESPutEmailIdentityDkimAttributesResponse
 */
- (AWSTask<AWSSESPutEmailIdentityDkimAttributesResponse *> *)putEmailIdentityDkimAttributes:(AWSSESPutEmailIdentityDkimAttributesRequest *)request;

/**
 <p>Used to enable or disable DKIM authentication for an email identity.</p>
 
 @param request A container for the necessary parameters to execute the PutEmailIdentityDkimAttributes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorNotFound`, `AWSSESErrorTooManyRequests`, `AWSSESErrorBadRequest`.
 
 @see AWSSESPutEmailIdentityDkimAttributesRequest
 @see AWSSESPutEmailIdentityDkimAttributesResponse
 */
- (void)putEmailIdentityDkimAttributes:(AWSSESPutEmailIdentityDkimAttributesRequest *)request completionHandler:(void (^ _Nullable)(AWSSESPutEmailIdentityDkimAttributesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Used to configure or change the DKIM authentication settings for an email domain identity. You can use this operation to do any of the following:</p><ul><li><p>Update the signing attributes for an identity that uses Bring Your Own DKIM (BYODKIM).</p></li><li><p>Change from using no DKIM authentication to using Easy DKIM.</p></li><li><p>Change from using no DKIM authentication to using BYODKIM.</p></li><li><p>Change from using Easy DKIM to using BYODKIM.</p></li><li><p>Change from using BYODKIM to using Easy DKIM.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the PutEmailIdentityDkimSigningAttributes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESPutEmailIdentityDkimSigningAttributesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorNotFound`, `AWSSESErrorTooManyRequests`, `AWSSESErrorBadRequest`.
 
 @see AWSSESPutEmailIdentityDkimSigningAttributesRequest
 @see AWSSESPutEmailIdentityDkimSigningAttributesResponse
 */
- (AWSTask<AWSSESPutEmailIdentityDkimSigningAttributesResponse *> *)putEmailIdentityDkimSigningAttributes:(AWSSESPutEmailIdentityDkimSigningAttributesRequest *)request;

/**
 <p>Used to configure or change the DKIM authentication settings for an email domain identity. You can use this operation to do any of the following:</p><ul><li><p>Update the signing attributes for an identity that uses Bring Your Own DKIM (BYODKIM).</p></li><li><p>Change from using no DKIM authentication to using Easy DKIM.</p></li><li><p>Change from using no DKIM authentication to using BYODKIM.</p></li><li><p>Change from using Easy DKIM to using BYODKIM.</p></li><li><p>Change from using BYODKIM to using Easy DKIM.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the PutEmailIdentityDkimSigningAttributes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorNotFound`, `AWSSESErrorTooManyRequests`, `AWSSESErrorBadRequest`.
 
 @see AWSSESPutEmailIdentityDkimSigningAttributesRequest
 @see AWSSESPutEmailIdentityDkimSigningAttributesResponse
 */
- (void)putEmailIdentityDkimSigningAttributes:(AWSSESPutEmailIdentityDkimSigningAttributesRequest *)request completionHandler:(void (^ _Nullable)(AWSSESPutEmailIdentityDkimSigningAttributesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Used to enable or disable feedback forwarding for an identity. This setting determines what happens when an identity is used to send an email that results in a bounce or complaint event.</p><p>If the value is <code>true</code>, you receive email notifications when bounce or complaint events occur. These notifications are sent to the address that you specified in the <code>Return-Path</code> header of the original email.</p><p>You're required to have a method of tracking bounces and complaints. If you haven't set up another mechanism for receiving bounce or complaint notifications (for example, by setting up an event destination), you receive an email notification when these events occur (even if this setting is disabled).</p>
 
 @param request A container for the necessary parameters to execute the PutEmailIdentityFeedbackAttributes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESPutEmailIdentityFeedbackAttributesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorNotFound`, `AWSSESErrorTooManyRequests`, `AWSSESErrorBadRequest`.
 
 @see AWSSESPutEmailIdentityFeedbackAttributesRequest
 @see AWSSESPutEmailIdentityFeedbackAttributesResponse
 */
- (AWSTask<AWSSESPutEmailIdentityFeedbackAttributesResponse *> *)putEmailIdentityFeedbackAttributes:(AWSSESPutEmailIdentityFeedbackAttributesRequest *)request;

/**
 <p>Used to enable or disable feedback forwarding for an identity. This setting determines what happens when an identity is used to send an email that results in a bounce or complaint event.</p><p>If the value is <code>true</code>, you receive email notifications when bounce or complaint events occur. These notifications are sent to the address that you specified in the <code>Return-Path</code> header of the original email.</p><p>You're required to have a method of tracking bounces and complaints. If you haven't set up another mechanism for receiving bounce or complaint notifications (for example, by setting up an event destination), you receive an email notification when these events occur (even if this setting is disabled).</p>
 
 @param request A container for the necessary parameters to execute the PutEmailIdentityFeedbackAttributes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorNotFound`, `AWSSESErrorTooManyRequests`, `AWSSESErrorBadRequest`.
 
 @see AWSSESPutEmailIdentityFeedbackAttributesRequest
 @see AWSSESPutEmailIdentityFeedbackAttributesResponse
 */
- (void)putEmailIdentityFeedbackAttributes:(AWSSESPutEmailIdentityFeedbackAttributesRequest *)request completionHandler:(void (^ _Nullable)(AWSSESPutEmailIdentityFeedbackAttributesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Used to enable or disable the custom Mail-From domain configuration for an email identity.</p>
 
 @param request A container for the necessary parameters to execute the PutEmailIdentityMailFromAttributes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESPutEmailIdentityMailFromAttributesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorNotFound`, `AWSSESErrorTooManyRequests`, `AWSSESErrorBadRequest`.
 
 @see AWSSESPutEmailIdentityMailFromAttributesRequest
 @see AWSSESPutEmailIdentityMailFromAttributesResponse
 */
- (AWSTask<AWSSESPutEmailIdentityMailFromAttributesResponse *> *)putEmailIdentityMailFromAttributes:(AWSSESPutEmailIdentityMailFromAttributesRequest *)request;

/**
 <p>Used to enable or disable the custom Mail-From domain configuration for an email identity.</p>
 
 @param request A container for the necessary parameters to execute the PutEmailIdentityMailFromAttributes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorNotFound`, `AWSSESErrorTooManyRequests`, `AWSSESErrorBadRequest`.
 
 @see AWSSESPutEmailIdentityMailFromAttributesRequest
 @see AWSSESPutEmailIdentityMailFromAttributesResponse
 */
- (void)putEmailIdentityMailFromAttributes:(AWSSESPutEmailIdentityMailFromAttributesRequest *)request completionHandler:(void (^ _Nullable)(AWSSESPutEmailIdentityMailFromAttributesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Adds an email address to the suppression list for your account.</p>
 
 @param request A container for the necessary parameters to execute the PutSuppressedDestination service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESPutSuppressedDestinationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorBadRequest`, `AWSSESErrorTooManyRequests`.
 
 @see AWSSESPutSuppressedDestinationRequest
 @see AWSSESPutSuppressedDestinationResponse
 */
- (AWSTask<AWSSESPutSuppressedDestinationResponse *> *)putSuppressedDestination:(AWSSESPutSuppressedDestinationRequest *)request;

/**
 <p>Adds an email address to the suppression list for your account.</p>
 
 @param request A container for the necessary parameters to execute the PutSuppressedDestination service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorBadRequest`, `AWSSESErrorTooManyRequests`.
 
 @see AWSSESPutSuppressedDestinationRequest
 @see AWSSESPutSuppressedDestinationResponse
 */
- (void)putSuppressedDestination:(AWSSESPutSuppressedDestinationRequest *)request completionHandler:(void (^ _Nullable)(AWSSESPutSuppressedDestinationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Composes an email message to multiple destinations.</p>
 
 @param request A container for the necessary parameters to execute the SendBulkEmail service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESSendBulkEmailResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorTooManyRequests`, `AWSSESErrorLimitExceeded`, `AWSSESErrorAccountSuspended`, `AWSSESErrorSendingPaused`, `AWSSESErrorMessageRejected`, `AWSSESErrorMailFromDomainNotVerified`, `AWSSESErrorNotFound`, `AWSSESErrorBadRequest`.
 
 @see AWSSESSendBulkEmailRequest
 @see AWSSESSendBulkEmailResponse
 */
- (AWSTask<AWSSESSendBulkEmailResponse *> *)sendBulkEmail:(AWSSESSendBulkEmailRequest *)request;

/**
 <p>Composes an email message to multiple destinations.</p>
 
 @param request A container for the necessary parameters to execute the SendBulkEmail service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorTooManyRequests`, `AWSSESErrorLimitExceeded`, `AWSSESErrorAccountSuspended`, `AWSSESErrorSendingPaused`, `AWSSESErrorMessageRejected`, `AWSSESErrorMailFromDomainNotVerified`, `AWSSESErrorNotFound`, `AWSSESErrorBadRequest`.
 
 @see AWSSESSendBulkEmailRequest
 @see AWSSESSendBulkEmailResponse
 */
- (void)sendBulkEmail:(AWSSESSendBulkEmailRequest *)request completionHandler:(void (^ _Nullable)(AWSSESSendBulkEmailResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Adds an email address to the list of identities for your Amazon SES account in the current AWS Region and attempts to verify it. As a result of executing this operation, a customized verification email is sent to the specified address.</p><p>To use this operation, you must first create a custom verification email template. For more information about creating and using custom verification email templates, see <a href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/send-email-verify-address-custom.html">Using Custom Verification Email Templates</a> in the <i>Amazon SES Developer Guide</i>.</p><p>You can execute this operation no more than once per second.</p>
 
 @param request A container for the necessary parameters to execute the SendCustomVerificationEmail service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESSendCustomVerificationEmailResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorTooManyRequests`, `AWSSESErrorLimitExceeded`, `AWSSESErrorMessageRejected`, `AWSSESErrorSendingPaused`, `AWSSESErrorMailFromDomainNotVerified`, `AWSSESErrorNotFound`, `AWSSESErrorBadRequest`.
 
 @see AWSSESSendCustomVerificationEmailRequest
 @see AWSSESSendCustomVerificationEmailResponse
 */
- (AWSTask<AWSSESSendCustomVerificationEmailResponse *> *)sendCustomVerificationEmail:(AWSSESSendCustomVerificationEmailRequest *)request;

/**
 <p>Adds an email address to the list of identities for your Amazon SES account in the current AWS Region and attempts to verify it. As a result of executing this operation, a customized verification email is sent to the specified address.</p><p>To use this operation, you must first create a custom verification email template. For more information about creating and using custom verification email templates, see <a href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/send-email-verify-address-custom.html">Using Custom Verification Email Templates</a> in the <i>Amazon SES Developer Guide</i>.</p><p>You can execute this operation no more than once per second.</p>
 
 @param request A container for the necessary parameters to execute the SendCustomVerificationEmail service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorTooManyRequests`, `AWSSESErrorLimitExceeded`, `AWSSESErrorMessageRejected`, `AWSSESErrorSendingPaused`, `AWSSESErrorMailFromDomainNotVerified`, `AWSSESErrorNotFound`, `AWSSESErrorBadRequest`.
 
 @see AWSSESSendCustomVerificationEmailRequest
 @see AWSSESSendCustomVerificationEmailResponse
 */
- (void)sendCustomVerificationEmail:(AWSSESSendCustomVerificationEmailRequest *)request completionHandler:(void (^ _Nullable)(AWSSESSendCustomVerificationEmailResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Sends an email message. You can use the Amazon SES API v2 to send two types of messages:</p><ul><li><p><b>Simple</b> – A standard email message. When you create this type of message, you specify the sender, the recipient, and the message body, and Amazon SES assembles the message for you.</p></li><li><p><b>Raw</b> – A raw, MIME-formatted email message. When you send this type of email, you have to specify all of the message headers, as well as the message body. You can use this message type to send messages that contain attachments. The message that you specify has to be a valid MIME message.</p></li><li><p><b>Templated</b> – A message that contains personalization tags. When you send this type of email, Amazon SES API v2 automatically replaces the tags with values that you specify.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the SendEmail service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESSendEmailResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorTooManyRequests`, `AWSSESErrorLimitExceeded`, `AWSSESErrorAccountSuspended`, `AWSSESErrorSendingPaused`, `AWSSESErrorMessageRejected`, `AWSSESErrorMailFromDomainNotVerified`, `AWSSESErrorNotFound`, `AWSSESErrorBadRequest`.
 
 @see AWSSESSendEmailRequest
 @see AWSSESSendEmailResponse
 */
- (AWSTask<AWSSESSendEmailResponse *> *)sendEmail:(AWSSESSendEmailRequest *)request;

/**
 <p>Sends an email message. You can use the Amazon SES API v2 to send two types of messages:</p><ul><li><p><b>Simple</b> – A standard email message. When you create this type of message, you specify the sender, the recipient, and the message body, and Amazon SES assembles the message for you.</p></li><li><p><b>Raw</b> – A raw, MIME-formatted email message. When you send this type of email, you have to specify all of the message headers, as well as the message body. You can use this message type to send messages that contain attachments. The message that you specify has to be a valid MIME message.</p></li><li><p><b>Templated</b> – A message that contains personalization tags. When you send this type of email, Amazon SES API v2 automatically replaces the tags with values that you specify.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the SendEmail service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorTooManyRequests`, `AWSSESErrorLimitExceeded`, `AWSSESErrorAccountSuspended`, `AWSSESErrorSendingPaused`, `AWSSESErrorMessageRejected`, `AWSSESErrorMailFromDomainNotVerified`, `AWSSESErrorNotFound`, `AWSSESErrorBadRequest`.
 
 @see AWSSESSendEmailRequest
 @see AWSSESSendEmailResponse
 */
- (void)sendEmail:(AWSSESSendEmailRequest *)request completionHandler:(void (^ _Nullable)(AWSSESSendEmailResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Add one or more tags (keys and values) to a specified resource. A <i>tag</i> is a label that you optionally define and associate with a resource. Tags can help you categorize and manage resources in different ways, such as by purpose, owner, environment, or other criteria. A resource can have as many as 50 tags.</p><p>Each tag consists of a required <i>tag key</i> and an associated <i>tag value</i>, both of which you define. A tag key is a general label that acts as a category for more specific tag values. A tag value acts as a descriptor within a tag key.</p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESTagResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorBadRequest`, `AWSSESErrorConcurrentModification`, `AWSSESErrorNotFound`, `AWSSESErrorTooManyRequests`.
 
 @see AWSSESTagResourceRequest
 @see AWSSESTagResourceResponse
 */
- (AWSTask<AWSSESTagResourceResponse *> *)tagResource:(AWSSESTagResourceRequest *)request;

/**
 <p>Add one or more tags (keys and values) to a specified resource. A <i>tag</i> is a label that you optionally define and associate with a resource. Tags can help you categorize and manage resources in different ways, such as by purpose, owner, environment, or other criteria. A resource can have as many as 50 tags.</p><p>Each tag consists of a required <i>tag key</i> and an associated <i>tag value</i>, both of which you define. A tag key is a general label that acts as a category for more specific tag values. A tag value acts as a descriptor within a tag key.</p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorBadRequest`, `AWSSESErrorConcurrentModification`, `AWSSESErrorNotFound`, `AWSSESErrorTooManyRequests`.
 
 @see AWSSESTagResourceRequest
 @see AWSSESTagResourceResponse
 */
- (void)tagResource:(AWSSESTagResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSSESTagResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a preview of the MIME content of an email when provided with a template and a set of replacement data.</p><p>You can execute this operation no more than once per second.</p>
 
 @param request A container for the necessary parameters to execute the TestRenderEmailTemplate service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESTestRenderEmailTemplateResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorNotFound`, `AWSSESErrorTooManyRequests`, `AWSSESErrorBadRequest`.
 
 @see AWSSESTestRenderEmailTemplateRequest
 @see AWSSESTestRenderEmailTemplateResponse
 */
- (AWSTask<AWSSESTestRenderEmailTemplateResponse *> *)testRenderEmailTemplate:(AWSSESTestRenderEmailTemplateRequest *)request;

/**
 <p>Creates a preview of the MIME content of an email when provided with a template and a set of replacement data.</p><p>You can execute this operation no more than once per second.</p>
 
 @param request A container for the necessary parameters to execute the TestRenderEmailTemplate service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorNotFound`, `AWSSESErrorTooManyRequests`, `AWSSESErrorBadRequest`.
 
 @see AWSSESTestRenderEmailTemplateRequest
 @see AWSSESTestRenderEmailTemplateResponse
 */
- (void)testRenderEmailTemplate:(AWSSESTestRenderEmailTemplateRequest *)request completionHandler:(void (^ _Nullable)(AWSSESTestRenderEmailTemplateResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Remove one or more tags (keys and values) from a specified resource.</p>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESUntagResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorBadRequest`, `AWSSESErrorConcurrentModification`, `AWSSESErrorNotFound`, `AWSSESErrorTooManyRequests`.
 
 @see AWSSESUntagResourceRequest
 @see AWSSESUntagResourceResponse
 */
- (AWSTask<AWSSESUntagResourceResponse *> *)untagResource:(AWSSESUntagResourceRequest *)request;

/**
 <p>Remove one or more tags (keys and values) from a specified resource.</p>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorBadRequest`, `AWSSESErrorConcurrentModification`, `AWSSESErrorNotFound`, `AWSSESErrorTooManyRequests`.
 
 @see AWSSESUntagResourceRequest
 @see AWSSESUntagResourceResponse
 */
- (void)untagResource:(AWSSESUntagResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSSESUntagResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Update the configuration of an event destination for a configuration set.</p><p><i>Events</i> include message sends, deliveries, opens, clicks, bounces, and complaints. <i>Event destinations</i> are places that you can send information about these events to. For example, you can send event data to Amazon SNS to receive notifications when you receive bounces or complaints, or you can use Amazon Kinesis Data Firehose to stream data to Amazon S3 for long-term storage.</p>
 
 @param request A container for the necessary parameters to execute the UpdateConfigurationSetEventDestination service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESUpdateConfigurationSetEventDestinationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorNotFound`, `AWSSESErrorTooManyRequests`, `AWSSESErrorBadRequest`.
 
 @see AWSSESUpdateConfigurationSetEventDestinationRequest
 @see AWSSESUpdateConfigurationSetEventDestinationResponse
 */
- (AWSTask<AWSSESUpdateConfigurationSetEventDestinationResponse *> *)updateConfigurationSetEventDestination:(AWSSESUpdateConfigurationSetEventDestinationRequest *)request;

/**
 <p>Update the configuration of an event destination for a configuration set.</p><p><i>Events</i> include message sends, deliveries, opens, clicks, bounces, and complaints. <i>Event destinations</i> are places that you can send information about these events to. For example, you can send event data to Amazon SNS to receive notifications when you receive bounces or complaints, or you can use Amazon Kinesis Data Firehose to stream data to Amazon S3 for long-term storage.</p>
 
 @param request A container for the necessary parameters to execute the UpdateConfigurationSetEventDestination service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorNotFound`, `AWSSESErrorTooManyRequests`, `AWSSESErrorBadRequest`.
 
 @see AWSSESUpdateConfigurationSetEventDestinationRequest
 @see AWSSESUpdateConfigurationSetEventDestinationResponse
 */
- (void)updateConfigurationSetEventDestination:(AWSSESUpdateConfigurationSetEventDestinationRequest *)request completionHandler:(void (^ _Nullable)(AWSSESUpdateConfigurationSetEventDestinationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates an existing custom verification email template.</p><p>For more information about custom verification email templates, see <a href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/send-email-verify-address-custom.html">Using Custom Verification Email Templates</a> in the <i>Amazon SES Developer Guide</i>.</p><p>You can execute this operation no more than once per second.</p>
 
 @param request A container for the necessary parameters to execute the UpdateCustomVerificationEmailTemplate service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESUpdateCustomVerificationEmailTemplateResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorNotFound`, `AWSSESErrorBadRequest`, `AWSSESErrorTooManyRequests`.
 
 @see AWSSESUpdateCustomVerificationEmailTemplateRequest
 @see AWSSESUpdateCustomVerificationEmailTemplateResponse
 */
- (AWSTask<AWSSESUpdateCustomVerificationEmailTemplateResponse *> *)updateCustomVerificationEmailTemplate:(AWSSESUpdateCustomVerificationEmailTemplateRequest *)request;

/**
 <p>Updates an existing custom verification email template.</p><p>For more information about custom verification email templates, see <a href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/send-email-verify-address-custom.html">Using Custom Verification Email Templates</a> in the <i>Amazon SES Developer Guide</i>.</p><p>You can execute this operation no more than once per second.</p>
 
 @param request A container for the necessary parameters to execute the UpdateCustomVerificationEmailTemplate service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorNotFound`, `AWSSESErrorBadRequest`, `AWSSESErrorTooManyRequests`.
 
 @see AWSSESUpdateCustomVerificationEmailTemplateRequest
 @see AWSSESUpdateCustomVerificationEmailTemplateResponse
 */
- (void)updateCustomVerificationEmailTemplate:(AWSSESUpdateCustomVerificationEmailTemplateRequest *)request completionHandler:(void (^ _Nullable)(AWSSESUpdateCustomVerificationEmailTemplateResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the specified sending authorization policy for the given identity (an email address or a domain). This API returns successfully even if a policy with the specified name does not exist.</p><note><p>This API is for the identity owner only. If you have not verified the identity, this API will return an error.</p></note><p>Sending authorization is a feature that enables an identity owner to authorize other senders to use its identities. For information about using sending authorization, see the <a href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/sending-authorization.html">Amazon SES Developer Guide</a>.</p><p>You can execute this operation no more than once per second.</p>
 
 @param request A container for the necessary parameters to execute the UpdateEmailIdentityPolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESUpdateEmailIdentityPolicyResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorNotFound`, `AWSSESErrorTooManyRequests`, `AWSSESErrorBadRequest`.
 
 @see AWSSESUpdateEmailIdentityPolicyRequest
 @see AWSSESUpdateEmailIdentityPolicyResponse
 */
- (AWSTask<AWSSESUpdateEmailIdentityPolicyResponse *> *)updateEmailIdentityPolicy:(AWSSESUpdateEmailIdentityPolicyRequest *)request;

/**
 <p>Updates the specified sending authorization policy for the given identity (an email address or a domain). This API returns successfully even if a policy with the specified name does not exist.</p><note><p>This API is for the identity owner only. If you have not verified the identity, this API will return an error.</p></note><p>Sending authorization is a feature that enables an identity owner to authorize other senders to use its identities. For information about using sending authorization, see the <a href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/sending-authorization.html">Amazon SES Developer Guide</a>.</p><p>You can execute this operation no more than once per second.</p>
 
 @param request A container for the necessary parameters to execute the UpdateEmailIdentityPolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorNotFound`, `AWSSESErrorTooManyRequests`, `AWSSESErrorBadRequest`.
 
 @see AWSSESUpdateEmailIdentityPolicyRequest
 @see AWSSESUpdateEmailIdentityPolicyResponse
 */
- (void)updateEmailIdentityPolicy:(AWSSESUpdateEmailIdentityPolicyRequest *)request completionHandler:(void (^ _Nullable)(AWSSESUpdateEmailIdentityPolicyResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates an email template. Email templates enable you to send personalized email to one or more destinations in a single API operation. For more information, see the <a href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/send-personalized-email-api.html">Amazon SES Developer Guide</a>.</p><p>You can execute this operation no more than once per second.</p>
 
 @param request A container for the necessary parameters to execute the UpdateEmailTemplate service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESUpdateEmailTemplateResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorNotFound`, `AWSSESErrorTooManyRequests`, `AWSSESErrorBadRequest`.
 
 @see AWSSESUpdateEmailTemplateRequest
 @see AWSSESUpdateEmailTemplateResponse
 */
- (AWSTask<AWSSESUpdateEmailTemplateResponse *> *)updateEmailTemplate:(AWSSESUpdateEmailTemplateRequest *)request;

/**
 <p>Updates an email template. Email templates enable you to send personalized email to one or more destinations in a single API operation. For more information, see the <a href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/send-personalized-email-api.html">Amazon SES Developer Guide</a>.</p><p>You can execute this operation no more than once per second.</p>
 
 @param request A container for the necessary parameters to execute the UpdateEmailTemplate service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorNotFound`, `AWSSESErrorTooManyRequests`, `AWSSESErrorBadRequest`.
 
 @see AWSSESUpdateEmailTemplateRequest
 @see AWSSESUpdateEmailTemplateResponse
 */
- (void)updateEmailTemplate:(AWSSESUpdateEmailTemplateRequest *)request completionHandler:(void (^ _Nullable)(AWSSESUpdateEmailTemplateResponse * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
