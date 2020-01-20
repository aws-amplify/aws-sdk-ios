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
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSModel.h>

NS_ASSUME_NONNULL_BEGIN

FOUNDATION_EXPORT NSString *const AWSSNSErrorDomain;

typedef NS_ENUM(NSInteger, AWSSNSErrorType) {
    AWSSNSErrorUnknown,
    AWSSNSErrorAuthorizationError,
    AWSSNSErrorConcurrentAccess,
    AWSSNSErrorEndpointDisabled,
    AWSSNSErrorFilterPolicyLimitExceeded,
    AWSSNSErrorInternalError,
    AWSSNSErrorInvalidParameter,
    AWSSNSErrorInvalidParameterValue,
    AWSSNSErrorInvalidSecurity,
    AWSSNSErrorKMSAccessDenied,
    AWSSNSErrorKMSDisabled,
    AWSSNSErrorKMSInvalidState,
    AWSSNSErrorKMSNotFound,
    AWSSNSErrorKMSOptInRequired,
    AWSSNSErrorKMSThrottling,
    AWSSNSErrorNotFound,
    AWSSNSErrorPlatformApplicationDisabled,
    AWSSNSErrorResourceNotFound,
    AWSSNSErrorStaleTag,
    AWSSNSErrorSubscriptionLimitExceeded,
    AWSSNSErrorTagLimitExceeded,
    AWSSNSErrorTagPolicy,
    AWSSNSErrorThrottled,
    AWSSNSErrorTopicLimitExceeded,
};

@class AWSSNSAddPermissionInput;
@class AWSSNSCheckIfPhoneNumberIsOptedOutInput;
@class AWSSNSCheckIfPhoneNumberIsOptedOutResponse;
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
@class AWSSNSGetSMSAttributesInput;
@class AWSSNSGetSMSAttributesResponse;
@class AWSSNSGetSubscriptionAttributesInput;
@class AWSSNSGetSubscriptionAttributesResponse;
@class AWSSNSGetTopicAttributesInput;
@class AWSSNSGetTopicAttributesResponse;
@class AWSSNSListEndpointsByPlatformApplicationInput;
@class AWSSNSListEndpointsByPlatformApplicationResponse;
@class AWSSNSListPhoneNumbersOptedOutInput;
@class AWSSNSListPhoneNumbersOptedOutResponse;
@class AWSSNSListPlatformApplicationsInput;
@class AWSSNSListPlatformApplicationsResponse;
@class AWSSNSListSubscriptionsByTopicInput;
@class AWSSNSListSubscriptionsByTopicResponse;
@class AWSSNSListSubscriptionsInput;
@class AWSSNSListSubscriptionsResponse;
@class AWSSNSListTagsForResourceRequest;
@class AWSSNSListTagsForResourceResponse;
@class AWSSNSListTopicsInput;
@class AWSSNSListTopicsResponse;
@class AWSSNSMessageAttributeValue;
@class AWSSNSOptInPhoneNumberInput;
@class AWSSNSOptInPhoneNumberResponse;
@class AWSSNSPlatformApplication;
@class AWSSNSPublishInput;
@class AWSSNSPublishResponse;
@class AWSSNSRemovePermissionInput;
@class AWSSNSSetEndpointAttributesInput;
@class AWSSNSSetPlatformApplicationAttributesInput;
@class AWSSNSSetSMSAttributesInput;
@class AWSSNSSetSMSAttributesResponse;
@class AWSSNSSetSubscriptionAttributesInput;
@class AWSSNSSetTopicAttributesInput;
@class AWSSNSSubscribeInput;
@class AWSSNSSubscribeResponse;
@class AWSSNSSubscription;
@class AWSSNSTag;
@class AWSSNSTagResourceRequest;
@class AWSSNSTagResourceResponse;
@class AWSSNSTopic;
@class AWSSNSUnsubscribeInput;
@class AWSSNSUntagResourceRequest;
@class AWSSNSUntagResourceResponse;

/**
 
 */
@interface AWSSNSAddPermissionInput : AWSRequest


/**
 <p>The AWS account IDs of the users (principals) who will be given access to the specified actions. The users must have AWS accounts, but do not need to be signed up for this service.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable AWSAccountId;

/**
 <p>The action you want to allow for the specified principal(s).</p><p>Valid values: Any Amazon SNS action name, for example <code>Publish</code>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable actionName;

/**
 <p>A unique identifier for the new policy statement.</p>
 */
@property (nonatomic, strong) NSString * _Nullable label;

/**
 <p>The ARN of the topic whose access control policy you wish to modify.</p>
 */
@property (nonatomic, strong) NSString * _Nullable topicArn;

@end

/**
 <p>The input for the <code>CheckIfPhoneNumberIsOptedOut</code> action.</p>
 Required parameters: [phoneNumber]
 */
@interface AWSSNSCheckIfPhoneNumberIsOptedOutInput : AWSRequest


/**
 <p>The phone number for which you want to check the opt out status.</p>
 */
@property (nonatomic, strong) NSString * _Nullable phoneNumber;

@end

/**
 <p>The response from the <code>CheckIfPhoneNumberIsOptedOut</code> action.</p>
 */
@interface AWSSNSCheckIfPhoneNumberIsOptedOutResponse : AWSModel


/**
 <p>Indicates whether the phone number is opted out:</p><ul><li><p><code>true</code> – The phone number is opted out, meaning you cannot publish SMS messages to it.</p></li><li><p><code>false</code> – The phone number is opted in, meaning you can publish SMS messages to it.</p></li></ul>
 */
@property (nonatomic, strong) NSNumber * _Nullable isOptedOut;

@end

/**
 <p>Input for ConfirmSubscription action.</p>
 Required parameters: [TopicArn, Token]
 */
@interface AWSSNSConfirmSubscriptionInput : AWSRequest


/**
 <p>Disallows unauthenticated unsubscribes of the subscription. If the value of this parameter is <code>true</code> and the request has an AWS signature, then only the topic owner and the subscription owner can unsubscribe the endpoint. The unsubscribe action requires AWS authentication. </p>
 */
