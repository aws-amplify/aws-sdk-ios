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
#import "AWSNetworking.h"
#import "AZModel.h"

FOUNDATION_EXPORT NSString *const AWSSNSErrorDomain;

typedef NS_ENUM(NSInteger, AWSSNSErrorType) {
    AWSSNSErrorUnknown,
    AWSSNSErrorIncompleteSignature,
    AWSSNSErrorInvalidClientTokenId,
    AWSSNSErrorMissingAuthenticationToken,
    AWSSNSErrorAuthorizationError,
    AWSSNSErrorEndpointDisabled,
    AWSSNSErrorInternalError,
    AWSSNSErrorInvalidParameter,
    AWSSNSErrorNotFound,
    AWSSNSErrorPlatformApplicationDisabled,
    AWSSNSErrorSubscriptionLimitExceeded,
    AWSSNSErrorTopicLimitExceeded,
};

@class AWSSNSAddPermissionInput;
@class AWSSNSConfirmSubscriptionInput;
@class AWSSNSConfirmSubscriptionResponse;
@class AWSSNSCreateEndpointResponse;
@class AWSSNSCreatePlatformApplicationInput;
@class AWSSNSCreatePlatformApplicationResponse;
@class AWSSNSCreatePlatformEndpointInput;
@class AWSSNSCreateTopicInput;
@class AWSSNSCreateTopicResponse;
@class AWSSNSDeleteEndpointInput;
@class AWSSNSDeletePlatformApplicationInput;
@class AWSSNSDeleteTopicInput;
@class AWSSNSEndpoint;
@class AWSSNSGetEndpointAttributesInput;
@class AWSSNSGetEndpointAttributesResponse;
@class AWSSNSGetPlatformApplicationAttributesInput;
@class AWSSNSGetPlatformApplicationAttributesResponse;
@class AWSSNSGetSubscriptionAttributesInput;
@class AWSSNSGetSubscriptionAttributesResponse;
@class AWSSNSGetTopicAttributesInput;
@class AWSSNSGetTopicAttributesResponse;
@class AWSSNSListEndpointsByPlatformApplicationInput;
@class AWSSNSListEndpointsByPlatformApplicationResponse;
@class AWSSNSListPlatformApplicationsInput;
@class AWSSNSListPlatformApplicationsResponse;
@class AWSSNSListSubscriptionsByTopicInput;
@class AWSSNSListSubscriptionsByTopicResponse;
@class AWSSNSListSubscriptionsInput;
@class AWSSNSListSubscriptionsResponse;
@class AWSSNSListTopicsInput;
@class AWSSNSListTopicsResponse;
@class AWSSNSPlatformApplication;
@class AWSSNSPublishInput;
@class AWSSNSPublishResponse;
@class AWSSNSRemovePermissionInput;
@class AWSSNSSetEndpointAttributesInput;
@class AWSSNSSetPlatformApplicationAttributesInput;
@class AWSSNSSetSubscriptionAttributesInput;
@class AWSSNSSetTopicAttributesInput;
@class AWSSNSSubscribeInput;
@class AWSSNSSubscribeResponse;
@class AWSSNSSubscription;
@class AWSSNSTopic;
@class AWSSNSUnsubscribeInput;

@interface AWSSNSAddPermissionInput : AWSRequest


/**
 * <p>The AWS account IDs of the users (principals) who will be given access to the specified actions. The users must have AWS accounts, but do not need to be signed upfor this service. <!--For information about locating the AWS account identification, see <a href="http://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/index.html?AWSCredentials.html">Your AWS Identifiers</aulink> in the &service; Developer Guide.--></p>
 */
@property (nonatomic, strong) NSArray *AWSAccountId;

/**
 * <p>The action you want to allow for the specified principal(s).</p><p>Valid values: any Amazon SNS action name.</p>
 */
@property (nonatomic, strong) NSArray *actionName;

/**
 * <p>A unique identifier for the new policy statement.</p>
 */
@property (nonatomic, strong) NSString *label;

/**
 * <p>The ARN of the topic whose access control policy you wish to modify.</p>
 */
@property (nonatomic, strong) NSString *topicArn;

@end

