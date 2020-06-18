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

FOUNDATION_EXPORT NSString *const AWSSESErrorDomain;

typedef NS_ENUM(NSInteger, AWSSESErrorType) {
    AWSSESErrorUnknown,
    AWSSESErrorAccountSuspended,
    AWSSESErrorAlreadyExists,
    AWSSESErrorBadRequest,
    AWSSESErrorConcurrentModification,
    AWSSESErrorInvalidNextToken,
    AWSSESErrorLimitExceeded,
    AWSSESErrorMailFromDomainNotVerified,
    AWSSESErrorMessageRejected,
    AWSSESErrorNotFound,
    AWSSESErrorSendingPaused,
    AWSSESErrorTooManyRequests,
};

typedef NS_ENUM(NSInteger, AWSSESBehaviorOnMxFailure) {
    AWSSESBehaviorOnMxFailureUnknown,
    AWSSESBehaviorOnMxFailureUseDefaultValue,
    AWSSESBehaviorOnMxFailureRejectMessage,
};

typedef NS_ENUM(NSInteger, AWSSESDeliverabilityDashboardAccountStatus) {
    AWSSESDeliverabilityDashboardAccountStatusUnknown,
    AWSSESDeliverabilityDashboardAccountStatusActive,
    AWSSESDeliverabilityDashboardAccountStatusPendingExpiration,
    AWSSESDeliverabilityDashboardAccountStatusDisabled,
};

typedef NS_ENUM(NSInteger, AWSSESDeliverabilityTestStatus) {
    AWSSESDeliverabilityTestStatusUnknown,
    AWSSESDeliverabilityTestStatusInProgress,
    AWSSESDeliverabilityTestStatusCompleted,
};

typedef NS_ENUM(NSInteger, AWSSESDimensionValueSource) {
    AWSSESDimensionValueSourceUnknown,
    AWSSESDimensionValueSourceMessageTag,
    AWSSESDimensionValueSourceEmailHeader,
    AWSSESDimensionValueSourceLinkTag,
};

typedef NS_ENUM(NSInteger, AWSSESDkimSigningAttributesOrigin) {
    AWSSESDkimSigningAttributesOriginUnknown,
    AWSSESDkimSigningAttributesOriginAwsSes,
    AWSSESDkimSigningAttributesOriginExternal,
};

typedef NS_ENUM(NSInteger, AWSSESDkimStatus) {
    AWSSESDkimStatusUnknown,
    AWSSESDkimStatusPending,
    AWSSESDkimStatusSuccess,
    AWSSESDkimStatusFailed,
    AWSSESDkimStatusTemporaryFailure,
    AWSSESDkimStatusNotStarted,
};

typedef NS_ENUM(NSInteger, AWSSESEventType) {
    AWSSESEventTypeUnknown,
    AWSSESEventTypeSend,
    AWSSESEventTypeReject,
    AWSSESEventTypeBounce,
    AWSSESEventTypeComplaint,
    AWSSESEventTypeDelivery,
    AWSSESEventTypeOpen,
    AWSSESEventTypeClick,
    AWSSESEventTypeRenderingFailure,
    AWSSESEventTypeDeliveryDelay,
};

typedef NS_ENUM(NSInteger, AWSSESIdentityType) {
    AWSSESIdentityTypeUnknown,
    AWSSESIdentityTypeEmailAddress,
    AWSSESIdentityTypeDomain,
    AWSSESIdentityTypeManagedDomain,
};

typedef NS_ENUM(NSInteger, AWSSESMailFromDomainStatus) {
    AWSSESMailFromDomainStatusUnknown,
    AWSSESMailFromDomainStatusPending,
    AWSSESMailFromDomainStatusSuccess,
    AWSSESMailFromDomainStatusFailed,
    AWSSESMailFromDomainStatusTemporaryFailure,
};

typedef NS_ENUM(NSInteger, AWSSESSuppressionListReason) {
    AWSSESSuppressionListReasonUnknown,
    AWSSESSuppressionListReasonBounce,
    AWSSESSuppressionListReasonComplaint,
};

typedef NS_ENUM(NSInteger, AWSSESTlsPolicy) {
    AWSSESTlsPolicyUnknown,
    AWSSESTlsPolicyRequire,
    AWSSESTlsPolicyOptional,
};

typedef NS_ENUM(NSInteger, AWSSESWarmupStatus) {
    AWSSESWarmupStatusUnknown,
    AWSSESWarmupStatusInProgress,
    AWSSESWarmupStatusDone,
};

@class AWSSESBlacklistEntry;
@class AWSSESBody;
@class AWSSESCloudWatchDestination;
@class AWSSESCloudWatchDimensionConfiguration;
@class AWSSESContent;
@class AWSSESCreateConfigurationSetEventDestinationRequest;
@class AWSSESCreateConfigurationSetEventDestinationResponse;
@class AWSSESCreateConfigurationSetRequest;
@class AWSSESCreateConfigurationSetResponse;
@class AWSSESCreateDedicatedIpPoolRequest;
@class AWSSESCreateDedicatedIpPoolResponse;
@class AWSSESCreateDeliverabilityTestReportRequest;
@class AWSSESCreateDeliverabilityTestReportResponse;
@class AWSSESCreateEmailIdentityRequest;
@class AWSSESCreateEmailIdentityResponse;
@class AWSSESDailyVolume;
@class AWSSESDedicatedIp;
@class AWSSESDeleteConfigurationSetEventDestinationRequest;
@class AWSSESDeleteConfigurationSetEventDestinationResponse;
@class AWSSESDeleteConfigurationSetRequest;
@class AWSSESDeleteConfigurationSetResponse;
@class AWSSESDeleteDedicatedIpPoolRequest;
@class AWSSESDeleteDedicatedIpPoolResponse;
@class AWSSESDeleteEmailIdentityRequest;
@class AWSSESDeleteEmailIdentityResponse;
@class AWSSESDeleteSuppressedDestinationRequest;
@class AWSSESDeleteSuppressedDestinationResponse;
@class AWSSESDeliverabilityTestReport;
@class AWSSESDeliveryOptions;
@class AWSSESDestination;
@class AWSSESDkimAttributes;
@class AWSSESDkimSigningAttributes;
@class AWSSESDomainDeliverabilityCampaign;
@class AWSSESDomainDeliverabilityTrackingOption;
@class AWSSESDomainIspPlacement;
@class AWSSESEmailContent;
@class AWSSESEventDestination;
@class AWSSESEventDestinationDefinition;
@class AWSSESGetAccountRequest;
@class AWSSESGetAccountResponse;
@class AWSSESGetBlacklistReportsRequest;
@class AWSSESGetBlacklistReportsResponse;
@class AWSSESGetConfigurationSetEventDestinationsRequest;
@class AWSSESGetConfigurationSetEventDestinationsResponse;
@class AWSSESGetConfigurationSetRequest;
@class AWSSESGetConfigurationSetResponse;
@class AWSSESGetDedicatedIpRequest;
@class AWSSESGetDedicatedIpResponse;
@class AWSSESGetDedicatedIpsRequest;
@class AWSSESGetDedicatedIpsResponse;
@class AWSSESGetDeliverabilityDashboardOptionsRequest;
@class AWSSESGetDeliverabilityDashboardOptionsResponse;
@class AWSSESGetDeliverabilityTestReportRequest;
@class AWSSESGetDeliverabilityTestReportResponse;
@class AWSSESGetDomainDeliverabilityCampaignRequest;
@class AWSSESGetDomainDeliverabilityCampaignResponse;
@class AWSSESGetDomainStatisticsReportRequest;
@class AWSSESGetDomainStatisticsReportResponse;
@class AWSSESGetEmailIdentityRequest;
@class AWSSESGetEmailIdentityResponse;
@class AWSSESGetSuppressedDestinationRequest;
@class AWSSESGetSuppressedDestinationResponse;
@class AWSSESIdentityInfo;
@class AWSSESInboxPlacementTrackingOption;
@class AWSSESIspPlacement;
@class AWSSESKinesisFirehoseDestination;
@class AWSSESListConfigurationSetsRequest;
@class AWSSESListConfigurationSetsResponse;
@class AWSSESListDedicatedIpPoolsRequest;
@class AWSSESListDedicatedIpPoolsResponse;
@class AWSSESListDeliverabilityTestReportsRequest;
@class AWSSESListDeliverabilityTestReportsResponse;
@class AWSSESListDomainDeliverabilityCampaignsRequest;
@class AWSSESListDomainDeliverabilityCampaignsResponse;
@class AWSSESListEmailIdentitiesRequest;
@class AWSSESListEmailIdentitiesResponse;
@class AWSSESListSuppressedDestinationsRequest;
@class AWSSESListSuppressedDestinationsResponse;
@class AWSSESListTagsForResourceRequest;
@class AWSSESListTagsForResourceResponse;
@class AWSSESMailFromAttributes;
@class AWSSESMessage;
@class AWSSESMessageTag;
@class AWSSESOverallVolume;
@class AWSSESPinpointDestination;
@class AWSSESPlacementStatistics;
@class AWSSESPutAccountDedicatedIpWarmupAttributesRequest;
@class AWSSESPutAccountDedicatedIpWarmupAttributesResponse;
@class AWSSESPutAccountSendingAttributesRequest;
@class AWSSESPutAccountSendingAttributesResponse;
@class AWSSESPutAccountSuppressionAttributesRequest;
@class AWSSESPutAccountSuppressionAttributesResponse;
@class AWSSESPutConfigurationSetDeliveryOptionsRequest;
@class AWSSESPutConfigurationSetDeliveryOptionsResponse;
@class AWSSESPutConfigurationSetReputationOptionsRequest;
@class AWSSESPutConfigurationSetReputationOptionsResponse;
@class AWSSESPutConfigurationSetSendingOptionsRequest;
@class AWSSESPutConfigurationSetSendingOptionsResponse;
@class AWSSESPutConfigurationSetSuppressionOptionsRequest;
@class AWSSESPutConfigurationSetSuppressionOptionsResponse;
@class AWSSESPutConfigurationSetTrackingOptionsRequest;
@class AWSSESPutConfigurationSetTrackingOptionsResponse;
@class AWSSESPutDedicatedIpInPoolRequest;
@class AWSSESPutDedicatedIpInPoolResponse;
@class AWSSESPutDedicatedIpWarmupAttributesRequest;
@class AWSSESPutDedicatedIpWarmupAttributesResponse;
@class AWSSESPutDeliverabilityDashboardOptionRequest;
@class AWSSESPutDeliverabilityDashboardOptionResponse;
@class AWSSESPutEmailIdentityDkimAttributesRequest;
@class AWSSESPutEmailIdentityDkimAttributesResponse;
@class AWSSESPutEmailIdentityDkimSigningAttributesRequest;
@class AWSSESPutEmailIdentityDkimSigningAttributesResponse;
@class AWSSESPutEmailIdentityFeedbackAttributesRequest;
@class AWSSESPutEmailIdentityFeedbackAttributesResponse;
@class AWSSESPutEmailIdentityMailFromAttributesRequest;
@class AWSSESPutEmailIdentityMailFromAttributesResponse;
@class AWSSESPutSuppressedDestinationRequest;
@class AWSSESPutSuppressedDestinationResponse;
@class AWSSESRawMessage;
@class AWSSESReputationOptions;
@class AWSSESSendEmailRequest;
@class AWSSESSendEmailResponse;
@class AWSSESSendQuota;
@class AWSSESSendingOptions;
@class AWSSESSnsDestination;
@class AWSSESSuppressedDestination;
@class AWSSESSuppressedDestinationAttributes;
@class AWSSESSuppressedDestinationSummary;
@class AWSSESSuppressionAttributes;
@class AWSSESSuppressionOptions;
@class AWSSESTag;
@class AWSSESTagResourceRequest;
@class AWSSESTagResourceResponse;
@class AWSSESTemplate;
@class AWSSESTrackingOptions;
@class AWSSESUntagResourceRequest;
@class AWSSESUntagResourceResponse;
@class AWSSESUpdateConfigurationSetEventDestinationRequest;
@class AWSSESUpdateConfigurationSetEventDestinationResponse;
@class AWSSESVolumeStatistics;

/**
 <p>An object that contains information about a blacklisting event that impacts one of the dedicated IP addresses that is associated with your account.</p>
 */
@interface AWSSESBlacklistEntry : AWSModel


/**
 <p>Additional information about the blacklisting event, as provided by the blacklist maintainer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The time when the blacklisting event occurred, shown in Unix time format.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable listingTime;

/**
 <p>The name of the blacklist that the IP address appears on.</p>
 */
@property (nonatomic, strong) NSString * _Nullable rblName;

@end

/**
 <p>Represents the body of the email message.</p>
 */
@interface AWSSESBody : AWSModel


/**
 <p>An object that represents the version of the message that is displayed in email clients that support HTML. HTML messages can include formatted text, hyperlinks, images, and more. </p>
 */
@property (nonatomic, strong) AWSSESContent * _Nullable html;