@property (nonatomic, strong) NSString * _Nullable authenticateOnUnsubscribe;

/**
 <p>Short-lived token sent to an endpoint during the <code>Subscribe</code> action.</p>
 */
@property (nonatomic, strong) NSString * _Nullable token;

/**
 <p>The ARN of the topic for which you wish to confirm a subscription.</p>
 */
@property (nonatomic, strong) NSString * _Nullable topicArn;

@end

/**
 <p>Response for ConfirmSubscriptions action.</p>
 */
@interface AWSSNSConfirmSubscriptionResponse : AWSModel


/**
 <p>The ARN of the created subscription.</p>
 */
@property (nonatomic, strong) NSString * _Nullable subscriptionArn;

@end

/**
 <p>Response from CreateEndpoint action.</p>
 */
@interface AWSSNSCreateEndpointResponse : AWSModel


/**
 <p>EndpointArn returned from CreateEndpoint action.</p>
 */
@property (nonatomic, strong) NSString * _Nullable endpointArn;

@end

/**
 <p>Input for CreatePlatformApplication action.</p>
 Required parameters: [Name, Platform, Attributes]
 */
@interface AWSSNSCreatePlatformApplicationInput : AWSRequest


/**
 <p>For a list of attributes, see <a href="https://docs.aws.amazon.com/sns/latest/api/API_SetPlatformApplicationAttributes.html">SetPlatformApplicationAttributes</a></p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable attributes;

/**
 <p>Application names must be made up of only uppercase and lowercase ASCII letters, numbers, underscores, hyphens, and periods, and must be between 1 and 256 characters long.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The following platforms are supported: ADM (Amazon Device Messaging), APNS (Apple Push Notification Service), APNS_SANDBOX, and FCM (Firebase Cloud Messaging).</p>
 */
@property (nonatomic, strong) NSString * _Nullable platform;

@end

/**
 <p>Response from CreatePlatformApplication action.</p>
 */
@interface AWSSNSCreatePlatformApplicationResponse : AWSModel


/**
 <p>PlatformApplicationArn is returned.</p>
 */
@property (nonatomic, strong) NSString * _Nullable platformApplicationArn;

@end

/**
 <p>Input for CreatePlatformEndpoint action.</p>
 Required parameters: [PlatformApplicationArn, Token]
 */
@interface AWSSNSCreatePlatformEndpointInput : AWSRequest


/**
 <p>For a list of attributes, see <a href="https://docs.aws.amazon.com/sns/latest/api/API_SetEndpointAttributes.html">SetEndpointAttributes</a>.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable attributes;

/**
 <p>Arbitrary user data to associate with the endpoint. Amazon SNS does not use this data. The data must be in UTF-8 format and less than 2KB.</p>
 */
@property (nonatomic, strong) NSString * _Nullable customUserData;

/**
 <p>PlatformApplicationArn returned from CreatePlatformApplication is used to create a an endpoint.</p>
 */
@property (nonatomic, strong) NSString * _Nullable platformApplicationArn;

/**
 <p>Unique identifier created by the notification service for an app on a device. The specific name for Token will vary, depending on which notification service is being used. For example, when using APNS as the notification service, you need the device token. Alternatively, when using FCM or ADM, the device token equivalent is called the registration ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable token;

@end

/**
 <p>Input for CreateTopic action.</p>
 Required parameters: [Name]
 */
@interface AWSSNSCreateTopicInput : AWSRequest


/**
 <p>A map of attributes with their corresponding values.</p><p>The following lists the names, descriptions, and values of the special request parameters that the <code>CreateTopic</code> action uses:</p><ul><li><p><code>DeliveryPolicy</code> – The policy that defines how Amazon SNS retries failed deliveries to HTTP/S endpoints.</p></li><li><p><code>DisplayName</code> – The display name to use for a topic with SMS subscriptions.</p></li><li><p><code>Policy</code> – The policy that defines who can access your topic. By default, only the topic owner can publish or subscribe to the topic.</p></li></ul><p>The following attribute applies only to <a href="https://docs.aws.amazon.com/sns/latest/dg/sns-server-side-encryption.html">server-side-encryption</a>:</p><ul><li><p><code>KmsMasterKeyId</code> - The ID of an AWS-managed customer master key (CMK) for Amazon SNS or a custom CMK. For more information, see <a href="https://docs.aws.amazon.com/sns/latest/dg/sns-server-side-encryption.html#sse-key-terms">Key Terms</a>. For more examples, see <a href="https://docs.aws.amazon.com/kms/latest/APIReference/API_DescribeKey.html#API_DescribeKey_RequestParameters">KeyId</a> in the <i>AWS Key Management Service API Reference</i>. </p></li></ul>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable attributes;

/**
 <p>The name of the topic you want to create.</p><p>Constraints: Topic names must be made up of only uppercase and lowercase ASCII letters, numbers, underscores, and hyphens, and must be between 1 and 256 characters long.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The list of tags to add to a new topic.</p><note><p>To be able to tag a topic on creation, you must have the <code>sns:CreateTopic</code> and <code>sns:TagResource</code> permissions.</p></note>
 */
@property (nonatomic, strong) NSArray<AWSSNSTag *> * _Nullable tags;

@end

/**
 <p>Response from CreateTopic action.</p>
 */
@interface AWSSNSCreateTopicResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) assigned to the created topic.</p>
 */
@property (nonatomic, strong) NSString * _Nullable topicArn;

@end

/**
 <p>Input for DeleteEndpoint action.</p>
 Required parameters: [EndpointArn]
 */
@interface AWSSNSDeleteEndpointInput : AWSRequest


/**
 <p>EndpointArn of endpoint to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable endpointArn;

@end

/**
 <p>Input for DeletePlatformApplication action.</p>
 Required parameters: [PlatformApplicationArn]
 */
@interface AWSSNSDeletePlatformApplicationInput : AWSRequest


/**
 <p>PlatformApplicationArn of platform application object to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable platformApplicationArn;

@end

/**
 
 */
@interface AWSSNSDeleteTopicInput : AWSRequest


