/*
 * Copyright 2010-2014 Amazon.com, Inc. or its affiliates. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License").
 * You may not use this file except in compliance with the License.
 * A copy of the License is located at
 *
 *  http://aws.amazon.com/apache2.0
 *
 * or in the "license" file accompanying this file. This file is distributed
 * on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 * express or implied. See the License for the specific language governing
 * permissions and limitations under the License.
 */

#import <Foundation/Foundation.h>
#import "AWSService.h"
#import "AWSSNSModel.h"

@class BFTask;

/**
 * <fullname>Amazon Simple Notification Service</fullname>	<p>Amazon Simple Notification Service (Amazon SNS) is a web service that enables you to build distributed web-enabled applications.	Applications can use Amazon SNS to easily push real-time notification messages	to interested subscribers over multiple delivery protocols. For more information about this product 		see <a href="http://aws.amazon.com/sns/">http://aws.amazon.com/sns</a>. For detailed information about Amazon SNS features and their associated API calls, 		see the <a href="http://docs.aws.amazon.com/sns/latest/dg/">Amazon SNS Developer Guide</a>. 	</p><p>We also provide SDKs that enable you to access Amazon SNS from your preferred programming language.The SDKs contain functionality that automatically takes care of tasks such as: cryptographically signing your service requests,retrying requests, and handling error responses. For a list of available SDKs, go to <a href="http://aws.amazon.com/tools/">Tools for Amazon Web Services</a>. </p>
 */
@interface AWSSNS : AWSService

@property (nonatomic, strong, readonly) AWSServiceConfiguration *configuration;
@property (nonatomic, strong, readonly) AWSEndpoint *endpoint;

+ (instancetype)defaultSNS;

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration;

/**
 * <p>The <code>AddPermission</code> action adds a statement to a topic's access control policy, granting access for the specified AWS accounts to the specified actions.</p> 
 *
 * @param request A container for the necessary parameters to execute the AddPermission service method.
 *
 * @return An instance of BFTask. On successful execution, task.result will be nil. On failed execution, task.error may contain an NSError with AWSSNSErrorDomain domian and the following error code: AWSSNSErrorInvalidParameter, AWSSNSErrorInternalError, AWSSNSErrorAuthorizationError, AWSSNSErrorNotFound.
 *
 * @see AWSSNSAddPermissionInput
 */
- (BFTask *)addPermission:(AWSSNSAddPermissionInput *)request;

/**
 * <p>The <code>ConfirmSubscription</code> action verifies an endpoint owner's intent to receive messages by validating the token sent to the endpoint by an earlier <code>Subscribe</code> action. If the token is valid, the action creates a new subscription and returns its Amazon Resource Name (ARN). This call requires an AWS signature only when the <code>AuthenticateOnUnsubscribe</code> flag is set to "true".</p> 
 *
 * @param request A container for the necessary parameters to execute the ConfirmSubscription service method.
 *
 * @return An instance of BFTask. On successful execution, task.result will contain an instance of AWSSNSConfirmSubscriptionResponse. On failed execution, task.error may contain an NSError with AWSSNSErrorDomain domian and the following error code: AWSSNSErrorSubscriptionLimitExceeded, AWSSNSErrorInvalidParameter, AWSSNSErrorNotFound, AWSSNSErrorInternalError, AWSSNSErrorAuthorizationError.
 *
 * @see AWSSNSConfirmSubscriptionInput
 * @see AWSSNSConfirmSubscriptionResponse
 */
- (BFTask *)confirmSubscription:(AWSSNSConfirmSubscriptionInput *)request;

/**
 * <p>The <code>CreatePlatformApplication</code> action creates a platform application object for one of the supported push notification services,such as APNS and GCM, to which devices and mobile apps may register. You must specify PlatformPrincipal and PlatformCredential attributes when usingthe <code>CreatePlatformApplication</code> action. The PlatformPrincipal is received from the notification service. For APNS/APNS_SANDBOX, PlatformPrincipal is "SSL certificate".For GCM, PlatformPrincipal is not applicable. For ADM, <!--, WNS and MPNS--> PlatformPrincipal is "client id". The PlatformCredential is also received from the notification service.For APNS/APNS_SANDBOX, PlatformCredential is "private key". For GCM, PlatformCredential is "API key". For ADM,<!--, WNS and MPNS--> PlatformCredential is "client secret". The PlatformApplicationArn that is returned when using <code>CreatePlatformApplication</code> is then used as an attribute for the <code>CreatePlatformEndpoint</code> action. For more information, see <a href="http://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html">Using Amazon SNS Mobile Push Notifications</a>.</p>
 *
 * @param request A container for the necessary parameters to execute the CreatePlatformApplication service method.
 *
 * @return An instance of BFTask. On successful execution, task.result will contain an instance of AWSSNSCreatePlatformApplicationResponse. On failed execution, task.error may contain an NSError with AWSSNSErrorDomain domian and the following error code: AWSSNSErrorInvalidParameter, AWSSNSErrorInternalError, AWSSNSErrorAuthorizationError.
 *
 * @see AWSSNSCreatePlatformApplicationInput
 * @see AWSSNSCreatePlatformApplicationResponse
 */