/**
 <p>An object that represents the version of the message that is displayed in email clients that don't support HTML, or clients where the recipient has disabled HTML rendering.</p>
 */
@property (nonatomic, strong) AWSSESContent * _Nullable text;

@end

/**
 <p>An object that defines an Amazon CloudWatch destination for email events. You can use Amazon CloudWatch to monitor and gain insights on your email sending metrics.</p>
 Required parameters: [DimensionConfigurations]
 */
@interface AWSSESCloudWatchDestination : AWSModel


/**
 <p>An array of objects that define the dimensions to use when you send email events to Amazon CloudWatch.</p>
 */
@property (nonatomic, strong) NSArray<AWSSESCloudWatchDimensionConfiguration *> * _Nullable dimensionConfigurations;

@end

/**
 <p>An object that defines the dimension configuration to use when you send email events to Amazon CloudWatch.</p>
 Required parameters: [DimensionName, DimensionValueSource, DefaultDimensionValue]
 */
@interface AWSSESCloudWatchDimensionConfiguration : AWSModel


/**
 <p>The default value of the dimension that is published to Amazon CloudWatch if you don't provide the value of the dimension when you send an email. This value has to meet the following criteria:</p><ul><li><p>It can only contain ASCII letters (a–z, A–Z), numbers (0–9), underscores (_), or dashes (-).</p></li><li><p>It can contain no more than 256 characters.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable defaultDimensionValue;

/**
 <p>The name of an Amazon CloudWatch dimension associated with an email sending metric. The name has to meet the following criteria:</p><ul><li><p>It can only contain ASCII letters (a–z, A–Z), numbers (0–9), underscores (_), or dashes (-).</p></li><li><p>It can contain no more than 256 characters.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable dimensionName;

/**
 <p>The location where the Amazon SES API v2 finds the value of a dimension to publish to Amazon CloudWatch. If you want to use the message tags that you specify using an <code>X-SES-MESSAGE-TAGS</code> header or a parameter to the <code>SendEmail</code> or <code>SendRawEmail</code> API, choose <code>messageTag</code>. If you want to use your own email headers, choose <code>emailHeader</code>. If you want to use link tags, choose <code>linkTags</code>.</p>
 */
@property (nonatomic, assign) AWSSESDimensionValueSource dimensionValueSource;

@end

/**
 <p>An object that represents the content of the email, and optionally a character set specification.</p>
 Required parameters: [Data]
 */
@interface AWSSESContent : AWSModel


/**
 <p>The character set for the content. Because of the constraints of the SMTP protocol, Amazon SES uses 7-bit ASCII by default. If the text includes characters outside of the ASCII range, you have to specify a character set. For example, you could specify <code>UTF-8</code>, <code>ISO-8859-1</code>, or <code>Shift_JIS</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable charset;

/**
 <p>The content of the message itself.</p>
 */
@property (nonatomic, strong) NSString * _Nullable data;

@end

/**
 <p>A request to add an event destination to a configuration set.</p>
 Required parameters: [ConfigurationSetName, EventDestinationName, EventDestination]
 */
@interface AWSSESCreateConfigurationSetEventDestinationRequest : AWSRequest


/**
 <p>The name of the configuration set that you want to add an event destination to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable configurationSetName;

/**
 <p>An object that defines the event destination.</p>
 */
@property (nonatomic, strong) AWSSESEventDestinationDefinition * _Nullable eventDestination;

/**
 <p>A name that identifies the event destination within the configuration set.</p>
 */
@property (nonatomic, strong) NSString * _Nullable eventDestinationName;

@end

/**
 <p>An HTTP 200 response if the request succeeds, or an error message if the request fails.</p>
 */
@interface AWSSESCreateConfigurationSetEventDestinationResponse : AWSModel


@end

/**
 <p>A request to create a configuration set.</p>
 Required parameters: [ConfigurationSetName]
 */
@interface AWSSESCreateConfigurationSetRequest : AWSRequest


/**
 <p>The name of the configuration set.</p>
 */
@property (nonatomic, strong) NSString * _Nullable configurationSetName;

/**
 <p>An object that defines the dedicated IP pool that is used to send emails that you send using the configuration set.</p>
 */
@property (nonatomic, strong) AWSSESDeliveryOptions * _Nullable deliveryOptions;

/**
 <p>An object that defines whether or not Amazon SES collects reputation metrics for the emails that you send that use the configuration set.</p>
 */
@property (nonatomic, strong) AWSSESReputationOptions * _Nullable reputationOptions;

/**
 <p>An object that defines whether or not Amazon SES can send email that you send using the configuration set.</p>
 */
@property (nonatomic, strong) AWSSESSendingOptions * _Nullable sendingOptions;

/**
 <p>An object that contains information about the suppression list preferences for your account.</p>
 */
@property (nonatomic, strong) AWSSESSuppressionOptions * _Nullable suppressionOptions;

/**
 <p>An array of objects that define the tags (keys and values) that you want to associate with the configuration set.</p>
 */
@property (nonatomic, strong) NSArray<AWSSESTag *> * _Nullable tags;

/**
 <p>An object that defines the open and click tracking options for emails that you send using the configuration set.</p>
 */
@property (nonatomic, strong) AWSSESTrackingOptions * _Nullable trackingOptions;

@end

/**
 <p>An HTTP 200 response if the request succeeds, or an error message if the request fails.</p>
 */
@interface AWSSESCreateConfigurationSetResponse : AWSModel


@end

/**
 <p>A request to create a new dedicated IP pool.</p>
 Required parameters: [PoolName]
 */
@interface AWSSESCreateDedicatedIpPoolRequest : AWSRequest


/**
 <p>The name of the dedicated IP pool.</p>
 */
@property (nonatomic, strong) NSString * _Nullable poolName;

/**
 <p>An object that defines the tags (keys and values) that you want to associate with the pool.</p>
 */
@property (nonatomic, strong) NSArray<AWSSESTag *> * _Nullable tags;

@end

/**
 <p>An HTTP 200 response if the request succeeds, or an error message if the request fails.</p>
 */
@interface AWSSESCreateDedicatedIpPoolResponse : AWSModel


@end

/**
 <p>A request to perform a predictive inbox placement test. Predictive inbox placement tests can help you predict how your messages will be handled by various email providers around the world. When you perform a predictive inbox placement test, you provide a sample message that contains the content that you plan to send to your customers. We send that message to special email addresses spread across several major email providers around the world. The test takes about 24 hours to complete. When the test is complete, you can use the <code>GetDeliverabilityTestReport</code> operation to view the results of the test.</p>
 Required parameters: [FromEmailAddress, Content]
 */
@interface AWSSESCreateDeliverabilityTestReportRequest : AWSRequest


/**
 <p>The HTML body of the message that you sent when you performed the predictive inbox placement test.</p>
 */
@property (nonatomic, strong) AWSSESEmailContent * _Nullable content;

/**
 <p>The email address that the predictive inbox placement test email was sent from.</p>
 */
@property (nonatomic, strong) NSString * _Nullable fromEmailAddress;

/**
 <p>A unique name that helps you to identify the predictive inbox placement test when you retrieve the results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable reportName;

/**
 <p>An array of objects that define the tags (keys and values) that you want to associate with the predictive inbox placement test.</p>
 */
@property (nonatomic, strong) NSArray<AWSSESTag *> * _Nullable tags;

@end

/**
 <p>Information about the predictive inbox placement test that you created.</p>
 Required parameters: [ReportId, DeliverabilityTestStatus]
 */
@interface AWSSESCreateDeliverabilityTestReportResponse : AWSModel


/**
 <p>The status of the predictive inbox placement test. If the status is <code>IN_PROGRESS</code>, then the predictive inbox placement test is currently running. Predictive inbox placement tests are usually complete within 24 hours of creating the test. If the status is <code>COMPLETE</code>, then the test is finished, and you can use the <code>GetDeliverabilityTestReport</code> to view the results of the test.</p>
 */
@property (nonatomic, assign) AWSSESDeliverabilityTestStatus deliverabilityTestStatus;

/**
 <p>A unique string that identifies the predictive inbox placement test.</p>
 */
@property (nonatomic, strong) NSString * _Nullable reportId;

@end

/**
 <p>A request to begin the verification process for an email identity (an email address or domain).</p>
 Required parameters: [EmailIdentity]
 */
@interface AWSSESCreateEmailIdentityRequest : AWSRequest


/**
 <p>If your request includes this object, Amazon SES configures the identity to use Bring Your Own DKIM (BYODKIM) for DKIM authentication purposes, as opposed to the default method, <a href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/easy-dkim.html">Easy DKIM</a>.</p><p>You can only specify this object if the email identity is a domain, as opposed to an address.</p>
 */
@property (nonatomic, strong) AWSSESDkimSigningAttributes * _Nullable dkimSigningAttributes;

/**
 <p>The email address or domain that you want to verify.</p>
 */
@property (nonatomic, strong) NSString * _Nullable emailIdentity;

/**
 <p>An array of objects that define the tags (keys and values) that you want to associate with the email identity.</p>
 */
@property (nonatomic, strong) NSArray<AWSSESTag *> * _Nullable tags;

@end

/**
 <p>If the email identity is a domain, this object contains information about the DKIM verification status for the domain.</p><p>If the email identity is an email address, this object is empty. </p>
 */
@interface AWSSESCreateEmailIdentityResponse : AWSModel


/**
 <p>An object that contains information about the DKIM attributes for the identity.</p>
 */
@property (nonatomic, strong) AWSSESDkimAttributes * _Nullable dkimAttributes;

/**
 <p>The email identity type.</p>
 */
@property (nonatomic, assign) AWSSESIdentityType identityType;

/**
 <p>Specifies whether or not the identity is verified. You can only send email from verified email addresses or domains. For more information about verifying identities, see the <a href="https://docs.aws.amazon.com/pinpoint/latest/userguide/channels-email-manage-verify.html">Amazon Pinpoint User Guide</a>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable verifiedForSendingStatus;

@end

/**
 <p>An object that contains information about the volume of email sent on each day of the analysis period.</p>
 */
@interface AWSSESDailyVolume : AWSModel


/**
 <p>An object that contains inbox placement metrics for a specified day in the analysis period, broken out by the recipient's email provider.</p>
 */
@property (nonatomic, strong) NSArray<AWSSESDomainIspPlacement *> * _Nullable domainIspPlacements;

/**
 <p>The date that the DailyVolume metrics apply to, in Unix time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable startDate;

/**
 <p>An object that contains inbox placement metrics for a specific day in the analysis period.</p>
 */
@property (nonatomic, strong) AWSSESVolumeStatistics * _Nullable volumeStatistics;

@end

/**
 <p>Contains information about a dedicated IP address that is associated with your Amazon SES account.</p><p>To learn more about requesting dedicated IP addresses, see <a href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/dedicated-ip-case.html">Requesting and Relinquishing Dedicated IP Addresses</a> in the <i>Amazon SES Developer Guide</i>.</p>
 Required parameters: [Ip, WarmupStatus, WarmupPercentage]
 */
@interface AWSSESDedicatedIp : AWSModel


/**
 <p>An IPv4 address.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ip;

/**
 <p>The name of the dedicated IP pool that the IP address is associated with.</p>
 */
@property (nonatomic, strong) NSString * _Nullable poolName;

/**
 <p>Indicates how complete the dedicated IP warm-up process is. When this value equals 1, the address has completed the warm-up process and is ready for use.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable warmupPercentage;

/**
 <p>The warm-up status of a dedicated IP address. The status can have one of the following values:</p><ul><li><p><code>IN_PROGRESS</code> – The IP address isn't ready to use because the dedicated IP warm-up process is ongoing.</p></li><li><p><code>DONE</code> – The dedicated IP warm-up process is complete, and the IP address is ready to use.</p></li></ul>
 */
@property (nonatomic, assign) AWSSESWarmupStatus warmupStatus;

@end

/**
 <p>A request to delete an event destination from a configuration set.</p>
 Required parameters: [ConfigurationSetName, EventDestinationName]
 */
@interface AWSSESDeleteConfigurationSetEventDestinationRequest : AWSRequest


/**
 <p>The name of the configuration set that contains the event destination that you want to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable configurationSetName;

/**
 <p>The name of the event destination that you want to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable eventDestinationName;

@end

/**
 <p>An HTTP 200 response if the request succeeds, or an error message if the request fails.</p>
 */
@interface AWSSESDeleteConfigurationSetEventDestinationResponse : AWSModel


@end

/**
 <p>A request to delete a configuration set.</p>
 Required parameters: [ConfigurationSetName]
 */
@interface AWSSESDeleteConfigurationSetRequest : AWSRequest


/**
 <p>The name of the configuration set that you want to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable configurationSetName;

@end

/**
 <p>An HTTP 200 response if the request succeeds, or an error message if the request fails.</p>
 */
@interface AWSSESDeleteConfigurationSetResponse : AWSModel


@end

/**
 <p>A request to delete a dedicated IP pool.</p>
 Required parameters: [PoolName]
 */
@interface AWSSESDeleteDedicatedIpPoolRequest : AWSRequest