/**
 <p>The ARN of the topic you want to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable topicArn;

@end

/**
 <p>Endpoint for mobile app and device.</p>
 */
@interface AWSSNSEndpoint : AWSModel


/**
 <p>Attributes for endpoint.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable attributes;

/**
 <p>EndpointArn for mobile app and device.</p>
 */
@property (nonatomic, strong) NSString * _Nullable endpointArn;

@end

/**
 <p>Input for GetEndpointAttributes action.</p>
 Required parameters: [EndpointArn]
 */
@interface AWSSNSGetEndpointAttributesInput : AWSRequest


/**
 <p>EndpointArn for GetEndpointAttributes input.</p>
 */
@property (nonatomic, strong) NSString * _Nullable endpointArn;

@end

/**
 <p>Response from GetEndpointAttributes of the EndpointArn.</p>
 */
@interface AWSSNSGetEndpointAttributesResponse : AWSModel


/**
 <p>Attributes include the following:</p><ul><li><p><code>CustomUserData</code> – arbitrary user data to associate with the endpoint. Amazon SNS does not use this data. The data must be in UTF-8 format and less than 2KB.</p></li><li><p><code>Enabled</code> – flag that enables/disables delivery to the endpoint. Amazon SNS will set this to false when a notification service indicates to Amazon SNS that the endpoint is invalid. Users can set it back to true, typically after updating Token.</p></li><li><p><code>Token</code> – device token, also referred to as a registration id, for an app and mobile device. This is returned from the notification service when an app and mobile device are registered with the notification service.</p><note><p>The device token for the iOS platform is returned in lowercase.</p></note></li></ul>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable attributes;

@end

/**
 <p>Input for GetPlatformApplicationAttributes action.</p>
 Required parameters: [PlatformApplicationArn]
 */
@interface AWSSNSGetPlatformApplicationAttributesInput : AWSRequest


/**
 <p>PlatformApplicationArn for GetPlatformApplicationAttributesInput.</p>
 */
@property (nonatomic, strong) NSString * _Nullable platformApplicationArn;

@end

/**
 <p>Response for GetPlatformApplicationAttributes action.</p>
 */
@interface AWSSNSGetPlatformApplicationAttributesResponse : AWSModel


/**
 <p>Attributes include the following:</p><ul><li><p><code>EventEndpointCreated</code> – Topic ARN to which EndpointCreated event notifications should be sent.</p></li><li><p><code>EventEndpointDeleted</code> – Topic ARN to which EndpointDeleted event notifications should be sent.</p></li><li><p><code>EventEndpointUpdated</code> – Topic ARN to which EndpointUpdate event notifications should be sent.</p></li><li><p><code>EventDeliveryFailure</code> – Topic ARN to which DeliveryFailure event notifications should be sent upon Direct Publish delivery failure (permanent) to one of the application's endpoints.</p></li></ul>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable attributes;

@end

/**
 <p>The input for the <code>GetSMSAttributes</code> request.</p>
 */
@interface AWSSNSGetSMSAttributesInput : AWSRequest


/**
 <p>A list of the individual attribute names, such as <code>MonthlySpendLimit</code>, for which you want values.</p><p>For all attribute names, see <a href="https://docs.aws.amazon.com/sns/latest/api/API_SetSMSAttributes.html">SetSMSAttributes</a>.</p><p>If you don't use this parameter, Amazon SNS returns all SMS attributes.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable attributes;

@end

/**
 <p>The response from the <code>GetSMSAttributes</code> request.</p>
 */
@interface AWSSNSGetSMSAttributesResponse : AWSModel


/**
 <p>The SMS attribute names and their values.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable attributes;

@end

/**
 <p>Input for GetSubscriptionAttributes.</p>
 Required parameters: [SubscriptionArn]
 */
@interface AWSSNSGetSubscriptionAttributesInput : AWSRequest


/**
 <p>The ARN of the subscription whose properties you want to get.</p>
 */
@property (nonatomic, strong) NSString * _Nullable subscriptionArn;

@end

/**
 <p>Response for GetSubscriptionAttributes action.</p>
 */
@interface AWSSNSGetSubscriptionAttributesResponse : AWSModel


/**
 <p>A map of the subscription's attributes. Attributes in this map include the following:</p><ul><li><p><code>ConfirmationWasAuthenticated</code> – <code>true</code> if the subscription confirmation request was authenticated.</p></li><li><p><code>DeliveryPolicy</code> – The JSON serialization of the subscription's delivery policy.</p></li><li><p><code>EffectiveDeliveryPolicy</code> – The JSON serialization of the effective delivery policy that takes into account the topic delivery policy and account system defaults.</p></li><li><p><code>FilterPolicy</code> – The filter policy JSON that is assigned to the subscription.</p></li><li><p><code>Owner</code> – The AWS account ID of the subscription's owner.</p></li><li><p><code>PendingConfirmation</code> – <code>true</code> if the subscription hasn't been confirmed. To confirm a pending subscription, call the <code>ConfirmSubscription</code> action with a confirmation token.</p></li><li><p><code>RawMessageDelivery</code> – <code>true</code> if raw message delivery is enabled for the subscription. Raw messages are free of JSON formatting and can be sent to HTTP/S and Amazon SQS endpoints.</p></li><li><p><code>RedrivePolicy</code> – When specified, sends undeliverable messages to the specified Amazon SQS dead-letter queue. Messages that can't be delivered due to client errors (for example, when the subscribed endpoint is unreachable) or server errors (for example, when the service that powers the subscribed endpoint becomes unavailable) are held in the dead-letter queue for further analysis or reprocessing.</p></li><li><p><code>SubscriptionArn</code> – The subscription's ARN.</p></li><li><p><code>TopicArn</code> – The topic ARN that the subscription is associated with.</p></li></ul>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable attributes;

@end

/**
 <p>Input for GetTopicAttributes action.</p>
 Required parameters: [TopicArn]
 */
@interface AWSSNSGetTopicAttributesInput : AWSRequest


/**
 <p>The ARN of the topic whose properties you want to get.</p>
 */
@property (nonatomic, strong) NSString * _Nullable topicArn;

@end

