/*
 Copyright 2010-2015 Amazon.com, Inc. or its affiliates. All Rights Reserved.

 Licensed under the Apache License, Version 2.0 (the "License").
 You may not use this file except in compliance with the License.
 A copy of the License is located at

 http://aws.amazon.com/apache2.0

 or in the "license" file accompanying this file. This file is distributed
 on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 express or implied. See the License for the specific language governing
 permissions and limitations under the License.
 */

#import <Foundation/Foundation.h>
#import <AWSCore/AWSCore.h>
#import "AWSSESModel.h"

NS_ASSUME_NONNULL_BEGIN

/**
 <fullname>Amazon Simple Email Service</fullname><p> This is the API Reference for Amazon Simple Email Service (Amazon SES). This documentation is intended to be used in conjunction with the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/Welcome.html">Amazon SES Developer Guide</a>. </p><note>For a list of Amazon SES endpoints to use in service requests, see <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/regions.html">Regions and Amazon SES</a> in the Amazon SES Developer Guide. </note>
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

     let SES = AWSSES.defaultSES()

 *Objective-C*

     AWSSES *SES = [AWSSES defaultSES];

 @return The default service client.
 */
+ (instancetype)defaultSES;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
         let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
         let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
         AWSSES.registerSESWithConfiguration(configuration, forKey: "USWest2SES")

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
 Retrieves the service client associated with the key. You need to call `+ registerSESWithConfiguration:forKey:` before invoking this method. If `+ registerSESWithConfiguration:forKey:` has not been called in advance or the key does not exist, this method returns `nil`.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
         let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
         let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
         AWSSES.registerSESWithConfiguration(configuration, forKey: "USWest2SES")

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
 Instantiates the service client with the given service configuration.
 
 @warning This method has been deprecated. Use `+ registerSESWithConfiguration:forKey:` and `+ SESForKey:` instead.
 
 @warning Once the client is instantiated, do not modify the configuration object. It may cause unspecified behaviors.
 
 @warning Unlike the singleton method, you are responsible for maintaining a strong reference to this object. If the service client is released before completing a service request, the request may fail with unspecified errors.
 
 @param configuration The service configuration object.
 
 @return An instance of the service client.
 */
- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration __attribute__ ((deprecated("Use '+ registerSESWithConfiguration:forKey:' and '+ SESForKey:' instead.")));

/**
 <p>Deletes the specified identity (email address or domain) from the list of verified identities.</p><p>This action is throttled at one request per second.</p>
 
 @param request A container for the necessary parameters to execute the DeleteIdentity service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESDeleteIdentityResponse`.
 
 @see AWSSESDeleteIdentityRequest
 @see AWSSESDeleteIdentityResponse
 */
- (AWSTask *)deleteIdentity:(AWSSESDeleteIdentityRequest *)request;

/**
 <p>Deletes the specified email address from the list of verified addresses.</p><important>The DeleteVerifiedEmailAddress action is deprecated as of the May 15, 2012 release of Domain Verification. The DeleteIdentity action is now preferred.</important><p>This action is throttled at one request per second.</p>
 
 @param request A container for the necessary parameters to execute the DeleteVerifiedEmailAddress service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSSESDeleteVerifiedEmailAddressRequest
 */
- (AWSTask *)deleteVerifiedEmailAddress:(AWSSESDeleteVerifiedEmailAddressRequest *)request;

/**
 <p>Returns the current status of Easy DKIM signing for an entity. For domain name identities, this action also returns the DKIM tokens that are required for Easy DKIM signing, and whether Amazon SES has successfully verified that these tokens have been published.</p><p>This action takes a list of identities as input and returns the following information for each:</p><ul><li>Whether Easy DKIM signing is enabled or disabled.</li><li>A set of DKIM tokens that represent the identity. If the identity is an email address, the tokens represent the domain of that address.</li><li>Whether Amazon SES has successfully verified the DKIM tokens published in the domain's DNS. This information is only returned for domain name identities, not for email addresses.</li></ul><p>This action is throttled at one request per second.</p><p>For more information about creating DNS records using DKIM tokens, go to the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/easy-dkim-dns-records.html">Amazon SES Developer Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the GetIdentityDkimAttributes service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESGetIdentityDkimAttributesResponse`.
 
 @see AWSSESGetIdentityDkimAttributesRequest
 @see AWSSESGetIdentityDkimAttributesResponse
 */
