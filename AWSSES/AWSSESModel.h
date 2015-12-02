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
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSModel.h>

NS_ASSUME_NONNULL_BEGIN

FOUNDATION_EXPORT NSString *const AWSSESErrorDomain;

typedef NS_ENUM(NSInteger, AWSSESErrorType) {
    AWSSESErrorUnknown,
    AWSSESErrorIncompleteSignature,
    AWSSESErrorInvalidClientTokenId,
    AWSSESErrorMissingAuthenticationToken,
    AWSSESErrorMessageRejected,
};

typedef NS_ENUM(NSInteger, AWSSESIdentityType) {
    AWSSESIdentityTypeUnknown,
    AWSSESIdentityTypeEmailAddress,
    AWSSESIdentityTypeDomain,
};

typedef NS_ENUM(NSInteger, AWSSESNotificationType) {
    AWSSESNotificationTypeUnknown,
    AWSSESNotificationTypeBounce,
    AWSSESNotificationTypeComplaint,
    AWSSESNotificationTypeDelivery,
};

typedef NS_ENUM(NSInteger, AWSSESVerificationStatus) {
    AWSSESVerificationStatusUnknown,
    AWSSESVerificationStatusPending,
    AWSSESVerificationStatusSuccess,
    AWSSESVerificationStatusFailed,
    AWSSESVerificationStatusTemporaryFailure,
    AWSSESVerificationStatusNotStarted,
};

@class AWSSESBody;
@class AWSSESContent;
@class AWSSESDeleteIdentityRequest;
@class AWSSESDeleteIdentityResponse;
@class AWSSESDeleteVerifiedEmailAddressRequest;
@class AWSSESDestination;
@class AWSSESGetIdentityDkimAttributesRequest;
@class AWSSESGetIdentityDkimAttributesResponse;
@class AWSSESGetIdentityNotificationAttributesRequest;
@class AWSSESGetIdentityNotificationAttributesResponse;
@class AWSSESGetIdentityVerificationAttributesRequest;
@class AWSSESGetIdentityVerificationAttributesResponse;
@class AWSSESGetSendQuotaResponse;
@class AWSSESGetSendStatisticsResponse;
@class AWSSESIdentityDkimAttributes;
@class AWSSESIdentityNotificationAttributes;
@class AWSSESIdentityVerificationAttributes;
@class AWSSESListIdentitiesRequest;
@class AWSSESListIdentitiesResponse;
@class AWSSESListVerifiedEmailAddressesResponse;
@class AWSSESMessage;
@class AWSSESRawMessage;
@class AWSSESSendDataPoint;
@class AWSSESSendEmailRequest;
@class AWSSESSendEmailResponse;
@class AWSSESSendRawEmailRequest;
@class AWSSESSendRawEmailResponse;
@class AWSSESSetIdentityDkimEnabledRequest;
@class AWSSESSetIdentityDkimEnabledResponse;
@class AWSSESSetIdentityFeedbackForwardingEnabledRequest;
@class AWSSESSetIdentityFeedbackForwardingEnabledResponse;
@class AWSSESSetIdentityNotificationTopicRequest;
@class AWSSESSetIdentityNotificationTopicResponse;
@class AWSSESVerifyDomainDkimRequest;
@class AWSSESVerifyDomainDkimResponse;
@class AWSSESVerifyDomainIdentityRequest;
@class AWSSESVerifyDomainIdentityResponse;
@class AWSSESVerifyEmailAddressRequest;
@class AWSSESVerifyEmailIdentityRequest;
@class AWSSESVerifyEmailIdentityResponse;

/**
 <p>Represents the body of the message. You can specify text, HTML, or both. If you use both, then the message should display correctly in the widest variety of email clients. </p>
 */
@interface AWSSESBody : AWSModel


/**
 <p>The content of the message, in HTML format. Use this for email clients that can process HTML. You can include clickable links, formatted text, and much more in an HTML message. </p>
 */
@property (nonatomic, strong) AWSSESContent * _Nullable html;

/**
 <p>The content of the message, in text format. Use this for text-based email clients, or clients on high-latency networks (such as mobile devices). </p>
 */
@property (nonatomic, strong) AWSSESContent * _Nullable text;

@end