/**
 <p>Response for GetTopicAttributes action.</p>
 */
@interface AWSSNSGetTopicAttributesResponse : AWSModel


/**
 <p>A map of the topic's attributes. Attributes in this map include the following:</p><ul><li><p><code>DeliveryPolicy</code> – The JSON serialization of the topic's delivery policy.</p></li><li><p><code>DisplayName</code> – The human-readable name used in the <code>From</code> field for notifications to <code>email</code> and <code>email-json</code> endpoints.</p></li><li><p><code>Owner</code> – The AWS account ID of the topic's owner.</p></li><li><p><code>Policy</code> – The JSON serialization of the topic's access control policy.</p></li><li><p><code>SubscriptionsConfirmed</code> – The number of confirmed subscriptions for the topic.</p></li><li><p><code>SubscriptionsDeleted</code> – The number of deleted subscriptions for the topic.</p></li><li><p><code>SubscriptionsPending</code> – The number of subscriptions pending confirmation for the topic.</p></li><li><p><code>TopicArn</code> – The topic's ARN.</p></li><li><p><code>EffectiveDeliveryPolicy</code> – Yhe JSON serialization of the effective delivery policy, taking system defaults into account.</p></li></ul><p>The following attribute applies only to <a href="https://docs.aws.amazon.com/sns/latest/dg/sns-server-side-encryption.html">server-side-encryption</a>:</p><ul><li><p><code>KmsMasterKeyId</code> - The ID of an AWS-managed customer master key (CMK) for Amazon SNS or a custom CMK. For more information, see <a href="https://docs.aws.amazon.com/sns/latest/dg/sns-server-side-encryption.html#sse-key-terms">Key Terms</a>. For more examples, see <a href="https://docs.aws.amazon.com/kms/latest/APIReference/API_DescribeKey.html#API_DescribeKey_RequestParameters">KeyId</a> in the <i>AWS Key Management Service API Reference</i>.</p></li></ul>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable attributes;

@end

/**
 <p>Input for ListEndpointsByPlatformApplication action.</p>
 Required parameters: [PlatformApplicationArn]
 */
@interface AWSSNSListEndpointsByPlatformApplicationInput : AWSRequest


/**
 <p>NextToken string is used when calling ListEndpointsByPlatformApplication action to retrieve additional records that are available after the first page results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>PlatformApplicationArn for ListEndpointsByPlatformApplicationInput action.</p>
 */
@property (nonatomic, strong) NSString * _Nullable platformApplicationArn;

@end

/**
 <p>Response for ListEndpointsByPlatformApplication action.</p>
 */
@interface AWSSNSListEndpointsByPlatformApplicationResponse : AWSModel


/**
 <p>Endpoints returned for ListEndpointsByPlatformApplication action.</p>
 */
@property (nonatomic, strong) NSArray<AWSSNSEndpoint *> * _Nullable endpoints;

/**
 <p>NextToken string is returned when calling ListEndpointsByPlatformApplication action if additional records are available after the first page results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>The input for the <code>ListPhoneNumbersOptedOut</code> action.</p>
 */
@interface AWSSNSListPhoneNumbersOptedOutInput : AWSRequest


/**
 <p>A <code>NextToken</code> string is used when you call the <code>ListPhoneNumbersOptedOut</code> action to retrieve additional records that are available after the first page of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>The response from the <code>ListPhoneNumbersOptedOut</code> action.</p>
 */
@interface AWSSNSListPhoneNumbersOptedOutResponse : AWSModel


/**
 <p>A <code>NextToken</code> string is returned when you call the <code>ListPhoneNumbersOptedOut</code> action if additional records are available after the first page of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>A list of phone numbers that are opted out of receiving SMS messages. The list is paginated, and each page can contain up to 100 phone numbers.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable phoneNumbers;

@end

/**
 <p>Input for ListPlatformApplications action.</p>
 */
@interface AWSSNSListPlatformApplicationsInput : AWSRequest


/**
 <p>NextToken string is used when calling ListPlatformApplications action to retrieve additional records that are available after the first page results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>Response for ListPlatformApplications action.</p>
 */
@interface AWSSNSListPlatformApplicationsResponse : AWSModel


/**
 <p>NextToken string is returned when calling ListPlatformApplications action if additional records are available after the first page results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>Platform applications returned when calling ListPlatformApplications action.</p>
 */
@property (nonatomic, strong) NSArray<AWSSNSPlatformApplication *> * _Nullable platformApplications;

@end

/**
 <p>Input for ListSubscriptionsByTopic action.</p>
 Required parameters: [TopicArn]
 */
@interface AWSSNSListSubscriptionsByTopicInput : AWSRequest


/**
 <p>Token returned by the previous <code>ListSubscriptionsByTopic</code> request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The ARN of the topic for which you wish to find subscriptions.</p>
 */
@property (nonatomic, strong) NSString * _Nullable topicArn;

@end

/**
 <p>Response for ListSubscriptionsByTopic action.</p>
 */
@interface AWSSNSListSubscriptionsByTopicResponse : AWSModel


/**
 <p>Token to pass along to the next <code>ListSubscriptionsByTopic</code> request. This element is returned if there are more subscriptions to retrieve.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>A list of subscriptions.</p>
 */
@property (nonatomic, strong) NSArray<AWSSNSSubscription *> * _Nullable subscriptions;

@end

/**
 <p>Input for ListSubscriptions action.</p>
 */
@interface AWSSNSListSubscriptionsInput : AWSRequest


/**
 <p>Token returned by the previous <code>ListSubscriptions</code> request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>Response for ListSubscriptions action</p>
 */
@interface AWSSNSListSubscriptionsResponse : AWSModel


/**
 <p>Token to pass along to the next <code>ListSubscriptions</code> request. This element is returned if there are more subscriptions to retrieve.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>A list of subscriptions.</p>
 */
@property (nonatomic, strong) NSArray<AWSSNSSubscription *> * _Nullable subscriptions;

@end

/**
 
 */
@interface AWSSNSListTagsForResourceRequest : AWSRequest


/**
 <p>The ARN of the topic for which to list tags.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

@end

/**
 
 */
