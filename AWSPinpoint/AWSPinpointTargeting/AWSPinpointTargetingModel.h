//
// Copyright 2010-2017 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

FOUNDATION_EXPORT NSString *const AWSPinpointTargetingErrorDomain;

typedef NS_ENUM(NSInteger, AWSPinpointTargetingErrorType) {
    AWSPinpointTargetingErrorUnknown,
    AWSPinpointTargetingErrorBadRequest,
    AWSPinpointTargetingErrorForbidden,
    AWSPinpointTargetingErrorInternalServerError,
    AWSPinpointTargetingErrorMethodNotAllowed,
    AWSPinpointTargetingErrorNotFound,
    AWSPinpointTargetingErrorTooManyRequests,
};

typedef NS_ENUM(NSInteger, AWSPinpointTargetingAction) {
    AWSPinpointTargetingActionUnknown,
    AWSPinpointTargetingActionOpenApp,
    AWSPinpointTargetingActionDeepLink,
    AWSPinpointTargetingActionUrl,
};

typedef NS_ENUM(NSInteger, AWSPinpointTargetingAttributeType) {
    AWSPinpointTargetingAttributeTypeUnknown,
    AWSPinpointTargetingAttributeTypeInclusive,
    AWSPinpointTargetingAttributeTypeExclusive,
};

typedef NS_ENUM(NSInteger, AWSPinpointTargetingCampaignStatus) {
    AWSPinpointTargetingCampaignStatusUnknown,
    AWSPinpointTargetingCampaignStatusScheduled,
    AWSPinpointTargetingCampaignStatusExecuting,
    AWSPinpointTargetingCampaignStatusPendingNextRun,
    AWSPinpointTargetingCampaignStatusCompleted,
    AWSPinpointTargetingCampaignStatusPaused,
};

typedef NS_ENUM(NSInteger, AWSPinpointTargetingChannelType) {
    AWSPinpointTargetingChannelTypeUnknown,
    AWSPinpointTargetingChannelTypeGcm,
    AWSPinpointTargetingChannelTypeApns,
    AWSPinpointTargetingChannelTypeApnsSandbox,
    AWSPinpointTargetingChannelTypeAdm,
    AWSPinpointTargetingChannelTypeSms,
    AWSPinpointTargetingChannelTypeEmail,
};

typedef NS_ENUM(NSInteger, AWSPinpointTargetingDeliveryStatus) {
    AWSPinpointTargetingDeliveryStatusUnknown,
    AWSPinpointTargetingDeliveryStatusSuccessful,
    AWSPinpointTargetingDeliveryStatusThrottled,
    AWSPinpointTargetingDeliveryStatusTemporaryFailure,
    AWSPinpointTargetingDeliveryStatusPermanentFailure,
};

typedef NS_ENUM(NSInteger, AWSPinpointTargetingDimensionType) {
    AWSPinpointTargetingDimensionTypeUnknown,
    AWSPinpointTargetingDimensionTypeInclusive,
    AWSPinpointTargetingDimensionTypeExclusive,
};

typedef NS_ENUM(NSInteger, AWSPinpointTargetingDuration) {
    AWSPinpointTargetingDurationUnknown,
    AWSPinpointTargetingDurationHr24,
    AWSPinpointTargetingDurationDay7,
    AWSPinpointTargetingDurationDay14,
    AWSPinpointTargetingDurationDay30,
};

typedef NS_ENUM(NSInteger, AWSPinpointTargetingFormat) {
    AWSPinpointTargetingFormatUnknown,
    AWSPinpointTargetingFormatCsv,
    AWSPinpointTargetingFormatJson,
};

typedef NS_ENUM(NSInteger, AWSPinpointTargetingFrequency) {
    AWSPinpointTargetingFrequencyUnknown,
    AWSPinpointTargetingFrequencyOnce,
    AWSPinpointTargetingFrequencyHourly,
    AWSPinpointTargetingFrequencyDaily,
    AWSPinpointTargetingFrequencyWeekly,
    AWSPinpointTargetingFrequencyMonthly,
};

typedef NS_ENUM(NSInteger, AWSPinpointTargetingJobStatus) {
    AWSPinpointTargetingJobStatusUnknown,
    AWSPinpointTargetingJobStatusCreated,
    AWSPinpointTargetingJobStatusInitializing,
    AWSPinpointTargetingJobStatusProcessing,
    AWSPinpointTargetingJobStatusCompleting,
    AWSPinpointTargetingJobStatusCompleted,
    AWSPinpointTargetingJobStatusFailing,
    AWSPinpointTargetingJobStatusFailed,
};

typedef NS_ENUM(NSInteger, AWSPinpointTargetingMessageType) {
    AWSPinpointTargetingMessageTypeUnknown,
    AWSPinpointTargetingMessageTypeTransactional,
    AWSPinpointTargetingMessageTypePromotional,
};

typedef NS_ENUM(NSInteger, AWSPinpointTargetingRecencyType) {
    AWSPinpointTargetingRecencyTypeUnknown,
    AWSPinpointTargetingRecencyTypeActive,
    AWSPinpointTargetingRecencyTypeInactive,
};

typedef NS_ENUM(NSInteger, AWSPinpointTargetingSegmentType) {
    AWSPinpointTargetingSegmentTypeUnknown,
    AWSPinpointTargetingSegmentTypeDimensional,
    AWSPinpointTargetingSegmentTypeImport,
};

@class AWSPinpointTargetingAPNSChannelRequest;
@class AWSPinpointTargetingAPNSChannelResponse;
@class AWSPinpointTargetingAPNSMessage;
@class AWSPinpointTargetingAPNSSandboxChannelRequest;
@class AWSPinpointTargetingAPNSSandboxChannelResponse;
@class AWSPinpointTargetingActivitiesResponse;
@class AWSPinpointTargetingActivityResponse;
@class AWSPinpointTargetingAddressConfiguration;
@class AWSPinpointTargetingApplicationSettingsResource;
@class AWSPinpointTargetingAttributeDimension;
@class AWSPinpointTargetingCampaignEmailMessage;
@class AWSPinpointTargetingCampaignLimits;
@class AWSPinpointTargetingCampaignResponse;
@class AWSPinpointTargetingCampaignSmsMessage;
@class AWSPinpointTargetingCampaignState;
@class AWSPinpointTargetingCampaignsResponse;
@class AWSPinpointTargetingCreateCampaignRequest;
@class AWSPinpointTargetingCreateCampaignResponse;
@class AWSPinpointTargetingCreateImportJobRequest;
@class AWSPinpointTargetingCreateImportJobResponse;
@class AWSPinpointTargetingCreateSegmentRequest;
@class AWSPinpointTargetingCreateSegmentResponse;
@class AWSPinpointTargetingDefaultMessage;
@class AWSPinpointTargetingDefaultPushNotificationMessage;
@class AWSPinpointTargetingDeleteApnsChannelRequest;
@class AWSPinpointTargetingDeleteApnsChannelResponse;
@class AWSPinpointTargetingDeleteApnsSandboxChannelRequest;
@class AWSPinpointTargetingDeleteApnsSandboxChannelResponse;
@class AWSPinpointTargetingDeleteCampaignRequest;
@class AWSPinpointTargetingDeleteCampaignResponse;
@class AWSPinpointTargetingDeleteEmailChannelRequest;
@class AWSPinpointTargetingDeleteEmailChannelResponse;
@class AWSPinpointTargetingDeleteEventStreamRequest;
@class AWSPinpointTargetingDeleteEventStreamResponse;
@class AWSPinpointTargetingDeleteGcmChannelRequest;
@class AWSPinpointTargetingDeleteGcmChannelResponse;
@class AWSPinpointTargetingDeleteSegmentRequest;
@class AWSPinpointTargetingDeleteSegmentResponse;
@class AWSPinpointTargetingDeleteSmsChannelRequest;
@class AWSPinpointTargetingDeleteSmsChannelResponse;
@class AWSPinpointTargetingDirectMessageConfiguration;
@class AWSPinpointTargetingEmailChannelRequest;
@class AWSPinpointTargetingEmailChannelResponse;
@class AWSPinpointTargetingEndpointBatchItem;
@class AWSPinpointTargetingEndpointBatchRequest;
@class AWSPinpointTargetingEndpointDemographic;
@class AWSPinpointTargetingEndpointLocation;
@class AWSPinpointTargetingEndpointRequest;
@class AWSPinpointTargetingEndpointResponse;
@class AWSPinpointTargetingEndpointUser;
@class AWSPinpointTargetingEventStream;
@class AWSPinpointTargetingGCMChannelRequest;
@class AWSPinpointTargetingGCMChannelResponse;
@class AWSPinpointTargetingGCMMessage;
@class AWSPinpointTargetingGetApnsChannelRequest;
@class AWSPinpointTargetingGetApnsChannelResponse;
@class AWSPinpointTargetingGetApnsSandboxChannelRequest;
@class AWSPinpointTargetingGetApnsSandboxChannelResponse;
@class AWSPinpointTargetingGetApplicationSettingsRequest;
@class AWSPinpointTargetingGetApplicationSettingsResponse;
@class AWSPinpointTargetingGetCampaignActivitiesRequest;
@class AWSPinpointTargetingGetCampaignActivitiesResponse;
@class AWSPinpointTargetingGetCampaignRequest;
@class AWSPinpointTargetingGetCampaignResponse;
@class AWSPinpointTargetingGetCampaignVersionRequest;
@class AWSPinpointTargetingGetCampaignVersionResponse;
@class AWSPinpointTargetingGetCampaignVersionsRequest;
@class AWSPinpointTargetingGetCampaignVersionsResponse;
@class AWSPinpointTargetingGetCampaignsRequest;
@class AWSPinpointTargetingGetCampaignsResponse;
@class AWSPinpointTargetingGetEmailChannelRequest;
@class AWSPinpointTargetingGetEmailChannelResponse;
@class AWSPinpointTargetingGetEndpointRequest;
@class AWSPinpointTargetingGetEndpointResponse;
@class AWSPinpointTargetingGetEventStreamRequest;
@class AWSPinpointTargetingGetEventStreamResponse;
@class AWSPinpointTargetingGetGcmChannelRequest;
@class AWSPinpointTargetingGetGcmChannelResponse;
@class AWSPinpointTargetingGetImportJobRequest;
@class AWSPinpointTargetingGetImportJobResponse;
@class AWSPinpointTargetingGetImportJobsRequest;
@class AWSPinpointTargetingGetImportJobsResponse;
@class AWSPinpointTargetingGetSegmentImportJobsRequest;
@class AWSPinpointTargetingGetSegmentImportJobsResponse;
@class AWSPinpointTargetingGetSegmentRequest;
@class AWSPinpointTargetingGetSegmentResponse;
@class AWSPinpointTargetingGetSegmentVersionRequest;
@class AWSPinpointTargetingGetSegmentVersionResponse;
@class AWSPinpointTargetingGetSegmentVersionsRequest;
@class AWSPinpointTargetingGetSegmentVersionsResponse;
@class AWSPinpointTargetingGetSegmentsRequest;
@class AWSPinpointTargetingGetSegmentsResponse;
@class AWSPinpointTargetingGetSmsChannelRequest;
@class AWSPinpointTargetingGetSmsChannelResponse;
@class AWSPinpointTargetingImportJobRequest;
@class AWSPinpointTargetingImportJobResource;
@class AWSPinpointTargetingImportJobResponse;
@class AWSPinpointTargetingImportJobsResponse;
@class AWSPinpointTargetingMessage;
@class AWSPinpointTargetingMessageBody;
@class AWSPinpointTargetingMessageConfiguration;
@class AWSPinpointTargetingMessageRequest;
@class AWSPinpointTargetingMessageResponse;
@class AWSPinpointTargetingMessageResult;
@class AWSPinpointTargetingPutEventStreamRequest;
@class AWSPinpointTargetingPutEventStreamResponse;
@class AWSPinpointTargetingQuietTime;
@class AWSPinpointTargetingRecencyDimension;
@class AWSPinpointTargetingSMSChannelRequest;
@class AWSPinpointTargetingSMSChannelResponse;
@class AWSPinpointTargetingSMSMessage;
@class AWSPinpointTargetingSchedule;
@class AWSPinpointTargetingSegmentBehaviors;
@class AWSPinpointTargetingSegmentDemographics;
@class AWSPinpointTargetingSegmentDimensions;
@class AWSPinpointTargetingSegmentImportResource;
@class AWSPinpointTargetingSegmentLocation;
@class AWSPinpointTargetingSegmentResponse;
@class AWSPinpointTargetingSegmentsResponse;
@class AWSPinpointTargetingSendMessagesRequest;
@class AWSPinpointTargetingSendMessagesResponse;
@class AWSPinpointTargetingSetDimension;
@class AWSPinpointTargetingTreatmentResource;
@class AWSPinpointTargetingUpdateApnsChannelRequest;
@class AWSPinpointTargetingUpdateApnsChannelResponse;
@class AWSPinpointTargetingUpdateApnsSandboxChannelRequest;
@class AWSPinpointTargetingUpdateApnsSandboxChannelResponse;
@class AWSPinpointTargetingUpdateApplicationSettingsRequest;
@class AWSPinpointTargetingUpdateApplicationSettingsResponse;
@class AWSPinpointTargetingUpdateCampaignRequest;
@class AWSPinpointTargetingUpdateCampaignResponse;
@class AWSPinpointTargetingUpdateEmailChannelRequest;
@class AWSPinpointTargetingUpdateEmailChannelResponse;
@class AWSPinpointTargetingUpdateEndpointRequest;
@class AWSPinpointTargetingUpdateEndpointResponse;
@class AWSPinpointTargetingUpdateEndpointsBatchRequest;
@class AWSPinpointTargetingUpdateEndpointsBatchResponse;
@class AWSPinpointTargetingUpdateGcmChannelRequest;
@class AWSPinpointTargetingUpdateGcmChannelResponse;
@class AWSPinpointTargetingUpdateSegmentRequest;
@class AWSPinpointTargetingUpdateSegmentResponse;
@class AWSPinpointTargetingUpdateSmsChannelRequest;
@class AWSPinpointTargetingUpdateSmsChannelResponse;
@class AWSPinpointTargetingWriteApplicationSettingsRequest;
@class AWSPinpointTargetingWriteCampaignRequest;
@class AWSPinpointTargetingWriteEventStream;
@class AWSPinpointTargetingWriteSegmentRequest;
@class AWSPinpointTargetingWriteTreatmentResource;