/**
 <p>Represents textual data, plus an optional character set specification.</p><p>By default, the text must be 7-bit ASCII, due to the constraints of the SMTP protocol. If the text must contain any other characters, then you must also specify a character set. Examples include UTF-8, ISO-8859-1, and Shift_JIS. </p>
 Required parameters: [Data]
 */
@interface AWSSESContent : AWSModel


/**
 <p>The character set of the content.</p>
 */
@property (nonatomic, strong) NSString * _Nullable charset;

/**
 <p>The textual data of the content.</p>
 */
@property (nonatomic, strong) NSString * _Nullable data;

@end

/**
 <p>Represents a request instructing the service to delete an identity from the list of identities for the AWS Account.</p>
 Required parameters: [Identity]
 */
@interface AWSSESDeleteIdentityRequest : AWSRequest


/**
 <p>The identity to be removed from the list of identities for the AWS Account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identity;

@end

/**
 <p>An empty element. Receiving this element indicates that the request completed successfully.</p>
 */
@interface AWSSESDeleteIdentityResponse : AWSModel


@end

/**
 <p>Represents a request instructing the service to delete an address from the list of verified email addresses.</p>
 Required parameters: [EmailAddress]
 */
@interface AWSSESDeleteVerifiedEmailAddressRequest : AWSRequest


/**
 <p>An email address to be removed from the list of verified addresses.</p>
 */
@property (nonatomic, strong) NSString * _Nullable emailAddress;

@end

/**
 <p>Represents the destination of the message, consisting of To:, CC:, and BCC: fields.</p><p> By default, the string must be 7-bit ASCII. If the text must contain any other characters, then you must use MIME encoded-word syntax (RFC 2047) instead of a literal string. MIME encoded-word syntax uses the following form: <code>=?charset?encoding?encoded-text?=</code>. For more information, see <a href="http://tools.ietf.org/html/rfc2047">RFC 2047</a>. </p>
 */
@interface AWSSESDestination : AWSModel


/**
 <p>The BCC: field(s) of the message.</p>
 */
@property (nonatomic, strong) NSArray * _Nullable bccAddresses;

/**
 <p>The CC: field(s) of the message.</p>
 */
@property (nonatomic, strong) NSArray * _Nullable ccAddresses;

/**
 <p>The To: field(s) of the message.</p>
 */
@property (nonatomic, strong) NSArray * _Nullable toAddresses;

@end

/**
 <p>Given a list of verified identities, describes their DKIM attributes. The DKIM attributes of an email address identity includes whether DKIM signing is individually enabled or disabled for that address. The DKIM attributes of a domain name identity includes whether DKIM signing is enabled, as well as the DNS records (tokens) that must remain published in the domain name's DNS.</p>
 Required parameters: [Identities]
 */
@interface AWSSESGetIdentityDkimAttributesRequest : AWSRequest


/**
 <p>A list of one or more verified identities - email addresses, domains, or both.</p>
 */
@property (nonatomic, strong) NSArray * _Nullable identities;

@end

/**
 <p>Represents a list of all the DKIM attributes for the specified identity.</p>
 Required parameters: [DkimAttributes]
 */
@interface AWSSESGetIdentityDkimAttributesResponse : AWSModel


/**
 <p>The DKIM attributes for an email address or a domain. </p>
 */
@property (nonatomic, strong) NSDictionary * _Nullable dkimAttributes;

@end

/**
 
 */
@interface AWSSESGetIdentityNotificationAttributesRequest : AWSRequest


/**
 <p>A list of one or more identities.</p>
 */
@property (nonatomic, strong) NSArray * _Nullable identities;

@end

/**
 <p>Describes whether an identity has Amazon Simple Notification Service (Amazon SNS) topics set for bounce, complaint, and/or delivery notifications, and specifies whether feedback forwarding is enabled for bounce and complaint notifications.</p>
 Required parameters: [NotificationAttributes]
 */
@interface AWSSESGetIdentityNotificationAttributesResponse : AWSModel


/**
 <p>A map of Identity to IdentityNotificationAttributes.</p>
 */
@property (nonatomic, strong) NSDictionary * _Nullable notificationAttributes;

@end

/**
 <p>Represents a request instructing the service to provide the verification attributes for a list of identities.</p>
 Required parameters: [Identities]
 */