@interface AWSSNSListTagsForResourceResponse : AWSModel


/**
 <p>The tags associated with the specified topic.</p>
 */
@property (nonatomic, strong) NSArray<AWSSNSTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSSNSListTopicsInput : AWSRequest


/**
 <p>Token returned by the previous <code>ListTopics</code> request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>Response for ListTopics action.</p>
 */
@interface AWSSNSListTopicsResponse : AWSModel


/**
 <p>Token to pass along to the next <code>ListTopics</code> request. This element is returned if there are additional topics to retrieve.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>A list of topic ARNs.</p>
 */
@property (nonatomic, strong) NSArray<AWSSNSTopic *> * _Nullable topics;

@end

/**
 <p>The user-specified message attribute value. For string data types, the value attribute has the same restrictions on the content as the message body. For more information, see <a href="https://docs.aws.amazon.com/sns/latest/api/API_Publish.html">Publish</a>.</p><p>Name, type, and value must not be empty or null. In addition, the message body should not be empty or null. All parts of the message attribute, including name, type, and value, are included in the message size restriction, which is currently 256 KB (262,144 bytes). For more information, see <a href="https://docs.aws.amazon.com/sns/latest/dg/SNSMessageAttributes.html">Using Amazon SNS Message Attributes</a>.</p>
 Required parameters: [DataType]
 */
@interface AWSSNSMessageAttributeValue : AWSModel


/**
 <p>Binary type attributes can store any binary data, for example, compressed data, encrypted data, or images.</p>
 */
@property (nonatomic, strong) NSData * _Nullable binaryValue;

/**
 <p>Amazon SNS supports the following logical data types: String, String.Array, Number, and Binary. For more information, see <a href="https://docs.aws.amazon.com/sns/latest/dg/SNSMessageAttributes.html#SNSMessageAttributes.DataTypes">Message Attribute Data Types</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataType;

/**
 <p>Strings are Unicode with UTF8 binary encoding. For a list of code values, see <a href="https://en.wikipedia.org/wiki/ASCII#ASCII_printable_characters">ASCII Printable Characters</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stringValue;

@end

/**
 <p>Input for the OptInPhoneNumber action.</p>
 Required parameters: [phoneNumber]
 */
@interface AWSSNSOptInPhoneNumberInput : AWSRequest


/**
 <p>The phone number to opt in.</p>
 */
@property (nonatomic, strong) NSString * _Nullable phoneNumber;

@end

/**
 <p>The response for the OptInPhoneNumber action.</p>
 */
@interface AWSSNSOptInPhoneNumberResponse : AWSModel


@end

/**
 <p>Platform application object.</p>
 */
@interface AWSSNSPlatformApplication : AWSModel


/**
 <p>Attributes for platform application object.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable attributes;

/**
 <p>PlatformApplicationArn for platform application object.</p>
 */
@property (nonatomic, strong) NSString * _Nullable platformApplicationArn;

@end

/**
 <p>Input for Publish action.</p>
 Required parameters: [Message]
 */
@interface AWSSNSPublishInput : AWSRequest


/**
 <p>The message you want to send.</p><p>If you are publishing to a topic and you want to send the same message to all transport protocols, include the text of the message as a String value. If you want to send different messages for each transport protocol, set the value of the <code>MessageStructure</code> parameter to <code>json</code> and use a JSON object for the <code>Message</code> parameter. </p><p/><p>Constraints:</p><ul><li><p>With the exception of SMS, messages must be UTF-8 encoded strings and at most 256 KB in size (262,144 bytes, not 262,144 characters).</p></li><li><p>For SMS, each message can contain up to 140 characters. This character limit depends on the encoding schema. For example, an SMS message can contain 160 GSM characters, 140 ASCII characters, or 70 UCS-2 characters.</p><p>If you publish a message that exceeds this size limit, Amazon SNS sends the message as multiple messages, each fitting within the size limit. Messages aren't truncated mid-word but are cut off at whole-word boundaries.</p><p>The total size limit for a single SMS <code>Publish</code> action is 1,600 characters.</p></li></ul><p>JSON-specific constraints:</p><ul><li><p>Keys in the JSON object that correspond to supported transport protocols must have simple JSON string values.</p></li><li><p>The values will be parsed (unescaped) before they are used in outgoing messages.</p></li><li><p>Outbound notifications are JSON encoded (meaning that the characters will be reescaped for sending).</p></li><li><p>Values have a minimum length of 0 (the empty string, "", is allowed).</p></li><li><p>Values have a maximum length bounded by the overall message size (so, including multiple protocols may limit message sizes).</p></li><li><p>Non-string values will cause the key to be ignored.</p></li><li><p>Keys that do not correspond to supported transport protocols are ignored.</p></li><li><p>Duplicate keys are not allowed.</p></li><li><p>Failure to parse or validate any key or value in the message will cause the <code>Publish</code> call to return an error (no partial delivery).</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable message;

/**
 <p>Message attributes for Publish action.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSSNSMessageAttributeValue *> * _Nullable messageAttributes;

/**
 <p>Set <code>MessageStructure</code> to <code>json</code> if you want to send a different message for each protocol. For example, using one publish action, you can send a short message to your SMS subscribers and a longer message to your email subscribers. If you set <code>MessageStructure</code> to <code>json</code>, the value of the <code>Message</code> parameter must: </p><ul><li><p>be a syntactically valid JSON object; and</p></li><li><p>contain at least a top-level JSON key of "default" with a value that is a string.</p></li></ul><p>You can define other top-level keys that define the message you want to send to a specific transport protocol (e.g., "http").</p><p>Valid value: <code>json</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable messageStructure;

/**
 <p>The phone number to which you want to deliver an SMS message. Use E.164 format.</p><p>If you don't specify a value for the <code>PhoneNumber</code> parameter, you must specify a value for the <code>TargetArn</code> or <code>TopicArn</code> parameters.</p>
 */
@property (nonatomic, strong) NSString * _Nullable phoneNumber;