/**
 <p>The name of the dedicated IP pool that you want to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable poolName;

@end

/**
 <p>An HTTP 200 response if the request succeeds, or an error message if the request fails.</p>
 */
@interface AWSSESDeleteDedicatedIpPoolResponse : AWSModel


@end

/**
 <p>A request to delete an existing email identity. When you delete an identity, you lose the ability to send email from that identity. You can restore your ability to send email by completing the verification process for the identity again.</p>
 Required parameters: [EmailIdentity]
 */
@interface AWSSESDeleteEmailIdentityRequest : AWSRequest


/**
 <p>The identity (that is, the email address or domain) that you want to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable emailIdentity;

@end

/**
 <p>An HTTP 200 response if the request succeeds, or an error message if the request fails.</p>
 */
@interface AWSSESDeleteEmailIdentityResponse : AWSModel


@end

/**
 <p>A request to remove an email address from the suppression list for your account.</p>
 Required parameters: [EmailAddress]
 */
@interface AWSSESDeleteSuppressedDestinationRequest : AWSRequest


/**
 <p>The suppressed email destination to remove from the account suppression list.</p>
 */
@property (nonatomic, strong) NSString * _Nullable emailAddress;

@end

/**
 <p>An HTTP 200 response if the request succeeds, or an error message if the request fails.</p>
 */
@interface AWSSESDeleteSuppressedDestinationResponse : AWSModel


@end

/**
 <p>An object that contains metadata related to a predictive inbox placement test.</p>
 */
@interface AWSSESDeliverabilityTestReport : AWSModel


/**
 <p>The date and time when the predictive inbox placement test was created, in Unix time format.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createDate;

/**
 <p>The status of the predictive inbox placement test. If the status is <code>IN_PROGRESS</code>, then the predictive inbox placement test is currently running. Predictive inbox placement tests are usually complete within 24 hours of creating the test. If the status is <code>COMPLETE</code>, then the test is finished, and you can use the <code>GetDeliverabilityTestReport</code> to view the results of the test.</p>
 */
@property (nonatomic, assign) AWSSESDeliverabilityTestStatus deliverabilityTestStatus;

/**
 <p>The sender address that you specified for the predictive inbox placement test.</p>
 */
@property (nonatomic, strong) NSString * _Nullable fromEmailAddress;

/**
 <p>A unique string that identifies the predictive inbox placement test.</p>
 */
@property (nonatomic, strong) NSString * _Nullable reportId;

/**
 <p>A name that helps you identify a predictive inbox placement test report.</p>
 */
@property (nonatomic, strong) NSString * _Nullable reportName;

/**
 <p>The subject line for an email that you submitted in a predictive inbox placement test.</p>
 */
@property (nonatomic, strong) NSString * _Nullable subject;

@end

/**
 <p>Used to associate a configuration set with a dedicated IP pool.</p>
 */
@interface AWSSESDeliveryOptions : AWSModel


/**
 <p>The name of the dedicated IP pool that you want to associate with the configuration set.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sendingPoolName;

/**
 <p>Specifies whether messages that use the configuration set are required to use Transport Layer Security (TLS). If the value is <code>Require</code>, messages are only delivered if a TLS connection can be established. If the value is <code>Optional</code>, messages can be delivered in plain text if a TLS connection can't be established.</p>
 */
@property (nonatomic, assign) AWSSESTlsPolicy tlsPolicy;

@end

/**
 <p>An object that describes the recipients for an email.</p>
 */
@interface AWSSESDestination : AWSModel


/**
 <p>An array that contains the email addresses of the "BCC" (blind carbon copy) recipients for the email.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable bccAddresses;

/**
 <p>An array that contains the email addresses of the "CC" (carbon copy) recipients for the email.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable ccAddresses;

/**
 <p>An array that contains the email addresses of the "To" recipients for the email.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable toAddresses;

@end

/**
 <p>An object that contains information about the DKIM authentication status for an email identity.</p><p>Amazon SES determines the authentication status by searching for specific records in the DNS configuration for the domain. If you used <a href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/easy-dkim.html">Easy DKIM</a> to set up DKIM authentication, Amazon SES tries to find three unique CNAME records in the DNS configuration for your domain. If you provided a public key to perform DKIM authentication, Amazon SES tries to find a TXT record that uses the selector that you specified. The value of the TXT record must be a public key that's paired with the private key that you specified in the process of creating the identity</p>
 */
@interface AWSSESDkimAttributes : AWSModel


/**
 <p>A string that indicates how DKIM was configured for the identity. There are two possible values:</p><ul><li><p><code>AWS_SES</code> – Indicates that DKIM was configured for the identity by using <a href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/easy-dkim.html">Easy DKIM</a>.</p></li><li><p><code>EXTERNAL</code> – Indicates that DKIM was configured for the identity by using Bring Your Own DKIM (BYODKIM).</p></li></ul>
 */
@property (nonatomic, assign) AWSSESDkimSigningAttributesOrigin signingAttributesOrigin;

/**
 <p>If the value is <code>true</code>, then the messages that you send from the identity are signed using DKIM. If the value is <code>false</code>, then the messages that you send from the identity aren't DKIM-signed.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable signingEnabled;

/**
 <p>Describes whether or not Amazon SES has successfully located the DKIM records in the DNS records for the domain. The status can be one of the following:</p><ul><li><p><code>PENDING</code> – The verification process was initiated, but Amazon SES hasn't yet detected the DKIM records in the DNS configuration for the domain.</p></li><li><p><code>SUCCESS</code> – The verification process completed successfully.</p></li><li><p><code>FAILED</code> – The verification process failed. This typically occurs when Amazon SES fails to find the DKIM records in the DNS configuration of the domain.</p></li><li><p><code>TEMPORARY_FAILURE</code> – A temporary issue is preventing Amazon SES from determining the DKIM authentication status of the domain.</p></li><li><p><code>NOT_STARTED</code> – The DKIM verification process hasn't been initiated for the domain.</p></li></ul>
 */
@property (nonatomic, assign) AWSSESDkimStatus status;

/**
 <p>If you used <a href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/easy-dkim.html">Easy DKIM</a> to configure DKIM authentication for the domain, then this object contains a set of unique strings that you use to create a set of CNAME records that you add to the DNS configuration for your domain. When Amazon SES detects these records in the DNS configuration for your domain, the DKIM authentication process is complete.</p><p>If you configured DKIM authentication for the domain by providing your own public-private key pair, then this object contains the selector for the public key.</p><p>Regardless of the DKIM authentication method you use, Amazon SES searches for the appropriate records in the DNS configuration of the domain for up to 72 hours.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable tokens;

@end

/**
 <p>An object that contains information about the tokens used for setting up Bring Your Own DKIM (BYODKIM).</p>
 Required parameters: [DomainSigningSelector, DomainSigningPrivateKey]
 */
@interface AWSSESDkimSigningAttributes : AWSModel


/**
 <p>A private key that's used to generate a DKIM signature.</p><p>The private key must use 1024-bit RSA encryption, and must be encoded using base64 encoding.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainSigningPrivateKey;

/**
 <p>A string that's used to identify a public key in the DNS configuration for a domain.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainSigningSelector;

@end

/**
 <p>An object that contains the deliverability data for a specific campaign. This data is available for a campaign only if the campaign sent email by using a domain that the Deliverability dashboard is enabled for (<code>PutDeliverabilityDashboardOption</code> operation).</p>
 */
@interface AWSSESDomainDeliverabilityCampaign : AWSModel


/**
 <p>The unique identifier for the campaign. The Deliverability dashboard automatically generates and assigns this identifier to a campaign.</p>
 */
@property (nonatomic, strong) NSString * _Nullable campaignId;

/**
 <p>The percentage of email messages that were deleted by recipients, without being opened first. Due to technical limitations, this value only includes recipients who opened the message by using an email client that supports images.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable deleteRate;

/**
 <p>The major email providers who handled the email message.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable esps;

/**
 <p>The first time, in Unix time format, when the email message was delivered to any recipient's inbox. This value can help you determine how long it took for a campaign to deliver an email message.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable firstSeenDateTime;

/**
 <p>The verified email address that the email message was sent from.</p>
 */
@property (nonatomic, strong) NSString * _Nullable fromAddress;

/**
 <p>The URL of an image that contains a snapshot of the email message that was sent.</p>
 */
@property (nonatomic, strong) NSString * _Nullable imageUrl;

/**
 <p>The number of email messages that were delivered to recipients’ inboxes.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable inboxCount;

/**
 <p>The last time, in Unix time format, when the email message was delivered to any recipient's inbox. This value can help you determine how long it took for a campaign to deliver an email message.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastSeenDateTime;

/**
 <p>The projected number of recipients that the email message was sent to.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable projectedVolume;

/**
 <p>The percentage of email messages that were opened and then deleted by recipients. Due to technical limitations, this value only includes recipients who opened the message by using an email client that supports images.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable readDeleteRate;

/**
 <p>The percentage of email messages that were opened by recipients. Due to technical limitations, this value only includes recipients who opened the message by using an email client that supports images.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable readRate;

/**
 <p>The IP addresses that were used to send the email message.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable sendingIps;

/**
 <p>The number of email messages that were delivered to recipients' spam or junk mail folders.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable spamCount;

/**
 <p>The subject line, or title, of the email message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable subject;

@end

/**
 <p>An object that contains information about the Deliverability dashboard subscription for a verified domain that you use to send email and currently has an active Deliverability dashboard subscription. If a Deliverability dashboard subscription is active for a domain, you gain access to reputation, inbox placement, and other metrics for the domain.</p>
 */
@interface AWSSESDomainDeliverabilityTrackingOption : AWSModel


/**
 <p>A verified domain that’s associated with your AWS account and currently has an active Deliverability dashboard subscription.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domain;

/**
 <p>An object that contains information about the inbox placement data settings for the domain.</p>
 */
@property (nonatomic, strong) AWSSESInboxPlacementTrackingOption * _Nullable inboxPlacementTrackingOption;

/**
 <p>The date, in Unix time format, when you enabled the Deliverability dashboard for the domain.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable subscriptionStartDate;

@end

/**
 <p>An object that contains inbox placement data for email sent from one of your email domains to a specific email provider.</p>
 */
@interface AWSSESDomainIspPlacement : AWSModel


/**
 <p>The percentage of messages that were sent from the selected domain to the specified email provider that arrived in recipients' inboxes.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable inboxPercentage;

/**
 <p>The total number of messages that were sent from the selected domain to the specified email provider that arrived in recipients' inboxes.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable inboxRawCount;

/**
 <p>The name of the email provider that the inbox placement data applies to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ispName;

/**
 <p>The percentage of messages that were sent from the selected domain to the specified email provider that arrived in recipients' spam or junk mail folders.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable spamPercentage;

/**
 <p>The total number of messages that were sent from the selected domain to the specified email provider that arrived in recipients' spam or junk mail folders.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable spamRawCount;

@end

/**
 <p>An object that defines the entire content of the email, including the message headers and the body content. You can create a simple email message, in which you specify the subject and the text and HTML versions of the message body. You can also create raw messages, in which you specify a complete MIME-formatted message. Raw messages can include attachments and custom headers.</p>
 */
@interface AWSSESEmailContent : AWSModel


/**
 <p>The raw email message. The message has to meet the following criteria:</p><ul><li><p>The message has to contain a header and a body, separated by one blank line.</p></li><li><p>All of the required header fields must be present in the message.</p></li><li><p>Each part of a multipart MIME message must be formatted properly.</p></li><li><p>If you include attachments, they must be in a file format that the Amazon SES API v2 supports. </p></li><li><p>The entire message must be Base64 encoded.</p></li><li><p>If any of the MIME parts in your message contain content that is outside of the 7-bit ASCII character range, you should encode that content to ensure that recipients' email clients render the message properly.</p></li><li><p>The length of any single line of text in the message can't exceed 1,000 characters. This restriction is defined in <a href="https://tools.ietf.org/html/rfc5321">RFC 5321</a>.</p></li></ul>
 */
@property (nonatomic, strong) AWSSESRawMessage * _Nullable raw;

/**
 <p>The simple email message. The message consists of a subject and a message body.</p>
 */
@property (nonatomic, strong) AWSSESMessage * _Nullable simple;

/**
 <p>The template to use for the email message.</p>
 */
@property (nonatomic, strong) AWSSESTemplate * _Nullable template;

@end

/**
 <p>In the Amazon SES API v2, <i>events</i> include message sends, deliveries, opens, clicks, bounces, complaints and delivery delays. <i>Event destinations</i> are places that you can send information about these events to. For example, you can send event data to Amazon SNS to receive notifications when you receive bounces or complaints, or you can use Amazon Kinesis Data Firehose to stream data to Amazon S3 for long-term storage.</p>
 Required parameters: [Name, MatchingEventTypes]
 */
@interface AWSSESEventDestination : AWSModel


/**
 <p>An object that defines an Amazon CloudWatch destination for email events. You can use Amazon CloudWatch to monitor and gain insights on your email sending metrics.</p>
 */