- (BFTask *)createPlatformApplication:(AWSSNSCreatePlatformApplicationInput *)request;

/**
 * <p>The <code>CreatePlatformEndpoint</code> creates an endpoint for a device and mobile app on one of the supported push notification services, such as GCM and APNS.<code>CreatePlatformEndpoint</code> requires the PlatformApplicationArn that is returned from <code>CreatePlatformApplication</code>. The EndpointArn that is returned when using <code>CreatePlatformEndpoint</code> can then be used by the <code>Publish</code> action to send a message to a mobile app or by the <code>Subscribe</code>action for subscription to a topic. For more information, see <a href="http://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html">Using Amazon SNS Mobile Push Notifications</a>. </p> 
 *
 * @param request A container for the necessary parameters to execute the CreatePlatformEndpoint service method.
 *
 * @return An instance of BFTask. On successful execution, task.result will contain an instance of AWSSNSCreateEndpointResponse. On failed execution, task.error may contain an NSError with AWSSNSErrorDomain domian and the following error code: AWSSNSErrorInvalidParameter, AWSSNSErrorInternalError, AWSSNSErrorAuthorizationError, AWSSNSErrorNotFound.
 *
 * @see AWSSNSCreatePlatformEndpointInput
 * @see AWSSNSCreateEndpointResponse
 */
- (BFTask *)createPlatformEndpoint:(AWSSNSCreatePlatformEndpointInput *)request;

/**
 * <p>The <code>CreateTopic</code> action creates a topic to which notifications can be published. Users can createat most 100 topics. For more information, see <a href="http://aws.amazon.com/sns/">http://aws.amazon.com/sns</a>. This action is idempotent, so if the requester already owns a topic with the specified name, that topic's ARN is returned without creating a new topic.</p> 
 *
 * @param request A container for the necessary parameters to execute the CreateTopic service method.
 *
 * @return An instance of BFTask. On successful execution, task.result will contain an instance of AWSSNSCreateTopicResponse. On failed execution, task.error may contain an NSError with AWSSNSErrorDomain domian and the following error code: AWSSNSErrorInvalidParameter, AWSSNSErrorTopicLimitExceeded, AWSSNSErrorInternalError, AWSSNSErrorAuthorizationError.
 *
 * @see AWSSNSCreateTopicInput
 * @see AWSSNSCreateTopicResponse
 */
- (BFTask *)createTopic:(AWSSNSCreateTopicInput *)request;

/**
 * <p>The <code>DeleteEndpoint</code> action, which is idempotent, deletes the endpoint from SNS.For more information, see <a href="http://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html">Using Amazon SNS Mobile Push Notifications</a>. </p> 
 *
 * @param request A container for the necessary parameters to execute the DeleteEndpoint service method.
 *
 * @return An instance of BFTask. On successful execution, task.result will be nil. On failed execution, task.error may contain an NSError with AWSSNSErrorDomain domian and the following error code: AWSSNSErrorInvalidParameter, AWSSNSErrorInternalError, AWSSNSErrorAuthorizationError.
 *
 * @see AWSSNSDeleteEndpointInput
 */
- (BFTask *)deleteEndpoint:(AWSSNSDeleteEndpointInput *)request;

/**
 * <p>The <code>DeletePlatformApplication</code> action deletes a platform application object for one of the supported push notification services,such as APNS and GCM. For more information, see <a href="http://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html">Using Amazon SNS Mobile Push Notifications</a>. </p> 
 *
 * @param request A container for the necessary parameters to execute the DeletePlatformApplication service method.
 *
 * @return An instance of BFTask. On successful execution, task.result will be nil. On failed execution, task.error may contain an NSError with AWSSNSErrorDomain domian and the following error code: AWSSNSErrorInvalidParameter, AWSSNSErrorInternalError, AWSSNSErrorAuthorizationError.
 *
 * @see AWSSNSDeletePlatformApplicationInput
 */