@interface AWSSESGetIdentityVerificationAttributesRequest : AWSRequest


/**
 <p>A list of identities.</p>
 */
@property (nonatomic, strong) NSArray * _Nullable identities;

@end

/**
 <p>Represents the verification attributes for a list of identities.</p>
 Required parameters: [VerificationAttributes]
 */
@interface AWSSESGetIdentityVerificationAttributesResponse : AWSModel


/**
 <p>A map of Identities to IdentityVerificationAttributes objects.</p>
 */
@property (nonatomic, strong) NSDictionary * _Nullable verificationAttributes;

@end

/**
 <p>Represents the user's current activity limits returned from a successful <code>GetSendQuota</code> request. </p>
 */
@interface AWSSESGetSendQuotaResponse : AWSModel


/**
 <p>The maximum number of emails the user is allowed to send in a 24-hour interval.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable max24HourSend;

/**
 <p>The maximum number of emails the user is allowed to send per second.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxSendRate;

/**
 <p>The number of emails sent during the previous 24 hours.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable sentLast24Hours;

@end

/**
 <p>Represents a list of <code>SendDataPoint</code> items returned from a successful <code>GetSendStatistics</code> request. This list contains aggregated data from the previous two weeks of sending activity. </p>
 */
@interface AWSSESGetSendStatisticsResponse : AWSModel


/**
 <p>A list of data points, each of which represents 15 minutes of activity.</p>
 */
@property (nonatomic, strong) NSArray * _Nullable sendDataPoints;

@end

/**
 <p>Represents the DKIM attributes of a verified email address or a domain.</p>
 Required parameters: [DkimEnabled, DkimVerificationStatus]
 */
@interface AWSSESIdentityDkimAttributes : AWSModel


/**
 <p>True if DKIM signing is enabled for email sent from the identity; false otherwise.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dkimEnabled;

/**
 <p>A set of character strings that represent the domain's identity. Using these tokens, you will need to create DNS CNAME records that point to DKIM public keys hosted by Amazon SES. Amazon Web Services will eventually detect that you have updated your DNS records; this detection process may take up to 72 hours. Upon successful detection, Amazon SES will be able to DKIM-sign email originating from that domain. (This only applies to domain identities, not email address identities.)</p><p>For more information about creating DNS records using DKIM tokens, go to the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/easy-dkim-dns-records.html">Amazon SES Developer Guide</a>.</p>
 */
@property (nonatomic, strong) NSArray * _Nullable dkimTokens;

/**
 <p>Describes whether Amazon SES has successfully verified the DKIM DNS records (tokens) published in the domain name's DNS. (This only applies to domain identities, not email address identities.)</p>
 */
@property (nonatomic, assign) AWSSESVerificationStatus dkimVerificationStatus;

@end

/**
 <p>Represents the notification attributes of an identity, including whether an identity has Amazon Simple Notification Service (Amazon SNS) topics set for bounce, complaint, and/or delivery notifications, and whether feedback forwarding is enabled for bounce and complaint notifications.</p>
 Required parameters: [BounceTopic, ComplaintTopic, DeliveryTopic, ForwardingEnabled]
 */
@interface AWSSESIdentityNotificationAttributes : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the Amazon SNS topic where Amazon SES will publish bounce notifications.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bounceTopic;

/**
 <p>The Amazon Resource Name (ARN) of the Amazon SNS topic where Amazon SES will publish complaint notifications.</p>
 */
@property (nonatomic, strong) NSString * _Nullable complaintTopic;

/**
 <p>The Amazon Resource Name (ARN) of the Amazon SNS topic where Amazon SES will publish delivery notifications.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deliveryTopic;

/**
 <p>Describes whether Amazon SES will forward bounce and complaint notifications as email. <code>true</code> indicates that Amazon SES will forward bounce and complaint notifications as email, while <code>false</code> indicates that bounce and complaint notifications will be published only to the specified bounce and complaint Amazon SNS topics.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable forwardingEnabled;

@end

/**
 <p>Represents the verification attributes of a single identity.</p>
 Required parameters: [VerificationStatus]
 */
@interface AWSSESIdentityVerificationAttributes : AWSModel