/**
 * Input for ConfirmSubscription action.
 * Required parameters: [TopicArn, Token]
 */
@interface AWSSNSConfirmSubscriptionInput : AWSRequest


/**
 * <p>Disallows unauthenticated unsubscribes of the subscription.If the value of this parameter is <code>true</code> and the request has an AWS signature, then only the topic owner and the subscription owner can unsubscribe the endpoint.The unsubscribe action requires AWS authentication. </p>
 */
@property (nonatomic, strong) NSString *authenticateOnUnsubscribe;

/**
 * <p>Short-lived token sent to an endpoint during the <code>Subscribe</code> action.</p>
 */
@property (nonatomic, strong) NSString *token;

/**
 * <p>The ARN of the topic for which you wish to confirm a subscription.</p>
 */
@property (nonatomic, strong) NSString *topicArn;

@end

/**
 * Response for ConfirmSubscriptions action.
 */
@interface AWSSNSConfirmSubscriptionResponse : AZModel


/**
 * <p>The ARN of the created subscription.</p>
 */
@property (nonatomic, strong) NSString *subscriptionArn;

@end

/**
 * <p>Response from CreateEndpoint action.</p>
 */
@interface AWSSNSCreateEndpointResponse : AZModel


/**
 * <p>EndpointArn returned from CreateEndpoint action.</p>
 */
@property (nonatomic, strong) NSString *endpointArn;

@end

/**
 * <p>Input for CreatePlatformApplication action.</p>
 * Required parameters: [Name, Platform, Attributes]
 */
@interface AWSSNSCreatePlatformApplicationInput : AWSRequest


/**
 * <p>For a list of attributes, see <a href="http://docs.aws.amazon.com/sns/latest/api/API_SetPlatformApplicationAttributes.html">SetPlatformApplicationAttributes</a></p>
 */
@property (nonatomic, strong) NSDictionary *attributes;

/**
 * <p>Application names must be made up of only uppercase and lowercase ASCII letters, numbers, underscores, hyphens, and periods, and must be between 1 and 256 characters long.</p>
 */
@property (nonatomic, strong) NSString *name;

/**
 * <p>The following platforms are supported: ADM (Amazon Device Messaging), APNS (Apple Push Notification Service), APNS_SANDBOX, and GCM (Google Cloud Messaging).</p>
 */
@property (nonatomic, strong) NSString *platform;

@end

/**
 * <p>Response from CreatePlatformApplication action.</p>
 */
@interface AWSSNSCreatePlatformApplicationResponse : AZModel


/**
 * <p>PlatformApplicationArn is returned.</p>
 */
@property (nonatomic, strong) NSString *platformApplicationArn;

@end

/**
 * <p>Input for CreatePlatformEndpoint action.</p>
 * Required parameters: [PlatformApplicationArn, Token]
 */
@interface AWSSNSCreatePlatformEndpointInput : AWSRequest


/**
 * <p>For a list of attributes, see <a href="http://docs.aws.amazon.com/sns/latest/api/API_SetEndpointAttributes.html">SetEndpointAttributes</a>.</p>
 */
@property (nonatomic, strong) NSDictionary *attributes;

/**
 * <p>Arbitrary user data to associate with the endpoint. SNS does not use this data. The data must be in UTF-8 format and less than 2KB.</p>
 */
@property (nonatomic, strong) NSString *customUserData;

/**
 * <p>PlatformApplicationArn returned from CreatePlatformApplication is used to create a an endpoint.</p>
 */
@property (nonatomic, strong) NSString *platformApplicationArn;

/**
 * <p>Unique identifier created by the notification service for an app on a device.The specific name for Token will vary, depending on which notification service is being used.For example, when using APNS as the notification service, you need the device token.Alternatively, when using GCM or ADM, the device token equivalent is called the registration ID.</p>
 */
@property (nonatomic, strong) NSString *token;

@end

/**
 * <p>Input for CreateTopic action.</p>
 * Required parameters: [Name]
 */
@interface AWSSNSCreateTopicInput : AWSRequest


/**
 * <p>The name of the topic you want to create.</p><p>Constraints: Topic names must be made up ofonly uppercase and lowercase ASCII letters, numbers, underscores, and hyphens, and must bebetween 1 and 256 characters long. </p>
 */