/**
 Apple Push Notification Service channel definition.
 */
@interface AWSPinpointTargetingAPNSChannelRequest : AWSModel


/**
 The distribution certificate from Apple.
 */
@property (nonatomic, strong) NSString * _Nullable certificate;

/**
 If the channel is enabled for sending messages.
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

/**
 The certificate private key.
 */
@property (nonatomic, strong) NSString * _Nullable privateKey;

@end

/**
 Apple Distribution Push Notification Service channel definition.
 */
@interface AWSPinpointTargetingAPNSChannelResponse : AWSModel


/**
 The ID of the application to which the channel applies.
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 When was this segment created
 */
@property (nonatomic, strong) NSString * _Nullable creationDate;

/**
 If the channel is enabled for sending messages.
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

/**
 Channel ID. Not used, only for backwards compatibility.
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 Is this channel archived
 */
@property (nonatomic, strong) NSNumber * _Nullable isArchived;

/**
 Who last updated this entry
 */
@property (nonatomic, strong) NSString * _Nullable lastModifiedBy;

/**
 Last date this was updated
 */
@property (nonatomic, strong) NSString * _Nullable lastModifiedDate;

/**
 The platform type. Will be APNS.
 */
@property (nonatomic, strong) NSString * _Nullable platform;

/**
 Version of channel
 */
@property (nonatomic, strong) NSNumber * _Nullable version;

@end

/**
 APNS Message.
 */
@interface AWSPinpointTargetingAPNSMessage : AWSModel


/**
 The action that occurs if the user taps a push notification delivered by the campaign: OPEN_APP - Your app launches, or it becomes the foreground app if it has been sent to the background. This is the default action. DEEP_LINK - Uses deep linking features in iOS and Android to open your app and display a designated user interface within the app. URL - The default mobile browser on the user's device launches and opens a web page at the URL you specify. Possible values include: OPEN_APP | DEEP_LINK | URL
 */
@property (nonatomic, assign) AWSPinpointTargetingAction action;

/**
 Include this key when you want the system to modify the badge of your app icon. If this key is not included in the dictionary, the badge is not changed. To remove the badge, set the value of this key to 0.
 */
@property (nonatomic, strong) NSNumber * _Nullable badge;

/**
 The message body of the notification, the email body or the text message.
 */
@property (nonatomic, strong) NSString * _Nullable body;

/**
 Provide this key with a string value that represents the notification's type. This value corresponds to the value in the identifier property of one of your app's registered categories.
 */
@property (nonatomic, strong) NSString * _Nullable category;

/**
 The data payload used for a silent push. This payload is added to the notifications' data.pinpoint.jsonBody' object
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable data;

/**
 The URL that points to a video used in the push notification.
 */
@property (nonatomic, strong) NSString * _Nullable mediaUrl;

/**
 The Raw JSON formatted string to be used as the payload. This value overrides the message.
 */
@property (nonatomic, strong) NSString * _Nullable rawContent;

/**
 Indicates if the message should display on the users device. Silent pushes can be used for Remote Configuration and Phone Home use cases.
 */
@property (nonatomic, strong) NSNumber * _Nullable silentPush;

/**
 Include this key when you want the system to play a sound. The value of this key is the name of a sound file in your app's main bundle or in the Library/Sounds folder of your app's data container. If the sound file cannot be found, or if you specify defaultfor the value, the system plays the default alert sound.
 */
@property (nonatomic, strong) NSString * _Nullable sound;

/**
 Default message substitutions. Can be overridden by individual address substitutions.
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSArray<NSString *> *> * _Nullable substitutions;

/**
 Provide this key with a string value that represents the app-specific identifier for grouping notifications. If you provide a Notification Content app extension, you can use this value to group your notifications together.
 */
@property (nonatomic, strong) NSString * _Nullable threadId;

/**
 The message title that displays above the message on the user's device.
 */
@property (nonatomic, strong) NSString * _Nullable title;

/**
 The URL to open in the user's mobile browser. Used if the value for Action is URL.
 */
@property (nonatomic, strong) NSString * _Nullable url;

@end

/**
 Apple Development Push Notification Service channel definition.
 */
@interface AWSPinpointTargetingAPNSSandboxChannelRequest : AWSModel


/**
 The distribution certificate from Apple.
 */
@property (nonatomic, strong) NSString * _Nullable certificate;

/**
 If the channel is enabled for sending messages.
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

/**
 The certificate private key.
 */
@property (nonatomic, strong) NSString * _Nullable privateKey;

@end

/**
 Apple Development Push Notification Service channel definition.
 */
@interface AWSPinpointTargetingAPNSSandboxChannelResponse : AWSModel


/**
 Application id
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 When was this segment created
 */
@property (nonatomic, strong) NSString * _Nullable creationDate;

/**
 If the channel is enabled for sending messages.
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

/**
 Channel ID. Not used, only for backwards compatibility.
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 Is this channel archived
 */
@property (nonatomic, strong) NSNumber * _Nullable isArchived;

/**
 Who last updated this entry
 */
@property (nonatomic, strong) NSString * _Nullable lastModifiedBy;

/**
 Last date this was updated
 */
@property (nonatomic, strong) NSString * _Nullable lastModifiedDate;

/**
 The platform type. Will be APNS.
 */
@property (nonatomic, strong) NSString * _Nullable platform;

/**
 Version of channel
 */
@property (nonatomic, strong) NSNumber * _Nullable version;

@end

/**
 Activities for campaign.
 */
@interface AWSPinpointTargetingActivitiesResponse : AWSModel


/**
 List of campaign activities
 */
@property (nonatomic, strong) NSArray<AWSPinpointTargetingActivityResponse *> * _Nullable item;

@end

/**
 Activity definition
 */
@interface AWSPinpointTargetingActivityResponse : AWSModel


/**
 The ID of the application to which the campaign applies.
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 The ID of the campaign to which the activity applies.
 */
@property (nonatomic, strong) NSString * _Nullable campaignId;

/**
 The actual time the activity was marked CANCELLED or COMPLETED. Provided in ISO 8601 format.
 */
@property (nonatomic, strong) NSString * _Nullable end;

/**
 The unique activity ID.
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 Indicates whether the activity succeeded.Valid values: SUCCESS, FAIL
 */
@property (nonatomic, strong) NSString * _Nullable result;

/**
 The scheduled start time for the activity in ISO 8601 format.
 */
@property (nonatomic, strong) NSString * _Nullable scheduledStart;

/**
 The actual start time of the activity in ISO 8601 format.
 */
@property (nonatomic, strong) NSString * _Nullable start;

/**
 The state of the activity.Valid values: PENDING, INITIALIZING, RUNNING, PAUSED, CANCELLED, COMPLETED
 */
@property (nonatomic, strong) NSString * _Nullable state;

/**
 The total number of endpoints to which the campaign successfully delivered messages.
 */
@property (nonatomic, strong) NSNumber * _Nullable successfulEndpointCount;

/**
 The total number of timezones completed.
 */
@property (nonatomic, strong) NSNumber * _Nullable timezonesCompletedCount;

/**
 The total number of unique timezones present in the segment.
 */
@property (nonatomic, strong) NSNumber * _Nullable timezonesTotalCount;

/**
 The total number of endpoints to which the campaign attempts to deliver messages.
 */
@property (nonatomic, strong) NSNumber * _Nullable totalEndpointCount;

/**
 The ID of a variation of the campaign used for A/B testing.
 */
@property (nonatomic, strong) NSString * _Nullable treatmentId;

@end

/**
 Address configuration.
 */
@interface AWSPinpointTargetingAddressConfiguration : AWSModel


/**
 Body override. If specified will override default body.
 */
@property (nonatomic, strong) NSString * _Nullable bodyOverride;

/**
 Type of channel of this address
 */
@property (nonatomic, assign) AWSPinpointTargetingChannelType channelType;