- (AWSTask *)getIdentityDkimAttributes:(AWSSESGetIdentityDkimAttributesRequest *)request;

/**
 <p>Given a list of verified identities (email addresses and/or domains), returns a structure describing identity notification attributes.</p><p>This action is throttled at one request per second.</p><p>For more information about using notifications with Amazon SES, see the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/notifications.html">Amazon SES Developer Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the GetIdentityNotificationAttributes service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESGetIdentityNotificationAttributesResponse`.
 
 @see AWSSESGetIdentityNotificationAttributesRequest
 @see AWSSESGetIdentityNotificationAttributesResponse
 */
- (AWSTask *)getIdentityNotificationAttributes:(AWSSESGetIdentityNotificationAttributesRequest *)request;

/**
 <p>Given a list of identities (email addresses and/or domains), returns the verification status and (for domain identities) the verification token for each identity.</p><p>This action is throttled at one request per second.</p>
 
 @param request A container for the necessary parameters to execute the GetIdentityVerificationAttributes service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESGetIdentityVerificationAttributesResponse`.
 
 @see AWSSESGetIdentityVerificationAttributesRequest
 @see AWSSESGetIdentityVerificationAttributesResponse
 */
- (AWSTask *)getIdentityVerificationAttributes:(AWSSESGetIdentityVerificationAttributesRequest *)request;

/**
 <p>Returns the user's current sending limits.</p><p>This action is throttled at one request per second.</p>
 
 @param request A container for the necessary parameters to execute the GetSendQuota service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESGetSendQuotaResponse`.
 
 @see AWSRequest
 @see AWSSESGetSendQuotaResponse
 */
- (AWSTask *)getSendQuota:(AWSRequest *)request;

/**
 <p>Returns the user's sending statistics. The result is a list of data points, representing the last two weeks of sending activity. </p><p>Each data point in the list contains statistics for a 15-minute interval.</p><p>This action is throttled at one request per second.</p>
 
 @param request A container for the necessary parameters to execute the GetSendStatistics service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESGetSendStatisticsResponse`.
 
 @see AWSRequest
 @see AWSSESGetSendStatisticsResponse
 */
- (AWSTask *)getSendStatistics:(AWSRequest *)request;

/**
 <p>Returns a list containing all of the identities (email addresses and domains) for a specific AWS Account, regardless of verification status.</p><p>This action is throttled at one request per second.</p>
 
 @param request A container for the necessary parameters to execute the ListIdentities service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESListIdentitiesResponse`.
 
 @see AWSSESListIdentitiesRequest
 @see AWSSESListIdentitiesResponse
 */
- (AWSTask *)listIdentities:(AWSSESListIdentitiesRequest *)request;

/**
 <p>Returns a list containing all of the email addresses that have been verified.</p><important>The ListVerifiedEmailAddresses action is deprecated as of the May 15, 2012 release of Domain Verification. The ListIdentities action is now preferred.</important><p>This action is throttled at one request per second.</p>
 
 @param request A container for the necessary parameters to execute the ListVerifiedEmailAddresses service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESListVerifiedEmailAddressesResponse`.
 
 @see AWSRequest
 @see AWSSESListVerifiedEmailAddressesResponse
 */
- (AWSTask *)listVerifiedEmailAddresses:(AWSRequest *)request;