@property (nonatomic, strong) NSString *name;

@end

/**
 * <p>Response from CreateTopic action.</p>
 */
@interface AWSSNSCreateTopicResponse : AZModel


/**
 * <p>The Amazon Resource Name (ARN) assigned to the created topic.</p>
 */
@property (nonatomic, strong) NSString *topicArn;

@end

/**
 * <p>Input for DeleteEndpoint action.</p>
 * Required parameters: [EndpointArn]
 */
@interface AWSSNSDeleteEndpointInput : AWSRequest


/**
 * <p>EndpointArn of endpoint to delete.</p>
 */
@property (nonatomic, strong) NSString *endpointArn;

@end

/**
 * <p>Input for DeletePlatformApplication action.</p>
 * Required parameters: [PlatformApplicationArn]
 */
@interface AWSSNSDeletePlatformApplicationInput : AWSRequest


/**
 * <p>PlatformApplicationArn of platform application object to delete.</p>
 */
@property (nonatomic, strong) NSString *platformApplicationArn;

@end

@interface AWSSNSDeleteTopicInput : AWSRequest


/**
 * <p>The ARN of the topic you want to delete.</p> 
 */
@property (nonatomic, strong) NSString *topicArn;

@end

/**
 * <p>Endpoint for mobile app and device.</p>
 */
@interface AWSSNSEndpoint : AZModel


/**
 * <p>Attributes for endpoint.</p>
 */
@property (nonatomic, strong) NSDictionary *attributes;

/**
 * <p>EndpointArn for mobile app and device.</p>
 */
@property (nonatomic, strong) NSString *endpointArn;

@end

/**
 * <p>Input for GetEndpointAttributes action.</p>
 * Required parameters: [EndpointArn]
 */
@interface AWSSNSGetEndpointAttributesInput : AWSRequest


/**
 * <p>EndpointArn for GetEndpointAttributes input.</p>
 */
@property (nonatomic, strong) NSString *endpointArn;

@end

/**
 * <p>Response from GetEndpointAttributes of the EndpointArn.</p>
 */
@interface AWSSNSGetEndpointAttributesResponse : AZModel


/**
 * <p>Attributes include the following:</p><ul><!-- Policy is not yet supported. Will remove comments once it is available --><li><code>CustomUserData</code> -- arbitrary user data to associate with the endpoint. SNS does not use this data. The data must be in UTF-8 format and less than 2KB.</li><li><code>Enabled</code> -- flag that enables/disables delivery to the endpoint.Message Processor will set this to false when a notification service indicates to SNS that the endpoint is invalid.Users can set it back to true, typically after updating Token.</li><!-- <li><code>Policy</code>access policy controlling who can send messages to this endpoint .</li> --><li><code>Token</code> -- device token, also referred to as a registration id, for an app and mobile device.This is returned from the notification service when an app and mobile device are registered with the notification service.</li></ul>
 */
@property (nonatomic, strong) NSDictionary *attributes;

@end

/**
 * <p>Input for GetPlatformApplicationAttributes action.</p>
 * Required parameters: [PlatformApplicationArn]
 */
@interface AWSSNSGetPlatformApplicationAttributesInput : AWSRequest


/**
 * <p>PlatformApplicationArn for GetPlatformApplicationAttributesInput.</p>
 */
@property (nonatomic, strong) NSString *platformApplicationArn;

@end

/**
 * <p>Response for GetPlatformApplicationAttributes action.</p>
 */
@interface AWSSNSGetPlatformApplicationAttributesResponse : AZModel