/**
 <p>Optional parameter to be used as the "Subject" line when the message is delivered to email endpoints. This field will also be included, if present, in the standard JSON messages delivered to other endpoints.</p><p>Constraints: Subjects must be ASCII text that begins with a letter, number, or punctuation mark; must not include line breaks or control characters; and must be less than 100 characters long.</p>
 */
@property (nonatomic, strong) NSString * _Nullable subject;

/**
 <p>If you don't specify a value for the <code>TargetArn</code> parameter, you must specify a value for the <code>PhoneNumber</code> or <code>TopicArn</code> parameters.</p>
 */
@property (nonatomic, strong) NSString * _Nullable targetArn;

/**
 <p>The topic you want to publish to.</p><p>If you don't specify a value for the <code>TopicArn</code> parameter, you must specify a value for the <code>PhoneNumber</code> or <code>TargetArn</code> parameters.</p>
 */
@property (nonatomic, strong) NSString * _Nullable topicArn;

@end

/**
 <p>Response for Publish action.</p>
 */
@interface AWSSNSPublishResponse : AWSModel


/**
 <p>Unique identifier assigned to the published message.</p><p>Length Constraint: Maximum 100 characters</p>
 */
@property (nonatomic, strong) NSString * _Nullable messageId;

@end

/**
 <p>Input for RemovePermission action.</p>
 Required parameters: [TopicArn, Label]
 */
@interface AWSSNSRemovePermissionInput : AWSRequest


/**
 <p>The unique label of the statement you want to remove.</p>
 */
@property (nonatomic, strong) NSString * _Nullable label;

/**
 <p>The ARN of the topic whose access control policy you wish to modify.</p>
 */
@property (nonatomic, strong) NSString * _Nullable topicArn;

@end

/**
 <p>Input for SetEndpointAttributes action.</p>
 Required parameters: [EndpointArn, Attributes]
 */
@interface AWSSNSSetEndpointAttributesInput : AWSRequest


/**
 <p>A map of the endpoint attributes. Attributes in this map include the following:</p><ul><li><p><code>CustomUserData</code> – arbitrary user data to associate with the endpoint. Amazon SNS does not use this data. The data must be in UTF-8 format and less than 2KB.</p></li><li><p><code>Enabled</code> – flag that enables/disables delivery to the endpoint. Amazon SNS will set this to false when a notification service indicates to Amazon SNS that the endpoint is invalid. Users can set it back to true, typically after updating Token.</p></li><li><p><code>Token</code> – device token, also referred to as a registration id, for an app and mobile device. This is returned from the notification service when an app and mobile device are registered with the notification service.</p></li></ul>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable attributes;

/**
 <p>EndpointArn used for SetEndpointAttributes action.</p>
 */
@property (nonatomic, strong) NSString * _Nullable endpointArn;

@end

/**
 <p>Input for SetPlatformApplicationAttributes action.</p>
 Required parameters: [PlatformApplicationArn, Attributes]
 */
@interface AWSSNSSetPlatformApplicationAttributesInput : AWSRequest


/**
 <p>A map of the platform application attributes. Attributes in this map include the following:</p><ul><li><p><code>PlatformCredential</code> – The credential received from the notification service. For APNS/APNS_SANDBOX, PlatformCredential is private key. For FCM, PlatformCredential is "API key". For ADM, PlatformCredential is "client secret".</p></li><li><p><code>PlatformPrincipal</code> – The principal received from the notification service. For APNS/APNS_SANDBOX, PlatformPrincipal is SSL certificate. For FCM, PlatformPrincipal is not applicable. For ADM, PlatformPrincipal is "client id".</p></li><li><p><code>EventEndpointCreated</code> – Topic ARN to which EndpointCreated event notifications should be sent.</p></li><li><p><code>EventEndpointDeleted</code> – Topic ARN to which EndpointDeleted event notifications should be sent.</p></li><li><p><code>EventEndpointUpdated</code> – Topic ARN to which EndpointUpdate event notifications should be sent.</p></li><li><p><code>EventDeliveryFailure</code> – Topic ARN to which DeliveryFailure event notifications should be sent upon Direct Publish delivery failure (permanent) to one of the application's endpoints.</p></li><li><p><code>SuccessFeedbackRoleArn</code> – IAM role ARN used to give Amazon SNS write access to use CloudWatch Logs on your behalf.</p></li><li><p><code>FailureFeedbackRoleArn</code> – IAM role ARN used to give Amazon SNS write access to use CloudWatch Logs on your behalf.</p></li><li><p><code>SuccessFeedbackSampleRate</code> – Sample rate percentage (0-100) of successfully delivered messages.</p></li></ul>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable attributes;

/**
 <p>PlatformApplicationArn for SetPlatformApplicationAttributes action.</p>
 */
@property (nonatomic, strong) NSString * _Nullable platformApplicationArn;

@end

/**
 <p>The input for the SetSMSAttributes action.</p>
 Required parameters: [attributes]
 */
@interface AWSSNSSetSMSAttributesInput : AWSRequest