/**
 <p>Composes an email message based on input data, and then immediately queues the message for sending. </p><important> You can only send email from verified email addresses and domains. If you have not requested production access to Amazon SES, you must also verify every recipient email address except for the recipients provided by the Amazon SES mailbox simulator. For more information, go to the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/verify-addresses-and-domains.html">Amazon SES Developer Guide</a>. </important><p>The total size of the message cannot exceed 10 MB.</p><p>Amazon SES has a limit on the total number of recipients per message: The combined number of To:, CC: and BCC: email addresses cannot exceed 50. If you need to send an email message to a larger audience, you can divide your recipient list into groups of 50 or fewer, and then call Amazon SES repeatedly to send the message to each group. </p><p>For every message that you send, the total number of recipients (To:, CC: and BCC:) is counted against your <i>sending quota</i> - the maximum number of emails you can send in a 24-hour period. For information about your sending quota, go to the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/manage-sending-limits.html">Amazon SES Developer Guide</a>. </p>
 
 @param request A container for the necessary parameters to execute the SendEmail service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESSendEmailResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorMessageRejected`.
 
 @see AWSSESSendEmailRequest
 @see AWSSESSendEmailResponse
 */
- (AWSTask *)sendEmail:(AWSSESSendEmailRequest *)request;

/**
 <p>Sends an email message, with header and content specified by the client. The <code>SendRawEmail</code> action is useful for sending multipart MIME emails. The raw text of the message must comply with Internet email standards; otherwise, the message cannot be sent. </p><important> You can only send email from verified email addresses and domains. If you have not requested production access to Amazon SES, you must also verify every recipient email address except for the recipients provided by the Amazon SES mailbox simulator. For more information, go to the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/verify-addresses-and-domains.html">Amazon SES Developer Guide</a>. </important><p>The total size of the message cannot exceed 10 MB. This includes any attachments that are part of the message.</p><p>Amazon SES has a limit on the total number of recipients per message: The combined number of To:, CC: and BCC: email addresses cannot exceed 50. If you need to send an email message to a larger audience, you can divide your recipient list into groups of 50 or fewer, and then call Amazon SES repeatedly to send the message to each group. </p><p>The To:, CC:, and BCC: headers in the raw message can contain a group list. Note that each recipient in a group list counts towards the 50-recipient limit. </p><p>For every message that you send, the total number of recipients (To:, CC: and BCC:) is counted against your <i>sending quota</i> - the maximum number of emails you can send in a 24-hour period. For information about your sending quota, go to the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/manage-sending-limits.html">Amazon SES Developer Guide</a>. </p>
 
 @param request A container for the necessary parameters to execute the SendRawEmail service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESSendRawEmailResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSESErrorDomain` domain and the following error code: `AWSSESErrorMessageRejected`.
 
 @see AWSSESSendRawEmailRequest
 @see AWSSESSendRawEmailResponse
 */
- (AWSTask *)sendRawEmail:(AWSSESSendRawEmailRequest *)request;

/**
 <p>Enables or disables Easy DKIM signing of email sent from an identity:</p><ul><li>If Easy DKIM signing is enabled for a domain name identity (e.g., <code>example.com</code>), then Amazon SES will DKIM-sign all email sent by addresses under that domain name (e.g., <code>user@example.com</code>).</li><li>If Easy DKIM signing is enabled for an email address, then Amazon SES will DKIM-sign all email sent by that email address.</li></ul><p>For email addresses (e.g., <code>user@example.com</code>), you can only enable Easy DKIM signing if the corresponding domain (e.g., <code>example.com</code>) has been set up for Easy DKIM using the AWS Console or the <code>VerifyDomainDkim</code> action.</p><p>This action is throttled at one request per second.</p><p>For more information about Easy DKIM signing, go to the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/easy-dkim.html">Amazon SES Developer Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the SetIdentityDkimEnabled service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESSetIdentityDkimEnabledResponse`.
 
 @see AWSSESSetIdentityDkimEnabledRequest
 @see AWSSESSetIdentityDkimEnabledResponse
 */
- (AWSTask *)setIdentityDkimEnabled:(AWSSESSetIdentityDkimEnabledRequest *)request;