@property (nonatomic, strong) AWSSESCloudWatchDestination * _Nullable cloudWatchDestination;

/**
 <p>If <code>true</code>, the event destination is enabled. When the event destination is enabled, the specified event types are sent to the destinations in this <code>EventDestinationDefinition</code>.</p><p>If <code>false</code>, the event destination is disabled. When the event destination is disabled, events aren't sent to the specified destinations.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

/**
 <p>An object that defines an Amazon Kinesis Data Firehose destination for email events. You can use Amazon Kinesis Data Firehose to stream data to other services, such as Amazon S3 and Amazon Redshift.</p>
 */
@property (nonatomic, strong) AWSSESKinesisFirehoseDestination * _Nullable kinesisFirehoseDestination;

/**
 <p>The types of events that Amazon SES sends to the specified event destinations.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable matchingEventTypes;

/**
 <p>A name that identifies the event destination.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>An object that defines an Amazon Pinpoint project destination for email events. You can send email event data to a Amazon Pinpoint project to view metrics using the Transactional Messaging dashboards that are built in to Amazon Pinpoint. For more information, see <a href="https://docs.aws.amazon.com/pinpoint/latest/userguide/analytics-transactional-messages.html">Transactional Messaging Charts</a> in the <i>Amazon Pinpoint User Guide</i>.</p>
 */
@property (nonatomic, strong) AWSSESPinpointDestination * _Nullable pinpointDestination;

/**
 <p>An object that defines an Amazon SNS destination for email events. You can use Amazon SNS to send notification when certain email events occur.</p>
 */
@property (nonatomic, strong) AWSSESSnsDestination * _Nullable snsDestination;

@end

/**
 <p>An object that defines the event destination. Specifically, it defines which services receive events from emails sent using the configuration set that the event destination is associated with. Also defines the types of events that are sent to the event destination.</p>
 */
@interface AWSSESEventDestinationDefinition : AWSModel


/**
 <p>An object that defines an Amazon CloudWatch destination for email events. You can use Amazon CloudWatch to monitor and gain insights on your email sending metrics.</p>
 */
@property (nonatomic, strong) AWSSESCloudWatchDestination * _Nullable cloudWatchDestination;

/**
 <p>If <code>true</code>, the event destination is enabled. When the event destination is enabled, the specified event types are sent to the destinations in this <code>EventDestinationDefinition</code>.</p><p>If <code>false</code>, the event destination is disabled. When the event destination is disabled, events aren't sent to the specified destinations.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

/**
 <p>An object that defines an Amazon Kinesis Data Firehose destination for email events. You can use Amazon Kinesis Data Firehose to stream data to other services, such as Amazon S3 and Amazon Redshift.</p>
 */
@property (nonatomic, strong) AWSSESKinesisFirehoseDestination * _Nullable kinesisFirehoseDestination;

/**
 <p>An array that specifies which events the Amazon SES API v2 should send to the destinations in this <code>EventDestinationDefinition</code>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable matchingEventTypes;

/**
 <p>An object that defines an Amazon Pinpoint project destination for email events. You can send email event data to a Amazon Pinpoint project to view metrics using the Transactional Messaging dashboards that are built in to Amazon Pinpoint. For more information, see <a href="https://docs.aws.amazon.com/pinpoint/latest/userguide/analytics-transactional-messages.html">Transactional Messaging Charts</a> in the <i>Amazon Pinpoint User Guide</i>.</p>
 */
@property (nonatomic, strong) AWSSESPinpointDestination * _Nullable pinpointDestination;

/**
 <p>An object that defines an Amazon SNS destination for email events. You can use Amazon SNS to send notification when certain email events occur.</p>
 */
@property (nonatomic, strong) AWSSESSnsDestination * _Nullable snsDestination;

@end

/**
 <p>A request to obtain information about the email-sending capabilities of your Amazon SES account.</p>
 */
@interface AWSSESGetAccountRequest : AWSRequest


@end

/**
 <p>A list of details about the email-sending capabilities of your Amazon SES account in the current AWS Region.</p>
 */
@interface AWSSESGetAccountResponse : AWSModel


/**
 <p>Indicates whether or not the automatic warm-up feature is enabled for dedicated IP addresses that are associated with your account.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dedicatedIpAutoWarmupEnabled;

/**
 <p>The reputation status of your Amazon SES account. The status can be one of the following:</p><ul><li><p><code>HEALTHY</code> – There are no reputation-related issues that currently impact your account.</p></li><li><p><code>PROBATION</code> – We've identified potential issues with your Amazon SES account. We're placing your account under review while you work on correcting these issues.</p></li><li><p><code>SHUTDOWN</code> – Your account's ability to send email is currently paused because of an issue with the email sent from your account. When you correct the issue, you can contact us and request that your account's ability to send email is resumed.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable enforcementStatus;

/**
 <p>Indicates whether or not your account has production access in the current AWS Region.</p><p>If the value is <code>false</code>, then your account is in the <i>sandbox</i>. When your account is in the sandbox, you can only send email to verified identities. Additionally, the maximum number of emails you can send in a 24-hour period (your sending quota) is 200, and the maximum number of emails you can send per second (your maximum sending rate) is 1.</p><p>If the value is <code>true</code>, then your account has production access. When your account has production access, you can send email to any address. The sending quota and maximum sending rate for your account vary based on your specific use case.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable productionAccessEnabled;

/**
 <p>An object that contains information about the per-day and per-second sending limits for your Amazon SES account in the current AWS Region.</p>
 */
@property (nonatomic, strong) AWSSESSendQuota * _Nullable sendQuota;

/**
 <p>Indicates whether or not email sending is enabled for your Amazon SES account in the current AWS Region.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable sendingEnabled;

/**
 <p>An object that contains information about the email address suppression preferences for your account in the current AWS Region.</p>
 */
@property (nonatomic, strong) AWSSESSuppressionAttributes * _Nullable suppressionAttributes;

@end

/**
 <p>A request to retrieve a list of the blacklists that your dedicated IP addresses appear on.</p>
 Required parameters: [BlacklistItemNames]
 */
@interface AWSSESGetBlacklistReportsRequest : AWSRequest


/**
 <p>A list of IP addresses that you want to retrieve blacklist information about. You can only specify the dedicated IP addresses that you use to send email using Amazon SES or Amazon Pinpoint.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable blacklistItemNames;

@end

/**
 <p>An object that contains information about blacklist events.</p>
 Required parameters: [BlacklistReport]
 */
@interface AWSSESGetBlacklistReportsResponse : AWSModel


/**
 <p>An object that contains information about a blacklist that one of your dedicated IP addresses appears on.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSArray<AWSSESBlacklistEntry *> *> * _Nullable blacklistReport;

@end

/**
 <p>A request to obtain information about the event destinations for a configuration set.</p>
 Required parameters: [ConfigurationSetName]
 */
@interface AWSSESGetConfigurationSetEventDestinationsRequest : AWSRequest


/**
 <p>The name of the configuration set that contains the event destination.</p>
 */
@property (nonatomic, strong) NSString * _Nullable configurationSetName;

@end

/**
 <p>Information about an event destination for a configuration set.</p>
 */
@interface AWSSESGetConfigurationSetEventDestinationsResponse : AWSModel


/**
 <p>An array that includes all of the events destinations that have been configured for the configuration set.</p>
 */
@property (nonatomic, strong) NSArray<AWSSESEventDestination *> * _Nullable eventDestinations;

@end

/**
 <p>A request to obtain information about a configuration set.</p>
 Required parameters: [ConfigurationSetName]
 */
@interface AWSSESGetConfigurationSetRequest : AWSRequest


/**
 <p>The name of the configuration set that you want to obtain more information about.</p>
 */
@property (nonatomic, strong) NSString * _Nullable configurationSetName;

@end

/**
 <p>Information about a configuration set.</p>
 */
@interface AWSSESGetConfigurationSetResponse : AWSModel


/**
 <p>The name of the configuration set.</p>
 */
@property (nonatomic, strong) NSString * _Nullable configurationSetName;

/**
 <p>An object that defines the dedicated IP pool that is used to send emails that you send using the configuration set.</p>
 */
@property (nonatomic, strong) AWSSESDeliveryOptions * _Nullable deliveryOptions;

/**
 <p>An object that defines whether or not Amazon SES collects reputation metrics for the emails that you send that use the configuration set.</p>
 */
@property (nonatomic, strong) AWSSESReputationOptions * _Nullable reputationOptions;

/**
 <p>An object that defines whether or not Amazon SES can send email that you send using the configuration set.</p>
 */
@property (nonatomic, strong) AWSSESSendingOptions * _Nullable sendingOptions;

/**
 <p>An object that contains information about the suppression list preferences for your account.</p>
 */
@property (nonatomic, strong) AWSSESSuppressionOptions * _Nullable suppressionOptions;

/**
 <p>An array of objects that define the tags (keys and values) that are associated with the configuration set.</p>
 */
@property (nonatomic, strong) NSArray<AWSSESTag *> * _Nullable tags;

/**
 <p>An object that defines the open and click tracking options for emails that you send using the configuration set.</p>
 */
@property (nonatomic, strong) AWSSESTrackingOptions * _Nullable trackingOptions;

@end

/**
 <p>A request to obtain more information about a dedicated IP address.</p>
 Required parameters: [Ip]
 */
@interface AWSSESGetDedicatedIpRequest : AWSRequest


/**
 <p>The IP address that you want to obtain more information about. The value you specify has to be a dedicated IP address that's assocaited with your AWS account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ip;

@end

/**
 <p>Information about a dedicated IP address.</p>
 */
@interface AWSSESGetDedicatedIpResponse : AWSModel


/**
 <p>An object that contains information about a dedicated IP address.</p>
 */
@property (nonatomic, strong) AWSSESDedicatedIp * _Nullable dedicatedIp;

@end

/**
 <p>A request to obtain more information about dedicated IP pools.</p>
 */
@interface AWSSESGetDedicatedIpsRequest : AWSRequest


/**
 <p>A token returned from a previous call to <code>GetDedicatedIps</code> to indicate the position of the dedicated IP pool in the list of IP pools.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The number of results to show in a single call to <code>GetDedicatedIpsRequest</code>. If the number of results is larger than the number you specified in this parameter, then the response includes a <code>NextToken</code> element, which you can use to obtain additional results.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable pageSize;

/**
 <p>The name of the IP pool that the dedicated IP address is associated with.</p>
 */
@property (nonatomic, strong) NSString * _Nullable poolName;

@end

/**
 <p>Information about the dedicated IP addresses that are associated with your AWS account.</p>
 */
@interface AWSSESGetDedicatedIpsResponse : AWSModel


/**
 <p>A list of dedicated IP addresses that are associated with your AWS account.</p>
 */
@property (nonatomic, strong) NSArray<AWSSESDedicatedIp *> * _Nullable dedicatedIps;

/**
 <p>A token that indicates that there are additional dedicated IP addresses to list. To view additional addresses, issue another request to <code>GetDedicatedIps</code>, passing this token in the <code>NextToken</code> parameter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>Retrieve information about the status of the Deliverability dashboard for your AWS account. When the Deliverability dashboard is enabled, you gain access to reputation, deliverability, and other metrics for your domains. You also gain the ability to perform predictive inbox placement tests.</p><p>When you use the Deliverability dashboard, you pay a monthly subscription charge, in addition to any other fees that you accrue by using Amazon SES and other AWS services. For more information about the features and cost of a Deliverability dashboard subscription, see <a href="http://aws.amazon.com/pinpoint/pricing/">Amazon Pinpoint Pricing</a>.</p>
 */
@interface AWSSESGetDeliverabilityDashboardOptionsRequest : AWSRequest


@end

/**
 <p>An object that shows the status of the Deliverability dashboard.</p>
 Required parameters: [DashboardEnabled]
 */
@interface AWSSESGetDeliverabilityDashboardOptionsResponse : AWSModel


/**
 <p>The current status of your Deliverability dashboard subscription. If this value is <code>PENDING_EXPIRATION</code>, your subscription is scheduled to expire at the end of the current calendar month.</p>
 */
@property (nonatomic, assign) AWSSESDeliverabilityDashboardAccountStatus accountStatus;

/**
 <p>An array of objects, one for each verified domain that you use to send email and currently has an active Deliverability dashboard subscription that isn’t scheduled to expire at the end of the current calendar month.</p>
 */
@property (nonatomic, strong) NSArray<AWSSESDomainDeliverabilityTrackingOption *> * _Nullable activeSubscribedDomains;

/**
 <p>Specifies whether the Deliverability dashboard is enabled. If this value is <code>true</code>, the dashboard is enabled.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dashboardEnabled;

/**
 <p>An array of objects, one for each verified domain that you use to send email and currently has an active Deliverability dashboard subscription that's scheduled to expire at the end of the current calendar month.</p>
 */
@property (nonatomic, strong) NSArray<AWSSESDomainDeliverabilityTrackingOption *> * _Nullable pendingExpirationSubscribedDomains;