- (BFTask *)deletePlatformApplication:(AWSSNSDeletePlatformApplicationInput *)request;

/**
 * <p>The <code>DeleteTopic</code> action deletes a topic and all its subscriptions. Deleting a topic might prevent some messages previously sent to the topic from being delivered to subscribers. This action is idempotent, so deleting a topic that does not exist does not result in an error.</p> 
 *
 * @param request A container for the necessary parameters to execute the DeleteTopic service method.
 *
 * @return An instance of BFTask. On successful execution, task.result will be nil. On failed execution, task.error may contain an NSError with AWSSNSErrorDomain domian and the following error code: AWSSNSErrorInvalidParameter, AWSSNSErrorInternalError, AWSSNSErrorAuthorizationError, AWSSNSErrorNotFound.
 *
 * @see AWSSNSDeleteTopicInput
 */
- (BFTask *)deleteTopic:(AWSSNSDeleteTopicInput *)request;

/**
 * <p>The <code>GetEndpointAttributes</code> retrieves the endpoint attributes for a device on one of the supported push notification services, such as GCM and APNS.For more information, see <a href="http://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html">Using Amazon SNS Mobile Push Notifications</a>. </p> 
 *
 * @param request A container for the necessary parameters to execute the GetEndpointAttributes service method.
 *
 * @return An instance of BFTask. On successful execution, task.result will contain an instance of AWSSNSGetEndpointAttributesResponse. On failed execution, task.error may contain an NSError with AWSSNSErrorDomain domian and the following error code: AWSSNSErrorInvalidParameter, AWSSNSErrorInternalError, AWSSNSErrorAuthorizationError, AWSSNSErrorNotFound.
 *
 * @see AWSSNSGetEndpointAttributesInput
 * @see AWSSNSGetEndpointAttributesResponse
 */
- (BFTask *)getEndpointAttributes:(AWSSNSGetEndpointAttributesInput *)request;

/**
 * <p>The <code>GetPlatformApplicationAttributes</code> action retrieves the attributes of the platform application object for the supported push notification services,such as APNS and GCM. For more information, see <a href="http://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html">Using Amazon SNS Mobile Push Notifications</a>. </p> 
 *
 * @param request A container for the necessary parameters to execute the GetPlatformApplicationAttributes service method.
 *
 * @return An instance of BFTask. On successful execution, task.result will contain an instance of AWSSNSGetPlatformApplicationAttributesResponse. On failed execution, task.error may contain an NSError with AWSSNSErrorDomain domian and the following error code: AWSSNSErrorInvalidParameter, AWSSNSErrorInternalError, AWSSNSErrorAuthorizationError, AWSSNSErrorNotFound.
 *
 * @see AWSSNSGetPlatformApplicationAttributesInput
 * @see AWSSNSGetPlatformApplicationAttributesResponse
 */
- (BFTask *)getPlatformApplicationAttributes:(AWSSNSGetPlatformApplicationAttributesInput *)request;

/**
 * <p>The <code>GetSubscriptionAttribtues</code> action returns all of the properties of a subscription.</p> 
 *
 * @param request A container for the necessary parameters to execute the GetSubscriptionAttributes service method.
 *
 * @return An instance of BFTask. On successful execution, task.result will contain an instance of AWSSNSGetSubscriptionAttributesResponse. On failed execution, task.error may contain an NSError with AWSSNSErrorDomain domian and the following error code: AWSSNSErrorInvalidParameter, AWSSNSErrorInternalError, AWSSNSErrorNotFound, AWSSNSErrorAuthorizationError.
 *
 * @see AWSSNSGetSubscriptionAttributesInput
 * @see AWSSNSGetSubscriptionAttributesResponse
 */
- (BFTask *)getSubscriptionAttributes:(AWSSNSGetSubscriptionAttributesInput *)request;

/**
 * <p>The <code>GetTopicAttributes</code> action returns all of the properties of a topic.Topic properties returned might differ based on the authorization of the user. </p> 
 *
 * @param request A container for the necessary parameters to execute the GetTopicAttributes service method.
 *
 * @return An instance of BFTask. On successful execution, task.result will contain an instance of AWSSNSGetTopicAttributesResponse. On failed execution, task.error may contain an NSError with AWSSNSErrorDomain domian and the following error code: AWSSNSErrorInvalidParameter, AWSSNSErrorInternalError, AWSSNSErrorNotFound, AWSSNSErrorAuthorizationError.
 *
 * @see AWSSNSGetTopicAttributesInput
 * @see AWSSNSGetTopicAttributesResponse
 */
