//
// Copyright 2010-2019 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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
    AWSPinpointTargetingCampaignStatusDeleted,
};

typedef NS_ENUM(NSInteger, AWSPinpointTargetingChannelType) {
    AWSPinpointTargetingChannelTypeUnknown,
    AWSPinpointTargetingChannelTypeGcm,
    AWSPinpointTargetingChannelTypeApns,
    AWSPinpointTargetingChannelTypeApnsSandbox,
    AWSPinpointTargetingChannelTypeApnsVoip,
    AWSPinpointTargetingChannelTypeApnsVoipSandbox,
    AWSPinpointTargetingChannelTypeAdm,
    AWSPinpointTargetingChannelTypeSms,
    AWSPinpointTargetingChannelTypeVoice,
    AWSPinpointTargetingChannelTypeEmail,
    AWSPinpointTargetingChannelTypeBaidu,
    AWSPinpointTargetingChannelTypeCustom,
};

typedef NS_ENUM(NSInteger, AWSPinpointTargetingDeliveryStatus) {
    AWSPinpointTargetingDeliveryStatusUnknown,
    AWSPinpointTargetingDeliveryStatusSuccessful,
    AWSPinpointTargetingDeliveryStatusThrottled,
    AWSPinpointTargetingDeliveryStatusTemporaryFailure,
    AWSPinpointTargetingDeliveryStatusPermanentFailure,
    AWSPinpointTargetingDeliveryStatusUnknownFailure,
    AWSPinpointTargetingDeliveryStatusOptOut,
    AWSPinpointTargetingDeliveryStatusDuplicate,
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

typedef NS_ENUM(NSInteger, AWSPinpointTargetingFilterType) {
    AWSPinpointTargetingFilterTypeUnknown,
    AWSPinpointTargetingFilterTypeSystem,
    AWSPinpointTargetingFilterTypeEndpoint,
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
    AWSPinpointTargetingFrequencyEvent,
};

typedef NS_ENUM(NSInteger, AWSPinpointTargetingInclude) {
    AWSPinpointTargetingIncludeUnknown,
    AWSPinpointTargetingIncludeAll,
    AWSPinpointTargetingIncludeAny,
    AWSPinpointTargetingIncludeNone,
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

typedef NS_ENUM(NSInteger, AWSPinpointTargetingMode) {
    AWSPinpointTargetingModeUnknown,
    AWSPinpointTargetingModeDelivery,
    AWSPinpointTargetingModeFilter,
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

typedef NS_ENUM(NSInteger, AWSPinpointTargetingSourceType) {
    AWSPinpointTargetingSourceTypeUnknown,
    AWSPinpointTargetingSourceTypeAll,
    AWSPinpointTargetingSourceTypeAny,
    AWSPinpointTargetingSourceTypeNone,
};

typedef NS_ENUM(NSInteger, AWSPinpointTargetingTypes) {
    AWSPinpointTargetingTypesUnknown,
    AWSPinpointTargetingTypesAll,
    AWSPinpointTargetingTypesAny,
    AWSPinpointTargetingTypesNone,
};

@class AWSPinpointTargetingADMChannelRequest;
@class AWSPinpointTargetingADMChannelResponse;
@class AWSPinpointTargetingADMMessage;
@class AWSPinpointTargetingAPNSChannelRequest;
@class AWSPinpointTargetingAPNSChannelResponse;
@class AWSPinpointTargetingAPNSMessage;
@class AWSPinpointTargetingAPNSSandboxChannelRequest;
@class AWSPinpointTargetingAPNSSandboxChannelResponse;
@class AWSPinpointTargetingAPNSVoipChannelRequest;
@class AWSPinpointTargetingAPNSVoipChannelResponse;
@class AWSPinpointTargetingAPNSVoipSandboxChannelRequest;
@class AWSPinpointTargetingAPNSVoipSandboxChannelResponse;
@class AWSPinpointTargetingActivitiesResponse;
@class AWSPinpointTargetingActivityResponse;
@class AWSPinpointTargetingAddressConfiguration;
@class AWSPinpointTargetingApplicationResponse;
@class AWSPinpointTargetingApplicationSettingsResource;
@class AWSPinpointTargetingApplicationsResponse;
@class AWSPinpointTargetingAttributeDimension;
@class AWSPinpointTargetingAttributesResource;
@class AWSPinpointTargetingBaiduChannelRequest;
@class AWSPinpointTargetingBaiduChannelResponse;
@class AWSPinpointTargetingBaiduMessage;
@class AWSPinpointTargetingCampaignEmailMessage;
@class AWSPinpointTargetingCampaignEventFilter;
@class AWSPinpointTargetingCampaignHook;
@class AWSPinpointTargetingCampaignLimits;
@class AWSPinpointTargetingCampaignResponse;
@class AWSPinpointTargetingCampaignSmsMessage;
@class AWSPinpointTargetingCampaignState;
@class AWSPinpointTargetingCampaignsResponse;
@class AWSPinpointTargetingChannelResponse;
@class AWSPinpointTargetingChannelsResponse;
@class AWSPinpointTargetingCreateAppRequest;
@class AWSPinpointTargetingCreateAppResponse;
@class AWSPinpointTargetingCreateApplicationRequest;
@class AWSPinpointTargetingCreateCampaignRequest;
@class AWSPinpointTargetingCreateCampaignResponse;
@class AWSPinpointTargetingCreateExportJobRequest;
@class AWSPinpointTargetingCreateExportJobResponse;
@class AWSPinpointTargetingCreateImportJobRequest;
@class AWSPinpointTargetingCreateImportJobResponse;
@class AWSPinpointTargetingCreateSegmentRequest;
@class AWSPinpointTargetingCreateSegmentResponse;
@class AWSPinpointTargetingDefaultMessage;
@class AWSPinpointTargetingDefaultPushNotificationMessage;
@class AWSPinpointTargetingDeleteAdmChannelRequest;
@class AWSPinpointTargetingDeleteAdmChannelResponse;
@class AWSPinpointTargetingDeleteApnsChannelRequest;
@class AWSPinpointTargetingDeleteApnsChannelResponse;
@class AWSPinpointTargetingDeleteApnsSandboxChannelRequest;
@class AWSPinpointTargetingDeleteApnsSandboxChannelResponse;
@class AWSPinpointTargetingDeleteApnsVoipChannelRequest;
@class AWSPinpointTargetingDeleteApnsVoipChannelResponse;
@class AWSPinpointTargetingDeleteApnsVoipSandboxChannelRequest;
@class AWSPinpointTargetingDeleteApnsVoipSandboxChannelResponse;
@class AWSPinpointTargetingDeleteAppRequest;
@class AWSPinpointTargetingDeleteAppResponse;
@class AWSPinpointTargetingDeleteBaiduChannelRequest;
@class AWSPinpointTargetingDeleteBaiduChannelResponse;
@class AWSPinpointTargetingDeleteCampaignRequest;
@class AWSPinpointTargetingDeleteCampaignResponse;
@class AWSPinpointTargetingDeleteEmailChannelRequest;
@class AWSPinpointTargetingDeleteEmailChannelResponse;
@class AWSPinpointTargetingDeleteEndpointRequest;
@class AWSPinpointTargetingDeleteEndpointResponse;
@class AWSPinpointTargetingDeleteEventStreamRequest;
@class AWSPinpointTargetingDeleteEventStreamResponse;
@class AWSPinpointTargetingDeleteGcmChannelRequest;
@class AWSPinpointTargetingDeleteGcmChannelResponse;
@class AWSPinpointTargetingDeleteSegmentRequest;
@class AWSPinpointTargetingDeleteSegmentResponse;
@class AWSPinpointTargetingDeleteSmsChannelRequest;
@class AWSPinpointTargetingDeleteSmsChannelResponse;
@class AWSPinpointTargetingDeleteUserEndpointsRequest;
@class AWSPinpointTargetingDeleteUserEndpointsResponse;
@class AWSPinpointTargetingDeleteVoiceChannelRequest;
@class AWSPinpointTargetingDeleteVoiceChannelResponse;
@class AWSPinpointTargetingDirectMessageConfiguration;
@class AWSPinpointTargetingEmailChannelRequest;
@class AWSPinpointTargetingEmailChannelResponse;
@class AWSPinpointTargetingEmailMessage;
@class AWSPinpointTargetingEndpointBatchItem;
@class AWSPinpointTargetingEndpointBatchRequest;
@class AWSPinpointTargetingEndpointDemographic;
@class AWSPinpointTargetingEndpointItemResponse;
@class AWSPinpointTargetingEndpointLocation;
@class AWSPinpointTargetingEndpointMessageResult;
@class AWSPinpointTargetingEndpointRequest;
@class AWSPinpointTargetingEndpointResponse;
@class AWSPinpointTargetingEndpointSendConfiguration;
@class AWSPinpointTargetingEndpointUser;
@class AWSPinpointTargetingEndpointsResponse;
@class AWSPinpointTargetingEvent;
@class AWSPinpointTargetingEventDimensions;
@class AWSPinpointTargetingEventItemResponse;
@class AWSPinpointTargetingEventStream;
@class AWSPinpointTargetingEventsBatch;
@class AWSPinpointTargetingEventsRequest;
@class AWSPinpointTargetingEventsResponse;
@class AWSPinpointTargetingExportJobRequest;
@class AWSPinpointTargetingExportJobResource;
@class AWSPinpointTargetingExportJobResponse;
@class AWSPinpointTargetingExportJobsResponse;
@class AWSPinpointTargetingGCMChannelRequest;
@class AWSPinpointTargetingGCMChannelResponse;
@class AWSPinpointTargetingGCMMessage;
@class AWSPinpointTargetingGPSCoordinates;
@class AWSPinpointTargetingGPSPointDimension;
@class AWSPinpointTargetingGetAdmChannelRequest;
@class AWSPinpointTargetingGetAdmChannelResponse;
@class AWSPinpointTargetingGetApnsChannelRequest;
@class AWSPinpointTargetingGetApnsChannelResponse;
@class AWSPinpointTargetingGetApnsSandboxChannelRequest;
@class AWSPinpointTargetingGetApnsSandboxChannelResponse;
@class AWSPinpointTargetingGetApnsVoipChannelRequest;
@class AWSPinpointTargetingGetApnsVoipChannelResponse;
@class AWSPinpointTargetingGetApnsVoipSandboxChannelRequest;
@class AWSPinpointTargetingGetApnsVoipSandboxChannelResponse;
@class AWSPinpointTargetingGetAppRequest;
@class AWSPinpointTargetingGetAppResponse;
@class AWSPinpointTargetingGetApplicationSettingsRequest;
@class AWSPinpointTargetingGetApplicationSettingsResponse;
@class AWSPinpointTargetingGetAppsRequest;
@class AWSPinpointTargetingGetAppsResponse;
@class AWSPinpointTargetingGetBaiduChannelRequest;
@class AWSPinpointTargetingGetBaiduChannelResponse;
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
@class AWSPinpointTargetingGetChannelsRequest;
@class AWSPinpointTargetingGetChannelsResponse;
@class AWSPinpointTargetingGetEmailChannelRequest;
@class AWSPinpointTargetingGetEmailChannelResponse;
@class AWSPinpointTargetingGetEndpointRequest;
@class AWSPinpointTargetingGetEndpointResponse;
@class AWSPinpointTargetingGetEventStreamRequest;
@class AWSPinpointTargetingGetEventStreamResponse;
@class AWSPinpointTargetingGetExportJobRequest;
@class AWSPinpointTargetingGetExportJobResponse;
@class AWSPinpointTargetingGetExportJobsRequest;
@class AWSPinpointTargetingGetExportJobsResponse;
@class AWSPinpointTargetingGetGcmChannelRequest;
@class AWSPinpointTargetingGetGcmChannelResponse;
@class AWSPinpointTargetingGetImportJobRequest;
@class AWSPinpointTargetingGetImportJobResponse;
@class AWSPinpointTargetingGetImportJobsRequest;
@class AWSPinpointTargetingGetImportJobsResponse;
@class AWSPinpointTargetingGetSegmentExportJobsRequest;
@class AWSPinpointTargetingGetSegmentExportJobsResponse;
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
@class AWSPinpointTargetingGetUserEndpointsRequest;
@class AWSPinpointTargetingGetUserEndpointsResponse;
@class AWSPinpointTargetingGetVoiceChannelRequest;
@class AWSPinpointTargetingGetVoiceChannelResponse;
@class AWSPinpointTargetingImportJobRequest;
@class AWSPinpointTargetingImportJobResource;
@class AWSPinpointTargetingImportJobResponse;
@class AWSPinpointTargetingImportJobsResponse;
@class AWSPinpointTargetingItemResponse;
@class AWSPinpointTargetingMessage;
@class AWSPinpointTargetingMessageBody;
@class AWSPinpointTargetingMessageConfiguration;
@class AWSPinpointTargetingMessageRequest;
@class AWSPinpointTargetingMessageResponse;
@class AWSPinpointTargetingMessageResult;
@class AWSPinpointTargetingMetricDimension;
@class AWSPinpointTargetingNumberValidateRequest;
@class AWSPinpointTargetingNumberValidateResponse;
@class AWSPinpointTargetingPhoneNumberValidateRequest;
@class AWSPinpointTargetingPhoneNumberValidateResponse;
@class AWSPinpointTargetingPublicEndpoint;
@class AWSPinpointTargetingPutEventStreamRequest;
@class AWSPinpointTargetingPutEventStreamResponse;
@class AWSPinpointTargetingPutEventsRequest;
@class AWSPinpointTargetingPutEventsResponse;
@class AWSPinpointTargetingQuietTime;
@class AWSPinpointTargetingRawEmail;
@class AWSPinpointTargetingRecencyDimension;
@class AWSPinpointTargetingRemoveAttributesRequest;
@class AWSPinpointTargetingRemoveAttributesResponse;
@class AWSPinpointTargetingSMSChannelRequest;
@class AWSPinpointTargetingSMSChannelResponse;
@class AWSPinpointTargetingSMSMessage;
@class AWSPinpointTargetingSchedule;
@class AWSPinpointTargetingSegmentBehaviors;
@class AWSPinpointTargetingSegmentDemographics;
@class AWSPinpointTargetingSegmentDimensions;
@class AWSPinpointTargetingSegmentGroup;
@class AWSPinpointTargetingSegmentGroupList;
@class AWSPinpointTargetingSegmentImportResource;
@class AWSPinpointTargetingSegmentLocation;
@class AWSPinpointTargetingSegmentReference;
@class AWSPinpointTargetingSegmentResponse;
@class AWSPinpointTargetingSegmentsResponse;
@class AWSPinpointTargetingSendMessagesRequest;
@class AWSPinpointTargetingSendMessagesResponse;
@class AWSPinpointTargetingSendUsersMessageRequest;
@class AWSPinpointTargetingSendUsersMessageResponse;
@class AWSPinpointTargetingSendUsersMessagesRequest;
@class AWSPinpointTargetingSendUsersMessagesResponse;
@class AWSPinpointTargetingSession;
@class AWSPinpointTargetingSetDimension;
@class AWSPinpointTargetingSimpleEmail;
@class AWSPinpointTargetingSimpleEmailPart;
@class AWSPinpointTargetingTreatmentResource;
@class AWSPinpointTargetingUpdateAdmChannelRequest;
@class AWSPinpointTargetingUpdateAdmChannelResponse;
@class AWSPinpointTargetingUpdateApnsChannelRequest;
@class AWSPinpointTargetingUpdateApnsChannelResponse;
@class AWSPinpointTargetingUpdateApnsSandboxChannelRequest;
@class AWSPinpointTargetingUpdateApnsSandboxChannelResponse;
@class AWSPinpointTargetingUpdateApnsVoipChannelRequest;
@class AWSPinpointTargetingUpdateApnsVoipChannelResponse;
@class AWSPinpointTargetingUpdateApnsVoipSandboxChannelRequest;
@class AWSPinpointTargetingUpdateApnsVoipSandboxChannelResponse;
@class AWSPinpointTargetingUpdateApplicationSettingsRequest;
@class AWSPinpointTargetingUpdateApplicationSettingsResponse;
@class AWSPinpointTargetingUpdateAttributesRequest;
@class AWSPinpointTargetingUpdateBaiduChannelRequest;
@class AWSPinpointTargetingUpdateBaiduChannelResponse;
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
@class AWSPinpointTargetingUpdateVoiceChannelRequest;
@class AWSPinpointTargetingUpdateVoiceChannelResponse;
@class AWSPinpointTargetingVoiceChannelRequest;
@class AWSPinpointTargetingVoiceChannelResponse;
@class AWSPinpointTargetingVoiceMessage;
@class AWSPinpointTargetingWriteApplicationSettingsRequest;
@class AWSPinpointTargetingWriteCampaignRequest;
@class AWSPinpointTargetingWriteEventStream;
@class AWSPinpointTargetingWriteSegmentRequest;
@class AWSPinpointTargetingWriteTreatmentResource;

/**
 Amazon Device Messaging channel definition.
 */
@interface AWSPinpointTargetingADMChannelRequest : AWSModel


/**
 The Client ID that you obtained from the Amazon App Distribution Portal.
 */
@property (nonatomic, strong) NSString * _Nullable clientId;

/**
 The Client Secret that you obtained from the Amazon App Distribution Portal.
 */
@property (nonatomic, strong) NSString * _Nullable clientSecret;

/**
 Indicates whether or not the channel is enabled for sending messages.
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

@end

/**
 Amazon Device Messaging channel definition.
 */
@interface AWSPinpointTargetingADMChannelResponse : AWSModel


/**
 The ID of the application to which the channel applies.
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 The date and time when this channel was created.
 */
@property (nonatomic, strong) NSString * _Nullable creationDate;

/**
 Indicates whether or not the channel is enabled for sending messages.
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

/**
 Not used. Retained for backwards compatibility.
 */
@property (nonatomic, strong) NSNumber * _Nullable hasCredential;

/**
 (Deprecated) An identifier for the channel. Retained for backwards compatibility.
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 Indicates whether or not the channel is archived.
 */
@property (nonatomic, strong) NSNumber * _Nullable isArchived;

/**
 The user who last updated this channel.
 */
@property (nonatomic, strong) NSString * _Nullable lastModifiedBy;

/**
 The date and time when this channel was last modified.
 */
@property (nonatomic, strong) NSString * _Nullable lastModifiedDate;

/**
 The platform type. For this channel, the value is always "ADM."
 */
@property (nonatomic, strong) NSString * _Nullable platform;

/**
 The channel version.
 */
@property (nonatomic, strong) NSNumber * _Nullable version;

@end

/**
 ADM Message.
 */
@interface AWSPinpointTargetingADMMessage : AWSModel


/**
 The action that occurs if the user taps a push notification delivered by the campaign: OPEN_APP - Your app launches, or it becomes the foreground app if it has been sent to the background. This is the default action. DEEP_LINK - Uses deep linking features in iOS and Android to open your app and display a designated user interface within the app. URL - The default mobile browser on the user's device launches and opens a web page at the URL you specify. Possible values include: OPEN_APP | DEEP_LINK | URL
 */
@property (nonatomic, assign) AWSPinpointTargetingAction action;

/**
 The message body of the notification.
 */
@property (nonatomic, strong) NSString * _Nullable body;

/**
 Optional. Arbitrary string used to indicate multiple messages are logically the same and that ADM is allowed to drop previously enqueued messages in favor of this one.
 */
@property (nonatomic, strong) NSString * _Nullable consolidationKey;

/**
 The data payload used for a silent push. This payload is added to the notifications' data.pinpoint.jsonBody' object
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable data;

/**
 Optional. Number of seconds ADM should retain the message if the device is offline
 */
@property (nonatomic, strong) NSString * _Nullable expiresAfter;

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
 Optional. Base-64-encoded MD5 checksum of the data parameter. Used to verify data integrity
 */
@property (nonatomic, strong) NSString * _Nullable MD5;

/**
 The Raw JSON formatted string to be used as the payload. This value overrides the message.
 */
@property (nonatomic, strong) NSString * _Nullable rawContent;

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
 Apple Push Notification Service channel definition.
 */
@interface AWSPinpointTargetingAPNSChannelRequest : AWSModel


/**
 The bundle id used for APNs Tokens.
 */
@property (nonatomic, strong) NSString * _Nullable bundleId;

/**
 The distribution certificate from Apple.
 */
@property (nonatomic, strong) NSString * _Nullable certificate;

/**
 The default authentication method used for APNs.
 */
@property (nonatomic, strong) NSString * _Nullable defaultAuthenticationMethod;

/**
 If the channel is enabled for sending messages.
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

/**
 The certificate private key.
 */
@property (nonatomic, strong) NSString * _Nullable privateKey;

/**
 The team id used for APNs Tokens.
 */
@property (nonatomic, strong) NSString * _Nullable teamId;

/**
 The token key used for APNs Tokens.
 */
@property (nonatomic, strong) NSString * _Nullable tokenKey;

/**
 The token key used for APNs Tokens.
 */
@property (nonatomic, strong) NSString * _Nullable tokenKeyId;

@end

/**
 Apple Distribution Push Notification Service channel definition.
 */
@interface AWSPinpointTargetingAPNSChannelResponse : AWSModel


/**
 The ID of the application that the channel applies to.
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 The date and time when this channel was created.
 */
@property (nonatomic, strong) NSString * _Nullable creationDate;

/**
 The default authentication method used for APNs.
 */
@property (nonatomic, strong) NSString * _Nullable defaultAuthenticationMethod;

/**
 If the channel is enabled for sending messages.
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

/**
 Not used. Retained for backwards compatibility.
 */
@property (nonatomic, strong) NSNumber * _Nullable hasCredential;

/**
 Indicates whether the channel is configured with a key for APNs token authentication. Provide a token key by setting the TokenKey attribute.
 */
@property (nonatomic, strong) NSNumber * _Nullable hasTokenKey;

/**
 (Deprecated) An identifier for the channel. Retained for backwards compatibility.
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 Indicates whether or not the channel is archived.
 */
@property (nonatomic, strong) NSNumber * _Nullable isArchived;

/**
 The user who last updated this channel.
 */
@property (nonatomic, strong) NSString * _Nullable lastModifiedBy;

/**
 The date and time when this channel was last modified.
 */
@property (nonatomic, strong) NSString * _Nullable lastModifiedDate;

/**
 The platform type. For this channel, the value is always "ADM."
 */
@property (nonatomic, strong) NSString * _Nullable platform;

/**
 The channel version.
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
 The message body of the notification.
 */
@property (nonatomic, strong) NSString * _Nullable body;

/**
 Provide this key with a string value that represents the notification's type. This value corresponds to the value in the identifier property of one of your app's registered categories.
 */
@property (nonatomic, strong) NSString * _Nullable category;

/**
 An ID that, if assigned to multiple messages, causes APNs to coalesce the messages into a single push notification instead of delivering each message individually. The value must not exceed 64 bytes. Amazon Pinpoint uses this value to set the apns-collapse-id request header when it sends the message to APNs.
 */
@property (nonatomic, strong) NSString * _Nullable collapseId;

/**
 The data payload used for a silent push. This payload is added to the notifications' data.pinpoint.jsonBody' object
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable data;

/**
 A URL that refers to the location of an image or video that you want to display in the push notification.
 */
@property (nonatomic, strong) NSString * _Nullable mediaUrl;

/**
 The preferred authentication method, either "CERTIFICATE" or "TOKEN"
 */
@property (nonatomic, strong) NSString * _Nullable preferredAuthenticationMethod;

/**
 The message priority. Amazon Pinpoint uses this value to set the apns-priority request header when it sends the message to APNs. Accepts the following values:"5" - Low priority. Messages might be delayed, delivered in groups, and throttled."10" - High priority. Messages are sent immediately. High priority messages must cause an alert, sound, or badge on the receiving device.The default value is "10".The equivalent values for FCM or GCM messages are "normal" and "high". Amazon Pinpoint accepts these values for APNs messages and converts them.For more information about the apns-priority parameter, see Communicating with APNs in the APNs Local and Remote Notification Programming Guide.
 */
@property (nonatomic, strong) NSString * _Nullable priority;

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
 The length of time (in seconds) that APNs stores and attempts to deliver the message. If the value is 0, APNs does not store the message or attempt to deliver it more than once. Amazon Pinpoint uses this value to set the apns-expiration request header when it sends the message to APNs.
 */
@property (nonatomic, strong) NSNumber * _Nullable timeToLive;

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
 The bundle id used for APNs Tokens.
 */
@property (nonatomic, strong) NSString * _Nullable bundleId;

/**
 The distribution certificate from Apple.
 */
@property (nonatomic, strong) NSString * _Nullable certificate;

/**
 The default authentication method used for APNs.
 */
@property (nonatomic, strong) NSString * _Nullable defaultAuthenticationMethod;

/**
 If the channel is enabled for sending messages.
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

/**
 The certificate private key.
 */
@property (nonatomic, strong) NSString * _Nullable privateKey;

/**
 The team id used for APNs Tokens.
 */
@property (nonatomic, strong) NSString * _Nullable teamId;

/**
 The token key used for APNs Tokens.
 */
@property (nonatomic, strong) NSString * _Nullable tokenKey;

/**
 The token key used for APNs Tokens.
 */
@property (nonatomic, strong) NSString * _Nullable tokenKeyId;

@end

/**
 Apple Development Push Notification Service channel definition.
 */
@interface AWSPinpointTargetingAPNSSandboxChannelResponse : AWSModel


/**
 The ID of the application to which the channel applies.
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 When was this segment created
 */
@property (nonatomic, strong) NSString * _Nullable creationDate;

/**
 The default authentication method used for APNs.
 */
@property (nonatomic, strong) NSString * _Nullable defaultAuthenticationMethod;

/**
 If the channel is enabled for sending messages.
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

/**
 Not used. Retained for backwards compatibility.
 */
@property (nonatomic, strong) NSNumber * _Nullable hasCredential;

/**
 Indicates whether the channel is configured with a key for APNs token authentication. Provide a token key by setting the TokenKey attribute.
 */
@property (nonatomic, strong) NSNumber * _Nullable hasTokenKey;

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
 The platform type. Will be APNS_SANDBOX.
 */
@property (nonatomic, strong) NSString * _Nullable platform;

/**
 Version of channel
 */
@property (nonatomic, strong) NSNumber * _Nullable version;

@end

/**
 Apple VoIP Push Notification Service channel definition.
 */
@interface AWSPinpointTargetingAPNSVoipChannelRequest : AWSModel


/**
 The bundle id used for APNs Tokens.
 */
@property (nonatomic, strong) NSString * _Nullable bundleId;

/**
 The distribution certificate from Apple.
 */
@property (nonatomic, strong) NSString * _Nullable certificate;

/**
 The default authentication method used for APNs.
 */
@property (nonatomic, strong) NSString * _Nullable defaultAuthenticationMethod;

/**
 If the channel is enabled for sending messages.
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

/**
 The certificate private key.
 */
@property (nonatomic, strong) NSString * _Nullable privateKey;

/**
 The team id used for APNs Tokens.
 */
@property (nonatomic, strong) NSString * _Nullable teamId;

/**
 The token key used for APNs Tokens.
 */
@property (nonatomic, strong) NSString * _Nullable tokenKey;

/**
 The token key used for APNs Tokens.
 */
@property (nonatomic, strong) NSString * _Nullable tokenKeyId;

@end

/**
 Apple VoIP Push Notification Service channel definition.
 */
@interface AWSPinpointTargetingAPNSVoipChannelResponse : AWSModel


/**
 Application id
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 When was this segment created
 */
@property (nonatomic, strong) NSString * _Nullable creationDate;

/**
 The default authentication method used for APNs.
 */
@property (nonatomic, strong) NSString * _Nullable defaultAuthenticationMethod;

/**
 If the channel is enabled for sending messages.
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

/**
 Not used. Retained for backwards compatibility.
 */
@property (nonatomic, strong) NSNumber * _Nullable hasCredential;

/**
 If the channel is registered with a token key for authentication.
 */
@property (nonatomic, strong) NSNumber * _Nullable hasTokenKey;

/**
 Channel ID. Not used, only for backwards compatibility.
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 Is this channel archived
 */
@property (nonatomic, strong) NSNumber * _Nullable isArchived;

/**
 Who made the last change
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
 Apple VoIP Developer Push Notification Service channel definition.
 */
@interface AWSPinpointTargetingAPNSVoipSandboxChannelRequest : AWSModel


/**
 The bundle id used for APNs Tokens.
 */
@property (nonatomic, strong) NSString * _Nullable bundleId;

/**
 The distribution certificate from Apple.
 */
@property (nonatomic, strong) NSString * _Nullable certificate;

/**
 The default authentication method used for APNs.
 */
@property (nonatomic, strong) NSString * _Nullable defaultAuthenticationMethod;

/**
 If the channel is enabled for sending messages.
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

/**
 The certificate private key.
 */
@property (nonatomic, strong) NSString * _Nullable privateKey;

/**
 The team id used for APNs Tokens.
 */
@property (nonatomic, strong) NSString * _Nullable teamId;

/**
 The token key used for APNs Tokens.
 */
@property (nonatomic, strong) NSString * _Nullable tokenKey;

/**
 The token key used for APNs Tokens.
 */
@property (nonatomic, strong) NSString * _Nullable tokenKeyId;

@end

/**
 Apple VoIP Developer Push Notification Service channel definition.
 */
@interface AWSPinpointTargetingAPNSVoipSandboxChannelResponse : AWSModel


/**
 Application id
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 When was this segment created
 */
@property (nonatomic, strong) NSString * _Nullable creationDate;

/**
 The default authentication method used for APNs.
 */
@property (nonatomic, strong) NSString * _Nullable defaultAuthenticationMethod;

/**
 If the channel is enabled for sending messages.
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

/**
 Not used. Retained for backwards compatibility.
 */
@property (nonatomic, strong) NSNumber * _Nullable hasCredential;

/**
 If the channel is registered with a token key for authentication.
 */
@property (nonatomic, strong) NSNumber * _Nullable hasTokenKey;

/**
 Channel ID. Not used, only for backwards compatibility.
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 Is this channel archived
 */
@property (nonatomic, strong) NSNumber * _Nullable isArchived;

/**
 Who made the last change
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

/**
 The string that you use in a subsequent request to get the next page of results in a paginated response.
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

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
 The channel type.Valid values: GCM | APNS | APNS_SANDBOX | APNS_VOIP | APNS_VOIP_SANDBOX | ADM | SMS | EMAIL | BAIDU
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
 Application Response.
 */
@interface AWSPinpointTargetingApplicationResponse : AWSModel


/**
 The unique application ID.
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 The display name of the application.
 */
@property (nonatomic, strong) NSString * _Nullable name;

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
 Default campaign hook.
 */
@property (nonatomic, strong) AWSPinpointTargetingCampaignHook * _Nullable campaignHook;

/**
 The date that the settings were last updated in ISO 8601 format.
 */
@property (nonatomic, strong) NSString * _Nullable lastModifiedDate;

/**
 The default campaign limits for the app. These limits apply to each campaign for the app, unless the campaign overrides the default with limits of its own.
 */
@property (nonatomic, strong) AWSPinpointTargetingCampaignLimits * _Nullable limits;

/**
 The default quiet time for the app. Campaigns in the app don't send messages to endpoints during the quiet time.Note: Make sure that your endpoints include the Demographics.Timezone attribute if you plan to enable a quiet time for your app. If your endpoints don't include this attribute, they'll receive the messages that you send them, even if quiet time is enabled.When you set up an app to use quiet time, campaigns in that app don't send messages during the time range you specified, as long as all of the following are true: - The endpoint includes a valid Demographic.Timezone attribute. - The current time in the endpoint's time zone is later than or equal to the time specified in the QuietTime.Start attribute for the app (or campaign, if applicable). - The current time in the endpoint's time zone is earlier than or equal to the time specified in the QuietTime.End attribute for the app (or campaign, if applicable).Individual campaigns within the app can have their own quiet time settings, which override the quiet time settings at the app level.
 */
@property (nonatomic, strong) AWSPinpointTargetingQuietTime * _Nullable quietTime;

@end

/**
 Get Applications Result.
 */
@interface AWSPinpointTargetingApplicationsResponse : AWSModel


/**
 List of applications returned in this page.
 */
@property (nonatomic, strong) NSArray<AWSPinpointTargetingApplicationResponse *> * _Nullable item;

/**
 The string that you use in a subsequent request to get the next page of results in a paginated response.
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 Custom attibute dimension
 */
@interface AWSPinpointTargetingAttributeDimension : AWSModel


/**
 The type of dimension:INCLUSIVE - Endpoints that match the criteria are included in the segment.EXCLUSIVE - Endpoints that match the criteria are excluded from the segment.
 */
@property (nonatomic, assign) AWSPinpointTargetingAttributeType attributeType;

/**
 The criteria values for the segment dimension. Endpoints with matching attribute values are included or excluded from the segment, depending on the setting for Type.
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable values;

@end

/**
 Attributes.
 */
@interface AWSPinpointTargetingAttributesResource : AWSModel


/**
 The unique ID for the application.
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 The attribute type for the application.
 */
@property (nonatomic, strong) NSString * _Nullable attributeType;

/**
 The attributes for the application.
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable attributes;

@end

/**
 Baidu Cloud Push credentials
 */
@interface AWSPinpointTargetingBaiduChannelRequest : AWSModel


/**
 Platform credential API key from Baidu.
 */
@property (nonatomic, strong) NSString * _Nullable apiKey;

/**
 If the channel is enabled for sending messages.
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

/**
 Platform credential Secret key from Baidu.
 */
@property (nonatomic, strong) NSString * _Nullable secretKey;

@end

/**
 Baidu Cloud Messaging channel definition
 */
@interface AWSPinpointTargetingBaiduChannelResponse : AWSModel


/**
 Application id
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 When was this segment created
 */
@property (nonatomic, strong) NSString * _Nullable creationDate;

/**
 The Baidu API key from Baidu.
 */
@property (nonatomic, strong) NSString * _Nullable credential;

/**
 If the channel is enabled for sending messages.
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

/**
 Not used. Retained for backwards compatibility.
 */
@property (nonatomic, strong) NSNumber * _Nullable hasCredential;

/**
 Channel ID. Not used, only for backwards compatibility.
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 Is this channel archived
 */
@property (nonatomic, strong) NSNumber * _Nullable isArchived;

/**
 Who made the last change
 */
@property (nonatomic, strong) NSString * _Nullable lastModifiedBy;

/**
 Last date this was updated
 */
@property (nonatomic, strong) NSString * _Nullable lastModifiedDate;

/**
 The platform type. Will be BAIDU
 */
@property (nonatomic, strong) NSString * _Nullable platform;

/**
 Version of channel
 */
@property (nonatomic, strong) NSNumber * _Nullable version;

@end

/**
 Baidu Message.
 */
@interface AWSPinpointTargetingBaiduMessage : AWSModel


/**
 The action that occurs if the user taps a push notification delivered by the campaign: OPEN_APP - Your app launches, or it becomes the foreground app if it has been sent to the background. This is the default action. DEEP_LINK - Uses deep linking features in iOS and Android to open your app and display a designated user interface within the app. URL - The default mobile browser on the user's device launches and opens a web page at the URL you specify. Possible values include: OPEN_APP | DEEP_LINK | URL
 */
@property (nonatomic, assign) AWSPinpointTargetingAction action;

/**
 The message body of the notification.
 */
@property (nonatomic, strong) NSString * _Nullable body;

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
 This parameter specifies how long (in seconds) the message should be kept in Baidu storage if the device is offline. The and the default value and the maximum time to live supported is 7 days (604800 seconds)
 */
@property (nonatomic, strong) NSNumber * _Nullable timeToLive;

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
 The email message configuration.
 */
@interface AWSPinpointTargetingCampaignEmailMessage : AWSModel


/**
 The email text body.
 */
@property (nonatomic, strong) NSString * _Nullable body;

/**
 The email address used to send the email from. Defaults to use FromAddress specified in the Email Channel.
 */
@property (nonatomic, strong) NSString * _Nullable fromAddress;

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
 An object that defines the events that cause the campaign to be sent.
 */
@interface AWSPinpointTargetingCampaignEventFilter : AWSModel


/**
 An object that defines the dimensions for the event filter.
 */
@property (nonatomic, strong) AWSPinpointTargetingEventDimensions * _Nullable dimensions;

/**
 The type of event that causes the campaign to be sent. Possible values:SYSTEM - Send the campaign when a system event occurs. See the System resource for more information.ENDPOINT - Send the campaign when an endpoint event occurs. See the Event resource for more information.
 */
@property (nonatomic, assign) AWSPinpointTargetingFilterType filterType;

@end

/**
 Campaign hook information.
 */
@interface AWSPinpointTargetingCampaignHook : AWSModel


/**
 Lambda function name or arn to be called for delivery
 */
@property (nonatomic, strong) NSString * _Nullable lambdaFunctionName;

/**
 What mode Lambda should be invoked in.
 */
@property (nonatomic, assign) AWSPinpointTargetingMode mode;

/**
 Web URL to call for hook. If the URL has authentication specified it will be added as authentication to the request
 */
@property (nonatomic, strong) NSString * _Nullable webUrl;

@end

/**
 Campaign Limits are used to limit the number of messages that can be sent to a single endpoint.
 */
@interface AWSPinpointTargetingCampaignLimits : AWSModel


/**
 The maximum number of messages that each campaign can send to a single endpoint in a 24-hour period.
 */
@property (nonatomic, strong) NSNumber * _Nullable daily;

/**
 The length of time (in seconds) that the campaign can run before it ends and message deliveries stop. This duration begins at the scheduled start time for the campaign. The minimum value is 60.
 */
@property (nonatomic, strong) NSNumber * _Nullable maximumDuration;

/**
 The number of messages that the campaign can send per second. The minimum value is 50, and the maximum is 20000.
 */
@property (nonatomic, strong) NSNumber * _Nullable messagesPerSecond;

/**
 The maximum number of messages that an individual campaign can send to a single endpoint over the course of the campaign.
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
 Campaign hook information.
 */
@property (nonatomic, strong) AWSPinpointTargetingCampaignHook * _Nullable hook;

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
 Base definition for channel response.
 */
@interface AWSPinpointTargetingChannelResponse : AWSModel


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
 Not used. Retained for backwards compatibility.
 */
@property (nonatomic, strong) NSNumber * _Nullable hasCredential;

/**
 Channel ID. Not used, only for backwards compatibility.
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 Is this channel archived
 */
@property (nonatomic, strong) NSNumber * _Nullable isArchived;

/**
 Who made the last change
 */
@property (nonatomic, strong) NSString * _Nullable lastModifiedBy;

/**
 Last date this was updated
 */
@property (nonatomic, strong) NSString * _Nullable lastModifiedDate;

/**
 Version of channel
 */
@property (nonatomic, strong) NSNumber * _Nullable version;

@end

/**
 Get channels definition
 */
@interface AWSPinpointTargetingChannelsResponse : AWSModel


/**
 A map of channels, with the ChannelType as the key and the Channel as the value.
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSPinpointTargetingChannelResponse *> * _Nullable channels;

@end

/**
 
 */
@interface AWSPinpointTargetingCreateAppRequest : AWSRequest


/**
 Application Request.
 */
@property (nonatomic, strong) AWSPinpointTargetingCreateApplicationRequest * _Nullable createApplicationRequest;

@end

/**
 
 */
@interface AWSPinpointTargetingCreateAppResponse : AWSModel


/**
 Application Response.
 */
@property (nonatomic, strong) AWSPinpointTargetingApplicationResponse * _Nullable applicationResponse;

@end

/**
 Application Request.
 */
@interface AWSPinpointTargetingCreateApplicationRequest : AWSModel


/**
 The display name of the application. Used in the Amazon Pinpoint console.
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSPinpointTargetingCreateCampaignRequest : AWSRequest


/**
 The unique ID of your Amazon Pinpoint application.
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
@interface AWSPinpointTargetingCreateExportJobRequest : AWSRequest


/**
 The unique ID of your Amazon Pinpoint application.
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 Export job request.
 */
@property (nonatomic, strong) AWSPinpointTargetingExportJobRequest * _Nullable exportJobRequest;

@end

/**
 
 */
@interface AWSPinpointTargetingCreateExportJobResponse : AWSModel


/**
 Export job response.
 */
@property (nonatomic, strong) AWSPinpointTargetingExportJobResponse * _Nullable exportJobResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingCreateImportJobRequest : AWSRequest


/**
 The unique ID of your Amazon Pinpoint application.
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 Import job request.
 */
@property (nonatomic, strong) AWSPinpointTargetingImportJobRequest * _Nullable importJobRequest;

@end

/**
 
 */
@interface AWSPinpointTargetingCreateImportJobResponse : AWSModel


/**
 Import job response.
 */
@property (nonatomic, strong) AWSPinpointTargetingImportJobResponse * _Nullable importJobResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingCreateSegmentRequest : AWSRequest


/**
 The unique ID of your Amazon Pinpoint application.
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
 The default message to use across all channels.
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
 The message body of the notification.
 */
@property (nonatomic, strong) NSString * _Nullable body;

/**
 The data payload used for a silent push. This payload is added to the notifications' data.pinpoint.jsonBody' object
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable data;

/**
 Indicates if the message should display on the recipient's device. You can use silent pushes for remote configuration or to deliver messages to in-app notification centers.
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
@interface AWSPinpointTargetingDeleteAdmChannelRequest : AWSRequest


/**
 The unique ID of your Amazon Pinpoint application.
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

@end

/**
 
 */
@interface AWSPinpointTargetingDeleteAdmChannelResponse : AWSModel


/**
 Amazon Device Messaging channel definition.
 */
@property (nonatomic, strong) AWSPinpointTargetingADMChannelResponse * _Nullable ADMChannelResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingDeleteApnsChannelRequest : AWSRequest


/**
 The unique ID of your Amazon Pinpoint application.
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
 The unique ID of your Amazon Pinpoint application.
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
@interface AWSPinpointTargetingDeleteApnsVoipChannelRequest : AWSRequest


/**
 The unique ID of your Amazon Pinpoint application.
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

@end

/**
 
 */
@interface AWSPinpointTargetingDeleteApnsVoipChannelResponse : AWSModel


/**
 Apple VoIP Push Notification Service channel definition.
 */
@property (nonatomic, strong) AWSPinpointTargetingAPNSVoipChannelResponse * _Nullable APNSVoipChannelResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingDeleteApnsVoipSandboxChannelRequest : AWSRequest


/**
 The unique ID of your Amazon Pinpoint application.
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

@end

/**
 
 */
@interface AWSPinpointTargetingDeleteApnsVoipSandboxChannelResponse : AWSModel


/**
 Apple VoIP Developer Push Notification Service channel definition.
 */
@property (nonatomic, strong) AWSPinpointTargetingAPNSVoipSandboxChannelResponse * _Nullable APNSVoipSandboxChannelResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingDeleteAppRequest : AWSRequest


/**
 The unique ID of your Amazon Pinpoint application.
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

@end

/**
 
 */
@interface AWSPinpointTargetingDeleteAppResponse : AWSModel


/**
 Application Response.
 */
@property (nonatomic, strong) AWSPinpointTargetingApplicationResponse * _Nullable applicationResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingDeleteBaiduChannelRequest : AWSRequest


/**
 The unique ID of your Amazon Pinpoint application.
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

@end

/**
 
 */
@interface AWSPinpointTargetingDeleteBaiduChannelResponse : AWSModel


/**
 Baidu Cloud Messaging channel definition
 */
@property (nonatomic, strong) AWSPinpointTargetingBaiduChannelResponse * _Nullable baiduChannelResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingDeleteCampaignRequest : AWSRequest


/**
 The unique ID of your Amazon Pinpoint application.
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 The unique ID of the campaign.
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
 The unique ID of your Amazon Pinpoint application.
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
 
 */
@interface AWSPinpointTargetingDeleteEndpointRequest : AWSRequest


/**
 The unique ID of your Amazon Pinpoint application.
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 The unique ID of the endpoint.
 */
@property (nonatomic, strong) NSString * _Nullable endpointId;

@end

/**
 
 */
@interface AWSPinpointTargetingDeleteEndpointResponse : AWSModel


/**
 Endpoint response
 */
@property (nonatomic, strong) AWSPinpointTargetingEndpointResponse * _Nullable endpointResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingDeleteEventStreamRequest : AWSRequest


/**
 The unique ID of your Amazon Pinpoint application.
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

@end

/**
 
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
 The unique ID of your Amazon Pinpoint application.
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
 The unique ID of your Amazon Pinpoint application.
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 The unique ID of the segment.
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
 The unique ID of your Amazon Pinpoint application.
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
 
 */
@interface AWSPinpointTargetingDeleteUserEndpointsRequest : AWSRequest


/**
 The unique ID of your Amazon Pinpoint application.
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 The unique ID of the user.
 */
@property (nonatomic, strong) NSString * _Nullable userId;

@end

/**
 
 */
@interface AWSPinpointTargetingDeleteUserEndpointsResponse : AWSModel


/**
 List of endpoints
 */
@property (nonatomic, strong) AWSPinpointTargetingEndpointsResponse * _Nullable endpointsResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingDeleteVoiceChannelRequest : AWSRequest


/**
 The unique ID of your Amazon Pinpoint application.
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

@end

/**
 
 */
@interface AWSPinpointTargetingDeleteVoiceChannelResponse : AWSModel


/**
 Voice Channel Response.
 */
@property (nonatomic, strong) AWSPinpointTargetingVoiceChannelResponse * _Nullable voiceChannelResponse;

@end

/**
 Message definitions for the default message and any messages that are tailored for specific channels.
 */
@interface AWSPinpointTargetingDirectMessageConfiguration : AWSModel


/**
 The message to ADM channels. Overrides the default push notification message.
 */
@property (nonatomic, strong) AWSPinpointTargetingADMMessage * _Nullable ADMMessage;

/**
 The message to APNS channels. Overrides the default push notification message.
 */
@property (nonatomic, strong) AWSPinpointTargetingAPNSMessage * _Nullable APNSMessage;

/**
 The message to Baidu GCM channels. Overrides the default push notification message.
 */
@property (nonatomic, strong) AWSPinpointTargetingBaiduMessage * _Nullable baiduMessage;

/**
 The default message for all channels.
 */
@property (nonatomic, strong) AWSPinpointTargetingDefaultMessage * _Nullable defaultMessage;

/**
 The default push notification message for all push channels.
 */
@property (nonatomic, strong) AWSPinpointTargetingDefaultPushNotificationMessage * _Nullable defaultPushNotificationMessage;

/**
 The message to Email channels. Overrides the default message.
 */
@property (nonatomic, strong) AWSPinpointTargetingEmailMessage * _Nullable emailMessage;

/**
 The message to GCM channels. Overrides the default push notification message.
 */
@property (nonatomic, strong) AWSPinpointTargetingGCMMessage * _Nullable GCMMessage;

/**
 The message to SMS channels. Overrides the default message.
 */
@property (nonatomic, strong) AWSPinpointTargetingSMSMessage * _Nullable SMSMessage;

/**
 The message to Voice channels. Overrides the default message.
 */
@property (nonatomic, strong) AWSPinpointTargetingVoiceMessage * _Nullable voiceMessage;

@end

/**
 Email Channel Request
 */
@interface AWSPinpointTargetingEmailChannelRequest : AWSModel


/**
 The configuration set that you want to use when you send email using the Pinpoint Email API.
 */
@property (nonatomic, strong) NSString * _Nullable configurationSet;

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
 The unique ID of the application to which the email channel belongs.
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 The configuration set that you want to use when you send email using the Pinpoint Email API.
 */
@property (nonatomic, strong) NSString * _Nullable configurationSet;

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
 Not used. Retained for backwards compatibility.
 */
@property (nonatomic, strong) NSNumber * _Nullable hasCredential;

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
 Messages per second that can be sent
 */
@property (nonatomic, strong) NSNumber * _Nullable messagesPerSecond;

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
 Email Message.
 */
@interface AWSPinpointTargetingEmailMessage : AWSModel


/**
 The body of the email message.
 */
@property (nonatomic, strong) NSString * _Nullable body;

/**
 The email address that bounces and complaints will be forwarded to when feedback forwarding is enabled.
 */
@property (nonatomic, strong) NSString * _Nullable feedbackForwardingAddress;

/**
 The email address used to send the email from. Defaults to use FromAddress specified in the Email Channel.
 */
@property (nonatomic, strong) NSString * _Nullable fromAddress;

/**
 An email represented as a raw MIME message.
 */
@property (nonatomic, strong) AWSPinpointTargetingRawEmail * _Nullable rawEmail;

/**
 The reply-to email address(es) for the email. If the recipient replies to the email, each reply-to address will receive the reply.
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable replyToAddresses;

/**
 An email composed of a subject, a text part and a html part.
 */
@property (nonatomic, strong) AWSPinpointTargetingSimpleEmail * _Nullable simpleEmail;

/**
 Default message substitutions. Can be overridden by individual address substitutions.
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSArray<NSString *> *> * _Nullable substitutions;

@end

/**
 Endpoint update request
 */
@interface AWSPinpointTargetingEndpointBatchItem : AWSModel


/**
 The destination for messages that you send to this endpoint. The address varies by channel. For mobile push channels, use the token provided by the push notification service, such as the APNs device token or the FCM registration token. For the SMS channel, use a phone number in E.164 format, such as +12065550100. For the email channel, use an email address.
 */
@property (nonatomic, strong) NSString * _Nullable address;

/**
 Custom attributes that describe the endpoint by associating a name with an array of values. For example, an attribute named "interests" might have the values ["science", "politics", "travel"]. You can use these attributes as selection criteria when you create a segment of users to engage with a messaging campaign.The following characters are not recommended in attribute names: # : ? \ /. The Amazon Pinpoint console does not display attributes that include these characters in the name. This limitation does not apply to attribute values.
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSArray<NSString *> *> * _Nullable attributes;

/**
 The channel type.Valid values: GCM | APNS | APNS_SANDBOX | APNS_VOIP | APNS_VOIP_SANDBOX | ADM | SMS | EMAIL | BAIDU
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
 Unused.
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
 Indicates whether a user has opted out of receiving messages with one of the following values:ALL - User has opted out of all messages.NONE - Users has not opted out and receives all messages.
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
 Demographic information about the endpoint.
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
 The manufacturer of the endpoint device, such as Apple or Samsung.
 */
@property (nonatomic, strong) NSString * _Nullable make;

/**
 The model name or number of the endpoint device, such as iPhone.
 */
@property (nonatomic, strong) NSString * _Nullable model;

/**
 The model version of the endpoint device.
 */
@property (nonatomic, strong) NSString * _Nullable modelVersion;

/**
 The platform of the endpoint device, such as iOS or Android.
 */
@property (nonatomic, strong) NSString * _Nullable platform;

/**
 The platform version of the endpoint device.
 */
@property (nonatomic, strong) NSString * _Nullable platformVersion;

/**
 The timezone of the endpoint. Specified as a tz database value, such as Americas/Los_Angeles.
 */
@property (nonatomic, strong) NSString * _Nullable timezone;

@end

/**
 A complex object that holds the status code and message as a result of processing an endpoint.
 */
@interface AWSPinpointTargetingEndpointItemResponse : AWSModel


/**
 A custom message associated with the registration of an endpoint when issuing a response.
 */
@property (nonatomic, strong) NSString * _Nullable message;

/**
 The status code associated with the merging of an endpoint when issuing a response.
 */
@property (nonatomic, strong) NSNumber * _Nullable statusCode;

@end

/**
 Location data for the endpoint.
 */
@interface AWSPinpointTargetingEndpointLocation : AWSModel


/**
 The city where the endpoint is located.
 */
@property (nonatomic, strong) NSString * _Nullable city;

/**
 The two-letter code for the country or region of the endpoint. Specified as an ISO 3166-1 alpha-2 code, such as "US" for the United States.
 */
@property (nonatomic, strong) NSString * _Nullable country;

/**
 The latitude of the endpoint location, rounded to one decimal place.
 */
@property (nonatomic, strong) NSNumber * _Nullable latitude;

/**
 The longitude of the endpoint location, rounded to one decimal place.
 */
@property (nonatomic, strong) NSNumber * _Nullable longitude;

/**
 The postal code or zip code of the endpoint.
 */
@property (nonatomic, strong) NSString * _Nullable postalCode;

/**
 The region of the endpoint location. For example, in the United States, this corresponds to a state.
 */
@property (nonatomic, strong) NSString * _Nullable region;

@end

/**
 The result from sending a message to an endpoint.
 */
@interface AWSPinpointTargetingEndpointMessageResult : AWSModel


/**
 Address that endpoint message was delivered to.
 */
@property (nonatomic, strong) NSString * _Nullable address;

/**
 The delivery status of the message. Possible values:SUCCESS - The message was successfully delivered to the endpoint.TRANSIENT_FAILURE - A temporary error occurred. Amazon Pinpoint will attempt to deliver the message again later.FAILURE_PERMANENT - An error occurred when delivering the message to the endpoint. Amazon Pinpoint won't attempt to send the message again.TIMEOUT - The message couldn't be sent within the timeout period.QUIET_TIME - The local time for the endpoint was within the QuietTime for the campaign or app.DAILY_CAP - The endpoint has received the maximum number of messages it can receive within a 24-hour period.HOLDOUT - The endpoint was in a hold out treatment for the campaign.THROTTLED - Amazon Pinpoint throttled sending to this endpoint.EXPIRED - The endpoint address is expired.CAMPAIGN_CAP - The endpoint received the maximum number of messages allowed by the campaign.SERVICE_FAILURE - A service-level failure prevented Amazon Pinpoint from delivering the message.UNKNOWN - An unknown error occurred.
 */
@property (nonatomic, assign) AWSPinpointTargetingDeliveryStatus deliveryStatus;

/**
 Unique message identifier associated with the message that was sent.
 */
@property (nonatomic, strong) NSString * _Nullable messageId;

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
 An endpoint update request.
 */
@interface AWSPinpointTargetingEndpointRequest : AWSModel


/**
 The destination for messages that you send to this endpoint. The address varies by channel. For mobile push channels, use the token provided by the push notification service, such as the APNs device token or the FCM registration token. For the SMS channel, use a phone number in E.164 format, such as +12065550100. For the email channel, use an email address.
 */
@property (nonatomic, strong) NSString * _Nullable address;

/**
 Custom attributes that describe the endpoint by associating a name with an array of values. For example, an attribute named "interests" might have the values ["science", "politics", "travel"]. You can use these attributes as selection criteria when you create a segment of users to engage with a messaging campaign.The following characters are not recommended in attribute names: # : ? \ /. The Amazon Pinpoint console does not display attributes that include these characters in the name. This limitation does not apply to attribute values.
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSArray<NSString *> *> * _Nullable attributes;

/**
 The channel type.Valid values: GCM | APNS | APNS_SANDBOX | APNS_VOIP | APNS_VOIP_SANDBOX | ADM | SMS | EMAIL | BAIDU
 */
@property (nonatomic, assign) AWSPinpointTargetingChannelType channelType;

/**
 Demographic attributes for the endpoint.
 */
@property (nonatomic, strong) AWSPinpointTargetingEndpointDemographic * _Nullable demographic;

/**
 The date and time when the endpoint was updated, shown in ISO 8601 format.
 */
@property (nonatomic, strong) NSString * _Nullable effectiveDate;

/**
 Unused.
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
 Indicates whether a user has opted out of receiving messages with one of the following values:ALL - User has opted out of all messages.NONE - Users has not opted out and receives all messages.
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
 The address of the endpoint as provided by your push provider. For example, the DeviceToken or RegistrationId.
 */
@property (nonatomic, strong) NSString * _Nullable address;

/**
 The ID of the application that is associated with the endpoint.
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 Custom attributes that describe the endpoint by associating a name with an array of values. For example, an attribute named "interests" might have the following values: ["science", "politics", "travel"]. You can use these attributes as selection criteria when you create segments.The Amazon Pinpoint console can't display attribute names that include the following characters: hash/pound sign (#), colon (:), question mark (?), backslash (\), and forward slash (/). For this reason, you should avoid using these characters in the names of custom attributes.
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSArray<NSString *> *> * _Nullable attributes;

/**
 The channel type.Valid values: GCM | APNS | APNS_SANDBOX | APNS_VOIP | APNS_VOIP_SANDBOX | ADM | SMS | EMAIL | BAIDU
 */
@property (nonatomic, assign) AWSPinpointTargetingChannelType channelType;

/**
 A number from 0-99 that represents the cohort the endpoint is assigned to. Endpoints are grouped into cohorts randomly, and each cohort contains approximately 1 percent of the endpoints for an app. Amazon Pinpoint assigns cohorts to the holdout or treatment allocations for a campaign.
 */
@property (nonatomic, strong) NSString * _Nullable cohortId;

/**
 The date and time when the endpoint was created, shown in ISO 8601 format.
 */
@property (nonatomic, strong) NSString * _Nullable creationDate;

/**
 The endpoint demographic attributes.
 */
@property (nonatomic, strong) AWSPinpointTargetingEndpointDemographic * _Nullable demographic;

/**
 The date and time when the endpoint was last updated, shown in ISO 8601 format.
 */
@property (nonatomic, strong) NSString * _Nullable effectiveDate;

/**
 Unused.
 */
@property (nonatomic, strong) NSString * _Nullable endpointStatus;

/**
 The unique ID that you assigned to the endpoint. The ID should be a globally unique identifier (GUID) to ensure that it doesn't conflict with other endpoint IDs associated with the application.
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
 Indicates whether a user has opted out of receiving messages with one of the following values:ALL - User has opted out of all messages.NONE - Users has not opted out and receives all messages.
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
 Endpoint send configuration.
 */
@interface AWSPinpointTargetingEndpointSendConfiguration : AWSModel


/**
 Body override. If specified will override default body.
 */
@property (nonatomic, strong) NSString * _Nullable bodyOverride;

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
 Endpoint user specific custom userAttributes
 */
@interface AWSPinpointTargetingEndpointUser : AWSModel


/**
 Custom attributes that describe the user by associating a name with an array of values. For example, an attribute named "interests" might have the following values: ["science", "politics", "travel"]. You can use these attributes as selection criteria when you create segments.The Amazon Pinpoint console can't display attribute names that include the following characters: hash/pound sign (#), colon (:), question mark (?), backslash (\), and forward slash (/). For this reason, you should avoid using these characters in the names of custom attributes.
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSArray<NSString *> *> * _Nullable userAttributes;

/**
 The unique ID of the user.
 */
@property (nonatomic, strong) NSString * _Nullable userId;

@end

/**
 List of endpoints
 */
@interface AWSPinpointTargetingEndpointsResponse : AWSModel


/**
 The list of endpoints.
 */
@property (nonatomic, strong) NSArray<AWSPinpointTargetingEndpointResponse *> * _Nullable item;

@end

/**
 Model for creating or updating events.
 */
@interface AWSPinpointTargetingEvent : AWSModel


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable appPackageName;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable appTitle;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable appVersionCode;

/**
 Custom attributes that are associated with the event you're adding or updating.
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable attributes;

/**
 The version of the SDK that's running on the client device.
 */
@property (nonatomic, strong) NSString * _Nullable clientSdkVersion;

/**
 The name of the custom event that you're recording.
 */
@property (nonatomic, strong) NSString * _Nullable eventType;

/**
 Custom metrics related to the event.
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSNumber *> * _Nullable metrics;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable sdkName;

/**
 Information about the session in which the event occurred.
 */
@property (nonatomic, strong) AWSPinpointTargetingSession * _Nullable session;

/**
 The date and time when the event occurred, in ISO 8601 format.
 */
@property (nonatomic, strong) NSString * _Nullable timestamp;

@end

/**
 Event dimensions.
 */
@interface AWSPinpointTargetingEventDimensions : AWSModel


/**
 Custom attributes that your app reports to Amazon Pinpoint. You can use these attributes as selection criteria when you create an event filter.
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSPinpointTargetingAttributeDimension *> * _Nullable attributes;

/**
 The name of the event that causes the campaign to be sent. This can be a standard event type that Amazon Pinpoint generates, such as _session.start, or a custom event that's specific to your app.
 */
@property (nonatomic, strong) AWSPinpointTargetingSetDimension * _Nullable eventType;

/**
 Custom metrics that your app reports to Amazon Pinpoint. You can use these attributes as selection criteria when you create an event filter.
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSPinpointTargetingMetricDimension *> * _Nullable metrics;

@end

/**
 A complex object that holds the status code and message as a result of processing an event.
 */
@interface AWSPinpointTargetingEventItemResponse : AWSModel


/**
 A custom message that is associated with the processing of an event.
 */
@property (nonatomic, strong) NSString * _Nullable message;

/**
 The status returned in the response as a result of processing the event.Possible values: 400 (for invalid events) and 202 (for events that were accepted).
 */
@property (nonatomic, strong) NSNumber * _Nullable statusCode;

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
 (Deprecated) Your AWS account ID, which you assigned to the ExternalID key in an IAM trust policy. Used by Amazon Pinpoint to assume an IAM role. This requirement is removed, and external IDs are not recommended for IAM roles assumed by Amazon Pinpoint.
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
 A batch of PublicEndpoints and Events to process.
 */
@interface AWSPinpointTargetingEventsBatch : AWSModel


/**
 The PublicEndpoint attached to the EndpointId from the request.
 */
@property (nonatomic, strong) AWSPinpointTargetingPublicEndpoint * _Nullable endpoint;

/**
 An object that contains a set of events associated with the endpoint.
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSPinpointTargetingEvent *> * _Nullable events;

@end

/**
 A set of events to process.
 */
@interface AWSPinpointTargetingEventsRequest : AWSModel


/**
 A batch of events to process. Each BatchItem consists of an endpoint ID as the key, and an EventsBatch object as the value.
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSPinpointTargetingEventsBatch *> * _Nullable batchItem;

@end

/**
 Custom messages associated with events.
 */
@interface AWSPinpointTargetingEventsResponse : AWSModel


/**
 A map that contains a multipart response for each endpoint. Each item in this object uses the endpoint ID as the key, and the item response as the value.If no item response exists, the value can also be one of the following: 202 (if the request was processed successfully) or 400 (if the payload was invalid, or required fields were missing).
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSPinpointTargetingItemResponse *> * _Nullable results;

@end

/**
 Export job request.
 */
@interface AWSPinpointTargetingExportJobRequest : AWSModel


/**
 The Amazon Resource Name (ARN) of an IAM role that grants Amazon Pinpoint access to the Amazon S3 location that endpoints will be exported to.
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 A URL that points to the location within an Amazon S3 bucket that will receive the export. The location is typically a folder with multiple files.The URL should follow this format: s3://bucket-name/folder-name/Amazon Pinpoint will export endpoints to this location.
 */
@property (nonatomic, strong) NSString * _Nullable s3UrlPrefix;

/**
 The ID of the segment to export endpoints from. If not present, Amazon Pinpoint exports all of the endpoints that belong to the application.
 */
@property (nonatomic, strong) NSString * _Nullable segmentId;

/**
 The version of the segment to export if specified.
 */
@property (nonatomic, strong) NSNumber * _Nullable segmentVersion;

@end

/**
 Export job resource.
 */
@interface AWSPinpointTargetingExportJobResource : AWSModel


/**
 The Amazon Resource Name (ARN) of an IAM role that grants Amazon Pinpoint access to the Amazon S3 location that endpoints will be exported to.
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 A URL that points to the location within an Amazon S3 bucket that will receive the export. The location is typically a folder with multiple files.The URL should follow this format: s3://bucket-name/folder-name/Amazon Pinpoint will export endpoints to this location.
 */
@property (nonatomic, strong) NSString * _Nullable s3UrlPrefix;

/**
 The ID of the segment to export endpoints from. If not present, Amazon Pinpoint exports all of the endpoints that belong to the application.
 */
@property (nonatomic, strong) NSString * _Nullable segmentId;

/**
 The version of the segment to export if specified.
 */
@property (nonatomic, strong) NSNumber * _Nullable segmentVersion;

@end

/**
 Export job response.
 */
@interface AWSPinpointTargetingExportJobResponse : AWSModel


/**
 The unique ID of the application associated with the export job.
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 The number of pieces that have successfully completed as of the time of the request.
 */
@property (nonatomic, strong) NSNumber * _Nullable completedPieces;

/**
 The date the job completed in ISO 8601 format.
 */
@property (nonatomic, strong) NSString * _Nullable completionDate;

/**
 The date the job was created in ISO 8601 format.
 */
@property (nonatomic, strong) NSString * _Nullable creationDate;

/**
 The export job settings.
 */
@property (nonatomic, strong) AWSPinpointTargetingExportJobResource * _Nullable definition;

/**
 The number of pieces that failed to be processed as of the time of the request.
 */
@property (nonatomic, strong) NSNumber * _Nullable failedPieces;

/**
 Provides up to 100 of the first failed entries for the job, if any exist.
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable failures;

/**
 The unique ID of the job.
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 The status of the job. Valid values: CREATED, INITIALIZING, PROCESSING, COMPLETING, COMPLETED, FAILING, FAILEDThe job status is FAILED if one or more pieces failed.
 */
@property (nonatomic, assign) AWSPinpointTargetingJobStatus jobStatus;

/**
 The number of endpoints that were not processed; for example, because of syntax errors.
 */
@property (nonatomic, strong) NSNumber * _Nullable totalFailures;

/**
 The total number of pieces that must be processed to finish the job. Each piece is an approximately equal portion of the endpoints.
 */
@property (nonatomic, strong) NSNumber * _Nullable totalPieces;

/**
 The number of endpoints that were processed by the job.
 */
@property (nonatomic, strong) NSNumber * _Nullable totalProcessed;

/**
 The job type. Will be 'EXPORT'.
 */
@property (nonatomic, strong) NSString * _Nullable types;

@end

/**
 Export job list.
 */
@interface AWSPinpointTargetingExportJobsResponse : AWSModel


/**
 A list of export jobs for the application.
 */
@property (nonatomic, strong) NSArray<AWSPinpointTargetingExportJobResponse *> * _Nullable item;

/**
 The string that you use in a subsequent request to get the next page of results in a paginated response.
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

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
 Not used. Retained for backwards compatibility.
 */
@property (nonatomic, strong) NSNumber * _Nullable hasCredential;

/**
 Channel ID. Not used. Present only for backwards compatibility.
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
 The message body of the notification.
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
 The message priority. Amazon Pinpoint uses this value to set the FCM or GCM priority parameter when it sends the message. Accepts the following values:"Normal" - Messages might be delayed. Delivery is optimized for battery usage on the receiving device. Use normal priority unless immediate delivery is required."High" - Messages are sent immediately and might wake a sleeping device.The equivalent values for APNs messages are "5" and "10". Amazon Pinpoint accepts these values here and converts them.For more information, see About FCM Messages in the Firebase documentation.
 */
@property (nonatomic, strong) NSString * _Nullable priority;

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
 The length of time (in seconds) that FCM or GCM stores and attempts to deliver the message. If unspecified, the value defaults to the maximum, which is 2,419,200 seconds (28 days). Amazon Pinpoint uses this value to set the FCM or GCM time_to_live parameter.
 */
@property (nonatomic, strong) NSNumber * _Nullable timeToLive;

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
 GPS coordinates
 */
@interface AWSPinpointTargetingGPSCoordinates : AWSModel


/**
 Latitude
 */
@property (nonatomic, strong) NSNumber * _Nullable latitude;

/**
 Longitude
 */
@property (nonatomic, strong) NSNumber * _Nullable longitude;

@end

/**
 GPS point location dimension
 */
@interface AWSPinpointTargetingGPSPointDimension : AWSModel


/**
 Coordinate to measure distance from.
 */
@property (nonatomic, strong) AWSPinpointTargetingGPSCoordinates * _Nullable coordinates;

/**
 Range in kilometers from the coordinate.
 */
@property (nonatomic, strong) NSNumber * _Nullable rangeInKilometers;

@end

/**
 
 */
@interface AWSPinpointTargetingGetAdmChannelRequest : AWSRequest


/**
 The unique ID of your Amazon Pinpoint application.
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

@end

/**
 
 */
@interface AWSPinpointTargetingGetAdmChannelResponse : AWSModel


/**
 Amazon Device Messaging channel definition.
 */
@property (nonatomic, strong) AWSPinpointTargetingADMChannelResponse * _Nullable ADMChannelResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingGetApnsChannelRequest : AWSRequest


/**
 The unique ID of your Amazon Pinpoint application.
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
 The unique ID of your Amazon Pinpoint application.
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
@interface AWSPinpointTargetingGetApnsVoipChannelRequest : AWSRequest


/**
 The unique ID of your Amazon Pinpoint application.
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

@end

/**
 
 */
@interface AWSPinpointTargetingGetApnsVoipChannelResponse : AWSModel


/**
 Apple VoIP Push Notification Service channel definition.
 */
@property (nonatomic, strong) AWSPinpointTargetingAPNSVoipChannelResponse * _Nullable APNSVoipChannelResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingGetApnsVoipSandboxChannelRequest : AWSRequest


/**
 The unique ID of your Amazon Pinpoint application.
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

@end

/**
 
 */
@interface AWSPinpointTargetingGetApnsVoipSandboxChannelResponse : AWSModel


/**
 Apple VoIP Developer Push Notification Service channel definition.
 */
@property (nonatomic, strong) AWSPinpointTargetingAPNSVoipSandboxChannelResponse * _Nullable APNSVoipSandboxChannelResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingGetAppRequest : AWSRequest


/**
 The unique ID of your Amazon Pinpoint application.
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

@end

/**
 
 */
@interface AWSPinpointTargetingGetAppResponse : AWSModel


/**
 Application Response.
 */
@property (nonatomic, strong) AWSPinpointTargetingApplicationResponse * _Nullable applicationResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingGetApplicationSettingsRequest : AWSRequest


/**
 The unique ID of your Amazon Pinpoint application.
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
@interface AWSPinpointTargetingGetAppsRequest : AWSRequest


/**
 The number of entries you want on each page in the response.
 */
@property (nonatomic, strong) NSString * _Nullable pageSize;

/**
 The NextToken string returned on a previous page that you use to get the next page of results in a paginated response.
 */
@property (nonatomic, strong) NSString * _Nullable token;

@end

/**
 
 */
@interface AWSPinpointTargetingGetAppsResponse : AWSModel


/**
 Get Applications Result.
 */
@property (nonatomic, strong) AWSPinpointTargetingApplicationsResponse * _Nullable applicationsResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingGetBaiduChannelRequest : AWSRequest


/**
 The unique ID of your Amazon Pinpoint application.
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

@end

/**
 
 */
@interface AWSPinpointTargetingGetBaiduChannelResponse : AWSModel


/**
 Baidu Cloud Messaging channel definition
 */
@property (nonatomic, strong) AWSPinpointTargetingBaiduChannelResponse * _Nullable baiduChannelResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingGetCampaignActivitiesRequest : AWSRequest


/**
 The unique ID of your Amazon Pinpoint application.
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 The unique ID of the campaign.
 */
@property (nonatomic, strong) NSString * _Nullable campaignId;

/**
 The number of entries you want on each page in the response.
 */
@property (nonatomic, strong) NSString * _Nullable pageSize;

/**
 The NextToken string returned on a previous page that you use to get the next page of results in a paginated response.
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
 The unique ID of your Amazon Pinpoint application.
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 The unique ID of the campaign.
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
 The unique ID of your Amazon Pinpoint application.
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 The unique ID of the campaign.
 */
@property (nonatomic, strong) NSString * _Nullable campaignId;

/**
 The version of the campaign.
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
 The unique ID of your Amazon Pinpoint application.
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 The unique ID of the campaign.
 */
@property (nonatomic, strong) NSString * _Nullable campaignId;

/**
 The number of entries you want on each page in the response.
 */
@property (nonatomic, strong) NSString * _Nullable pageSize;

/**
 The NextToken string returned on a previous page that you use to get the next page of results in a paginated response.
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
 The unique ID of your Amazon Pinpoint application.
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 The number of entries you want on each page in the response.
 */
@property (nonatomic, strong) NSString * _Nullable pageSize;

/**
 The NextToken string returned on a previous page that you use to get the next page of results in a paginated response.
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
@interface AWSPinpointTargetingGetChannelsRequest : AWSRequest


/**
 The unique ID of your Amazon Pinpoint application.
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

@end

/**
 
 */
@interface AWSPinpointTargetingGetChannelsResponse : AWSModel


/**
 Get channels definition
 */
@property (nonatomic, strong) AWSPinpointTargetingChannelsResponse * _Nullable channelsResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingGetEmailChannelRequest : AWSRequest


/**
 The unique ID of your Amazon Pinpoint application.
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
 The unique ID of your Amazon Pinpoint application.
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 The unique ID of the endpoint.
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
 
 */
@interface AWSPinpointTargetingGetEventStreamRequest : AWSRequest


/**
 The unique ID of your Amazon Pinpoint application.
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

@end

/**
 
 */
@interface AWSPinpointTargetingGetEventStreamResponse : AWSModel


/**
 Model for an event publishing subscription export.
 */
@property (nonatomic, strong) AWSPinpointTargetingEventStream * _Nullable eventStream;

@end

/**
 
 */
@interface AWSPinpointTargetingGetExportJobRequest : AWSRequest


/**
 The unique ID of your Amazon Pinpoint application.
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 The unique ID of the job.
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

@end

/**
 
 */
@interface AWSPinpointTargetingGetExportJobResponse : AWSModel


/**
 Export job response.
 */
@property (nonatomic, strong) AWSPinpointTargetingExportJobResponse * _Nullable exportJobResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingGetExportJobsRequest : AWSRequest


/**
 The unique ID of your Amazon Pinpoint application.
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 The number of entries you want on each page in the response.
 */
@property (nonatomic, strong) NSString * _Nullable pageSize;

/**
 The NextToken string returned on a previous page that you use to get the next page of results in a paginated response.
 */
@property (nonatomic, strong) NSString * _Nullable token;

@end

/**
 
 */
@interface AWSPinpointTargetingGetExportJobsResponse : AWSModel


/**
 Export job list.
 */
@property (nonatomic, strong) AWSPinpointTargetingExportJobsResponse * _Nullable exportJobsResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingGetGcmChannelRequest : AWSRequest


/**
 The unique ID of your Amazon Pinpoint application.
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
 The unique ID of your Amazon Pinpoint application.
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 The unique ID of the job.
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

@end

/**
 
 */
@interface AWSPinpointTargetingGetImportJobResponse : AWSModel


/**
 Import job response.
 */
@property (nonatomic, strong) AWSPinpointTargetingImportJobResponse * _Nullable importJobResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingGetImportJobsRequest : AWSRequest


/**
 The unique ID of your Amazon Pinpoint application.
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 The number of entries you want on each page in the response.
 */
@property (nonatomic, strong) NSString * _Nullable pageSize;

/**
 The NextToken string returned on a previous page that you use to get the next page of results in a paginated response.
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
@interface AWSPinpointTargetingGetSegmentExportJobsRequest : AWSRequest


/**
 The unique ID of your Amazon Pinpoint application.
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 The number of entries you want on each page in the response.
 */
@property (nonatomic, strong) NSString * _Nullable pageSize;

/**
 The unique ID of the segment.
 */
@property (nonatomic, strong) NSString * _Nullable segmentId;

/**
 The NextToken string returned on a previous page that you use to get the next page of results in a paginated response.
 */
@property (nonatomic, strong) NSString * _Nullable token;

@end

/**
 
 */
@interface AWSPinpointTargetingGetSegmentExportJobsResponse : AWSModel


/**
 Export job list.
 */
@property (nonatomic, strong) AWSPinpointTargetingExportJobsResponse * _Nullable exportJobsResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingGetSegmentImportJobsRequest : AWSRequest


/**
 The unique ID of your Amazon Pinpoint application.
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 The number of entries you want on each page in the response.
 */
@property (nonatomic, strong) NSString * _Nullable pageSize;

/**
 The unique ID of the segment.
 */
@property (nonatomic, strong) NSString * _Nullable segmentId;

/**
 The NextToken string returned on a previous page that you use to get the next page of results in a paginated response.
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
 The unique ID of your Amazon Pinpoint application.
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 The unique ID of the segment.
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
 The unique ID of your Amazon Pinpoint application.
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 The unique ID of the segment.
 */
@property (nonatomic, strong) NSString * _Nullable segmentId;

/**
 The segment version.
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
 The unique ID of your Amazon Pinpoint application.
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 The number of entries you want on each page in the response.
 */
@property (nonatomic, strong) NSString * _Nullable pageSize;

/**
 The unique ID of the segment.
 */
@property (nonatomic, strong) NSString * _Nullable segmentId;

/**
 The NextToken string returned on a previous page that you use to get the next page of results in a paginated response.
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
 The unique ID of your Amazon Pinpoint application.
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 The number of entries you want on each page in the response.
 */
@property (nonatomic, strong) NSString * _Nullable pageSize;

/**
 The NextToken string returned on a previous page that you use to get the next page of results in a paginated response.
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
 The unique ID of your Amazon Pinpoint application.
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
@interface AWSPinpointTargetingGetUserEndpointsRequest : AWSRequest


/**
 The unique ID of your Amazon Pinpoint application.
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 The unique ID of the user.
 */
@property (nonatomic, strong) NSString * _Nullable userId;

@end

/**
 
 */
@interface AWSPinpointTargetingGetUserEndpointsResponse : AWSModel


/**
 List of endpoints
 */
@property (nonatomic, strong) AWSPinpointTargetingEndpointsResponse * _Nullable endpointsResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingGetVoiceChannelRequest : AWSRequest


/**
 The unique ID of your Amazon Pinpoint application.
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

@end

/**
 
 */
@interface AWSPinpointTargetingGetVoiceChannelResponse : AWSModel


/**
 Voice Channel Response.
 */
@property (nonatomic, strong) AWSPinpointTargetingVoiceChannelResponse * _Nullable voiceChannelResponse;

@end

/**
 Import job request.
 */
@interface AWSPinpointTargetingImportJobRequest : AWSModel


/**
 Sets whether the endpoints create a segment when they are imported.
 */
@property (nonatomic, strong) NSNumber * _Nullable defineSegment;

/**
 (Deprecated) Your AWS account ID, which you assigned to the ExternalID key in an IAM trust policy. Used by Amazon Pinpoint to assume an IAM role. This requirement is removed, and external IDs are not recommended for IAM roles assumed by Amazon Pinpoint.
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
 The URL of the S3 bucket that contains the segment information to import. The location can be a folder or a single file. The URL should use the following format: s3://bucket-name/folder-name/file-nameAmazon Pinpoint imports endpoints from this location and any subfolders it contains.
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
 Import job resource
 */
@interface AWSPinpointTargetingImportJobResource : AWSModel


/**
 Sets whether the endpoints create a segment when they are imported.
 */
@property (nonatomic, strong) NSNumber * _Nullable defineSegment;

/**
 (Deprecated) Your AWS account ID, which you assigned to the ExternalID key in an IAM trust policy. Used by Amazon Pinpoint to assume an IAM role. This requirement is removed, and external IDs are not recommended for IAM roles assumed by Amazon Pinpoint.
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
 The URL of the S3 bucket that contains the segment information to import. The location can be a folder or a single file. The URL should use the following format: s3://bucket-name/folder-name/file-nameAmazon Pinpoint imports endpoints from this location and any subfolders it contains.
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
 Import job response.
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
 The response that's provided after registering the endpoint.
 */
@interface AWSPinpointTargetingItemResponse : AWSModel


/**
 The response received after the endpoint was accepted.
 */
@property (nonatomic, strong) AWSPinpointTargetingEndpointItemResponse * _Nullable endpointItemResponse;

/**
 A multipart response object that contains a key and value for each event ID in the request. In each object, the event ID is the key, and an EventItemResponse object is the value.
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSPinpointTargetingEventItemResponse *> * _Nullable eventsItemResponse;

@end

/**
 Message to send
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
 A URL that refers to the location of an image or video that you want to display in the push notification.
 */
@property (nonatomic, strong) NSString * _Nullable mediaUrl;

/**
 The Raw JSON formatted string to be used as the payload. This value overrides the message.
 */
@property (nonatomic, strong) NSString * _Nullable rawContent;

/**
 Indicates if the message should display on the users device.Silent pushes can be used for Remote Configuration and Phone Home use cases. 
 */
@property (nonatomic, strong) NSNumber * _Nullable silentPush;

/**
 This parameter specifies how long (in seconds) the message should be kept if the service is unable to deliver the notification the first time. If the value is 0, it treats the notification as if it expires immediately and does not store the notification or attempt to redeliver it. This value is converted to the expiration field when sent to the service. It only applies to APNs and GCM
 */
@property (nonatomic, strong) NSNumber * _Nullable timeToLive;

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
 The error message that's returned from the API.
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
 The message that the campaign delivers to ADM channels. Overrides the default message.
 */
@property (nonatomic, strong) AWSPinpointTargetingMessage * _Nullable ADMMessage;

/**
 The message that the campaign delivers to APNS channels. Overrides the default message.
 */
@property (nonatomic, strong) AWSPinpointTargetingMessage * _Nullable APNSMessage;

/**
 The message that the campaign delivers to Baidu channels. Overrides the default message.
 */
@property (nonatomic, strong) AWSPinpointTargetingMessage * _Nullable baiduMessage;

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
 A map of key-value pairs, where each key is an address and each value is an AddressConfiguration object. An address can be a push notification token, a phone number, or an email address.
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSPinpointTargetingAddressConfiguration *> * _Nullable addresses;

/**
 A map of custom attributes to attributes to be attached to the message. This payload is added to the push notification's 'data.pinpoint' object or added to the email/sms delivery receipt event attributes.
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable context;

/**
 A map of key-value pairs, where each key is an endpoint ID and each value is an EndpointSendConfiguration object. Within an EndpointSendConfiguration object, you can tailor the message for an endpoint by specifying message overrides or substitutions.
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSPinpointTargetingEndpointSendConfiguration *> * _Nullable endpoints;

/**
 Message configuration.
 */
@property (nonatomic, strong) AWSPinpointTargetingDirectMessageConfiguration * _Nullable messageConfiguration;

/**
 A unique ID that you can use to trace a message. This ID is visible to recipients.
 */
@property (nonatomic, strong) NSString * _Nullable traceId;

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
 A map containing a multi part response for each address, with the endpointId as the key and the result as the value.
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSPinpointTargetingEndpointMessageResult *> * _Nullable endpointResult;

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
 The delivery status of the message. Possible values:SUCCESS - The message was successfully delivered to the endpoint.TRANSIENT_FAILURE - A temporary error occurred. Amazon Pinpoint will attempt to deliver the message again later.FAILURE_PERMANENT - An error occurred when delivering the message to the endpoint. Amazon Pinpoint won't attempt to send the message again.TIMEOUT - The message couldn't be sent within the timeout period.QUIET_TIME - The local time for the endpoint was within the QuietTime for the campaign or app.DAILY_CAP - The endpoint has received the maximum number of messages it can receive within a 24-hour period.HOLDOUT - The endpoint was in a hold out treatment for the campaign.THROTTLED - Amazon Pinpoint throttled sending to this endpoint.EXPIRED - The endpoint address is expired.CAMPAIGN_CAP - The endpoint received the maximum number of messages allowed by the campaign.SERVICE_FAILURE - A service-level failure prevented Amazon Pinpoint from delivering the message.UNKNOWN - An unknown error occurred.
 */
@property (nonatomic, assign) AWSPinpointTargetingDeliveryStatus deliveryStatus;

/**
 Unique message identifier associated with the message that was sent.
 */
@property (nonatomic, strong) NSString * _Nullable messageId;

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
 Custom metric dimension
 */
@interface AWSPinpointTargetingMetricDimension : AWSModel


/**
 The operator that you're using to compare metric values. Possible values: GREATER_THAN, LESS_THAN, GREATER_THAN_OR_EQUAL, LESS_THAN_OR_EQUAL, or EQUAL
 */
@property (nonatomic, strong) NSString * _Nullable comparisonOperator;

/**
 The value to be compared.
 */
@property (nonatomic, strong) NSNumber * _Nullable value;

@end

/**
 Phone Number Validate request.
 */
@interface AWSPinpointTargetingNumberValidateRequest : AWSModel


/**
 (Optional) The two-character ISO country code for the country or region where the phone number was originally registered.
 */
@property (nonatomic, strong) NSString * _Nullable isoCountryCode;

/**
 The phone number to get information about. The phone number that you provide should include a country code. If the number doesn't include a valid country code, the operation might result in an error.
 */
@property (nonatomic, strong) NSString * _Nullable phoneNumber;

@end

/**
 Phone Number Validate response.
 */
@interface AWSPinpointTargetingNumberValidateResponse : AWSModel


/**
 The carrier or servive provider that the phone number is currently registered with.
 */
@property (nonatomic, strong) NSString * _Nullable carrier;

/**
 The city where the phone number was originally registered.
 */
@property (nonatomic, strong) NSString * _Nullable city;

/**
 The cleansed phone number, shown in E.164 format.
 */
@property (nonatomic, strong) NSString * _Nullable cleansedPhoneNumberE164;

/**
 The cleansed phone number, shown in the local phone number format.
 */
@property (nonatomic, strong) NSString * _Nullable cleansedPhoneNumberNational;

/**
 The country or region where the phone number was originally registered.
 */
@property (nonatomic, strong) NSString * _Nullable country;

/**
 The two-character ISO code for the country or region where the phone number was originally registered.
 */
@property (nonatomic, strong) NSString * _Nullable countryCodeIso2;

/**
 The numeric code for the country or region where the phone number was originally registered.
 */
@property (nonatomic, strong) NSString * _Nullable countryCodeNumeric;

/**
 The county where the phone number was originally registered.
 */
@property (nonatomic, strong) NSString * _Nullable county;

/**
 The two-character code (in ISO 3166-1 alpha-2 format) for the country or region in the request body.
 */
@property (nonatomic, strong) NSString * _Nullable originalCountryCodeIso2;

/**
 The phone number that you included in the request body.
 */
@property (nonatomic, strong) NSString * _Nullable originalPhoneNumber;

/**
 A description of the phone type. Possible values are MOBILE, LANDLINE, VOIP, INVALID, PREPAID, and OTHER.
 */
@property (nonatomic, strong) NSString * _Nullable phoneType;

/**
 The phone type, represented by an integer. Possible values include 0 (MOBILE), 1 (LANDLINE), 2 (VOIP), 3 (INVALID), 4 (OTHER), and 5 (PREPAID).
 */
@property (nonatomic, strong) NSNumber * _Nullable phoneTypeCode;

/**
 The time zone for the location where the phone number was originally registered.
 */
@property (nonatomic, strong) NSString * _Nullable timezone;

/**
 The postal code for the location where the phone number was originally registered.
 */
@property (nonatomic, strong) NSString * _Nullable zipCode;

@end

/**
 
 */
@interface AWSPinpointTargetingPhoneNumberValidateRequest : AWSRequest


/**
 Phone Number Validate request.
 */
@property (nonatomic, strong) AWSPinpointTargetingNumberValidateRequest * _Nullable numberValidateRequest;

@end

/**
 
 */
@interface AWSPinpointTargetingPhoneNumberValidateResponse : AWSModel


/**
 Phone Number Validate response.
 */
@property (nonatomic, strong) AWSPinpointTargetingNumberValidateResponse * _Nullable numberValidateResponse;

@end

/**
 Public endpoint attributes.
 */
@interface AWSPinpointTargetingPublicEndpoint : AWSModel


/**
 The unique identifier for the recipient. For example, an address could be a device token, email address, or mobile phone number.
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
 The date and time when the endpoint was last updated, inISO 8601 format.
 */
@property (nonatomic, strong) NSString * _Nullable effectiveDate;

/**
 The status of the endpoint. If the update fails, the value is INACTIVE. If the endpoint is updated successfully, the value is ACTIVE.
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
 Indicates whether a user has opted out of receiving messages with one of the following values:ALL - User has opted out of all messages.NONE - Users has not opted out and receives all messages.
 */
@property (nonatomic, strong) NSString * _Nullable optOut;

/**
 A unique identifier that is generated each time the endpoint is updated.
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

/**
 Custom user-specific attributes that your app reports to Amazon Pinpoint.
 */
@property (nonatomic, strong) AWSPinpointTargetingEndpointUser * _Nullable user;

@end

/**
 
 */
@interface AWSPinpointTargetingPutEventStreamRequest : AWSRequest


/**
 The unique ID of your Amazon Pinpoint application.
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 Request to save an EventStream.
 */
@property (nonatomic, strong) AWSPinpointTargetingWriteEventStream * _Nullable writeEventStream;

@end

/**
 
 */
@interface AWSPinpointTargetingPutEventStreamResponse : AWSModel


/**
 Model for an event publishing subscription export.
 */
@property (nonatomic, strong) AWSPinpointTargetingEventStream * _Nullable eventStream;

@end

/**
 
 */
@interface AWSPinpointTargetingPutEventsRequest : AWSRequest


/**
 The unique ID of your Amazon Pinpoint application.
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 A set of events to process.
 */
@property (nonatomic, strong) AWSPinpointTargetingEventsRequest * _Nullable eventsRequest;

@end

/**
 
 */
@interface AWSPinpointTargetingPutEventsResponse : AWSModel


/**
 Custom messages associated with events.
 */
@property (nonatomic, strong) AWSPinpointTargetingEventsResponse * _Nullable eventsResponse;

@end

/**
 Quiet Time
 */
@interface AWSPinpointTargetingQuietTime : AWSModel


/**
 The time at which quiet time should end. The value that you specify has to be in HH:mm format, where HH is the hour in 24-hour format (with a leading zero, if applicable), and mm is the minutes. For example, use 02:30 to represent 2:30 AM, or 14:30 to represent 2:30 PM.
 */
@property (nonatomic, strong) NSString * _Nullable end;

/**
 The time at which quiet time should begin. The value that you specify has to be in HH:mm format, where HH is the hour in 24-hour format (with a leading zero, if applicable), and mm is the minutes. For example, use 02:30 to represent 2:30 AM, or 14:30 to represent 2:30 PM.
 */
@property (nonatomic, strong) NSString * _Nullable start;

@end

/**
 An email represented as a raw MIME message.
 */
@interface AWSPinpointTargetingRawEmail : AWSModel


/**
 The raw email message itself. Then entire message must be base64-encoded.
 */
@property (nonatomic, strong) NSData * _Nullable data;

@end

/**
 Define how a segment based on recency of use.
 */
@interface AWSPinpointTargetingRecencyDimension : AWSModel


/**
 The length of time during which users have been active or inactive with your app.Valid values: HR_24, DAY_7, DAY_14, DAY_30
 */
@property (nonatomic, assign) AWSPinpointTargetingDuration duration;

/**
 The recency dimension type:ACTIVE - Users who have used your app within the specified duration are included in the segment.INACTIVE - Users who have not used your app within the specified duration are included in the segment.
 */
@property (nonatomic, assign) AWSPinpointTargetingRecencyType recencyType;

@end

/**
 
 */
@interface AWSPinpointTargetingRemoveAttributesRequest : AWSRequest


/**
 The unique ID of your Amazon Pinpoint application.
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 Type of attribute. Can be endpoint-custom-attributes, endpoint-custom-metrics, endpoint-user-attributes.
 */
@property (nonatomic, strong) NSString * _Nullable attributeType;

/**
 Update attributes request
 */
@property (nonatomic, strong) AWSPinpointTargetingUpdateAttributesRequest * _Nullable updateAttributesRequest;

@end

/**
 
 */
@interface AWSPinpointTargetingRemoveAttributesResponse : AWSModel


/**
 Attributes.
 */
@property (nonatomic, strong) AWSPinpointTargetingAttributesResource * _Nullable attributesResource;

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

/**
 ShortCode registered with phone provider.
 */
@property (nonatomic, strong) NSString * _Nullable shortCode;

@end

/**
 SMS Channel Response.
 */
@interface AWSPinpointTargetingSMSChannelResponse : AWSModel


/**
 The unique ID of the application to which the SMS channel belongs.
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
 Not used. Retained for backwards compatibility.
 */
@property (nonatomic, strong) NSNumber * _Nullable hasCredential;

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
 Promotional messages per second that can be sent
 */
@property (nonatomic, strong) NSNumber * _Nullable promotionalMessagesPerSecond;

/**
 Sender identifier of your messages.
 */
@property (nonatomic, strong) NSString * _Nullable senderId;

/**
 The short code registered with the phone provider.
 */
@property (nonatomic, strong) NSString * _Nullable shortCode;

/**
 Transactional messages per second that can be sent
 */
@property (nonatomic, strong) NSNumber * _Nullable transactionalMessagesPerSecond;

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
 The body of the SMS message.
 */
@property (nonatomic, strong) NSString * _Nullable body;

/**
 The SMS program name that you provided to AWS Support when you requested your dedicated number.
 */
@property (nonatomic, strong) NSString * _Nullable keyword;

/**
 Is this a transaction priority message or lower priority.
 */
@property (nonatomic, assign) AWSPinpointTargetingMessageType messageType;

/**
 The phone number that the SMS message originates from. Specify one of the dedicated long codes or short codes that you requested from AWS Support and that is assigned to your account. If this attribute is not specified, Amazon Pinpoint randomly assigns a long code.
 */
@property (nonatomic, strong) NSString * _Nullable originationNumber;

/**
 The sender ID that is shown as the message sender on the recipient's device. Support for sender IDs varies by country or region.
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
 Defines the type of events that can trigger the campaign. Used when the Frequency is set to EVENT.
 */
@property (nonatomic, strong) AWSPinpointTargetingCampaignEventFilter * _Nullable eventFilter;

/**
 How often the campaign delivers messages.Valid values:ONCEHOURLYDAILYWEEKLYMONTHLYEVENT
 */
@property (nonatomic, assign) AWSPinpointTargetingFrequency frequency;

/**
 Indicates whether the campaign schedule takes effect according to each user's local time.
 */
@property (nonatomic, strong) NSNumber * _Nullable isLocalTime;

/**
 The default quiet time for the campaign. The campaign doesn't send messages to endpoints during the quiet time.Note: Make sure that your endpoints include the Demographics.Timezone attribute if you plan to enable a quiet time for your campaign. If your endpoints don't include this attribute, they'll receive the messages that you send them, even if quiet time is enabled.When you set up a campaign to use quiet time, the campaign doesn't send messages during the time range you specified, as long as all of the following are true: - The endpoint includes a valid Demographic.Timezone attribute. - The current time in the endpoint's time zone is later than or equal to the time specified in the QuietTime.Start attribute for the campaign. - The current time in the endpoint's time zone is earlier than or equal to the time specified in the QuietTime.End attribute for the campaign.
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
 Custom segment metrics.
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSPinpointTargetingMetricDimension *> * _Nullable metrics;

/**
 Custom segment user attributes.
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSPinpointTargetingAttributeDimension *> * _Nullable userAttributes;

@end

/**
 Segment group definition.
 */
@interface AWSPinpointTargetingSegmentGroup : AWSModel


/**
 List of dimensions to include or exclude.
 */
@property (nonatomic, strong) NSArray<AWSPinpointTargetingSegmentDimensions *> * _Nullable dimensions;

/**
 The base segment that you build your segment on. The source segment defines the starting "universe" of endpoints. When you add dimensions to the segment, it filters the source segment based on the dimensions that you specify. You can specify more than one dimensional segment. You can only specify one imported segment.NOTE: If you specify an imported segment for this attribute, the segment size estimate that appears in the Amazon Pinpoint console shows the size of the imported segment, without any filters applied to it.
 */
@property (nonatomic, strong) NSArray<AWSPinpointTargetingSegmentReference *> * _Nullable sourceSegments;

/**
 Specify how to handle multiple source segments. For example, if you specify three source segments, should the resulting segment be based on any or all of the segments? Acceptable values: ANY or ALL.
 */
@property (nonatomic, assign) AWSPinpointTargetingSourceType sourceType;

/**
 Specify how to handle multiple segment dimensions. For example, if you specify three dimensions, should the resulting segment include endpoints that are matched by all, any, or none of the dimensions? Acceptable values: ALL, ANY, or NONE.
 */
@property (nonatomic, assign) AWSPinpointTargetingTypes types;

@end

/**
 Segment group definition.
 */
@interface AWSPinpointTargetingSegmentGroupList : AWSModel


/**
 A set of segment criteria to evaluate.
 */
@property (nonatomic, strong) NSArray<AWSPinpointTargetingSegmentGroup *> * _Nullable groups;

/**
 Specify how to handle multiple segment groups. For example, if the segment includes three segment groups, should the resulting segment include endpoints that are matched by all, any, or none of the segment groups you created. Acceptable values: ALL, ANY, or NONE.
 */
@property (nonatomic, assign) AWSPinpointTargetingInclude include;

@end

/**
 Segment import definition.
 */
@interface AWSPinpointTargetingSegmentImportResource : AWSModel


/**
 The number of channel types in the imported segment.
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSNumber *> * _Nullable channelCounts;

/**
 (Deprecated) Your AWS account ID, which you assigned to the ExternalID key in an IAM trust policy. Used by Amazon Pinpoint to assume an IAM role. This requirement is removed, and external IDs are not recommended for IAM roles assumed by Amazon Pinpoint.
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
 The URL of the S3 bucket that the segment was imported from.
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
 The country or region, in ISO 3166-1 alpha-2 format.
 */
@property (nonatomic, strong) AWSPinpointTargetingSetDimension * _Nullable country;

/**
 The GPS Point dimension.
 */
@property (nonatomic, strong) AWSPinpointTargetingGPSPointDimension * _Nullable GPSPoint;

@end

/**
 Segment reference.
 */
@interface AWSPinpointTargetingSegmentReference : AWSModel


/**
 A unique identifier for the segment.
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 If specified contains a specific version of the segment included.
 */
@property (nonatomic, strong) NSNumber * _Nullable version;

@end

/**
 Segment definition.
 */
@interface AWSPinpointTargetingSegmentResponse : AWSModel


/**
 The ID of the application that the segment applies to.
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 The date and time when the segment was created.
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
 The date and time when the segment was last modified.
 */
@property (nonatomic, strong) NSString * _Nullable lastModifiedDate;

/**
 The name of the segment.
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 A segment group, which consists of zero or more source segments, plus dimensions that are applied to those source segments.
 */
@property (nonatomic, strong) AWSPinpointTargetingSegmentGroupList * _Nullable segmentGroups;

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
 The unique ID of your Amazon Pinpoint application.
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
 Send message request.
 */
@interface AWSPinpointTargetingSendUsersMessageRequest : AWSModel


/**
 A map of custom attribute-value pairs. Amazon Pinpoint adds these attributes to the data.pinpoint object in the body of the push notification payload. Amazon Pinpoint also provides these attributes in the events that it generates for users-messages deliveries.
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable context;

/**
 Message definitions for the default message and any messages that are tailored for specific channels.
 */
@property (nonatomic, strong) AWSPinpointTargetingDirectMessageConfiguration * _Nullable messageConfiguration;

/**
 A unique ID that you can use to trace a message. This ID is visible to recipients.
 */
@property (nonatomic, strong) NSString * _Nullable traceId;

/**
 A map that associates user IDs with EndpointSendConfiguration objects. Within an EndpointSendConfiguration object, you can tailor the message for a user by specifying message overrides or substitutions.
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSPinpointTargetingEndpointSendConfiguration *> * _Nullable users;

@end

/**
 User send message response.
 */
@interface AWSPinpointTargetingSendUsersMessageResponse : AWSModel


/**
 The unique ID of the Amazon Pinpoint project used to send the message.
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 The unique ID assigned to the users-messages request.
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

/**
 An object that shows the endpoints that were messaged for each user. The object provides a list of user IDs. For each user ID, it provides the endpoint IDs that were messaged. For each endpoint ID, it provides an EndpointMessageResult object.
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSDictionary<NSString *, AWSPinpointTargetingEndpointMessageResult *> *> * _Nullable result;

@end

/**
 
 */
@interface AWSPinpointTargetingSendUsersMessagesRequest : AWSRequest


/**
 The unique ID of your Amazon Pinpoint application.
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 Send message request.
 */
@property (nonatomic, strong) AWSPinpointTargetingSendUsersMessageRequest * _Nullable sendUsersMessageRequest;

@end

/**
 
 */
@interface AWSPinpointTargetingSendUsersMessagesResponse : AWSModel


/**
 User send message response.
 */
@property (nonatomic, strong) AWSPinpointTargetingSendUsersMessageResponse * _Nullable sendUsersMessageResponse;

@end

/**
 Information about a session.
 */
@interface AWSPinpointTargetingSession : AWSModel


/**
 The duration of the session, in milliseconds.
 */
@property (nonatomic, strong) NSNumber * _Nullable duration;

/**
 A unique identifier for the session.
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 The date and time when the session began.
 */
@property (nonatomic, strong) NSString * _Nullable startTimestamp;

/**
 The date and time when the session ended.
 */
@property (nonatomic, strong) NSString * _Nullable stopTimestamp;

@end

/**
 Dimension specification of a segment.
 */
@interface AWSPinpointTargetingSetDimension : AWSModel


/**
 The type of dimension:INCLUSIVE - Endpoints that match the criteria are included in the segment.EXCLUSIVE - Endpoints that match the criteria are excluded from the segment.
 */
@property (nonatomic, assign) AWSPinpointTargetingDimensionType dimensionType;

/**
 The criteria values for the segment dimension. Endpoints with matching attribute values are included or excluded from the segment, depending on the setting for Type.
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable values;

@end

/**
 An email composed of a subject, a text part and a html part.
 */
@interface AWSPinpointTargetingSimpleEmail : AWSModel


/**
 The content of the message, in HTML format. Use this for email clients that can process HTML. You can include clickable links, formatted text, and much more in an HTML message.
 */
@property (nonatomic, strong) AWSPinpointTargetingSimpleEmailPart * _Nullable htmlPart;

/**
 The subject of the message: A short summary of the content, which will appear in the recipient's inbox.
 */
@property (nonatomic, strong) AWSPinpointTargetingSimpleEmailPart * _Nullable subject;

/**
 The content of the message, in text format. Use this for text-based email clients, or clients on high-latency networks (such as mobile devices).
 */
@property (nonatomic, strong) AWSPinpointTargetingSimpleEmailPart * _Nullable textPart;

@end

/**
 Textual email data, plus an optional character set specification.
 */
@interface AWSPinpointTargetingSimpleEmailPart : AWSModel


/**
 The character set of the content.
 */
@property (nonatomic, strong) NSString * _Nullable charset;

/**
 The textual data of the content.
 */
@property (nonatomic, strong) NSString * _Nullable data;

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
@interface AWSPinpointTargetingUpdateAdmChannelRequest : AWSRequest


/**
 Amazon Device Messaging channel definition.
 */
@property (nonatomic, strong) AWSPinpointTargetingADMChannelRequest * _Nullable ADMChannelRequest;

/**
 The unique ID of your Amazon Pinpoint application.
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

@end

/**
 
 */
@interface AWSPinpointTargetingUpdateAdmChannelResponse : AWSModel


/**
 Amazon Device Messaging channel definition.
 */
@property (nonatomic, strong) AWSPinpointTargetingADMChannelResponse * _Nullable ADMChannelResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingUpdateApnsChannelRequest : AWSRequest


/**
 Apple Push Notification Service channel definition.
 */
@property (nonatomic, strong) AWSPinpointTargetingAPNSChannelRequest * _Nullable APNSChannelRequest;

/**
 The unique ID of your Amazon Pinpoint application.
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
 The unique ID of your Amazon Pinpoint application.
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
@interface AWSPinpointTargetingUpdateApnsVoipChannelRequest : AWSRequest


/**
 Apple VoIP Push Notification Service channel definition.
 */
@property (nonatomic, strong) AWSPinpointTargetingAPNSVoipChannelRequest * _Nullable APNSVoipChannelRequest;

/**
 The unique ID of your Amazon Pinpoint application.
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

@end

/**
 
 */
@interface AWSPinpointTargetingUpdateApnsVoipChannelResponse : AWSModel


/**
 Apple VoIP Push Notification Service channel definition.
 */
@property (nonatomic, strong) AWSPinpointTargetingAPNSVoipChannelResponse * _Nullable APNSVoipChannelResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingUpdateApnsVoipSandboxChannelRequest : AWSRequest


/**
 Apple VoIP Developer Push Notification Service channel definition.
 */
@property (nonatomic, strong) AWSPinpointTargetingAPNSVoipSandboxChannelRequest * _Nullable APNSVoipSandboxChannelRequest;

/**
 The unique ID of your Amazon Pinpoint application.
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

@end

/**
 
 */
@interface AWSPinpointTargetingUpdateApnsVoipSandboxChannelResponse : AWSModel


/**
 Apple VoIP Developer Push Notification Service channel definition.
 */
@property (nonatomic, strong) AWSPinpointTargetingAPNSVoipSandboxChannelResponse * _Nullable APNSVoipSandboxChannelResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingUpdateApplicationSettingsRequest : AWSRequest


/**
 The unique ID of your Amazon Pinpoint application.
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
 Update attributes request
 */
@interface AWSPinpointTargetingUpdateAttributesRequest : AWSModel


/**
 The GLOB wildcard for removing the attributes in the application
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable blacklist;

@end

/**
 
 */
@interface AWSPinpointTargetingUpdateBaiduChannelRequest : AWSRequest


/**
 The unique ID of your Amazon Pinpoint application.
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 Baidu Cloud Push credentials
 */
@property (nonatomic, strong) AWSPinpointTargetingBaiduChannelRequest * _Nullable baiduChannelRequest;

@end

/**
 
 */
@interface AWSPinpointTargetingUpdateBaiduChannelResponse : AWSModel


/**
 Baidu Cloud Messaging channel definition
 */
@property (nonatomic, strong) AWSPinpointTargetingBaiduChannelResponse * _Nullable baiduChannelResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingUpdateCampaignRequest : AWSRequest


/**
 The unique ID of your Amazon Pinpoint application.
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 The unique ID of the campaign.
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
 The unique ID of your Amazon Pinpoint application.
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
 The unique ID of your Amazon Pinpoint application.
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 The unique ID of the endpoint.
 */
@property (nonatomic, strong) NSString * _Nullable endpointId;

/**
 An endpoint update request.
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
 The unique ID of your Amazon Pinpoint application.
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
 The unique ID of your Amazon Pinpoint application.
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
 The unique ID of your Amazon Pinpoint application.
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 The unique ID of the segment.
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
 The unique ID of your Amazon Pinpoint application.
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
 
 */
@interface AWSPinpointTargetingUpdateVoiceChannelRequest : AWSRequest


/**
 The unique ID of your Amazon Pinpoint application.
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 Voice Channel Request
 */
@property (nonatomic, strong) AWSPinpointTargetingVoiceChannelRequest * _Nullable voiceChannelRequest;

@end

/**
 
 */
@interface AWSPinpointTargetingUpdateVoiceChannelResponse : AWSModel


/**
 Voice Channel Response.
 */
@property (nonatomic, strong) AWSPinpointTargetingVoiceChannelResponse * _Nullable voiceChannelResponse;

@end

/**
 Voice Channel Request
 */
@interface AWSPinpointTargetingVoiceChannelRequest : AWSModel


/**
 If the channel is enabled for sending messages.
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

@end

/**
 Voice Channel Response.
 */
@interface AWSPinpointTargetingVoiceChannelResponse : AWSModel


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
 
 */
@property (nonatomic, strong) NSNumber * _Nullable hasCredential;

/**
 Channel ID. Not used, only for backwards compatibility.
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 Is this channel archived
 */
@property (nonatomic, strong) NSNumber * _Nullable isArchived;

/**
 Who made the last change
 */
@property (nonatomic, strong) NSString * _Nullable lastModifiedBy;

/**
 Last date this was updated
 */
@property (nonatomic, strong) NSString * _Nullable lastModifiedDate;

/**
 Platform type. Will be "Voice"
 */
@property (nonatomic, strong) NSString * _Nullable platform;

/**
 Version of channel
 */
@property (nonatomic, strong) NSNumber * _Nullable version;

@end

/**
 Voice Message.
 */
@interface AWSPinpointTargetingVoiceMessage : AWSModel


/**
 The message body of the notification, the email body or the text message.
 */
@property (nonatomic, strong) NSString * _Nullable body;

/**
 Language of sent message
 */
@property (nonatomic, strong) NSString * _Nullable languageCode;

/**
 Is the number from the pool or messaging service to send from.
 */
@property (nonatomic, strong) NSString * _Nullable originationNumber;

/**
 Default message substitutions. Can be overridden by individual address substitutions.
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSArray<NSString *> *> * _Nullable substitutions;

/**
 Voice ID of sent message.
 */
@property (nonatomic, strong) NSString * _Nullable voiceId;

@end

/**
 Creating application setting request
 */
@interface AWSPinpointTargetingWriteApplicationSettingsRequest : AWSModel


/**
 Default campaign hook information.
 */
@property (nonatomic, strong) AWSPinpointTargetingCampaignHook * _Nullable campaignHook;

/**
 The CloudWatchMetrics settings for the app.
 */
@property (nonatomic, strong) NSNumber * _Nullable cloudWatchMetricsEnabled;

/**
 The limits that apply to each campaign in the project by default. Campaigns can also have their own limits, which override the settings at the project level.
 */
@property (nonatomic, strong) AWSPinpointTargetingCampaignLimits * _Nullable limits;

/**
 The default quiet time for the app. Campaigns in the app don't send messages to endpoints during the quiet time.Note: Make sure that your endpoints include the Demographics.Timezone attribute if you plan to enable a quiet time for your app. If your endpoints don't include this attribute, they'll receive the messages that you send them, even if quiet time is enabled.When you set up an app to use quiet time, campaigns in that app don't send messages during the time range you specified, as long as all of the following are true: - The endpoint includes a valid Demographic.Timezone attribute. - The current time in the endpoint's time zone is later than or equal to the time specified in the QuietTime.Start attribute for the app (or campaign, if applicable). - The current time in the endpoint's time zone is earlier than or equal to the time specified in the QuietTime.End attribute for the app (or campaign, if applicable).Individual campaigns within the app can have their own quiet time settings, which override the quiet time settings at the app level.
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
 Campaign hook information.
 */
@property (nonatomic, strong) AWSPinpointTargetingCampaignHook * _Nullable hook;

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

/**
 A segment group, which consists of zero or more source segments, plus dimensions that are applied to those source segments. Your request can only include one segment group. Your request can include either a SegmentGroups object or a Dimensions object, but not both.
 */
@property (nonatomic, strong) AWSPinpointTargetingSegmentGroupList * _Nullable segmentGroups;

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