/**
 <p>The date, in Unix time format, when your current subscription to the Deliverability dashboard is scheduled to expire, if your subscription is scheduled to expire at the end of the current calendar month. This value is null if you have an active subscription that isn’t due to expire at the end of the month.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable subscriptionExpiryDate;

@end

/**
 <p>A request to retrieve the results of a predictive inbox placement test.</p>
 Required parameters: [ReportId]
 */
@interface AWSSESGetDeliverabilityTestReportRequest : AWSRequest


/**
 <p>A unique string that identifies the predictive inbox placement test.</p>
 */
@property (nonatomic, strong) NSString * _Nullable reportId;

@end

/**
 <p>The results of the predictive inbox placement test.</p>
 Required parameters: [DeliverabilityTestReport, OverallPlacement, IspPlacements]
 */
@interface AWSSESGetDeliverabilityTestReportResponse : AWSModel


/**
 <p>An object that contains the results of the predictive inbox placement test.</p>
 */
@property (nonatomic, strong) AWSSESDeliverabilityTestReport * _Nullable deliverabilityTestReport;

/**
 <p>An object that describes how the test email was handled by several email providers, including Gmail, Hotmail, Yahoo, AOL, and others.</p>
 */
@property (nonatomic, strong) NSArray<AWSSESIspPlacement *> * _Nullable ispPlacements;

/**
 <p>An object that contains the message that you sent when you performed this predictive inbox placement test.</p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

/**
 <p>An object that specifies how many test messages that were sent during the predictive inbox placement test were delivered to recipients' inboxes, how many were sent to recipients' spam folders, and how many weren't delivered.</p>
 */
@property (nonatomic, strong) AWSSESPlacementStatistics * _Nullable overallPlacement;

/**
 <p>An array of objects that define the tags (keys and values) that are associated with the predictive inbox placement test.</p>
 */
@property (nonatomic, strong) NSArray<AWSSESTag *> * _Nullable tags;

@end

/**
 <p>Retrieve all the deliverability data for a specific campaign. This data is available for a campaign only if the campaign sent email by using a domain that the Deliverability dashboard is enabled for (<code>PutDeliverabilityDashboardOption</code> operation).</p>
 Required parameters: [CampaignId]
 */
@interface AWSSESGetDomainDeliverabilityCampaignRequest : AWSRequest


/**
 <p>The unique identifier for the campaign. The Deliverability dashboard automatically generates and assigns this identifier to a campaign.</p>
 */
@property (nonatomic, strong) NSString * _Nullable campaignId;

@end

/**
 <p>An object that contains all the deliverability data for a specific campaign. This data is available for a campaign only if the campaign sent email by using a domain that the Deliverability dashboard is enabled for.</p>
 Required parameters: [DomainDeliverabilityCampaign]
 */
@interface AWSSESGetDomainDeliverabilityCampaignResponse : AWSModel


/**
 <p>An object that contains the deliverability data for the campaign.</p>
 */
@property (nonatomic, strong) AWSSESDomainDeliverabilityCampaign * _Nullable domainDeliverabilityCampaign;

@end

/**
 <p>A request to obtain deliverability metrics for a domain.</p>
 Required parameters: [Domain, StartDate, EndDate]
 */
@interface AWSSESGetDomainStatisticsReportRequest : AWSRequest


/**
 <p>The domain that you want to obtain deliverability metrics for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domain;

/**
 <p>The last day (in Unix time) that you want to obtain domain deliverability metrics for. The <code>EndDate</code> that you specify has to be less than or equal to 30 days after the <code>StartDate</code>.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable endDate;

/**
 <p>The first day (in Unix time) that you want to obtain domain deliverability metrics for.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable startDate;

@end

/**
 <p>An object that includes statistics that are related to the domain that you specified.</p>
 Required parameters: [OverallVolume, DailyVolumes]
 */
@interface AWSSESGetDomainStatisticsReportResponse : AWSModel


/**
 <p>An object that contains deliverability metrics for the domain that you specified. This object contains data for each day, starting on the <code>StartDate</code> and ending on the <code>EndDate</code>.</p>
 */
@property (nonatomic, strong) NSArray<AWSSESDailyVolume *> * _Nullable dailyVolumes;

/**
 <p>An object that contains deliverability metrics for the domain that you specified. The data in this object is a summary of all of the data that was collected from the <code>StartDate</code> to the <code>EndDate</code>.</p>
 */
@property (nonatomic, strong) AWSSESOverallVolume * _Nullable overallVolume;

@end

/**
 <p>A request to return details about an email identity.</p>
 Required parameters: [EmailIdentity]
 */
@interface AWSSESGetEmailIdentityRequest : AWSRequest


/**
 <p>The email identity that you want to retrieve details for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable emailIdentity;

@end

/**
 <p>Details about an email identity.</p>
 */
@interface AWSSESGetEmailIdentityResponse : AWSModel


/**
 <p>An object that contains information about the DKIM attributes for the identity.</p>
 */
@property (nonatomic, strong) AWSSESDkimAttributes * _Nullable dkimAttributes;

/**
 <p>The feedback forwarding configuration for the identity.</p><p>If the value is <code>true</code>, you receive email notifications when bounce or complaint events occur. These notifications are sent to the address that you specified in the <code>Return-Path</code> header of the original email.</p><p>You're required to have a method of tracking bounces and complaints. If you haven't set up another mechanism for receiving bounce or complaint notifications (for example, by setting up an event destination), you receive an email notification when these events occur (even if this setting is disabled).</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable feedbackForwardingStatus;

/**
 <p>The email identity type.</p>
 */
@property (nonatomic, assign) AWSSESIdentityType identityType;

/**
 <p>An object that contains information about the Mail-From attributes for the email identity.</p>
 */
@property (nonatomic, strong) AWSSESMailFromAttributes * _Nullable mailFromAttributes;

/**
 <p>An array of objects that define the tags (keys and values) that are associated with the email identity.</p>
 */
@property (nonatomic, strong) NSArray<AWSSESTag *> * _Nullable tags;

/**
 <p>Specifies whether or not the identity is verified. You can only send email from verified email addresses or domains. For more information about verifying identities, see the <a href="https://docs.aws.amazon.com/pinpoint/latest/userguide/channels-email-manage-verify.html">Amazon Pinpoint User Guide</a>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable verifiedForSendingStatus;

@end

/**
 <p>A request to retrieve information about an email address that's on the suppression list for your account.</p>
 Required parameters: [EmailAddress]
 */
@interface AWSSESGetSuppressedDestinationRequest : AWSRequest


/**
 <p>The email address that's on the account suppression list.</p>
 */
@property (nonatomic, strong) NSString * _Nullable emailAddress;

@end

/**
 <p>Information about the suppressed email address.</p>
 Required parameters: [SuppressedDestination]
 */
@interface AWSSESGetSuppressedDestinationResponse : AWSModel


/**
 <p>An object containing information about the suppressed email address.</p>
 */
@property (nonatomic, strong) AWSSESSuppressedDestination * _Nullable suppressedDestination;

@end

/**
 <p>Information about an email identity.</p>
 */
@interface AWSSESIdentityInfo : AWSModel


/**
 <p>The address or domain of the identity.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identityName;

/**
 <p>The email identity type. The identity type can be one of the following:</p><ul><li><p><code>EMAIL_ADDRESS</code> – The identity is an email address.</p></li><li><p><code>DOMAIN</code> – The identity is a domain.</p></li><li><p><code>MANAGED_DOMAIN</code> – The identity is a domain that is managed by AWS.</p></li></ul>
 */
@property (nonatomic, assign) AWSSESIdentityType identityType;

/**
 <p>Indicates whether or not you can send email from the identity.</p><p>An <i>identity</i> is an email address or domain that you send email from. Before you can send email from an identity, you have to demostrate that you own the identity, and that you authorize Amazon SES to send email from that identity.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable sendingEnabled;

@end

/**
 <p>An object that contains information about the inbox placement data settings for a verified domain that’s associated with your AWS account. This data is available only if you enabled the Deliverability dashboard for the domain.</p>
 */
@interface AWSSESInboxPlacementTrackingOption : AWSModel


/**
 <p>Specifies whether inbox placement data is being tracked for the domain.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable global;

/**
 <p>An array of strings, one for each major email provider that the inbox placement data applies to.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable trackedIsps;

@end

/**
 <p>An object that describes how email sent during the predictive inbox placement test was handled by a certain email provider.</p>
 */
@interface AWSSESIspPlacement : AWSModel


/**
 <p>The name of the email provider that the inbox placement data applies to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ispName;

/**
 <p>An object that contains inbox placement metrics for a specific email provider.</p>
 */
@property (nonatomic, strong) AWSSESPlacementStatistics * _Nullable placementStatistics;

@end

/**
 <p>An object that defines an Amazon Kinesis Data Firehose destination for email events. You can use Amazon Kinesis Data Firehose to stream data to other services, such as Amazon S3 and Amazon Redshift.</p>
 Required parameters: [IamRoleArn, DeliveryStreamArn]
 */
@interface AWSSESKinesisFirehoseDestination : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the Amazon Kinesis Data Firehose stream that the Amazon SES API v2 sends email events to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deliveryStreamArn;

/**
 <p>The Amazon Resource Name (ARN) of the IAM role that the Amazon SES API v2 uses to send email events to the Amazon Kinesis Data Firehose stream.</p>
 */
@property (nonatomic, strong) NSString * _Nullable iamRoleArn;

@end

/**
 <p>A request to obtain a list of configuration sets for your Amazon SES account in the current AWS Region.</p>
 */
@interface AWSSESListConfigurationSetsRequest : AWSRequest


/**
 <p>A token returned from a previous call to <code>ListConfigurationSets</code> to indicate the position in the list of configuration sets.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The number of results to show in a single call to <code>ListConfigurationSets</code>. If the number of results is larger than the number you specified in this parameter, then the response includes a <code>NextToken</code> element, which you can use to obtain additional results.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable pageSize;

@end

/**
 <p>A list of configuration sets in your Amazon SES account in the current AWS Region.</p>
 */
@interface AWSSESListConfigurationSetsResponse : AWSModel


/**
 <p>An array that contains all of the configuration sets in your Amazon SES account in the current AWS Region.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable configurationSets;

/**
 <p>A token that indicates that there are additional configuration sets to list. To view additional configuration sets, issue another request to <code>ListConfigurationSets</code>, and pass this token in the <code>NextToken</code> parameter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>A request to obtain a list of dedicated IP pools.</p>
 */
@interface AWSSESListDedicatedIpPoolsRequest : AWSRequest


/**
 <p>A token returned from a previous call to <code>ListDedicatedIpPools</code> to indicate the position in the list of dedicated IP pools.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The number of results to show in a single call to <code>ListDedicatedIpPools</code>. If the number of results is larger than the number you specified in this parameter, then the response includes a <code>NextToken</code> element, which you can use to obtain additional results.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable pageSize;

@end

/**
 <p>A list of dedicated IP pools.</p>
 */
@interface AWSSESListDedicatedIpPoolsResponse : AWSModel


/**
 <p>A list of all of the dedicated IP pools that are associated with your AWS account in the current Region.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable dedicatedIpPools;

/**
 <p>A token that indicates that there are additional IP pools to list. To view additional IP pools, issue another request to <code>ListDedicatedIpPools</code>, passing this token in the <code>NextToken</code> parameter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>A request to list all of the predictive inbox placement tests that you've performed.</p>
 */
@interface AWSSESListDeliverabilityTestReportsRequest : AWSRequest


/**
 <p>A token returned from a previous call to <code>ListDeliverabilityTestReports</code> to indicate the position in the list of predictive inbox placement tests.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The number of results to show in a single call to <code>ListDeliverabilityTestReports</code>. If the number of results is larger than the number you specified in this parameter, then the response includes a <code>NextToken</code> element, which you can use to obtain additional results.</p><p>The value you specify has to be at least 0, and can be no more than 1000.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable pageSize;

@end

/**
 <p>A list of the predictive inbox placement test reports that are available for your account, regardless of whether or not those tests are complete.</p>
 Required parameters: [DeliverabilityTestReports]
 */
@interface AWSSESListDeliverabilityTestReportsResponse : AWSModel


/**
 <p>An object that contains a lists of predictive inbox placement tests that you've performed.</p>
 */
@property (nonatomic, strong) NSArray<AWSSESDeliverabilityTestReport *> * _Nullable deliverabilityTestReports;

/**
 <p>A token that indicates that there are additional predictive inbox placement tests to list. To view additional predictive inbox placement tests, issue another request to <code>ListDeliverabilityTestReports</code>, and pass this token in the <code>NextToken</code> parameter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>Retrieve deliverability data for all the campaigns that used a specific domain to send email during a specified time range. This data is available for a domain only if you enabled the Deliverability dashboard.</p>
 Required parameters: [StartDate, EndDate, SubscribedDomain]
 */
@interface AWSSESListDomainDeliverabilityCampaignsRequest : AWSRequest