- (BFTask *)getTopicAttributes:(AWSSNSGetTopicAttributesInput *)request;

/**
 * <p>The <code>ListEndpointsByPlatformApplication</code> action lists the endpoints and endpoint attributes for devices in a supported push notification service, such as GCM and APNS.The results for <code>ListEndpointsByPlatformApplication</code> are paginated and return a limited list of endpoints, up to 100. If additional records are available after the first page results, then a NextToken string will be returned.To receive the next page, you call <code>ListEndpointsByPlatformApplication</code> again using the NextToken string received from the previous call.When there are no more records to return, NextToken will be null. For more information, see <a href="http://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html">Using Amazon SNS Mobile Push Notifications</a>. </p> 
 *
 * @param request A container for the necessary parameters to execute the ListEndpointsByPlatformApplication service method.
 *
 * @return An instance of BFTask. On successful execution, task.result will contain an instance of AWSSNSListEndpointsByPlatformApplicationResponse. On failed execution, task.error may contain an NSError with AWSSNSErrorDomain domian and the following error code: AWSSNSErrorInvalidParameter, AWSSNSErrorInternalError, AWSSNSErrorAuthorizationError, AWSSNSErrorNotFound.
 *
 * @see AWSSNSListEndpointsByPlatformApplicationInput
 * @see AWSSNSListEndpointsByPlatformApplicationResponse
 */
- (BFTask *)listEndpointsByPlatformApplication:(AWSSNSListEndpointsByPlatformApplicationInput *)request;

/**
 * <p>The <code>ListPlatformApplications</code> action lists the platform application objects for the supported push notification services,such as APNS and GCM. The results for <code>ListPlatformApplications</code> are paginated and return a limited list of applications, up to 100. If additional records are available after the first page results, then a NextToken string will be returned.To receive the next page, you call <code>ListPlatformApplications</code> using the NextToken string received from the previous call.When there are no more records to return, NextToken will be null.For more information, see <a href="http://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html">Using Amazon SNS Mobile Push Notifications</a>. </p> 
 *
 * @param request A container for the necessary parameters to execute the ListPlatformApplications service method.
 *
 * @return An instance of BFTask. On successful execution, task.result will contain an instance of AWSSNSListPlatformApplicationsResponse. On failed execution, task.error may contain an NSError with AWSSNSErrorDomain domian and the following error code: AWSSNSErrorInvalidParameter, AWSSNSErrorInternalError, AWSSNSErrorAuthorizationError.
 *
 * @see AWSSNSListPlatformApplicationsInput
 * @see AWSSNSListPlatformApplicationsResponse
 */
- (BFTask *)listPlatformApplications:(AWSSNSListPlatformApplicationsInput *)request;

/**
 * <p>The <code>ListSubscriptions</code> action returns a list of the requester's subscriptions. Each call returns a limited list of subscriptions, up to 100. If there are more subscriptions, a <code>NextToken</code> is also returned. Use the <code>NextToken</code> parameter in anew <code>ListSubscriptions</code> call to get further results.</p> 
 *
 * @param request A container for the necessary parameters to execute the ListSubscriptions service method.
 *
 * @return An instance of BFTask. On successful execution, task.result will contain an instance of AWSSNSListSubscriptionsResponse. On failed execution, task.error may contain an NSError with AWSSNSErrorDomain domian and the following error code: AWSSNSErrorInvalidParameter, AWSSNSErrorInternalError, AWSSNSErrorAuthorizationError.
 *
 * @see AWSSNSListSubscriptionsInput
 * @see AWSSNSListSubscriptionsResponse
 */
- (BFTask *)listSubscriptions:(AWSSNSListSubscriptionsInput *)request;