/**
 A map of custom attributes to attributes to be attached to the message for this address. This payload is added to the push notification's 'data.pinpoint' object or added to the email/sms delivery receipt event attributes.
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable context;

/**
 The Raw JSON formatted string to be used as the payload. This value overrides the message.
 */
@property (nonatomic, strong) NSString * _Nullable rawContent;

/**
 A map of substitution values for the message to be merged with the DefaultMessage's substitutions. Substitutions on this map take precedence over the all other substitutions.
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSArray<NSString *> *> * _Nullable substitutions;

/**
 Title override. If specified will override default title if applicable.
 */
@property (nonatomic, strong) NSString * _Nullable titleOverride;

@end

/**
 Application settings.
 */
@interface AWSPinpointTargetingApplicationSettingsResource : AWSModel


/**
 The unique ID for the application.
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 The date that the settings were last updated in ISO 8601 format.
 */
@property (nonatomic, strong) NSString * _Nullable lastModifiedDate;

/**
 The default campaign limits for the app. These limits apply to each campaign for the app, unless the campaign overrides the default with limits of its own.
 */
@property (nonatomic, strong) AWSPinpointTargetingCampaignLimits * _Nullable limits;

/**
 The default quiet time for the app. Each campaign for this app sends no messages during this time unless the campaign overrides the default with a quiet time of its own.
 */
@property (nonatomic, strong) AWSPinpointTargetingQuietTime * _Nullable quietTime;

@end

/**
 Custom attibute dimension
 */
@interface AWSPinpointTargetingAttributeDimension : AWSModel


/**
 The type of dimension: INCLUSIVE - Endpoints that match the criteria are included in the segment. EXCLUSIVE - Endpoints that match the criteria are excluded from the segment.
 */
@property (nonatomic, assign) AWSPinpointTargetingAttributeType attributeType;

/**
 The criteria values for the segment dimension. Endpoints with matching attribute values are included or excluded from the segment, depending on the setting for Type.
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable values;

@end

/**
 The email message configuration.
 */
@interface AWSPinpointTargetingCampaignEmailMessage : AWSModel


/**
 The email text body.
 */
@property (nonatomic, strong) NSString * _Nullable body;

/**
 The email html body.
 */
@property (nonatomic, strong) NSString * _Nullable htmlBody;

/**
 The email title (Or subject).
 */
@property (nonatomic, strong) NSString * _Nullable title;

@end

/**
 Campaign Limits are used to limit the number of messages that can be sent to a user.
 */
@interface AWSPinpointTargetingCampaignLimits : AWSModel


/**
 The maximum number of messages that the campaign can send daily.
 */
@property (nonatomic, strong) NSNumber * _Nullable daily;

/**
 The maximum total number of messages that the campaign can send.
 */
@property (nonatomic, strong) NSNumber * _Nullable total;

@end

/**
 Campaign definition
 */
@interface AWSPinpointTargetingCampaignResponse : AWSModel


/**
 Treatments that are defined in addition to the default treatment.
 */
@property (nonatomic, strong) NSArray<AWSPinpointTargetingTreatmentResource *> * _Nullable additionalTreatments;

/**
 The ID of the application to which the campaign applies.
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 The date the campaign was created in ISO 8601 format.
 */
@property (nonatomic, strong) NSString * _Nullable creationDate;

/**
 The status of the campaign's default treatment. Only present for A/B test campaigns.
 */
@property (nonatomic, strong) AWSPinpointTargetingCampaignState * _Nullable defaultState;

/**
 A description of the campaign.
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 The allocated percentage of end users who will not receive messages from this campaign.
 */
@property (nonatomic, strong) NSNumber * _Nullable holdoutPercent;

/**
 The unique campaign ID.
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 Indicates whether the campaign is paused. A paused campaign does not send messages unless you resume it by setting IsPaused to false.
 */
@property (nonatomic, strong) NSNumber * _Nullable isPaused;

/**
 The date the campaign was last updated in ISO 8601 format.	
 */
@property (nonatomic, strong) NSString * _Nullable lastModifiedDate;

/**
 The campaign limits settings.
 */
@property (nonatomic, strong) AWSPinpointTargetingCampaignLimits * _Nullable limits;

/**
 The message configuration settings.
 */
@property (nonatomic, strong) AWSPinpointTargetingMessageConfiguration * _Nullable messageConfiguration;

/**
 The custom name of the campaign.
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 The campaign schedule.
 */
@property (nonatomic, strong) AWSPinpointTargetingSchedule * _Nullable schedule;

/**
 The ID of the segment to which the campaign sends messages.
 */
@property (nonatomic, strong) NSString * _Nullable segmentId;

/**
 The version of the segment to which the campaign sends messages.
 */
@property (nonatomic, strong) NSNumber * _Nullable segmentVersion;

/**
 The campaign status.An A/B test campaign will have a status of COMPLETED only when all treatments have a status of COMPLETED.
 */
@property (nonatomic, strong) AWSPinpointTargetingCampaignState * _Nullable state;

/**
 A custom description for the treatment.
 */
@property (nonatomic, strong) NSString * _Nullable treatmentDescription;

/**
 The custom name of a variation of the campaign used for A/B testing.
 */
@property (nonatomic, strong) NSString * _Nullable treatmentName;

/**
 The campaign version number.
 */
@property (nonatomic, strong) NSNumber * _Nullable version;

@end

/**
 SMS message configuration.
 */
@interface AWSPinpointTargetingCampaignSmsMessage : AWSModel


/**
 The SMS text body.
 */
@property (nonatomic, strong) NSString * _Nullable body;

/**
 Is this is a transactional SMS message, otherwise a promotional message.
 */
@property (nonatomic, assign) AWSPinpointTargetingMessageType messageType;

/**
 Sender ID of sent message.
 */
@property (nonatomic, strong) NSString * _Nullable senderId;

@end

/**
 State of the Campaign
 */
@interface AWSPinpointTargetingCampaignState : AWSModel


/**
 The status of the campaign, or the status of a treatment that belongs to an A/B test campaign.Valid values: SCHEDULED, EXECUTING, PENDING_NEXT_RUN, COMPLETED, PAUSED
 */
@property (nonatomic, assign) AWSPinpointTargetingCampaignStatus campaignStatus;

@end

/**
 List of available campaigns.
 */
@interface AWSPinpointTargetingCampaignsResponse : AWSModel


/**
 A list of campaigns.
 */
@property (nonatomic, strong) NSArray<AWSPinpointTargetingCampaignResponse *> * _Nullable item;

/**
 The string that you use in a subsequent request to get the next page of results in a paginated response.
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSPinpointTargetingCreateCampaignRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 Used to create a campaign.
 */
@property (nonatomic, strong) AWSPinpointTargetingWriteCampaignRequest * _Nullable writeCampaignRequest;

@end

/**
 
 */
@interface AWSPinpointTargetingCreateCampaignResponse : AWSModel


/**
 Campaign definition
 */
@property (nonatomic, strong) AWSPinpointTargetingCampaignResponse * _Nullable campaignResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingCreateImportJobRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 
 */
@property (nonatomic, strong) AWSPinpointTargetingImportJobRequest * _Nullable importJobRequest;

@end

/**
 
 */
@interface AWSPinpointTargetingCreateImportJobResponse : AWSModel


/**
 
 */
@property (nonatomic, strong) AWSPinpointTargetingImportJobResponse * _Nullable importJobResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingCreateSegmentRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 Segment definition.
 */
@property (nonatomic, strong) AWSPinpointTargetingWriteSegmentRequest * _Nullable writeSegmentRequest;

@end

/**
 
 */
@interface AWSPinpointTargetingCreateSegmentResponse : AWSModel


/**
 Segment definition.
 */
@property (nonatomic, strong) AWSPinpointTargetingSegmentResponse * _Nullable segmentResponse;

@end

/**
 Default Message across push notification, email, and sms.
 */
@interface AWSPinpointTargetingDefaultMessage : AWSModel


/**
 The message body of the notification, the email body or the text message.
 */
@property (nonatomic, strong) NSString * _Nullable body;

/**
 Default message substitutions. Can be overridden by individual address substitutions.
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSArray<NSString *> *> * _Nullable substitutions;

@end

/**
 Default Push Notification Message.
 */
@interface AWSPinpointTargetingDefaultPushNotificationMessage : AWSModel


/**
 The action that occurs if the user taps a push notification delivered by the campaign: OPEN_APP - Your app launches, or it becomes the foreground app if it has been sent to the background. This is the default action. DEEP_LINK - Uses deep linking features in iOS and Android to open your app and display a designated user interface within the app. URL - The default mobile browser on the user's device launches and opens a web page at the URL you specify. Possible values include: OPEN_APP | DEEP_LINK | URL
 */
@property (nonatomic, assign) AWSPinpointTargetingAction action;

/**
 The message body of the notification, the email body or the text message.
 */
@property (nonatomic, strong) NSString * _Nullable body;

/**
 The data payload used for a silent push. This payload is added to the notifications' data.pinpoint.jsonBody' object
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable data;

/**
 Indicates if the message should display on the users device. Silent pushes can be used for Remote Configuration and Phone Home use cases.
 */
@property (nonatomic, strong) NSNumber * _Nullable silentPush;

/**
 Default message substitutions. Can be overridden by individual address substitutions.
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSArray<NSString *> *> * _Nullable substitutions;

/**
 The message title that displays above the message on the user's device.
 */
@property (nonatomic, strong) NSString * _Nullable title;

/**
 The URL to open in the user's mobile browser. Used if the value for Action is URL.
 */
@property (nonatomic, strong) NSString * _Nullable url;

@end

/**
 
 */
@interface AWSPinpointTargetingDeleteApnsChannelRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

@end

/**
 
 */
@interface AWSPinpointTargetingDeleteApnsChannelResponse : AWSModel


/**
 Apple Distribution Push Notification Service channel definition.
 */
@property (nonatomic, strong) AWSPinpointTargetingAPNSChannelResponse * _Nullable APNSChannelResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingDeleteApnsSandboxChannelRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

@end

/**
 
 */
@interface AWSPinpointTargetingDeleteApnsSandboxChannelResponse : AWSModel


/**
 Apple Development Push Notification Service channel definition.
 */
@property (nonatomic, strong) AWSPinpointTargetingAPNSSandboxChannelResponse * _Nullable APNSSandboxChannelResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingDeleteCampaignRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable campaignId;

@end

/**
 
 */
@interface AWSPinpointTargetingDeleteCampaignResponse : AWSModel


/**
 Campaign definition
 */
@property (nonatomic, strong) AWSPinpointTargetingCampaignResponse * _Nullable campaignResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingDeleteEmailChannelRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

@end

/**
 
 */
@interface AWSPinpointTargetingDeleteEmailChannelResponse : AWSModel


/**
 Email Channel Response.
 */
@property (nonatomic, strong) AWSPinpointTargetingEmailChannelResponse * _Nullable emailChannelResponse;

@end

/**
 DeleteEventStream Request
 Required parameters: [ApplicationId]
 */
@interface AWSPinpointTargetingDeleteEventStreamRequest : AWSRequest


/**
 ApplicationId
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

@end

/**
 DeleteEventStream Response
 Required parameters: [EventStream]
 */
@interface AWSPinpointTargetingDeleteEventStreamResponse : AWSModel