/**
 * <p>Attributes include the following:</p><ul><!-- AllowEndpointPolicies, EventDeliveryAttemptFailure, and Policy are not yet supported. Will remove comments once it is available --><!-- <li><code>AllowEndpointPolicies</code>true or false (default false) - If true, then policies on endpoints will be evaluated to determine if the topic or user has the rights to send messages to it. If false, the endpoint policy will be ignored and only the mobile app policy will be considered.</li> --><li><code>EventEndpointCreated</code> -- Topic ARN to which EndpointCreated event notifications should be sent.</li><li><code>EventEndpointDeleted</code> -- Topic ARN to which EndpointDeleted event notifications should be sent.</li><li><code>EventEndpointUpdated</code> -- Topic ARN to which EndpointUpdate event notifications should be sent.</li><!-- <li><code>EventDeliveryAttemptFailure</code>Topic ARN to which DeliveryAttemptFailure event notifications should be sent upon Direct Publish delivery attempt failures to one of the application's endpoints.</li> --><li><code>EventDeliveryFailure</code> -- Topic ARN to which DeliveryFailure event notifications should be sent upon Direct Publish delivery failure (permanent) to one of the application's endpoints.</li><!-- <li><code>Policy</code> Access policy controlling who can send messages to endpoints under this mobile app.</li> --></ul>
 */
@property (nonatomic, strong) NSDictionary *attributes;

@end

/**
 * <p>Input for GetSubscriptionAttributes.</p>
 * Required parameters: [SubscriptionArn]
 */
@interface AWSSNSGetSubscriptionAttributesInput : AWSRequest


/**
 * <p>The ARN of the subscription whose properties you want to get.</p>
 */
@property (nonatomic, strong) NSString *subscriptionArn;

@end

/**
 * <p>Response for GetSubscriptionAttributes action.</p>
 */
@interface AWSSNSGetSubscriptionAttributesResponse : AZModel


/**
 * <p>A map of the subscription's attributes. Attributes in this map include the following:</p><ul><li><code>SubscriptionArn</code> -- the subscription's ARN</li><li><code>TopicArn</code> -- the topic ARN that the subscription is associated with</li><li><code>Owner</code> -- the AWS account ID of the subscription's owner</li><li><code>ConfirmationWasAuthenticated</code> -- true if the subscription confirmation request was authenticated</li><li><code>DeliveryPolicy</code> -- the JSON serialization of the subscription's delivery policy</li><li><code>EffectiveDeliveryPolicy</code> -- the JSON serialization of the effective delivery policy that takesinto account the topic delivery policy and account system defaults</li></ul>
 */
@property (nonatomic, strong) NSDictionary *attributes;

@end

/**
 * <p>Input for GetTopicAttributes action.</p>
 * Required parameters: [TopicArn]
 */
@interface AWSSNSGetTopicAttributesInput : AWSRequest


/**
 * <p>The ARN of the topic whose properties you want to get.</p>
 */
@property (nonatomic, strong) NSString *topicArn;

@end

/**
 * <p>Response for GetTopicAttributes action.</p>
 */
@interface AWSSNSGetTopicAttributesResponse : AZModel


/**
 * <p>A map of the topic's attributes. Attributes in this map include the following:</p><ul><li><code>TopicArn</code> -- the topic's ARN</li><li><code>Owner</code> -- the AWS account ID of the topic's owner</li><li><code>Policy</code> -- the JSON serialization of the topic's access control policy</li><li><code>DisplayName</code> -- the human-readable name used in the "From" field for notifications to email and email-json endpoints</li><li><code>SubscriptionsPending</code> -- the number of subscriptions pending confirmation on this topic</li><li><code>SubscriptionsConfirmed</code> -- the number of confirmed subscriptions on this topic</li><li><code>SubscriptionsDeleted</code> -- the number of deleted subscriptions on this topic</li><li><code>DeliveryPolicy</code> -- the JSON serialization of the topic's delivery policy</li><li><code>EffectiveDeliveryPolicy</code> -- the JSON serialization of the effective delivery policy that takes into account system defaults</li></ul>
 */
@property (nonatomic, strong) NSDictionary *attributes;

@end

/**
 * <p>Input for ListEndpointsByPlatformApplication action.</p>
 * Required parameters: [PlatformApplicationArn]
 */
@interface AWSSNSListEndpointsByPlatformApplicationInput : AWSRequest


/**
 * <p>NextToken string is used when calling ListEndpointsByPlatformApplication action to retrieve additional records that are available after the first page results.</p>
 */
@property (nonatomic, strong) NSString *nextToken;

/**
 * <p>PlatformApplicationArn for ListEndpointsByPlatformApplicationInput action.</p>
 */