/**
 * <p>The <code>ListSubscriptionsByTopic</code> action returns a list of the subscriptions to a specific topic. Each call returnsa limited list of subscriptions, up to 100. If there are more subscriptions, a <code>NextToken</code> is also returned. Use the <code>NextToken</code>parameter in a new <code>ListSubscriptionsByTopic</code> call to get further results.</p> 
 *
 * @param request A container for the necessary parameters to execute the ListSubscriptionsByTopic service method.
 *
 * @return An instance of BFTask. On successful execution, task.result will contain an instance of AWSSNSListSubscriptionsByTopicResponse. On failed execution, task.error may contain an NSError with AWSSNSErrorDomain domian and the following error code: AWSSNSErrorInvalidParameter, AWSSNSErrorInternalError, AWSSNSErrorNotFound, AWSSNSErrorAuthorizationError.
 *
 * @see AWSSNSListSubscriptionsByTopicInput
 * @see AWSSNSListSubscriptionsByTopicResponse
 */
- (BFTask *)listSubscriptionsByTopic:(AWSSNSListSubscriptionsByTopicInput *)request;

/**
 * <p>The <code>ListTopics</code> action returns a list of the requester's topics. Each call returns a limited list of topics, up to 100. If there are more topics, a <code>NextToken</code> is also returned. Use the <code>NextToken</code> parameter in a new <code>ListTopics</code> call to get further results.</p> 
 *
 * @param request A container for the necessary parameters to execute the ListTopics service method.
 *
 * @return An instance of BFTask. On successful execution, task.result will contain an instance of AWSSNSListTopicsResponse. On failed execution, task.error may contain an NSError with AWSSNSErrorDomain domian and the following error code: AWSSNSErrorInvalidParameter, AWSSNSErrorInternalError, AWSSNSErrorAuthorizationError.
 *
 * @see AWSSNSListTopicsInput
 * @see AWSSNSListTopicsResponse
 */
- (BFTask *)listTopics:(AWSSNSListTopicsInput *)request;

/**
 * <p>The <code>Publish</code> action sends a message to all of a topic's subscribed endpoints. When a <code>messageId</code> is returned, the message has been saved and Amazon SNS will attempt to deliver itto the topic's subscribers shortly. The format of the outgoing message to each subscribed endpoint depends on the notification protocol selected.</p><p>To use the <code>Publish</code> action for sending a message to a mobile endpoint, such as an app on a Kindle device or mobile phone,you must specify the EndpointArn. The EndpointArn is returned when making a call with the <code>CreatePlatformEndpoint</code> action.The second example below shows a request and response for publishing to a mobile endpoint. </p> 
 *
 * @param request A container for the necessary parameters to execute the Publish service method.
 *
 * @return An instance of BFTask. On successful execution, task.result will contain an instance of AWSSNSPublishResponse. On failed execution, task.error may contain an NSError with AWSSNSErrorDomain domian and the following error code: AWSSNSErrorInvalidParameter, AWSSNSErrorInternalError, AWSSNSErrorNotFound, AWSSNSErrorEndpointDisabled, AWSSNSErrorPlatformApplicationDisabled, AWSSNSErrorAuthorizationError.
 *
 * @see AWSSNSPublishInput
 * @see AWSSNSPublishResponse
 */
- (BFTask *)publish:(AWSSNSPublishInput *)request;

/**
 * <p>The <code>RemovePermission</code> action removes a statement from a topic's access control policy.</p> 
 *
 * @param request A container for the necessary parameters to execute the RemovePermission service method.
 *
 * @return An instance of BFTask. On successful execution, task.result will be nil. On failed execution, task.error may contain an NSError with AWSSNSErrorDomain domian and the following error code: AWSSNSErrorInvalidParameter, AWSSNSErrorInternalError, AWSSNSErrorAuthorizationError, AWSSNSErrorNotFound.
 *
 * @see AWSSNSRemovePermissionInput
 */
- (BFTask *)removePermission:(AWSSNSRemovePermissionInput *)request;

/**
 * <p>The <code>SetEndpointAttributes</code> action sets the attributes for an endpoint for a device on one of the supported push notification services, such as GCM and APNS. For more information, see <a href="http://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html">Using Amazon SNS Mobile Push Notifications</a>. </p> 
 *
 * @param request A container for the necessary parameters to execute the SetEndpointAttributes service method.
 *
 * @return An instance of BFTask. On successful execution, task.result will be nil. On failed execution, task.error may contain an NSError with AWSSNSErrorDomain domian and the following error code: AWSSNSErrorInvalidParameter, AWSSNSErrorInternalError, AWSSNSErrorAuthorizationError, AWSSNSErrorNotFound.
 *
 * @see AWSSNSSetEndpointAttributesInput
 */
- (BFTask *)setEndpointAttributes:(AWSSNSSetEndpointAttributesInput *)request;