/**
 <p>The default settings for sending SMS messages from your account. You can set values for the following attribute names:</p><p><code>MonthlySpendLimit</code> – The maximum amount in USD that you are willing to spend each month to send SMS messages. When Amazon SNS determines that sending an SMS message would incur a cost that exceeds this limit, it stops sending SMS messages within minutes.</p><important><p>Amazon SNS stops sending SMS messages within minutes of the limit being crossed. During that interval, if you continue to send SMS messages, you will incur costs that exceed your limit.</p></important><p>By default, the spend limit is set to the maximum allowed by Amazon SNS. If you want to raise the limit, submit an <a href="https://console.aws.amazon.com/support/home#/case/create?issueType=service-limit-increase&amp;limitType=service-code-sns">SNS Limit Increase case</a>. For <b>New limit value</b>, enter your desired monthly spend limit. In the <b>Use Case Description</b> field, explain that you are requesting an SMS monthly spend limit increase.</p><p><code>DeliveryStatusIAMRole</code> – The ARN of the IAM role that allows Amazon SNS to write logs about SMS deliveries in CloudWatch Logs. For each SMS message that you send, Amazon SNS writes a log that includes the message price, the success or failure status, the reason for failure (if the message failed), the message dwell time, and other information.</p><p><code>DeliveryStatusSuccessSamplingRate</code> – The percentage of successful SMS deliveries for which Amazon SNS will write logs in CloudWatch Logs. The value can be an integer from 0 - 100. For example, to write logs only for failed deliveries, set this value to <code>0</code>. To write logs for 10% of your successful deliveries, set it to <code>10</code>.</p><p><code>DefaultSenderID</code> – A string, such as your business brand, that is displayed as the sender on the receiving device. Support for sender IDs varies by country. The sender ID can be 1 - 11 alphanumeric characters, and it must contain at least one letter.</p><p><code>DefaultSMSType</code> – The type of SMS message that you will send by default. You can assign the following values:</p><ul><li><p><code>Promotional</code> – (Default) Noncritical messages, such as marketing messages. Amazon SNS optimizes the message delivery to incur the lowest cost.</p></li><li><p><code>Transactional</code> – Critical messages that support customer transactions, such as one-time passcodes for multi-factor authentication. Amazon SNS optimizes the message delivery to achieve the highest reliability.</p></li></ul><p><code>UsageReportS3Bucket</code> – The name of the Amazon S3 bucket to receive daily SMS usage reports from Amazon SNS. Each day, Amazon SNS will deliver a usage report as a CSV file to the bucket. The report includes the following information for each SMS message that was successfully delivered by your account:</p><ul><li><p>Time that the message was published (in UTC)</p></li><li><p>Message ID</p></li><li><p>Destination phone number</p></li><li><p>Message type</p></li><li><p>Delivery status</p></li><li><p>Message price (in USD)</p></li><li><p>Part number (a message is split into multiple parts if it is too long for a single message)</p></li><li><p>Total number of parts</p></li></ul><p>To receive the report, the bucket must have a policy that allows the Amazon SNS service principle to perform the <code>s3:PutObject</code> and <code>s3:GetBucketLocation</code> actions.</p><p>For an example bucket policy and usage report, see <a href="https://docs.aws.amazon.com/sns/latest/dg/sms_stats.html">Monitoring SMS Activity</a> in the <i>Amazon SNS Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable attributes;

@end

/**
 <p>The response for the SetSMSAttributes action.</p>
 */
@interface AWSSNSSetSMSAttributesResponse : AWSModel


@end

/**
 <p>Input for SetSubscriptionAttributes action.</p>
 Required parameters: [SubscriptionArn, AttributeName]
 */
@interface AWSSNSSetSubscriptionAttributesInput : AWSRequest


/**
 <p>A map of attributes with their corresponding values.</p><p>The following lists the names, descriptions, and values of the special request parameters that the <code>SetTopicAttributes</code> action uses:</p><ul><li><p><code>DeliveryPolicy</code> – The policy that defines how Amazon SNS retries failed deliveries to HTTP/S endpoints.</p></li><li><p><code>FilterPolicy</code> – The simple JSON object that lets your subscriber receive only a subset of messages, rather than receiving every message published to the topic.</p></li><li><p><code>RawMessageDelivery</code> – When set to <code>true</code>, enables raw message delivery to Amazon SQS or HTTP/S endpoints. This eliminates the need for the endpoints to process JSON formatting, which is otherwise created for Amazon SNS metadata.</p></li><li><p><code>RedrivePolicy</code> – When specified, sends undeliverable messages to the specified Amazon SQS dead-letter queue. Messages that can't be delivered due to client errors (for example, when the subscribed endpoint is unreachable) or server errors (for example, when the service that powers the subscribed endpoint becomes unavailable) are held in the dead-letter queue for further analysis or reprocessing.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable attributeName;

/**
 <p>The new value for the attribute in JSON format.</p>
 */
@property (nonatomic, strong) NSString * _Nullable attributeValue;

/**
 <p>The ARN of the subscription to modify.</p>
 */
@property (nonatomic, strong) NSString * _Nullable subscriptionArn;

@end

/**
 <p>Input for SetTopicAttributes action.</p>
 Required parameters: [TopicArn, AttributeName]
 */
@interface AWSSNSSetTopicAttributesInput : AWSRequest


/**
 <p>A map of attributes with their corresponding values.</p><p>The following lists the names, descriptions, and values of the special request parameters that the <code>SetTopicAttributes</code> action uses:</p><ul><li><p><code>DeliveryPolicy</code> – The policy that defines how Amazon SNS retries failed deliveries to HTTP/S endpoints.</p></li><li><p><code>DisplayName</code> – The display name to use for a topic with SMS subscriptions.</p></li><li><p><code>Policy</code> – The policy that defines who can access your topic. By default, only the topic owner can publish or subscribe to the topic.</p></li></ul><p>The following attribute applies only to <a href="https://docs.aws.amazon.com/sns/latest/dg/sns-server-side-encryption.html">server-side-encryption</a>:</p><ul><li><p><code>KmsMasterKeyId</code> - The ID of an AWS-managed customer master key (CMK) for Amazon SNS or a custom CMK. For more information, see <a href="https://docs.aws.amazon.com/sns/latest/dg/sns-server-side-encryption.html#sse-key-terms">Key Terms</a>. For more examples, see <a href="https://docs.aws.amazon.com/kms/latest/APIReference/API_DescribeKey.html#API_DescribeKey_RequestParameters">KeyId</a> in the <i>AWS Key Management Service API Reference</i>. </p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable attributeName;

/**
 <p>The new value for the attribute.</p>
 */
@property (nonatomic, strong) NSString * _Nullable attributeValue;

/**
 <p>The ARN of the topic to modify.</p>
 */
@property (nonatomic, strong) NSString * _Nullable topicArn;

@end

/**
 <p>Input for Subscribe action.</p>
 Required parameters: [TopicArn, Protocol]
 */
@interface AWSSNSSubscribeInput : AWSRequest