/**
 <p>Given an identity (email address or domain), enables or disables whether Amazon SES forwards bounce and complaint notifications as email. Feedback forwarding can only be disabled when Amazon Simple Notification Service (Amazon SNS) topics are specified for both bounces and complaints.</p><note>Feedback forwarding does not apply to delivery notifications. Delivery notifications are only available through Amazon SNS.</note><p>This action is throttled at one request per second.</p><p>For more information about using notifications with Amazon SES, see the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/notifications.html">Amazon SES Developer Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the SetIdentityFeedbackForwardingEnabled service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESSetIdentityFeedbackForwardingEnabledResponse`.
 
 @see AWSSESSetIdentityFeedbackForwardingEnabledRequest
 @see AWSSESSetIdentityFeedbackForwardingEnabledResponse
 */
- (AWSTask *)setIdentityFeedbackForwardingEnabled:(AWSSESSetIdentityFeedbackForwardingEnabledRequest *)request;

/**
 <p>Given an identity (email address or domain), sets the Amazon Simple Notification Service (Amazon SNS) topic to which Amazon SES will publish bounce, complaint, and/or delivery notifications for emails sent with that identity as the <code>Source</code>.</p><note>Unless feedback forwarding is enabled, you must specify Amazon SNS topics for bounce and complaint notifications. For more information, see <code>SetIdentityFeedbackForwardingEnabled</code>. </note><p>This action is throttled at one request per second.</p><p>For more information about feedback notification, see the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/notifications.html">Amazon SES Developer Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the SetIdentityNotificationTopic service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESSetIdentityNotificationTopicResponse`.
 
 @see AWSSESSetIdentityNotificationTopicRequest
 @see AWSSESSetIdentityNotificationTopicResponse
 */
- (AWSTask *)setIdentityNotificationTopic:(AWSSESSetIdentityNotificationTopicRequest *)request;

/**
 <p>Returns a set of DKIM tokens for a domain. DKIM <i>tokens</i> are character strings that represent your domain's identity. Using these tokens, you will need to create DNS CNAME records that point to DKIM public keys hosted by Amazon SES. Amazon Web Services will eventually detect that you have updated your DNS records; this detection process may take up to 72 hours. Upon successful detection, Amazon SES will be able to DKIM-sign email originating from that domain.</p><p>This action is throttled at one request per second.</p><p>To enable or disable Easy DKIM signing for a domain, use the <code>SetIdentityDkimEnabled</code> action.</p><p>For more information about creating DNS records using DKIM tokens, go to the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/easy-dkim-dns-records.html">Amazon SES Developer Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the VerifyDomainDkim service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESVerifyDomainDkimResponse`.
 
 @see AWSSESVerifyDomainDkimRequest
 @see AWSSESVerifyDomainDkimResponse
 */
- (AWSTask *)verifyDomainDkim:(AWSSESVerifyDomainDkimRequest *)request;

/**
 <p>Verifies a domain.</p><p>This action is throttled at one request per second.</p>
 
 @param request A container for the necessary parameters to execute the VerifyDomainIdentity service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESVerifyDomainIdentityResponse`.
 
 @see AWSSESVerifyDomainIdentityRequest
 @see AWSSESVerifyDomainIdentityResponse
 */
- (AWSTask *)verifyDomainIdentity:(AWSSESVerifyDomainIdentityRequest *)request;

/**
 <p>Verifies an email address. This action causes a confirmation email message to be sent to the specified address.</p><important>The VerifyEmailAddress action is deprecated as of the May 15, 2012 release of Domain Verification. The VerifyEmailIdentity action is now preferred.</important><p>This action is throttled at one request per second.</p>
 
 @param request A container for the necessary parameters to execute the VerifyEmailAddress service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSSESVerifyEmailAddressRequest
 */
- (AWSTask *)verifyEmailAddress:(AWSSESVerifyEmailAddressRequest *)request;

/**
 <p>Verifies an email address. This action causes a confirmation email message to be sent to the specified address.</p><p>This action is throttled at one request per second.</p>
 
 @param request A container for the necessary parameters to execute the VerifyEmailIdentity service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSESVerifyEmailIdentityResponse`.
 
 @see AWSSESVerifyEmailIdentityRequest
 @see AWSSESVerifyEmailIdentityResponse
 */
- (AWSTask *)verifyEmailIdentity:(AWSSESVerifyEmailIdentityRequest *)request;

@end

NS_ASSUME_NONNULL_END