/**
 * <p>The <code>SetPlatformApplicationAttributes</code> action sets the attributes of the platform application object for the supported push notification services,such as APNS and GCM. For more information, see <a href="http://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html">Using Amazon SNS Mobile Push Notifications</a>. </p> 
 *
 * @param request A container for the necessary parameters to execute the SetPlatformApplicationAttributes service method.
 *
 * @return An instance of BFTask. On successful execution, task.result will be nil. On failed execution, task.error may contain an NSError with AWSSNSErrorDomain domian and the following error code: AWSSNSErrorInvalidParameter, AWSSNSErrorInternalError, AWSSNSErrorAuthorizationError, AWSSNSErrorNotFound.
 *
 * @see AWSSNSSetPlatformApplicationAttributesInput
 */
- (BFTask *)setPlatformApplicationAttributes:(AWSSNSSetPlatformApplicationAttributesInput *)request;

/**
 * <p>The <code>SetSubscriptionAttributes</code> action allows a subscription owner to set an attribute of the topic to a new value.</p> 
 *
 * @param request A container for the necessary parameters to execute the SetSubscriptionAttributes service method.
 *
 * @return An instance of BFTask. On successful execution, task.result will be nil. On failed execution, task.error may contain an NSError with AWSSNSErrorDomain domian and the following error code: AWSSNSErrorInvalidParameter, AWSSNSErrorInternalError, AWSSNSErrorNotFound, AWSSNSErrorAuthorizationError.
 *
 * @see AWSSNSSetSubscriptionAttributesInput
 */
- (BFTask *)setSubscriptionAttributes:(AWSSNSSetSubscriptionAttributesInput *)request;

/**
 * <p>The <code>SetTopicAttributes</code> action allows a topic owner to set an attribute of the topic to a new value.</p> 
 *
 * @param request A container for the necessary parameters to execute the SetTopicAttributes service method.
 *
 * @return An instance of BFTask. On successful execution, task.result will be nil. On failed execution, task.error may contain an NSError with AWSSNSErrorDomain domian and the following error code: AWSSNSErrorInvalidParameter, AWSSNSErrorInternalError, AWSSNSErrorNotFound, AWSSNSErrorAuthorizationError.
 *
 * @see AWSSNSSetTopicAttributesInput
 */
- (BFTask *)setTopicAttributes:(AWSSNSSetTopicAttributesInput *)request;

/**
 * <p>The <code>Subscribe</code> action prepares to subscribe an endpoint by sending the endpoint a confirmation message. To actually create a subscription, the endpoint owner must call the <code>ConfirmSubscription</code> action with the token from the confirmation message. Confirmation tokens are valid for three days.</p> 
 *
 * @param request A container for the necessary parameters to execute the Subscribe service method.
 *
 * @return An instance of BFTask. On successful execution, task.result will contain an instance of AWSSNSSubscribeResponse. On failed execution, task.error may contain an NSError with AWSSNSErrorDomain domian and the following error code: AWSSNSErrorSubscriptionLimitExceeded, AWSSNSErrorInvalidParameter, AWSSNSErrorInternalError, AWSSNSErrorNotFound, AWSSNSErrorAuthorizationError.
 *
 * @see AWSSNSSubscribeInput
 * @see AWSSNSSubscribeResponse
 */
- (BFTask *)subscribe:(AWSSNSSubscribeInput *)request;

/**
 * <p>The <code>Unsubscribe</code> action deletes a subscription. If the subscription requires authentication fordeletion, only the owner of the subscription or the topic's ownercan unsubscribe, and an AWS signature is required. If the<code>Unsubscribe</code> call does not require authentication and the requester is notthe subscription owner, a final cancellation message is delivered to theendpoint, so that the endpoint owner can easily resubscribe to the topic ifthe <code>Unsubscribe</code> request was unintended.</p> 
 *
 * @param request A container for the necessary parameters to execute the Unsubscribe service method.
 *
 * @return An instance of BFTask. On successful execution, task.result will be nil. On failed execution, task.error may contain an NSError with AWSSNSErrorDomain domian and the following error code: AWSSNSErrorInvalidParameter, AWSSNSErrorInternalError, AWSSNSErrorAuthorizationError, AWSSNSErrorNotFound.
 *
 * @see AWSSNSUnsubscribeInput
 */
- (BFTask *)unsubscribe:(AWSSNSUnsubscribeInput *)request;

@end