/**
 <p>The verification status of the identity: "Pending", "Success", "Failed", or "TemporaryFailure".</p>
 */
@property (nonatomic, assign) AWSSESVerificationStatus verificationStatus;

/**
 <p>The verification token for a domain identity. Null for email address identities.</p>
 */
@property (nonatomic, strong) NSString * _Nullable verificationToken;

@end

/**
 <p>Represents a request instructing the service to list all identities for the AWS Account.</p>
 */
@interface AWSSESListIdentitiesRequest : AWSRequest


/**
 <p>The type of the identities to list. Possible values are "EmailAddress" and "Domain". If this parameter is omitted, then all identities will be listed.</p>
 */
@property (nonatomic, assign) AWSSESIdentityType identityType;

/**
 <p>The maximum number of identities per page. Possible values are 1-100 inclusive.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxItems;

/**
 <p>The token to use for pagination.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>Represents a list of all verified identities for the AWS Account.</p>
 Required parameters: [Identities]
 */
@interface AWSSESListIdentitiesResponse : AWSModel


/**
 <p>A list of identities.</p>
 */
@property (nonatomic, strong) NSArray * _Nullable identities;

/**
 <p>The token used for pagination.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>Represents a list of all the email addresses verified for the current user.</p>
 */
@interface AWSSESListVerifiedEmailAddressesResponse : AWSModel


/**
 <p>A list of email addresses that have been verified.</p>
 */
@property (nonatomic, strong) NSArray * _Nullable verifiedEmailAddresses;

@end

/**
 <p>Represents the message to be sent, composed of a subject and a body.</p>
 Required parameters: [Subject, Body]
 */
@interface AWSSESMessage : AWSModel


/**
 <p>The message body.</p>
 */
@property (nonatomic, strong) AWSSESBody * _Nullable body;

/**
 <p>The subject of the message: A short summary of the content, which will appear in the recipient's inbox.</p>
 */
@property (nonatomic, strong) AWSSESContent * _Nullable subject;

@end

/**
 <p>Represents the raw data of the message.</p>
 Required parameters: [Data]
 */
@interface AWSSESRawMessage : AWSModel


/**
 <p>The raw data of the message. The client must ensure that the message format complies with Internet email standards regarding email header fields, MIME types, MIME encoding, and base64 encoding (if necessary). </p><p>The To:, CC:, and BCC: headers in the raw message can contain a group list. </p><p>For more information, go to the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/send-email-raw.html">Amazon SES Developer Guide</a>. </p>
 */
@property (nonatomic, strong) NSData * _Nullable data;

@end

/**
 <p>Represents sending statistics data. Each <code>SendDataPoint</code> contains statistics for a 15-minute period of sending activity. </p>
 */
@interface AWSSESSendDataPoint : AWSModel


/**
 <p>Number of emails that have bounced.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable bounces;

/**
 <p>Number of unwanted emails that were rejected by recipients.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable complaints;

/**
 <p>Number of emails that have been enqueued for sending.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable deliveryAttempts;

/**
 <p>Number of emails rejected by Amazon SES.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable rejects;

/**
 <p>Time of the data point.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable timestamp;

@end

/**
 <p>Represents a request instructing the service to send a single email message.</p><p>This datatype can be used in application code to compose a message consisting of source, destination, message, reply-to, and return-path parts. This object can then be sent using the <code>SendEmail</code> action. </p>
 Required parameters: [Source, Destination, Message]
 */
@interface AWSSESSendEmailRequest : AWSRequest


/**
 <p>The destination for this email, composed of To:, CC:, and BCC: fields.</p>
 */
@property (nonatomic, strong) AWSSESDestination * _Nullable destination;

/**
 <p>The message to be sent.</p>
 */
@property (nonatomic, strong) AWSSESMessage * _Nullable message;

/**
 <p>The reply-to email address(es) for the message. If the recipient replies to the message, each reply-to address will receive the reply. </p>
 */
@property (nonatomic, strong) NSArray * _Nullable replyToAddresses;

/**
 <p>The email address to which bounces and complaints are to be forwarded when feedback forwarding is enabled. If the message cannot be delivered to the recipient, then an error message will be returned from the recipient's ISP; this message will then be forwarded to the email address specified by the <code>ReturnPath</code> parameter. </p>
 */