@property (nonatomic, strong) NSString *platformApplicationArn;

@end

/**
 * <p>Response for ListEndpointsByPlatformApplication action.</p>
 */
@interface AWSSNSListEndpointsByPlatformApplicationResponse : AZModel


/**
 * <p>Endpoints returned for ListEndpointsByPlatformApplication action.</p>
 */
@property (nonatomic, strong) NSArray *endpoints;

/**
 * <p>NextToken string is returned when calling ListEndpointsByPlatformApplication action if additional records are available after the first page results.</p>
 */
@property (nonatomic, strong) NSString *nextToken;

@end

/**
 * <p>Input for ListPlatformApplications action.</p>
 */
@interface AWSSNSListPlatformApplicationsInput : AWSRequest


/**
 * <p>NextToken string is used when calling ListPlatformApplications action to retrieve additional records that are available after the first page results.</p>
 */
@property (nonatomic, strong) NSString *nextToken;

@end

/**
 * <p>Response for ListPlatformApplications action.</p>
 */
@interface AWSSNSListPlatformApplicationsResponse : AZModel


/**
 * <p>NextToken string is returned when calling ListPlatformApplications action if additional records are available after the first page results.</p>
 */
@property (nonatomic, strong) NSString *nextToken;

/**
 * <p>Platform applications returned when calling ListPlatformApplications action.</p>
 */
@property (nonatomic, strong) NSArray *platformApplications;

@end

/**
 * <p>Input for ListSubscriptionsByTopic action.</p>
 * Required parameters: [TopicArn]
 */
@interface AWSSNSListSubscriptionsByTopicInput : AWSRequest


/**
 * <p>Token returned by the previous <code>ListSubscriptionsByTopic</code> request.</p>
 */
@property (nonatomic, strong) NSString *nextToken;

/**
 * <p>The ARN of the topic for which you wish to find subscriptions.</p>
 */
@property (nonatomic, strong) NSString *topicArn;

@end

/**
 * <p>Response for ListSubscriptionsByTopic action.</p>
 */
@interface AWSSNSListSubscriptionsByTopicResponse : AZModel


/**
 * <p>Token to pass along to the next <code>ListSubscriptionsByTopic</code> request. This element is returned if there are more subscriptions to retrieve.</p>
 */
@property (nonatomic, strong) NSString *nextToken;

/**
 * <p>A list of subscriptions.</p>
 */
@property (nonatomic, strong) NSArray *subscriptions;

@end

/**
 * Input for ListSubscriptions action.
 */
@interface AWSSNSListSubscriptionsInput : AWSRequest


/**
 * <p>Token returned by the previous <code>ListSubscriptions</code> request.</p>
 */
@property (nonatomic, strong) NSString *nextToken;

@end

@interface AWSSNSListSubscriptionsResponse : AZModel


/**
 * <p>Token to pass along to the next <code>ListSubscriptions</code> request. This element is returned if there are more subscriptions to retrieve.</p>
 */
@property (nonatomic, strong) NSString *nextToken;

/**
 * <p>A list of subscriptions.</p>
 */
@property (nonatomic, strong) NSArray *subscriptions;

@end

@interface AWSSNSListTopicsInput : AWSRequest


/**
 * <p>Token returned by the previous <code>ListTopics</code> request.</p>
 */
@property (nonatomic, strong) NSString *nextToken;

@end

/**
 * <p>Response for ListTopics action.</p>
 */
@interface AWSSNSListTopicsResponse : AZModel


/**
 * <p>Token to pass along to the next <code>ListTopics</code> request. This element is returned if there are additional topics to retrieve.</p>
 */
@property (nonatomic, strong) NSString *nextToken;

/**
 * <p>A list of topic ARNs.</p>
 */
@property (nonatomic, strong) NSArray *topics;

@end

/**
 * <p>Platform application object.</p>
 */
@interface AWSSNSPlatformApplication : AZModel


/**
 * <p>Attributes for platform application object.</p>
 */
@property (nonatomic, strong) NSDictionary *attributes;

/**
 * <p>PlatformApplicationArn for platform application object.</p>
 */
@property (nonatomic, strong) NSString *platformApplicationArn;

@end