/**
 <p>The last day, in Unix time format, that you want to obtain deliverability data for. This value has to be less than or equal to 30 days after the value of the <code>StartDate</code> parameter.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable endDate;

/**
 <p>A token that’s returned from a previous call to the <code>ListDomainDeliverabilityCampaigns</code> operation. This token indicates the position of a campaign in the list of campaigns.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The maximum number of results to include in response to a single call to the <code>ListDomainDeliverabilityCampaigns</code> operation. If the number of results is larger than the number that you specify in this parameter, the response includes a <code>NextToken</code> element, which you can use to obtain additional results.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable pageSize;

/**
 <p>The first day, in Unix time format, that you want to obtain deliverability data for.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable startDate;

/**
 <p>The domain to obtain deliverability data for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable subscribedDomain;

@end

/**
 <p>An array of objects that provide deliverability data for all the campaigns that used a specific domain to send email during a specified time range. This data is available for a domain only if you enabled the Deliverability dashboard for the domain.</p>
 Required parameters: [DomainDeliverabilityCampaigns]
 */
@interface AWSSESListDomainDeliverabilityCampaignsResponse : AWSModel


/**
 <p>An array of responses, one for each campaign that used the domain to send email during the specified time range.</p>
 */
@property (nonatomic, strong) NSArray<AWSSESDomainDeliverabilityCampaign *> * _Nullable domainDeliverabilityCampaigns;

/**
 <p>A token that’s returned from a previous call to the <code>ListDomainDeliverabilityCampaigns</code> operation. This token indicates the position of the campaign in the list of campaigns.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>A request to list all of the email identities associated with your AWS account. This list includes identities that you've already verified, identities that are unverified, and identities that were verified in the past, but are no longer verified.</p>
 */
@interface AWSSESListEmailIdentitiesRequest : AWSRequest


/**
 <p>A token returned from a previous call to <code>ListEmailIdentities</code> to indicate the position in the list of identities.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The number of results to show in a single call to <code>ListEmailIdentities</code>. If the number of results is larger than the number you specified in this parameter, then the response includes a <code>NextToken</code> element, which you can use to obtain additional results.</p><p>The value you specify has to be at least 0, and can be no more than 1000.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable pageSize;

@end

/**
 <p>A list of all of the identities that you've attempted to verify, regardless of whether or not those identities were successfully verified.</p>
 */
@interface AWSSESListEmailIdentitiesResponse : AWSModel


/**
 <p>An array that includes all of the email identities associated with your AWS account.</p>
 */
@property (nonatomic, strong) NSArray<AWSSESIdentityInfo *> * _Nullable emailIdentities;

/**
 <p>A token that indicates that there are additional configuration sets to list. To view additional configuration sets, issue another request to <code>ListEmailIdentities</code>, and pass this token in the <code>NextToken</code> parameter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>A request to obtain a list of email destinations that are on the suppression list for your account.</p>
 */
@interface AWSSESListSuppressedDestinationsRequest : AWSRequest


/**
 <p>Used to filter the list of suppressed email destinations so that it only includes addresses that were added to the list before a specific date. The date that you specify should be in Unix time format.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable endDate;

/**
 <p>A token returned from a previous call to <code>ListSuppressedDestinations</code> to indicate the position in the list of suppressed email addresses.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The number of results to show in a single call to <code>ListSuppressedDestinations</code>. If the number of results is larger than the number you specified in this parameter, then the response includes a <code>NextToken</code> element, which you can use to obtain additional results.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable pageSize;

/**
 <p>The factors that caused the email address to be added to .</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable reasons;

/**
 <p>Used to filter the list of suppressed email destinations so that it only includes addresses that were added to the list after a specific date. The date that you specify should be in Unix time format.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable startDate;

@end

/**
 <p>A list of suppressed email addresses.</p>
 */
@interface AWSSESListSuppressedDestinationsResponse : AWSModel


/**
 <p>A token that indicates that there are additional email addresses on the suppression list for your account. To view additional suppressed addresses, issue another request to <code>ListSuppressedDestinations</code>, and pass this token in the <code>NextToken</code> parameter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>A list of summaries, each containing a summary for a suppressed email destination.</p>
 */
@property (nonatomic, strong) NSArray<AWSSESSuppressedDestinationSummary *> * _Nullable suppressedDestinationSummaries;

@end

/**
 
 */
@interface AWSSESListTagsForResourceRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the resource that you want to retrieve tag information for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

@end

/**
 
 */
@interface AWSSESListTagsForResourceResponse : AWSModel


/**
 <p>An array that lists all the tags that are associated with the resource. Each tag consists of a required tag key (<code>Key</code>) and an associated tag value (<code>Value</code>)</p>
 */
@property (nonatomic, strong) NSArray<AWSSESTag *> * _Nullable tags;

@end

/**
 <p>A list of attributes that are associated with a MAIL FROM domain.</p>
 Required parameters: [MailFromDomain, MailFromDomainStatus, BehaviorOnMxFailure]
 */
@interface AWSSESMailFromAttributes : AWSModel


/**
 <p>The action that you want to take if the required MX record can't be found when you send an email. When you set this value to <code>UseDefaultValue</code>, the mail is sent using <i>amazonses.com</i> as the MAIL FROM domain. When you set this value to <code>RejectMessage</code>, the Amazon SES API v2 returns a <code>MailFromDomainNotVerified</code> error, and doesn't attempt to deliver the email.</p><p>These behaviors are taken when the custom MAIL FROM domain configuration is in the <code>Pending</code>, <code>Failed</code>, and <code>TemporaryFailure</code> states.</p>
 */
@property (nonatomic, assign) AWSSESBehaviorOnMxFailure behaviorOnMxFailure;

/**
 <p>The name of a domain that an email identity uses as a custom MAIL FROM domain.</p>
 */
@property (nonatomic, strong) NSString * _Nullable mailFromDomain;

/**
 <p>The status of the MAIL FROM domain. This status can have the following values:</p><ul><li><p><code>PENDING</code> – Amazon SES hasn't started searching for the MX record yet.</p></li><li><p><code>SUCCESS</code> – Amazon SES detected the required MX record for the MAIL FROM domain.</p></li><li><p><code>FAILED</code> – Amazon SES can't find the required MX record, or the record no longer exists.</p></li><li><p><code>TEMPORARY_FAILURE</code> – A temporary issue occurred, which prevented Amazon SES from determining the status of the MAIL FROM domain.</p></li></ul>
 */
@property (nonatomic, assign) AWSSESMailFromDomainStatus mailFromDomainStatus;

@end

/**
 <p>Represents the email message that you're sending. The <code>Message</code> object consists of a subject line and a message body.</p>
 Required parameters: [Subject, Body]
 */
@interface AWSSESMessage : AWSModel


/**
 <p>The body of the message. You can specify an HTML version of the message, a text-only version of the message, or both.</p>
 */
@property (nonatomic, strong) AWSSESBody * _Nullable body;

/**
 <p>The subject line of the email. The subject line can only contain 7-bit ASCII characters. However, you can specify non-ASCII characters in the subject line by using encoded-word syntax, as described in <a href="https://tools.ietf.org/html/rfc2047">RFC 2047</a>.</p>
 */
@property (nonatomic, strong) AWSSESContent * _Nullable subject;

@end

/**
 <p>Contains the name and value of a tag that you apply to an email. You can use message tags when you publish email sending events. </p>
 Required parameters: [Name, Value]
 */
@interface AWSSESMessageTag : AWSModel


/**
 <p>The name of the message tag. The message tag name has to meet the following criteria:</p><ul><li><p>It can only contain ASCII letters (a–z, A–Z), numbers (0–9), underscores (_), or dashes (-).</p></li><li><p>It can contain no more than 256 characters.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The value of the message tag. The message tag value has to meet the following criteria:</p><ul><li><p>It can only contain ASCII letters (a–z, A–Z), numbers (0–9), underscores (_), or dashes (-).</p></li><li><p>It can contain no more than 256 characters.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 <p>An object that contains information about email that was sent from the selected domain.</p>
 */
@interface AWSSESOverallVolume : AWSModel


/**
 <p>An object that contains inbox and junk mail placement metrics for individual email providers.</p>
 */
@property (nonatomic, strong) NSArray<AWSSESDomainIspPlacement *> * _Nullable domainIspPlacements;

/**
 <p>The percentage of emails that were sent from the domain that were read by their recipients.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable readRatePercent;

/**
 <p>An object that contains information about the numbers of messages that arrived in recipients' inboxes and junk mail folders.</p>
 */
@property (nonatomic, strong) AWSSESVolumeStatistics * _Nullable volumeStatistics;

@end

/**
 <p>An object that defines an Amazon Pinpoint project destination for email events. You can send email event data to a Amazon Pinpoint project to view metrics using the Transactional Messaging dashboards that are built in to Amazon Pinpoint. For more information, see <a href="https://docs.aws.amazon.com/pinpoint/latest/userguide/analytics-transactional-messages.html">Transactional Messaging Charts</a> in the <i>Amazon Pinpoint User Guide</i>.</p>
 */
@interface AWSSESPinpointDestination : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the Amazon Pinpoint project that you want to send email events to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationArn;

@end

/**
 <p>An object that contains inbox placement data for an email provider.</p>
 */
@interface AWSSESPlacementStatistics : AWSModel


/**
 <p>The percentage of emails that were authenticated by using DomainKeys Identified Mail (DKIM) during the predictive inbox placement test.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dkimPercentage;

/**
 <p>The percentage of emails that arrived in recipients' inboxes during the predictive inbox placement test.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable inboxPercentage;

/**
 <p>The percentage of emails that didn't arrive in recipients' inboxes at all during the predictive inbox placement test.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable missingPercentage;

/**
 <p>The percentage of emails that arrived in recipients' spam or junk mail folders during the predictive inbox placement test.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable spamPercentage;

/**
 <p>The percentage of emails that were authenticated by using Sender Policy Framework (SPF) during the predictive inbox placement test.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable spfPercentage;

@end

/**
 <p>A request to enable or disable the automatic IP address warm-up feature.</p>
 */
@interface AWSSESPutAccountDedicatedIpWarmupAttributesRequest : AWSRequest


/**
 <p>Enables or disables the automatic warm-up feature for dedicated IP addresses that are associated with your Amazon SES account in the current AWS Region. Set to <code>true</code> to enable the automatic warm-up feature, or set to <code>false</code> to disable it.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable autoWarmupEnabled;

@end

/**
 <p>An HTTP 200 response if the request succeeds, or an error message if the request fails.</p>
 */
@interface AWSSESPutAccountDedicatedIpWarmupAttributesResponse : AWSModel


@end

/**
 <p>A request to change the ability of your account to send email.</p>
 */
@interface AWSSESPutAccountSendingAttributesRequest : AWSRequest


/**
 <p>Enables or disables your account's ability to send email. Set to <code>true</code> to enable email sending, or set to <code>false</code> to disable email sending.</p><note><p>If AWS paused your account's ability to send email, you can't use this operation to resume your account's ability to send email.</p></note>
 */
@property (nonatomic, strong) NSNumber * _Nullable sendingEnabled;

@end

/**
 <p>An HTTP 200 response if the request succeeds, or an error message if the request fails.</p>
 */
@interface AWSSESPutAccountSendingAttributesResponse : AWSModel


@end

/**
 <p>A request to change your account's suppression preferences.</p>
 */
@interface AWSSESPutAccountSuppressionAttributesRequest : AWSRequest


/**
 <p>A list that contains the reasons that email addresses will be automatically added to the suppression list for your account. This list can contain any or all of the following:</p><ul><li><p><code>COMPLAINT</code> – Amazon SES adds an email address to the suppression list for your account when a message sent to that address results in a complaint.</p></li><li><p><code>BOUNCE</code> – Amazon SES adds an email address to the suppression list for your account when a message sent to that address results in a hard bounce.</p></li></ul>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable suppressedReasons;

@end

/**
 <p>An HTTP 200 response if the request succeeds, or an error message if the request fails.</p>
 */
@interface AWSSESPutAccountSuppressionAttributesResponse : AWSModel


@end

/**
 <p>A request to associate a configuration set with a dedicated IP pool.</p>
 Required parameters: [ConfigurationSetName]
 */
@interface AWSSESPutConfigurationSetDeliveryOptionsRequest : AWSRequest


/**
 <p>The name of the configuration set that you want to associate with a dedicated IP pool.</p>
 */
@property (nonatomic, strong) NSString * _Nullable configurationSetName;

/**
 <p>The name of the dedicated IP pool that you want to associate with the configuration set.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sendingPoolName;

/**
 <p>Specifies whether messages that use the configuration set are required to use Transport Layer Security (TLS). If the value is <code>Require</code>, messages are only delivered if a TLS connection can be established. If the value is <code>Optional</code>, messages can be delivered in plain text if a TLS connection can't be established.</p>
 */
@property (nonatomic, assign) AWSSESTlsPolicy tlsPolicy;

@end

/**
 <p>An HTTP 200 response if the request succeeds, or an error message if the request fails.</p>
 */
@interface AWSSESPutConfigurationSetDeliveryOptionsResponse : AWSModel


@end

/**
 <p>A request to enable or disable tracking of reputation metrics for a configuration set.</p>
 Required parameters: [ConfigurationSetName]
 */