/**
 <p>A map of attributes with their corresponding values.</p><p>The following lists the names, descriptions, and values of the special request parameters that the <code>SetTopicAttributes</code> action uses:</p><ul><li><p><code>DeliveryPolicy</code> – The policy that defines how Amazon SNS retries failed deliveries to HTTP/S endpoints.</p></li><li><p><code>FilterPolicy</code> – The simple JSON object that lets your subscriber receive only a subset of messages, rather than receiving every message published to the topic.</p></li><li><p><code>RawMessageDelivery</code> – When set to <code>true</code>, enables raw message delivery to Amazon SQS or HTTP/S endpoints. This eliminates the need for the endpoints to process JSON formatting, which is otherwise created for Amazon SNS metadata.</p></li><li><p><code>RedrivePolicy</code> – When specified, sends undeliverable messages to the specified Amazon SQS dead-letter queue. Messages that can't be delivered due to client errors (for example, when the subscribed endpoint is unreachable) or server errors (for example, when the service that powers the subscribed endpoint becomes unavailable) are held in the dead-letter queue for further analysis or reprocessing.</p></li></ul>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable attributes;

/**
 <p>The endpoint that you want to receive notifications. Endpoints vary by protocol:</p><ul><li><p>For the <code>http</code> protocol, the endpoint is an URL beginning with <code>http://</code></p></li><li><p>For the <code>https</code> protocol, the endpoint is a URL beginning with <code>https://</code></p></li><li><p>For the <code>email</code> protocol, the endpoint is an email address</p></li><li><p>For the <code>email-json</code> protocol, the endpoint is an email address</p></li><li><p>For the <code>sms</code> protocol, the endpoint is a phone number of an SMS-enabled device</p></li><li><p>For the <code>sqs</code> protocol, the endpoint is the ARN of an Amazon SQS queue</p></li><li><p>For the <code>application</code> protocol, the endpoint is the EndpointArn of a mobile app and device.</p></li><li><p>For the <code>lambda</code> protocol, the endpoint is the ARN of an Amazon Lambda function.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable endpoint;

/**
 <p>The protocol you want to use. Supported protocols include:</p><ul><li><p><code>http</code> – delivery of JSON-encoded message via HTTP POST</p></li><li><p><code>https</code> – delivery of JSON-encoded message via HTTPS POST</p></li><li><p><code>email</code> – delivery of message via SMTP</p></li><li><p><code>email-json</code> – delivery of JSON-encoded message via SMTP</p></li><li><p><code>sms</code> – delivery of message via SMS</p></li><li><p><code>sqs</code> – delivery of JSON-encoded message to an Amazon SQS queue</p></li><li><p><code>application</code> – delivery of JSON-encoded message to an EndpointArn for a mobile app and device.</p></li><li><p><code>lambda</code> – delivery of JSON-encoded message to an Amazon Lambda function.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable protocols;

/**
 <p>Sets whether the response from the <code>Subscribe</code> request includes the subscription ARN, even if the subscription is not yet confirmed.</p><ul><li><p>If you have the subscription ARN returned, the response includes the ARN in all cases, even if the subscription is not yet confirmed.</p></li><li><p>If you don't have the subscription ARN returned, in addition to the ARN for confirmed subscriptions, the response also includes the <code>pending subscription</code> ARN value for subscriptions that aren't yet confirmed. A subscription becomes confirmed when the subscriber calls the <code>ConfirmSubscription</code> action with a confirmation token.</p></li></ul><p>If you set this parameter to <code>true</code>, .</p><p>The default value is <code>false</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable returnSubscriptionArn;

/**
 <p>The ARN of the topic you want to subscribe to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable topicArn;

@end

/**
 <p>Response for Subscribe action.</p>
 */
@interface AWSSNSSubscribeResponse : AWSModel


/**
 <p>The ARN of the subscription if it is confirmed, or the string "pending confirmation" if the subscription requires confirmation. However, if the API request parameter <code>ReturnSubscriptionArn</code> is true, then the value is always the subscription ARN, even if the subscription requires confirmation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable subscriptionArn;

@end

/**
 <p>A wrapper type for the attributes of an Amazon SNS subscription.</p>
 */
@interface AWSSNSSubscription : AWSModel


/**
 <p>The subscription's endpoint (format depends on the protocol).</p>
 */
@property (nonatomic, strong) NSString * _Nullable endpoint;

/**
 <p>The subscription's owner.</p>
 */
@property (nonatomic, strong) NSString * _Nullable owner;

/**
 <p>The subscription's protocol.</p>
 */
@property (nonatomic, strong) NSString * _Nullable protocols;

/**
 <p>The subscription's ARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable subscriptionArn;

/**
 <p>The ARN of the subscription's topic.</p>
 */
@property (nonatomic, strong) NSString * _Nullable topicArn;

@end

/**
 <p>The list of tags to be added to the specified topic.</p>
 Required parameters: [Key, Value]
 */
@interface AWSSNSTag : AWSModel


/**
 <p>The required key portion of the tag.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>The optional value portion of the tag.</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 
 */
@interface AWSSNSTagResourceRequest : AWSRequest


/**
 <p>The ARN of the topic to which to add tags.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

/**
 <p>The tags to be added to the specified topic. A tag consists of a required key and an optional value.</p>
 */
@property (nonatomic, strong) NSArray<AWSSNSTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSSNSTagResourceResponse : AWSModel


@end

/**
 <p>A wrapper type for the topic's Amazon Resource Name (ARN). To retrieve a topic's attributes, use <code>GetTopicAttributes</code>.</p>
 */
@interface AWSSNSTopic : AWSModel


/**
 <p>The topic's ARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable topicArn;

@end

/**
 <p>Input for Unsubscribe action.</p>
 Required parameters: [SubscriptionArn]
 */
@interface AWSSNSUnsubscribeInput : AWSRequest


/**
 <p>The ARN of the subscription to be deleted.</p>
 */
@property (nonatomic, strong) NSString * _Nullable subscriptionArn;

@end

/**
 
 */
@interface AWSSNSUntagResourceRequest : AWSRequest


/**
 <p>The ARN of the topic from which to remove tags.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

/**
 <p>The list of tag keys to remove from the specified topic.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable tagKeys;

@end

/**
 
 */
@interface AWSSNSUntagResourceResponse : AWSModel


@end

NS_ASSUME_NONNULL_END