/**
 * <p>Input for Publish action.</p>
 * Required parameters: [Message]
 */
@interface AWSSNSPublishInput : AWSRequest


/**
 * <p>The message you want to send to the topic.</p><p>If you want to send the same message to all transport protocols,include the text of the message as a String value.</p><p>If you want to send different messages for each transport protocol,set the value of the <code>MessageStructure</code> parameter to <code>json</code>and use a JSON object for the <code>Message</code> parameter.See the Examples section for the format of the JSON object. </p><p>Constraints: Messages must be UTF-8 encoded strings at most 256 KB in size (262144 bytes, not 262144 characters).</p><p>JSON-specific constraints: <ul><li>Keys in the JSON object that correspond to supported transport protocols must have simple JSON string values. </li><li>The values will be parsed (unescaped) before they are used in outgoing messages.</li><li>Outbound notifications are JSON encoded (meaning that the characters will be reescaped for sending).</li><li>Values have a minimum length of 0 (the empty string, "", is allowed).</li><li>Values have a maximum length bounded by the overall message size (so, including multiple protocols may limit message sizes).</li><li>Non-string values will cause the key to be ignored.</li><li>Keys that do not correspond to supported transport protocols are ignored.</li><li>Duplicate keys are not allowed.</li><li>Failure to parse or validate any key or value in the message will cause the <code>Publish</code> call to return an error (no partial delivery).</li></ul></p>
 */
@property (nonatomic, strong) NSString *message;

/**
 * <p>Set <code>MessageStructure</code> to <code>json</code> if you want to send a different message for each protocol. For example, using one publish action, you can send a short message to your SMS subscribers and a longer message to your email subscribers. If you set <code>MessageStructure</code> to <code>json</code>, the value ofthe <code>Message</code> parameter must: </p><ul><li>be a syntactically valid JSON object; and</li><li>contain at least a top-level JSON key of "default" with a value that is a string.</li></ul><p> You can define other top-level keys that define the message you want to send to a specific transport protocol (e.g., "http"). </p><p>For information about sending different messages for each protocol using the AWS Management Console, go to <a href="http://docs.aws.amazon.com/sns/latest/gsg/Publish.html#sns-message-formatting-by-protocol">CreateDifferent Messages for Each Protocol</a> in the <i>Amazon Simple Notification Service Getting Started Guide</i>. </p><p>Valid value: <code>json</code></p>
 */
@property (nonatomic, strong) NSString *messageStructure;

/**
 * <p>Optional parameter to be used as the "Subject" line when the message is delivered to email endpoints. This field will also be included, if present,in the standard JSON messages delivered to other endpoints.</p><p>Constraints: Subjects must be ASCII text that begins with a letter, number,or punctuation mark; must not include line breaks or control characters; andmust be less than 100 characters long.</p>
 */
@property (nonatomic, strong) NSString *subject;

/**
 * <p>Either TopicArn or EndpointArn, but not both.</p>
 */
@property (nonatomic, strong) NSString *targetArn;

/**
 * <p>The topic you want to publish to.</p>
 */
@property (nonatomic, strong) NSString *topicArn;

@end

/**
 * <p>Response for Publish action.</p>
 */
@interface AWSSNSPublishResponse : AZModel


/**
 * <p>Unique identifier assigned to the published message.</p><p>Length Constraint: Maximum 100 characters</p>
 */
@property (nonatomic, strong) NSString *messageId;

@end

/**
 * <p>Input for RemovePermission action.</p>
 * Required parameters: [TopicArn, Label]
 */
@interface AWSSNSRemovePermissionInput : AWSRequest


/**
 * <p>The unique label of the statement you want to remove.</p>
 */
@property (nonatomic, strong) NSString *label;

/**
 * <p>The ARN of the topic whose access control policy you wish to modify.</p>
 */
@property (nonatomic, strong) NSString *topicArn;

@end

/**
 * <p>Input for SetEndpointAttributes action.</p>
 * Required parameters: [EndpointArn, Attributes]
 */
@interface AWSSNSSetEndpointAttributesInput : AWSRequest