@interface AWSSESPutConfigurationSetReputationOptionsRequest : AWSRequest


/**
 <p>The name of the configuration set that you want to enable or disable reputation metric tracking for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable configurationSetName;

/**
 <p>If <code>true</code>, tracking of reputation metrics is enabled for the configuration set. If <code>false</code>, tracking of reputation metrics is disabled for the configuration set.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable reputationMetricsEnabled;

@end

/**
 <p>An HTTP 200 response if the request succeeds, or an error message if the request fails.</p>
 */
@interface AWSSESPutConfigurationSetReputationOptionsResponse : AWSModel


@end

/**
 <p>A request to enable or disable the ability of Amazon SES to send emails that use a specific configuration set.</p>
 Required parameters: [ConfigurationSetName]
 */
@interface AWSSESPutConfigurationSetSendingOptionsRequest : AWSRequest


/**
 <p>The name of the configuration set that you want to enable or disable email sending for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable configurationSetName;

/**
 <p>If <code>true</code>, email sending is enabled for the configuration set. If <code>false</code>, email sending is disabled for the configuration set.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable sendingEnabled;

@end

/**
 <p>An HTTP 200 response if the request succeeds, or an error message if the request fails.</p>
 */
@interface AWSSESPutConfigurationSetSendingOptionsResponse : AWSModel


@end

/**
 <p>A request to change the account suppression list preferences for a specific configuration set.</p>
 Required parameters: [ConfigurationSetName]
 */
@interface AWSSESPutConfigurationSetSuppressionOptionsRequest : AWSRequest


/**
 <p>The name of the configuration set that you want to change the suppression list preferences for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable configurationSetName;

/**
 <p>A list that contains the reasons that email addresses are automatically added to the suppression list for your account. This list can contain any or all of the following:</p><ul><li><p><code>COMPLAINT</code> – Amazon SES adds an email address to the suppression list for your account when a message sent to that address results in a complaint.</p></li><li><p><code>BOUNCE</code> – Amazon SES adds an email address to the suppression list for your account when a message sent to that address results in a hard bounce.</p></li></ul>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable suppressedReasons;

@end

/**
 <p>An HTTP 200 response if the request succeeds, or an error message if the request fails.</p>
 */
@interface AWSSESPutConfigurationSetSuppressionOptionsResponse : AWSModel


@end

/**
 <p>A request to add a custom domain for tracking open and click events to a configuration set.</p>
 Required parameters: [ConfigurationSetName]
 */
@interface AWSSESPutConfigurationSetTrackingOptionsRequest : AWSRequest


/**
 <p>The name of the configuration set that you want to add a custom tracking domain to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable configurationSetName;

/**
 <p>The domain that you want to use to track open and click events.</p>
 */
@property (nonatomic, strong) NSString * _Nullable customRedirectDomain;

@end

/**
 <p>An HTTP 200 response if the request succeeds, or an error message if the request fails.</p>
 */
@interface AWSSESPutConfigurationSetTrackingOptionsResponse : AWSModel


@end

/**
 <p>A request to move a dedicated IP address to a dedicated IP pool.</p>
 Required parameters: [Ip, DestinationPoolName]
 */
@interface AWSSESPutDedicatedIpInPoolRequest : AWSRequest


/**
 <p>The name of the IP pool that you want to add the dedicated IP address to. You have to specify an IP pool that already exists.</p>
 */
@property (nonatomic, strong) NSString * _Nullable destinationPoolName;

/**
 <p>The IP address that you want to move to the dedicated IP pool. The value you specify has to be a dedicated IP address that's associated with your AWS account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ip;

@end

/**
 <p>An HTTP 200 response if the request succeeds, or an error message if the request fails.</p>
 */
@interface AWSSESPutDedicatedIpInPoolResponse : AWSModel


@end

/**
 <p>A request to change the warm-up attributes for a dedicated IP address. This operation is useful when you want to resume the warm-up process for an existing IP address.</p>
 Required parameters: [Ip, WarmupPercentage]
 */
@interface AWSSESPutDedicatedIpWarmupAttributesRequest : AWSRequest


/**
 <p>The dedicated IP address that you want to update the warm-up attributes for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ip;

/**
 <p>The warm-up percentage that you want to associate with the dedicated IP address.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable warmupPercentage;

@end

/**
 <p>An HTTP 200 response if the request succeeds, or an error message if the request fails.</p>
 */
@interface AWSSESPutDedicatedIpWarmupAttributesResponse : AWSModel


@end

/**
 <p>Enable or disable the Deliverability dashboard. When you enable the Deliverability dashboard, you gain access to reputation, deliverability, and other metrics for the domains that you use to send email using Amazon SES API v2. You also gain the ability to perform predictive inbox placement tests.</p><p>When you use the Deliverability dashboard, you pay a monthly subscription charge, in addition to any other fees that you accrue by using Amazon SES and other AWS services. For more information about the features and cost of a Deliverability dashboard subscription, see <a href="http://aws.amazon.com/pinpoint/pricing/">Amazon Pinpoint Pricing</a>.</p>
 Required parameters: [DashboardEnabled]
 */
@interface AWSSESPutDeliverabilityDashboardOptionRequest : AWSRequest


/**
 <p>Specifies whether to enable the Deliverability dashboard. To enable the dashboard, set this value to <code>true</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dashboardEnabled;

/**
 <p>An array of objects, one for each verified domain that you use to send email and enabled the Deliverability dashboard for.</p>
 */
@property (nonatomic, strong) NSArray<AWSSESDomainDeliverabilityTrackingOption *> * _Nullable subscribedDomains;

@end

/**
 <p>A response that indicates whether the Deliverability dashboard is enabled.</p>
 */
@interface AWSSESPutDeliverabilityDashboardOptionResponse : AWSModel


@end

/**
 <p>A request to enable or disable DKIM signing of email that you send from an email identity.</p>
 Required parameters: [EmailIdentity]
 */
@interface AWSSESPutEmailIdentityDkimAttributesRequest : AWSRequest


/**
 <p>The email identity that you want to change the DKIM settings for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable emailIdentity;

/**
 <p>Sets the DKIM signing configuration for the identity.</p><p>When you set this value <code>true</code>, then the messages that are sent from the identity are signed using DKIM. If you set this value to <code>false</code>, your messages are sent without DKIM signing.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable signingEnabled;

@end

/**
 <p>An HTTP 200 response if the request succeeds, or an error message if the request fails.</p>
 */
@interface AWSSESPutEmailIdentityDkimAttributesResponse : AWSModel


@end

/**
 <p>A request to change the DKIM attributes for an email identity.</p>
 Required parameters: [EmailIdentity, SigningAttributesOrigin]
 */
@interface AWSSESPutEmailIdentityDkimSigningAttributesRequest : AWSRequest


/**
 <p>The email identity that you want to configure DKIM for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable emailIdentity;

/**
 <p>An object that contains information about the private key and selector that you want to use to configure DKIM for the identity. This object is only required if you want to configure Bring Your Own DKIM (BYODKIM) for the identity.</p>
 */
@property (nonatomic, strong) AWSSESDkimSigningAttributes * _Nullable signingAttributes;

/**
 <p>The method that you want to use to configure DKIM for the identity. There are two possible values:</p><ul><li><p><code>AWS_SES</code> – Configure DKIM for the identity by using <a href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/easy-dkim.html">Easy DKIM</a>.</p></li><li><p><code>EXTERNAL</code> – Configure DKIM for the identity by using Bring Your Own DKIM (BYODKIM).</p></li></ul>
 */
@property (nonatomic, assign) AWSSESDkimSigningAttributesOrigin signingAttributesOrigin;

@end

/**
 <p>If the action is successful, the service sends back an HTTP 200 response.</p><p>The following data is returned in JSON format by the service.</p>
 */
@interface AWSSESPutEmailIdentityDkimSigningAttributesResponse : AWSModel


/**
 <p>The DKIM authentication status of the identity. Amazon SES determines the authentication status by searching for specific records in the DNS configuration for your domain. If you used <a href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/easy-dkim.html">Easy DKIM</a> to set up DKIM authentication, Amazon SES tries to find three unique CNAME records in the DNS configuration for your domain.</p><p>If you provided a public key to perform DKIM authentication, Amazon SES tries to find a TXT record that uses the selector that you specified. The value of the TXT record must be a public key that's paired with the private key that you specified in the process of creating the identity.</p><p>The status can be one of the following:</p><ul><li><p><code>PENDING</code> – The verification process was initiated, but Amazon SES hasn't yet detected the DKIM records in the DNS configuration for the domain.</p></li><li><p><code>SUCCESS</code> – The verification process completed successfully.</p></li><li><p><code>FAILED</code> – The verification process failed. This typically occurs when Amazon SES fails to find the DKIM records in the DNS configuration of the domain.</p></li><li><p><code>TEMPORARY_FAILURE</code> – A temporary issue is preventing Amazon SES from determining the DKIM authentication status of the domain.</p></li><li><p><code>NOT_STARTED</code> – The DKIM verification process hasn't been initiated for the domain.</p></li></ul>
 */
@property (nonatomic, assign) AWSSESDkimStatus dkimStatus;

/**
 <p>If you used <a href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/easy-dkim.html">Easy DKIM</a> to configure DKIM authentication for the domain, then this object contains a set of unique strings that you use to create a set of CNAME records that you add to the DNS configuration for your domain. When Amazon SES detects these records in the DNS configuration for your domain, the DKIM authentication process is complete.</p><p>If you configured DKIM authentication for the domain by providing your own public-private key pair, then this object contains the selector that's associated with your public key.</p><p>Regardless of the DKIM authentication method you use, Amazon SES searches for the appropriate records in the DNS configuration of the domain for up to 72 hours.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable dkimTokens;

@end

/**
 <p>A request to set the attributes that control how bounce and complaint events are processed.</p>
 Required parameters: [EmailIdentity]
 */
@interface AWSSESPutEmailIdentityFeedbackAttributesRequest : AWSRequest


/**
 <p>Sets the feedback forwarding configuration for the identity.</p><p>If the value is <code>true</code>, you receive email notifications when bounce or complaint events occur. These notifications are sent to the address that you specified in the <code>Return-Path</code> header of the original email.</p><p>You're required to have a method of tracking bounces and complaints. If you haven't set up another mechanism for receiving bounce or complaint notifications (for example, by setting up an event destination), you receive an email notification when these events occur (even if this setting is disabled).</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable emailForwardingEnabled;

/**
 <p>The email identity that you want to configure bounce and complaint feedback forwarding for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable emailIdentity;

@end

/**
 <p>An HTTP 200 response if the request succeeds, or an error message if the request fails.</p>
 */
@interface AWSSESPutEmailIdentityFeedbackAttributesResponse : AWSModel


@end

/**
 <p>A request to configure the custom MAIL FROM domain for a verified identity.</p>
 Required parameters: [EmailIdentity]
 */
@interface AWSSESPutEmailIdentityMailFromAttributesRequest : AWSRequest


/**
 <p>The action that you want to take if the required MX record isn't found when you send an email. When you set this value to <code>UseDefaultValue</code>, the mail is sent using <i>amazonses.com</i> as the MAIL FROM domain. When you set this value to <code>RejectMessage</code>, the Amazon SES API v2 returns a <code>MailFromDomainNotVerified</code> error, and doesn't attempt to deliver the email.</p><p>These behaviors are taken when the custom MAIL FROM domain configuration is in the <code>Pending</code>, <code>Failed</code>, and <code>TemporaryFailure</code> states.</p>
 */
@property (nonatomic, assign) AWSSESBehaviorOnMxFailure behaviorOnMxFailure;

/**
 <p>The verified email identity that you want to set up the custom MAIL FROM domain for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable emailIdentity;

/**
 <p> The custom MAIL FROM domain that you want the verified identity to use. The MAIL FROM domain must meet the following criteria:</p><ul><li><p>It has to be a subdomain of the verified identity.</p></li><li><p>It can't be used to receive email.</p></li><li><p>It can't be used in a "From" address if the MAIL FROM domain is a destination for feedback forwarding emails.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable mailFromDomain;

@end

/**
 <p>An HTTP 200 response if the request succeeds, or an error message if the request fails.</p>
 */
@interface AWSSESPutEmailIdentityMailFromAttributesResponse : AWSModel


@end

/**
 <p>A request to add an email destination to the suppression list for your account.</p>
 Required parameters: [EmailAddress, Reason]
 */
@interface AWSSESPutSuppressedDestinationRequest : AWSRequest


/**
 <p>The email address that should be added to the suppression list for your account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable emailAddress;

/**
 <p>The factors that should cause the email address to be added to the suppression list for your account.</p>
 */
@property (nonatomic, assign) AWSSESSuppressionListReason reason;

@end

/**
 <p>An HTTP 200 response if the request succeeds, or an error message if the request fails.</p>
 */
@interface AWSSESPutSuppressedDestinationResponse : AWSModel


@end

/**
 <p>Represents the raw content of an email message.</p>
 Required parameters: [Data]
 */