/**
 Model for an event publishing subscription export.
 */
@property (nonatomic, strong) AWSPinpointTargetingEventStream * _Nullable eventStream;

@end

/**
 
 */
@interface AWSPinpointTargetingDeleteGcmChannelRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

@end

/**
 
 */
@interface AWSPinpointTargetingDeleteGcmChannelResponse : AWSModel


/**
 Google Cloud Messaging channel definition
 */
@property (nonatomic, strong) AWSPinpointTargetingGCMChannelResponse * _Nullable GCMChannelResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingDeleteSegmentRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable segmentId;

@end

/**
 
 */
@interface AWSPinpointTargetingDeleteSegmentResponse : AWSModel


/**
 Segment definition.
 */
@property (nonatomic, strong) AWSPinpointTargetingSegmentResponse * _Nullable segmentResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingDeleteSmsChannelRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

@end

/**
 
 */
@interface AWSPinpointTargetingDeleteSmsChannelResponse : AWSModel


/**
 SMS Channel Response.
 */
@property (nonatomic, strong) AWSPinpointTargetingSMSChannelResponse * _Nullable SMSChannelResponse;

@end

/**
 The message configuration.
 */
@interface AWSPinpointTargetingDirectMessageConfiguration : AWSModel


/**
 The message to APNS channels. Overrides the default push notification message.
 */
@property (nonatomic, strong) AWSPinpointTargetingAPNSMessage * _Nullable APNSMessage;

/**
 The default message for all channels.
 */
@property (nonatomic, strong) AWSPinpointTargetingDefaultMessage * _Nullable defaultMessage;

/**
 The default push notification message for all push channels.
 */
@property (nonatomic, strong) AWSPinpointTargetingDefaultPushNotificationMessage * _Nullable defaultPushNotificationMessage;

/**
 The message to GCM channels. Overrides the default push notification message.
 */
@property (nonatomic, strong) AWSPinpointTargetingGCMMessage * _Nullable GCMMessage;

/**
 The message to SMS channels. Overrides the default message.
 */
@property (nonatomic, strong) AWSPinpointTargetingSMSMessage * _Nullable SMSMessage;

@end

/**
 Email Channel Request
 */
@interface AWSPinpointTargetingEmailChannelRequest : AWSModel


/**
 If the channel is enabled for sending messages.
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

/**
 The email address used to send emails from.
 */
@property (nonatomic, strong) NSString * _Nullable fromAddress;

/**
 The ARN of an identity verified with SES.
 */
@property (nonatomic, strong) NSString * _Nullable identity;

/**
 The ARN of an IAM Role used to submit events to Mobile Analytics' event ingestion service
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

@end

/**
 Email Channel Response.
 */
@interface AWSPinpointTargetingEmailChannelResponse : AWSModel


/**
 Application id
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 The date that the settings were last updated in ISO 8601 format.
 */
@property (nonatomic, strong) NSString * _Nullable creationDate;

/**
 If the channel is enabled for sending messages.
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

/**
 The email address used to send emails from.
 */
@property (nonatomic, strong) NSString * _Nullable fromAddress;

/**
 Channel ID. Not used, only for backwards compatibility.
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 The ARN of an identity verified with SES.
 */
@property (nonatomic, strong) NSString * _Nullable identity;

/**
 Is this channel archived
 */
@property (nonatomic, strong) NSNumber * _Nullable isArchived;

/**
 Who last updated this entry
 */
@property (nonatomic, strong) NSString * _Nullable lastModifiedBy;

/**
 Last date this was updated
 */
@property (nonatomic, strong) NSString * _Nullable lastModifiedDate;

/**
 Platform type. Will be "EMAIL"
 */
@property (nonatomic, strong) NSString * _Nullable platform;

/**
 The ARN of an IAM Role used to submit events to Mobile Analytics' event ingestion service
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 Version of channel
 */
@property (nonatomic, strong) NSNumber * _Nullable version;

@end

/**
 Endpoint update request
 */
@interface AWSPinpointTargetingEndpointBatchItem : AWSModel


/**
 The address or token of the endpoint as provided by your push provider (e.g. DeviceToken or RegistrationId).
 */
@property (nonatomic, strong) NSString * _Nullable address;

/**
 Custom attributes that your app reports to Amazon Pinpoint. You can use these attributes as selection criteria when you create a segment.
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSArray<NSString *> *> * _Nullable attributes;

/**
 The channel type.Valid values: APNS, GCM
 */
@property (nonatomic, assign) AWSPinpointTargetingChannelType channelType;

/**
 The endpoint demographic attributes.
 */
@property (nonatomic, strong) AWSPinpointTargetingEndpointDemographic * _Nullable demographic;

/**
 The last time the endpoint was updated. Provided in ISO 8601 format.
 */
@property (nonatomic, strong) NSString * _Nullable effectiveDate;

/**
 The endpoint status. Can be either ACTIVE or INACTIVE. Will be set to INACTIVE if a delivery fails. Will be set to ACTIVE if the address is updated.
 */
@property (nonatomic, strong) NSString * _Nullable endpointStatus;

/**
 The unique Id for the Endpoint in the batch.
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 The endpoint location attributes.
 */
@property (nonatomic, strong) AWSPinpointTargetingEndpointLocation * _Nullable location;

/**
 Custom metrics that your app reports to Amazon Pinpoint.
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSNumber *> * _Nullable metrics;

/**
 Indicates whether a user has opted out of receiving messages with one of the following values:ALL â€“ User receives all messages. NONE â€“ User receives no messages.
 */
@property (nonatomic, strong) NSString * _Nullable optOut;

/**
 The unique ID for the most recent request to update the endpoint.
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

/**
 Custom user-specific attributes that your app reports to Amazon Pinpoint.
 */
@property (nonatomic, strong) AWSPinpointTargetingEndpointUser * _Nullable user;

@end

/**
 Endpoint batch update request.
 */
@interface AWSPinpointTargetingEndpointBatchRequest : AWSModel


/**
 List of items to update. Maximum 100 items
 */
@property (nonatomic, strong) NSArray<AWSPinpointTargetingEndpointBatchItem *> * _Nullable item;

@end

/**
 Endpoint demographic data
 */
@interface AWSPinpointTargetingEndpointDemographic : AWSModel


/**
 The version of the application associated with the endpoint.
 */
@property (nonatomic, strong) NSString * _Nullable appVersion;

/**
 The endpoint locale in the following format: The ISO 639-1 alpha-2 code, followed by an underscore, followed by an ISO 3166-1 alpha-2 value. 
 */
@property (nonatomic, strong) NSString * _Nullable locale;

/**
 The endpoint make, such as such as Apple or Samsung.
 */
@property (nonatomic, strong) NSString * _Nullable make;

/**
 The endpoint model, such as iPhone.
 */
@property (nonatomic, strong) NSString * _Nullable model;

/**
 The endpoint model version.
 */
@property (nonatomic, strong) NSString * _Nullable modelVersion;

/**
 The endpoint platform, such as ios or android.
 */
@property (nonatomic, strong) NSString * _Nullable platform;

/**
 The endpoint platform version.
 */
@property (nonatomic, strong) NSString * _Nullable platformVersion;

/**
 The timezone of the endpoint. Specified as a tz database value, such as Americas/Los_Angeles.
 */
@property (nonatomic, strong) NSString * _Nullable timezone;

@end

/**
 Endpoint location data
 */
@interface AWSPinpointTargetingEndpointLocation : AWSModel


/**
 The city where the endpoint is located.
 */
@property (nonatomic, strong) NSString * _Nullable city;

/**
 Country according to ISO 3166-1 Alpha-2 codes. For example, US.
 */
@property (nonatomic, strong) NSString * _Nullable country;

/**
 The latitude of the endpoint location. Rounded to one decimal (Roughly corresponding to a mile).
 */
@property (nonatomic, strong) NSNumber * _Nullable latitude;

/**
 The longitude of the endpoint location. Rounded to one decimal (Roughly corresponding to a mile).
 */
@property (nonatomic, strong) NSNumber * _Nullable longitude;

/**
 The postal code or zip code of the endpoint.
 */
@property (nonatomic, strong) NSString * _Nullable postalCode;

/**
 The region of the endpoint location. For example, corresponds to a state in US.
 */
@property (nonatomic, strong) NSString * _Nullable region;

@end

/**
 Endpoint update request
 */
@interface AWSPinpointTargetingEndpointRequest : AWSModel


/**
 The address or token of the endpoint as provided by your push provider (e.g. DeviceToken or RegistrationId).
 */
@property (nonatomic, strong) NSString * _Nullable address;

/**
 Custom attributes that your app reports to Amazon Pinpoint. You can use these attributes as selection criteria when you create a segment.
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSArray<NSString *> *> * _Nullable attributes;

/**
 The channel type.Valid values: APNS, GCM
 */
@property (nonatomic, assign) AWSPinpointTargetingChannelType channelType;

/**
 The endpoint demographic attributes.
 */
@property (nonatomic, strong) AWSPinpointTargetingEndpointDemographic * _Nullable demographic;

/**
 The last time the endpoint was updated. Provided in ISO 8601 format.
 */
@property (nonatomic, strong) NSString * _Nullable effectiveDate;

/**
 The endpoint status. Can be either ACTIVE or INACTIVE. Will be set to INACTIVE if a delivery fails. Will be set to ACTIVE if the address is updated.
 */
@property (nonatomic, strong) NSString * _Nullable endpointStatus;

/**
 The endpoint location attributes.
 */
@property (nonatomic, strong) AWSPinpointTargetingEndpointLocation * _Nullable location;

/**
 Custom metrics that your app reports to Amazon Pinpoint.
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSNumber *> * _Nullable metrics;

/**
 Indicates whether a user has opted out of receiving messages with one of the following values:ALL â€“ User receives all messages. NONE â€“ User receives no messages.
 */
@property (nonatomic, strong) NSString * _Nullable optOut;

/**
 The unique ID for the most recent request to update the endpoint.
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

/**
 Custom user-specific attributes that your app reports to Amazon Pinpoint.
 */
@property (nonatomic, strong) AWSPinpointTargetingEndpointUser * _Nullable user;

@end

/**
 Endpoint response
 */
@interface AWSPinpointTargetingEndpointResponse : AWSModel


/**
 The address or token of the endpoint as provided by your push provider (e.g. DeviceToken or RegistrationId).
 */
@property (nonatomic, strong) NSString * _Nullable address;

/**
 The ID of the application associated with the endpoint.
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 Custom attributes that your app reports to Amazon Pinpoint. You can use these attributes as selection criteria when you create a segment.
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSArray<NSString *> *> * _Nullable attributes;

/**
 The channel type.Valid values: APNS, GCM
 */
@property (nonatomic, assign) AWSPinpointTargetingChannelType channelType;

/**
 A number from 0 - 99 that represents the cohort the endpoint is assigned to. Endpoints are grouped into cohorts randomly, and each cohort contains approximately 1 percent of the endpoints for an app. Amazon Pinpoint assigns cohorts to the holdout or treatment allocations for a campaign.
 */
@property (nonatomic, strong) NSString * _Nullable cohortId;

/**
 The last time the endpoint was created. Provided in ISO 8601 format.
 */