/**
 * <p>A map of the endpoint attributes. Attributes in this map include the following:</p><ul><!-- Policy is not yet supported. Will remove comments once it is available --><li><code>CustomUserData</code> -- arbitrary user data to associate with the endpoint. SNS does not use this data. The data must be in UTF-8 format and less than 2KB.</li><li><code>Enabled</code> -- flag that enables/disables delivery to the endpoint.Message Processor will set this to false when a notification service indicates to SNS that the endpoint is invalid.Users can set it back to true, typically after updating Token.</li><!-- <li><code>Policy</code>access policy controlling who can send messages to this endpoint .</li> --><li><code>Token</code> -- device token, also referred to as a registration id, for an app and mobile device.This is returned from the notification service when an app and mobile device are registered with the notification service.</li></ul>
 */
@property (nonatomic, strong) NSDictionary *attributes;

/**
 * <p>EndpointArn used for SetEndpointAttributes action.</p>
 */
@property (nonatomic, strong) NSString *endpointArn;

@end

/**
 * <p>Input for SetPlatformApplicationAttributes action.</p>
 * Required parameters: [PlatformApplicationArn, Attributes]
 */
@interface AWSSNSSetPlatformApplicationAttributesInput : AWSRequest


/**
 * <p>A map of the platform application attributes. Attributes in this map include the following:</p><ul><!-- AllowEndpointPolicies, EventDeliveryAttemptFailure, and Policy are not yet supported. Will remove comments once it is available --><li><code>PlatformCredential</code> -- The credential received from the notification service. For APNS/APNS_SANDBOX, PlatformCredential is "private key".For GCM, PlatformCredential is "API key". For ADM,<!--, WNS and MPNS--> PlatformCredential is "client secret".</li><li><code>PlatformPrincipal</code> -- The principal received from the notification service. For APNS/APNS_SANDBOX, PlatformPrincipal is "SSL certificate".For GCM, PlatformPrincipal is not applicable. For ADM,<!--, WNS and MPNS--> PlatformPrincipal is "client id".</li><!-- <li><code>AllowEndpointPolicies</code>true or false (default false) - If true, then policies on endpoints will be evaluated to determine if the topic or user has the rights to send messages to it. If false, the endpoint policy will be ignored and only the mobile app policy will be considered.</li> --><li><code>EventEndpointCreated</code> -- Topic ARN to which EndpointCreated event notifications should be sent.</li><li><code>EventEndpointDeleted</code> -- Topic ARN to which EndpointDeleted event notifications should be sent.</li><li><code>EventEndpointUpdated</code> -- Topic ARN to which EndpointUpdate event notifications should be sent.</li><!-- <li><code>EventDeliveryAttemptFailure</code>Topic ARN to which DeliveryAttemptFailure event notifications should be sent upon Direct Publish delivery attempt failures to one of the application's endpoints.</li> --><li><code>EventDeliveryFailure</code> -- Topic ARN to which DeliveryFailure event notifications should be sent upon Direct Publish delivery failure (permanent) to one of the application's endpoints.</li><!-- <li><code>Policy</code> Access policy controlling who can send messages to endpoints under this mobile app.</li> --></ul>
 */
@property (nonatomic, strong) NSDictionary *attributes;

/**
 * <p>PlatformApplicationArn for SetPlatformApplicationAttributes action.</p>
 */
@property (nonatomic, strong) NSString *platformApplicationArn;

@end

/**
 * <p>Input for SetSubscriptionAttributes action.</p>
 * Required parameters: [SubscriptionArn, AttributeName]
 */
@interface AWSSNSSetSubscriptionAttributesInput : AWSRequest


/**
 * <p>The name of the attribute you want to set. Only a subset of the subscriptions attributes are mutable.</p><p>Valid values: <code>DeliveryPolicy</code></p>
 */
@property (nonatomic, strong) NSString *attributeName;

/**
 * <p>The new value for the attribute in JSON format.</p>
 */
@property (nonatomic, strong) NSString *attributeValue;

/**
 * <p>The ARN of the subscription to modify.</p>
 */
@property (nonatomic, strong) NSString *subscriptionArn;

@end

/**
 * <p>Input for SetTopicAttributes action.</p>
 * Required parameters: [TopicArn, AttributeName]
 */