@property (nonatomic, strong) NSString * _Nullable returnPath;

/**
 <p>The identity's email address.</p><p> By default, the string must be 7-bit ASCII. If the text must contain any other characters, then you must use MIME encoded-word syntax (RFC 2047) instead of a literal string. MIME encoded-word syntax uses the following form: <code>=?charset?encoding?encoded-text?=</code>. For more information, see <a href="http://tools.ietf.org/html/rfc2047">RFC 2047</a>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable source;

@end

/**
 <p>Represents a unique message ID returned from a successful <code>SendEmail</code> request. </p>
 Required parameters: [MessageId]
 */
@interface AWSSESSendEmailResponse : AWSModel


/**
 <p>The unique message identifier returned from the <code>SendEmail</code> action. </p>
 */
@property (nonatomic, strong) NSString * _Nullable messageId;

@end

/**
 <p>Represents a request instructing the service to send a raw email message.</p><p>This datatype can be used in application code to compose a message consisting of source, destination, and raw message text. This object can then be sent using the <code>SendRawEmail</code> action. </p>
 Required parameters: [RawMessage]
 */
@interface AWSSESSendRawEmailRequest : AWSRequest


/**
 <p>A list of destinations for the message, consisting of To:, CC:, and BCC: addresses.</p>
 */
@property (nonatomic, strong) NSArray * _Nullable destinations;

/**
 <p>The raw text of the message. The client is responsible for ensuring the following:</p><p><ul><li>Message must contain a header and a body, separated by a blank line.</li><li>All required header fields must be present.</li><li>Each part of a multipart MIME message must be formatted properly.</li><li>MIME content types must be among those supported by Amazon SES. For more information, go to the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/mime-types.html">Amazon SES Developer Guide</a>. </li><li>Content must be base64-encoded, if MIME requires it.</li></ul></p>
 */
@property (nonatomic, strong) AWSSESRawMessage * _Nullable rawMessage;

/**
 <p>The identity's email address.</p><p> By default, the string must be 7-bit ASCII. If the text must contain any other characters, then you must use MIME encoded-word syntax (RFC 2047) instead of a literal string. MIME encoded-word syntax uses the following form: <code>=?charset?encoding?encoded-text?=</code>. For more information, see <a href="http://tools.ietf.org/html/rfc2047">RFC 2047</a>. </p><note>If you specify the <code>Source</code> parameter and have feedback forwarding enabled, then bounces and complaints will be sent to this email address. This takes precedence over any <i>Return-Path</i> header that you might include in the raw text of the message. </note>
 */
@property (nonatomic, strong) NSString * _Nullable source;

@end

/**
 <p>Represents a unique message ID returned from a successful <code>SendRawEmail</code> request. </p>
 Required parameters: [MessageId]
 */
@interface AWSSESSendRawEmailResponse : AWSModel


/**
 <p>The unique message identifier returned from the <code>SendRawEmail</code> action. </p>
 */
@property (nonatomic, strong) NSString * _Nullable messageId;

@end

/**
 <p>Represents a request instructing the service to enable or disable DKIM signing for an identity.</p>
 Required parameters: [Identity, DkimEnabled]
 */
@interface AWSSESSetIdentityDkimEnabledRequest : AWSRequest


/**
 <p>Sets whether DKIM signing is enabled for an identity. Set to <code>true</code> to enable DKIM signing for this identity; <code>false</code> to disable it. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dkimEnabled;

/**
 <p>The identity for which DKIM signing should be enabled or disabled.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identity;

@end

/**
 <p>An empty element. Receiving this element indicates that the request completed successfully.</p>
 */
@interface AWSSESSetIdentityDkimEnabledResponse : AWSModel


@end

/**
 
 */
@interface AWSSESSetIdentityFeedbackForwardingEnabledRequest : AWSRequest