@property (nonatomic, strong) NSString * _Nullable creationDate;

/**
 The endpoint demographic attributes.
 */
@property (nonatomic, strong) AWSPinpointTargetingEndpointDemographic * _Nullable demographic;

/**
 The last time the endpoint was updated. Provided in ISO 8601 format.
 */
@property (nonatomic, strong) NSString * _Nullable effectiveDate;

/**
 The endpoint status. Can be either ACTIVE or INACTIVE. Will be set to INACTIVE if a delivery fails. Will be set to ACTIVE if the address is updated.
 */
@property (nonatomic, strong) NSString * _Nullable endpointStatus;

/**
 The unique ID that you assigned to the endpoint. The ID should be a globally unique identifier (GUID) to ensure that it is unique compared to all other endpoints for the application.
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 The endpoint location attributes.
 */
@property (nonatomic, strong) AWSPinpointTargetingEndpointLocation * _Nullable location;

/**
 Custom metrics that your app reports to Amazon Pinpoint.
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSNumber *> * _Nullable metrics;

/**
 Indicates whether a user has opted out of receiving messages with one of the following values:ALL â€“ User receives all messages. NONE â€“ User receives no messages.
 */
@property (nonatomic, strong) NSString * _Nullable optOut;

/**
 The unique ID for the most recent request to update the endpoint.
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

/**
 The ShardId of endpoint
 */
@property (nonatomic, strong) NSString * _Nullable shardId;

/**
 Custom user-specific attributes that your app reports to Amazon Pinpoint.
 */
@property (nonatomic, strong) AWSPinpointTargetingEndpointUser * _Nullable user;

@end

/**
 Endpoint user specific custom userAttributes
 */
@interface AWSPinpointTargetingEndpointUser : AWSModel


/**
 Custom attributes specific to the user.
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSArray<NSString *> *> * _Nullable userAttributes;

/**
 The unique ID of the user.
 */
@property (nonatomic, strong) NSString * _Nullable userId;

@end

/**
 Model for an event publishing subscription export.
 */
@interface AWSPinpointTargetingEventStream : AWSModel


/**
 The ID of the application from which events should be published.
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 The Amazon Resource Name (ARN) of the Amazon Kinesis stream or Firehose delivery stream to which you want to publish events.Firehose ARN: arn:aws:firehose:REGION:ACCOUNT_ID:deliverystream/STREAM_NAMEKinesis ARN: arn:aws:kinesis:REGION:ACCOUNT_ID:stream/STREAM_NAME
 */
@property (nonatomic, strong) NSString * _Nullable destinationStreamArn;

/**
 The external ID assigned the IAM role that authorizes Amazon Pinpoint to publish to the stream.
 */
@property (nonatomic, strong) NSString * _Nullable externalId;

/**
 The date the event stream was last updated in ISO 8601 format.
 */
@property (nonatomic, strong) NSString * _Nullable lastModifiedDate;

/**
 The IAM user who last modified the event stream.
 */
@property (nonatomic, strong) NSString * _Nullable lastUpdatedBy;

/**
 The IAM role that authorizes Amazon Pinpoint to publish events to the stream in your account.
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

@end

/**
 Google Cloud Messaging credentials
 */
@interface AWSPinpointTargetingGCMChannelRequest : AWSModel


/**
 Platform credential API key from Google.
 */
@property (nonatomic, strong) NSString * _Nullable apiKey;

/**
 If the channel is enabled for sending messages.
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

@end

/**
 Google Cloud Messaging channel definition
 */
@interface AWSPinpointTargetingGCMChannelResponse : AWSModel


/**
 The ID of the application to which the channel applies.
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 When was this segment created
 */
@property (nonatomic, strong) NSString * _Nullable creationDate;

/**
 The GCM API key from Google.
 */
@property (nonatomic, strong) NSString * _Nullable credential;

/**
 If the channel is enabled for sending messages.
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

/**
 Channel ID. Not used, only for backwards compatibility.
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 Is this channel archived
 */
@property (nonatomic, strong) NSNumber * _Nullable isArchived;

/**
 Who last updated this entry
 */
@property (nonatomic, strong) NSString * _Nullable lastModifiedBy;

/**
 Last date this was updated
 */
@property (nonatomic, strong) NSString * _Nullable lastModifiedDate;

/**
 The platform type. Will be GCM
 */
@property (nonatomic, strong) NSString * _Nullable platform;

/**
 Version of channel
 */
@property (nonatomic, strong) NSNumber * _Nullable version;

@end

/**
 GCM Message.
 */
@interface AWSPinpointTargetingGCMMessage : AWSModel


/**
 The action that occurs if the user taps a push notification delivered by the campaign: OPEN_APP - Your app launches, or it becomes the foreground app if it has been sent to the background. This is the default action. DEEP_LINK - Uses deep linking features in iOS and Android to open your app and display a designated user interface within the app. URL - The default mobile browser on the user's device launches and opens a web page at the URL you specify. Possible values include: OPEN_APP | DEEP_LINK | URL
 */
@property (nonatomic, assign) AWSPinpointTargetingAction action;

/**
 The message body of the notification, the email body or the text message.
 */
@property (nonatomic, strong) NSString * _Nullable body;

/**
 This parameter identifies a group of messages (e.g., with collapse_key: "Updates Available") that can be collapsed, so that only the last message gets sent when delivery can be resumed. This is intended to avoid sending too many of the same messages when the device comes back online or becomes active.
 */
@property (nonatomic, strong) NSString * _Nullable collapseKey;

/**
 The data payload used for a silent push. This payload is added to the notifications' data.pinpoint.jsonBody' object
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable data;

/**
 The icon image name of the asset saved in your application.
 */
@property (nonatomic, strong) NSString * _Nullable iconReference;

/**
 The URL that points to an image used as the large icon to the notification content view.
 */
@property (nonatomic, strong) NSString * _Nullable imageIconUrl;

/**
 The URL that points to an image used in the push notification.
 */
@property (nonatomic, strong) NSString * _Nullable imageUrl;

/**
 The Raw JSON formatted string to be used as the payload. This value overrides the message.
 */
@property (nonatomic, strong) NSString * _Nullable rawContent;

/**
 This parameter specifies the package name of the application where the registration tokens must match in order to receive the message.
 */
@property (nonatomic, strong) NSString * _Nullable restrictedPackageName;

/**
 Indicates if the message should display on the users device. Silent pushes can be used for Remote Configuration and Phone Home use cases.
 */
@property (nonatomic, strong) NSNumber * _Nullable silentPush;

/**
 The URL that points to an image used as the small icon for the notification which will be used to represent the notification in the status bar and content view
 */
@property (nonatomic, strong) NSString * _Nullable smallImageIconUrl;

/**
 Indicates a sound to play when the device receives the notification. Supports default, or the filename of a sound resource bundled in the app. Android sound files must reside in /res/raw/
 */
@property (nonatomic, strong) NSString * _Nullable sound;

/**
 Default message substitutions. Can be overridden by individual address substitutions.
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSArray<NSString *> *> * _Nullable substitutions;

/**
 The message title that displays above the message on the user's device.
 */
@property (nonatomic, strong) NSString * _Nullable title;

/**
 The URL to open in the user's mobile browser. Used if the value for Action is URL.
 */
@property (nonatomic, strong) NSString * _Nullable url;

@end

/**
 
 */
@interface AWSPinpointTargetingGetApnsChannelRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

@end

/**
 
 */
@interface AWSPinpointTargetingGetApnsChannelResponse : AWSModel


/**
 Apple Distribution Push Notification Service channel definition.
 */
@property (nonatomic, strong) AWSPinpointTargetingAPNSChannelResponse * _Nullable APNSChannelResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingGetApnsSandboxChannelRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

@end

/**
 
 */
@interface AWSPinpointTargetingGetApnsSandboxChannelResponse : AWSModel


/**
 Apple Development Push Notification Service channel definition.
 */
@property (nonatomic, strong) AWSPinpointTargetingAPNSSandboxChannelResponse * _Nullable APNSSandboxChannelResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingGetApplicationSettingsRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

@end

/**
 
 */
@interface AWSPinpointTargetingGetApplicationSettingsResponse : AWSModel


/**
 Application settings.
 */
@property (nonatomic, strong) AWSPinpointTargetingApplicationSettingsResource * _Nullable applicationSettingsResource;

@end

/**
 
 */
@interface AWSPinpointTargetingGetCampaignActivitiesRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable campaignId;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable pageSize;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable token;

@end

/**
 
 */
@interface AWSPinpointTargetingGetCampaignActivitiesResponse : AWSModel


/**
 Activities for campaign.
 */
@property (nonatomic, strong) AWSPinpointTargetingActivitiesResponse * _Nullable activitiesResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingGetCampaignRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable campaignId;

@end

/**
 
 */
@interface AWSPinpointTargetingGetCampaignResponse : AWSModel


/**
 Campaign definition
 */
@property (nonatomic, strong) AWSPinpointTargetingCampaignResponse * _Nullable campaignResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingGetCampaignVersionRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable campaignId;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable version;

@end

/**
 
 */
@interface AWSPinpointTargetingGetCampaignVersionResponse : AWSModel


/**
 Campaign definition
 */
@property (nonatomic, strong) AWSPinpointTargetingCampaignResponse * _Nullable campaignResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingGetCampaignVersionsRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable campaignId;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable pageSize;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable token;

@end

/**
 
 */
@interface AWSPinpointTargetingGetCampaignVersionsResponse : AWSModel


/**
 List of available campaigns.
 */
@property (nonatomic, strong) AWSPinpointTargetingCampaignsResponse * _Nullable campaignsResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingGetCampaignsRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable pageSize;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable token;

@end

/**
 
 */
@interface AWSPinpointTargetingGetCampaignsResponse : AWSModel


/**
 List of available campaigns.
 */
@property (nonatomic, strong) AWSPinpointTargetingCampaignsResponse * _Nullable campaignsResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingGetEmailChannelRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

@end

/**
 
 */
@interface AWSPinpointTargetingGetEmailChannelResponse : AWSModel


/**
 Email Channel Response.
 */
@property (nonatomic, strong) AWSPinpointTargetingEmailChannelResponse * _Nullable emailChannelResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingGetEndpointRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable endpointId;

@end

/**
 
 */
@interface AWSPinpointTargetingGetEndpointResponse : AWSModel


/**
 Endpoint response
 */
@property (nonatomic, strong) AWSPinpointTargetingEndpointResponse * _Nullable endpointResponse;

@end

/**
 GetEventStream Request
 Required parameters: [ApplicationId]
 */
@interface AWSPinpointTargetingGetEventStreamRequest : AWSRequest


/**
 ApplicationId
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

@end

/**
 GetEventStream Response
 Required parameters: [EventStream]
 */
@interface AWSPinpointTargetingGetEventStreamResponse : AWSModel


/**
 Model for an event publishing subscription export.
 */
@property (nonatomic, strong) AWSPinpointTargetingEventStream * _Nullable eventStream;

@end

/**
 
 */
@interface AWSPinpointTargetingGetGcmChannelRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

@end

/**
 
 */
@interface AWSPinpointTargetingGetGcmChannelResponse : AWSModel