@interface AWSSESRawMessage : AWSModel


/**
 <p>The raw email message. The message has to meet the following criteria:</p><ul><li><p>The message has to contain a header and a body, separated by one blank line.</p></li><li><p>All of the required header fields must be present in the message.</p></li><li><p>Each part of a multipart MIME message must be formatted properly.</p></li><li><p>Attachments must be in a file format that the Amazon SES supports.</p></li><li><p>The entire message must be Base64 encoded.</p></li><li><p>If any of the MIME parts in your message contain content that is outside of the 7-bit ASCII character range, you should encode that content to ensure that recipients' email clients render the message properly.</p></li><li><p>The length of any single line of text in the message can't exceed 1,000 characters. This restriction is defined in <a href="https://tools.ietf.org/html/rfc5321">RFC 5321</a>.</p></li></ul>
 */
@property (nonatomic, strong) NSData * _Nullable data;

@end

/**
 <p>Enable or disable collection of reputation metrics for emails that you send using this configuration set in the current AWS Region. </p>
 */
@interface AWSSESReputationOptions : AWSModel


/**
 <p>The date and time (in Unix time) when the reputation metrics were last given a fresh start. When your account is given a fresh start, your reputation metrics are calculated starting from the date of the fresh start.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastFreshStart;

/**
 <p>If <code>true</code>, tracking of reputation metrics is enabled for the configuration set. If <code>false</code>, tracking of reputation metrics is disabled for the configuration set.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable reputationMetricsEnabled;

@end

/**
 <p>A request to send an email message.</p>
 Required parameters: [Destination, Content]
 */
@interface AWSSESSendEmailRequest : AWSRequest


/**
 <p>The name of the configuration set that you want to use when sending the email.</p>
 */
@property (nonatomic, strong) NSString * _Nullable configurationSetName;

/**
 <p>An object that contains the body of the message. You can send either a Simple message or a Raw message.</p>
 */
@property (nonatomic, strong) AWSSESEmailContent * _Nullable content;

/**
 <p>An object that contains the recipients of the email message.</p>
 */
@property (nonatomic, strong) AWSSESDestination * _Nullable destination;

/**
 <p>A list of tags, in the form of name/value pairs, to apply to an email that you send using the <code>SendEmail</code> operation. Tags correspond to characteristics of the email that you define, so that you can publish email sending events. </p>
 */
@property (nonatomic, strong) NSArray<AWSSESMessageTag *> * _Nullable emailTags;

/**
 <p>The address that you want bounce and complaint notifications to be sent to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable feedbackForwardingEmailAddress;

/**
 <p>The email address that you want to use as the "From" address for the email. The address that you specify has to be verified. </p>
 */
@property (nonatomic, strong) NSString * _Nullable fromEmailAddress;

/**
 <p>The "Reply-to" email addresses for the message. When the recipient replies to the message, each Reply-to address receives the reply.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable replyToAddresses;

@end

/**
 <p>A unique message ID that you receive when an email is accepted for sending.</p>
 */
@interface AWSSESSendEmailResponse : AWSModel


/**
 <p>A unique identifier for the message that is generated when the message is accepted.</p><note><p>It's possible for Amazon SES to accept a message without sending it. This can happen when the message that you're trying to send has an attachment contains a virus, or when you send a templated email that contains invalid personalization content, for example.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable messageId;

@end

/**
 <p>An object that contains information about the per-day and per-second sending limits for your Amazon SES account in the current AWS Region.</p>
 */
@interface AWSSESSendQuota : AWSModel


/**
 <p>The maximum number of emails that you can send in the current AWS Region over a 24-hour period. This value is also called your <i>sending quota</i>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable max24HourSend;

/**
 <p>The maximum number of emails that you can send per second in the current AWS Region. This value is also called your <i>maximum sending rate</i> or your <i>maximum TPS (transactions per second) rate</i>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxSendRate;

/**
 <p>The number of emails sent from your Amazon SES account in the current AWS Region over the past 24 hours.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable sentLast24Hours;

@end

/**
 <p>Used to enable or disable email sending for messages that use this configuration set in the current AWS Region.</p>
 */
@interface AWSSESSendingOptions : AWSModel


/**
 <p>If <code>true</code>, email sending is enabled for the configuration set. If <code>false</code>, email sending is disabled for the configuration set.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable sendingEnabled;

@end

/**
 <p>An object that defines an Amazon SNS destination for email events. You can use Amazon SNS to send notification when certain email events occur.</p>
 Required parameters: [TopicArn]
 */
@interface AWSSESSnsDestination : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the Amazon SNS topic that you want to publish email events to. For more information about Amazon SNS topics, see the <a href="https://docs.aws.amazon.com/sns/latest/dg/CreateTopic.html">Amazon SNS Developer Guide</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable topicArn;

@end

/**
 <p>An object that contains information about an email address that is on the suppression list for your account.</p>
 Required parameters: [EmailAddress, Reason, LastUpdateTime]
 */
@interface AWSSESSuppressedDestination : AWSModel


/**
 <p>An optional value that can contain additional information about the reasons that the address was added to the suppression list for your account.</p>
 */
@property (nonatomic, strong) AWSSESSuppressedDestinationAttributes * _Nullable attributes;

/**
 <p>The email address that is on the suppression list for your account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable emailAddress;

/**
 <p>The date and time when the suppressed destination was last updated, shown in Unix time format.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdateTime;

/**
 <p>The reason that the address was added to the suppression list for your account.</p>
 */
@property (nonatomic, assign) AWSSESSuppressionListReason reason;

@end

/**
 <p>An object that contains additional attributes that are related an email address that is on the suppression list for your account.</p>
 */
@interface AWSSESSuppressedDestinationAttributes : AWSModel


/**
 <p>A unique identifier that's generated when an email address is added to the suppression list for your account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable feedbackId;

/**
 <p>The unique identifier of the email message that caused the email address to be added to the suppression list for your account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable messageId;

@end

/**
 <p>A summary that describes the suppressed email address.</p>
 Required parameters: [EmailAddress, Reason, LastUpdateTime]
 */
@interface AWSSESSuppressedDestinationSummary : AWSModel


/**
 <p>The email address that's on the suppression list for your account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable emailAddress;

/**
 <p>The date and time when the suppressed destination was last updated, shown in Unix time format.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdateTime;

/**
 <p>The reason that the address was added to the suppression list for your account.</p>
 */
@property (nonatomic, assign) AWSSESSuppressionListReason reason;

@end

/**
 <p>An object that contains information about the email address suppression preferences for your account in the current AWS Region.</p>
 */
@interface AWSSESSuppressionAttributes : AWSModel


/**
 <p>A list that contains the reasons that email addresses will be automatically added to the suppression list for your account. This list can contain any or all of the following:</p><ul><li><p><code>COMPLAINT</code> – Amazon SES adds an email address to the suppression list for your account when a message sent to that address results in a complaint.</p></li><li><p><code>BOUNCE</code> – Amazon SES adds an email address to the suppression list for your account when a message sent to that address results in a hard bounce.</p></li></ul>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable suppressedReasons;

@end

/**
 <p>An object that contains information about the suppression list preferences for your account.</p>
 */
@interface AWSSESSuppressionOptions : AWSModel


/**
 <p>A list that contains the reasons that email addresses are automatically added to the suppression list for your account. This list can contain any or all of the following:</p><ul><li><p><code>COMPLAINT</code> – Amazon SES adds an email address to the suppression list for your account when a message sent to that address results in a complaint.</p></li><li><p><code>BOUNCE</code> – Amazon SES adds an email address to the suppression list for your account when a message sent to that address results in a hard bounce.</p></li></ul>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable suppressedReasons;

@end

/**
 <p>An object that defines the tags that are associated with a resource. A <i>tag</i> is a label that you optionally define and associate with a resource. Tags can help you categorize and manage resources in different ways, such as by purpose, owner, environment, or other criteria. A resource can have as many as 50 tags.</p><p>Each tag consists of a required <i>tag key</i> and an associated <i>tag value</i>, both of which you define. A tag key is a general label that acts as a category for a more specific tag value. A tag value acts as a descriptor within a tag key. A tag key can contain as many as 128 characters. A tag value can contain as many as 256 characters. The characters can be Unicode letters, digits, white space, or one of the following symbols: _ . : / = + -. The following additional restrictions apply to tags:</p><ul><li><p>Tag keys and values are case sensitive.</p></li><li><p>For each associated resource, each tag key must be unique and it can have only one value.</p></li><li><p>The <code>aws:</code> prefix is reserved for use by AWS; you can’t use it in any tag keys or values that you define. In addition, you can't edit or remove tag keys or values that use this prefix. Tags that use this prefix don’t count against the limit of 50 tags per resource.</p></li><li><p>You can associate tags with public or shared resources, but the tags are available only for your AWS account, not any other accounts that share the resource. In addition, the tags are available only for resources that are located in the specified AWS Region for your AWS account.</p></li></ul>
 Required parameters: [Key, Value]
 */
@interface AWSSESTag : AWSModel


/**
 <p>One part of a key-value pair that defines a tag. The maximum length of a tag key is 128 characters. The minimum length is 1 character.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>The optional part of a key-value pair that defines a tag. The maximum length of a tag value is 256 characters. The minimum length is 0 characters. If you don't want a resource to have a specific tag value, don't specify a value for this parameter. If you don't specify a value, Amazon SES sets the value to an empty string.</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 
 */
@interface AWSSESTagResourceRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the resource that you want to add one or more tags to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

/**
 <p>A list of the tags that you want to add to the resource. A tag consists of a required tag key (<code>Key</code>) and an associated tag value (<code>Value</code>). The maximum length of a tag key is 128 characters. The maximum length of a tag value is 256 characters.</p>
 */
@property (nonatomic, strong) NSArray<AWSSESTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSSESTagResourceResponse : AWSModel


@end

/**
 <p>An object that defines the email template to use for an email message, and the values to use for any message variables in that template. An <i>email template</i> is a type of message template that contains content that you want to define, save, and reuse in email messages that you send.</p>
 */
@interface AWSSESTemplate : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateArn;

/**
 <p>An object that defines the values to use for message variables in the template. This object is a set of key-value pairs. Each key defines a message variable in the template. The corresponding value defines the value to use for that variable.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateData;

@end

/**
 <p>An object that defines the tracking options for a configuration set. When you use the Amazon SES API v2 to send an email, it contains an invisible image that's used to track when recipients open your email. If your email contains links, those links are changed slightly in order to track when recipients click them.</p><p>These images and links include references to a domain operated by AWS. You can optionally configure the Amazon SES to use a domain that you operate for these images and links.</p>
 Required parameters: [CustomRedirectDomain]
 */
@interface AWSSESTrackingOptions : AWSModel


/**
 <p>The domain that you want to use for tracking open and click events.</p>
 */
@property (nonatomic, strong) NSString * _Nullable customRedirectDomain;

@end

/**
 
 */
@interface AWSSESUntagResourceRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the resource that you want to remove one or more tags from.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

/**
 <p>The tags (tag keys) that you want to remove from the resource. When you specify a tag key, the action removes both that key and its associated tag value.</p><p>To remove more than one tag from the resource, append the <code>TagKeys</code> parameter and argument for each additional tag to remove, separated by an ampersand. For example: <code>/v2/email/tags?ResourceArn=ResourceArn&amp;TagKeys=Key1&amp;TagKeys=Key2</code></p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable tagKeys;

@end

/**
 
 */
@interface AWSSESUntagResourceResponse : AWSModel


@end

/**
 <p>A request to change the settings for an event destination for a configuration set.</p>
 Required parameters: [ConfigurationSetName, EventDestinationName, EventDestination]
 */
@interface AWSSESUpdateConfigurationSetEventDestinationRequest : AWSRequest


/**
 <p>The name of the configuration set that contains the event destination that you want to modify.</p>
 */
@property (nonatomic, strong) NSString * _Nullable configurationSetName;

/**
 <p>An object that defines the event destination.</p>
 */
@property (nonatomic, strong) AWSSESEventDestinationDefinition * _Nullable eventDestination;

/**
 <p>The name of the event destination that you want to modify.</p>
 */
@property (nonatomic, strong) NSString * _Nullable eventDestinationName;

@end

/**
 <p>An HTTP 200 response if the request succeeds, or an error message if the request fails.</p>
 */
@interface AWSSESUpdateConfigurationSetEventDestinationResponse : AWSModel


@end

/**
 <p>An object that contains information about the amount of email that was delivered to recipients.</p>
 */
@interface AWSSESVolumeStatistics : AWSModel


/**
 <p>The total number of emails that arrived in recipients' inboxes.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable inboxRawCount;

/**
 <p>An estimate of the percentage of emails sent from the current domain that will arrive in recipients' inboxes.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable projectedInbox;

/**
 <p>An estimate of the percentage of emails sent from the current domain that will arrive in recipients' spam or junk mail folders.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable projectedSpam;

/**
 <p>The total number of emails that arrived in recipients' spam or junk mail folders.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable spamRawCount;

@end

NS_ASSUME_NONNULL_END