/**
 <p>Sets whether Amazon SES will forward bounce and complaint notifications as email. <code>true</code> specifies that Amazon SES will forward bounce and complaint notifications as email, in addition to any Amazon SNS topic publishing otherwise specified. <code>false</code> specifies that Amazon SES will publish bounce and complaint notifications only through Amazon SNS. This value can only be set to <code>false</code> when Amazon SNS topics are set for both <code>Bounce</code> and <code>Complaint</code> notification types.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable forwardingEnabled;

/**
 <p>The identity for which to set bounce and complaint notification forwarding. Examples: <code>user@example.com</code>, <code>example.com</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identity;

@end

/**
 <p>An empty element. Receiving this element indicates that the request completed successfully.</p>
 */
@interface AWSSESSetIdentityFeedbackForwardingEnabledResponse : AWSModel


@end

/**
 <p>Represents a request to set or clear an identity's notification topic.</p>
 Required parameters: [Identity, NotificationType]
 */
@interface AWSSESSetIdentityNotificationTopicRequest : AWSRequest


/**
 <p>The identity for which the Amazon SNS topic will be set. Examples: <code>user@example.com</code>, <code>example.com</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identity;

/**
 <p>The type of notifications that will be published to the specified Amazon SNS topic.</p>
 */
@property (nonatomic, assign) AWSSESNotificationType notificationType;

/**
 <p>The Amazon Resource Name (ARN) of the Amazon SNS topic. If the parameter is omitted from the request or a null value is passed, <code>SnsTopic</code> is cleared and publishing is disabled.</p>
 */
@property (nonatomic, strong) NSString * _Nullable snsTopic;

@end

/**
 <p>An empty element. Receiving this element indicates that the request completed successfully.</p>
 */
@interface AWSSESSetIdentityNotificationTopicResponse : AWSModel


@end

/**
 <p>Represents a request instructing the service to begin DKIM verification for a domain.</p>
 Required parameters: [Domain]
 */
@interface AWSSESVerifyDomainDkimRequest : AWSRequest


/**
 <p>The name of the domain to be verified for Easy DKIM signing.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domain;

@end

/**
 <p>Represents the DNS records that must be published in the domain name's DNS to complete DKIM setup.</p>
 Required parameters: [DkimTokens]
 */
@interface AWSSESVerifyDomainDkimResponse : AWSModel


/**
 <p>A set of character strings that represent the domain's identity. If the identity is an email address, the tokens represent the domain of that address.</p><p>Using these tokens, you will need to create DNS CNAME records that point to DKIM public keys hosted by Amazon SES. Amazon Web Services will eventually detect that you have updated your DNS records; this detection process may take up to 72 hours. Upon successful detection, Amazon SES will be able to DKIM-sign emails originating from that domain.</p><p>For more information about creating DNS records using DKIM tokens, go to the <a href="http://docs.aws.amazon.com/ses/latest/DeveloperGuide/easy-dkim-dns-records.html">Amazon SES Developer Guide</a>.</p>
 */
@property (nonatomic, strong) NSArray * _Nullable dkimTokens;

@end

/**
 <p>Represents a request instructing the service to begin domain verification.</p>
 Required parameters: [Domain]
 */
@interface AWSSESVerifyDomainIdentityRequest : AWSRequest


/**
 <p>The domain to be verified.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domain;

@end

/**
 <p>Represents a token used for domain ownership verification.</p>
 Required parameters: [VerificationToken]
 */
@interface AWSSESVerifyDomainIdentityResponse : AWSModel


/**
 <p>A TXT record that must be placed in the DNS settings for the domain, in order to complete domain verification.</p>
 */
@property (nonatomic, strong) NSString * _Nullable verificationToken;

@end

/**
 <p>Represents a request instructing the service to begin email address verification.</p>
 Required parameters: [EmailAddress]
 */
@interface AWSSESVerifyEmailAddressRequest : AWSRequest


/**
 <p>The email address to be verified.</p>
 */
@property (nonatomic, strong) NSString * _Nullable emailAddress;

@end

/**
 <p>Represents a request instructing the service to begin email address verification.</p>
 Required parameters: [EmailAddress]
 */
@interface AWSSESVerifyEmailIdentityRequest : AWSRequest


/**
 <p>The email address to be verified.</p>
 */
@property (nonatomic, strong) NSString * _Nullable emailAddress;

@end

/**
 <p>An empty element. Receiving this element indicates that the request completed successfully.</p>
 */
@interface AWSSESVerifyEmailIdentityResponse : AWSModel


@end

NS_ASSUME_NONNULL_END