/**
 Google Cloud Messaging channel definition
 */
@property (nonatomic, strong) AWSPinpointTargetingGCMChannelResponse * _Nullable GCMChannelResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingGetImportJobRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

@end

/**
 
 */
@interface AWSPinpointTargetingGetImportJobResponse : AWSModel


/**
 
 */
@property (nonatomic, strong) AWSPinpointTargetingImportJobResponse * _Nullable importJobResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingGetImportJobsRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable pageSize;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable token;

@end

/**
 
 */
@interface AWSPinpointTargetingGetImportJobsResponse : AWSModel


/**
 Import job list.
 */
@property (nonatomic, strong) AWSPinpointTargetingImportJobsResponse * _Nullable importJobsResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingGetSegmentImportJobsRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable pageSize;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable segmentId;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable token;

@end

/**
 
 */
@interface AWSPinpointTargetingGetSegmentImportJobsResponse : AWSModel


/**
 Import job list.
 */
@property (nonatomic, strong) AWSPinpointTargetingImportJobsResponse * _Nullable importJobsResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingGetSegmentRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable segmentId;

@end

/**
 
 */
@interface AWSPinpointTargetingGetSegmentResponse : AWSModel


/**
 Segment definition.
 */
@property (nonatomic, strong) AWSPinpointTargetingSegmentResponse * _Nullable segmentResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingGetSegmentVersionRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable segmentId;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable version;

@end

/**
 
 */
@interface AWSPinpointTargetingGetSegmentVersionResponse : AWSModel


/**
 Segment definition.
 */
@property (nonatomic, strong) AWSPinpointTargetingSegmentResponse * _Nullable segmentResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingGetSegmentVersionsRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable pageSize;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable segmentId;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable token;

@end

/**
 
 */
@interface AWSPinpointTargetingGetSegmentVersionsResponse : AWSModel


/**
 Segments in your account.
 */
@property (nonatomic, strong) AWSPinpointTargetingSegmentsResponse * _Nullable segmentsResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingGetSegmentsRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable pageSize;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable token;

@end

/**
 
 */
@interface AWSPinpointTargetingGetSegmentsResponse : AWSModel


/**
 Segments in your account.
 */
@property (nonatomic, strong) AWSPinpointTargetingSegmentsResponse * _Nullable segmentsResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingGetSmsChannelRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

@end

/**
 
 */
@interface AWSPinpointTargetingGetSmsChannelResponse : AWSModel


/**
 SMS Channel Response.
 */
@property (nonatomic, strong) AWSPinpointTargetingSMSChannelResponse * _Nullable SMSChannelResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingImportJobRequest : AWSModel


/**
 Sets whether the endpoints create a segment when they are imported.
 */
@property (nonatomic, strong) NSNumber * _Nullable defineSegment;

/**
 A unique, custom ID assigned to the IAM role that restricts who can assume the role.	
 */
@property (nonatomic, strong) NSString * _Nullable externalId;

/**
 The format of the files that contain the endpoint definitions. Valid values: CSV, JSON
 */
@property (nonatomic, assign) AWSPinpointTargetingFormat format;

/**
 Sets whether the endpoints are registered with Amazon Pinpoint when they are imported.
 */
@property (nonatomic, strong) NSNumber * _Nullable registerEndpoints;

/**
 The Amazon Resource Name (ARN) of an IAM role that grants Amazon Pinpoint access to the Amazon S3 location that contains the endpoints to import.
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 A URL that points to the location within an Amazon S3 bucket that contains the endpoints to import. The location can be a folder or a single file. The URL should follow this format: s3://bucket-name/folder-name/file-nameAmazon Pinpoint will import endpoints from this location and any subfolders it contains.
 */
@property (nonatomic, strong) NSString * _Nullable s3Url;

/**
 The ID of the segment to update if the import job is meant to update an existing segment.
 */
@property (nonatomic, strong) NSString * _Nullable segmentId;

/**
 A custom name for the segment created by the import job. Use if DefineSegment is true.
 */
@property (nonatomic, strong) NSString * _Nullable segmentName;

@end

/**
 
 */
@interface AWSPinpointTargetingImportJobResource : AWSModel


/**
 Sets whether the endpoints create a segment when they are imported.
 */
@property (nonatomic, strong) NSNumber * _Nullable defineSegment;

/**
 A unique, custom ID assigned to the IAM role that restricts who can assume the role.	
 */
@property (nonatomic, strong) NSString * _Nullable externalId;

/**
 The format of the files that contain the endpoint definitions. Valid values: CSV, JSON
 */
@property (nonatomic, assign) AWSPinpointTargetingFormat format;

/**
 Sets whether the endpoints are registered with Amazon Pinpoint when they are imported.
 */
@property (nonatomic, strong) NSNumber * _Nullable registerEndpoints;

/**
 The Amazon Resource Name (ARN) of an IAM role that grants Amazon Pinpoint access to the Amazon S3 location that contains the endpoints to import.
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 A URL that points to the location within an Amazon S3 bucket that contains the endpoints to import. The location can be a folder or a single file. The URL should follow this format: s3://bucket-name/folder-name/file-nameAmazon Pinpoint will import endpoints from this location and any subfolders it contains.
 */
@property (nonatomic, strong) NSString * _Nullable s3Url;

/**
 The ID of the segment to update if the import job is meant to update an existing segment.
 */
@property (nonatomic, strong) NSString * _Nullable segmentId;

/**
 A custom name for the segment created by the import job. Use if DefineSegment is true.
 */
@property (nonatomic, strong) NSString * _Nullable segmentName;

@end

/**
 
 */
@interface AWSPinpointTargetingImportJobResponse : AWSModel


/**
 The unique ID of the application to which the import job applies.
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 The number of pieces that have successfully imported as of the time of the request.
 */
@property (nonatomic, strong) NSNumber * _Nullable completedPieces;

/**
 The date the import job completed in ISO 8601 format.
 */
@property (nonatomic, strong) NSString * _Nullable completionDate;

/**
 The date the import job was created in ISO 8601 format.
 */
@property (nonatomic, strong) NSString * _Nullable creationDate;

/**
 The import job settings.
 */
@property (nonatomic, strong) AWSPinpointTargetingImportJobResource * _Nullable definition;

/**
 The number of pieces that have failed to import as of the time of the request.
 */
@property (nonatomic, strong) NSNumber * _Nullable failedPieces;

/**
 Provides up to 100 of the first failed entries for the job, if any exist.
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable failures;

/**
 The unique ID of the import job.
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 The status of the import job. Valid values: CREATED, INITIALIZING, PROCESSING, COMPLETING, COMPLETED, FAILING, FAILEDThe job status is FAILED if one or more pieces failed to import.
 */
@property (nonatomic, assign) AWSPinpointTargetingJobStatus jobStatus;

/**
 The number of endpoints that failed to import; for example, because of syntax errors.
 */
@property (nonatomic, strong) NSNumber * _Nullable totalFailures;

/**
 The total number of pieces that must be imported to finish the job. Each piece is an approximately equal portion of the endpoints to import.
 */
@property (nonatomic, strong) NSNumber * _Nullable totalPieces;

/**
 The number of endpoints that were processed by the import job.
 */
@property (nonatomic, strong) NSNumber * _Nullable totalProcessed;

/**
 The job type. Will be Import.
 */
@property (nonatomic, strong) NSString * _Nullable types;

@end

/**
 Import job list.
 */
@interface AWSPinpointTargetingImportJobsResponse : AWSModel


/**
 A list of import jobs for the application.
 */
@property (nonatomic, strong) NSArray<AWSPinpointTargetingImportJobResponse *> * _Nullable item;

/**
 The string that you use in a subsequent request to get the next page of results in a paginated response.
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSPinpointTargetingMessage : AWSModel


/**
 The action that occurs if the user taps a push notification delivered by the campaign: OPEN_APP - Your app launches, or it becomes the foreground app if it has been sent to the background. This is the default action.DEEP_LINK - Uses deep linking features in iOS and Android to open your app and display a designated user interface within the app.URL - The default mobile browser on the user's device launches and opens a web page at the URL you specify.
 */
@property (nonatomic, assign) AWSPinpointTargetingAction action;

/**
 The message body. Can include up to 140 characters.
 */
@property (nonatomic, strong) NSString * _Nullable body;

/**
 The URL that points to the icon image for the push notification icon, for example, the app icon.
 */
@property (nonatomic, strong) NSString * _Nullable imageIconUrl;

/**
 The URL that points to the small icon image for the push notification icon, for example, the app icon.
 */
@property (nonatomic, strong) NSString * _Nullable imageSmallIconUrl;

/**
 The URL that points to an image used in the push notification.
 */
@property (nonatomic, strong) NSString * _Nullable imageUrl;

/**
 The JSON payload used for a silent push.
 */
@property (nonatomic, strong) NSString * _Nullable jsonBody;

/**
 The URL that points to the media resource, for example a .mp4 or .gif file.
 */
@property (nonatomic, strong) NSString * _Nullable mediaUrl;

/**
 Indicates if the message should display on the users device.Silent pushes can be used for Remote Configuration and Phone Home use cases. 
 */
@property (nonatomic, strong) NSNumber * _Nullable silentPush;

/**
 The message title that displays above the message on the user's device.
 */
@property (nonatomic, strong) NSString * _Nullable title;

/**
 The URL to open in the user's mobile browser. Used if the value for Action is URL.
 */
@property (nonatomic, strong) NSString * _Nullable url;

@end

/**
 Simple message object.
 */
@interface AWSPinpointTargetingMessageBody : AWSModel


/**
 The error message returned from the API.
 */
@property (nonatomic, strong) NSString * _Nullable message;

/**
 The unique message body ID.
 */
@property (nonatomic, strong) NSString * _Nullable requestID;

@end

/**
 Message configuration for a campaign.
 */
@interface AWSPinpointTargetingMessageConfiguration : AWSModel


/**
 The message that the campaign delivers to APNS channels. Overrides the default message.
 */
@property (nonatomic, strong) AWSPinpointTargetingMessage * _Nullable APNSMessage;

/**
 The default message for all channels.
 */
@property (nonatomic, strong) AWSPinpointTargetingMessage * _Nullable defaultMessage;

/**
 The email message configuration.
 */
@property (nonatomic, strong) AWSPinpointTargetingCampaignEmailMessage * _Nullable emailMessage;

/**
 The message that the campaign delivers to GCM channels. Overrides the default message.
 */
@property (nonatomic, strong) AWSPinpointTargetingMessage * _Nullable GCMMessage;

/**
 The SMS message configuration.
 */
@property (nonatomic, strong) AWSPinpointTargetingCampaignSmsMessage * _Nullable SMSMessage;

@end

/**
 Send message request.
 */
@interface AWSPinpointTargetingMessageRequest : AWSModel


/**
 A map of destination addresses, with the address as the key(Email address, phone number or push token) and the Address Configuration as the value.
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSPinpointTargetingAddressConfiguration *> * _Nullable addresses;

/**
 A map of custom attributes to attributes to be attached to the message. This payload is added to the push notification's 'data.pinpoint' object or added to the email/sms delivery receipt event attributes.
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable context;

/**
 Message configuration.
 */