@interface AWSSNSSetTopicAttributesInput : AWSRequest


/**
 * <p>The name of the attribute you want to set. Only a subset of the topic's attributes are mutable.</p><p>Valid values: <code>Policy</code> | <code>DisplayName</code> | <code>DeliveryPolicy</code></p>
 */
@property (nonatomic, strong) NSString *attributeName;

/**
 * <p>The new value for the attribute.</p>
 */
@property (nonatomic, strong) NSString *attributeValue;

/**
 * <p>The ARN of the topic to modify.</p>
 */
@property (nonatomic, strong) NSString *topicArn;

@end

/**
 * Input for Subscribe action.
 * Required parameters: [TopicArn, Protocol]
 */
@interface AWSSNSSubscribeInput : AWSRequest


/**
 * <p>The endpoint that you want to receive notifications. Endpoints vary by protocol:</p><ul><li>For the <code>http</code> protocol, the endpoint is an URL beginning with "http://"</li><li>For the <code>https</code> protocol, the endpoint is a URL beginning with "https://"</li><li>For the <code>email</code> protocol, the endpoint is an email address</li><li>For the <code>email-json</code> protocol, the endpoint is an email address</li><li>For the <code>sms</code> protocol, the endpoint is a phone number of an SMS-enabled device</li><li>For the <code>sqs</code> protocol, the endpoint is the ARN of an Amazon SQS queue</li><li>For the <code>application</code> protocol, the endpoint is the EndpointArn of a mobile app and device.</li></ul>
 */
@property (nonatomic, strong) NSString *endpoint;

/**
 * <p>The protocol you want to use. Supported protocols include:</p><ul><li><code>http</code> -- delivery of JSON-encoded message via HTTP POST</li><li><code>https</code> -- delivery of JSON-encoded message via HTTPS POST</li><li><code>email</code> -- delivery of message via SMTP</li><li><code>email-json</code> -- delivery of JSON-encoded message via SMTP</li><li><code>sms</code> -- delivery of message via SMS</li><li><code>sqs</code> -- delivery of JSON-encoded message to an Amazon SQS queue</li><li><code>application</code> -- delivery of JSON-encoded message to an EndpointArn for a mobile app and device.</li></ul>
 */
@property (nonatomic, strong) NSString *protocol;

/**
 * <p>The ARN of the topic you want to subscribe to.</p>
 */
@property (nonatomic, strong) NSString *topicArn;

@end

/**
 * Response for Subscribe action.
 */
@interface AWSSNSSubscribeResponse : AZModel


/**
 * <p>The ARN of the subscription, if the service was able to create asubscription immediately (without requiring endpoint owner confirmation).</p>
 */
@property (nonatomic, strong) NSString *subscriptionArn;

@end

/**
 * <p>A wrapper type for the attributes of an SNS subscription.</p>
 */
@interface AWSSNSSubscription : AZModel


/**
 * <p>The subscription's endpoint (format depends on the protocol).</p>
 */
@property (nonatomic, strong) NSString *endpoint;

/**
 * <p>The subscription's owner.</p>
 */
@property (nonatomic, strong) NSString *owner;

/**
 * <p>The subscription's protocol.</p>
 */
@property (nonatomic, strong) NSString *protocol;

/**
 * <p>The subscription's ARN.</p>
 */
@property (nonatomic, strong) NSString *subscriptionArn;

/**
 * <p>The ARN of the subscription's topic.</p>
 */
@property (nonatomic, strong) NSString *topicArn;

@end

/**
 * <p>A wrapper type for the topic's Amazon Resource Name (ARN). To retrieve a topic's attributes, use <code>GetTopicAttributes</code>.</p>
 */
@interface AWSSNSTopic : AZModel


/**
 * <p>The topic's ARN.</p>
 */
@property (nonatomic, strong) NSString *topicArn;

@end

/**
 * <p>Input for Unsubscribe action.</p>
 * Required parameters: [SubscriptionArn]
 */
@interface AWSSNSUnsubscribeInput : AWSRequest


/**
 * <p>The ARN of the subscription to be deleted.</p>
 */
@property (nonatomic, strong) NSString *subscriptionArn;

@end