@property (nonatomic, strong) AWSPinpointTargetingDirectMessageConfiguration * _Nullable messageConfiguration;

@end

/**
 Send message response.
 */
@interface AWSPinpointTargetingMessageResponse : AWSModel


/**
 Application id of the message.
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 Original request Id for which this message was delivered.
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

/**
 A map containing a multi part response for each address, with the address as the key(Email address, phone number or push token) and the result as the value.
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSPinpointTargetingMessageResult *> * _Nullable result;

@end

/**
 The result from sending a message to an address.
 */
@interface AWSPinpointTargetingMessageResult : AWSModel


/**
 Delivery status of message.
 */
@property (nonatomic, assign) AWSPinpointTargetingDeliveryStatus deliveryStatus;

/**
 Downstream service status code.
 */
@property (nonatomic, strong) NSNumber * _Nullable statusCode;

/**
 Status message for message delivery.
 */
@property (nonatomic, strong) NSString * _Nullable statusMessage;

/**
 If token was updated as part of delivery. (This is GCM Specific)
 */
@property (nonatomic, strong) NSString * _Nullable updatedToken;

@end

/**
 PutEventStream Request
 Required parameters: [ApplicationId, WriteEventStream]
 */
@interface AWSPinpointTargetingPutEventStreamRequest : AWSRequest


/**
 ApplicationId
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 EventStream to write.
 */
@property (nonatomic, strong) AWSPinpointTargetingWriteEventStream * _Nullable writeEventStream;

@end

/**
 PutEventStream Response
 Required parameters: [EventStream]
 */
@interface AWSPinpointTargetingPutEventStreamResponse : AWSModel


/**
 Model for an event publishing subscription export.
 */
@property (nonatomic, strong) AWSPinpointTargetingEventStream * _Nullable eventStream;

@end

/**
 Quiet Time
 */
@interface AWSPinpointTargetingQuietTime : AWSModel


/**
 The default end time for quiet time in ISO 8601 format.
 */
@property (nonatomic, strong) NSString * _Nullable end;

/**
 The default start time for quiet time in ISO 8601 format.
 */
@property (nonatomic, strong) NSString * _Nullable start;

@end

/**
 Define how a segment based on recency of use.
 */
@interface AWSPinpointTargetingRecencyDimension : AWSModel


/**
 The length of time during which users have been active or inactive with your app. Valid values: HR_24, DAY_7, DAY_14, DAY_30
 */
@property (nonatomic, assign) AWSPinpointTargetingDuration duration;

/**
 The recency dimension type: ACTIVE - Users who have used your app within the specified duration are included in the segment. INACTIVE - Users who have not used your app within the specified duration are included in the segment.
 */
@property (nonatomic, assign) AWSPinpointTargetingRecencyType recencyType;

@end

/**
 SMS Channel Request
 */
@interface AWSPinpointTargetingSMSChannelRequest : AWSModel


/**
 If the channel is enabled for sending messages.
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

/**
 Sender identifier of your messages.
 */
@property (nonatomic, strong) NSString * _Nullable senderId;

@end

/**
 SMS Channel Response.
 */
@interface AWSPinpointTargetingSMSChannelResponse : AWSModel


/**
 Application id
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 The date that the settings were last updated in ISO 8601 format.
 */
@property (nonatomic, strong) NSString * _Nullable creationDate;

/**
 If the channel is enabled for sending messages.
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

/**
 Channel ID. Not used, only for backwards compatibility.
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 Is this channel archived
 */
@property (nonatomic, strong) NSNumber * _Nullable isArchived;

/**
 Who last updated this entry
 */
@property (nonatomic, strong) NSString * _Nullable lastModifiedBy;

/**
 Last date this was updated
 */
@property (nonatomic, strong) NSString * _Nullable lastModifiedDate;

/**
 Platform type. Will be "SMS"
 */
@property (nonatomic, strong) NSString * _Nullable platform;

/**
 Sender identifier of your messages.
 */
@property (nonatomic, strong) NSString * _Nullable senderId;

/**
 The short code registered with the phone provider.
 */
@property (nonatomic, strong) NSString * _Nullable shortCode;

/**
 Version of channel
 */
@property (nonatomic, strong) NSNumber * _Nullable version;

@end

/**
 SMS Message.
 */
@interface AWSPinpointTargetingSMSMessage : AWSModel


/**
 The message body of the notification, the email body or the text message.
 */
@property (nonatomic, strong) NSString * _Nullable body;

/**
 Is this a transaction priority message or lower priority.
 */
@property (nonatomic, assign) AWSPinpointTargetingMessageType messageType;

/**
 Sender ID of sent message.
 */
@property (nonatomic, strong) NSString * _Nullable senderId;

/**
 Default message substitutions. Can be overridden by individual address substitutions.
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSArray<NSString *> *> * _Nullable substitutions;

@end

/**
 Shcedule that defines when a campaign is run.
 */
@interface AWSPinpointTargetingSchedule : AWSModel


/**
 The scheduled time that the campaign ends in ISO 8601 format.
 */
@property (nonatomic, strong) NSString * _Nullable endTime;

/**
 How often the campaign delivers messages.Valid values: ONCE, HOURLY, DAILY, WEEKLY, MONTHLY
 */
@property (nonatomic, assign) AWSPinpointTargetingFrequency frequency;

/**
 Indicates whether the campaign schedule takes effect according to each user's local time.
 */
@property (nonatomic, strong) NSNumber * _Nullable isLocalTime;

/**
 The time during which the campaign sends no messages.
 */
@property (nonatomic, strong) AWSPinpointTargetingQuietTime * _Nullable quietTime;

/**
 The scheduled time that the campaign begins in ISO 8601 format.
 */
@property (nonatomic, strong) NSString * _Nullable startTime;

/**
 The starting UTC offset for the schedule if the value for isLocalTime is trueValid values:UTC UTC+01 UTC+02 UTC+03 UTC+03:30 UTC+04 UTC+04:30 UTC+05 UTC+05:30 UTC+05:45 UTC+06 UTC+06:30 UTC+07 UTC+08 UTC+09 UTC+09:30 UTC+10 UTC+10:30 UTC+11 UTC+12 UTC+13 UTC-02 UTC-03 UTC-04 UTC-05 UTC-06 UTC-07 UTC-08 UTC-09 UTC-10 UTC-11
 */
@property (nonatomic, strong) NSString * _Nullable timezone;

@end

/**
 Segment behavior dimensions
 */
@interface AWSPinpointTargetingSegmentBehaviors : AWSModel


/**
 The recency of use.
 */
@property (nonatomic, strong) AWSPinpointTargetingRecencyDimension * _Nullable recency;

@end

/**
 Segment demographic dimensions
 */
@interface AWSPinpointTargetingSegmentDemographics : AWSModel


/**
 The app version criteria for the segment.
 */
@property (nonatomic, strong) AWSPinpointTargetingSetDimension * _Nullable appVersion;

/**
 The channel criteria for the segment.
 */
@property (nonatomic, strong) AWSPinpointTargetingSetDimension * _Nullable channel;

/**
 The device type criteria for the segment.
 */
@property (nonatomic, strong) AWSPinpointTargetingSetDimension * _Nullable deviceType;

/**
 The device make criteria for the segment.
 */
@property (nonatomic, strong) AWSPinpointTargetingSetDimension * _Nullable make;

/**
 The device model criteria for the segment.
 */
@property (nonatomic, strong) AWSPinpointTargetingSetDimension * _Nullable model;

/**
 The device platform criteria for the segment.
 */
@property (nonatomic, strong) AWSPinpointTargetingSetDimension * _Nullable platform;

@end

/**
 Segment dimensions
 */
@interface AWSPinpointTargetingSegmentDimensions : AWSModel


/**
 Custom segment attributes.
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSPinpointTargetingAttributeDimension *> * _Nullable attributes;

/**
 The segment behaviors attributes.
 */
@property (nonatomic, strong) AWSPinpointTargetingSegmentBehaviors * _Nullable behavior;

/**
 The segment demographics attributes.
 */
@property (nonatomic, strong) AWSPinpointTargetingSegmentDemographics * _Nullable demographic;

/**
 The segment location attributes.
 */
@property (nonatomic, strong) AWSPinpointTargetingSegmentLocation * _Nullable location;

/**
 Custom segment user attributes.
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSPinpointTargetingAttributeDimension *> * _Nullable userAttributes;

@end

/**
 Segment import definition.
 */
@interface AWSPinpointTargetingSegmentImportResource : AWSModel


/**
 Channel type counts
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSNumber *> * _Nullable channelCounts;

/**
 A unique, custom ID assigned to the IAM role that restricts who can assume the role.
 */
@property (nonatomic, strong) NSString * _Nullable externalId;

/**
 The format of the endpoint files that were imported to create this segment. Valid values: CSV, JSON
 */
@property (nonatomic, assign) AWSPinpointTargetingFormat format;

/**
 The Amazon Resource Name (ARN) of an IAM role that grants Amazon Pinpoint access to the endpoints in Amazon S3.
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 A URL that points to the Amazon S3 location from which the endpoints for this segment were imported.
 */
@property (nonatomic, strong) NSString * _Nullable s3Url;

/**
 The number of endpoints that were successfully imported to create this segment.
 */
@property (nonatomic, strong) NSNumber * _Nullable size;

@end

/**
 Segment location dimensions
 */
@interface AWSPinpointTargetingSegmentLocation : AWSModel


/**
 The country filter according to ISO 3166-1 Alpha-2 codes.
 */
@property (nonatomic, strong) AWSPinpointTargetingSetDimension * _Nullable country;

@end

/**
 Segment definition.
 */
@interface AWSPinpointTargetingSegmentResponse : AWSModel


/**
 The ID of the application to which the segment applies.
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 The date the segment was created in ISO 8601 format.
 */
@property (nonatomic, strong) NSString * _Nullable creationDate;

/**
 The segment dimensions attributes.
 */
@property (nonatomic, strong) AWSPinpointTargetingSegmentDimensions * _Nullable dimensions;

/**
 The unique segment ID.
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 The import job settings.
 */
@property (nonatomic, strong) AWSPinpointTargetingSegmentImportResource * _Nullable importDefinition;

/**
 The date the segment was last updated in ISO 8601 format.
 */
@property (nonatomic, strong) NSString * _Nullable lastModifiedDate;

/**
 The name of segment
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 The segment type: DIMENSIONAL - A dynamic segment built from selection criteria based on endpoint data reported by your app. You create this type of segment by using the segment builder in the Amazon Pinpoint console or by making a POST request to the segments resource. IMPORT - A static segment built from an imported set of endpoint definitions. You create this type of segment by importing a segment in the Amazon Pinpoint console or by making a POST request to the jobs/import resource.
 */
@property (nonatomic, assign) AWSPinpointTargetingSegmentType segmentType;

/**
 The segment version number.
 */
@property (nonatomic, strong) NSNumber * _Nullable version;

@end

/**
 Segments in your account.
 */
@interface AWSPinpointTargetingSegmentsResponse : AWSModel


/**
 The list of segments.
 */
@property (nonatomic, strong) NSArray<AWSPinpointTargetingSegmentResponse *> * _Nullable item;

/**
 An identifier used to retrieve the next page of results. The token is null if no additional pages exist.
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSPinpointTargetingSendMessagesRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 Send message request.
 */
@property (nonatomic, strong) AWSPinpointTargetingMessageRequest * _Nullable messageRequest;

@end

/**
 
 */
@interface AWSPinpointTargetingSendMessagesResponse : AWSModel


/**
 Send message response.
 */
@property (nonatomic, strong) AWSPinpointTargetingMessageResponse * _Nullable messageResponse;

@end

/**
 Dimension specification of a segment.
 */
@interface AWSPinpointTargetingSetDimension : AWSModel


/**
 The type of dimension: INCLUSIVE - Endpoints that match the criteria are included in the segment. EXCLUSIVE - Endpoints that match the criteria are excluded from the segment.
 */
@property (nonatomic, assign) AWSPinpointTargetingDimensionType dimensionType;

/**
 The criteria values for the segment dimension. Endpoints with matching attribute values are included or excluded from the segment, depending on the setting for Type.
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable values;

@end

/**
 Treatment resource
 */
@interface AWSPinpointTargetingTreatmentResource : AWSModel


/**
 The unique treatment ID.
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 The message configuration settings.
 */
@property (nonatomic, strong) AWSPinpointTargetingMessageConfiguration * _Nullable messageConfiguration;

/**
 The campaign schedule.
 */
@property (nonatomic, strong) AWSPinpointTargetingSchedule * _Nullable schedule;

/**
 The allocated percentage of users for this treatment.
 */
@property (nonatomic, strong) NSNumber * _Nullable sizePercent;

/**
 The treatment status.
 */
@property (nonatomic, strong) AWSPinpointTargetingCampaignState * _Nullable state;

/**
 A custom description for the treatment.
 */
@property (nonatomic, strong) NSString * _Nullable treatmentDescription;

/**
 The custom name of a variation of the campaign used for A/B testing.
 */
@property (nonatomic, strong) NSString * _Nullable treatmentName;

@end

/**
 
 */
@interface AWSPinpointTargetingUpdateApnsChannelRequest : AWSRequest


/**
 Apple Push Notification Service channel definition.
 */
@property (nonatomic, strong) AWSPinpointTargetingAPNSChannelRequest * _Nullable APNSChannelRequest;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

@end

/**
 
 */
@interface AWSPinpointTargetingUpdateApnsChannelResponse : AWSModel


/**
 Apple Distribution Push Notification Service channel definition.
 */
@property (nonatomic, strong) AWSPinpointTargetingAPNSChannelResponse * _Nullable APNSChannelResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingUpdateApnsSandboxChannelRequest : AWSRequest


/**
 Apple Development Push Notification Service channel definition.
 */
@property (nonatomic, strong) AWSPinpointTargetingAPNSSandboxChannelRequest * _Nullable APNSSandboxChannelRequest;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

@end

/**
 
 */
@interface AWSPinpointTargetingUpdateApnsSandboxChannelResponse : AWSModel


/**
 Apple Development Push Notification Service channel definition.
 */
@property (nonatomic, strong) AWSPinpointTargetingAPNSSandboxChannelResponse * _Nullable APNSSandboxChannelResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingUpdateApplicationSettingsRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 Creating application setting request
 */
@property (nonatomic, strong) AWSPinpointTargetingWriteApplicationSettingsRequest * _Nullable writeApplicationSettingsRequest;

@end

/**
 
 */
@interface AWSPinpointTargetingUpdateApplicationSettingsResponse : AWSModel


/**
 Application settings.
 */
@property (nonatomic, strong) AWSPinpointTargetingApplicationSettingsResource * _Nullable applicationSettingsResource;

@end

/**
 
 */
@interface AWSPinpointTargetingUpdateCampaignRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable campaignId;

/**
 Used to create a campaign.
 */
@property (nonatomic, strong) AWSPinpointTargetingWriteCampaignRequest * _Nullable writeCampaignRequest;

@end

/**
 
 */
@interface AWSPinpointTargetingUpdateCampaignResponse : AWSModel


/**
 Campaign definition
 */
@property (nonatomic, strong) AWSPinpointTargetingCampaignResponse * _Nullable campaignResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingUpdateEmailChannelRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 Email Channel Request
 */
@property (nonatomic, strong) AWSPinpointTargetingEmailChannelRequest * _Nullable emailChannelRequest;

@end

/**
 
 */
@interface AWSPinpointTargetingUpdateEmailChannelResponse : AWSModel


/**
 Email Channel Response.
 */
@property (nonatomic, strong) AWSPinpointTargetingEmailChannelResponse * _Nullable emailChannelResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingUpdateEndpointRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable endpointId;

/**
 Endpoint update request
 */
@property (nonatomic, strong) AWSPinpointTargetingEndpointRequest * _Nullable endpointRequest;

@end

/**
 
 */
@interface AWSPinpointTargetingUpdateEndpointResponse : AWSModel


/**
 Simple message object.
 */
@property (nonatomic, strong) AWSPinpointTargetingMessageBody * _Nullable messageBody;

@end

/**
 
 */
@interface AWSPinpointTargetingUpdateEndpointsBatchRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 Endpoint batch update request.
 */
@property (nonatomic, strong) AWSPinpointTargetingEndpointBatchRequest * _Nullable endpointBatchRequest;

@end

/**
 
 */
@interface AWSPinpointTargetingUpdateEndpointsBatchResponse : AWSModel


/**
 Simple message object.
 */
@property (nonatomic, strong) AWSPinpointTargetingMessageBody * _Nullable messageBody;

@end

/**
 
 */
@interface AWSPinpointTargetingUpdateGcmChannelRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 Google Cloud Messaging credentials
 */
@property (nonatomic, strong) AWSPinpointTargetingGCMChannelRequest * _Nullable GCMChannelRequest;

@end

/**
 
 */
@interface AWSPinpointTargetingUpdateGcmChannelResponse : AWSModel


/**
 Google Cloud Messaging channel definition
 */
@property (nonatomic, strong) AWSPinpointTargetingGCMChannelResponse * _Nullable GCMChannelResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingUpdateSegmentRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable segmentId;

/**
 Segment definition.
 */
@property (nonatomic, strong) AWSPinpointTargetingWriteSegmentRequest * _Nullable writeSegmentRequest;

@end

/**
 
 */
@interface AWSPinpointTargetingUpdateSegmentResponse : AWSModel


/**
 Segment definition.
 */
@property (nonatomic, strong) AWSPinpointTargetingSegmentResponse * _Nullable segmentResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingUpdateSmsChannelRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 SMS Channel Request
 */
@property (nonatomic, strong) AWSPinpointTargetingSMSChannelRequest * _Nullable SMSChannelRequest;

@end

/**
 
 */
@interface AWSPinpointTargetingUpdateSmsChannelResponse : AWSModel


/**
 SMS Channel Response.
 */
@property (nonatomic, strong) AWSPinpointTargetingSMSChannelResponse * _Nullable SMSChannelResponse;

@end

/**
 Creating application setting request
 */
@interface AWSPinpointTargetingWriteApplicationSettingsRequest : AWSModel


/**
 The default campaign limits for the app. These limits apply to each campaign for the app, unless the campaign overrides the default with limits of its own.
 */
@property (nonatomic, strong) AWSPinpointTargetingCampaignLimits * _Nullable limits;

/**
 The default quiet time for the app. Each campaign for this app sends no messages during this time unless the campaign overrides the default with a quiet time of its own.
 */
@property (nonatomic, strong) AWSPinpointTargetingQuietTime * _Nullable quietTime;

@end

/**
 Used to create a campaign.
 */
@interface AWSPinpointTargetingWriteCampaignRequest : AWSModel


/**
 Treatments that are defined in addition to the default treatment.
 */
@property (nonatomic, strong) NSArray<AWSPinpointTargetingWriteTreatmentResource *> * _Nullable additionalTreatments;

/**
 A description of the campaign.
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 The allocated percentage of end users who will not receive messages from this campaign.
 */
@property (nonatomic, strong) NSNumber * _Nullable holdoutPercent;

/**
 Indicates whether the campaign is paused. A paused campaign does not send messages unless you resume it by setting IsPaused to false.
 */
@property (nonatomic, strong) NSNumber * _Nullable isPaused;

/**
 The campaign limits settings.
 */
@property (nonatomic, strong) AWSPinpointTargetingCampaignLimits * _Nullable limits;

/**
 The message configuration settings.
 */
@property (nonatomic, strong) AWSPinpointTargetingMessageConfiguration * _Nullable messageConfiguration;

/**
 The custom name of the campaign.
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 The campaign schedule.
 */
@property (nonatomic, strong) AWSPinpointTargetingSchedule * _Nullable schedule;

/**
 The ID of the segment to which the campaign sends messages.
 */
@property (nonatomic, strong) NSString * _Nullable segmentId;

/**
 The version of the segment to which the campaign sends messages.
 */
@property (nonatomic, strong) NSNumber * _Nullable segmentVersion;

/**
 A custom description for the treatment.
 */
@property (nonatomic, strong) NSString * _Nullable treatmentDescription;

/**
 The custom name of a variation of the campaign used for A/B testing.
 */
@property (nonatomic, strong) NSString * _Nullable treatmentName;

@end

/**
 Request to save an EventStream.
 */
@interface AWSPinpointTargetingWriteEventStream : AWSModel


/**
 The Amazon Resource Name (ARN) of the Amazon Kinesis stream or Firehose delivery stream to which you want to publish events.Firehose ARN: arn:aws:firehose:REGION:ACCOUNT_ID:deliverystream/STREAM_NAMEKinesis ARN: arn:aws:kinesis:REGION:ACCOUNT_ID:stream/STREAM_NAME
 */
@property (nonatomic, strong) NSString * _Nullable destinationStreamArn;

/**
 The external ID assigned the IAM role that authorizes Amazon Pinpoint to publish to the stream.
 */
@property (nonatomic, strong) NSString * _Nullable externalId;

/**
 The IAM role that authorizes Amazon Pinpoint to publish events to the stream in your account.
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

@end

/**
 Segment definition.
 */
@interface AWSPinpointTargetingWriteSegmentRequest : AWSModel


/**
 The segment dimensions attributes.
 */
@property (nonatomic, strong) AWSPinpointTargetingSegmentDimensions * _Nullable dimensions;

/**
 The name of segment
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 Used to create a campaign treatment.
 */
@interface AWSPinpointTargetingWriteTreatmentResource : AWSModel


/**
 The message configuration settings.
 */
@property (nonatomic, strong) AWSPinpointTargetingMessageConfiguration * _Nullable messageConfiguration;

/**
 The campaign schedule.
 */
@property (nonatomic, strong) AWSPinpointTargetingSchedule * _Nullable schedule;

/**
 The allocated percentage of users for this treatment.
 */
@property (nonatomic, strong) NSNumber * _Nullable sizePercent;

/**
 A custom description for the treatment.
 */
@property (nonatomic, strong) NSString * _Nullable treatmentDescription;

/**
 The custom name of a variation of the campaign used for A/B testing.
 */
@property (nonatomic, strong) NSString * _Nullable treatmentName;

@end

NS_ASSUME_NONNULL_END
