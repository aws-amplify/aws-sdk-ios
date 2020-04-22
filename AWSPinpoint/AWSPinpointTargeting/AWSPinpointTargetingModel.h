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

FOUNDATION_EXPORT NSString *const AWSPinpointTargetingErrorDomain;

typedef NS_ENUM(NSInteger, AWSPinpointTargetingErrorType) {
    AWSPinpointTargetingErrorUnknown,
    AWSPinpointTargetingErrorBadRequest,
    AWSPinpointTargetingErrorForbidden,
    AWSPinpointTargetingErrorInternalServerError,
    AWSPinpointTargetingErrorMethodNotAllowed,
    AWSPinpointTargetingErrorNotFound,
    AWSPinpointTargetingErrorPayloadTooLarge,
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
    AWSPinpointTargetingJobStatusPreparingForInitialization,
    AWSPinpointTargetingJobStatusInitializing,
    AWSPinpointTargetingJobStatusProcessing,
    AWSPinpointTargetingJobStatusPendingJob,
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

typedef NS_ENUM(NSInteger, AWSPinpointTargetingOperator) {
    AWSPinpointTargetingOperatorUnknown,
    AWSPinpointTargetingOperatorAll,
    AWSPinpointTargetingOperatorAny,
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

typedef NS_ENUM(NSInteger, AWSPinpointTargetingState) {
    AWSPinpointTargetingStateUnknown,
    AWSPinpointTargetingStateDraft,
    AWSPinpointTargetingStateActive,
    AWSPinpointTargetingStateCompleted,
    AWSPinpointTargetingStateCancelled,
    AWSPinpointTargetingStateClosed,
};

typedef NS_ENUM(NSInteger, AWSPinpointTargetingTemplateType) {
    AWSPinpointTargetingTemplateTypeUnknown,
    AWSPinpointTargetingTemplateTypeEmail,
    AWSPinpointTargetingTemplateTypeSms,
    AWSPinpointTargetingTemplateTypeVoice,
    AWSPinpointTargetingTemplateTypePush,
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
@class AWSPinpointTargetingAPNSPushNotificationTemplate;
@class AWSPinpointTargetingAPNSSandboxChannelRequest;
@class AWSPinpointTargetingAPNSSandboxChannelResponse;
@class AWSPinpointTargetingAPNSVoipChannelRequest;
@class AWSPinpointTargetingAPNSVoipChannelResponse;
@class AWSPinpointTargetingAPNSVoipSandboxChannelRequest;
@class AWSPinpointTargetingAPNSVoipSandboxChannelResponse;
@class AWSPinpointTargetingActivitiesResponse;
@class AWSPinpointTargetingActivity;
@class AWSPinpointTargetingActivityResponse;
@class AWSPinpointTargetingAddressConfiguration;
@class AWSPinpointTargetingAndroidPushNotificationTemplate;
@class AWSPinpointTargetingApplicationDateRangeKpiResponse;
@class AWSPinpointTargetingApplicationResponse;
@class AWSPinpointTargetingApplicationSettingsResource;
@class AWSPinpointTargetingApplicationsResponse;
@class AWSPinpointTargetingAttributeDimension;
@class AWSPinpointTargetingAttributesResource;
@class AWSPinpointTargetingBaiduChannelRequest;
@class AWSPinpointTargetingBaiduChannelResponse;
@class AWSPinpointTargetingBaiduMessage;
@class AWSPinpointTargetingBaseKpiResult;
@class AWSPinpointTargetingCampaignDateRangeKpiResponse;
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
@class AWSPinpointTargetingCondition;
@class AWSPinpointTargetingConditionalSplitActivity;
@class AWSPinpointTargetingCreateAppRequest;
@class AWSPinpointTargetingCreateAppResponse;
@class AWSPinpointTargetingCreateApplicationRequest;
@class AWSPinpointTargetingCreateCampaignRequest;
@class AWSPinpointTargetingCreateCampaignResponse;
@class AWSPinpointTargetingCreateEmailTemplateRequest;
@class AWSPinpointTargetingCreateEmailTemplateResponse;
@class AWSPinpointTargetingCreateExportJobRequest;
@class AWSPinpointTargetingCreateExportJobResponse;
@class AWSPinpointTargetingCreateImportJobRequest;
@class AWSPinpointTargetingCreateImportJobResponse;
@class AWSPinpointTargetingCreateJourneyRequest;
@class AWSPinpointTargetingCreateJourneyResponse;
@class AWSPinpointTargetingCreatePushTemplateRequest;
@class AWSPinpointTargetingCreatePushTemplateResponse;
@class AWSPinpointTargetingCreateRecommenderConfiguration;
@class AWSPinpointTargetingCreateRecommenderConfigurationRequest;
@class AWSPinpointTargetingCreateRecommenderConfigurationResponse;
@class AWSPinpointTargetingCreateSegmentRequest;
@class AWSPinpointTargetingCreateSegmentResponse;
@class AWSPinpointTargetingCreateSmsTemplateRequest;
@class AWSPinpointTargetingCreateSmsTemplateResponse;
@class AWSPinpointTargetingCreateTemplateMessageBody;
@class AWSPinpointTargetingCreateVoiceTemplateRequest;
@class AWSPinpointTargetingCreateVoiceTemplateResponse;
@class AWSPinpointTargetingDefaultMessage;
@class AWSPinpointTargetingDefaultPushNotificationMessage;
@class AWSPinpointTargetingDefaultPushNotificationTemplate;
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
@class AWSPinpointTargetingDeleteEmailTemplateRequest;
@class AWSPinpointTargetingDeleteEmailTemplateResponse;
@class AWSPinpointTargetingDeleteEndpointRequest;
@class AWSPinpointTargetingDeleteEndpointResponse;
@class AWSPinpointTargetingDeleteEventStreamRequest;
@class AWSPinpointTargetingDeleteEventStreamResponse;
@class AWSPinpointTargetingDeleteGcmChannelRequest;
@class AWSPinpointTargetingDeleteGcmChannelResponse;
@class AWSPinpointTargetingDeleteJourneyRequest;
@class AWSPinpointTargetingDeleteJourneyResponse;
@class AWSPinpointTargetingDeletePushTemplateRequest;
@class AWSPinpointTargetingDeletePushTemplateResponse;
@class AWSPinpointTargetingDeleteRecommenderConfigurationRequest;
@class AWSPinpointTargetingDeleteRecommenderConfigurationResponse;
@class AWSPinpointTargetingDeleteSegmentRequest;
@class AWSPinpointTargetingDeleteSegmentResponse;
@class AWSPinpointTargetingDeleteSmsChannelRequest;
@class AWSPinpointTargetingDeleteSmsChannelResponse;
@class AWSPinpointTargetingDeleteSmsTemplateRequest;
@class AWSPinpointTargetingDeleteSmsTemplateResponse;
@class AWSPinpointTargetingDeleteUserEndpointsRequest;
@class AWSPinpointTargetingDeleteUserEndpointsResponse;
@class AWSPinpointTargetingDeleteVoiceChannelRequest;
@class AWSPinpointTargetingDeleteVoiceChannelResponse;
@class AWSPinpointTargetingDeleteVoiceTemplateRequest;
@class AWSPinpointTargetingDeleteVoiceTemplateResponse;
@class AWSPinpointTargetingDirectMessageConfiguration;
@class AWSPinpointTargetingEmailChannelRequest;
@class AWSPinpointTargetingEmailChannelResponse;
@class AWSPinpointTargetingEmailMessage;
@class AWSPinpointTargetingEmailMessageActivity;
@class AWSPinpointTargetingEmailTemplateRequest;
@class AWSPinpointTargetingEmailTemplateResponse;
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
@class AWSPinpointTargetingEventCondition;
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
@class AWSPinpointTargetingGetApplicationDateRangeKpiRequest;
@class AWSPinpointTargetingGetApplicationDateRangeKpiResponse;
@class AWSPinpointTargetingGetApplicationSettingsRequest;
@class AWSPinpointTargetingGetApplicationSettingsResponse;
@class AWSPinpointTargetingGetAppsRequest;
@class AWSPinpointTargetingGetAppsResponse;
@class AWSPinpointTargetingGetBaiduChannelRequest;
@class AWSPinpointTargetingGetBaiduChannelResponse;
@class AWSPinpointTargetingGetCampaignActivitiesRequest;
@class AWSPinpointTargetingGetCampaignActivitiesResponse;
@class AWSPinpointTargetingGetCampaignDateRangeKpiRequest;
@class AWSPinpointTargetingGetCampaignDateRangeKpiResponse;
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
@class AWSPinpointTargetingGetEmailTemplateRequest;
@class AWSPinpointTargetingGetEmailTemplateResponse;
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
@class AWSPinpointTargetingGetJourneyDateRangeKpiRequest;
@class AWSPinpointTargetingGetJourneyDateRangeKpiResponse;
@class AWSPinpointTargetingGetJourneyExecutionActivityMetricsRequest;
@class AWSPinpointTargetingGetJourneyExecutionActivityMetricsResponse;
@class AWSPinpointTargetingGetJourneyExecutionMetricsRequest;
@class AWSPinpointTargetingGetJourneyExecutionMetricsResponse;
@class AWSPinpointTargetingGetJourneyRequest;
@class AWSPinpointTargetingGetJourneyResponse;
@class AWSPinpointTargetingGetPushTemplateRequest;
@class AWSPinpointTargetingGetPushTemplateResponse;
@class AWSPinpointTargetingGetRecommenderConfigurationRequest;
@class AWSPinpointTargetingGetRecommenderConfigurationResponse;
@class AWSPinpointTargetingGetRecommenderConfigurationsRequest;
@class AWSPinpointTargetingGetRecommenderConfigurationsResponse;
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
@class AWSPinpointTargetingGetSmsTemplateRequest;
@class AWSPinpointTargetingGetSmsTemplateResponse;
@class AWSPinpointTargetingGetUserEndpointsRequest;
@class AWSPinpointTargetingGetUserEndpointsResponse;
@class AWSPinpointTargetingGetVoiceChannelRequest;
@class AWSPinpointTargetingGetVoiceChannelResponse;
@class AWSPinpointTargetingGetVoiceTemplateRequest;
@class AWSPinpointTargetingGetVoiceTemplateResponse;
@class AWSPinpointTargetingHoldoutActivity;
@class AWSPinpointTargetingImportJobRequest;
@class AWSPinpointTargetingImportJobResource;
@class AWSPinpointTargetingImportJobResponse;
@class AWSPinpointTargetingImportJobsResponse;
@class AWSPinpointTargetingItemResponse;
@class AWSPinpointTargetingJourneyDateRangeKpiResponse;
@class AWSPinpointTargetingJourneyEmailMessage;
@class AWSPinpointTargetingJourneyExecutionActivityMetricsResponse;
@class AWSPinpointTargetingJourneyExecutionMetricsResponse;
@class AWSPinpointTargetingJourneyLimits;
@class AWSPinpointTargetingJourneyResponse;
@class AWSPinpointTargetingJourneySchedule;
@class AWSPinpointTargetingJourneyStateRequest;
@class AWSPinpointTargetingJourneysResponse;
@class AWSPinpointTargetingListJourneysRequest;
@class AWSPinpointTargetingListJourneysResponse;
@class AWSPinpointTargetingListRecommenderConfigurationsResponse;
@class AWSPinpointTargetingListTagsForResourceRequest;
@class AWSPinpointTargetingListTagsForResourceResponse;
@class AWSPinpointTargetingListTemplateVersionsRequest;
@class AWSPinpointTargetingListTemplateVersionsResponse;
@class AWSPinpointTargetingListTemplatesRequest;
@class AWSPinpointTargetingListTemplatesResponse;
@class AWSPinpointTargetingMessage;
@class AWSPinpointTargetingMessageBody;
@class AWSPinpointTargetingMessageConfiguration;
@class AWSPinpointTargetingMessageRequest;
@class AWSPinpointTargetingMessageResponse;
@class AWSPinpointTargetingMessageResult;
@class AWSPinpointTargetingMetricDimension;
@class AWSPinpointTargetingMultiConditionalBranch;
@class AWSPinpointTargetingMultiConditionalSplitActivity;
@class AWSPinpointTargetingNumberValidateRequest;
@class AWSPinpointTargetingNumberValidateResponse;
@class AWSPinpointTargetingPhoneNumberValidateRequest;
@class AWSPinpointTargetingPhoneNumberValidateResponse;
@class AWSPinpointTargetingPublicEndpoint;
@class AWSPinpointTargetingPushNotificationTemplateRequest;
@class AWSPinpointTargetingPushNotificationTemplateResponse;
@class AWSPinpointTargetingPutEventStreamRequest;
@class AWSPinpointTargetingPutEventStreamResponse;
@class AWSPinpointTargetingPutEventsRequest;
@class AWSPinpointTargetingPutEventsResponse;
@class AWSPinpointTargetingQuietTime;
@class AWSPinpointTargetingRandomSplitActivity;
@class AWSPinpointTargetingRandomSplitEntry;
@class AWSPinpointTargetingRawEmail;
@class AWSPinpointTargetingRecencyDimension;
@class AWSPinpointTargetingRecommenderConfigurationResponse;
@class AWSPinpointTargetingRemoveAttributesRequest;
@class AWSPinpointTargetingRemoveAttributesResponse;
@class AWSPinpointTargetingResultRow;
@class AWSPinpointTargetingResultRowValue;
@class AWSPinpointTargetingSMSChannelRequest;
@class AWSPinpointTargetingSMSChannelResponse;
@class AWSPinpointTargetingSMSMessage;
@class AWSPinpointTargetingSMSTemplateRequest;
@class AWSPinpointTargetingSMSTemplateResponse;
@class AWSPinpointTargetingSchedule;
@class AWSPinpointTargetingSegmentBehaviors;
@class AWSPinpointTargetingSegmentCondition;
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
@class AWSPinpointTargetingSimpleCondition;
@class AWSPinpointTargetingSimpleEmail;
@class AWSPinpointTargetingSimpleEmailPart;
@class AWSPinpointTargetingStartCondition;
@class AWSPinpointTargetingTagResourceRequest;
@class AWSPinpointTargetingTagsModel;
@class AWSPinpointTargetingTemplate;
@class AWSPinpointTargetingTemplateActiveVersionRequest;
@class AWSPinpointTargetingTemplateConfiguration;
@class AWSPinpointTargetingTemplateResponse;
@class AWSPinpointTargetingTemplateVersionResponse;
@class AWSPinpointTargetingTemplateVersionsResponse;
@class AWSPinpointTargetingTemplatesResponse;
@class AWSPinpointTargetingTreatmentResource;
@class AWSPinpointTargetingUntagResourceRequest;
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
@class AWSPinpointTargetingUpdateEmailTemplateRequest;
@class AWSPinpointTargetingUpdateEmailTemplateResponse;
@class AWSPinpointTargetingUpdateEndpointRequest;
@class AWSPinpointTargetingUpdateEndpointResponse;
@class AWSPinpointTargetingUpdateEndpointsBatchRequest;
@class AWSPinpointTargetingUpdateEndpointsBatchResponse;
@class AWSPinpointTargetingUpdateGcmChannelRequest;
@class AWSPinpointTargetingUpdateGcmChannelResponse;
@class AWSPinpointTargetingUpdateJourneyRequest;
@class AWSPinpointTargetingUpdateJourneyResponse;
@class AWSPinpointTargetingUpdateJourneyStateRequest;
@class AWSPinpointTargetingUpdateJourneyStateResponse;
@class AWSPinpointTargetingUpdatePushTemplateRequest;
@class AWSPinpointTargetingUpdatePushTemplateResponse;
@class AWSPinpointTargetingUpdateRecommenderConfiguration;
@class AWSPinpointTargetingUpdateRecommenderConfigurationRequest;
@class AWSPinpointTargetingUpdateRecommenderConfigurationResponse;
@class AWSPinpointTargetingUpdateSegmentRequest;
@class AWSPinpointTargetingUpdateSegmentResponse;
@class AWSPinpointTargetingUpdateSmsChannelRequest;
@class AWSPinpointTargetingUpdateSmsChannelResponse;
@class AWSPinpointTargetingUpdateSmsTemplateRequest;
@class AWSPinpointTargetingUpdateSmsTemplateResponse;
@class AWSPinpointTargetingUpdateTemplateActiveVersionRequest;
@class AWSPinpointTargetingUpdateTemplateActiveVersionResponse;
@class AWSPinpointTargetingUpdateVoiceChannelRequest;
@class AWSPinpointTargetingUpdateVoiceChannelResponse;
@class AWSPinpointTargetingUpdateVoiceTemplateRequest;
@class AWSPinpointTargetingUpdateVoiceTemplateResponse;
@class AWSPinpointTargetingVoiceChannelRequest;
@class AWSPinpointTargetingVoiceChannelResponse;
@class AWSPinpointTargetingVoiceMessage;
@class AWSPinpointTargetingVoiceTemplateRequest;
@class AWSPinpointTargetingVoiceTemplateResponse;
@class AWSPinpointTargetingWaitActivity;
@class AWSPinpointTargetingWaitTime;
@class AWSPinpointTargetingWriteApplicationSettingsRequest;
@class AWSPinpointTargetingWriteCampaignRequest;
@class AWSPinpointTargetingWriteEventStream;
@class AWSPinpointTargetingWriteJourneyRequest;
@class AWSPinpointTargetingWriteSegmentRequest;
@class AWSPinpointTargetingWriteTreatmentResource;

/**
 <p>Specifies the status and settings of the ADM (Amazon Device Messaging) channel for an application.</p>
 Required parameters: [ClientSecret, ClientId]
 */
@interface AWSPinpointTargetingADMChannelRequest : AWSModel


/**
 <p>The Client ID that you received from Amazon to send messages by using ADM.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientId;

/**
 <p>The Client Secret that you received from Amazon to send messages by using ADM.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientSecret;

/**
 <p>Specifies whether to enable the ADM channel for the application.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

@end

/**
 <p>Provides information about the status and settings of the ADM (Amazon Device Messaging) channel for an application.</p>
 Required parameters: [Platform]
 */
@interface AWSPinpointTargetingADMChannelResponse : AWSModel


/**
 <p>The unique identifier for the application that the ADM channel applies to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 <p>The date and time when the ADM channel was enabled.</p>
 */
@property (nonatomic, strong) NSString * _Nullable creationDate;

/**
 <p>Specifies whether the ADM channel is enabled for the application.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

/**
 <p>(Not used) This property is retained only for backward compatibility.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable hasCredential;

/**
 <p>(Deprecated) An identifier for the ADM channel. This property is retained only for backward compatibility.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>Specifies whether the ADM channel is archived.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isArchived;

/**
 <p>The user who last modified the ADM channel.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lastModifiedBy;

/**
 <p>The date and time when the ADM channel was last modified.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lastModifiedDate;

/**
 <p>The type of messaging or notification platform for the channel. For the ADM channel, this value is ADM.</p>
 */
@property (nonatomic, strong) NSString * _Nullable platform;

/**
 <p>The current version of the ADM channel.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable version;

@end

/**
 <p>Specifies the settings for a one-time message that's sent directly to an endpoint through the ADM (Amazon Device Messaging) channel.</p>
 */
@interface AWSPinpointTargetingADMMessage : AWSModel


/**
 <p>The action to occur if the recipient taps the push notification. Valid values are:</p><ul><li><p>OPEN_APP - Your app opens or it becomes the foreground app if it was sent to the background. This is the default action.</p></li><li><p>DEEP_LINK - Your app opens and displays a designated user interface in the app. This action uses the deep-linking features of the Android platform.</p></li><li><p>URL - The default mobile browser on the recipient's device opens and loads the web page at a URL that you specify.</p></li></ul>
 */
@property (nonatomic, assign) AWSPinpointTargetingAction action;

/**
 <p>The body of the notification message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable body;

/**
 <p>An arbitrary string that indicates that multiple messages are logically the same and that Amazon Device Messaging (ADM) can drop previously enqueued messages in favor of this message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable consolidationKey;

/**
 <p>The JSON data payload to use for the push notification, if the notification is a silent push notification. This payload is added to the data.pinpoint.jsonBody object of the notification.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable data;

/**
 <p>The amount of time, in seconds, that ADM should store the message if the recipient's device is offline. Amazon Pinpoint specifies this value in the expiresAfter parameter when it sends the notification message to ADM.</p>
 */
@property (nonatomic, strong) NSString * _Nullable expiresAfter;

/**
 <p>The icon image name of the asset saved in your app.</p>
 */
@property (nonatomic, strong) NSString * _Nullable iconReference;

/**
 <p>The URL of the large icon image to display in the content view of the push notification.</p>
 */
@property (nonatomic, strong) NSString * _Nullable imageIconUrl;

/**
 <p>The URL of an image to display in the push notification.</p>
 */
@property (nonatomic, strong) NSString * _Nullable imageUrl;

/**
 <p>The base64-encoded, MD5 checksum of the value specified by the Data property. ADM uses the MD5 value to verify the integrity of the data.</p>
 */
@property (nonatomic, strong) NSString * _Nullable MD5;

/**
 <p>The raw, JSON-formatted string to use as the payload for the notification message. If specified, this value overrides all other content for the message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable rawContent;

/**
 <p>Specifies whether the notification is a silent push notification, which is a push notification that doesn't display on a recipient's device. Silent push notifications can be used for cases such as updating an app's configuration or supporting phone home functionality.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable silentPush;

/**
 <p>The URL of the small icon image to display in the status bar and the content view of the push notification.</p>
 */
@property (nonatomic, strong) NSString * _Nullable smallImageIconUrl;

/**
 <p>The sound to play when the recipient receives the push notification. You can use the default stream or specify the file name of a sound resource that's bundled in your app. On an Android platform, the sound file must reside in /res/raw/.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sound;

/**
 <p>The default message variables to use in the notification message. You can override the default variables with individual address variables.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSArray<NSString *> *> * _Nullable substitutions;

/**
 <p>The title to display above the notification message on the recipient's device.</p>
 */
@property (nonatomic, strong) NSString * _Nullable title;

/**
 <p>The URL to open in the recipient's default mobile browser, if a recipient taps the push notification and the value of the Action property is URL.</p>
 */
@property (nonatomic, strong) NSString * _Nullable url;

@end

/**
 <p>Specifies the status and settings of the APNs (Apple Push Notification service) channel for an application.</p>
 */
@interface AWSPinpointTargetingAPNSChannelRequest : AWSModel


/**
 <p>The bundle identifier that's assigned to your iOS app. This identifier is used for APNs tokens.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bundleId;

/**
 <p>The APNs client certificate that you received from Apple, if you want Amazon Pinpoint to communicate with APNs by using an APNs certificate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificate;

/**
 <p>The default authentication method that you want Amazon Pinpoint to use when authenticating with APNs, key or certificate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable defaultAuthenticationMethod;

/**
 <p>Specifies whether to enable the APNs channel for the application.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

/**
 <p>The private key for the APNs client certificate that you want Amazon Pinpoint to use to communicate with APNs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable privateKey;

/**
 <p>The identifier that's assigned to your Apple developer account team. This identifier is used for APNs tokens.</p>
 */
@property (nonatomic, strong) NSString * _Nullable teamId;

/**
 <p>The authentication key to use for APNs tokens.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tokenKey;

/**
 <p>The key identifier that's assigned to your APNs signing key, if you want Amazon Pinpoint to communicate with APNs by using APNs tokens.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tokenKeyId;

@end

/**
 <p>Provides information about the status and settings of the APNs (Apple Push Notification service) channel for an application.</p>
 Required parameters: [Platform]
 */
@interface AWSPinpointTargetingAPNSChannelResponse : AWSModel


/**
 <p>The unique identifier for the application that the APNs channel applies to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 <p>The date and time when the APNs channel was enabled.</p>
 */
@property (nonatomic, strong) NSString * _Nullable creationDate;

/**
 <p>The default authentication method that Amazon Pinpoint uses to authenticate with APNs for this channel, key or certificate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable defaultAuthenticationMethod;

/**
 <p>Specifies whether the APNs channel is enabled for the application.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

/**
 <p>(Not used) This property is retained only for backward compatibility.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable hasCredential;

/**
 <p>Specifies whether the APNs channel is configured to communicate with APNs by using APNs tokens. To provide an authentication key for APNs tokens, set the TokenKey property of the channel.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable hasTokenKey;

/**
 <p>(Deprecated) An identifier for the APNs channel. This property is retained only for backward compatibility.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>Specifies whether the APNs channel is archived.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isArchived;

/**
 <p>The user who last modified the APNs channel.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lastModifiedBy;

/**
 <p>The date and time when the APNs channel was last modified.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lastModifiedDate;

/**
  <p>The type of messaging or notification platform for the channel. For the APNs channel, this value is APNS.</p>
 */
@property (nonatomic, strong) NSString * _Nullable platform;

/**
 <p>The current version of the APNs channel.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable version;

@end

/**
 <p>Specifies the settings for a one-time message that's sent directly to an endpoint through the APNs (Apple Push Notification service) channel.</p>
 */
@interface AWSPinpointTargetingAPNSMessage : AWSModel


/**
 <p>The type of push notification to send. Valid values are:</p><ul><li><p>alert - For a standard notification that's displayed on recipients' devices and prompts a recipient to interact with the notification.</p></li><li><p>background - For a silent notification that delivers content in the background and isn't displayed on recipients' devices.</p></li><li><p>complication - For a notification that contains update information for an app’s complication timeline.</p></li><li><p>fileprovider - For a notification that signals changes to a File Provider extension.</p></li><li><p>mdm - For a notification that tells managed devices to contact the MDM server.</p></li><li><p>voip - For a notification that provides information about an incoming VoIP call.</p></li></ul><p>Amazon Pinpoint specifies this value in the apns-push-type request header when it sends the notification message to APNs. If you don't specify a value for this property, Amazon Pinpoint sets the value to alert or background automatically, based on the value that you specify for the SilentPush or RawContent property of the message.</p><p>For more information about the apns-push-type request header, see <a href="https://developer.apple.com/documentation/usernotifications/setting_up_a_remote_notification_server/sending_notification_requests_to_apns">Sending Notification Requests to APNs</a> on the Apple Developer website.</p>
 */
@property (nonatomic, strong) NSString * _Nullable APNSPushType;

/**
 <p>The action to occur if the recipient taps the push notification. Valid values are:</p><ul><li><p>OPEN_APP - Your app opens or it becomes the foreground app if it was sent to the background. This is the default action.</p></li><li><p>DEEP_LINK - Your app opens and displays a designated user interface in the app. This setting uses the deep-linking features of the iOS platform.</p></li><li><p>URL - The default mobile browser on the recipient's device opens and loads the web page at a URL that you specify.</p></li></ul>
 */
@property (nonatomic, assign) AWSPinpointTargetingAction action;

/**
 <p>The key that indicates whether and how to modify the badge of your app's icon when the recipient receives the push notification. If this key isn't included in the dictionary, the badge doesn't change. To remove the badge, set this value to 0.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable badge;

/**
 <p>The body of the notification message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable body;

/**
 <p>The key that indicates the notification type for the push notification. This key is a value that's defined by the identifier property of one of your app's registered categories.</p>
 */
@property (nonatomic, strong) NSString * _Nullable category;

/**
 <p>An arbitrary identifier that, if assigned to multiple messages, APNs uses to coalesce the messages into a single push notification instead of delivering each message individually. This value can't exceed 64 bytes.</p><p>Amazon Pinpoint specifies this value in the apns-collapse-id request header when it sends the notification message to APNs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable collapseId;

/**
 <p>The JSON payload to use for a silent push notification. This payload is added to the data.pinpoint.jsonBody object of the notification.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable data;

/**
 <p>The URL of an image or video to display in the push notification.</p>
 */
@property (nonatomic, strong) NSString * _Nullable mediaUrl;

/**
 <p>The authentication method that you want Amazon Pinpoint to use when authenticating with APNs, CERTIFICATE or TOKEN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable preferredAuthenticationMethod;

/**
 <p>para>5 - Low priority, the notification might be delayed, delivered as part of a group, or throttled.</p>/listitem><li><p>10 - High priority, the notification is sent immediately. This is the default value. A high priority notification should trigger an alert, play a sound, or badge your app's icon on the recipient's device.</p></li>/para><p>Amazon Pinpoint specifies this value in the apns-priority request header when it sends the notification message to APNs.</p><p>The equivalent values for Firebase Cloud Messaging (FCM), formerly Google Cloud Messaging (GCM), are normal, for 5, and high, for 10. If you specify an FCM value for this property, Amazon Pinpoint accepts and converts the value to the corresponding APNs value.</p>
 */
@property (nonatomic, strong) NSString * _Nullable priority;

/**
 <p>The raw, JSON-formatted string to use as the payload for the notification message. If specified, this value overrides all other content for the message.</p><note><p>If you specify the raw content of an APNs push notification, the message payload has to include the content-available key. The value of the content-available key has to be an integer, and can only be 0 or 1. If you're sending a standard notification, set the value of content-available to 0. If you're sending a silent (background) notification, set the value of content-available to 1. Additionally, silent notification payloads can't include the alert, badge, or sound keys. For more information, see <a href="https://developer.apple.com/documentation/usernotifications/setting_up_a_remote_notification_server/generating_a_remote_notification">Generating a Remote Notification</a> and <a href="https://developer.apple.com/documentation/usernotifications/setting_up_a_remote_notification_server/pushing_background_updates_to_your_app">Pushing Background Updates to Your App</a> on the Apple Developer website.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable rawContent;

/**
 <p>Specifies whether the notification is a silent push notification. A silent (or background) push notification isn't displayed on recipients' devices. You can use silent push notifications to make small updates to your app, or to display messages in an in-app message center.</p><p>Amazon Pinpoint uses this property to determine the correct value for the apns-push-type request header when it sends the notification message to APNs. If you specify a value of true for this property, Amazon Pinpoint sets the value for the apns-push-type header field to background.</p><note><p>If you specify the raw content of an APNs push notification, the message payload has to include the content-available key. For silent (background) notifications, set the value of content-available to 1. Additionally, the message payload for a silent notification can't include the alert, badge, or sound keys. For more information, see <a href="https://developer.apple.com/documentation/usernotifications/setting_up_a_remote_notification_server/generating_a_remote_notification">Generating a Remote Notification</a> and <a href="https://developer.apple.com/documentation/usernotifications/setting_up_a_remote_notification_server/pushing_background_updates_to_your_app">Pushing Background Updates to Your App</a> on the Apple Developer website.</p><p>Apple has indicated that they will throttle "excessive" background notifications based on current traffic volumes. To prevent your notifications being throttled, Apple recommends that you send no more than 3 silent push notifications to each recipient per hour.</p></note>
 */
@property (nonatomic, strong) NSNumber * _Nullable silentPush;

/**
 <p>The key for the sound to play when the recipient receives the push notification. The value for this key is the name of a sound file in your app's main bundle or the Library/Sounds folder in your app's data container. If the sound file can't be found or you specify default for the value, the system plays the default alert sound.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sound;

/**
 <p>The default message variables to use in the notification message. You can override these default variables with individual address variables.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSArray<NSString *> *> * _Nullable substitutions;

/**
 <p>The key that represents your app-specific identifier for grouping notifications. If you provide a Notification Content app extension, you can use this value to group your notifications together.</p>
 */
@property (nonatomic, strong) NSString * _Nullable threadId;

/**
 <p>The amount of time, in seconds, that APNs should store and attempt to deliver the push notification, if the service is unable to deliver the notification the first time. If this value is 0, APNs treats the notification as if it expires immediately and the service doesn't store or try to deliver the notification again.</p><p>Amazon Pinpoint specifies this value in the apns-expiration request header when it sends the notification message to APNs.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable timeToLive;

/**
 <p>The title to display above the notification message on the recipient's device.</p>
 */
@property (nonatomic, strong) NSString * _Nullable title;

/**
 <p>The URL to open in the recipient's default mobile browser, if a recipient taps the push notification and the value of the Action property is URL.</p>
 */
@property (nonatomic, strong) NSString * _Nullable url;

@end

/**
 <p>Specifies channel-specific content and settings for a message template that can be used in push notifications that are sent through the APNs (Apple Push Notification service) channel.</p>
 */
@interface AWSPinpointTargetingAPNSPushNotificationTemplate : AWSModel


/**
 <p>The action to occur if a recipient taps a push notification that's based on the message template. Valid values are:</p><ul><li><p>OPEN_APP - Your app opens or it becomes the foreground app if it was sent to the background. This is the default action.</p></li><li><p>DEEP_LINK - Your app opens and displays a designated user interface in the app. This setting uses the deep-linking features of the iOS platform.</p></li><li><p>URL - The default mobile browser on the recipient's device opens and loads the web page at a URL that you specify.</p></li></ul>
 */
@property (nonatomic, assign) AWSPinpointTargetingAction action;

/**
 <p>The message body to use in push notifications that are based on the message template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable body;

/**
 <p>The URL of an image or video to display in push notifications that are based on the message template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable mediaUrl;

/**
 <p>The raw, JSON-formatted string to use as the payload for push notifications that are based on the message template. If specified, this value overrides all other content for the message template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable rawContent;

/**
 <p>The key for the sound to play when the recipient receives a push notification that's based on the message template. The value for this key is the name of a sound file in your app's main bundle or the Library/Sounds folder in your app's data container. If the sound file can't be found or you specify default for the value, the system plays the default alert sound.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sound;

/**
 <p>The title to use in push notifications that are based on the message template. This title appears above the notification message on a recipient's device.</p>
 */
@property (nonatomic, strong) NSString * _Nullable title;

/**
 <p>The URL to open in the recipient's default mobile browser, if a recipient taps a push notification that's based on the message template and the value of the Action property is URL.</p>
 */
@property (nonatomic, strong) NSString * _Nullable url;

@end

/**
 <p>Specifies the status and settings of the APNs (Apple Push Notification service) sandbox channel for an application.</p>
 */
@interface AWSPinpointTargetingAPNSSandboxChannelRequest : AWSModel


/**
 <p>The bundle identifier that's assigned to your iOS app. This identifier is used for APNs tokens.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bundleId;

/**
 <p>The APNs client certificate that you received from Apple, if you want Amazon Pinpoint to communicate with the APNs sandbox environment by using an APNs certificate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificate;

/**
 <p>The default authentication method that you want Amazon Pinpoint to use when authenticating with the APNs sandbox environment, key or certificate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable defaultAuthenticationMethod;

/**
 <p>Specifies whether to enable the APNs sandbox channel for the application.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

/**
 <p>The private key for the APNs client certificate that you want Amazon Pinpoint to use to communicate with the APNs sandbox environment.</p>
 */
@property (nonatomic, strong) NSString * _Nullable privateKey;

/**
 <p>The identifier that's assigned to your Apple developer account team. This identifier is used for APNs tokens.</p>
 */
@property (nonatomic, strong) NSString * _Nullable teamId;

/**
 <p>The authentication key to use for APNs tokens.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tokenKey;

/**
 <p>The key identifier that's assigned to your APNs signing key, if you want Amazon Pinpoint to communicate with the APNs sandbox environment by using APNs tokens.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tokenKeyId;

@end

/**
 <p>Provides information about the status and settings of the APNs (Apple Push Notification service) sandbox channel for an application.</p>
 Required parameters: [Platform]
 */
@interface AWSPinpointTargetingAPNSSandboxChannelResponse : AWSModel


/**
 <p>The unique identifier for the application that the APNs sandbox channel applies to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 <p>The date and time when the APNs sandbox channel was enabled.</p>
 */
@property (nonatomic, strong) NSString * _Nullable creationDate;

/**
 <p>The default authentication method that Amazon Pinpoint uses to authenticate with the APNs sandbox environment for this channel, key or certificate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable defaultAuthenticationMethod;

/**
 <p>Specifies whether the APNs sandbox channel is enabled for the application.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

/**
 <p>(Not used) This property is retained only for backward compatibility.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable hasCredential;

/**
 <p>Specifies whether the APNs sandbox channel is configured to communicate with APNs by using APNs tokens. To provide an authentication key for APNs tokens, set the TokenKey property of the channel.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable hasTokenKey;

/**
 <p>(Deprecated) An identifier for the APNs sandbox channel. This property is retained only for backward compatibility.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>Specifies whether the APNs sandbox channel is archived.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isArchived;

/**
 <p>The user who last modified the APNs sandbox channel.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lastModifiedBy;

/**
 <p>The date and time when the APNs sandbox channel was last modified.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lastModifiedDate;

/**
 <p>The type of messaging or notification platform for the channel. For the APNs sandbox channel, this value is APNS_SANDBOX.</p>
 */
@property (nonatomic, strong) NSString * _Nullable platform;

/**
 <p>The current version of the APNs sandbox channel.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable version;

@end

/**
 <p>Specifies the status and settings of the APNs (Apple Push Notification service) VoIP channel for an application.</p>
 */
@interface AWSPinpointTargetingAPNSVoipChannelRequest : AWSModel


/**
 <p>The bundle identifier that's assigned to your iOS app. This identifier is used for APNs tokens.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bundleId;

/**
 <p>The APNs client certificate that you received from Apple, if you want Amazon Pinpoint to communicate with APNs by using an APNs certificate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificate;

/**
 <p>The default authentication method that you want Amazon Pinpoint to use when authenticating with APNs, key or certificate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable defaultAuthenticationMethod;

/**
 <p>Specifies whether to enable the APNs VoIP channel for the application.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

/**
 <p>The private key for the APNs client certificate that you want Amazon Pinpoint to use to communicate with APNs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable privateKey;

/**
 <p>The identifier that's assigned to your Apple developer account team. This identifier is used for APNs tokens.</p>
 */
@property (nonatomic, strong) NSString * _Nullable teamId;

/**
 <p>The authentication key to use for APNs tokens.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tokenKey;

/**
 <p>The key identifier that's assigned to your APNs signing key, if you want Amazon Pinpoint to communicate with APNs by using APNs tokens.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tokenKeyId;

@end

/**
 <p>Provides information about the status and settings of the APNs (Apple Push Notification service) VoIP channel for an application.</p>
 Required parameters: [Platform]
 */
@interface AWSPinpointTargetingAPNSVoipChannelResponse : AWSModel


/**
 <p>The unique identifier for the application that the APNs VoIP channel applies to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 <p>The date and time when the APNs VoIP channel was enabled.</p>
 */
@property (nonatomic, strong) NSString * _Nullable creationDate;

/**
 <p>The default authentication method that Amazon Pinpoint uses to authenticate with APNs for this channel, key or certificate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable defaultAuthenticationMethod;

/**
 <p>Specifies whether the APNs VoIP channel is enabled for the application.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

/**
 <p>(Not used) This property is retained only for backward compatibility.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable hasCredential;

/**
 <p>Specifies whether the APNs VoIP channel is configured to communicate with APNs by using APNs tokens. To provide an authentication key for APNs tokens, set the TokenKey property of the channel.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable hasTokenKey;

/**
 <p>(Deprecated) An identifier for the APNs VoIP channel. This property is retained only for backward compatibility.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>Specifies whether the APNs VoIP channel is archived.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isArchived;

/**
 <p>The user who last modified the APNs VoIP channel.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lastModifiedBy;

/**
 <p>The date and time when the APNs VoIP channel was last modified.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lastModifiedDate;

/**
 <p>The type of messaging or notification platform for the channel. For the APNs VoIP channel, this value is APNS_VOIP.</p>
 */
@property (nonatomic, strong) NSString * _Nullable platform;

/**
 <p>The current version of the APNs VoIP channel.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable version;

@end

/**
 <p>Specifies the status and settings of the APNs (Apple Push Notification service) VoIP sandbox channel for an application.</p>
 */
@interface AWSPinpointTargetingAPNSVoipSandboxChannelRequest : AWSModel


/**
 <p>The bundle identifier that's assigned to your iOS app. This identifier is used for APNs tokens.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bundleId;

/**
 <p>The APNs client certificate that you received from Apple, if you want Amazon Pinpoint to communicate with the APNs sandbox environment by using an APNs certificate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificate;

/**
 <p>The default authentication method that you want Amazon Pinpoint to use when authenticating with the APNs sandbox environment for this channel, key or certificate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable defaultAuthenticationMethod;

/**
 <p>Specifies whether the APNs VoIP sandbox channel is enabled for the application.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

/**
 <p>The private key for the APNs client certificate that you want Amazon Pinpoint to use to communicate with the APNs sandbox environment.</p>
 */
@property (nonatomic, strong) NSString * _Nullable privateKey;

/**
 <p>The identifier that's assigned to your Apple developer account team. This identifier is used for APNs tokens.</p>
 */
@property (nonatomic, strong) NSString * _Nullable teamId;

/**
 <p>The authentication key to use for APNs tokens.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tokenKey;

/**
 <p>The key identifier that's assigned to your APNs signing key, if you want Amazon Pinpoint to communicate with the APNs sandbox environment by using APNs tokens.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tokenKeyId;

@end

/**
 <p>Provides information about the status and settings of the APNs (Apple Push Notification service) VoIP sandbox channel for an application.</p>
 Required parameters: [Platform]
 */
@interface AWSPinpointTargetingAPNSVoipSandboxChannelResponse : AWSModel


/**
 <p>The unique identifier for the application that the APNs VoIP sandbox channel applies to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 <p>The date and time when the APNs VoIP sandbox channel was enabled.</p>
 */
@property (nonatomic, strong) NSString * _Nullable creationDate;

/**
 <p>The default authentication method that Amazon Pinpoint uses to authenticate with the APNs sandbox environment for this channel, key or certificate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable defaultAuthenticationMethod;

/**
 <p>Specifies whether the APNs VoIP sandbox channel is enabled for the application.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

/**
 <p>(Not used) This property is retained only for backward compatibility.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable hasCredential;

/**
 <p>Specifies whether the APNs VoIP sandbox channel is configured to communicate with APNs by using APNs tokens. To provide an authentication key for APNs tokens, set the TokenKey property of the channel.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable hasTokenKey;

/**
 <p>(Deprecated) An identifier for the APNs VoIP sandbox channel. This property is retained only for backward compatibility.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>Specifies whether the APNs VoIP sandbox channel is archived.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isArchived;

/**
 <p>The user who last modified the APNs VoIP sandbox channel.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lastModifiedBy;

/**
 <p>The date and time when the APNs VoIP sandbox channel was last modified.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lastModifiedDate;

/**
 <p>The type of messaging or notification platform for the channel. For the APNs VoIP sandbox channel, this value is APNS_VOIP_SANDBOX.</p>
 */
@property (nonatomic, strong) NSString * _Nullable platform;

/**
 <p>The current version of the APNs VoIP sandbox channel.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable version;

@end

/**
 <p>Provides information about the activities that were performed by a campaign.</p>
 Required parameters: [Item]
 */
@interface AWSPinpointTargetingActivitiesResponse : AWSModel


/**
 <p>An array of responses, one for each activity that was performed by the campaign.</p>
 */
@property (nonatomic, strong) NSArray<AWSPinpointTargetingActivityResponse *> * _Nullable item;

/**
 <p>The string to use in a subsequent request to get the next page of results in a paginated response. This value is null if there are no additional pages.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>Specifies the configuration and other settings for an activity in a journey.</p>
 */
@interface AWSPinpointTargetingActivity : AWSModel


/**
 <p>The settings for a yes/no split activity. This type of activity sends participants down one of two paths in a journey, based on conditions that you specify.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingConditionalSplitActivity * _Nullable conditionalSplit;

/**
 <p>The custom description of the activity.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The settings for an email activity. This type of activity sends an email message to participants.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingEmailMessageActivity * _Nullable EMAIL;

/**
 <p>The settings for a holdout activity. This type of activity stops a journey for a specified percentage of participants.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingHoldoutActivity * _Nullable holdout;

/**
 <p>The settings for a multivariate split activity. This type of activity sends participants down one of as many as five paths (including a default <i>Else</i> path) in a journey, based on conditions that you specify.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingMultiConditionalSplitActivity * _Nullable multiCondition;

/**
 <p>The settings for a random split activity. This type of activity randomly sends specified percentages of participants down one of as many as five paths in a journey, based on conditions that you specify.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingRandomSplitActivity * _Nullable randomSplit;

/**
 <p>The settings for a wait activity. This type of activity waits for a certain amount of time or until a specific date and time before moving participants to the next activity in a journey.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingWaitActivity * _Nullable wait;

@end

/**
 <p>Provides information about an activity that was performed by a campaign.</p>
 Required parameters: [CampaignId, Id, ApplicationId]
 */
@interface AWSPinpointTargetingActivityResponse : AWSModel


/**
 <p>The unique identifier for the application that the campaign applies to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 <p>The unique identifier for the campaign that the activity applies to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable campaignId;

/**
 <p>The actual time, in ISO 8601 format, when the activity was marked CANCELLED or COMPLETED.</p>
 */
@property (nonatomic, strong) NSString * _Nullable end;

/**
 <p>The unique identifier for the activity.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>Specifies whether the activity succeeded. Possible values are SUCCESS and FAIL.</p>
 */
@property (nonatomic, strong) NSString * _Nullable result;

/**
 <p>The scheduled start time, in ISO 8601 format, for the activity.</p>
 */
@property (nonatomic, strong) NSString * _Nullable scheduledStart;

/**
 <p>The actual start time, in ISO 8601 format, of the activity.</p>
 */
@property (nonatomic, strong) NSString * _Nullable start;

/**
 <p>The current status of the activity. Possible values are: PENDING, INITIALIZING, RUNNING, PAUSED, CANCELLED, and COMPLETED.</p>
 */
@property (nonatomic, strong) NSString * _Nullable state;

/**
 <p>The total number of endpoints that the campaign successfully delivered messages to.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable successfulEndpointCount;

/**
 <p>The total number of time zones that were completed.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable timezonesCompletedCount;

/**
 <p>The total number of unique time zones that are in the segment for the campaign.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable timezonesTotalCount;

/**
 <p>The total number of endpoints that the campaign attempted to deliver messages to.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable totalEndpointCount;

/**
 <p>The unique identifier for the campaign treatment that the activity applies to. A treatment is a variation of a campaign that's used for A/B testing of a campaign.</p>
 */
@property (nonatomic, strong) NSString * _Nullable treatmentId;

@end

/**
 <p>Specifies address-based configuration settings for a message that's sent directly to an endpoint.</p>
 */
@interface AWSPinpointTargetingAddressConfiguration : AWSModel


/**
 <p>The message body to use instead of the default message body. This value overrides the default message body.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bodyOverride;

/**
 <p>The channel to use when sending the message.</p>
 */
@property (nonatomic, assign) AWSPinpointTargetingChannelType channelType;

/**
 <p>An object that maps custom attributes to attributes for the address and is attached to the message. Attribute names are case sensitive.</p><p>For a push notification, this payload is added to the data.pinpoint object. For an email or text message, this payload is added to email/SMS delivery receipt event attributes.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable context;

/**
 <p>The raw, JSON-formatted string to use as the payload for the message. If specified, this value overrides all other values for the message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable rawContent;

/**
 <p>A map of the message variables to merge with the variables specified by properties of the DefaultMessage object. The variables specified in this map take precedence over all other variables.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSArray<NSString *> *> * _Nullable substitutions;

/**
 <p>The message title to use instead of the default message title. This value overrides the default message title.</p>
 */
@property (nonatomic, strong) NSString * _Nullable titleOverride;

@end

/**
 <p>Specifies channel-specific content and settings for a message template that can be used in push notifications that are sent through the ADM (Amazon Device Messaging), Baidu (Baidu Cloud Push), or GCM (Firebase Cloud Messaging, formerly Google Cloud Messaging) channel.</p>
 */
@interface AWSPinpointTargetingAndroidPushNotificationTemplate : AWSModel


/**
 <p>The action to occur if a recipient taps a push notification that's based on the message template. Valid values are:</p><ul><li><p>OPEN_APP - Your app opens or it becomes the foreground app if it was sent to the background. This is the default action.</p></li><li><p>DEEP_LINK - Your app opens and displays a designated user interface in the app. This action uses the deep-linking features of the Android platform.</p></li><li><p>URL - The default mobile browser on the recipient's device opens and loads the web page at a URL that you specify.</p></li></ul>
 */
@property (nonatomic, assign) AWSPinpointTargetingAction action;

/**
 <p>The message body to use in a push notification that's based on the message template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable body;

/**
 <p>The URL of the large icon image to display in the content view of a push notification that's based on the message template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable imageIconUrl;

/**
 <p>The URL of an image to display in a push notification that's based on the message template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable imageUrl;

/**
 <p>The raw, JSON-formatted string to use as the payload for a push notification that's based on the message template. If specified, this value overrides all other content for the message template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable rawContent;

/**
 <p>The URL of the small icon image to display in the status bar and the content view of a push notification that's based on the message template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable smallImageIconUrl;

/**
 <p>The sound to play when a recipient receives a push notification that's based on the message template. You can use the default stream or specify the file name of a sound resource that's bundled in your app. On an Android platform, the sound file must reside in /res/raw/.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sound;

/**
 <p>The title to use in a push notification that's based on the message template. This title appears above the notification message on a recipient's device.</p>
 */
@property (nonatomic, strong) NSString * _Nullable title;

/**
 <p>The URL to open in a recipient's default mobile browser, if a recipient taps a push notification that's based on the message template and the value of the Action property is URL.</p>
 */
@property (nonatomic, strong) NSString * _Nullable url;

@end

/**
 <p>Provides the results of a query that retrieved the data for a standard metric that applies to an application, and provides information about that query.</p>
 Required parameters: [KpiResult, KpiName, EndTime, StartTime, ApplicationId]
 */
@interface AWSPinpointTargetingApplicationDateRangeKpiResponse : AWSModel


/**
 <p>The unique identifier for the application that the metric applies to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 <p>The last date and time of the date range that was used to filter the query results, in extended ISO 8601 format. The date range is inclusive.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable endTime;

/**
 <p>The name of the metric, also referred to as a <i>key performance indicator (KPI)</i>, that the data was retrieved for. This value describes the associated metric and consists of two or more terms, which are comprised of lowercase alphanumeric characters, separated by a hyphen. For a list of possible values, see the <a href="https://docs.aws.amazon.com/pinpoint/latest/developerguide/welcome.html">Amazon Pinpoint Developer Guide</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable kpiName;

/**
 <p>An array of objects that contains the results of the query. Each object contains the value for the metric and metadata about that value.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingBaseKpiResult * _Nullable kpiResult;

/**
 <p>The string to use in a subsequent request to get the next page of results in a paginated response. This value is null for the Application Metrics resource because the resource returns all results in a single page.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The first date and time of the date range that was used to filter the query results, in extended ISO 8601 format. The date range is inclusive.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable startTime;

@end

/**
 <p>Provides information about an application.</p>
 Required parameters: [Id, Arn, Name]
 */
@interface AWSPinpointTargetingApplicationResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the application.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The display name of the application. This name is displayed as the <b>Project name</b> on the Amazon Pinpoint console.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>A string-to-string map of key-value pairs that identifies the tags that are associated with the application. Each tag consists of a required tag key and an associated tag value.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 <p>Provides information about an application, including the default settings for an application.</p>
 Required parameters: [ApplicationId]
 */
@interface AWSPinpointTargetingApplicationSettingsResource : AWSModel


/**
 <p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 <p>The settings for the AWS Lambda function to use by default as a code hook for campaigns in the application.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingCampaignHook * _Nullable campaignHook;

/**
 <p>The date and time, in ISO 8601 format, when the application's settings were last modified.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lastModifiedDate;

/**
 <p>The default sending limits for campaigns in the application.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingCampaignLimits * _Nullable limits;

/**
 <p>The default quiet time for campaigns and journeys in the application. Quiet time is a specific time range when messages aren't sent to endpoints, if all the following conditions are met:</p><ul><li><p>The EndpointDemographic.Timezone property of the endpoint is set to a valid value.</p></li><li><p>The current time in the endpoint's time zone is later than or equal to the time specified by the QuietTime.Start property for the application (or a campaign or journey that has custom quiet time settings).</p></li><li><p>The current time in the endpoint's time zone is earlier than or equal to the time specified by the QuietTime.End property for the application (or a campaign or journey that has custom quiet time settings).</p></li></ul><p>If any of the preceding conditions isn't met, the endpoint will receive messages from a campaign or journey, even if quiet time is enabled.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingQuietTime * _Nullable quietTime;

@end

/**
 <p>Provides information about all of your applications.</p>
 */
@interface AWSPinpointTargetingApplicationsResponse : AWSModel


/**
 <p>An array of responses, one for each application that was returned.</p>
 */
@property (nonatomic, strong) NSArray<AWSPinpointTargetingApplicationResponse *> * _Nullable item;

/**
 <p>The string to use in a subsequent request to get the next page of results in a paginated response. This value is null if there are no additional pages.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>Specifies attribute-based criteria for including or excluding endpoints from a segment.</p>
 Required parameters: [Values]
 */
@interface AWSPinpointTargetingAttributeDimension : AWSModel


/**
 <p>The type of segment dimension to use. Valid values are: INCLUSIVE, endpoints that match the criteria are included in the segment; and, EXCLUSIVE, endpoints that match the criteria are excluded from the segment.</p>
 */
@property (nonatomic, assign) AWSPinpointTargetingAttributeType attributeType;

/**
 <p>The criteria values to use for the segment dimension. Depending on the value of the AttributeType property, endpoints are included or excluded from the segment if their attribute values match the criteria values.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable values;

@end

/**
 <p>Provides information about the type and the names of attributes that were removed from all the endpoints that are associated with an application.</p>
 Required parameters: [AttributeType, ApplicationId]
 */
@interface AWSPinpointTargetingAttributesResource : AWSModel


/**
 <p>The unique identifier for the application.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 <p>The type of attribute or attributes that were removed from the endpoints. Valid values are:</p><ul><li><p>endpoint-custom-attributes - Custom attributes that describe endpoints.</p></li><li><p>endpoint-metric-attributes - Custom metrics that your app reports to Amazon Pinpoint for endpoints.</p></li><li><p>endpoint-user-attributes - Custom attributes that describe users.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable attributeType;

/**
 <p>An array that specifies the names of the attributes that were removed from the endpoints.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable attributes;

@end

/**
 <p>Specifies the status and settings of the Baidu (Baidu Cloud Push) channel for an application.</p>
 Required parameters: [SecretKey, ApiKey]
 */
@interface AWSPinpointTargetingBaiduChannelRequest : AWSModel


/**
 <p>The API key that you received from the Baidu Cloud Push service to communicate with the service.</p>
 */
@property (nonatomic, strong) NSString * _Nullable apiKey;

/**
 <p>Specifies whether to enable the Baidu channel for the application.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

/**
 <p>The secret key that you received from the Baidu Cloud Push service to communicate with the service.</p>
 */
@property (nonatomic, strong) NSString * _Nullable secretKey;

@end

/**
 <p>Provides information about the status and settings of the Baidu (Baidu Cloud Push) channel for an application.</p>
 Required parameters: [Credential, Platform]
 */
@interface AWSPinpointTargetingBaiduChannelResponse : AWSModel


/**
 <p>The unique identifier for the application that the Baidu channel applies to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 <p>The date and time when the Baidu channel was enabled.</p>
 */
@property (nonatomic, strong) NSString * _Nullable creationDate;

/**
 <p>The API key that you received from the Baidu Cloud Push service to communicate with the service.</p>
 */
@property (nonatomic, strong) NSString * _Nullable credential;

/**
 <p>Specifies whether the Baidu channel is enabled for the application.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

/**
 <p>(Not used) This property is retained only for backward compatibility.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable hasCredential;

/**
 <p>(Deprecated) An identifier for the Baidu channel. This property is retained only for backward compatibility.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>Specifies whether the Baidu channel is archived.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isArchived;

/**
 <p>The user who last modified the Baidu channel.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lastModifiedBy;

/**
 <p>The date and time when the Baidu channel was last modified.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lastModifiedDate;

/**
 <p>The type of messaging or notification platform for the channel. For the Baidu channel, this value is BAIDU.</p>
 */
@property (nonatomic, strong) NSString * _Nullable platform;

/**
 <p>The current version of the Baidu channel.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable version;

@end

/**
 <p>Specifies the settings for a one-time message that's sent directly to an endpoint through the Baidu (Baidu Cloud Push) channel.</p>
 */
@interface AWSPinpointTargetingBaiduMessage : AWSModel


/**
 <p>The action to occur if the recipient taps the push notification. Valid values are:</p><ul><li><p>OPEN_APP - Your app opens or it becomes the foreground app if it was sent to the background. This is the default action.</p></li><li><p>DEEP_LINK - Your app opens and displays a designated user interface in the app. This action uses the deep-linking features of the Android platform.</p></li><li><p>URL - The default mobile browser on the recipient's device opens and loads the web page at a URL that you specify.</p></li></ul>
 */
@property (nonatomic, assign) AWSPinpointTargetingAction action;

/**
 <p>The body of the notification message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable body;

/**
 <p>The JSON data payload to use for the push notification, if the notification is a silent push notification. This payload is added to the data.pinpoint.jsonBody object of the notification.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable data;

/**
 <p>The icon image name of the asset saved in your app.</p>
 */
@property (nonatomic, strong) NSString * _Nullable iconReference;

/**
 <p>The URL of the large icon image to display in the content view of the push notification.</p>
 */
@property (nonatomic, strong) NSString * _Nullable imageIconUrl;

/**
 <p>The URL of an image to display in the push notification.</p>
 */
@property (nonatomic, strong) NSString * _Nullable imageUrl;

/**
 <p>The raw, JSON-formatted string to use as the payload for the notification message. If specified, this value overrides all other content for the message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable rawContent;

/**
 <p>Specifies whether the notification is a silent push notification, which is a push notification that doesn't display on a recipient's device. Silent push notifications can be used for cases such as updating an app's configuration or supporting phone home functionality.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable silentPush;

/**
 <p>The URL of the small icon image to display in the status bar and the content view of the push notification.</p>
 */
@property (nonatomic, strong) NSString * _Nullable smallImageIconUrl;

/**
 <p>The sound to play when the recipient receives the push notification. You can use the default stream or specify the file name of a sound resource that's bundled in your app. On an Android platform, the sound file must reside in /res/raw/.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sound;

/**
 <p>The default message variables to use in the notification message. You can override the default variables with individual address variables.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSArray<NSString *> *> * _Nullable substitutions;

/**
 <p>The amount of time, in seconds, that the Baidu Cloud Push service should store the message if the recipient's device is offline. The default value and maximum supported time is 604,800 seconds (7 days).</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable timeToLive;

/**
 <p>The title to display above the notification message on the recipient's device.</p>
 */
@property (nonatomic, strong) NSString * _Nullable title;

/**
 <p>The URL to open in the recipient's default mobile browser, if a recipient taps the push notification and the value of the Action property is URL.</p>
 */
@property (nonatomic, strong) NSString * _Nullable url;

@end

/**
 <p>Provides the results of a query that retrieved the data for a standard metric that applies to an application, campaign, or journey.</p>
 Required parameters: [Rows]
 */
@interface AWSPinpointTargetingBaseKpiResult : AWSModel


/**
 <p>An array of objects that provides the results of a query that retrieved the data for a standard metric that applies to an application, campaign, or journey.</p>
 */
@property (nonatomic, strong) NSArray<AWSPinpointTargetingResultRow *> * _Nullable rows;

@end

/**
 <p>Provides the results of a query that retrieved the data for a standard metric that applies to a campaign, and provides information about that query.</p>
 Required parameters: [KpiResult, KpiName, EndTime, CampaignId, StartTime, ApplicationId]
 */
@interface AWSPinpointTargetingCampaignDateRangeKpiResponse : AWSModel


/**
 <p>The unique identifier for the application that the metric applies to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 <p>The unique identifier for the campaign that the metric applies to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable campaignId;

/**
 <p>The last date and time of the date range that was used to filter the query results, in extended ISO 8601 format. The date range is inclusive.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable endTime;

/**
 <p>The name of the metric, also referred to as a <i>key performance indicator (KPI)</i>, that the data was retrieved for. This value describes the associated metric and consists of two or more terms, which are comprised of lowercase alphanumeric characters, separated by a hyphen. For a list of possible values, see the <a href="https://docs.aws.amazon.com/pinpoint/latest/developerguide/welcome.html">Amazon Pinpoint Developer Guide</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable kpiName;

/**
 <p>An array of objects that contains the results of the query. Each object contains the value for the metric and metadata about that value.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingBaseKpiResult * _Nullable kpiResult;

/**
 <p>The string to use in a subsequent request to get the next page of results in a paginated response. This value is null for the Campaign Metrics resource because the resource returns all results in a single page.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The first date and time of the date range that was used to filter the query results, in extended ISO 8601 format. The date range is inclusive.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable startTime;

@end

/**
 <p>Specifies the content and "From" address for an email message that's sent to recipients of a campaign.</p>
 */
@interface AWSPinpointTargetingCampaignEmailMessage : AWSModel


/**
 <p>The body of the email for recipients whose email clients don't render HTML content.</p>
 */
@property (nonatomic, strong) NSString * _Nullable body;

/**
 <p>The verified email address to send the email from. The default address is the FromAddress specified for the email channel for the application.</p>
 */
@property (nonatomic, strong) NSString * _Nullable fromAddress;

/**
 <p>The body of the email, in HTML format, for recipients whose email clients render HTML content.</p>
 */
@property (nonatomic, strong) NSString * _Nullable htmlBody;

/**
 <p>The subject line, or title, of the email.</p>
 */
@property (nonatomic, strong) NSString * _Nullable title;

@end

/**
 <p>Specifies the settings for events that cause a campaign to be sent.</p>
 Required parameters: [FilterType, Dimensions]
 */
@interface AWSPinpointTargetingCampaignEventFilter : AWSModel


/**
 <p>The dimension settings of the event filter for the campaign.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingEventDimensions * _Nullable dimensions;

/**
 <p>The type of event that causes the campaign to be sent. Valid values are: SYSTEM, sends the campaign when a system event occurs; and, ENDPOINT, sends the campaign when an endpoint event (<linklinkend="apps-application-id-events">Events</link> resource) occurs.</p>
 */
@property (nonatomic, assign) AWSPinpointTargetingFilterType filterType;

@end

/**
 <p>Specifies the AWS Lambda function to use as a code hook for a campaign.</p>
 */
@interface AWSPinpointTargetingCampaignHook : AWSModel


/**
 <p>The name or Amazon Resource Name (ARN) of the AWS Lambda function that Amazon Pinpoint invokes to send messages for a campaign.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lambdaFunctionName;

/**
 <p>Specifies which Lambda mode to use when invoking the AWS Lambda function.</p>
 */
@property (nonatomic, assign) AWSPinpointTargetingMode mode;

/**
  <p>The web URL that Amazon Pinpoint calls to invoke the AWS Lambda function over HTTPS.</p>
 */
@property (nonatomic, strong) NSString * _Nullable webUrl;

@end

/**
 <p>Specifies limits on the messages that a campaign can send.</p>
 */
@interface AWSPinpointTargetingCampaignLimits : AWSModel


/**
 <p>The maximum number of messages that a campaign can send to a single endpoint during a 24-hour period. The maximum value is 100.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable daily;

/**
 <p>The maximum amount of time, in seconds, that a campaign can attempt to deliver a message after the scheduled start time for the campaign. The minimum value is 60 seconds.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maximumDuration;

/**
 <p>The maximum number of messages that a campaign can send each second. The minimum value is 50. The maximum value is 20,000.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable messagesPerSecond;

/**
 <p>The maximum number of messages that a campaign can send to a single endpoint during the course of the campaign. The maximum value is 100.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable total;

@end

/**
 <p>Provides information about the status, configuration, and other settings for a campaign.</p>
 Required parameters: [LastModifiedDate, CreationDate, SegmentId, SegmentVersion, Id, Arn, ApplicationId]
 */
@interface AWSPinpointTargetingCampaignResponse : AWSModel


/**
 <p>An array of responses, one for each treatment that you defined for the campaign, in addition to the default treatment.</p>
 */
@property (nonatomic, strong) NSArray<AWSPinpointTargetingTreatmentResource *> * _Nullable additionalTreatments;

/**
 <p>The unique identifier for the application that the campaign applies to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 <p>The Amazon Resource Name (ARN) of the campaign.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The date, in ISO 8601 format, when the campaign was created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable creationDate;

/**
 <p>The current status of the campaign's default treatment. This value exists only for campaigns that have more than one treatment, to support A/B testing.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingCampaignState * _Nullable defaultState;

/**
 <p>The custom description of the campaign.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The allocated percentage of users (segment members) who shouldn't receive messages from the campaign.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable holdoutPercent;

/**
 <p>The settings for the AWS Lambda function to use as a code hook for the campaign.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingCampaignHook * _Nullable hook;

/**
 <p>The unique identifier for the campaign.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>Specifies whether the campaign is paused. A paused campaign doesn't run unless you resume it by changing this value to false.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isPaused;

/**
 <p>The date, in ISO 8601 format, when the campaign was last modified.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lastModifiedDate;

/**
 <p>The messaging limits for the campaign.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingCampaignLimits * _Nullable limits;

/**
 <p>The message configuration settings for the campaign.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingMessageConfiguration * _Nullable messageConfiguration;

/**
 <p>The name of the campaign.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The schedule settings for the campaign.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingSchedule * _Nullable schedule;

/**
 <p>The unique identifier for the segment that's associated with the campaign.</p>
 */
@property (nonatomic, strong) NSString * _Nullable segmentId;

/**
 <p>The version number of the segment that's associated with the campaign.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable segmentVersion;

/**
 <p>The current status of the campaign.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingCampaignState * _Nullable state;

/**
 <p>The message template that’s used for the campaign.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingTemplateConfiguration * _Nullable templateConfiguration;

/**
 <p>The custom description of a variation of the campaign that's used for A/B testing.</p>
 */
@property (nonatomic, strong) NSString * _Nullable treatmentDescription;

/**
 <p>The custom name of a variation of the campaign that's used for A/B testing.</p>
 */
@property (nonatomic, strong) NSString * _Nullable treatmentName;

/**
 <p>The version number of the campaign.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable version;

/**
 <p>A string-to-string map of key-value pairs that identifies the tags that are associated with the campaign. Each tag consists of a required tag key and an associated tag value.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 <p>Specifies the content and settings for an SMS message that's sent to recipients of a campaign.</p>
 */
@interface AWSPinpointTargetingCampaignSmsMessage : AWSModel


/**
 <p>The body of the SMS message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable body;

/**
 <p>The type of SMS message. Valid values are: TRANSACTIONAL, the message is critical or time-sensitive, such as a one-time password that supports a customer transaction; and, PROMOTIONAL, the message isn't critical or time-sensitive, such as a marketing message.</p>
 */
@property (nonatomic, assign) AWSPinpointTargetingMessageType messageType;

/**
 <p>The sender ID to display on recipients' devices when they receive the SMS message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable senderId;

@end

/**
 <p>Provides information about the status of a campaign.</p>
 */
@interface AWSPinpointTargetingCampaignState : AWSModel


/**
 <p>The current status of the campaign, or the current status of a treatment that belongs to an A/B test campaign. If a campaign uses A/B testing, the campaign has a status of COMPLETED only if all campaign treatments have a status of COMPLETED.</p>
 */
@property (nonatomic, assign) AWSPinpointTargetingCampaignStatus campaignStatus;

@end

/**
 <p>Provides information about the configuration and other settings for all the campaigns that are associated with an application.</p>
 Required parameters: [Item]
 */
@interface AWSPinpointTargetingCampaignsResponse : AWSModel


/**
 <p>An array of responses, one for each campaign that's associated with the application.</p>
 */
@property (nonatomic, strong) NSArray<AWSPinpointTargetingCampaignResponse *> * _Nullable item;

/**
 <p>The string to use in a subsequent request to get the next page of results in a paginated response. This value is null if there are no additional pages.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>Provides information about the general settings and status of a channel for an application.</p>
 */
@interface AWSPinpointTargetingChannelResponse : AWSModel


/**
 <p>The unique identifier for the application.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 <p>The date and time, in ISO 8601 format, when the channel was enabled.</p>
 */
@property (nonatomic, strong) NSString * _Nullable creationDate;

/**
 <p>Specifies whether the channel is enabled for the application.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

/**
 <p>(Not used) This property is retained only for backward compatibility.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable hasCredential;

/**
 <p>(Deprecated) An identifier for the channel. This property is retained only for backward compatibility.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>Specifies whether the channel is archived.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isArchived;

/**
 <p>The user who last modified the channel.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lastModifiedBy;

/**
 <p>The date and time, in ISO 8601 format, when the channel was last modified.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lastModifiedDate;

/**
 <p>The current version of the channel.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable version;

@end

/**
 <p>Provides information about the general settings and status of all channels for an application, including channels that aren't enabled for the application.</p>
 Required parameters: [Channels]
 */
@interface AWSPinpointTargetingChannelsResponse : AWSModel


/**
 <p>A map that contains a multipart response for each channel. For each item in this object, the ChannelType is the key and the Channel is the value.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSPinpointTargetingChannelResponse *> * _Nullable channels;

@end

/**
 <p>Specifies the conditions to evaluate for an activity in a journey, and how to evaluate those conditions.</p>
 */
@interface AWSPinpointTargetingCondition : AWSModel


/**
 <p>The conditions to evaluate for the activity.</p>
 */
@property (nonatomic, strong) NSArray<AWSPinpointTargetingSimpleCondition *> * _Nullable conditions;

/**
 <p>Specifies how to handle multiple conditions for the activity. For example, if you specify two conditions for an activity, whether both or only one of the conditions must be met for the activity to be performed.</p>
 */
@property (nonatomic, assign) AWSPinpointTargetingOperator operator;

@end

/**
 <p>Specifies the settings for a yes/no split activity in a journey. This type of activity sends participants down one of two paths in a journey, based on conditions that you specify.</p>
 */
@interface AWSPinpointTargetingConditionalSplitActivity : AWSModel


/**
 <p>The conditions that define the paths for the activity, and the relationship between the conditions.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingCondition * _Nullable condition;

/**
 <p>The amount of time to wait before determining whether the conditions are met, or the date and time when Amazon Pinpoint determines whether the conditions are met.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingWaitTime * _Nullable evaluationWaitTime;

/**
 <p>The unique identifier for the activity to perform if the conditions aren't met.</p>
 */
@property (nonatomic, strong) NSString * _Nullable falseActivity;

/**
 <p>The unique identifier for the activity to perform if the conditions are met.</p>
 */
@property (nonatomic, strong) NSString * _Nullable trueActivity;

@end

/**
 
 */
@interface AWSPinpointTargetingCreateAppRequest : AWSRequest


/**
 <p>Specifies the display name of an application and the tags to associate with the application.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingCreateApplicationRequest * _Nullable createApplicationRequest;

@end

/**
 
 */
@interface AWSPinpointTargetingCreateAppResponse : AWSModel


/**
 <p>Provides information about an application.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingApplicationResponse * _Nullable applicationResponse;

@end

/**
 <p>Specifies the display name of an application and the tags to associate with the application.</p>
 Required parameters: [Name]
 */
@interface AWSPinpointTargetingCreateApplicationRequest : AWSModel


/**
 <p>The display name of the application. This name is displayed as the <b>Project name</b> on the Amazon Pinpoint console.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>A string-to-string map of key-value pairs that defines the tags to associate with the application. Each tag consists of a required tag key and an associated tag value.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSPinpointTargetingCreateCampaignRequest : AWSRequest


/**
 <p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 <p>Specifies the configuration and other settings for a campaign.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingWriteCampaignRequest * _Nullable writeCampaignRequest;

@end

/**
 
 */
@interface AWSPinpointTargetingCreateCampaignResponse : AWSModel


/**
 <p>Provides information about the status, configuration, and other settings for a campaign.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingCampaignResponse * _Nullable campaignResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingCreateEmailTemplateRequest : AWSRequest


/**
 <p>Specifies the content and settings for a message template that can be used in messages that are sent through the email channel.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingEmailTemplateRequest * _Nullable emailTemplateRequest;

/**
 <p>The name of the message template. A template name must start with an alphanumeric character and can contain a maximum of 128 characters. The characters can be alphanumeric characters, underscores (_), or hyphens (-). Template names are case sensitive.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateName;

@end

/**
 
 */
@interface AWSPinpointTargetingCreateEmailTemplateResponse : AWSModel


/**
 <p>Provides information about a request to create a message template.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingCreateTemplateMessageBody * _Nullable createTemplateMessageBody;

@end

/**
 
 */
@interface AWSPinpointTargetingCreateExportJobRequest : AWSRequest


/**
 <p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 <p>Specifies the settings for a job that exports endpoint definitions to an Amazon Simple Storage Service (Amazon S3) bucket.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingExportJobRequest * _Nullable exportJobRequest;

@end

/**
 
 */
@interface AWSPinpointTargetingCreateExportJobResponse : AWSModel


/**
 <p>Provides information about the status and settings of a job that exports endpoint definitions to a file. The file can be added directly to an Amazon Simple Storage Service (Amazon S3) bucket by using the Amazon Pinpoint API or downloaded directly to a computer by using the Amazon Pinpoint console.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingExportJobResponse * _Nullable exportJobResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingCreateImportJobRequest : AWSRequest


/**
 <p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 <p>Specifies the settings for a job that imports endpoint definitions from an Amazon Simple Storage Service (Amazon S3) bucket.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingImportJobRequest * _Nullable importJobRequest;

@end

/**
 
 */
@interface AWSPinpointTargetingCreateImportJobResponse : AWSModel


/**
 <p>Provides information about the status and settings of a job that imports endpoint definitions from one or more files. The files can be stored in an Amazon Simple Storage Service (Amazon S3) bucket or uploaded directly from a computer by using the Amazon Pinpoint console.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingImportJobResponse * _Nullable importJobResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingCreateJourneyRequest : AWSRequest


/**
 <p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 <p>Specifies the configuration and other settings for a journey.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingWriteJourneyRequest * _Nullable writeJourneyRequest;

@end

/**
 
 */
@interface AWSPinpointTargetingCreateJourneyResponse : AWSModel


/**
 <p>Provides information about the status, configuration, and other settings for a journey.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingJourneyResponse * _Nullable journeyResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingCreatePushTemplateRequest : AWSRequest


/**
 <p>Specifies the content and settings for a message template that can be used in messages that are sent through a push notification channel.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingPushNotificationTemplateRequest * _Nullable pushNotificationTemplateRequest;

/**
 <p>The name of the message template. A template name must start with an alphanumeric character and can contain a maximum of 128 characters. The characters can be alphanumeric characters, underscores (_), or hyphens (-). Template names are case sensitive.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateName;

@end

/**
 
 */
@interface AWSPinpointTargetingCreatePushTemplateResponse : AWSModel


/**
 <p>Provides information about a request to create a message template.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingCreateTemplateMessageBody * _Nullable createTemplateMessageBody;

@end

/**
 <p>Specifies Amazon Pinpoint configuration settings for retrieving and processing recommendation data from a recommender model.</p>
 Required parameters: [RecommendationProviderUri, RecommendationProviderRoleArn]
 */
@interface AWSPinpointTargetingCreateRecommenderConfiguration : AWSModel


/**
 <p>A map of key-value pairs that defines 1-10 custom endpoint or user attributes, depending on the value for the RecommenderUserIdType property. Each of these attributes temporarily stores a recommended item that's retrieved from the recommender model and sent to an AWS Lambda function for additional processing. Each attribute can be used as a message variable in a message template.</p><p>In the map, the key is the name of a custom attribute and the value is a custom display name for that attribute. The display name appears in the <b>Attribute finder</b> pane of the template editor on the Amazon Pinpoint console. The following restrictions apply to these names:</p><ul><li><p>An attribute name must start with a letter or number and it can contain up to 50 characters. The characters can be letters, numbers, underscores (_), or hyphens (-). Attribute names are case sensitive and must be unique.</p></li><li><p>An attribute display name must start with a letter or number and it can contain up to 25 characters. The characters can be letters, numbers, spaces, underscores (_), or hyphens (-).</p></li></ul><p>This object is required if the configuration invokes an AWS Lambda function (LambdaFunctionArn) to process recommendation data. Otherwise, don't include this object in your request.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable attributes;

/**
 <p>A custom description of the configuration for the recommender model. The description can contain up to 128 characters.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>A custom name of the configuration for the recommender model. The name must start with a letter or number and it can contain up to 128 characters. The characters can be letters, numbers, spaces, underscores (_), or hyphens (-).</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The type of Amazon Pinpoint ID to associate with unique user IDs in the recommender model. This value enables the model to use attribute and event data that’s specific to a particular endpoint or user in an Amazon Pinpoint application. Valid values are:</p><ul><li><p>PINPOINT_ENDPOINT_ID - Associate each user in the model with a particular endpoint in Amazon Pinpoint. The data is correlated based on endpoint IDs in Amazon Pinpoint. This is the default value.</p></li><li><p>PINPOINT_USER_ID - Associate each user in the model with a particular user and endpoint in Amazon Pinpoint. The data is correlated based on user IDs in Amazon Pinpoint. If you specify this value, an endpoint definition in Amazon Pinpoint has to specify a both a user ID (UserId) and an endpoint ID. Otherwise, messages won’t be sent to the user's endpoint.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable recommendationProviderIdType;

/**
 <p>The Amazon Resource Name (ARN) of the AWS Identity and Access Management (IAM) role that authorizes Amazon Pinpoint to retrieve recommendation data from the recommender model.</p>
 */
@property (nonatomic, strong) NSString * _Nullable recommendationProviderRoleArn;

/**
 <p>The Amazon Resource Name (ARN) of the recommender model to retrieve recommendation data from. This value must match the ARN of an Amazon Personalize campaign.</p>
 */
@property (nonatomic, strong) NSString * _Nullable recommendationProviderUri;

/**
 <p>The name or Amazon Resource Name (ARN) of the AWS Lambda function to invoke for additional processing of recommendation data that's retrieved from the recommender model.</p>
 */
@property (nonatomic, strong) NSString * _Nullable recommendationTransformerUri;

/**
 <p>A custom display name for the standard endpoint or user attribute (RecommendationItems) that temporarily stores a recommended item for each endpoint or user, depending on the value for the RecommenderUserIdType property. This value is required if the configuration doesn't invoke an AWS Lambda function (LambdaFunctionArn) to perform additional processing of recommendation data.</p><p>This name appears in the <b>Attribute finder</b> pane of the template editor on the Amazon Pinpoint console. The name can contain up to 25 characters. The characters can be letters, numbers, spaces, underscores (_), or hyphens (-). These restrictions don't apply to attribute values.</p>
 */
@property (nonatomic, strong) NSString * _Nullable recommendationsDisplayName;

/**
 <p>The number of recommended items to retrieve from the model for each endpoint or user, depending on the value for the RecommenderUserIdType property. This number determines how many recommended attributes are available for use as message variables in message templates. The minimum value is 1. The maximum value is 5. The default value is 5.</p><p>To use multiple recommended items and custom attributes with message variables, you have to use an AWS Lambda function (LambdaFunctionArn) to perform additional processing of recommendation data.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable recommendationsPerMessage;

@end

/**
 
 */
@interface AWSPinpointTargetingCreateRecommenderConfigurationRequest : AWSRequest


/**
 <p>Specifies Amazon Pinpoint configuration settings for retrieving and processing recommendation data from a recommender model.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingCreateRecommenderConfiguration * _Nullable createRecommenderConfiguration;

@end

/**
 
 */
@interface AWSPinpointTargetingCreateRecommenderConfigurationResponse : AWSModel


/**
 <p>Provides information about Amazon Pinpoint configuration settings for retrieving and processing data from a recommender model.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingRecommenderConfigurationResponse * _Nullable recommenderConfigurationResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingCreateSegmentRequest : AWSRequest


/**
 <p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 <p>Specifies the configuration, dimension, and other settings for a segment. A WriteSegmentRequest object can include a Dimensions object or a SegmentGroups object, but not both.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingWriteSegmentRequest * _Nullable writeSegmentRequest;

@end

/**
 
 */
@interface AWSPinpointTargetingCreateSegmentResponse : AWSModel


/**
 <p>Provides information about the configuration, dimension, and other settings for a segment.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingSegmentResponse * _Nullable segmentResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingCreateSmsTemplateRequest : AWSRequest


/**
 <p>Specifies the content and settings for a message template that can be used in text messages that are sent through the SMS channel.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingSMSTemplateRequest * _Nullable SMSTemplateRequest;

/**
 <p>The name of the message template. A template name must start with an alphanumeric character and can contain a maximum of 128 characters. The characters can be alphanumeric characters, underscores (_), or hyphens (-). Template names are case sensitive.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateName;

@end

/**
 
 */
@interface AWSPinpointTargetingCreateSmsTemplateResponse : AWSModel


/**
 <p>Provides information about a request to create a message template.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingCreateTemplateMessageBody * _Nullable createTemplateMessageBody;

@end

/**
 <p>Provides information about a request to create a message template.</p>
 */
@interface AWSPinpointTargetingCreateTemplateMessageBody : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the message template that was created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The message that's returned from the API for the request to create the message template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

/**
 <p>The unique identifier for the request to create the message template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable requestID;

@end

/**
 
 */
@interface AWSPinpointTargetingCreateVoiceTemplateRequest : AWSRequest


/**
 <p>The name of the message template. A template name must start with an alphanumeric character and can contain a maximum of 128 characters. The characters can be alphanumeric characters, underscores (_), or hyphens (-). Template names are case sensitive.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateName;

/**
 <p>Specifies the content and settings for a message template that can be used in messages that are sent through the voice channel.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingVoiceTemplateRequest * _Nullable voiceTemplateRequest;

@end

/**
 
 */
@interface AWSPinpointTargetingCreateVoiceTemplateResponse : AWSModel


/**
 <p>Provides information about a request to create a message template.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingCreateTemplateMessageBody * _Nullable createTemplateMessageBody;

@end

/**
 <p>Specifies the default message for all channels.</p>
 */
@interface AWSPinpointTargetingDefaultMessage : AWSModel


/**
 <p>The default body of the message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable body;

/**
 <p>The default message variables to use in the message. You can override these default variables with individual address variables.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSArray<NSString *> *> * _Nullable substitutions;

@end

/**
 <p>Specifies the default settings and content for a push notification that's sent directly to an endpoint.</p>
 */
@interface AWSPinpointTargetingDefaultPushNotificationMessage : AWSModel


/**
 <p>The default action to occur if a recipient taps the push notification. Valid values are:</p><ul><li><p>OPEN_APP - Your app opens or it becomes the foreground app if it was sent to the background. This is the default action.</p></li><li><p>DEEP_LINK - Your app opens and displays a designated user interface in the app. This setting uses the deep-linking features of the iOS and Android platforms.</p></li><li><p>URL - The default mobile browser on the recipient's device opens and loads the web page at a URL that you specify.</p></li></ul>
 */
@property (nonatomic, assign) AWSPinpointTargetingAction action;

/**
 <p>The default body of the notification message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable body;

/**
 <p>The JSON data payload to use for the default push notification, if the notification is a silent push notification. This payload is added to the data.pinpoint.jsonBody object of the notification.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable data;

/**
 <p>Specifies whether the default notification is a silent push notification, which is a push notification that doesn't display on a recipient's device. Silent push notifications can be used for cases such as updating an app's configuration or delivering messages to an in-app notification center.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable silentPush;

/**
 <p>The default message variables to use in the notification message. You can override the default variables with individual address variables.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSArray<NSString *> *> * _Nullable substitutions;

/**
 <p>The default title to display above the notification message on a recipient's device.</p>
 */
@property (nonatomic, strong) NSString * _Nullable title;

/**
 <p>The default URL to open in a recipient's default mobile browser, if a recipient taps the push notification and the value of the Action property is URL.</p>
 */
@property (nonatomic, strong) NSString * _Nullable url;

@end

/**
 <p>Specifies the default settings and content for a message template that can be used in messages that are sent through a push notification channel.</p>
 */
@interface AWSPinpointTargetingDefaultPushNotificationTemplate : AWSModel


/**
 <p>The action to occur if a recipient taps a push notification that's based on the message template. Valid values are:</p><ul><li><p>OPEN_APP - Your app opens or it becomes the foreground app if it was sent to the background. This is the default action.</p></li><li><p>DEEP_LINK - Your app opens and displays a designated user interface in the app. This setting uses the deep-linking features of the iOS and Android platforms.</p></li><li><p>URL - The default mobile browser on the recipient's device opens and loads the web page at a URL that you specify.</p></li></ul>
 */
@property (nonatomic, assign) AWSPinpointTargetingAction action;

/**
 <p>The message body to use in push notifications that are based on the message template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable body;

/**
 <p>The sound to play when a recipient receives a push notification that's based on the message template. You can use the default stream or specify the file name of a sound resource that's bundled in your app. On an Android platform, the sound file must reside in /res/raw/.</p><p>For an iOS platform, this value is the key for the name of a sound file in your app's main bundle or the Library/Sounds folder in your app's data container. If the sound file can't be found or you specify default for the value, the system plays the default alert sound.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sound;

/**
 <p>The title to use in push notifications that are based on the message template. This title appears above the notification message on a recipient's device.</p>
 */
@property (nonatomic, strong) NSString * _Nullable title;

/**
 <p>The URL to open in a recipient's default mobile browser, if a recipient taps a push notification that's based on the message template and the value of the Action property is URL.</p>
 */
@property (nonatomic, strong) NSString * _Nullable url;

@end

/**
 
 */
@interface AWSPinpointTargetingDeleteAdmChannelRequest : AWSRequest


/**
 <p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

@end

/**
 
 */
@interface AWSPinpointTargetingDeleteAdmChannelResponse : AWSModel


/**
 <p>Provides information about the status and settings of the ADM (Amazon Device Messaging) channel for an application.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingADMChannelResponse * _Nullable ADMChannelResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingDeleteApnsChannelRequest : AWSRequest


/**
 <p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

@end

/**
 
 */
@interface AWSPinpointTargetingDeleteApnsChannelResponse : AWSModel


/**
 <p>Provides information about the status and settings of the APNs (Apple Push Notification service) channel for an application.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingAPNSChannelResponse * _Nullable APNSChannelResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingDeleteApnsSandboxChannelRequest : AWSRequest


/**
 <p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

@end

/**
 
 */
@interface AWSPinpointTargetingDeleteApnsSandboxChannelResponse : AWSModel


/**
 <p>Provides information about the status and settings of the APNs (Apple Push Notification service) sandbox channel for an application.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingAPNSSandboxChannelResponse * _Nullable APNSSandboxChannelResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingDeleteApnsVoipChannelRequest : AWSRequest


/**
 <p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

@end

/**
 
 */
@interface AWSPinpointTargetingDeleteApnsVoipChannelResponse : AWSModel


/**
 <p>Provides information about the status and settings of the APNs (Apple Push Notification service) VoIP channel for an application.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingAPNSVoipChannelResponse * _Nullable APNSVoipChannelResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingDeleteApnsVoipSandboxChannelRequest : AWSRequest


/**
 <p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

@end

/**
 
 */
@interface AWSPinpointTargetingDeleteApnsVoipSandboxChannelResponse : AWSModel


/**
 <p>Provides information about the status and settings of the APNs (Apple Push Notification service) VoIP sandbox channel for an application.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingAPNSVoipSandboxChannelResponse * _Nullable APNSVoipSandboxChannelResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingDeleteAppRequest : AWSRequest


/**
 <p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

@end

/**
 
 */
@interface AWSPinpointTargetingDeleteAppResponse : AWSModel


/**
 <p>Provides information about an application.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingApplicationResponse * _Nullable applicationResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingDeleteBaiduChannelRequest : AWSRequest


/**
 <p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

@end

/**
 
 */
@interface AWSPinpointTargetingDeleteBaiduChannelResponse : AWSModel


/**
 <p>Provides information about the status and settings of the Baidu (Baidu Cloud Push) channel for an application.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingBaiduChannelResponse * _Nullable baiduChannelResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingDeleteCampaignRequest : AWSRequest


/**
 <p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 <p>The unique identifier for the campaign.</p>
 */
@property (nonatomic, strong) NSString * _Nullable campaignId;

@end

/**
 
 */
@interface AWSPinpointTargetingDeleteCampaignResponse : AWSModel


/**
 <p>Provides information about the status, configuration, and other settings for a campaign.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingCampaignResponse * _Nullable campaignResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingDeleteEmailChannelRequest : AWSRequest


/**
 <p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

@end

/**
 
 */
@interface AWSPinpointTargetingDeleteEmailChannelResponse : AWSModel


/**
 <p>Provides information about the status and settings of the email channel for an application.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingEmailChannelResponse * _Nullable emailChannelResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingDeleteEmailTemplateRequest : AWSRequest


/**
 <p>The name of the message template. A template name must start with an alphanumeric character and can contain a maximum of 128 characters. The characters can be alphanumeric characters, underscores (_), or hyphens (-). Template names are case sensitive.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateName;

/**
 <p>The unique identifier for the version of the message template to update, retrieve information about, or delete. To retrieve identifiers and other information for all the versions of a template, use the <linklinkend="templates-template-name-template-type-versions">Template Versions</link> resource.</p><p>If specified, this value must match the identifier for an existing template version. If specified for an update operation, this value must match the identifier for the latest existing version of the template. This restriction helps ensure that race conditions don't occur.</p><p>If you don't specify a value for this parameter, Amazon Pinpoint does the following:</p><ul><li><p>For a get operation, retrieves information about the active version of the template.</p></li><li><p>For an update operation, saves the updates to (overwrites) the latest existing version of the template, if the create-new-version parameter isn't used or is set to false.</p></li><li><p>For a delete operation, deletes the template, including all versions of the template.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable version;

@end

/**
 
 */
@interface AWSPinpointTargetingDeleteEmailTemplateResponse : AWSModel


/**
 <p>Provides information about an API request or response.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingMessageBody * _Nullable messageBody;

@end

/**
 
 */
@interface AWSPinpointTargetingDeleteEndpointRequest : AWSRequest


/**
 <p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 <p>The unique identifier for the endpoint.</p>
 */
@property (nonatomic, strong) NSString * _Nullable endpointId;

@end

/**
 
 */
@interface AWSPinpointTargetingDeleteEndpointResponse : AWSModel


/**
 <p>Provides information about the channel type and other settings for an endpoint.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingEndpointResponse * _Nullable endpointResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingDeleteEventStreamRequest : AWSRequest


/**
 <p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

@end

/**
 
 */
@interface AWSPinpointTargetingDeleteEventStreamResponse : AWSModel


/**
 <p>Specifies settings for publishing event data to an Amazon Kinesis data stream or an Amazon Kinesis Data Firehose delivery stream.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingEventStream * _Nullable eventStream;

@end

/**
 
 */
@interface AWSPinpointTargetingDeleteGcmChannelRequest : AWSRequest


/**
 <p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

@end

/**
 
 */
@interface AWSPinpointTargetingDeleteGcmChannelResponse : AWSModel


/**
 <p>Provides information about the status and settings of the GCM channel for an application. The GCM channel enables Amazon Pinpoint to send push notifications through the Firebase Cloud Messaging (FCM), formerly Google Cloud Messaging (GCM), service.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingGCMChannelResponse * _Nullable GCMChannelResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingDeleteJourneyRequest : AWSRequest


/**
 <p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 <p>The unique identifier for the journey.</p>
 */
@property (nonatomic, strong) NSString * _Nullable journeyId;

@end

/**
 
 */
@interface AWSPinpointTargetingDeleteJourneyResponse : AWSModel


/**
 <p>Provides information about the status, configuration, and other settings for a journey.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingJourneyResponse * _Nullable journeyResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingDeletePushTemplateRequest : AWSRequest


/**
 <p>The name of the message template. A template name must start with an alphanumeric character and can contain a maximum of 128 characters. The characters can be alphanumeric characters, underscores (_), or hyphens (-). Template names are case sensitive.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateName;

/**
 <p>The unique identifier for the version of the message template to update, retrieve information about, or delete. To retrieve identifiers and other information for all the versions of a template, use the <linklinkend="templates-template-name-template-type-versions">Template Versions</link> resource.</p><p>If specified, this value must match the identifier for an existing template version. If specified for an update operation, this value must match the identifier for the latest existing version of the template. This restriction helps ensure that race conditions don't occur.</p><p>If you don't specify a value for this parameter, Amazon Pinpoint does the following:</p><ul><li><p>For a get operation, retrieves information about the active version of the template.</p></li><li><p>For an update operation, saves the updates to (overwrites) the latest existing version of the template, if the create-new-version parameter isn't used or is set to false.</p></li><li><p>For a delete operation, deletes the template, including all versions of the template.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable version;

@end

/**
 
 */
@interface AWSPinpointTargetingDeletePushTemplateResponse : AWSModel


/**
 <p>Provides information about an API request or response.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingMessageBody * _Nullable messageBody;

@end

/**
 
 */
@interface AWSPinpointTargetingDeleteRecommenderConfigurationRequest : AWSRequest


/**
 <p>The unique identifier for the recommender model configuration. This identifier is displayed as the <b>Recommender ID</b> on the Amazon Pinpoint console.</p>
 */
@property (nonatomic, strong) NSString * _Nullable recommenderId;

@end

/**
 
 */
@interface AWSPinpointTargetingDeleteRecommenderConfigurationResponse : AWSModel


/**
 <p>Provides information about Amazon Pinpoint configuration settings for retrieving and processing data from a recommender model.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingRecommenderConfigurationResponse * _Nullable recommenderConfigurationResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingDeleteSegmentRequest : AWSRequest


/**
 <p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 <p>The unique identifier for the segment.</p>
 */
@property (nonatomic, strong) NSString * _Nullable segmentId;

@end

/**
 
 */
@interface AWSPinpointTargetingDeleteSegmentResponse : AWSModel


/**
 <p>Provides information about the configuration, dimension, and other settings for a segment.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingSegmentResponse * _Nullable segmentResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingDeleteSmsChannelRequest : AWSRequest


/**
 <p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

@end

/**
 
 */
@interface AWSPinpointTargetingDeleteSmsChannelResponse : AWSModel


/**
 <p>Provides information about the status and settings of the SMS channel for an application.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingSMSChannelResponse * _Nullable SMSChannelResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingDeleteSmsTemplateRequest : AWSRequest


/**
 <p>The name of the message template. A template name must start with an alphanumeric character and can contain a maximum of 128 characters. The characters can be alphanumeric characters, underscores (_), or hyphens (-). Template names are case sensitive.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateName;

/**
 <p>The unique identifier for the version of the message template to update, retrieve information about, or delete. To retrieve identifiers and other information for all the versions of a template, use the <linklinkend="templates-template-name-template-type-versions">Template Versions</link> resource.</p><p>If specified, this value must match the identifier for an existing template version. If specified for an update operation, this value must match the identifier for the latest existing version of the template. This restriction helps ensure that race conditions don't occur.</p><p>If you don't specify a value for this parameter, Amazon Pinpoint does the following:</p><ul><li><p>For a get operation, retrieves information about the active version of the template.</p></li><li><p>For an update operation, saves the updates to (overwrites) the latest existing version of the template, if the create-new-version parameter isn't used or is set to false.</p></li><li><p>For a delete operation, deletes the template, including all versions of the template.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable version;

@end

/**
 
 */
@interface AWSPinpointTargetingDeleteSmsTemplateResponse : AWSModel


/**
 <p>Provides information about an API request or response.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingMessageBody * _Nullable messageBody;

@end

/**
 
 */
@interface AWSPinpointTargetingDeleteUserEndpointsRequest : AWSRequest


/**
 <p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 <p>The unique identifier for the user.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userId;

@end

/**
 
 */
@interface AWSPinpointTargetingDeleteUserEndpointsResponse : AWSModel


/**
 <p>Provides information about all the endpoints that are associated with a user ID.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingEndpointsResponse * _Nullable endpointsResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingDeleteVoiceChannelRequest : AWSRequest


/**
 <p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

@end

/**
 
 */
@interface AWSPinpointTargetingDeleteVoiceChannelResponse : AWSModel


/**
 <p>Provides information about the status and settings of the voice channel for an application.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingVoiceChannelResponse * _Nullable voiceChannelResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingDeleteVoiceTemplateRequest : AWSRequest


/**
 <p>The name of the message template. A template name must start with an alphanumeric character and can contain a maximum of 128 characters. The characters can be alphanumeric characters, underscores (_), or hyphens (-). Template names are case sensitive.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateName;

/**
 <p>The unique identifier for the version of the message template to update, retrieve information about, or delete. To retrieve identifiers and other information for all the versions of a template, use the <linklinkend="templates-template-name-template-type-versions">Template Versions</link> resource.</p><p>If specified, this value must match the identifier for an existing template version. If specified for an update operation, this value must match the identifier for the latest existing version of the template. This restriction helps ensure that race conditions don't occur.</p><p>If you don't specify a value for this parameter, Amazon Pinpoint does the following:</p><ul><li><p>For a get operation, retrieves information about the active version of the template.</p></li><li><p>For an update operation, saves the updates to (overwrites) the latest existing version of the template, if the create-new-version parameter isn't used or is set to false.</p></li><li><p>For a delete operation, deletes the template, including all versions of the template.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable version;

@end

/**
 
 */
@interface AWSPinpointTargetingDeleteVoiceTemplateResponse : AWSModel


/**
 <p>Provides information about an API request or response.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingMessageBody * _Nullable messageBody;

@end

/**
 <p>Specifies the settings and content for the default message and any default messages that you tailored for specific channels.</p>
 */
@interface AWSPinpointTargetingDirectMessageConfiguration : AWSModel


/**
 <p>The default push notification message for the ADM (Amazon Device Messaging) channel. This message overrides the default push notification message (DefaultPushNotificationMessage).</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingADMMessage * _Nullable ADMMessage;

/**
 <p>The default push notification message for the APNs (Apple Push Notification service) channel. This message overrides the default push notification message (DefaultPushNotificationMessage).</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingAPNSMessage * _Nullable APNSMessage;

/**
 <p>The default push notification message for the Baidu (Baidu Cloud Push) channel. This message overrides the default push notification message (DefaultPushNotificationMessage).</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingBaiduMessage * _Nullable baiduMessage;

/**
 <p>The default message for all channels.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingDefaultMessage * _Nullable defaultMessage;

/**
 <p>The default push notification message for all push notification channels.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingDefaultPushNotificationMessage * _Nullable defaultPushNotificationMessage;

/**
 <p>The default message for the email channel. This message overrides the default message (DefaultMessage).</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingEmailMessage * _Nullable emailMessage;

/**
 <p>The default push notification message for the GCM channel, which is used to send notifications through the Firebase Cloud Messaging (FCM), formerly Google Cloud Messaging (GCM), service. This message overrides the default push notification message (DefaultPushNotificationMessage).</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingGCMMessage * _Nullable GCMMessage;

/**
 <p>The default message for the SMS channel. This message overrides the default message (DefaultMessage).</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingSMSMessage * _Nullable SMSMessage;

/**
 <p>The default message for the voice channel. This message overrides the default message (DefaultMessage).</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingVoiceMessage * _Nullable voiceMessage;

@end

/**
 <p>Specifies the status and settings of the email channel for an application.</p>
 Required parameters: [FromAddress, Identity]
 */
@interface AWSPinpointTargetingEmailChannelRequest : AWSModel


/**
 <p>The configuration set that you want to apply to email that you send through the channel by using the <a href="emailAPIreference.html">Amazon Pinpoint Email API</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable configurationSet;

/**
 <p>Specifies whether to enable the email channel for the application.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

/**
  <p>The verified email address that you want to send email from when you send email through the channel.</p>
 */
@property (nonatomic, strong) NSString * _Nullable fromAddress;

/**
  <p>The Amazon Resource Name (ARN) of the identity, verified with Amazon Simple Email Service (Amazon SES), that you want to use when you send email through the channel.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identity;

/**
  <p>The ARN of the AWS Identity and Access Management (IAM) role that you want Amazon Pinpoint to use when it submits email-related event data for the channel.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

@end

/**
 <p>Provides information about the status and settings of the email channel for an application.</p>
 Required parameters: [Platform]
 */
@interface AWSPinpointTargetingEmailChannelResponse : AWSModel


/**
 <p>The unique identifier for the application that the email channel applies to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 <p>The configuration set that's applied to email that's sent through the channel by using the <a href="emailAPIreference.html">Amazon Pinpoint Email API</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable configurationSet;

/**
 <p>The date and time, in ISO 8601 format, when the email channel was enabled.</p>
 */
@property (nonatomic, strong) NSString * _Nullable creationDate;

/**
 <p>Specifies whether the email channel is enabled for the application.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

/**
 <p>The verified email address that you send email from when you send email through the channel.</p>
 */
@property (nonatomic, strong) NSString * _Nullable fromAddress;

/**
 <p>(Not used) This property is retained only for backward compatibility.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable hasCredential;

/**
 <p>(Deprecated) An identifier for the email channel. This property is retained only for backward compatibility.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
  <p>The Amazon Resource Name (ARN) of the identity, verified with Amazon Simple Email Service (Amazon SES), that you use when you send email through the channel.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identity;

/**
 <p>Specifies whether the email channel is archived.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isArchived;

/**
 <p>The user who last modified the email channel.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lastModifiedBy;

/**
 <p>The date and time, in ISO 8601 format, when the email channel was last modified.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lastModifiedDate;

/**
 <p>The maximum number of emails that you can send through the channel each second.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable messagesPerSecond;

/**
 <p>The type of messaging or notification platform for the channel. For the email channel, this value is EMAIL.</p>
 */
@property (nonatomic, strong) NSString * _Nullable platform;

/**
  <p>The ARN of the AWS Identity and Access Management (IAM) role that Amazon Pinpoint uses to submit email-related event data for the channel.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 <p>The current version of the email channel.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable version;

@end

/**
 <p>Specifies the default settings and content for a one-time email message that's sent directly to an endpoint.</p>
 */
@interface AWSPinpointTargetingEmailMessage : AWSModel


/**
 <p>The body of the email message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable body;

/**
 <p>The email address to forward bounces and complaints to, if feedback forwarding is enabled.</p>
 */
@property (nonatomic, strong) NSString * _Nullable feedbackForwardingAddress;

/**
 <p>The verified email address to send the email message from. The default value is the FromAddress specified for the email channel.</p>
 */
@property (nonatomic, strong) NSString * _Nullable fromAddress;

/**
 <p>The email message, represented as a raw MIME message.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingRawEmail * _Nullable rawEmail;

/**
 <p>The reply-to email address(es) for the email message. If a recipient replies to the email, each reply-to address receives the reply.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable replyToAddresses;

/**
 <p>The email message, composed of a subject, a text part, and an HTML part.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingSimpleEmail * _Nullable simpleEmail;

/**
 <p>The default message variables to use in the email message. You can override the default variables with individual address variables.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSArray<NSString *> *> * _Nullable substitutions;

@end

/**
 <p>Specifies the settings for an email activity in a journey. This type of activity sends an email message to participants.</p>
 */
@interface AWSPinpointTargetingEmailMessageActivity : AWSModel


/**
 <p>The "From" address to use for the message.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingJourneyEmailMessage * _Nullable messageConfig;

/**
 <p>The unique identifier for the next activity to perform, after the message is sent.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextActivity;

/**
 <p>The name of the email template to use for the message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateName;

/**
 <p>The unique identifier for the version of the email template to use for the message. If specified, this value must match the identifier for an existing template version. To retrieve a list of versions and version identifiers for a template, use the <linklinkend="templates-template-name-template-type-versions">Template Versions</link> resource.</p><p>If you don't specify a value for this property, Amazon Pinpoint uses the <i>active version</i> of the template. The <i>active version</i> is typically the version of a template that's been most recently reviewed and approved for use, depending on your workflow. It isn't necessarily the latest version of a template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateVersion;

@end

/**
 <p>Specifies the content and settings for a message template that can be used in messages that are sent through the email channel.</p>
 */
@interface AWSPinpointTargetingEmailTemplateRequest : AWSModel


/**
 <p>A JSON object that specifies the default values to use for message variables in the message template. This object is a set of key-value pairs. Each key defines a message variable in the template. The corresponding value defines the default value for that variable. When you create a message that's based on the template, you can override these defaults with message-specific and address-specific variables and values.</p>
 */
@property (nonatomic, strong) NSString * _Nullable defaultSubstitutions;

/**
 <p>The message body, in HTML format, to use in email messages that are based on the message template. We recommend using HTML format for email clients that render HTML content. You can include links, formatted text, and more in an HTML message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable htmlPart;

/**
 <p>The unique identifier for the recommender model to use for the message template. Amazon Pinpoint uses this value to determine how to retrieve and process data from a recommender model when it sends messages that use the template, if the template contains message variables for recommendation data.</p>
 */
@property (nonatomic, strong) NSString * _Nullable recommenderId;

/**
 <p>The subject line, or title, to use in email messages that are based on the message template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable subject;

/**
 <p>A custom description of the message template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateDescription;

/**
 <p>The message body, in plain text format, to use in email messages that are based on the message template. We recommend using plain text format for email clients that don't render HTML content and clients that are connected to high-latency networks, such as mobile devices.</p>
 */
@property (nonatomic, strong) NSString * _Nullable textPart;

/**
 <p>A string-to-string map of key-value pairs that defines the tags to associate with the message template. Each tag consists of a required tag key and an associated tag value.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 <p>Provides information about the content and settings for a message template that can be used in messages that are sent through the email channel.</p>
 Required parameters: [LastModifiedDate, CreationDate, TemplateName, TemplateType]
 */
@interface AWSPinpointTargetingEmailTemplateResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the message template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The date, in ISO 8601 format, when the message template was created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable creationDate;

/**
 <p>The JSON object that specifies the default values that are used for message variables in the message template. This object is a set of key-value pairs. Each key defines a message variable in the template. The corresponding value defines the default value for that variable.</p>
 */
@property (nonatomic, strong) NSString * _Nullable defaultSubstitutions;

/**
 <p>The message body, in HTML format, that's used in email messages that are based on the message template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable htmlPart;

/**
 <p>The date, in ISO 8601 format, when the message template was last modified.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lastModifiedDate;

/**
 <p>The unique identifier for the recommender model that's used by the message template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable recommenderId;

/**
 <p>The subject line, or title, that's used in email messages that are based on the message template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable subject;

/**
 <p>The custom description of the message template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateDescription;

/**
 <p>The name of the message template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateName;

/**
 <p>The type of channel that the message template is designed for. For an email template, this value is EMAIL.</p>
 */
@property (nonatomic, assign) AWSPinpointTargetingTemplateType templateType;

/**
 <p>The message body, in plain text format, that's used in email messages that are based on the message template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable textPart;

/**
 <p>The unique identifier, as an integer, for the active version of the message template, or the version of the template that you specified by using the version parameter in your request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable version;

/**
 <p>A string-to-string map of key-value pairs that identifies the tags that are associated with the message template. Each tag consists of a required tag key and an associated tag value.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 <p>Specifies an endpoint to create or update and the settings and attributes to set or change for the endpoint.</p>
 */
@interface AWSPinpointTargetingEndpointBatchItem : AWSModel


/**
 <p>The destination address for messages or push notifications that you send to the endpoint. The address varies by channel. For a push-notification channel, use the token provided by the push notification service, such as an Apple Push Notification service (APNs) device token or a Firebase Cloud Messaging (FCM) registration token. For the SMS channel, use a phone number in E.164 format, such as +12065550100. For the email channel, use an email address.</p>
 */
@property (nonatomic, strong) NSString * _Nullable address;

/**
 <p>One or more custom attributes that describe the endpoint by associating a name with an array of values. For example, the value of a custom attribute named Interests might be: ["Science", "Music", "Travel"]. You can use these attributes as filter criteria when you create segments. Attribute names are case sensitive.</p><p>An attribute name can contain up to 50 characters. An attribute value can contain up to 100 characters. When you define the name of a custom attribute, avoid using the following characters: number sign (#), colon (:), question mark (?), backslash (\), and slash (/). The Amazon Pinpoint console can't display attribute names that contain these characters. This restriction doesn't apply to attribute values.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSArray<NSString *> *> * _Nullable attributes;

/**
 <p>The channel to use when sending messages or push notifications to the endpoint.</p>
 */
@property (nonatomic, assign) AWSPinpointTargetingChannelType channelType;

/**
 <p>The demographic information for the endpoint, such as the time zone and platform.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingEndpointDemographic * _Nullable demographic;

/**
 <p>The date and time, in ISO 8601 format, when the endpoint was created or updated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable effectiveDate;

/**
 <p>Specifies whether to send messages or push notifications to the endpoint. Valid values are: ACTIVE, messages are sent to the endpoint; and, INACTIVE, messages aren’t sent to the endpoint.</p><p>Amazon Pinpoint automatically sets this value to ACTIVE when you create an endpoint or update an existing endpoint. Amazon Pinpoint automatically sets this value to INACTIVE if you update another endpoint that has the same address specified by the Address property.</p>
 */
@property (nonatomic, strong) NSString * _Nullable endpointStatus;

/**
 <p>The unique identifier for the endpoint in the context of the batch.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The geographic information for the endpoint.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingEndpointLocation * _Nullable location;

/**
 <p>One or more custom metrics that your app reports to Amazon Pinpoint for the endpoint.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSNumber *> * _Nullable metrics;

/**
 <p>Specifies whether the user who's associated with the endpoint has opted out of receiving messages and push notifications from you. Possible values are: ALL, the user has opted out and doesn't want to receive any messages or push notifications; and, NONE, the user hasn't opted out and wants to receive all messages and push notifications.</p>
 */
@property (nonatomic, strong) NSString * _Nullable optOut;

/**
 <p>The unique identifier for the request to create or update the endpoint.</p>
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

/**
 <p>One or more custom user attributes that describe the user who's associated with the endpoint.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingEndpointUser * _Nullable user;

@end

/**
 <p>Specifies a batch of endpoints to create or update and the settings and attributes to set or change for each endpoint.</p>
 Required parameters: [Item]
 */
@interface AWSPinpointTargetingEndpointBatchRequest : AWSModel


/**
 <p>An array that defines the endpoints to create or update and, for each endpoint, the property values to set or change. An array can contain a maximum of 100 items.</p>
 */
@property (nonatomic, strong) NSArray<AWSPinpointTargetingEndpointBatchItem *> * _Nullable item;

@end

/**
 <p>Specifies demographic information about an endpoint, such as the applicable time zone and platform.</p>
 */
@interface AWSPinpointTargetingEndpointDemographic : AWSModel


/**
 <p>The version of the app that's associated with the endpoint.</p>
 */
@property (nonatomic, strong) NSString * _Nullable appVersion;

/**
 <p>The locale of the endpoint, in the following format: the ISO 639-1 alpha-2 code, followed by an underscore (_), followed by an ISO 3166-1 alpha-2 value.</p>
 */
@property (nonatomic, strong) NSString * _Nullable locale;

/**
 <p>The manufacturer of the endpoint device, such as apple or samsung.</p>
 */
@property (nonatomic, strong) NSString * _Nullable make;

/**
 <p>The model name or number of the endpoint device, such as iPhone or SM-G900F.</p>
 */
@property (nonatomic, strong) NSString * _Nullable model;

/**
 <p>The model version of the endpoint device.</p>
 */
@property (nonatomic, strong) NSString * _Nullable modelVersion;

/**
 <p>The platform of the endpoint device, such as ios.</p>
 */
@property (nonatomic, strong) NSString * _Nullable platform;

/**
 <p>The platform version of the endpoint device.</p>
 */
@property (nonatomic, strong) NSString * _Nullable platformVersion;

/**
 <p>The time zone of the endpoint, specified as a tz database name value, such as America/Los_Angeles.</p>
 */
@property (nonatomic, strong) NSString * _Nullable timezone;

@end

/**
 <p>Provides the status code and message that result from processing data for an endpoint.</p>
 */
@interface AWSPinpointTargetingEndpointItemResponse : AWSModel


/**
 <p>The custom message that's returned in the response as a result of processing the endpoint data.</p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

/**
 <p>The status code that's returned in the response as a result of processing the endpoint data.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable statusCode;

@end

/**
 <p>Specifies geographic information about an endpoint.</p>
 */
@interface AWSPinpointTargetingEndpointLocation : AWSModel


/**
 <p>The name of the city where the endpoint is located.</p>
 */
@property (nonatomic, strong) NSString * _Nullable city;

/**
 <p>The two-character code, in ISO 3166-1 alpha-2 format, for the country or region where the endpoint is located. For example, US for the United States.</p>
 */
@property (nonatomic, strong) NSString * _Nullable country;

/**
 <p>The latitude coordinate of the endpoint location, rounded to one decimal place.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable latitude;

/**
 <p>The longitude coordinate of the endpoint location, rounded to one decimal place.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable longitude;

/**
 <p>The postal or ZIP code for the area where the endpoint is located.</p>
 */
@property (nonatomic, strong) NSString * _Nullable postalCode;

/**
 <p>The name of the region where the endpoint is located. For locations in the United States, this value is the name of a state.</p>
 */
@property (nonatomic, strong) NSString * _Nullable region;

@end

/**
 <p>Provides information about the delivery status and results of sending a message directly to an endpoint.</p>
 Required parameters: [DeliveryStatus, StatusCode]
 */
@interface AWSPinpointTargetingEndpointMessageResult : AWSModel


/**
 <p>The endpoint address that the message was delivered to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable address;

/**
 <p>The delivery status of the message. Possible values are:</p><ul><li><p>DUPLICATE - The endpoint address is a duplicate of another endpoint address. Amazon Pinpoint won't attempt to send the message again.</p></li><li><p>OPT_OUT - The user who's associated with the endpoint has opted out of receiving messages from you. Amazon Pinpoint won't attempt to send the message again.</p></li><li><p>PERMANENT_FAILURE - An error occurred when delivering the message to the endpoint. Amazon Pinpoint won't attempt to send the message again.</p></li><li><p>SUCCESSFUL - The message was successfully delivered to the endpoint.</p></li><li><p>TEMPORARY_FAILURE - A temporary error occurred. Amazon Pinpoint won't attempt to send the message again.</p></li><li><p>THROTTLED - Amazon Pinpoint throttled the operation to send the message to the endpoint.</p></li><li><p>TIMEOUT - The message couldn't be sent within the timeout period.</p></li><li><p>UNKNOWN_FAILURE - An unknown error occurred.</p></li></ul>
 */
@property (nonatomic, assign) AWSPinpointTargetingDeliveryStatus deliveryStatus;

/**
 <p>The unique identifier for the message that was sent.</p>
 */
@property (nonatomic, strong) NSString * _Nullable messageId;

/**
 <p>The downstream service status code for delivering the message.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable statusCode;

/**
 <p>The status message for delivering the message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable statusMessage;

/**
 <p>For push notifications that are sent through the GCM channel, specifies whether the endpoint's device registration token was updated as part of delivering the message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable updatedToken;

@end

/**
 <p>Specifies the channel type and other settings for an endpoint.</p>
 */
@interface AWSPinpointTargetingEndpointRequest : AWSModel


/**
 <p>The destination address for messages or push notifications that you send to the endpoint. The address varies by channel. For a push-notification channel, use the token provided by the push notification service, such as an Apple Push Notification service (APNs) device token or a Firebase Cloud Messaging (FCM) registration token. For the SMS channel, use a phone number in E.164 format, such as +12065550100. For the email channel, use an email address.</p>
 */
@property (nonatomic, strong) NSString * _Nullable address;

/**
 <p>One or more custom attributes that describe the endpoint by associating a name with an array of values. For example, the value of a custom attribute named Interests might be: ["Science", "Music", "Travel"]. You can use these attributes as filter criteria when you create segments. Attribute names are case sensitive.</p><p>An attribute name can contain up to 50 characters. An attribute value can contain up to 100 characters. When you define the name of a custom attribute, avoid using the following characters: number sign (#), colon (:), question mark (?), backslash (\), and slash (/). The Amazon Pinpoint console can't display attribute names that contain these characters. This restriction doesn't apply to attribute values.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSArray<NSString *> *> * _Nullable attributes;

/**
 <p>The channel to use when sending messages or push notifications to the endpoint.</p>
 */
@property (nonatomic, assign) AWSPinpointTargetingChannelType channelType;

/**
 <p>The demographic information for the endpoint, such as the time zone and platform.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingEndpointDemographic * _Nullable demographic;

/**
 <p>The date and time, in ISO 8601 format, when the endpoint is updated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable effectiveDate;

/**
 <p>Specifies whether to send messages or push notifications to the endpoint. Valid values are: ACTIVE, messages are sent to the endpoint; and, INACTIVE, messages aren’t sent to the endpoint.</p><p>Amazon Pinpoint automatically sets this value to ACTIVE when you create an endpoint or update an existing endpoint. Amazon Pinpoint automatically sets this value to INACTIVE if you update another endpoint that has the same address specified by the Address property.</p>
 */
@property (nonatomic, strong) NSString * _Nullable endpointStatus;

/**
 <p>The geographic information for the endpoint.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingEndpointLocation * _Nullable location;

/**
 <p>One or more custom metrics that your app reports to Amazon Pinpoint for the endpoint.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSNumber *> * _Nullable metrics;

/**
 <p>Specifies whether the user who's associated with the endpoint has opted out of receiving messages and push notifications from you. Possible values are: ALL, the user has opted out and doesn't want to receive any messages or push notifications; and, NONE, the user hasn't opted out and wants to receive all messages and push notifications.</p>
 */
@property (nonatomic, strong) NSString * _Nullable optOut;

/**
 <p>The unique identifier for the most recent request to update the endpoint.</p>
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

/**
 <p>One or more custom user attributes that describe the user who's associated with the endpoint.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingEndpointUser * _Nullable user;

@end

/**
 <p>Provides information about the channel type and other settings for an endpoint.</p>
 */
@interface AWSPinpointTargetingEndpointResponse : AWSModel


/**
 <p>The destination address for messages or push notifications that you send to the endpoint. The address varies by channel. For example, the address for a push-notification channel is typically the token provided by a push notification service, such as an Apple Push Notification service (APNs) device token or a Firebase Cloud Messaging (FCM) registration token. The address for the SMS channel is a phone number in E.164 format, such as +12065550100. The address for the email channel is an email address.</p>
 */
@property (nonatomic, strong) NSString * _Nullable address;

/**
 <p>The unique identifier for the application that's associated with the endpoint.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 <p>One or more custom attributes that describe the endpoint by associating a name with an array of values. For example, the value of a custom attribute named Interests might be: ["Science", "Music", "Travel"]. You can use these attributes as filter criteria when you create segments.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSArray<NSString *> *> * _Nullable attributes;

/**
 <p>The channel that's used when sending messages or push notifications to the endpoint.</p>
 */
@property (nonatomic, assign) AWSPinpointTargetingChannelType channelType;

/**
 <p>A number from 0-99 that represents the cohort that the endpoint is assigned to. Endpoints are grouped into cohorts randomly, and each cohort contains approximately 1 percent of the endpoints for an application. Amazon Pinpoint assigns cohorts to the holdout or treatment allocations for campaigns.</p>
 */
@property (nonatomic, strong) NSString * _Nullable cohortId;

/**
 <p>The date and time, in ISO 8601 format, when the endpoint was created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable creationDate;

/**
 <p>The demographic information for the endpoint, such as the time zone and platform.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingEndpointDemographic * _Nullable demographic;

/**
 <p>The date and time, in ISO 8601 format, when the endpoint was last updated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable effectiveDate;

/**
 <p>Specifies whether messages or push notifications are sent to the endpoint. Possible values are: ACTIVE, messages are sent to the endpoint; and, INACTIVE, messages aren’t sent to the endpoint.</p><p>Amazon Pinpoint automatically sets this value to ACTIVE when you create an endpoint or update an existing endpoint. Amazon Pinpoint automatically sets this value to INACTIVE if you update another endpoint that has the same address specified by the Address property.</p>
 */
@property (nonatomic, strong) NSString * _Nullable endpointStatus;

/**
 <p>The unique identifier that you assigned to the endpoint. The identifier should be a globally unique identifier (GUID) to ensure that it doesn't conflict with other endpoint identifiers that are associated with the application.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The geographic information for the endpoint.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingEndpointLocation * _Nullable location;

/**
 <p>One or more custom metrics that your app reports to Amazon Pinpoint for the endpoint.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSNumber *> * _Nullable metrics;

/**
 <p>Specifies whether the user who's associated with the endpoint has opted out of receiving messages and push notifications from you. Possible values are: ALL, the user has opted out and doesn't want to receive any messages or push notifications; and, NONE, the user hasn't opted out and wants to receive all messages and push notifications.</p>
 */
@property (nonatomic, strong) NSString * _Nullable optOut;

/**
 <p>The unique identifier for the most recent request to update the endpoint.</p>
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

/**
 <p>One or more custom user attributes that your app reports to Amazon Pinpoint for the user who's associated with the endpoint.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingEndpointUser * _Nullable user;

@end

/**
 <p>Specifies the content, including message variables and attributes, to use in a message that's sent directly to an endpoint.</p>
 */
@interface AWSPinpointTargetingEndpointSendConfiguration : AWSModel


/**
 <p>The body of the message. If specified, this value overrides the default message body.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bodyOverride;

/**
 <p>A map of custom attributes to attach to the message for the address. Attribute names are case sensitive.</p><p>For a push notification, this payload is added to the data.pinpoint object. For an email or text message, this payload is added to email/SMS delivery receipt event attributes.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable context;

/**
 <p>The raw, JSON-formatted string to use as the payload for the message. If specified, this value overrides all other values for the message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable rawContent;

/**
 <p>A map of the message variables to merge with the variables specified for the default message (DefaultMessage.Substitutions). The variables specified in this map take precedence over all other variables.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSArray<NSString *> *> * _Nullable substitutions;

/**
 <p>The title or subject line of the message. If specified, this value overrides the default message title or subject line.</p>
 */
@property (nonatomic, strong) NSString * _Nullable titleOverride;

@end

/**
 <p>Specifies data for one or more attributes that describe the user who's associated with an endpoint.</p>
 */
@interface AWSPinpointTargetingEndpointUser : AWSModel


/**
 <p>One or more custom attributes that describe the user by associating a name with an array of values. For example, the value of an attribute named Interests might be: ["Science", "Music", "Travel"]. You can use these attributes as filter criteria when you create segments. Attribute names are case sensitive.</p><p>An attribute name can contain up to 50 characters. An attribute value can contain up to 100 characters. When you define the name of a custom attribute, avoid using the following characters: number sign (#), colon (:), question mark (?), backslash (\), and slash (/). The Amazon Pinpoint console can't display attribute names that contain these characters. This restriction doesn't apply to attribute values.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSArray<NSString *> *> * _Nullable userAttributes;

/**
 <p>The unique identifier for the user.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userId;

@end

/**
 <p>Provides information about all the endpoints that are associated with a user ID.</p>
 Required parameters: [Item]
 */
@interface AWSPinpointTargetingEndpointsResponse : AWSModel


/**
 <p>An array of responses, one for each endpoint that's associated with the user ID.</p>
 */
@property (nonatomic, strong) NSArray<AWSPinpointTargetingEndpointResponse *> * _Nullable item;

@end

/**
 <p>Specifies information about an event that reports data to Amazon Pinpoint.</p>
 Required parameters: [EventType, Timestamp]
 */
@interface AWSPinpointTargetingEvent : AWSModel


/**
 <p>The package name of the app that's recording the event.</p>
 */
@property (nonatomic, strong) NSString * _Nullable appPackageName;

/**
 <p>The title of the app that's recording the event.</p>
 */
@property (nonatomic, strong) NSString * _Nullable appTitle;

/**
 <p>The version number of the app that's recording the event.</p>
 */
@property (nonatomic, strong) NSString * _Nullable appVersionCode;

/**
 <p>One or more custom attributes that are associated with the event.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable attributes;

/**
 <p>The version of the SDK that's running on the client device.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientSdkVersion;

/**
 <p>The name of the event.</p>
 */
@property (nonatomic, strong) NSString * _Nullable eventType;

/**
 <p>One or more custom metrics that are associated with the event.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSNumber *> * _Nullable metrics;

/**
 <p>The name of the SDK that's being used to record the event.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sdkName;

/**
 <p>Information about the session in which the event occurred.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingSession * _Nullable session;

/**
 <p>The date and time, in ISO 8601 format, when the event occurred.</p>
 */
@property (nonatomic, strong) NSString * _Nullable timestamp;

@end

/**
 <p>Specifies the conditions to evaluate for an event that applies to an activity in a journey.</p>
 Required parameters: [Dimensions]
 */
@interface AWSPinpointTargetingEventCondition : AWSModel


/**
 <p>The dimensions for the event filter to use for the activity.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingEventDimensions * _Nullable dimensions;

/**
 <p>The message identifier (message_id) for the message to use when determining whether message events meet the condition.</p>
 */
@property (nonatomic, strong) NSString * _Nullable messageActivity;

@end

/**
 <p>Specifies the dimensions for an event filter that determines when a campaign is sent or a journey activity is performed.</p>
 */
@interface AWSPinpointTargetingEventDimensions : AWSModel


/**
 <p>One or more custom attributes that your application reports to Amazon Pinpoint. You can use these attributes as selection criteria when you create an event filter.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSPinpointTargetingAttributeDimension *> * _Nullable attributes;

/**
 <p>The name of the event that causes the campaign to be sent or the journey activity to be performed. This can be a standard event that Amazon Pinpoint generates, such as _email.delivered. For campaigns, this can also be a custom event that's specific to your application. For information about standard events, see <a href="https://docs.aws.amazon.com/pinpoint/latest/developerguide/event-streams.html">Streaming Amazon Pinpoint Events</a> in the <i>Amazon Pinpoint Developer Guide</i>.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingSetDimension * _Nullable eventType;

/**
 <p>One or more custom metrics that your application reports to Amazon Pinpoint. You can use these metrics as selection criteria when you create an event filter.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSPinpointTargetingMetricDimension *> * _Nullable metrics;

@end

/**
 <p>Provides the status code and message that result from processing an event.</p>
 */
@interface AWSPinpointTargetingEventItemResponse : AWSModel


/**
 <p>A custom message that's returned in the response as a result of processing the event.</p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

/**
 <p>The status code that's returned in the response as a result of processing the event. Possible values are: 202, for events that were accepted; and, 400, for events that weren't valid.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable statusCode;

@end

/**
 <p>Specifies settings for publishing event data to an Amazon Kinesis data stream or an Amazon Kinesis Data Firehose delivery stream.</p>
 Required parameters: [ApplicationId, RoleArn, DestinationStreamArn]
 */
@interface AWSPinpointTargetingEventStream : AWSModel


/**
 <p>The unique identifier for the application to publish event data for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 <p>The Amazon Resource Name (ARN) of the Amazon Kinesis data stream or Amazon Kinesis Data Firehose delivery stream to publish event data to.</p><p>For a Kinesis data stream, the ARN format is: arn:aws:kinesis:<replaceable>region</replaceable>:<replaceable>account-id</replaceable>:stream/<replaceable>stream_name</replaceable></p><p>For a Kinesis Data Firehose delivery stream, the ARN format is: arn:aws:firehose:<replaceable>region</replaceable>:<replaceable>account-id</replaceable>:deliverystream/<replaceable>stream_name</replaceable></p>
 */
@property (nonatomic, strong) NSString * _Nullable destinationStreamArn;

/**
 <p>(Deprecated) Your AWS account ID, which you assigned to an external ID key in an IAM trust policy. Amazon Pinpoint previously used this value to assume an IAM role when publishing event data, but we removed this requirement. We don't recommend use of external IDs for IAM roles that are assumed by Amazon Pinpoint.</p>
 */
@property (nonatomic, strong) NSString * _Nullable externalId;

/**
 <p>The date, in ISO 8601 format, when the event stream was last modified.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lastModifiedDate;

/**
 <p>The IAM user who last modified the event stream.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lastUpdatedBy;

/**
 <p>The AWS Identity and Access Management (IAM) role that authorizes Amazon Pinpoint to publish event data to the stream in your AWS account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

@end

/**
 <p>Specifies a batch of endpoints and events to process.</p>
 Required parameters: [Endpoint, Events]
 */
@interface AWSPinpointTargetingEventsBatch : AWSModel


/**
 <p>A set of properties and attributes that are associated with the endpoint.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingPublicEndpoint * _Nullable endpoint;

/**
 <p>A set of properties that are associated with the event.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSPinpointTargetingEvent *> * _Nullable events;

@end

/**
 <p>Specifies a batch of events to process.</p>
 Required parameters: [BatchItem]
 */
@interface AWSPinpointTargetingEventsRequest : AWSModel


/**
 <p>The batch of events to process. For each item in a batch, the endpoint ID acts as a key that has an EventsBatch object as its value.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSPinpointTargetingEventsBatch *> * _Nullable batchItem;

@end

/**
 <p>Provides information about endpoints and the events that they're associated with.</p>
 */
@interface AWSPinpointTargetingEventsResponse : AWSModel


/**
 <p>A map that contains a multipart response for each endpoint. For each item in this object, the endpoint ID is the key and the item response is the value. If no item response exists, the value can also be one of the following: 202, the request was processed successfully; or 400, the payload wasn't valid or required fields were missing.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSPinpointTargetingItemResponse *> * _Nullable results;

@end

/**
 <p>Specifies the settings for a job that exports endpoint definitions to an Amazon Simple Storage Service (Amazon S3) bucket.</p>
 Required parameters: [S3UrlPrefix, RoleArn]
 */
@interface AWSPinpointTargetingExportJobRequest : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the AWS Identity and Access Management (IAM) role that authorizes Amazon Pinpoint to access the Amazon S3 location where you want to export endpoint definitions to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 <p>The URL of the location in an Amazon Simple Storage Service (Amazon S3) bucket where you want to export endpoint definitions to. This location is typically a folder that contains multiple files. The URL should be in the following format: s3://<replaceable>bucket-name</replaceable>/<replaceable>folder-name</replaceable>/.</p>
 */
@property (nonatomic, strong) NSString * _Nullable s3UrlPrefix;

/**
 <p>The identifier for the segment to export endpoint definitions from. If you don't specify this value, Amazon Pinpoint exports definitions for all the endpoints that are associated with the application.</p>
 */
@property (nonatomic, strong) NSString * _Nullable segmentId;

/**
 <p>The version of the segment to export endpoint definitions from, if specified.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable segmentVersion;

@end

/**
 <p>Provides information about the resource settings for a job that exports endpoint definitions to a file. The file can be added directly to an Amazon Simple Storage Service (Amazon S3) bucket by using the Amazon Pinpoint API or downloaded directly to a computer by using the Amazon Pinpoint console.</p>
 Required parameters: [S3UrlPrefix, RoleArn]
 */
@interface AWSPinpointTargetingExportJobResource : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the AWS Identity and Access Management (IAM) role that authorized Amazon Pinpoint to access the Amazon S3 location where the endpoint definitions were exported to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 <p>The URL of the location in an Amazon Simple Storage Service (Amazon S3) bucket where the endpoint definitions were exported to. This location is typically a folder that contains multiple files. The URL should be in the following format: s3://<replaceable>bucket-name</replaceable>/<replaceable>folder-name</replaceable>/.</p>
 */
@property (nonatomic, strong) NSString * _Nullable s3UrlPrefix;

/**
 <p>The identifier for the segment that the endpoint definitions were exported from. If this value isn't present, Amazon Pinpoint exported definitions for all the endpoints that are associated with the application.</p>
 */
@property (nonatomic, strong) NSString * _Nullable segmentId;

/**
 <p>The version of the segment that the endpoint definitions were exported from.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable segmentVersion;

@end

/**
 <p>Provides information about the status and settings of a job that exports endpoint definitions to a file. The file can be added directly to an Amazon Simple Storage Service (Amazon S3) bucket by using the Amazon Pinpoint API or downloaded directly to a computer by using the Amazon Pinpoint console.</p>
 Required parameters: [JobStatus, CreationDate, Type, Definition, Id, ApplicationId]
 */
@interface AWSPinpointTargetingExportJobResponse : AWSModel


/**
 <p>The unique identifier for the application that's associated with the export job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 <p>The number of pieces that were processed successfully (completed) by the export job, as of the time of the request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable completedPieces;

/**
 <p>The date, in ISO 8601 format, when the export job was completed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable completionDate;

/**
 <p>The date, in ISO 8601 format, when the export job was created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable creationDate;

/**
 <p>The resource settings that apply to the export job.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingExportJobResource * _Nullable definition;

/**
 <p>The number of pieces that weren't processed successfully (failed) by the export job, as of the time of the request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable failedPieces;

/**
 <p>An array of entries, one for each of the first 100 entries that weren't processed successfully (failed) by the export job, if any.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable failures;

/**
 <p>The unique identifier for the export job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The status of the export job. The job status is FAILED if Amazon Pinpoint wasn't able to process one or more pieces in the job.</p>
 */
@property (nonatomic, assign) AWSPinpointTargetingJobStatus jobStatus;

/**
 <p>The total number of endpoint definitions that weren't processed successfully (failed) by the export job, typically because an error, such as a syntax error, occurred.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable totalFailures;

/**
 <p>The total number of pieces that must be processed to complete the export job. Each piece consists of an approximately equal portion of the endpoint definitions that are part of the export job.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable totalPieces;

/**
 <p>The total number of endpoint definitions that were processed by the export job.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable totalProcessed;

/**
 <p>The job type. This value is EXPORT for export jobs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable types;

@end

/**
 <p>Provides information about all the export jobs that are associated with an application or segment. An export job is a job that exports endpoint definitions to a file.</p>
 Required parameters: [Item]
 */
@interface AWSPinpointTargetingExportJobsResponse : AWSModel


/**
 <p>An array of responses, one for each export job that's associated with the application (Export Jobs resource) or segment (Segment Export Jobs resource).</p>
 */
@property (nonatomic, strong) NSArray<AWSPinpointTargetingExportJobResponse *> * _Nullable item;

/**
 <p>The string to use in a subsequent request to get the next page of results in a paginated response. This value is null if there are no additional pages.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>Specifies the status and settings of the GCM channel for an application. This channel enables Amazon Pinpoint to send push notifications through the Firebase Cloud Messaging (FCM), formerly Google Cloud Messaging (GCM), service.</p>
 Required parameters: [ApiKey]
 */
@interface AWSPinpointTargetingGCMChannelRequest : AWSModel


/**
 <p>The Web API Key, also referred to as an <i>API_KEY</i> or <i>server key</i>, that you received from Google to communicate with Google services.</p>
 */
@property (nonatomic, strong) NSString * _Nullable apiKey;

/**
 <p>Specifies whether to enable the GCM channel for the application.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

@end

/**
 <p>Provides information about the status and settings of the GCM channel for an application. The GCM channel enables Amazon Pinpoint to send push notifications through the Firebase Cloud Messaging (FCM), formerly Google Cloud Messaging (GCM), service.</p>
 Required parameters: [Credential, Platform]
 */
@interface AWSPinpointTargetingGCMChannelResponse : AWSModel


/**
 <p>The unique identifier for the application that the GCM channel applies to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 <p>The date and time when the GCM channel was enabled.</p>
 */
@property (nonatomic, strong) NSString * _Nullable creationDate;

/**
 <p>The Web API Key, also referred to as an <i>API_KEY</i> or <i>server key</i>, that you received from Google to communicate with Google services.</p>
 */
@property (nonatomic, strong) NSString * _Nullable credential;

/**
 <p>Specifies whether the GCM channel is enabled for the application.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

/**
 <p>(Not used) This property is retained only for backward compatibility.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable hasCredential;

/**
 <p>(Deprecated) An identifier for the GCM channel. This property is retained only for backward compatibility.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>Specifies whether the GCM channel is archived.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isArchived;

/**
 <p>The user who last modified the GCM channel.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lastModifiedBy;

/**
 <p>The date and time when the GCM channel was last modified.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lastModifiedDate;

/**
 <p>The type of messaging or notification platform for the channel. For the GCM channel, this value is GCM.</p>
 */
@property (nonatomic, strong) NSString * _Nullable platform;

/**
 <p>The current version of the GCM channel.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable version;

@end

/**
 <p>Specifies the settings for a one-time message that's sent directly to an endpoint through the GCM channel. The GCM channel enables Amazon Pinpoint to send messages to the Firebase Cloud Messaging (FCM), formerly Google Cloud Messaging (GCM), service.</p>
 */
@interface AWSPinpointTargetingGCMMessage : AWSModel


/**
 <p>The action to occur if the recipient taps the push notification. Valid values are:</p><ul><li><p>OPEN_APP - Your app opens or it becomes the foreground app if it was sent to the background. This is the default action.</p></li><li><p>DEEP_LINK - Your app opens and displays a designated user interface in the app. This action uses the deep-linking features of the Android platform.</p></li><li><p>URL - The default mobile browser on the recipient's device opens and loads the web page at a URL that you specify.</p></li></ul>
 */
@property (nonatomic, assign) AWSPinpointTargetingAction action;

/**
 <p>The body of the notification message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable body;

/**
 <p>An arbitrary string that identifies a group of messages that can be collapsed to ensure that only the last message is sent when delivery can resume. This helps avoid sending too many instances of the same messages when the recipient's device comes online again or becomes active.</p><p>Amazon Pinpoint specifies this value in the Firebase Cloud Messaging (FCM) collapse_key parameter when it sends the notification message to FCM.</p>
 */
@property (nonatomic, strong) NSString * _Nullable collapseKey;

/**
 <p>The JSON data payload to use for the push notification, if the notification is a silent push notification. This payload is added to the data.pinpoint.jsonBody object of the notification.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable data;

/**
 <p>The icon image name of the asset saved in your app.</p>
 */
@property (nonatomic, strong) NSString * _Nullable iconReference;

/**
 <p>The URL of the large icon image to display in the content view of the push notification.</p>
 */
@property (nonatomic, strong) NSString * _Nullable imageIconUrl;

/**
 <p>The URL of an image to display in the push notification.</p>
 */
@property (nonatomic, strong) NSString * _Nullable imageUrl;

/**
 <p>para>normal - The notification might be delayed. Delivery is optimized for battery usage on the recipient's device. Use this value unless immediate delivery is required.</p>/listitem><li><p>high - The notification is sent immediately and might wake a sleeping device.</p></li>/para><p>Amazon Pinpoint specifies this value in the FCM priority parameter when it sends the notification message to FCM.</p><p>The equivalent values for Apple Push Notification service (APNs) are 5, for normal, and 10, for high. If you specify an APNs value for this property, Amazon Pinpoint accepts and converts the value to the corresponding FCM value.</p>
 */
@property (nonatomic, strong) NSString * _Nullable priority;

/**
 <p>The raw, JSON-formatted string to use as the payload for the notification message. If specified, this value overrides all other content for the message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable rawContent;

/**
 <p>The package name of the application where registration tokens must match in order for the recipient to receive the message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable restrictedPackageName;

/**
 <p>Specifies whether the notification is a silent push notification, which is a push notification that doesn't display on a recipient's device. Silent push notifications can be used for cases such as updating an app's configuration or supporting phone home functionality.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable silentPush;

/**
 <p>The URL of the small icon image to display in the status bar and the content view of the push notification.</p>
 */
@property (nonatomic, strong) NSString * _Nullable smallImageIconUrl;

/**
 <p>The sound to play when the recipient receives the push notification. You can use the default stream or specify the file name of a sound resource that's bundled in your app. On an Android platform, the sound file must reside in /res/raw/.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sound;

/**
 <p>The default message variables to use in the notification message. You can override the default variables with individual address variables.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSArray<NSString *> *> * _Nullable substitutions;

/**
 <p>The amount of time, in seconds, that FCM should store and attempt to deliver the push notification, if the service is unable to deliver the notification the first time. If you don't specify this value, FCM defaults to the maximum value, which is 2,419,200 seconds (28 days).</p><p>Amazon Pinpoint specifies this value in the FCM time_to_live parameter when it sends the notification message to FCM.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable timeToLive;

/**
 <p>The title to display above the notification message on the recipient's device.</p>
 */
@property (nonatomic, strong) NSString * _Nullable title;

/**
 <p>The URL to open in the recipient's default mobile browser, if a recipient taps the push notification and the value of the Action property is URL.</p>
 */
@property (nonatomic, strong) NSString * _Nullable url;

@end

/**
 <p>Specifies the GPS coordinates of a location.</p>
 Required parameters: [Latitude, Longitude]
 */
@interface AWSPinpointTargetingGPSCoordinates : AWSModel


/**
 <p>The latitude coordinate of the location.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable latitude;

/**
 <p>The longitude coordinate of the location.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable longitude;

@end

/**
 <p>Specifies GPS-based criteria for including or excluding endpoints from a segment.</p>
 Required parameters: [Coordinates]
 */
@interface AWSPinpointTargetingGPSPointDimension : AWSModel


/**
 <p>The GPS coordinates to measure distance from.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingGPSCoordinates * _Nullable coordinates;

/**
 <p>The range, in kilometers, from the GPS coordinates.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable rangeInKilometers;

@end

/**
 
 */
@interface AWSPinpointTargetingGetAdmChannelRequest : AWSRequest


/**
 <p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

@end

/**
 
 */
@interface AWSPinpointTargetingGetAdmChannelResponse : AWSModel


/**
 <p>Provides information about the status and settings of the ADM (Amazon Device Messaging) channel for an application.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingADMChannelResponse * _Nullable ADMChannelResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingGetApnsChannelRequest : AWSRequest


/**
 <p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

@end

/**
 
 */
@interface AWSPinpointTargetingGetApnsChannelResponse : AWSModel


/**
 <p>Provides information about the status and settings of the APNs (Apple Push Notification service) channel for an application.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingAPNSChannelResponse * _Nullable APNSChannelResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingGetApnsSandboxChannelRequest : AWSRequest


/**
 <p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

@end

/**
 
 */
@interface AWSPinpointTargetingGetApnsSandboxChannelResponse : AWSModel


/**
 <p>Provides information about the status and settings of the APNs (Apple Push Notification service) sandbox channel for an application.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingAPNSSandboxChannelResponse * _Nullable APNSSandboxChannelResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingGetApnsVoipChannelRequest : AWSRequest


/**
 <p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

@end

/**
 
 */
@interface AWSPinpointTargetingGetApnsVoipChannelResponse : AWSModel


/**
 <p>Provides information about the status and settings of the APNs (Apple Push Notification service) VoIP channel for an application.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingAPNSVoipChannelResponse * _Nullable APNSVoipChannelResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingGetApnsVoipSandboxChannelRequest : AWSRequest


/**
 <p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

@end

/**
 
 */
@interface AWSPinpointTargetingGetApnsVoipSandboxChannelResponse : AWSModel


/**
 <p>Provides information about the status and settings of the APNs (Apple Push Notification service) VoIP sandbox channel for an application.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingAPNSVoipSandboxChannelResponse * _Nullable APNSVoipSandboxChannelResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingGetAppRequest : AWSRequest


/**
 <p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

@end

/**
 
 */
@interface AWSPinpointTargetingGetAppResponse : AWSModel


/**
 <p>Provides information about an application.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingApplicationResponse * _Nullable applicationResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingGetApplicationDateRangeKpiRequest : AWSRequest


/**
 <p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 <p>The last date and time to retrieve data for, as part of an inclusive date range that filters the query results. This value should be in extended ISO 8601 format and use Coordinated Universal Time (UTC), for example: 2019-07-26T20:00:00Z for 8:00 PM UTC July 26, 2019.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable endTime;

/**
 <p>The name of the metric, also referred to as a <i>key performance indicator (KPI)</i>, to retrieve data for. This value describes the associated metric and consists of two or more terms, which are comprised of lowercase alphanumeric characters, separated by a hyphen. Examples are email-open-rate and successful-delivery-rate. For a list of valid values, see the <a href="https://docs.aws.amazon.com/pinpoint/latest/developerguide/welcome.html">Amazon Pinpoint Developer Guide</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable kpiName;

/**
 <p>Thestring that specifies which page of results to return in a paginated response. This parameter is currently not supported for application, campaign, and journey metrics.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The maximum number of items to include in each page of a paginated response. This parameter is currently not supported for application, campaign, and journey metrics.</p>
 */
@property (nonatomic, strong) NSString * _Nullable pageSize;

/**
 <p>The first date and time to retrieve data for, as part of an inclusive date range that filters the query results. This value should be in extended ISO 8601 format and use Coordinated Universal Time (UTC), for example: 2019-07-19T20:00:00Z for 8:00 PM UTC July 19, 2019. This value should also be fewer than 90 days from the current day.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable startTime;

@end

/**
 
 */
@interface AWSPinpointTargetingGetApplicationDateRangeKpiResponse : AWSModel


/**
 <p>Provides the results of a query that retrieved the data for a standard metric that applies to an application, and provides information about that query.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingApplicationDateRangeKpiResponse * _Nullable applicationDateRangeKpiResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingGetApplicationSettingsRequest : AWSRequest


/**
 <p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

@end

/**
 
 */
@interface AWSPinpointTargetingGetApplicationSettingsResponse : AWSModel


/**
 <p>Provides information about an application, including the default settings for an application.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingApplicationSettingsResource * _Nullable applicationSettingsResource;

@end

/**
 
 */
@interface AWSPinpointTargetingGetAppsRequest : AWSRequest


/**
 <p>The maximum number of items to include in each page of a paginated response. This parameter is currently not supported for application, campaign, and journey metrics.</p>
 */
@property (nonatomic, strong) NSString * _Nullable pageSize;

/**
 <p>The NextToken string that specifies which page of results to return in a paginated response.</p>
 */
@property (nonatomic, strong) NSString * _Nullable token;

@end

/**
 
 */
@interface AWSPinpointTargetingGetAppsResponse : AWSModel


/**
 <p>Provides information about all of your applications.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingApplicationsResponse * _Nullable applicationsResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingGetBaiduChannelRequest : AWSRequest


/**
 <p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

@end

/**
 
 */
@interface AWSPinpointTargetingGetBaiduChannelResponse : AWSModel


/**
 <p>Provides information about the status and settings of the Baidu (Baidu Cloud Push) channel for an application.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingBaiduChannelResponse * _Nullable baiduChannelResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingGetCampaignActivitiesRequest : AWSRequest


/**
 <p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 <p>The unique identifier for the campaign.</p>
 */
@property (nonatomic, strong) NSString * _Nullable campaignId;

/**
 <p>The maximum number of items to include in each page of a paginated response. This parameter is currently not supported for application, campaign, and journey metrics.</p>
 */
@property (nonatomic, strong) NSString * _Nullable pageSize;

/**
 <p>The NextToken string that specifies which page of results to return in a paginated response.</p>
 */
@property (nonatomic, strong) NSString * _Nullable token;

@end

/**
 
 */
@interface AWSPinpointTargetingGetCampaignActivitiesResponse : AWSModel


/**
 <p>Provides information about the activities that were performed by a campaign.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingActivitiesResponse * _Nullable activitiesResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingGetCampaignDateRangeKpiRequest : AWSRequest


/**
 <p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 <p>The unique identifier for the campaign.</p>
 */
@property (nonatomic, strong) NSString * _Nullable campaignId;

/**
 <p>The last date and time to retrieve data for, as part of an inclusive date range that filters the query results. This value should be in extended ISO 8601 format and use Coordinated Universal Time (UTC), for example: 2019-07-26T20:00:00Z for 8:00 PM UTC July 26, 2019.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable endTime;

/**
 <p>The name of the metric, also referred to as a <i>key performance indicator (KPI)</i>, to retrieve data for. This value describes the associated metric and consists of two or more terms, which are comprised of lowercase alphanumeric characters, separated by a hyphen. Examples are email-open-rate and successful-delivery-rate. For a list of valid values, see the <a href="https://docs.aws.amazon.com/pinpoint/latest/developerguide/welcome.html">Amazon Pinpoint Developer Guide</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable kpiName;

/**
 <p>Thestring that specifies which page of results to return in a paginated response. This parameter is currently not supported for application, campaign, and journey metrics.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The maximum number of items to include in each page of a paginated response. This parameter is currently not supported for application, campaign, and journey metrics.</p>
 */
@property (nonatomic, strong) NSString * _Nullable pageSize;

/**
 <p>The first date and time to retrieve data for, as part of an inclusive date range that filters the query results. This value should be in extended ISO 8601 format and use Coordinated Universal Time (UTC), for example: 2019-07-19T20:00:00Z for 8:00 PM UTC July 19, 2019. This value should also be fewer than 90 days from the current day.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable startTime;

@end

/**
 
 */
@interface AWSPinpointTargetingGetCampaignDateRangeKpiResponse : AWSModel


/**
 <p>Provides the results of a query that retrieved the data for a standard metric that applies to a campaign, and provides information about that query.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingCampaignDateRangeKpiResponse * _Nullable campaignDateRangeKpiResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingGetCampaignRequest : AWSRequest


/**
 <p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 <p>The unique identifier for the campaign.</p>
 */
@property (nonatomic, strong) NSString * _Nullable campaignId;

@end

/**
 
 */
@interface AWSPinpointTargetingGetCampaignResponse : AWSModel


/**
 <p>Provides information about the status, configuration, and other settings for a campaign.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingCampaignResponse * _Nullable campaignResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingGetCampaignVersionRequest : AWSRequest


/**
 <p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 <p>The unique identifier for the campaign.</p>
 */
@property (nonatomic, strong) NSString * _Nullable campaignId;

/**
 <p>The unique version number (Version property) for the campaign version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable version;

@end

/**
 
 */
@interface AWSPinpointTargetingGetCampaignVersionResponse : AWSModel


/**
 <p>Provides information about the status, configuration, and other settings for a campaign.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingCampaignResponse * _Nullable campaignResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingGetCampaignVersionsRequest : AWSRequest


/**
 <p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 <p>The unique identifier for the campaign.</p>
 */
@property (nonatomic, strong) NSString * _Nullable campaignId;

/**
 <p>The maximum number of items to include in each page of a paginated response. This parameter is currently not supported for application, campaign, and journey metrics.</p>
 */
@property (nonatomic, strong) NSString * _Nullable pageSize;

/**
 <p>The NextToken string that specifies which page of results to return in a paginated response.</p>
 */
@property (nonatomic, strong) NSString * _Nullable token;

@end

/**
 
 */
@interface AWSPinpointTargetingGetCampaignVersionsResponse : AWSModel


/**
 <p>Provides information about the configuration and other settings for all the campaigns that are associated with an application.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingCampaignsResponse * _Nullable campaignsResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingGetCampaignsRequest : AWSRequest


/**
 <p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 <p>The maximum number of items to include in each page of a paginated response. This parameter is currently not supported for application, campaign, and journey metrics.</p>
 */
@property (nonatomic, strong) NSString * _Nullable pageSize;

/**
 <p>The NextToken string that specifies which page of results to return in a paginated response.</p>
 */
@property (nonatomic, strong) NSString * _Nullable token;

@end

/**
 
 */
@interface AWSPinpointTargetingGetCampaignsResponse : AWSModel


/**
 <p>Provides information about the configuration and other settings for all the campaigns that are associated with an application.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingCampaignsResponse * _Nullable campaignsResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingGetChannelsRequest : AWSRequest


/**
 <p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

@end

/**
 
 */
@interface AWSPinpointTargetingGetChannelsResponse : AWSModel


/**
 <p>Provides information about the general settings and status of all channels for an application, including channels that aren't enabled for the application.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingChannelsResponse * _Nullable channelsResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingGetEmailChannelRequest : AWSRequest


/**
 <p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

@end

/**
 
 */
@interface AWSPinpointTargetingGetEmailChannelResponse : AWSModel


/**
 <p>Provides information about the status and settings of the email channel for an application.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingEmailChannelResponse * _Nullable emailChannelResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingGetEmailTemplateRequest : AWSRequest


/**
 <p>The name of the message template. A template name must start with an alphanumeric character and can contain a maximum of 128 characters. The characters can be alphanumeric characters, underscores (_), or hyphens (-). Template names are case sensitive.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateName;

/**
 <p>The unique identifier for the version of the message template to update, retrieve information about, or delete. To retrieve identifiers and other information for all the versions of a template, use the <linklinkend="templates-template-name-template-type-versions">Template Versions</link> resource.</p><p>If specified, this value must match the identifier for an existing template version. If specified for an update operation, this value must match the identifier for the latest existing version of the template. This restriction helps ensure that race conditions don't occur.</p><p>If you don't specify a value for this parameter, Amazon Pinpoint does the following:</p><ul><li><p>For a get operation, retrieves information about the active version of the template.</p></li><li><p>For an update operation, saves the updates to (overwrites) the latest existing version of the template, if the create-new-version parameter isn't used or is set to false.</p></li><li><p>For a delete operation, deletes the template, including all versions of the template.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable version;

@end

/**
 
 */
@interface AWSPinpointTargetingGetEmailTemplateResponse : AWSModel


/**
 <p>Provides information about the content and settings for a message template that can be used in messages that are sent through the email channel.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingEmailTemplateResponse * _Nullable emailTemplateResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingGetEndpointRequest : AWSRequest


/**
 <p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 <p>The unique identifier for the endpoint.</p>
 */
@property (nonatomic, strong) NSString * _Nullable endpointId;

@end

/**
 
 */
@interface AWSPinpointTargetingGetEndpointResponse : AWSModel


/**
 <p>Provides information about the channel type and other settings for an endpoint.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingEndpointResponse * _Nullable endpointResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingGetEventStreamRequest : AWSRequest


/**
 <p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

@end

/**
 
 */
@interface AWSPinpointTargetingGetEventStreamResponse : AWSModel


/**
 <p>Specifies settings for publishing event data to an Amazon Kinesis data stream or an Amazon Kinesis Data Firehose delivery stream.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingEventStream * _Nullable eventStream;

@end

/**
 
 */
@interface AWSPinpointTargetingGetExportJobRequest : AWSRequest


/**
 <p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 <p>The unique identifier for the job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

@end

/**
 
 */
@interface AWSPinpointTargetingGetExportJobResponse : AWSModel


/**
 <p>Provides information about the status and settings of a job that exports endpoint definitions to a file. The file can be added directly to an Amazon Simple Storage Service (Amazon S3) bucket by using the Amazon Pinpoint API or downloaded directly to a computer by using the Amazon Pinpoint console.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingExportJobResponse * _Nullable exportJobResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingGetExportJobsRequest : AWSRequest


/**
 <p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 <p>The maximum number of items to include in each page of a paginated response. This parameter is currently not supported for application, campaign, and journey metrics.</p>
 */
@property (nonatomic, strong) NSString * _Nullable pageSize;

/**
 <p>The NextToken string that specifies which page of results to return in a paginated response.</p>
 */
@property (nonatomic, strong) NSString * _Nullable token;

@end

/**
 
 */
@interface AWSPinpointTargetingGetExportJobsResponse : AWSModel


/**
 <p>Provides information about all the export jobs that are associated with an application or segment. An export job is a job that exports endpoint definitions to a file.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingExportJobsResponse * _Nullable exportJobsResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingGetGcmChannelRequest : AWSRequest


/**
 <p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

@end

/**
 
 */
@interface AWSPinpointTargetingGetGcmChannelResponse : AWSModel


/**
 <p>Provides information about the status and settings of the GCM channel for an application. The GCM channel enables Amazon Pinpoint to send push notifications through the Firebase Cloud Messaging (FCM), formerly Google Cloud Messaging (GCM), service.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingGCMChannelResponse * _Nullable GCMChannelResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingGetImportJobRequest : AWSRequest


/**
 <p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 <p>The unique identifier for the job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

@end

/**
 
 */
@interface AWSPinpointTargetingGetImportJobResponse : AWSModel


/**
 <p>Provides information about the status and settings of a job that imports endpoint definitions from one or more files. The files can be stored in an Amazon Simple Storage Service (Amazon S3) bucket or uploaded directly from a computer by using the Amazon Pinpoint console.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingImportJobResponse * _Nullable importJobResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingGetImportJobsRequest : AWSRequest


/**
 <p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 <p>The maximum number of items to include in each page of a paginated response. This parameter is currently not supported for application, campaign, and journey metrics.</p>
 */
@property (nonatomic, strong) NSString * _Nullable pageSize;

/**
 <p>The NextToken string that specifies which page of results to return in a paginated response.</p>
 */
@property (nonatomic, strong) NSString * _Nullable token;

@end

/**
 
 */
@interface AWSPinpointTargetingGetImportJobsResponse : AWSModel


/**
 <p>Provides information about the status and settings of all the import jobs that are associated with an application or segment. An import job is a job that imports endpoint definitions from one or more files.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingImportJobsResponse * _Nullable importJobsResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingGetJourneyDateRangeKpiRequest : AWSRequest


/**
 <p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 <p>The last date and time to retrieve data for, as part of an inclusive date range that filters the query results. This value should be in extended ISO 8601 format and use Coordinated Universal Time (UTC), for example: 2019-07-26T20:00:00Z for 8:00 PM UTC July 26, 2019.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable endTime;

/**
 <p>The unique identifier for the journey.</p>
 */
@property (nonatomic, strong) NSString * _Nullable journeyId;

/**
 <p>The name of the metric, also referred to as a <i>key performance indicator (KPI)</i>, to retrieve data for. This value describes the associated metric and consists of two or more terms, which are comprised of lowercase alphanumeric characters, separated by a hyphen. Examples are email-open-rate and successful-delivery-rate. For a list of valid values, see the <a href="https://docs.aws.amazon.com/pinpoint/latest/developerguide/welcome.html">Amazon Pinpoint Developer Guide</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable kpiName;

/**
 <p>Thestring that specifies which page of results to return in a paginated response. This parameter is currently not supported for application, campaign, and journey metrics.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The maximum number of items to include in each page of a paginated response. This parameter is currently not supported for application, campaign, and journey metrics.</p>
 */
@property (nonatomic, strong) NSString * _Nullable pageSize;

/**
 <p>The first date and time to retrieve data for, as part of an inclusive date range that filters the query results. This value should be in extended ISO 8601 format and use Coordinated Universal Time (UTC), for example: 2019-07-19T20:00:00Z for 8:00 PM UTC July 19, 2019. This value should also be fewer than 90 days from the current day.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable startTime;

@end

/**
 
 */
@interface AWSPinpointTargetingGetJourneyDateRangeKpiResponse : AWSModel


/**
 <p>Provides the results of a query that retrieved the data for a standard engagement metric that applies to a journey, and provides information about that query.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingJourneyDateRangeKpiResponse * _Nullable journeyDateRangeKpiResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingGetJourneyExecutionActivityMetricsRequest : AWSRequest


/**
 <p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 <p>The unique identifier for the journey activity.</p>
 */
@property (nonatomic, strong) NSString * _Nullable journeyActivityId;

/**
 <p>The unique identifier for the journey.</p>
 */
@property (nonatomic, strong) NSString * _Nullable journeyId;

/**
 <p>Thestring that specifies which page of results to return in a paginated response. This parameter is currently not supported for application, campaign, and journey metrics.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The maximum number of items to include in each page of a paginated response. This parameter is currently not supported for application, campaign, and journey metrics.</p>
 */
@property (nonatomic, strong) NSString * _Nullable pageSize;

@end

/**
 
 */
@interface AWSPinpointTargetingGetJourneyExecutionActivityMetricsResponse : AWSModel


/**
 <p>Provides the results of a query that retrieved the data for a standard execution metric that applies to a journey activity, and provides information about that query.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingJourneyExecutionActivityMetricsResponse * _Nullable journeyExecutionActivityMetricsResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingGetJourneyExecutionMetricsRequest : AWSRequest


/**
 <p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 <p>The unique identifier for the journey.</p>
 */
@property (nonatomic, strong) NSString * _Nullable journeyId;

/**
 <p>Thestring that specifies which page of results to return in a paginated response. This parameter is currently not supported for application, campaign, and journey metrics.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The maximum number of items to include in each page of a paginated response. This parameter is currently not supported for application, campaign, and journey metrics.</p>
 */
@property (nonatomic, strong) NSString * _Nullable pageSize;

@end

/**
 
 */
@interface AWSPinpointTargetingGetJourneyExecutionMetricsResponse : AWSModel


/**
 <p>Provides the results of a query that retrieved the data for a standard execution metric that applies to a journey, and provides information about that query.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingJourneyExecutionMetricsResponse * _Nullable journeyExecutionMetricsResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingGetJourneyRequest : AWSRequest


/**
 <p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 <p>The unique identifier for the journey.</p>
 */
@property (nonatomic, strong) NSString * _Nullable journeyId;

@end

/**
 
 */
@interface AWSPinpointTargetingGetJourneyResponse : AWSModel


/**
 <p>Provides information about the status, configuration, and other settings for a journey.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingJourneyResponse * _Nullable journeyResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingGetPushTemplateRequest : AWSRequest


/**
 <p>The name of the message template. A template name must start with an alphanumeric character and can contain a maximum of 128 characters. The characters can be alphanumeric characters, underscores (_), or hyphens (-). Template names are case sensitive.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateName;

/**
 <p>The unique identifier for the version of the message template to update, retrieve information about, or delete. To retrieve identifiers and other information for all the versions of a template, use the <linklinkend="templates-template-name-template-type-versions">Template Versions</link> resource.</p><p>If specified, this value must match the identifier for an existing template version. If specified for an update operation, this value must match the identifier for the latest existing version of the template. This restriction helps ensure that race conditions don't occur.</p><p>If you don't specify a value for this parameter, Amazon Pinpoint does the following:</p><ul><li><p>For a get operation, retrieves information about the active version of the template.</p></li><li><p>For an update operation, saves the updates to (overwrites) the latest existing version of the template, if the create-new-version parameter isn't used or is set to false.</p></li><li><p>For a delete operation, deletes the template, including all versions of the template.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable version;

@end

/**
 
 */
@interface AWSPinpointTargetingGetPushTemplateResponse : AWSModel


/**
 <p>Provides information about the content and settings for a message template that can be used in messages that are sent through a push notification channel.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingPushNotificationTemplateResponse * _Nullable pushNotificationTemplateResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingGetRecommenderConfigurationRequest : AWSRequest


/**
 <p>The unique identifier for the recommender model configuration. This identifier is displayed as the <b>Recommender ID</b> on the Amazon Pinpoint console.</p>
 */
@property (nonatomic, strong) NSString * _Nullable recommenderId;

@end

/**
 
 */
@interface AWSPinpointTargetingGetRecommenderConfigurationResponse : AWSModel


/**
 <p>Provides information about Amazon Pinpoint configuration settings for retrieving and processing data from a recommender model.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingRecommenderConfigurationResponse * _Nullable recommenderConfigurationResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingGetRecommenderConfigurationsRequest : AWSRequest


/**
 <p>The maximum number of items to include in each page of a paginated response. This parameter is currently not supported for application, campaign, and journey metrics.</p>
 */
@property (nonatomic, strong) NSString * _Nullable pageSize;

/**
 <p>The NextToken string that specifies which page of results to return in a paginated response.</p>
 */
@property (nonatomic, strong) NSString * _Nullable token;

@end

/**
 
 */
@interface AWSPinpointTargetingGetRecommenderConfigurationsResponse : AWSModel


/**
 <p>Provides information about all the recommender model configurations that are associated with your Amazon Pinpoint account.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingListRecommenderConfigurationsResponse * _Nullable listRecommenderConfigurationsResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingGetSegmentExportJobsRequest : AWSRequest


/**
 <p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 <p>The maximum number of items to include in each page of a paginated response. This parameter is currently not supported for application, campaign, and journey metrics.</p>
 */
@property (nonatomic, strong) NSString * _Nullable pageSize;

/**
 <p>The unique identifier for the segment.</p>
 */
@property (nonatomic, strong) NSString * _Nullable segmentId;

/**
 <p>The NextToken string that specifies which page of results to return in a paginated response.</p>
 */
@property (nonatomic, strong) NSString * _Nullable token;

@end

/**
 
 */
@interface AWSPinpointTargetingGetSegmentExportJobsResponse : AWSModel


/**
 <p>Provides information about all the export jobs that are associated with an application or segment. An export job is a job that exports endpoint definitions to a file.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingExportJobsResponse * _Nullable exportJobsResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingGetSegmentImportJobsRequest : AWSRequest


/**
 <p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 <p>The maximum number of items to include in each page of a paginated response. This parameter is currently not supported for application, campaign, and journey metrics.</p>
 */
@property (nonatomic, strong) NSString * _Nullable pageSize;

/**
 <p>The unique identifier for the segment.</p>
 */
@property (nonatomic, strong) NSString * _Nullable segmentId;

/**
 <p>The NextToken string that specifies which page of results to return in a paginated response.</p>
 */
@property (nonatomic, strong) NSString * _Nullable token;

@end

/**
 
 */
@interface AWSPinpointTargetingGetSegmentImportJobsResponse : AWSModel


/**
 <p>Provides information about the status and settings of all the import jobs that are associated with an application or segment. An import job is a job that imports endpoint definitions from one or more files.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingImportJobsResponse * _Nullable importJobsResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingGetSegmentRequest : AWSRequest


/**
 <p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 <p>The unique identifier for the segment.</p>
 */
@property (nonatomic, strong) NSString * _Nullable segmentId;

@end

/**
 
 */
@interface AWSPinpointTargetingGetSegmentResponse : AWSModel


/**
 <p>Provides information about the configuration, dimension, and other settings for a segment.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingSegmentResponse * _Nullable segmentResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingGetSegmentVersionRequest : AWSRequest


/**
 <p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 <p>The unique identifier for the segment.</p>
 */
@property (nonatomic, strong) NSString * _Nullable segmentId;

/**
 <p>The unique version number (Version property) for the campaign version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable version;

@end

/**
 
 */
@interface AWSPinpointTargetingGetSegmentVersionResponse : AWSModel


/**
 <p>Provides information about the configuration, dimension, and other settings for a segment.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingSegmentResponse * _Nullable segmentResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingGetSegmentVersionsRequest : AWSRequest


/**
 <p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 <p>The maximum number of items to include in each page of a paginated response. This parameter is currently not supported for application, campaign, and journey metrics.</p>
 */
@property (nonatomic, strong) NSString * _Nullable pageSize;

/**
 <p>The unique identifier for the segment.</p>
 */
@property (nonatomic, strong) NSString * _Nullable segmentId;

/**
 <p>The NextToken string that specifies which page of results to return in a paginated response.</p>
 */
@property (nonatomic, strong) NSString * _Nullable token;

@end

/**
 
 */
@interface AWSPinpointTargetingGetSegmentVersionsResponse : AWSModel


/**
 <p>Provides information about all the segments that are associated with an application.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingSegmentsResponse * _Nullable segmentsResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingGetSegmentsRequest : AWSRequest


/**
 <p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 <p>The maximum number of items to include in each page of a paginated response. This parameter is currently not supported for application, campaign, and journey metrics.</p>
 */
@property (nonatomic, strong) NSString * _Nullable pageSize;

/**
 <p>The NextToken string that specifies which page of results to return in a paginated response.</p>
 */
@property (nonatomic, strong) NSString * _Nullable token;

@end

/**
 
 */
@interface AWSPinpointTargetingGetSegmentsResponse : AWSModel


/**
 <p>Provides information about all the segments that are associated with an application.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingSegmentsResponse * _Nullable segmentsResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingGetSmsChannelRequest : AWSRequest


/**
 <p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

@end

/**
 
 */
@interface AWSPinpointTargetingGetSmsChannelResponse : AWSModel


/**
 <p>Provides information about the status and settings of the SMS channel for an application.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingSMSChannelResponse * _Nullable SMSChannelResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingGetSmsTemplateRequest : AWSRequest


/**
 <p>The name of the message template. A template name must start with an alphanumeric character and can contain a maximum of 128 characters. The characters can be alphanumeric characters, underscores (_), or hyphens (-). Template names are case sensitive.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateName;

/**
 <p>The unique identifier for the version of the message template to update, retrieve information about, or delete. To retrieve identifiers and other information for all the versions of a template, use the <linklinkend="templates-template-name-template-type-versions">Template Versions</link> resource.</p><p>If specified, this value must match the identifier for an existing template version. If specified for an update operation, this value must match the identifier for the latest existing version of the template. This restriction helps ensure that race conditions don't occur.</p><p>If you don't specify a value for this parameter, Amazon Pinpoint does the following:</p><ul><li><p>For a get operation, retrieves information about the active version of the template.</p></li><li><p>For an update operation, saves the updates to (overwrites) the latest existing version of the template, if the create-new-version parameter isn't used or is set to false.</p></li><li><p>For a delete operation, deletes the template, including all versions of the template.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable version;

@end

/**
 
 */
@interface AWSPinpointTargetingGetSmsTemplateResponse : AWSModel


/**
 <p>Provides information about the content and settings for a message template that can be used in text messages that are sent through the SMS channel.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingSMSTemplateResponse * _Nullable SMSTemplateResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingGetUserEndpointsRequest : AWSRequest


/**
 <p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 <p>The unique identifier for the user.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userId;

@end

/**
 
 */
@interface AWSPinpointTargetingGetUserEndpointsResponse : AWSModel


/**
 <p>Provides information about all the endpoints that are associated with a user ID.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingEndpointsResponse * _Nullable endpointsResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingGetVoiceChannelRequest : AWSRequest


/**
 <p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

@end

/**
 
 */
@interface AWSPinpointTargetingGetVoiceChannelResponse : AWSModel


/**
 <p>Provides information about the status and settings of the voice channel for an application.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingVoiceChannelResponse * _Nullable voiceChannelResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingGetVoiceTemplateRequest : AWSRequest


/**
 <p>The name of the message template. A template name must start with an alphanumeric character and can contain a maximum of 128 characters. The characters can be alphanumeric characters, underscores (_), or hyphens (-). Template names are case sensitive.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateName;

/**
 <p>The unique identifier for the version of the message template to update, retrieve information about, or delete. To retrieve identifiers and other information for all the versions of a template, use the <linklinkend="templates-template-name-template-type-versions">Template Versions</link> resource.</p><p>If specified, this value must match the identifier for an existing template version. If specified for an update operation, this value must match the identifier for the latest existing version of the template. This restriction helps ensure that race conditions don't occur.</p><p>If you don't specify a value for this parameter, Amazon Pinpoint does the following:</p><ul><li><p>For a get operation, retrieves information about the active version of the template.</p></li><li><p>For an update operation, saves the updates to (overwrites) the latest existing version of the template, if the create-new-version parameter isn't used or is set to false.</p></li><li><p>For a delete operation, deletes the template, including all versions of the template.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable version;

@end

/**
 
 */
@interface AWSPinpointTargetingGetVoiceTemplateResponse : AWSModel


/**
 <p>Provides information about the content and settings for a message template that can be used in messages that are sent through the voice channel.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingVoiceTemplateResponse * _Nullable voiceTemplateResponse;

@end

/**
 <p>Specifies the settings for a holdout activity in a journey. This type of activity stops a journey for a specified percentage of participants.</p>
 Required parameters: [Percentage]
 */
@interface AWSPinpointTargetingHoldoutActivity : AWSModel


/**
 <p>The unique identifier for the next activity to perform, after performing the holdout activity.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextActivity;

/**
 <p>The percentage of participants who shouldn't continue the journey.</p><p>To determine which participants are held out, Amazon Pinpoint applies a probability-based algorithm to the percentage that you specify. Therefore, the actual percentage of participants who are held out may not be equal to the percentage that you specify.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable percentage;

@end

/**
 <p>Specifies the settings for a job that imports endpoint definitions from an Amazon Simple Storage Service (Amazon S3) bucket.</p>
 Required parameters: [Format, S3Url, RoleArn]
 */
@interface AWSPinpointTargetingImportJobRequest : AWSModel


/**
 <p>Specifies whether to create a segment that contains the endpoints, when the endpoint definitions are imported.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable defineSegment;

/**
 <p>(Deprecated) Your AWS account ID, which you assigned to an external ID key in an IAM trust policy. Amazon Pinpoint previously used this value to assume an IAM role when importing endpoint definitions, but we removed this requirement. We don't recommend use of external IDs for IAM roles that are assumed by Amazon Pinpoint.</p>
 */
@property (nonatomic, strong) NSString * _Nullable externalId;

/**
 <p>The format of the files that contain the endpoint definitions to import. Valid values are: CSV, for comma-separated values format; and, JSON, for newline-delimited JSON format. If the Amazon S3 location stores multiple files that use different formats, Amazon Pinpoint imports data only from the files that use the specified format.</p>
 */
@property (nonatomic, assign) AWSPinpointTargetingFormat format;

/**
 <p>Specifies whether to register the endpoints with Amazon Pinpoint, when the endpoint definitions are imported.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable registerEndpoints;

/**
 <p>The Amazon Resource Name (ARN) of the AWS Identity and Access Management (IAM) role that authorizes Amazon Pinpoint to access the Amazon S3 location to import endpoint definitions from.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 <p>The URL of the Amazon Simple Storage Service (Amazon S3) bucket that contains the endpoint definitions to import. This location can be a folder or a single file. If the location is a folder, Amazon Pinpoint imports endpoint definitions from the files in this location, including any subfolders that the folder contains.</p><p>The URL should be in the following format: s3://<replaceable>bucket-name</replaceable>/<replaceable>folder-name</replaceable>/<replaceable>file-name</replaceable>. The location can end with the key for an individual object or a prefix that qualifies multiple objects.</p>
 */
@property (nonatomic, strong) NSString * _Nullable s3Url;

/**
 <p>The identifier for the segment to update or add the imported endpoint definitions to, if the import job is meant to update an existing segment.</p>
 */
@property (nonatomic, strong) NSString * _Nullable segmentId;

/**
 <p>A custom name for the segment that's created by the import job, if the value of the DefineSegment property is true.</p>
 */
@property (nonatomic, strong) NSString * _Nullable segmentName;

@end

/**
 <p>Provides information about the resource settings for a job that imports endpoint definitions from one or more files. The files can be stored in an Amazon Simple Storage Service (Amazon S3) bucket or uploaded directly from a computer by using the Amazon Pinpoint console.</p>
 Required parameters: [Format, S3Url, RoleArn]
 */
@interface AWSPinpointTargetingImportJobResource : AWSModel


/**
 <p>Specifies whether the import job creates a segment that contains the endpoints, when the endpoint definitions are imported.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable defineSegment;

/**
 <p>(Deprecated) Your AWS account ID, which you assigned to an external ID key in an IAM trust policy. Amazon Pinpoint previously used this value to assume an IAM role when importing endpoint definitions, but we removed this requirement. We don't recommend use of external IDs for IAM roles that are assumed by Amazon Pinpoint.</p>
 */
@property (nonatomic, strong) NSString * _Nullable externalId;

/**
 <p>The format of the files that contain the endpoint definitions to import. Valid values are: CSV, for comma-separated values format; and, JSON, for newline-delimited JSON format.</p><p>If the files are stored in an Amazon S3 location and that location contains multiple files that use different formats, Amazon Pinpoint imports data only from the files that use the specified format.</p>
 */
@property (nonatomic, assign) AWSPinpointTargetingFormat format;

/**
 <p>Specifies whether the import job registers the endpoints with Amazon Pinpoint, when the endpoint definitions are imported.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable registerEndpoints;

/**
 <p>The Amazon Resource Name (ARN) of the AWS Identity and Access Management (IAM) role that authorizes Amazon Pinpoint to access the Amazon S3 location to import endpoint definitions from.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 <p>The URL of the Amazon Simple Storage Service (Amazon S3) bucket that contains the endpoint definitions to import. This location can be a folder or a single file. If the location is a folder, Amazon Pinpoint imports endpoint definitions from the files in this location, including any subfolders that the folder contains.</p><p>The URL should be in the following format: s3://<replaceable>bucket-name</replaceable>/<replaceable>folder-name</replaceable>/<replaceable>file-name</replaceable>. The location can end with the key for an individual object or a prefix that qualifies multiple objects.</p>
 */
@property (nonatomic, strong) NSString * _Nullable s3Url;

/**
 <p>The identifier for the segment that the import job updates or adds endpoint definitions to, if the import job updates an existing segment.</p>
 */
@property (nonatomic, strong) NSString * _Nullable segmentId;

/**
 <p>The custom name for the segment that's created by the import job, if the value of the DefineSegment property is true.</p>
 */
@property (nonatomic, strong) NSString * _Nullable segmentName;

@end

/**
 <p>Provides information about the status and settings of a job that imports endpoint definitions from one or more files. The files can be stored in an Amazon Simple Storage Service (Amazon S3) bucket or uploaded directly from a computer by using the Amazon Pinpoint console.</p>
 Required parameters: [JobStatus, CreationDate, Type, Definition, Id, ApplicationId]
 */
@interface AWSPinpointTargetingImportJobResponse : AWSModel


/**
 <p>The unique identifier for the application that's associated with the import job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 <p>The number of pieces that were processed successfully (completed) by the import job, as of the time of the request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable completedPieces;

/**
 <p>The date, in ISO 8601 format, when the import job was completed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable completionDate;

/**
 <p>The date, in ISO 8601 format, when the import job was created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable creationDate;

/**
 <p>The resource settings that apply to the import job.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingImportJobResource * _Nullable definition;

/**
 <p>The number of pieces that weren't processed successfully (failed) by the import job, as of the time of the request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable failedPieces;

/**
 <p>An array of entries, one for each of the first 100 entries that weren't processed successfully (failed) by the import job, if any.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable failures;

/**
 <p>The unique identifier for the import job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The status of the import job. The job status is FAILED if Amazon Pinpoint wasn't able to process one or more pieces in the job.</p>
 */
@property (nonatomic, assign) AWSPinpointTargetingJobStatus jobStatus;

/**
 <p>The total number of endpoint definitions that weren't processed successfully (failed) by the import job, typically because an error, such as a syntax error, occurred.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable totalFailures;

/**
 <p>The total number of pieces that must be processed to complete the import job. Each piece consists of an approximately equal portion of the endpoint definitions that are part of the import job.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable totalPieces;

/**
 <p>The total number of endpoint definitions that were processed by the import job.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable totalProcessed;

/**
 <p>The job type. This value is IMPORT for import jobs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable types;

@end

/**
 <p>Provides information about the status and settings of all the import jobs that are associated with an application or segment. An import job is a job that imports endpoint definitions from one or more files.</p>
 Required parameters: [Item]
 */
@interface AWSPinpointTargetingImportJobsResponse : AWSModel


/**
 <p>An array of responses, one for each import job that's associated with the application (Import Jobs resource) or segment (Segment Import Jobs resource).</p>
 */
@property (nonatomic, strong) NSArray<AWSPinpointTargetingImportJobResponse *> * _Nullable item;

/**
 <p>The string to use in a subsequent request to get the next page of results in a paginated response. This value is null if there are no additional pages.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>Provides information about the results of a request to create or update an endpoint that's associated with an event.</p>
 */
@interface AWSPinpointTargetingItemResponse : AWSModel


/**
 <p>The response that was received after the endpoint data was accepted.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingEndpointItemResponse * _Nullable endpointItemResponse;

/**
 <p>A multipart response object that contains a key and a value for each event in the request. In each object, the event ID is the key and an EventItemResponse object is the value.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSPinpointTargetingEventItemResponse *> * _Nullable eventsItemResponse;

@end

/**
 <p>Provides the results of a query that retrieved the data for a standard engagement metric that applies to a journey, and provides information about that query.</p>
 Required parameters: [KpiResult, KpiName, JourneyId, EndTime, StartTime, ApplicationId]
 */
@interface AWSPinpointTargetingJourneyDateRangeKpiResponse : AWSModel


/**
 <p>The unique identifier for the application that the metric applies to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 <p>The last date and time of the date range that was used to filter the query results, in extended ISO 8601 format. The date range is inclusive.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable endTime;

/**
 <p>The unique identifier for the journey that the metric applies to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable journeyId;

/**
 <p>The name of the metric, also referred to as a <i>key performance indicator (KPI)</i>, that the data was retrieved for. This value describes the associated metric and consists of two or more terms, which are comprised of lowercase alphanumeric characters, separated by a hyphen. For a list of possible values, see the <a href="https://docs.aws.amazon.com/pinpoint/latest/developerguide/welcome.html">Amazon Pinpoint Developer Guide</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable kpiName;

/**
 <p>An array of objects that contains the results of the query. Each object contains the value for the metric and metadata about that value.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingBaseKpiResult * _Nullable kpiResult;

/**
 <p>The string to use in a subsequent request to get the next page of results in a paginated response. This value is null for the Journey Engagement Metrics resource because the resource returns all results in a single page.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The first date and time of the date range that was used to filter the query results, in extended ISO 8601 format. The date range is inclusive.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable startTime;

@end

/**
 <p>Specifies the "From" address for an email message that's sent to participants in a journey.</p>
 */
@interface AWSPinpointTargetingJourneyEmailMessage : AWSModel


/**
 <p>The verified email address to send the email message from. The default address is the FromAddress specified for the email channel for the application.</p>
 */
@property (nonatomic, strong) NSString * _Nullable fromAddress;

@end

/**
 <p>Provides the results of a query that retrieved the data for a standard execution metric that applies to a journey activity, and provides information about that query.</p>
 Required parameters: [Metrics, JourneyId, LastEvaluatedTime, JourneyActivityId, ActivityType, ApplicationId]
 */
@interface AWSPinpointTargetingJourneyExecutionActivityMetricsResponse : AWSModel


/**
 <p>The type of activity that the metric applies to. Possible values are:</p><ul><li><p>CONDITIONAL_SPLIT - For a yes/no split activity, which is an activity that sends participants down one of two paths in a journey.</p></li><li><p>HOLDOUT - For a holdout activity, which is an activity that stops a journey for a specified percentage of participants.</p></li><li><p>MESSAGE - For an email activity, which is an activity that sends an email message to participants.</p></li><li><p>MULTI_CONDITIONAL_SPLIT - For a multivariate split activity, which is an activity that sends participants down one of as many as five paths in a journey.</p></li><li><p>RANDOM_SPLIT - For a random split activity, which is an activity that sends specified percentages of participants down one of as many as five paths in a journey.</p></li><li><p>WAIT - For a wait activity, which is an activity that waits for a certain amount of time or until a specific date and time before moving participants to the next activity in a journey.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable activityType;

/**
 <p>The unique identifier for the application that the metric applies to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 <p>The unique identifier for the activity that the metric applies to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable journeyActivityId;

/**
 <p>The unique identifier for the journey that the metric applies to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable journeyId;

/**
 <p>The date and time, in ISO 8601 format, when Amazon Pinpoint last evaluated the execution status of the activity and updated the data for the metric.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lastEvaluatedTime;

/**
 <p>A JSON object that contains the results of the query. The results vary depending on the type of activity (ActivityType). For information about the structure and contents of the results, see the <a href="https://docs.aws.amazon.com/pinpoint/latest/developerguide/welcome.html">Amazon Pinpoint Developer Guide</a>.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable metrics;

@end

/**
 <p>Provides the results of a query that retrieved the data for a standard execution metric that applies to a journey, and provides information about that query.</p>
 Required parameters: [Metrics, JourneyId, LastEvaluatedTime, ApplicationId]
 */
@interface AWSPinpointTargetingJourneyExecutionMetricsResponse : AWSModel


/**
 <p>The unique identifier for the application that the metric applies to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 <p>The unique identifier for the journey that the metric applies to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable journeyId;

/**
 <p>The date and time, in ISO 8601 format, when Amazon Pinpoint last evaluated the journey and updated the data for the metric.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lastEvaluatedTime;

/**
 <p>A JSON object that contains the results of the query. For information about the structure and contents of the results, see the <a href="https://docs.aws.amazon.com/pinpoint/latest/developerguide/welcome.html">Amazon Pinpoint Developer Guide</a>.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable metrics;

@end

/**
 <p>Specifies limits on the messages that a journey can send and the number of times participants can enter a journey.</p>
 */
@interface AWSPinpointTargetingJourneyLimits : AWSModel


/**
 <p>The maximum number of messages that the journey can send to a single participant during a 24-hour period. The maximum value is 100.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dailyCap;

/**
 <p>The maximum number of times that a participant can enter the journey. The maximum value is 100. To allow participants to enter the journey an unlimited number of times, set this value to 0.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable endpointReentryCap;

/**
 <p>The maximum number of messages that the journey can send each second.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable messagesPerSecond;

@end

/**
 <p>Provides information about the status, configuration, and other settings for a journey.</p>
 Required parameters: [Name, Id, ApplicationId]
 */
@interface AWSPinpointTargetingJourneyResponse : AWSModel


/**
 <p>A map that contains a set of Activity objects, one object for each activity in the journey. For each Activity object, the key is the unique identifier (string) for an activity and the value is the settings for the activity.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSPinpointTargetingActivity *> * _Nullable activities;

/**
 <p>The unique identifier for the application that the journey applies to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 <p>The date, in ISO 8601 format, when the journey was created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable creationDate;

/**
 <p>The unique identifier for the journey.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The date, in ISO 8601 format, when the journey was last modified.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lastModifiedDate;

/**
 <p>The messaging and entry limits for the journey.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingJourneyLimits * _Nullable limits;

/**
 <p>Specifies whether the journey's scheduled start and end times use each participant's local time. If this value is true, the schedule uses each participant's local time.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable localTime;

/**
 <p>The name of the journey.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The quiet time settings for the journey. Quiet time is a specific time range when a journey doesn't send messages to participants, if all the following conditions are met:</p><ul><li><p>The EndpointDemographic.Timezone property of the endpoint for the participant is set to a valid value.</p></li><li><p>The current time in the participant's time zone is later than or equal to the time specified by the QuietTime.Start property for the journey.</p></li><li><p>The current time in the participant's time zone is earlier than or equal to the time specified by the QuietTime.End property for the journey.</p></li></ul><p>If any of the preceding conditions isn't met, the participant will receive messages from the journey, even if quiet time is enabled.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingQuietTime * _Nullable quietTime;

/**
 <p>The frequency with which Amazon Pinpoint evaluates segment and event data for the journey, as a duration in ISO 8601 format.</p>
 */
@property (nonatomic, strong) NSString * _Nullable refreshFrequency;

/**
 <p>The schedule settings for the journey.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingJourneySchedule * _Nullable schedule;

/**
 <p>The unique identifier for the first activity in the journey.</p>
 */
@property (nonatomic, strong) NSString * _Nullable startActivity;

/**
 <p>The segment that defines which users are participants in the journey.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingStartCondition * _Nullable startCondition;

/**
 <p>The current status of the journey. Possible values are:</p><ul><li><p>DRAFT - The journey is being developed and hasn't been published yet.</p></li><li><p>ACTIVE - The journey has been developed and published. Depending on the journey's schedule, the journey may currently be running or scheduled to start running at a later time. If a journey's status is ACTIVE, you can't add, change, or remove activities from it.</p></li><li><p>COMPLETED - The journey has been published and has finished running. All participants have entered the journey and no participants are waiting to complete the journey or any activities in the journey.</p></li><li><p>CANCELLED - The journey has been stopped. If a journey's status is CANCELLED, you can't add, change, or remove activities or segment settings from the journey.</p></li><li><p>CLOSED - The journey has been published and has started running. It may have also passed its scheduled end time, or passed its scheduled start time and a refresh frequency hasn't been specified for it. If a journey's status is CLOSED, you can't add participants to it, and no existing participants can enter the journey for the first time. However, any existing participants who are currently waiting to start an activity may continue the journey.</p></li></ul>
 */
@property (nonatomic, assign) AWSPinpointTargetingState state;

/**
 <p>This object is not used or supported.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 <p>Specifies the schedule settings for a journey.</p>
 */
@interface AWSPinpointTargetingJourneySchedule : AWSModel


/**
 <p>The scheduled time, in ISO 8601 format, when the journey ended or will end.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable endTime;

/**
 <p>The scheduled time, in ISO 8601 format, when the journey began or will begin.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable startTime;

/**
 <p>The starting UTC offset for the journey schedule, if the value of the journey's LocalTime property is true. Valid values are: UTC, UTC+01, UTC+02, UTC+03, UTC+03:30, UTC+04, UTC+04:30, UTC+05, UTC+05:30, UTC+05:45, UTC+06, UTC+06:30, UTC+07, UTC+08, UTC+08:45, UTC+09, UTC+09:30, UTC+10, UTC+10:30, UTC+11, UTC+12, UTC+12:45, UTC+13, UTC+13:45, UTC-02, UTC-02:30, UTC-03, UTC-03:30, UTC-04, UTC-05, UTC-06, UTC-07, UTC-08, UTC-09, UTC-09:30, UTC-10, and UTC-11.</p>
 */
@property (nonatomic, strong) NSString * _Nullable timezone;

@end

/**
 <p>Changes the status of a journey.</p>
 */
@interface AWSPinpointTargetingJourneyStateRequest : AWSModel


/**
 <p>The status of the journey. Currently, the only supported value is CANCELLED.</p><p>If you cancel a journey, Amazon Pinpoint continues to perform activities that are currently in progress, until those activities are complete. Amazon Pinpoint also continues to collect and aggregate analytics data for those activities, until they are complete, and any activities that were complete when you cancelled the journey.</p><p>After you cancel a journey, you can't add, change, or remove any activities from the journey. In addition, Amazon Pinpoint stops evaluating the journey and doesn't perform any activities that haven't started.</p>
 */
@property (nonatomic, assign) AWSPinpointTargetingState state;

@end

/**
 <p>Provides information about the status, configuration, and other settings for all the journeys that are associated with an application.</p>
 Required parameters: [Item]
 */
@interface AWSPinpointTargetingJourneysResponse : AWSModel


/**
 <p>An array of responses, one for each journey that's associated with the application.</p>
 */
@property (nonatomic, strong) NSArray<AWSPinpointTargetingJourneyResponse *> * _Nullable item;

/**
 <p>The string to use in a subsequent request to get the next page of results in a paginated response. This value is null if there are no additional pages.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSPinpointTargetingListJourneysRequest : AWSRequest


/**
 <p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 <p>The maximum number of items to include in each page of a paginated response. This parameter is currently not supported for application, campaign, and journey metrics.</p>
 */
@property (nonatomic, strong) NSString * _Nullable pageSize;

/**
 <p>The NextToken string that specifies which page of results to return in a paginated response.</p>
 */
@property (nonatomic, strong) NSString * _Nullable token;

@end

/**
 
 */
@interface AWSPinpointTargetingListJourneysResponse : AWSModel


/**
 <p>Provides information about the status, configuration, and other settings for all the journeys that are associated with an application.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingJourneysResponse * _Nullable journeysResponse;

@end

/**
 <p>Provides information about all the recommender model configurations that are associated with your Amazon Pinpoint account.</p>
 Required parameters: [Item]
 */
@interface AWSPinpointTargetingListRecommenderConfigurationsResponse : AWSModel


/**
 <p>An array of responses, one for each recommender model configuration that's associated with your Amazon Pinpoint account.</p>
 */
@property (nonatomic, strong) NSArray<AWSPinpointTargetingRecommenderConfigurationResponse *> * _Nullable item;

/**
 <p>The string to use in a subsequent request to get the next page of results in a paginated response. This value is null if there are no additional pages.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSPinpointTargetingListTagsForResourceRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

@end

/**
 
 */
@interface AWSPinpointTargetingListTagsForResourceResponse : AWSModel


/**
 <p>Specifies the tags (keys and values) for an application, campaign, message template, or segment.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingTagsModel * _Nullable tagsModel;

@end

/**
 
 */
@interface AWSPinpointTargetingListTemplateVersionsRequest : AWSRequest


/**
 <p>Thestring that specifies which page of results to return in a paginated response. This parameter is currently not supported for application, campaign, and journey metrics.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The maximum number of items to include in each page of a paginated response. This parameter is currently not supported for application, campaign, and journey metrics.</p>
 */
@property (nonatomic, strong) NSString * _Nullable pageSize;

/**
 <p>The name of the message template. A template name must start with an alphanumeric character and can contain a maximum of 128 characters. The characters can be alphanumeric characters, underscores (_), or hyphens (-). Template names are case sensitive.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateName;

/**
 <p>The type of channel that the message template is designed for. Valid values are: EMAIL, PUSH, SMS, and VOICE.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateType;

@end

/**
 
 */
@interface AWSPinpointTargetingListTemplateVersionsResponse : AWSModel


/**
 <p>Provides information about all the versions of a specific message template.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingTemplateVersionsResponse * _Nullable templateVersionsResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingListTemplatesRequest : AWSRequest


/**
 <p>Thestring that specifies which page of results to return in a paginated response. This parameter is currently not supported for application, campaign, and journey metrics.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The maximum number of items to include in each page of a paginated response. This parameter is currently not supported for application, campaign, and journey metrics.</p>
 */
@property (nonatomic, strong) NSString * _Nullable pageSize;

/**
 <p>The substring to match in the names of the message templates to include in the results. If you specify this value, Amazon Pinpoint returns only those templates whose names begin with the value that you specify.</p>
 */
@property (nonatomic, strong) NSString * _Nullable prefix;

/**
 <p>The type of message template to include in the results. Valid values are: EMAIL, PUSH, SMS, and VOICE. To include all types of templates in the results, don't include this parameter in your request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateType;

@end

/**
 
 */
@interface AWSPinpointTargetingListTemplatesResponse : AWSModel


/**
 <p>Provides information about all the message templates that are associated with your Amazon Pinpoint account.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingTemplatesResponse * _Nullable templatesResponse;

@end

/**
 <p>Specifies the content and settings for a push notification that's sent to recipients of a campaign.</p>
 */
@interface AWSPinpointTargetingMessage : AWSModel


/**
 <p>The action to occur if a recipient taps the push notification. Valid values are:</p><ul><li><p>OPEN_APP - Your app opens or it becomes the foreground app if it was sent to the background. This is the default action.</p></li><li><p>DEEP_LINK - Your app opens and displays a designated user interface in the app. This setting uses the deep-linking features of iOS and Android.</p></li><li><p>URL - The default mobile browser on the recipient's device opens and loads the web page at a URL that you specify.</p></li></ul>
 */
@property (nonatomic, assign) AWSPinpointTargetingAction action;

/**
 <p>The body of the notification message. The maximum number of characters is 200.</p>
 */
@property (nonatomic, strong) NSString * _Nullable body;

/**
 <p>The URL of the image to display as the push-notification icon, such as the icon for the app.</p>
 */
@property (nonatomic, strong) NSString * _Nullable imageIconUrl;

/**
 <p>The URL of the image to display as the small, push-notification icon, such as a small version of the icon for the app.</p>
 */
@property (nonatomic, strong) NSString * _Nullable imageSmallIconUrl;

/**
 <p>The URL of an image to display in the push notification.</p>
 */
@property (nonatomic, strong) NSString * _Nullable imageUrl;

/**
 <p>The JSON payload to use for a silent push notification.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jsonBody;

/**
 <p>The URL of the image or video to display in the push notification.</p>
 */
@property (nonatomic, strong) NSString * _Nullable mediaUrl;

/**
 <p>The raw, JSON-formatted string to use as the payload for the notification message. If specified, this value overrides all other content for the message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable rawContent;

/**
 <p>Specifies whether the notification is a silent push notification, which is a push notification that doesn't display on a recipient's device. Silent push notifications can be used for cases such as updating an app's configuration, displaying messages in an in-app message center, or supporting phone home functionality.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable silentPush;

/**
 <p>The number of seconds that the push-notification service should keep the message, if the service is unable to deliver the notification the first time. This value is converted to an expiration value when it's sent to a push-notification service. If this value is 0, the service treats the notification as if it expires immediately and the service doesn't store or try to deliver the notification again.</p><p>This value doesn't apply to messages that are sent through the Amazon Device Messaging (ADM) service.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable timeToLive;

/**
 <p>The title to display above the notification message on a recipient's device.</p>
 */
@property (nonatomic, strong) NSString * _Nullable title;

/**
 <p>The URL to open in a recipient's default mobile browser, if a recipient taps the push notification and the value of the Action property is URL.</p>
 */
@property (nonatomic, strong) NSString * _Nullable url;

@end

/**
 <p>Provides information about an API request or response.</p>
 */
@interface AWSPinpointTargetingMessageBody : AWSModel


/**
 <p>The message that's returned from the API.</p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

/**
 <p>The unique identifier for the request or response.</p>
 */
@property (nonatomic, strong) NSString * _Nullable requestID;

@end

/**
 <p>Specifies the message configuration settings for a campaign.</p>
 */
@interface AWSPinpointTargetingMessageConfiguration : AWSModel


/**
 <p>The message that the campaign sends through the ADM (Amazon Device Messaging) channel. This message overrides the default message.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingMessage * _Nullable ADMMessage;

/**
 <p>The message that the campaign sends through the APNs (Apple Push Notification service) channel. This message overrides the default message.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingMessage * _Nullable APNSMessage;

/**
 <p>The message that the campaign sends through the Baidu (Baidu Cloud Push) channel. This message overrides the default message.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingMessage * _Nullable baiduMessage;

/**
 <p>The default message that the campaign sends through all the channels that are configured for the campaign.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingMessage * _Nullable defaultMessage;

/**
 <p>The message that the campaign sends through the email channel.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingCampaignEmailMessage * _Nullable emailMessage;

/**
 <p>The message that the campaign sends through the GCM channel, which enables Amazon Pinpoint to send push notifications through the Firebase Cloud Messaging (FCM), formerly Google Cloud Messaging (GCM), service. This message overrides the default message.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingMessage * _Nullable GCMMessage;

/**
 <p>The message that the campaign sends through the SMS channel.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingCampaignSmsMessage * _Nullable SMSMessage;

@end

/**
 <p>Specifies the configuration and other settings for a message.</p>
 Required parameters: [MessageConfiguration]
 */
@interface AWSPinpointTargetingMessageRequest : AWSModel


/**
 <p>A map of key-value pairs, where each key is an address and each value is an AddressConfiguration object. An address can be a push notification token, a phone number, or an email address. You can use an AddressConfiguration object to tailor the message for an address by specifying settings such as content overrides and message variables.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSPinpointTargetingAddressConfiguration *> * _Nullable addresses;

/**
 <p>A map of custom attributes to attach to the message. For a push notification, this payload is added to the data.pinpoint object. For an email or text message, this payload is added to email/SMS delivery receipt event attributes.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable context;

/**
 <p>A map of key-value pairs, where each key is an endpoint ID and each value is an EndpointSendConfiguration object. You can use an EndpointSendConfiguration object to tailor the message for an endpoint by specifying settings such as content overrides and message variables.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSPinpointTargetingEndpointSendConfiguration *> * _Nullable endpoints;

/**
 <p>The settings and content for the default message and any default messages that you defined for specific channels.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingDirectMessageConfiguration * _Nullable messageConfiguration;

/**
 <p>The message template to use for the message.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingTemplateConfiguration * _Nullable templateConfiguration;

/**
 <p>The unique identifier for tracing the message. This identifier is visible to message recipients.</p>
 */
@property (nonatomic, strong) NSString * _Nullable traceId;

@end

/**
 <p>Provides information about the results of a request to send a message to an endpoint address.</p>
 Required parameters: [ApplicationId]
 */
@interface AWSPinpointTargetingMessageResponse : AWSModel


/**
 <p>The unique identifier for the application that was used to send the message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 <p>A map that contains a multipart response for each address that the message was sent to. In the map, the endpoint ID is the key and the result is the value.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSPinpointTargetingEndpointMessageResult *> * _Nullable endpointResult;

/**
 <p>The identifier for the original request that the message was delivered for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

/**
 <p>A map that contains a multipart response for each address (email address, phone number, or push notification token) that the message was sent to. In the map, the address is the key and the result is the value.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSPinpointTargetingMessageResult *> * _Nullable result;

@end

/**
 <p>Provides information about the results of sending a message directly to an endpoint address.</p>
 Required parameters: [DeliveryStatus, StatusCode]
 */
@interface AWSPinpointTargetingMessageResult : AWSModel


/**
 <p>The delivery status of the message. Possible values are:</p><ul><li><p>DUPLICATE - The endpoint address is a duplicate of another endpoint address. Amazon Pinpoint won't attempt to send the message again.</p></li><li><p>OPT_OUT - The user who's associated with the endpoint address has opted out of receiving messages from you. Amazon Pinpoint won't attempt to send the message again.</p></li><li><p>PERMANENT_FAILURE - An error occurred when delivering the message to the endpoint address. Amazon Pinpoint won't attempt to send the message again.</p></li><li><p>SUCCESSFUL - The message was successfully delivered to the endpoint address.</p></li><li><p>TEMPORARY_FAILURE - A temporary error occurred. Amazon Pinpoint won't attempt to send the message again.</p></li><li><p>THROTTLED - Amazon Pinpoint throttled the operation to send the message to the endpoint address.</p></li><li><p>TIMEOUT - The message couldn't be sent within the timeout period.</p></li><li><p>UNKNOWN_FAILURE - An unknown error occurred.</p></li></ul>
 */
@property (nonatomic, assign) AWSPinpointTargetingDeliveryStatus deliveryStatus;

/**
 <p>The unique identifier for the message that was sent.</p>
 */
@property (nonatomic, strong) NSString * _Nullable messageId;

/**
 <p>The downstream service status code for delivering the message.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable statusCode;

/**
 <p>The status message for delivering the message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable statusMessage;

/**
 <p>For push notifications that are sent through the GCM channel, specifies whether the endpoint's device registration token was updated as part of delivering the message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable updatedToken;

@end

/**
 <p>Specifies metric-based criteria for including or excluding endpoints from a segment. These criteria derive from custom metrics that you define for endpoints.</p>
 Required parameters: [ComparisonOperator, Value]
 */
@interface AWSPinpointTargetingMetricDimension : AWSModel


/**
 <p>The operator to use when comparing metric values. Valid values are: GREATER_THAN, LESS_THAN, GREATER_THAN_OR_EQUAL, LESS_THAN_OR_EQUAL, and EQUAL.</p>
 */
@property (nonatomic, strong) NSString * _Nullable comparisonOperator;

/**
 <p>The value to compare.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable value;

@end

/**
 <p>Specifies a condition to evaluate for an activity path in a journey.</p>
 */
@interface AWSPinpointTargetingMultiConditionalBranch : AWSModel


/**
 <p>The condition to evaluate for the activity path.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingSimpleCondition * _Nullable condition;

/**
 <p>The unique identifier for the next activity to perform, after completing the activity for the path.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextActivity;

@end

/**
 <p>Specifies the settings for a multivariate split activity in a journey. This type of activity sends participants down one of as many as five paths (including a default <i>Else</i> path) in a journey, based on conditions that you specify.</p>
 */
@interface AWSPinpointTargetingMultiConditionalSplitActivity : AWSModel


/**
 <p>The paths for the activity, including the conditions for entering each path and the activity to perform for each path.</p>
 */
@property (nonatomic, strong) NSArray<AWSPinpointTargetingMultiConditionalBranch *> * _Nullable branches;

/**
 <p>The unique identifier for the activity to perform for participants who don't meet any of the conditions specified for other paths in the activity.</p>
 */
@property (nonatomic, strong) NSString * _Nullable defaultActivity;

/**
 <p>The amount of time to wait or the date and time when Amazon Pinpoint determines whether the conditions are met.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingWaitTime * _Nullable evaluationWaitTime;

@end

/**
 <p>Specifies a phone number to validate and retrieve information about.</p>
 */
@interface AWSPinpointTargetingNumberValidateRequest : AWSModel


/**
 <p>The two-character code, in ISO 3166-1 alpha-2 format, for the country or region where the phone number was originally registered.</p>
 */
@property (nonatomic, strong) NSString * _Nullable isoCountryCode;

/**
 <p>The phone number to retrieve information about. The phone number that you provide should include a valid numeric country code. Otherwise, the operation might result in an error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable phoneNumber;

@end

/**
 <p>Provides information about a phone number.</p>
 */
@interface AWSPinpointTargetingNumberValidateResponse : AWSModel


/**
 <p>The carrier or service provider that the phone number is currently registered with. In some countries and regions, this value may be the carrier or service provider that the phone number was originally registered with.</p>
 */
@property (nonatomic, strong) NSString * _Nullable carrier;

/**
 <p>The name of the city where the phone number was originally registered.</p>
 */
@property (nonatomic, strong) NSString * _Nullable city;

/**
 <p>The cleansed phone number, in E.164 format, for the location where the phone number was originally registered.</p>
 */
@property (nonatomic, strong) NSString * _Nullable cleansedPhoneNumberE164;

/**
 <p>The cleansed phone number, in the format for the location where the phone number was originally registered.</p>
 */
@property (nonatomic, strong) NSString * _Nullable cleansedPhoneNumberNational;

/**
 <p>The name of the country or region where the phone number was originally registered.</p>
 */
@property (nonatomic, strong) NSString * _Nullable country;

/**
 <p>The two-character code, in ISO 3166-1 alpha-2 format, for the country or region where the phone number was originally registered.</p>
 */
@property (nonatomic, strong) NSString * _Nullable countryCodeIso2;

/**
 <p>The numeric code for the country or region where the phone number was originally registered.</p>
 */
@property (nonatomic, strong) NSString * _Nullable countryCodeNumeric;

/**
 <p>The name of the county where the phone number was originally registered.</p>
 */
@property (nonatomic, strong) NSString * _Nullable county;

/**
 <p>The two-character code, in ISO 3166-1 alpha-2 format, that was sent in the request body.</p>
 */
@property (nonatomic, strong) NSString * _Nullable originalCountryCodeIso2;

/**
 <p>The phone number that was sent in the request body.</p>
 */
@property (nonatomic, strong) NSString * _Nullable originalPhoneNumber;

/**
 <p>The description of the phone type. Valid values are: MOBILE, LANDLINE, VOIP, INVALID, PREPAID, and OTHER.</p>
 */
@property (nonatomic, strong) NSString * _Nullable phoneType;

/**
 <p>The phone type, represented by an integer. Valid values are: 0 (mobile), 1 (landline), 2 (VoIP), 3 (invalid), 4 (other), and 5 (prepaid).</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable phoneTypeCode;

/**
 <p>The time zone for the location where the phone number was originally registered.</p>
 */
@property (nonatomic, strong) NSString * _Nullable timezone;

/**
 <p>The postal or ZIP code for the location where the phone number was originally registered.</p>
 */
@property (nonatomic, strong) NSString * _Nullable zipCode;

@end

/**
 
 */
@interface AWSPinpointTargetingPhoneNumberValidateRequest : AWSRequest


/**
 <p>Specifies a phone number to validate and retrieve information about.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingNumberValidateRequest * _Nullable numberValidateRequest;

@end

/**
 
 */
@interface AWSPinpointTargetingPhoneNumberValidateResponse : AWSModel


/**
 <p>Provides information about a phone number.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingNumberValidateResponse * _Nullable numberValidateResponse;

@end

/**
 <p>Specifies the properties and attributes of an endpoint that's associated with an event.</p>
 */
@interface AWSPinpointTargetingPublicEndpoint : AWSModel


/**
 <p>The unique identifier for the recipient, such as a device token, email address, or mobile phone number.</p>
 */
@property (nonatomic, strong) NSString * _Nullable address;

/**
 <p>One or more custom attributes that describe the endpoint by associating a name with an array of values. You can use these attributes as filter criteria when you create segments.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSArray<NSString *> *> * _Nullable attributes;

/**
 <p>The channel that's used when sending messages or push notifications to the endpoint.</p>
 */
@property (nonatomic, assign) AWSPinpointTargetingChannelType channelType;

/**
 <p>The demographic information for the endpoint, such as the time zone and platform.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingEndpointDemographic * _Nullable demographic;

/**
 <p>The date and time, in ISO 8601 format, when the endpoint was last updated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable effectiveDate;

/**
 <p>Specifies whether to send messages or push notifications to the endpoint. Valid values are: ACTIVE, messages are sent to the endpoint; and, INACTIVE, messages aren’t sent to the endpoint.</p><p>Amazon Pinpoint automatically sets this value to ACTIVE when you create an endpoint or update an existing endpoint. Amazon Pinpoint automatically sets this value to INACTIVE if you update another endpoint that has the same address specified by the Address property.</p>
 */
@property (nonatomic, strong) NSString * _Nullable endpointStatus;

/**
 <p>The geographic information for the endpoint.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingEndpointLocation * _Nullable location;

/**
 <p>One or more custom metrics that your app reports to Amazon Pinpoint for the endpoint.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSNumber *> * _Nullable metrics;

/**
 <p>Specifies whether the user who's associated with the endpoint has opted out of receiving messages and push notifications from you. Possible values are: ALL, the user has opted out and doesn't want to receive any messages or push notifications; and, NONE, the user hasn't opted out and wants to receive all messages and push notifications.</p>
 */
@property (nonatomic, strong) NSString * _Nullable optOut;

/**
 <p>A unique identifier that's generated each time the endpoint is updated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

/**
 <p>One or more custom user attributes that your app reports to Amazon Pinpoint for the user who's associated with the endpoint.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingEndpointUser * _Nullable user;

@end

/**
 <p>Specifies the content and settings for a message template that can be used in messages that are sent through a push notification channel.</p>
 */
@interface AWSPinpointTargetingPushNotificationTemplateRequest : AWSModel


/**
 <p>The message template to use for the ADM (Amazon Device Messaging) channel. This message template overrides the default template for push notification channels (DefaultPushNotificationTemplate).</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingAndroidPushNotificationTemplate * _Nullable ADM;

/**
 <p>The message template to use for the APNs (Apple Push Notification service) channel. This message template overrides the default template for push notification channels (DefaultPushNotificationTemplate).</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingAPNSPushNotificationTemplate * _Nullable APNS;

/**
 <p>The message template to use for the Baidu (Baidu Cloud Push) channel. This message template overrides the default template for push notification channels (DefaultPushNotificationTemplate).</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingAndroidPushNotificationTemplate * _Nullable baidu;

/**
 <p>The default message template to use for push notification channels.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingDefaultPushNotificationTemplate * _Nullable defaultValue;

/**
 <p>A JSON object that specifies the default values to use for message variables in the message template. This object is a set of key-value pairs. Each key defines a message variable in the template. The corresponding value defines the default value for that variable. When you create a message that's based on the template, you can override these defaults with message-specific and address-specific variables and values.</p>
 */
@property (nonatomic, strong) NSString * _Nullable defaultSubstitutions;

/**
 <p>The message template to use for the GCM channel, which is used to send notifications through the Firebase Cloud Messaging (FCM), formerly Google Cloud Messaging (GCM), service. This message template overrides the default template for push notification channels (DefaultPushNotificationTemplate).</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingAndroidPushNotificationTemplate * _Nullable GCM;

/**
 <p>The unique identifier for the recommender model to use for the message template. Amazon Pinpoint uses this value to determine how to retrieve and process data from a recommender model when it sends messages that use the template, if the template contains message variables for recommendation data.</p>
 */
@property (nonatomic, strong) NSString * _Nullable recommenderId;

/**
 <p>A custom description of the message template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateDescription;

/**
 <p>A string-to-string map of key-value pairs that defines the tags to associate with the message template. Each tag consists of a required tag key and an associated tag value.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 <p>Provides information about the content and settings for a message template that can be used in messages that are sent through a push notification channel.</p>
 Required parameters: [LastModifiedDate, CreationDate, TemplateType, TemplateName]
 */
@interface AWSPinpointTargetingPushNotificationTemplateResponse : AWSModel


/**
 <p>The message template that's used for the ADM (Amazon Device Messaging) channel. This message template overrides the default template for push notification channels (DefaultPushNotificationTemplate).</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingAndroidPushNotificationTemplate * _Nullable ADM;

/**
 <p>The message template that's used for the APNs (Apple Push Notification service) channel. This message template overrides the default template for push notification channels (DefaultPushNotificationTemplate).</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingAPNSPushNotificationTemplate * _Nullable APNS;

/**
 <p>The Amazon Resource Name (ARN) of the message template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The message template that's used for the Baidu (Baidu Cloud Push) channel. This message template overrides the default template for push notification channels (DefaultPushNotificationTemplate).</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingAndroidPushNotificationTemplate * _Nullable baidu;

/**
 <p>The date, in ISO 8601 format, when the message template was created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable creationDate;

/**
 <p>The default message template that's used for push notification channels.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingDefaultPushNotificationTemplate * _Nullable defaultValue;

/**
 <p>The JSON object that specifies the default values that are used for message variables in the message template. This object is a set of key-value pairs. Each key defines a message variable in the template. The corresponding value defines the default value for that variable.</p>
 */
@property (nonatomic, strong) NSString * _Nullable defaultSubstitutions;

/**
 <p>The message template that's used for the GCM channel, which is used to send notifications through the Firebase Cloud Messaging (FCM), formerly Google Cloud Messaging (GCM), service. This message template overrides the default template for push notification channels (DefaultPushNotificationTemplate).</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingAndroidPushNotificationTemplate * _Nullable GCM;

/**
 <p>The date, in ISO 8601 format, when the message template was last modified.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lastModifiedDate;

/**
 <p>The unique identifier for the recommender model that's used by the message template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable recommenderId;

/**
 <p>The custom description of the message template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateDescription;

/**
 <p>The name of the message template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateName;

/**
 <p>The type of channel that the message template is designed for. For a push notification template, this value is PUSH.</p>
 */
@property (nonatomic, assign) AWSPinpointTargetingTemplateType templateType;

/**
 <p>The unique identifier, as an integer, for the active version of the message template, or the version of the template that you specified by using the version parameter in your request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable version;

/**
 <p>A string-to-string map of key-value pairs that identifies the tags that are associated with the message template. Each tag consists of a required tag key and an associated tag value.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSPinpointTargetingPutEventStreamRequest : AWSRequest


/**
 <p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 <p>Specifies the Amazon Resource Name (ARN) of an event stream to publish events to and the AWS Identity and Access Management (IAM) role to use when publishing those events.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingWriteEventStream * _Nullable writeEventStream;

@end

/**
 
 */
@interface AWSPinpointTargetingPutEventStreamResponse : AWSModel


/**
 <p>Specifies settings for publishing event data to an Amazon Kinesis data stream or an Amazon Kinesis Data Firehose delivery stream.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingEventStream * _Nullable eventStream;

@end

/**
 
 */
@interface AWSPinpointTargetingPutEventsRequest : AWSRequest


/**
 <p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 <p>Specifies a batch of events to process.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingEventsRequest * _Nullable eventsRequest;

@end

/**
 
 */
@interface AWSPinpointTargetingPutEventsResponse : AWSModel


/**
 <p>Provides information about endpoints and the events that they're associated with.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingEventsResponse * _Nullable eventsResponse;

@end

/**
 <p>Specifies the start and end times that define a time range when messages aren't sent to endpoints.</p>
 */
@interface AWSPinpointTargetingQuietTime : AWSModel


/**
 <p>The specific time when quiet time ends. This value has to use 24-hour notation and be in HH:MM format, where HH is the hour (with a leading zero, if applicable) and MM is the minutes. For example, use 02:30 to represent 2:30 AM, or 14:30 to represent 2:30 PM.</p>
 */
@property (nonatomic, strong) NSString * _Nullable end;

/**
 <p>The specific time when quiet time begins. This value has to use 24-hour notation and be in HH:MM format, where HH is the hour (with a leading zero, if applicable) and MM is the minutes. For example, use 02:30 to represent 2:30 AM, or 14:30 to represent 2:30 PM.</p>
 */
@property (nonatomic, strong) NSString * _Nullable start;

@end

/**
 <p>Specifies the settings for a random split activity in a journey. This type of activity randomly sends specified percentages of participants down one of as many as five paths in a journey, based on conditions that you specify.</p>
 */
@interface AWSPinpointTargetingRandomSplitActivity : AWSModel


/**
 <p>The paths for the activity, including the percentage of participants to enter each path and the activity to perform for each path.</p>
 */
@property (nonatomic, strong) NSArray<AWSPinpointTargetingRandomSplitEntry *> * _Nullable branches;

@end

/**
 <p>Specifies the settings for a path in a random split activity in a journey.</p>
 */
@interface AWSPinpointTargetingRandomSplitEntry : AWSModel


/**
 <p>The unique identifier for the next activity to perform, after completing the activity for the path.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextActivity;

/**
 <p>The percentage of participants to send down the activity path.</p><p>To determine which participants are sent down each path, Amazon Pinpoint applies a probability-based algorithm to the percentages that you specify for the paths. Therefore, the actual percentage of participants who are sent down a path may not be equal to the percentage that you specify.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable percentage;

@end

/**
 <p>Specifies the contents of an email message, represented as a raw MIME message.</p>
 */
@interface AWSPinpointTargetingRawEmail : AWSModel


/**
 <p>The email message, represented as a raw MIME message. The entire message must be base64 encoded.</p>
 */
@property (nonatomic, strong) NSData * _Nullable data;

@end

/**
 <p>Specifies criteria for including or excluding endpoints from a segment based on how recently an endpoint was active.</p>
 Required parameters: [Duration, RecencyType]
 */
@interface AWSPinpointTargetingRecencyDimension : AWSModel


/**
 <p>The duration to use when determining whether an endpoint is active or inactive.</p>
 */
@property (nonatomic, assign) AWSPinpointTargetingDuration duration;

/**
 <p>The type of recency dimension to use for the segment. Valid values are: ACTIVE, endpoints that were active within the specified duration are included in the segment; and, INACTIVE, endpoints that weren't active within the specified duration are included in the segment.</p>
 */
@property (nonatomic, assign) AWSPinpointTargetingRecencyType recencyType;

@end

/**
 <p>Provides information about Amazon Pinpoint configuration settings for retrieving and processing data from a recommender model.</p>
 Required parameters: [RecommendationProviderUri, LastModifiedDate, CreationDate, RecommendationProviderRoleArn, Id]
 */
@interface AWSPinpointTargetingRecommenderConfigurationResponse : AWSModel


/**
 <p>A map that defines 1-10 custom endpoint or user attributes, depending on the value for the RecommenderUserIdType property. Each of these attributes temporarily stores a recommended item that's retrieved from the recommender model and sent to an AWS Lambda function for additional processing. Each attribute can be used as a message variable in a message template.</p><p>This value is null if the configuration doesn't invoke an AWS Lambda function (LambdaFunctionArn) to perform additional processing of recommendation data.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable attributes;

/**
 <p>The date, in extended ISO 8601 format, when the configuration was created for the recommender model.</p>
 */
@property (nonatomic, strong) NSString * _Nullable creationDate;

/**
 <p>The custom description of the configuration for the recommender model.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The unique identifier for the recommender model configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The date, in extended ISO 8601 format, when the configuration for the recommender model was last modified.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lastModifiedDate;

/**
 <p>The custom name of the configuration for the recommender model.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The type of Amazon Pinpoint ID that's associated with unique user IDs in the recommender model. This value enables the model to use attribute and event data that’s specific to a particular endpoint or user in an Amazon Pinpoint application. Possible values are:</p><ul><li><p>PINPOINT_ENDPOINT_ID - Each user in the model is associated with a particular endpoint in Amazon Pinpoint. The data is correlated based on endpoint IDs in Amazon Pinpoint. This is the default value.</p></li><li><p>PINPOINT_USER_ID - Each user in the model is associated with a particular user and endpoint in Amazon Pinpoint. The data is correlated based on user IDs in Amazon Pinpoint. If this value is specified, an endpoint definition in Amazon Pinpoint has to specify both a user ID (UserId) and an endpoint ID. Otherwise, messages won’t be sent to the user's endpoint.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable recommendationProviderIdType;

/**
 <p>The Amazon Resource Name (ARN) of the AWS Identity and Access Management (IAM) role that authorizes Amazon Pinpoint to retrieve recommendation data from the recommender model.</p>
 */
@property (nonatomic, strong) NSString * _Nullable recommendationProviderRoleArn;

/**
 <p>The Amazon Resource Name (ARN) of the recommender model that Amazon Pinpoint retrieves the recommendation data from. This value is the ARN of an Amazon Personalize campaign.</p>
 */
@property (nonatomic, strong) NSString * _Nullable recommendationProviderUri;

/**
 <p>The name or Amazon Resource Name (ARN) of the AWS Lambda function that Amazon Pinpoint invokes to perform additional processing of recommendation data that it retrieves from the recommender model.</p>
 */
@property (nonatomic, strong) NSString * _Nullable recommendationTransformerUri;

/**
 <p>The custom display name for the standard endpoint or user attribute (RecommendationItems) that temporarily stores a recommended item for each endpoint or user, depending on the value for the RecommenderUserIdType property. This name appears in the <b>Attribute finder</b> pane of the template editor on the Amazon Pinpoint console.</p><p>This value is null if the configuration doesn't invoke an AWS Lambda function (LambdaFunctionArn) to perform additional processing of recommendation data.</p>
 */
@property (nonatomic, strong) NSString * _Nullable recommendationsDisplayName;

/**
 <p>The number of recommended items that are retrieved from the model for each endpoint or user, depending on the value for the RecommenderUserIdType property. This number determines how many recommended attributes are available for use as message variables in message templates.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable recommendationsPerMessage;

@end

/**
 
 */
@interface AWSPinpointTargetingRemoveAttributesRequest : AWSRequest


/**
 <p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
  <p>The type of attribute or attributes to remove. Valid values are:</p><ul><li><p>endpoint-custom-attributes - Custom attributes that describe endpoints, such as the date when an associated user opted in or out of receiving communications from you through a specific type of channel.</p></li><li><p>endpoint-metric-attributes - Custom metrics that your app reports to Amazon Pinpoint for endpoints, such as the number of app sessions or the number of items left in a cart.</p></li><li><p>endpoint-user-attributes - Custom attributes that describe users, such as first name, last name, and age.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable attributeType;

/**
 <p>Specifies one or more attributes to remove from all the endpoints that are associated with an application.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingUpdateAttributesRequest * _Nullable updateAttributesRequest;

@end

/**
 
 */
@interface AWSPinpointTargetingRemoveAttributesResponse : AWSModel


/**
 <p>Provides information about the type and the names of attributes that were removed from all the endpoints that are associated with an application.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingAttributesResource * _Nullable attributesResource;

@end

/**
 <p>Provides the results of a query that retrieved the data for a standard metric that applies to an application, campaign, or journey.</p>
 Required parameters: [GroupedBys, Values]
 */
@interface AWSPinpointTargetingResultRow : AWSModel


/**
 <p>An array of objects that defines the field and field values that were used to group data in a result set that contains multiple results. This value is null if the data in a result set isn’t grouped.</p>
 */
@property (nonatomic, strong) NSArray<AWSPinpointTargetingResultRowValue *> * _Nullable groupedBys;

/**
 <p>An array of objects that provides pre-aggregated values for a standard metric that applies to an application, campaign, or journey.</p>
 */
@property (nonatomic, strong) NSArray<AWSPinpointTargetingResultRowValue *> * _Nullable values;

@end

/**
 <p>Provides a single value and metadata about that value as part of an array of query results for a standard metric that applies to an application, campaign, or journey.</p>
 Required parameters: [Type, Value, Key]
 */
@interface AWSPinpointTargetingResultRowValue : AWSModel


/**
 <p>The friendly name of the metric whose value is specified by the Value property.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>The data type of the value specified by the Value property.</p>
 */
@property (nonatomic, strong) NSString * _Nullable types;

/**
 <p>In a Values object, the value for the metric that the query retrieved data for. In a GroupedBys object, the value for the field that was used to group data in a result set that contains multiple results (Values objects).</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 <p>Specifies the status and settings of the SMS channel for an application.</p>
 */
@interface AWSPinpointTargetingSMSChannelRequest : AWSModel


/**
 <p>Specifies whether to enable the SMS channel for the application.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

/**
 <p>The identity that you want to display on recipients' devices when they receive messages from the SMS channel.</p>
 */
@property (nonatomic, strong) NSString * _Nullable senderId;

/**
 <p>The registered short code that you want to use when you send messages through the SMS channel.</p>
 */
@property (nonatomic, strong) NSString * _Nullable shortCode;

@end

/**
 <p>Provides information about the status and settings of the SMS channel for an application.</p>
 Required parameters: [Platform]
 */
@interface AWSPinpointTargetingSMSChannelResponse : AWSModel


/**
 <p>The unique identifier for the application that the SMS channel applies to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 <p>The date and time, in ISO 8601 format, when the SMS channel was enabled.</p>
 */
@property (nonatomic, strong) NSString * _Nullable creationDate;

/**
 <p>Specifies whether the SMS channel is enabled for the application.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

/**
 <p>(Not used) This property is retained only for backward compatibility.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable hasCredential;

/**
 <p>(Deprecated) An identifier for the SMS channel. This property is retained only for backward compatibility.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>Specifies whether the SMS channel is archived.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isArchived;

/**
 <p>The user who last modified the SMS channel.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lastModifiedBy;

/**
 <p>The date and time, in ISO 8601 format, when the SMS channel was last modified.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lastModifiedDate;

/**
 <p>The type of messaging or notification platform for the channel. For the SMS channel, this value is SMS.</p>
 */
@property (nonatomic, strong) NSString * _Nullable platform;

/**
 <p>The maximum number of promotional messages that you can send through the SMS channel each second.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable promotionalMessagesPerSecond;

/**
 <p>The identity that displays on recipients' devices when they receive messages from the SMS channel.</p>
 */
@property (nonatomic, strong) NSString * _Nullable senderId;

/**
 <p>The registered short code to use when you send messages through the SMS channel.</p>
 */
@property (nonatomic, strong) NSString * _Nullable shortCode;

/**
 <p>The maximum number of transactional messages that you can send through the SMS channel each second.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable transactionalMessagesPerSecond;

/**
 <p>The current version of the SMS channel.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable version;

@end

/**
 <p>Specifies the default settings for a one-time SMS message that's sent directly to an endpoint.</p>
 */
@interface AWSPinpointTargetingSMSMessage : AWSModel


/**
 <p>The body of the SMS message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable body;

/**
 <p>The SMS program name that you provided to AWS Support when you requested your dedicated number.</p>
 */
@property (nonatomic, strong) NSString * _Nullable keyword;

/**
 <p>The URL of an image or video to display in the SMS message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable mediaUrl;

/**
 <p>The SMS message type. Valid values are: TRANSACTIONAL, the message is critical or time-sensitive, such as a one-time password that supports a customer transaction; and, PROMOTIONAL, the message is not critical or time-sensitive, such as a marketing message.</p>
 */
@property (nonatomic, assign) AWSPinpointTargetingMessageType messageType;

/**
 <p>The number to send the SMS message from. This value should be one of the dedicated long or short codes that's assigned to your AWS account. If you don't specify a long or short code, Amazon Pinpoint assigns a random long code to the SMS message and sends the message from that code.</p>
 */
@property (nonatomic, strong) NSString * _Nullable originationNumber;

/**
 <p>The sender ID to display as the sender of the message on a recipient's device. Support for sender IDs varies by country or region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable senderId;

/**
 <p>The message variables to use in the SMS message. You can override the default variables with individual address variables.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSArray<NSString *> *> * _Nullable substitutions;

@end

/**
 <p>Specifies the content and settings for a message template that can be used in text messages that are sent through the SMS channel.</p>
 */
@interface AWSPinpointTargetingSMSTemplateRequest : AWSModel


/**
 <p>The message body to use in text messages that are based on the message template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable body;

/**
 <p>A JSON object that specifies the default values to use for message variables in the message template. This object is a set of key-value pairs. Each key defines a message variable in the template. The corresponding value defines the default value for that variable. When you create a message that's based on the template, you can override these defaults with message-specific and address-specific variables and values.</p>
 */
@property (nonatomic, strong) NSString * _Nullable defaultSubstitutions;

/**
 <p>The unique identifier for the recommender model to use for the message template. Amazon Pinpoint uses this value to determine how to retrieve and process data from a recommender model when it sends messages that use the template, if the template contains message variables for recommendation data.</p>
 */
@property (nonatomic, strong) NSString * _Nullable recommenderId;

/**
 <p>A custom description of the message template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateDescription;

/**
 <p>A string-to-string map of key-value pairs that defines the tags to associate with the message template. Each tag consists of a required tag key and an associated tag value.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 <p>Provides information about the content and settings for a message template that can be used in text messages that are sent through the SMS channel.</p>
 Required parameters: [LastModifiedDate, CreationDate, TemplateName, TemplateType]
 */
@interface AWSPinpointTargetingSMSTemplateResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the message template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The message body that's used in text messages that are based on the message template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable body;

/**
 <p>The date, in ISO 8601 format, when the message template was created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable creationDate;

/**
 <p>The JSON object that specifies the default values that are used for message variables in the message template. This object is a set of key-value pairs. Each key defines a message variable in the template. The corresponding value defines the default value for that variable.</p>
 */
@property (nonatomic, strong) NSString * _Nullable defaultSubstitutions;

/**
 <p>The date, in ISO 8601 format, when the message template was last modified.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lastModifiedDate;

/**
 <p>The unique identifier for the recommender model that's used by the message template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable recommenderId;

/**
 <p>The custom description of the message template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateDescription;

/**
 <p>The name of the message template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateName;

/**
 <p>The type of channel that the message template is designed for. For an SMS template, this value is SMS.</p>
 */
@property (nonatomic, assign) AWSPinpointTargetingTemplateType templateType;

/**
 <p>The unique identifier, as an integer, for the active version of the message template, or the version of the template that you specified by using the version parameter in your request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable version;

/**
 <p>A string-to-string map of key-value pairs that identifies the tags that are associated with the message template. Each tag consists of a required tag key and an associated tag value.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 <p>Specifies the schedule settings for a campaign.</p>
 Required parameters: [StartTime]
 */
@interface AWSPinpointTargetingSchedule : AWSModel


/**
 <p>The scheduled time, in ISO 8601 format, when the campaign ended or will end.</p>
 */
@property (nonatomic, strong) NSString * _Nullable endTime;

/**
 <p>The type of event that causes the campaign to be sent, if the value of the Frequency property is EVENT.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingCampaignEventFilter * _Nullable eventFilter;

/**
 <p>Specifies how often the campaign is sent or whether the campaign is sent in response to a specific event.</p>
 */
@property (nonatomic, assign) AWSPinpointTargetingFrequency frequency;

/**
 <p>Specifies whether the start and end times for the campaign schedule use each recipient's local time. To base the schedule on each recipient's local time, set this value to true.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isLocalTime;

/**
 <p>The default quiet time for the campaign. Quiet time is a specific time range when a campaign doesn't send messages to endpoints, if all the following conditions are met:</p><ul><li><p>The EndpointDemographic.Timezone property of the endpoint is set to a valid value.</p></li><li><p>The current time in the endpoint's time zone is later than or equal to the time specified by the QuietTime.Start property for the campaign.</p></li><li><p>The current time in the endpoint's time zone is earlier than or equal to the time specified by the QuietTime.End property for the campaign.</p></li></ul><p>If any of the preceding conditions isn't met, the endpoint will receive messages from the campaign, even if quiet time is enabled.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingQuietTime * _Nullable quietTime;

/**
 <p>The scheduled time when the campaign began or will begin. Valid values are: IMMEDIATE, to start the campaign immediately; or, a specific time in ISO 8601 format.</p>
 */
@property (nonatomic, strong) NSString * _Nullable startTime;

/**
 <p>The starting UTC offset for the campaign schedule, if the value of the IsLocalTime property is true. Valid values are: UTC, UTC+01, UTC+02, UTC+03, UTC+03:30, UTC+04, UTC+04:30, UTC+05, UTC+05:30, UTC+05:45, UTC+06, UTC+06:30, UTC+07, UTC+08, UTC+09, UTC+09:30, UTC+10, UTC+10:30, UTC+11, UTC+12, UTC+13, UTC-02, UTC-03, UTC-04, UTC-05, UTC-06, UTC-07, UTC-08, UTC-09, UTC-10, and UTC-11.</p>
 */
@property (nonatomic, strong) NSString * _Nullable timezone;

@end

/**
 <p>Specifies dimension settings for including or excluding endpoints from a segment based on how recently an endpoint was active.</p>
 */
@interface AWSPinpointTargetingSegmentBehaviors : AWSModel


/**
 <p>The dimension settings that are based on how recently an endpoint was active.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingRecencyDimension * _Nullable recency;

@end

/**
 <p>Specifies a segment to associate with an activity in a journey.</p>
 Required parameters: [SegmentId]
 */
@interface AWSPinpointTargetingSegmentCondition : AWSModel


/**
 <p>The unique identifier for the segment to associate with the activity.</p>
 */
@property (nonatomic, strong) NSString * _Nullable segmentId;

@end

/**
 <p>Specifies demographic-based dimension settings for including or excluding endpoints from a segment. These settings derive from characteristics of endpoint devices, such as platform, make, and model.</p>
 */
@interface AWSPinpointTargetingSegmentDemographics : AWSModel


/**
 <p>The app version criteria for the segment.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingSetDimension * _Nullable appVersion;

/**
 <p>The channel criteria for the segment.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingSetDimension * _Nullable channel;

/**
 <p>The device type criteria for the segment.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingSetDimension * _Nullable deviceType;

/**
 <p>The device make criteria for the segment.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingSetDimension * _Nullable make;

/**
 <p>The device model criteria for the segment.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingSetDimension * _Nullable model;

/**
 <p>The device platform criteria for the segment.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingSetDimension * _Nullable platform;

@end

/**
 <p>Specifies the dimension settings for a segment.</p>
 */
@interface AWSPinpointTargetingSegmentDimensions : AWSModel


/**
 <p>One or more custom attributes to use as criteria for the segment.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSPinpointTargetingAttributeDimension *> * _Nullable attributes;

/**
 <p>The behavior-based criteria, such as how recently users have used your app, for the segment.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingSegmentBehaviors * _Nullable behavior;

/**
 <p>The demographic-based criteria, such as device platform, for the segment.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingSegmentDemographics * _Nullable demographic;

/**
 <p>The location-based criteria, such as region or GPS coordinates, for the segment.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingSegmentLocation * _Nullable location;

/**
 <p>One or more custom metrics to use as criteria for the segment.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSPinpointTargetingMetricDimension *> * _Nullable metrics;

/**
 <p>One or more custom user attributes to use as criteria for the segment.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSPinpointTargetingAttributeDimension *> * _Nullable userAttributes;

@end

/**
 <p>Specifies the base segments and dimensions for a segment, and the relationships between these base segments and dimensions.</p>
 */
@interface AWSPinpointTargetingSegmentGroup : AWSModel


/**
 <p>An array that defines the dimensions for the segment.</p>
 */
@property (nonatomic, strong) NSArray<AWSPinpointTargetingSegmentDimensions *> * _Nullable dimensions;

/**
 <p>The base segment to build the segment on. A base segment, also referred to as a <i>source segment</i>, defines the initial population of endpoints for a segment. When you add dimensions to a segment, Amazon Pinpoint filters the base segment by using the dimensions that you specify.</p><p>You can specify more than one dimensional segment or only one imported segment. If you specify an imported segment, the Amazon Pinpoint console displays a segment size estimate that indicates the size of the imported segment without any filters applied to it.</p>
 */
@property (nonatomic, strong) NSArray<AWSPinpointTargetingSegmentReference *> * _Nullable sourceSegments;

/**
 <p>Specifies how to handle multiple base segments for the segment. For example, if you specify three base segments for the segment, whether the resulting segment is based on all, any, or none of the base segments.</p>
 */
@property (nonatomic, assign) AWSPinpointTargetingSourceType sourceType;

/**
 <p>Specifies how to handle multiple dimensions for the segment. For example, if you specify three dimensions for the segment, whether the resulting segment includes endpoints that match all, any, or none of the dimensions.</p>
 */
@property (nonatomic, assign) AWSPinpointTargetingTypes types;

@end

/**
 <p>Specifies the settings that define the relationships between segment groups for a segment.</p>
 */
@interface AWSPinpointTargetingSegmentGroupList : AWSModel


/**
 <p>An array that defines the set of segment criteria to evaluate when handling segment groups for the segment.</p>
 */
@property (nonatomic, strong) NSArray<AWSPinpointTargetingSegmentGroup *> * _Nullable groups;

/**
 <p>Specifies how to handle multiple segment groups for the segment. For example, if the segment includes three segment groups, whether the resulting segment includes endpoints that match all, any, or none of the segment groups.</p>
 */
@property (nonatomic, assign) AWSPinpointTargetingInclude include;

@end

/**
 <p>Provides information about the import job that created a segment. An import job is a job that creates a user segment by importing endpoint definitions.</p>
 Required parameters: [Format, S3Url, Size, ExternalId, RoleArn]
 */
@interface AWSPinpointTargetingSegmentImportResource : AWSModel


/**
 <p>The number of channel types in the endpoint definitions that were imported to create the segment.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSNumber *> * _Nullable channelCounts;

/**
 <p>(Deprecated) Your AWS account ID, which you assigned to an external ID key in an IAM trust policy. Amazon Pinpoint previously used this value to assume an IAM role when importing endpoint definitions, but we removed this requirement. We don't recommend use of external IDs for IAM roles that are assumed by Amazon Pinpoint.</p>
 */
@property (nonatomic, strong) NSString * _Nullable externalId;

/**
 <p>The format of the files that were imported to create the segment. Valid values are: CSV, for comma-separated values format; and, JSON, for newline-delimited JSON format.</p>
 */
@property (nonatomic, assign) AWSPinpointTargetingFormat format;

/**
 <p>The Amazon Resource Name (ARN) of the AWS Identity and Access Management (IAM) role that authorized Amazon Pinpoint to access the Amazon S3 location to import endpoint definitions from.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 <p>The URL of the Amazon Simple Storage Service (Amazon S3) bucket that the endpoint definitions were imported from to create the segment.</p>
 */
@property (nonatomic, strong) NSString * _Nullable s3Url;

/**
 <p>The number of endpoint definitions that were imported successfully to create the segment.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable size;

@end

/**
 <p>Specifies geographical dimension settings for a segment.</p>
 */
@interface AWSPinpointTargetingSegmentLocation : AWSModel


/**
 <p>The country or region code, in ISO 3166-1 alpha-2 format, for the segment.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingSetDimension * _Nullable country;

/**
 <p>The GPS location and range for the segment.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingGPSPointDimension * _Nullable GPSPoint;

@end

/**
 <p>Specifies the segment identifier and version of a segment.</p>
 Required parameters: [Id]
 */
@interface AWSPinpointTargetingSegmentReference : AWSModel


/**
 <p>The unique identifier for the segment.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The version number of the segment.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable version;

@end

/**
 <p>Provides information about the configuration, dimension, and other settings for a segment.</p>
 Required parameters: [SegmentType, CreationDate, Id, Arn, ApplicationId]
 */
@interface AWSPinpointTargetingSegmentResponse : AWSModel


/**
 <p>The unique identifier for the application that the segment is associated with.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 <p>The Amazon Resource Name (ARN) of the segment.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The date and time when the segment was created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable creationDate;

/**
 <p>The dimension settings for the segment.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingSegmentDimensions * _Nullable dimensions;

/**
 <p>The unique identifier for the segment.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The settings for the import job that's associated with the segment.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingSegmentImportResource * _Nullable importDefinition;

/**
 <p>The date and time when the segment was last modified.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lastModifiedDate;

/**
 <p>The name of the segment.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>A list of one or more segment groups that apply to the segment. Each segment group consists of zero or more base segments and the dimensions that are applied to those base segments.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingSegmentGroupList * _Nullable segmentGroups;

/**
 <p>The segment type. Valid values are:</p><ul><li><p>DIMENSIONAL - A dynamic segment, which is a segment that uses selection criteria that you specify and is based on endpoint data that's reported by your app. Dynamic segments can change over time.</p></li><li><p>IMPORT - A static segment, which is a segment that uses selection criteria that you specify and is based on endpoint definitions that you import from a file. Imported segments are static; they don't change over time.</p></li></ul>
 */
@property (nonatomic, assign) AWSPinpointTargetingSegmentType segmentType;

/**
 <p>The version number of the segment.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable version;

/**
 <p>A string-to-string map of key-value pairs that identifies the tags that are associated with the segment. Each tag consists of a required tag key and an associated tag value.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 <p>Provides information about all the segments that are associated with an application.</p>
 Required parameters: [Item]
 */
@interface AWSPinpointTargetingSegmentsResponse : AWSModel


/**
 <p>An array of responses, one for each segment that's associated with the application (Segments resource) or each version of a segment that's associated with the application (Segment Versions resource).</p>
 */
@property (nonatomic, strong) NSArray<AWSPinpointTargetingSegmentResponse *> * _Nullable item;

/**
 <p>The string to use in a subsequent request to get the next page of results in a paginated response. This value is null if there are no additional pages.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSPinpointTargetingSendMessagesRequest : AWSRequest


/**
 <p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 <p>Specifies the configuration and other settings for a message.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingMessageRequest * _Nullable messageRequest;

@end

/**
 
 */
@interface AWSPinpointTargetingSendMessagesResponse : AWSModel


/**
 <p>Provides information about the results of a request to send a message to an endpoint address.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingMessageResponse * _Nullable messageResponse;

@end

/**
 <p>Specifies the configuration and other settings for a message to send to all the endpoints that are associated with a list of users.</p>
 Required parameters: [MessageConfiguration, Users]
 */
@interface AWSPinpointTargetingSendUsersMessageRequest : AWSModel


/**
 <p>A map of custom attribute-value pairs. For a push notification, Amazon Pinpoint adds these attributes to the data.pinpoint object in the body of the notification payload. Amazon Pinpoint also provides these attributes in the events that it generates for users-messages deliveries.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable context;

/**
 <p>The settings and content for the default message and any default messages that you defined for specific channels.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingDirectMessageConfiguration * _Nullable messageConfiguration;

/**
 <p>The message template to use for the message.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingTemplateConfiguration * _Nullable templateConfiguration;

/**
 <p>The unique identifier for tracing the message. This identifier is visible to message recipients.</p>
 */
@property (nonatomic, strong) NSString * _Nullable traceId;

/**
 <p>A map that associates user IDs with EndpointSendConfiguration objects. You can use an EndpointSendConfiguration object to tailor the message for a user by specifying settings such as content overrides and message variables.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSPinpointTargetingEndpointSendConfiguration *> * _Nullable users;

@end

/**
 <p>Provides information about which users and endpoints a message was sent to.</p>
 Required parameters: [ApplicationId]
 */
@interface AWSPinpointTargetingSendUsersMessageResponse : AWSModel


/**
 <p>The unique identifier for the application that was used to send the message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 <p>The unique identifier that was assigned to the message request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

/**
 <p>An object that indicates which endpoints the message was sent to, for each user. The object lists user IDs and, for each user ID, provides the endpoint IDs that the message was sent to. For each endpoint ID, it provides an EndpointMessageResult object.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSDictionary<NSString *, AWSPinpointTargetingEndpointMessageResult *> *> * _Nullable result;

@end

/**
 
 */
@interface AWSPinpointTargetingSendUsersMessagesRequest : AWSRequest


/**
 <p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 <p>Specifies the configuration and other settings for a message to send to all the endpoints that are associated with a list of users.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingSendUsersMessageRequest * _Nullable sendUsersMessageRequest;

@end

/**
 
 */
@interface AWSPinpointTargetingSendUsersMessagesResponse : AWSModel


/**
 <p>Provides information about which users and endpoints a message was sent to.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingSendUsersMessageResponse * _Nullable sendUsersMessageResponse;

@end

/**
 <p>Provides information about a session.</p>
 Required parameters: [StartTimestamp, Id]
 */
@interface AWSPinpointTargetingSession : AWSModel


/**
 <p>The duration of the session, in milliseconds.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable duration;

/**
 <p>The unique identifier for the session.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The date and time when the session began.</p>
 */
@property (nonatomic, strong) NSString * _Nullable startTimestamp;

/**
 <p>The date and time when the session ended.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stopTimestamp;

@end

/**
 <p>Specifies the dimension type and values for a segment dimension.</p>
 Required parameters: [Values]
 */
@interface AWSPinpointTargetingSetDimension : AWSModel


/**
 <p>The type of segment dimension to use. Valid values are: INCLUSIVE, endpoints that match the criteria are included in the segment; and, EXCLUSIVE, endpoints that match the criteria are excluded from the segment.</p>
 */
@property (nonatomic, assign) AWSPinpointTargetingDimensionType dimensionType;

/**
 <p>The criteria values to use for the segment dimension. Depending on the value of the DimensionType property, endpoints are included or excluded from the segment if their values match the criteria values.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable values;

@end

/**
 <p>Specifies a condition to evaluate for an activity in a journey.</p>
 */
@interface AWSPinpointTargetingSimpleCondition : AWSModel


/**
 <p>The dimension settings for the event that's associated with the activity.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingEventCondition * _Nullable eventCondition;

/**
 <p>The segment that's associated with the activity.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingSegmentCondition * _Nullable segmentCondition;

/**
 <p>The dimension settings for the segment that's associated with the activity.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingSegmentDimensions * _Nullable segmentDimensions;

@end

/**
 <p>Specifies the contents of an email message, composed of a subject, a text part, and an HTML part.</p>
 */
@interface AWSPinpointTargetingSimpleEmail : AWSModel


/**
 <p>The body of the email message, in HTML format. We recommend using HTML format for email clients that render HTML content. You can include links, formatted text, and more in an HTML message.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingSimpleEmailPart * _Nullable htmlPart;

/**
 <p>The subject line, or title, of the email.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingSimpleEmailPart * _Nullable subject;

/**
 <p>The body of the email message, in plain text format. We recommend using plain text format for email clients that don't render HTML content and clients that are connected to high-latency networks, such as mobile devices.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingSimpleEmailPart * _Nullable textPart;

@end

/**
 <p>Specifies the subject or body of an email message, represented as textual email data and the applicable character set.</p>
 */
@interface AWSPinpointTargetingSimpleEmailPart : AWSModel


/**
 <p>The applicable character set for the message content.</p>
 */
@property (nonatomic, strong) NSString * _Nullable charset;

/**
 <p>The textual data of the message content.</p>
 */
@property (nonatomic, strong) NSString * _Nullable data;

@end

/**
 <p>Specifies the conditions for the first activity in a journey. This activity and its conditions determine which users are participants in a journey.</p>
 */
@interface AWSPinpointTargetingStartCondition : AWSModel


/**
 <p>The custom description of the condition.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The segment that's associated with the first activity in the journey. This segment determines which users are participants in the journey.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingSegmentCondition * _Nullable segmentStartCondition;

@end

/**
 
 */
@interface AWSPinpointTargetingTagResourceRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

/**
 <p>Specifies the tags (keys and values) for an application, campaign, message template, or segment.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingTagsModel * _Nullable tagsModel;

@end

/**
 <p>Specifies the tags (keys and values) for an application, campaign, message template, or segment.</p>
 Required parameters: [tags]
 */
@interface AWSPinpointTargetingTagsModel : AWSModel


/**
 <p>A string-to-string map of key-value pairs that defines the tags for an application, campaign, message template, or segment. Each of these resources can have a maximum of 50 tags.</p><p>Each tag consists of a required tag key and an associated tag value. The maximum length of a tag key is 128 characters. The maximum length of a tag value is 256 characters.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 <p>Specifies the name and version of the message template to use for the message.</p>
 */
@interface AWSPinpointTargetingTemplate : AWSModel


/**
 <p>The name of the message template to use for the message. If specified, this value must match the name of an existing message template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The unique identifier for the version of the message template to use for the message. If specified, this value must match the identifier for an existing template version. To retrieve a list of versions and version identifiers for a template, use the <linklinkend="templates-template-name-template-type-versions">Template Versions</link> resource.</p><p>If you don't specify a value for this property, Amazon Pinpoint uses the <i>active version</i> of the template. The <i>active version</i> is typically the version of a template that's been most recently reviewed and approved for use, depending on your workflow. It isn't necessarily the latest version of a template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable version;

@end

/**
 <p>Specifies which version of a message template to use as the active version of the template.</p>
 */
@interface AWSPinpointTargetingTemplateActiveVersionRequest : AWSModel


/**
 <p>The version of the message template to use as the active version of the template. Valid values are: latest, for the most recent version of the template; or, the unique identifier for any existing version of the template. If you specify an identifier, the value must match the identifier for an existing template version. To retrieve a list of versions and version identifiers for a template, use the <linklinkend="templates-template-name-template-type-versions">Template Versions</link> resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable version;

@end

/**
 <p>Specifies the message template to use for the message, for each type of channel.</p>
 */
@interface AWSPinpointTargetingTemplateConfiguration : AWSModel


/**
 <p>The email template to use for the message.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingTemplate * _Nullable emailTemplate;

/**
 <p>The push notification template to use for the message.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingTemplate * _Nullable pushTemplate;

/**
 <p>The SMS template to use for the message.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingTemplate * _Nullable SMSTemplate;

/**
 <p>The voice template to use for the message. This object isn't supported for campaigns.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingTemplate * _Nullable voiceTemplate;

@end

/**
 <p>Provides information about a message template that's associated with your Amazon Pinpoint account.</p>
 Required parameters: [LastModifiedDate, CreationDate, TemplateName, TemplateType]
 */
@interface AWSPinpointTargetingTemplateResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the message template. This value isn't included in a TemplateResponse object. To retrieve the ARN of a template, use the GetEmailTemplate, GetPushTemplate, GetSmsTemplate, or GetVoiceTemplate operation, depending on the type of template that you want to retrieve the ARN for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The date, in ISO 8601 format, when the message template was created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable creationDate;

/**
 <p>The JSON object that specifies the default values that are used for message variables in the message template. This object isn't included in a TemplateResponse object. To retrieve this object for a template, use the GetEmailTemplate, GetPushTemplate, GetSmsTemplate, or GetVoiceTemplate operation, depending on the type of template that you want to retrieve the object for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable defaultSubstitutions;

/**
 <p>The date, in ISO 8601 format, when the message template was last modified.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lastModifiedDate;

/**
 <p>The custom description of the message template. This value isn't included in a TemplateResponse object. To retrieve the description of a template, use the GetEmailTemplate, GetPushTemplate, GetSmsTemplate, or GetVoiceTemplate operation, depending on the type of template that you want to retrieve the description for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateDescription;

/**
 <p>The name of the message template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateName;

/**
 <p>The type of channel that the message template is designed for. Possible values are: EMAIL, PUSH, SMS, and VOICE.</p>
 */
@property (nonatomic, assign) AWSPinpointTargetingTemplateType templateType;

/**
 <p>The unique identifier, as an integer, for the active version of the message template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable version;

/**
 <p>A map of key-value pairs that identifies the tags that are associated with the message template. This object isn't included in a TemplateResponse object. To retrieve this object for a template, use the GetEmailTemplate, GetPushTemplate, GetSmsTemplate, or GetVoiceTemplate operation, depending on the type of template that you want to retrieve the object for.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 <p>Provides information about a specific version of a message template.</p>
 Required parameters: [LastModifiedDate, CreationDate, TemplateName, TemplateType]
 */
@interface AWSPinpointTargetingTemplateVersionResponse : AWSModel


/**
 <p>The date, in ISO 8601 format, when the version of the message template was created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable creationDate;

/**
 <p>A JSON object that specifies the default values that are used for message variables in the version of the message template. This object is a set of key-value pairs. Each key defines a message variable in the template. The corresponding value defines the default value for that variable.</p>
 */
@property (nonatomic, strong) NSString * _Nullable defaultSubstitutions;

/**
 <p>The date, in ISO 8601 format, when the version of the message template was last modified.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lastModifiedDate;

/**
 <p>The custom description of the version of the message template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateDescription;

/**
 <p>The name of the message template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateName;

/**
 <p>The type of channel that the message template is designed for. Possible values are: EMAIL, PUSH, SMS, and VOICE.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateType;

/**
 <p>The unique identifier for the version of the message template. This value is an integer that Amazon Pinpoint automatically increments and assigns to each new version of a template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable version;

@end

/**
 <p>Provides information about all the versions of a specific message template.</p>
 Required parameters: [Item]
 */
@interface AWSPinpointTargetingTemplateVersionsResponse : AWSModel


/**
 <p>An array of responses, one for each version of the message template.</p>
 */
@property (nonatomic, strong) NSArray<AWSPinpointTargetingTemplateVersionResponse *> * _Nullable item;

/**
 <p>The message that's returned from the API for the request to retrieve information about all the versions of the message template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

/**
 <p>The string to use in a subsequent request to get the next page of results in a paginated response. This value is null if there are no additional pages.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The unique identifier for the request to retrieve information about all the versions of the message template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable requestID;

@end

/**
 <p>Provides information about all the message templates that are associated with your Amazon Pinpoint account.</p>
 Required parameters: [Item]
 */
@interface AWSPinpointTargetingTemplatesResponse : AWSModel


/**
 <p>An array of responses, one for each message template that's associated with your Amazon Pinpoint account and meets any filter criteria that you specified in the request.</p>
 */
@property (nonatomic, strong) NSArray<AWSPinpointTargetingTemplateResponse *> * _Nullable item;

/**
 <p>The string to use in a subsequent request to get the next page of results in a paginated response. This value is null if there are no additional pages.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>Specifies the settings for a campaign treatment. A treatment is a variation of a campaign that's used for A/B testing of a campaign.</p>
 Required parameters: [Id, SizePercent]
 */
@interface AWSPinpointTargetingTreatmentResource : AWSModel


/**
 <p>The unique identifier for the treatment.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The message configuration settings for the treatment.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingMessageConfiguration * _Nullable messageConfiguration;

/**
 <p>The schedule settings for the treatment.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingSchedule * _Nullable schedule;

/**
 <p>The allocated percentage of users (segment members) that the treatment is sent to.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable sizePercent;

/**
 <p>The current status of the treatment.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingCampaignState * _Nullable state;

/**
 <p>The message template to use for the treatment.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingTemplateConfiguration * _Nullable templateConfiguration;

/**
 <p>The custom description of the treatment.</p>
 */
@property (nonatomic, strong) NSString * _Nullable treatmentDescription;

/**
 <p>The custom name of the treatment. A treatment is a variation of a campaign that's used for A/B testing of a campaign.</p>
 */
@property (nonatomic, strong) NSString * _Nullable treatmentName;

@end

/**
 
 */
@interface AWSPinpointTargetingUntagResourceRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

/**
 <p>The key of the tag to remove from the resource. To remove multiple tags, append the tagKeys parameter and argument for each additional tag to remove, separated by an ampersand (&amp;).</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable tagKeys;

@end

/**
 
 */
@interface AWSPinpointTargetingUpdateAdmChannelRequest : AWSRequest


/**
 <p>Specifies the status and settings of the ADM (Amazon Device Messaging) channel for an application.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingADMChannelRequest * _Nullable ADMChannelRequest;

/**
 <p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

@end

/**
 
 */
@interface AWSPinpointTargetingUpdateAdmChannelResponse : AWSModel


/**
 <p>Provides information about the status and settings of the ADM (Amazon Device Messaging) channel for an application.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingADMChannelResponse * _Nullable ADMChannelResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingUpdateApnsChannelRequest : AWSRequest


/**
 <p>Specifies the status and settings of the APNs (Apple Push Notification service) channel for an application.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingAPNSChannelRequest * _Nullable APNSChannelRequest;

/**
 <p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

@end

/**
 
 */
@interface AWSPinpointTargetingUpdateApnsChannelResponse : AWSModel


/**
 <p>Provides information about the status and settings of the APNs (Apple Push Notification service) channel for an application.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingAPNSChannelResponse * _Nullable APNSChannelResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingUpdateApnsSandboxChannelRequest : AWSRequest


/**
 <p>Specifies the status and settings of the APNs (Apple Push Notification service) sandbox channel for an application.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingAPNSSandboxChannelRequest * _Nullable APNSSandboxChannelRequest;

/**
 <p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

@end

/**
 
 */
@interface AWSPinpointTargetingUpdateApnsSandboxChannelResponse : AWSModel


/**
 <p>Provides information about the status and settings of the APNs (Apple Push Notification service) sandbox channel for an application.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingAPNSSandboxChannelResponse * _Nullable APNSSandboxChannelResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingUpdateApnsVoipChannelRequest : AWSRequest


/**
 <p>Specifies the status and settings of the APNs (Apple Push Notification service) VoIP channel for an application.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingAPNSVoipChannelRequest * _Nullable APNSVoipChannelRequest;

/**
 <p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

@end

/**
 
 */
@interface AWSPinpointTargetingUpdateApnsVoipChannelResponse : AWSModel


/**
 <p>Provides information about the status and settings of the APNs (Apple Push Notification service) VoIP channel for an application.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingAPNSVoipChannelResponse * _Nullable APNSVoipChannelResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingUpdateApnsVoipSandboxChannelRequest : AWSRequest


/**
 <p>Specifies the status and settings of the APNs (Apple Push Notification service) VoIP sandbox channel for an application.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingAPNSVoipSandboxChannelRequest * _Nullable APNSVoipSandboxChannelRequest;

/**
 <p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

@end

/**
 
 */
@interface AWSPinpointTargetingUpdateApnsVoipSandboxChannelResponse : AWSModel


/**
 <p>Provides information about the status and settings of the APNs (Apple Push Notification service) VoIP sandbox channel for an application.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingAPNSVoipSandboxChannelResponse * _Nullable APNSVoipSandboxChannelResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingUpdateApplicationSettingsRequest : AWSRequest


/**
 <p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 <p>Specifies the default settings for an application.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingWriteApplicationSettingsRequest * _Nullable writeApplicationSettingsRequest;

@end

/**
 
 */
@interface AWSPinpointTargetingUpdateApplicationSettingsResponse : AWSModel


/**
 <p>Provides information about an application, including the default settings for an application.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingApplicationSettingsResource * _Nullable applicationSettingsResource;

@end

/**
 <p>Specifies one or more attributes to remove from all the endpoints that are associated with an application.</p>
 */
@interface AWSPinpointTargetingUpdateAttributesRequest : AWSModel


/**
 <p>An array of the attributes to remove from all the endpoints that are associated with the application. The array can specify the complete, exact name of each attribute to remove or it can specify a glob pattern that an attribute name must match in order for the attribute to be removed.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable blacklist;

@end

/**
 
 */
@interface AWSPinpointTargetingUpdateBaiduChannelRequest : AWSRequest


/**
 <p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 <p>Specifies the status and settings of the Baidu (Baidu Cloud Push) channel for an application.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingBaiduChannelRequest * _Nullable baiduChannelRequest;

@end

/**
 
 */
@interface AWSPinpointTargetingUpdateBaiduChannelResponse : AWSModel


/**
 <p>Provides information about the status and settings of the Baidu (Baidu Cloud Push) channel for an application.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingBaiduChannelResponse * _Nullable baiduChannelResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingUpdateCampaignRequest : AWSRequest


/**
 <p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 <p>The unique identifier for the campaign.</p>
 */
@property (nonatomic, strong) NSString * _Nullable campaignId;

/**
 <p>Specifies the configuration and other settings for a campaign.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingWriteCampaignRequest * _Nullable writeCampaignRequest;

@end

/**
 
 */
@interface AWSPinpointTargetingUpdateCampaignResponse : AWSModel


/**
 <p>Provides information about the status, configuration, and other settings for a campaign.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingCampaignResponse * _Nullable campaignResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingUpdateEmailChannelRequest : AWSRequest


/**
 <p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 <p>Specifies the status and settings of the email channel for an application.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingEmailChannelRequest * _Nullable emailChannelRequest;

@end

/**
 
 */
@interface AWSPinpointTargetingUpdateEmailChannelResponse : AWSModel


/**
 <p>Provides information about the status and settings of the email channel for an application.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingEmailChannelResponse * _Nullable emailChannelResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingUpdateEmailTemplateRequest : AWSRequest


/**
 <p>Specifies whether to save the updates as a new version of the message template. Valid values are: true, save the updates as a new version; and, false, save the updates to (overwrite) the latest existing version of the template.</p><p>If you don't specify a value for this parameter, Amazon Pinpoint saves the updates to (overwrites) the latest existing version of the template. If you specify a value of true for this parameter, don't specify a value for the version parameter. Otherwise, an error will occur.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable createNewVersion;

/**
 <p>Specifies the content and settings for a message template that can be used in messages that are sent through the email channel.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingEmailTemplateRequest * _Nullable emailTemplateRequest;

/**
 <p>The name of the message template. A template name must start with an alphanumeric character and can contain a maximum of 128 characters. The characters can be alphanumeric characters, underscores (_), or hyphens (-). Template names are case sensitive.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateName;

/**
 <p>The unique identifier for the version of the message template to update, retrieve information about, or delete. To retrieve identifiers and other information for all the versions of a template, use the <linklinkend="templates-template-name-template-type-versions">Template Versions</link> resource.</p><p>If specified, this value must match the identifier for an existing template version. If specified for an update operation, this value must match the identifier for the latest existing version of the template. This restriction helps ensure that race conditions don't occur.</p><p>If you don't specify a value for this parameter, Amazon Pinpoint does the following:</p><ul><li><p>For a get operation, retrieves information about the active version of the template.</p></li><li><p>For an update operation, saves the updates to (overwrites) the latest existing version of the template, if the create-new-version parameter isn't used or is set to false.</p></li><li><p>For a delete operation, deletes the template, including all versions of the template.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable version;

@end

/**
 
 */
@interface AWSPinpointTargetingUpdateEmailTemplateResponse : AWSModel


/**
 <p>Provides information about an API request or response.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingMessageBody * _Nullable messageBody;

@end

/**
 
 */
@interface AWSPinpointTargetingUpdateEndpointRequest : AWSRequest


/**
 <p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 <p>The unique identifier for the endpoint.</p>
 */
@property (nonatomic, strong) NSString * _Nullable endpointId;

/**
 <p>Specifies the channel type and other settings for an endpoint.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingEndpointRequest * _Nullable endpointRequest;

@end

/**
 
 */
@interface AWSPinpointTargetingUpdateEndpointResponse : AWSModel


/**
 <p>Provides information about an API request or response.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingMessageBody * _Nullable messageBody;

@end

/**
 
 */
@interface AWSPinpointTargetingUpdateEndpointsBatchRequest : AWSRequest


/**
 <p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 <p>Specifies a batch of endpoints to create or update and the settings and attributes to set or change for each endpoint.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingEndpointBatchRequest * _Nullable endpointBatchRequest;

@end

/**
 
 */
@interface AWSPinpointTargetingUpdateEndpointsBatchResponse : AWSModel


/**
 <p>Provides information about an API request or response.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingMessageBody * _Nullable messageBody;

@end

/**
 
 */
@interface AWSPinpointTargetingUpdateGcmChannelRequest : AWSRequest


/**
 <p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 <p>Specifies the status and settings of the GCM channel for an application. This channel enables Amazon Pinpoint to send push notifications through the Firebase Cloud Messaging (FCM), formerly Google Cloud Messaging (GCM), service.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingGCMChannelRequest * _Nullable GCMChannelRequest;

@end

/**
 
 */
@interface AWSPinpointTargetingUpdateGcmChannelResponse : AWSModel


/**
 <p>Provides information about the status and settings of the GCM channel for an application. The GCM channel enables Amazon Pinpoint to send push notifications through the Firebase Cloud Messaging (FCM), formerly Google Cloud Messaging (GCM), service.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingGCMChannelResponse * _Nullable GCMChannelResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingUpdateJourneyRequest : AWSRequest


/**
 <p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 <p>The unique identifier for the journey.</p>
 */
@property (nonatomic, strong) NSString * _Nullable journeyId;

/**
 <p>Specifies the configuration and other settings for a journey.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingWriteJourneyRequest * _Nullable writeJourneyRequest;

@end

/**
 
 */
@interface AWSPinpointTargetingUpdateJourneyResponse : AWSModel


/**
 <p>Provides information about the status, configuration, and other settings for a journey.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingJourneyResponse * _Nullable journeyResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingUpdateJourneyStateRequest : AWSRequest


/**
 <p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 <p>The unique identifier for the journey.</p>
 */
@property (nonatomic, strong) NSString * _Nullable journeyId;

/**
 <p>Changes the status of a journey.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingJourneyStateRequest * _Nullable journeyStateRequest;

@end

/**
 
 */
@interface AWSPinpointTargetingUpdateJourneyStateResponse : AWSModel


/**
 <p>Provides information about the status, configuration, and other settings for a journey.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingJourneyResponse * _Nullable journeyResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingUpdatePushTemplateRequest : AWSRequest


/**
 <p>Specifies whether to save the updates as a new version of the message template. Valid values are: true, save the updates as a new version; and, false, save the updates to (overwrite) the latest existing version of the template.</p><p>If you don't specify a value for this parameter, Amazon Pinpoint saves the updates to (overwrites) the latest existing version of the template. If you specify a value of true for this parameter, don't specify a value for the version parameter. Otherwise, an error will occur.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable createNewVersion;

/**
 <p>Specifies the content and settings for a message template that can be used in messages that are sent through a push notification channel.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingPushNotificationTemplateRequest * _Nullable pushNotificationTemplateRequest;

/**
 <p>The name of the message template. A template name must start with an alphanumeric character and can contain a maximum of 128 characters. The characters can be alphanumeric characters, underscores (_), or hyphens (-). Template names are case sensitive.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateName;

/**
 <p>The unique identifier for the version of the message template to update, retrieve information about, or delete. To retrieve identifiers and other information for all the versions of a template, use the <linklinkend="templates-template-name-template-type-versions">Template Versions</link> resource.</p><p>If specified, this value must match the identifier for an existing template version. If specified for an update operation, this value must match the identifier for the latest existing version of the template. This restriction helps ensure that race conditions don't occur.</p><p>If you don't specify a value for this parameter, Amazon Pinpoint does the following:</p><ul><li><p>For a get operation, retrieves information about the active version of the template.</p></li><li><p>For an update operation, saves the updates to (overwrites) the latest existing version of the template, if the create-new-version parameter isn't used or is set to false.</p></li><li><p>For a delete operation, deletes the template, including all versions of the template.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable version;

@end

/**
 
 */
@interface AWSPinpointTargetingUpdatePushTemplateResponse : AWSModel


/**
 <p>Provides information about an API request or response.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingMessageBody * _Nullable messageBody;

@end

/**
 <p>Specifies Amazon Pinpoint configuration settings for retrieving and processing recommendation data from a recommender model.</p>
 Required parameters: [RecommendationProviderUri, RecommendationProviderRoleArn]
 */
@interface AWSPinpointTargetingUpdateRecommenderConfiguration : AWSModel


/**
 <p>A map of key-value pairs that defines 1-10 custom endpoint or user attributes, depending on the value for the RecommenderUserIdType property. Each of these attributes temporarily stores a recommended item that's retrieved from the recommender model and sent to an AWS Lambda function for additional processing. Each attribute can be used as a message variable in a message template.</p><p>In the map, the key is the name of a custom attribute and the value is a custom display name for that attribute. The display name appears in the <b>Attribute finder</b> pane of the template editor on the Amazon Pinpoint console. The following restrictions apply to these names:</p><ul><li><p>An attribute name must start with a letter or number and it can contain up to 50 characters. The characters can be letters, numbers, underscores (_), or hyphens (-). Attribute names are case sensitive and must be unique.</p></li><li><p>An attribute display name must start with a letter or number and it can contain up to 25 characters. The characters can be letters, numbers, spaces, underscores (_), or hyphens (-).</p></li></ul><p>This object is required if the configuration invokes an AWS Lambda function (LambdaFunctionArn) to process recommendation data. Otherwise, don't include this object in your request.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable attributes;

/**
 <p>A custom description of the configuration for the recommender model. The description can contain up to 128 characters.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>A custom name of the configuration for the recommender model. The name must start with a letter or number and it can contain up to 128 characters. The characters can be letters, numbers, spaces, underscores (_), or hyphens (-).</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The type of Amazon Pinpoint ID to associate with unique user IDs in the recommender model. This value enables the model to use attribute and event data that’s specific to a particular endpoint or user in an Amazon Pinpoint application. Valid values are:</p><ul><li><p>PINPOINT_ENDPOINT_ID - Associate each user in the model with a particular endpoint in Amazon Pinpoint. The data is correlated based on endpoint IDs in Amazon Pinpoint. This is the default value.</p></li><li><p>PINPOINT_USER_ID - Associate each user in the model with a particular user and endpoint in Amazon Pinpoint. The data is correlated based on user IDs in Amazon Pinpoint. If you specify this value, an endpoint definition in Amazon Pinpoint has to specify a both a user ID (UserId) and an endpoint ID. Otherwise, messages won’t be sent to the user's endpoint.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable recommendationProviderIdType;

/**
 <p>The Amazon Resource Name (ARN) of the AWS Identity and Access Management (IAM) role that authorizes Amazon Pinpoint to retrieve recommendation data from the recommender model.</p>
 */
@property (nonatomic, strong) NSString * _Nullable recommendationProviderRoleArn;

/**
 <p>The Amazon Resource Name (ARN) of the recommender model to retrieve recommendation data from. This value must match the ARN of an Amazon Personalize campaign.</p>
 */
@property (nonatomic, strong) NSString * _Nullable recommendationProviderUri;

/**
 <p>The name or Amazon Resource Name (ARN) of the AWS Lambda function to invoke for additional processing of recommendation data that's retrieved from the recommender model.</p>
 */
@property (nonatomic, strong) NSString * _Nullable recommendationTransformerUri;

/**
 <p>A custom display name for the standard endpoint or user attribute (RecommendationItems) that temporarily stores a recommended item for each endpoint or user, depending on the value for the RecommenderUserIdType property. This value is required if the configuration doesn't invoke an AWS Lambda function (LambdaFunctionArn) to perform additional processing of recommendation data.</p><p>This name appears in the <b>Attribute finder</b> pane of the template editor on the Amazon Pinpoint console. The name can contain up to 25 characters. The characters can be letters, numbers, spaces, underscores (_), or hyphens (-). These restrictions don't apply to attribute values.</p>
 */
@property (nonatomic, strong) NSString * _Nullable recommendationsDisplayName;

/**
 <p>The number of recommended items to retrieve from the model for each endpoint or user, depending on the value for the RecommenderUserIdType property. This number determines how many recommended attributes are available for use as message variables in message templates. The minimum value is 1. The maximum value is 5. The default value is 5.</p><p>To use multiple recommended items and custom attributes with message variables, you have to use an AWS Lambda function (LambdaFunctionArn) to perform additional processing of recommendation data.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable recommendationsPerMessage;

@end

/**
 
 */
@interface AWSPinpointTargetingUpdateRecommenderConfigurationRequest : AWSRequest


/**
 <p>The unique identifier for the recommender model configuration. This identifier is displayed as the <b>Recommender ID</b> on the Amazon Pinpoint console.</p>
 */
@property (nonatomic, strong) NSString * _Nullable recommenderId;

/**
 <p>Specifies Amazon Pinpoint configuration settings for retrieving and processing recommendation data from a recommender model.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingUpdateRecommenderConfiguration * _Nullable updateRecommenderConfiguration;

@end

/**
 
 */
@interface AWSPinpointTargetingUpdateRecommenderConfigurationResponse : AWSModel


/**
 <p>Provides information about Amazon Pinpoint configuration settings for retrieving and processing data from a recommender model.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingRecommenderConfigurationResponse * _Nullable recommenderConfigurationResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingUpdateSegmentRequest : AWSRequest


/**
 <p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 <p>The unique identifier for the segment.</p>
 */
@property (nonatomic, strong) NSString * _Nullable segmentId;

/**
 <p>Specifies the configuration, dimension, and other settings for a segment. A WriteSegmentRequest object can include a Dimensions object or a SegmentGroups object, but not both.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingWriteSegmentRequest * _Nullable writeSegmentRequest;

@end

/**
 
 */
@interface AWSPinpointTargetingUpdateSegmentResponse : AWSModel


/**
 <p>Provides information about the configuration, dimension, and other settings for a segment.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingSegmentResponse * _Nullable segmentResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingUpdateSmsChannelRequest : AWSRequest


/**
 <p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 <p>Specifies the status and settings of the SMS channel for an application.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingSMSChannelRequest * _Nullable SMSChannelRequest;

@end

/**
 
 */
@interface AWSPinpointTargetingUpdateSmsChannelResponse : AWSModel


/**
 <p>Provides information about the status and settings of the SMS channel for an application.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingSMSChannelResponse * _Nullable SMSChannelResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingUpdateSmsTemplateRequest : AWSRequest


/**
 <p>Specifies whether to save the updates as a new version of the message template. Valid values are: true, save the updates as a new version; and, false, save the updates to (overwrite) the latest existing version of the template.</p><p>If you don't specify a value for this parameter, Amazon Pinpoint saves the updates to (overwrites) the latest existing version of the template. If you specify a value of true for this parameter, don't specify a value for the version parameter. Otherwise, an error will occur.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable createNewVersion;

/**
 <p>Specifies the content and settings for a message template that can be used in text messages that are sent through the SMS channel.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingSMSTemplateRequest * _Nullable SMSTemplateRequest;

/**
 <p>The name of the message template. A template name must start with an alphanumeric character and can contain a maximum of 128 characters. The characters can be alphanumeric characters, underscores (_), or hyphens (-). Template names are case sensitive.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateName;

/**
 <p>The unique identifier for the version of the message template to update, retrieve information about, or delete. To retrieve identifiers and other information for all the versions of a template, use the <linklinkend="templates-template-name-template-type-versions">Template Versions</link> resource.</p><p>If specified, this value must match the identifier for an existing template version. If specified for an update operation, this value must match the identifier for the latest existing version of the template. This restriction helps ensure that race conditions don't occur.</p><p>If you don't specify a value for this parameter, Amazon Pinpoint does the following:</p><ul><li><p>For a get operation, retrieves information about the active version of the template.</p></li><li><p>For an update operation, saves the updates to (overwrites) the latest existing version of the template, if the create-new-version parameter isn't used or is set to false.</p></li><li><p>For a delete operation, deletes the template, including all versions of the template.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable version;

@end

/**
 
 */
@interface AWSPinpointTargetingUpdateSmsTemplateResponse : AWSModel


/**
 <p>Provides information about an API request or response.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingMessageBody * _Nullable messageBody;

@end

/**
 
 */
@interface AWSPinpointTargetingUpdateTemplateActiveVersionRequest : AWSRequest


/**
 <p>Specifies which version of a message template to use as the active version of the template.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingTemplateActiveVersionRequest * _Nullable templateActiveVersionRequest;

/**
 <p>The name of the message template. A template name must start with an alphanumeric character and can contain a maximum of 128 characters. The characters can be alphanumeric characters, underscores (_), or hyphens (-). Template names are case sensitive.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateName;

/**
 <p>The type of channel that the message template is designed for. Valid values are: EMAIL, PUSH, SMS, and VOICE.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateType;

@end

/**
 
 */
@interface AWSPinpointTargetingUpdateTemplateActiveVersionResponse : AWSModel


/**
 <p>Provides information about an API request or response.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingMessageBody * _Nullable messageBody;

@end

/**
 
 */
@interface AWSPinpointTargetingUpdateVoiceChannelRequest : AWSRequest


/**
 <p>The unique identifier for the application. This identifier is displayed as the <b>Project ID</b> on the Amazon Pinpoint console.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 <p>Specifies the status and settings of the voice channel for an application.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingVoiceChannelRequest * _Nullable voiceChannelRequest;

@end

/**
 
 */
@interface AWSPinpointTargetingUpdateVoiceChannelResponse : AWSModel


/**
 <p>Provides information about the status and settings of the voice channel for an application.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingVoiceChannelResponse * _Nullable voiceChannelResponse;

@end

/**
 
 */
@interface AWSPinpointTargetingUpdateVoiceTemplateRequest : AWSRequest


/**
 <p>Specifies whether to save the updates as a new version of the message template. Valid values are: true, save the updates as a new version; and, false, save the updates to (overwrite) the latest existing version of the template.</p><p>If you don't specify a value for this parameter, Amazon Pinpoint saves the updates to (overwrites) the latest existing version of the template. If you specify a value of true for this parameter, don't specify a value for the version parameter. Otherwise, an error will occur.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable createNewVersion;

/**
 <p>The name of the message template. A template name must start with an alphanumeric character and can contain a maximum of 128 characters. The characters can be alphanumeric characters, underscores (_), or hyphens (-). Template names are case sensitive.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateName;

/**
 <p>The unique identifier for the version of the message template to update, retrieve information about, or delete. To retrieve identifiers and other information for all the versions of a template, use the <linklinkend="templates-template-name-template-type-versions">Template Versions</link> resource.</p><p>If specified, this value must match the identifier for an existing template version. If specified for an update operation, this value must match the identifier for the latest existing version of the template. This restriction helps ensure that race conditions don't occur.</p><p>If you don't specify a value for this parameter, Amazon Pinpoint does the following:</p><ul><li><p>For a get operation, retrieves information about the active version of the template.</p></li><li><p>For an update operation, saves the updates to (overwrites) the latest existing version of the template, if the create-new-version parameter isn't used or is set to false.</p></li><li><p>For a delete operation, deletes the template, including all versions of the template.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable version;

/**
 <p>Specifies the content and settings for a message template that can be used in messages that are sent through the voice channel.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingVoiceTemplateRequest * _Nullable voiceTemplateRequest;

@end

/**
 
 */
@interface AWSPinpointTargetingUpdateVoiceTemplateResponse : AWSModel


/**
 <p>Provides information about an API request or response.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingMessageBody * _Nullable messageBody;

@end

/**
 <p>Specifies the status and settings of the voice channel for an application.</p>
 */
@interface AWSPinpointTargetingVoiceChannelRequest : AWSModel


/**
 <p>Specifies whether to enable the voice channel for the application.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

@end

/**
 <p>Provides information about the status and settings of the voice channel for an application.</p>
 Required parameters: [Platform]
 */
@interface AWSPinpointTargetingVoiceChannelResponse : AWSModel


/**
 <p>The unique identifier for the application that the voice channel applies to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 <p>The date and time, in ISO 8601 format, when the voice channel was enabled.</p>
 */
@property (nonatomic, strong) NSString * _Nullable creationDate;

/**
 <p>Specifies whether the voice channel is enabled for the application.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

/**
 <p>(Not used) This property is retained only for backward compatibility.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable hasCredential;

/**
 <p>(Deprecated) An identifier for the voice channel. This property is retained only for backward compatibility.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>Specifies whether the voice channel is archived.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isArchived;

/**
 <p>The user who last modified the voice channel.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lastModifiedBy;

/**
 <p>The date and time, in ISO 8601 format, when the voice channel was last modified.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lastModifiedDate;

/**
 <p>The type of messaging or notification platform for the channel. For the voice channel, this value is VOICE.</p>
 */
@property (nonatomic, strong) NSString * _Nullable platform;

/**
 <p>The current version of the voice channel.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable version;

@end

/**
 <p>Specifies the settings for a one-time voice message that's sent directly to an endpoint through the voice channel.</p>
 */
@interface AWSPinpointTargetingVoiceMessage : AWSModel


/**
 <p>The text of the script to use for the voice message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable body;

/**
 <p>The code for the language to use when synthesizing the text of the message script. For a list of supported languages and the code for each one, see the <a href="https://docs.aws.amazon.com/polly/latest/dg/what-is.html">Amazon Polly Developer Guide</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable languageCode;

/**
 <p>The long code to send the voice message from. This value should be one of the dedicated long codes that's assigned to your AWS account. Although it isn't required, we recommend that you specify the long code in E.164 format, for example +12065550100, to ensure prompt and accurate delivery of the message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable originationNumber;

/**
 <p>The default message variables to use in the voice message. You can override the default variables with individual address variables.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSArray<NSString *> *> * _Nullable substitutions;

/**
 <p>The name of the voice to use when delivering the message. For a list of supported voices, see the <a href="https://docs.aws.amazon.com/polly/latest/dg/what-is.html">Amazon Polly Developer Guide</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable voiceId;

@end

/**
 <p>Specifies the content and settings for a message template that can be used in messages that are sent through the voice channel.</p>
 */
@interface AWSPinpointTargetingVoiceTemplateRequest : AWSModel


/**
 <p>The text of the script to use in messages that are based on the message template, in plain text format.</p>
 */
@property (nonatomic, strong) NSString * _Nullable body;

/**
 <p>A JSON object that specifies the default values to use for message variables in the message template. This object is a set of key-value pairs. Each key defines a message variable in the template. The corresponding value defines the default value for that variable. When you create a message that's based on the template, you can override these defaults with message-specific and address-specific variables and values.</p>
 */
@property (nonatomic, strong) NSString * _Nullable defaultSubstitutions;

/**
 <p>The code for the language to use when synthesizing the text of the script in messages that are based on the message template. For a list of supported languages and the code for each one, see the <a href="https://docs.aws.amazon.com/polly/latest/dg/what-is.html">Amazon Polly Developer Guide</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable languageCode;

/**
 <p>A custom description of the message template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateDescription;

/**
 <p>The name of the voice to use when delivering messages that are based on the message template. For a list of supported voices, see the <a href="https://docs.aws.amazon.com/polly/latest/dg/what-is.html">Amazon Polly Developer Guide</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable voiceId;

/**
 <p>A string-to-string map of key-value pairs that defines the tags to associate with the message template. Each tag consists of a required tag key and an associated tag value.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 <p>Provides information about the content and settings for a message template that can be used in messages that are sent through the voice channel.</p>
 Required parameters: [LastModifiedDate, CreationDate, TemplateName, TemplateType]
 */
@interface AWSPinpointTargetingVoiceTemplateResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the message template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The text of the script that's used in messages that are based on the message template, in plain text format.</p>
 */
@property (nonatomic, strong) NSString * _Nullable body;

/**
 <p>The date, in ISO 8601 format, when the message template was created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable creationDate;

/**
 <p>The JSON object that specifies the default values that are used for message variables in the message template. This object is a set of key-value pairs. Each key defines a message variable in the template. The corresponding value defines the default value for that variable.</p>
 */
@property (nonatomic, strong) NSString * _Nullable defaultSubstitutions;

/**
 <p>The code for the language that's used when synthesizing the text of the script in messages that are based on the message template. For a list of supported languages and the code for each one, see the <a href="https://docs.aws.amazon.com/polly/latest/dg/what-is.html">Amazon Polly Developer Guide</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable languageCode;

/**
 <p>The date, in ISO 8601 format, when the message template was last modified.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lastModifiedDate;

/**
 <p>The custom description of the message template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateDescription;

/**
 <p>The name of the message template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateName;

/**
 <p>The type of channel that the message template is designed for. For a voice template, this value is VOICE.</p>
 */
@property (nonatomic, assign) AWSPinpointTargetingTemplateType templateType;

/**
 <p>The unique identifier, as an integer, for the active version of the message template, or the version of the template that you specified by using the version parameter in your request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable version;

/**
 <p>The name of the voice that's used when delivering messages that are based on the message template. For a list of supported voices, see the <a href="https://docs.aws.amazon.com/polly/latest/dg/what-is.html">Amazon Polly Developer Guide</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable voiceId;

/**
 <p>A string-to-string map of key-value pairs that identifies the tags that are associated with the message template. Each tag consists of a required tag key and an associated tag value.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 <p>Specifies the settings for a wait activity in a journey. This type of activity waits for a certain amount of time or until a specific date and time before moving participants to the next activity in a journey.</p>
 */
@interface AWSPinpointTargetingWaitActivity : AWSModel


/**
 <p>The unique identifier for the next activity to perform, after performing the wait activity.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextActivity;

/**
 <p>The amount of time to wait or the date and time when the activity moves participants to the next activity in the journey.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingWaitTime * _Nullable waitTime;

@end

/**
 <p>Specifies a duration or a date and time that indicates when Amazon Pinpoint determines whether an activity's conditions have been met or an activity moves participants to the next activity in a journey.</p>
 */
@interface AWSPinpointTargetingWaitTime : AWSModel


/**
 <p>The amount of time to wait, as a duration in ISO 8601 format, before determining whether the activity's conditions have been met or moving participants to the next activity in the journey.</p>
 */
@property (nonatomic, strong) NSString * _Nullable waitFor;

/**
 <p>The date and time, in ISO 8601 format, when Amazon Pinpoint determines whether the activity's conditions have been met or the activity moves participants to the next activity in the journey.</p>
 */
@property (nonatomic, strong) NSString * _Nullable waitUntil;

@end

/**
 <p>Specifies the default settings for an application.</p>
 */
@interface AWSPinpointTargetingWriteApplicationSettingsRequest : AWSModel


/**
 <p>The settings for the AWS Lambda function to use by default as a code hook for campaigns in the application. To override these settings for a specific campaign, use the <linklinkend="apps-application-id-campaigns-campaign-id">Campaign</link> resource to define custom Lambda function settings for the campaign.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingCampaignHook * _Nullable campaignHook;

/**
 <p>Specifies whether to enable application-related alarms in Amazon CloudWatch.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable cloudWatchMetricsEnabled;

/**
 <p>The default sending limits for campaigns in the application. To override these limits for a specific campaign, use the <linklinkend="apps-application-id-campaigns-campaign-id">Campaign</link> resource to define custom limits for the campaign.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingCampaignLimits * _Nullable limits;

/**
 <p>The default quiet time for campaigns and journeys in the application. Quiet time is a specific time range when messages aren't sent to endpoints, if all the following conditions are met:</p><ul><li><p>The EndpointDemographic.Timezone property of the endpoint is set to a valid value.</p></li><li><p>The current time in the endpoint's time zone is later than or equal to the time specified by the QuietTime.Start property for the application (or a campaign or journey that has custom quiet time settings).</p></li><li><p>The current time in the endpoint's time zone is earlier than or equal to the time specified by the QuietTime.End property for the application (or a campaign or journey that has custom quiet time settings).</p></li></ul><p>If any of the preceding conditions isn't met, the endpoint will receive messages from a campaign or journey, even if quiet time is enabled.</p><p>To override the default quiet time settings for a specific campaign or journey, use the <linklinkend="apps-application-id-campaigns-campaign-id">Campaign</link> resource or the <linklinkend="apps-application-id-journeys-journey-id">Journey</link> resource to define a custom quiet time for the campaign or journey.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingQuietTime * _Nullable quietTime;

@end

/**
 <p>Specifies the configuration and other settings for a campaign.</p>
 */
@interface AWSPinpointTargetingWriteCampaignRequest : AWSModel


/**
 <p>An array of requests that defines additional treatments for the campaign, in addition to the default treatment for the campaign.</p>
 */
@property (nonatomic, strong) NSArray<AWSPinpointTargetingWriteTreatmentResource *> * _Nullable additionalTreatments;

/**
 <p>A custom description of the campaign.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The allocated percentage of users (segment members) who shouldn't receive messages from the campaign.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable holdoutPercent;

/**
 <p>The settings for the AWS Lambda function to use as a code hook for the campaign.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingCampaignHook * _Nullable hook;

/**
 <p>Specifies whether to pause the campaign. A paused campaign doesn't run unless you resume it by setting this value to false.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isPaused;

/**
 <p>The messaging limits for the campaign.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingCampaignLimits * _Nullable limits;

/**
 <p>The message configuration settings for the campaign.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingMessageConfiguration * _Nullable messageConfiguration;

/**
 <p>A custom name for the campaign.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The schedule settings for the campaign.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingSchedule * _Nullable schedule;

/**
 <p>The unique identifier for the segment to associate with the campaign.</p>
 */
@property (nonatomic, strong) NSString * _Nullable segmentId;

/**
 <p>The version of the segment to associate with the campaign.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable segmentVersion;

/**
 <p>The message template to use for the campaign.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingTemplateConfiguration * _Nullable templateConfiguration;

/**
 <p>A custom description of a variation of the campaign to use for A/B testing.</p>
 */
@property (nonatomic, strong) NSString * _Nullable treatmentDescription;

/**
 <p>A custom name for a variation of the campaign to use for A/B testing.</p>
 */
@property (nonatomic, strong) NSString * _Nullable treatmentName;

/**
 <p>A string-to-string map of key-value pairs that defines the tags to associate with the campaign. Each tag consists of a required tag key and an associated tag value.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 <p>Specifies the Amazon Resource Name (ARN) of an event stream to publish events to and the AWS Identity and Access Management (IAM) role to use when publishing those events.</p>
 Required parameters: [RoleArn, DestinationStreamArn]
 */
@interface AWSPinpointTargetingWriteEventStream : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the Amazon Kinesis data stream or Amazon Kinesis Data Firehose delivery stream that you want to publish event data to.</p><p>For a Kinesis data stream, the ARN format is: arn:aws:kinesis:<replaceable>region</replaceable>:<replaceable>account-id</replaceable>:stream/<replaceable>stream_name</replaceable></p><p>For a Kinesis Data Firehose delivery stream, the ARN format is: arn:aws:firehose:<replaceable>region</replaceable>:<replaceable>account-id</replaceable>:deliverystream/<replaceable>stream_name</replaceable></p>
 */
@property (nonatomic, strong) NSString * _Nullable destinationStreamArn;

/**
 <p>The AWS Identity and Access Management (IAM) role that authorizes Amazon Pinpoint to publish event data to the stream in your AWS account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

@end

/**
 <p>Specifies the configuration and other settings for a journey.</p>
 Required parameters: [Name]
 */
@interface AWSPinpointTargetingWriteJourneyRequest : AWSModel


/**
 <p>A map that contains a set of Activity objects, one object for each activity in the journey. For each Activity object, the key is the unique identifier (string) for an activity and the value is the settings for the activity. An activity identifier can contain a maximum of 100 characters. The characters must be alphanumeric characters.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSPinpointTargetingActivity *> * _Nullable activities;

/**
 <p>The date, in ISO 8601 format, when the journey was created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable creationDate;

/**
 <p>The date, in ISO 8601 format, when the journey was last modified.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lastModifiedDate;

/**
 <p>The messaging and entry limits for the journey.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingJourneyLimits * _Nullable limits;

/**
 <p>Specifies whether the journey's scheduled start and end times use each participant's local time. To base the schedule on each participant's local time, set this value to true.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable localTime;

/**
 <p>The name of the journey. A journey name can contain a maximum of 150 characters. The characters can be alphanumeric characters or symbols, such as underscores (_) or hyphens (-). A journey name can't contain any spaces.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The quiet time settings for the journey. Quiet time is a specific time range when a journey doesn't send messages to participants, if all the following conditions are met:</p><ul><li><p>The EndpointDemographic.Timezone property of the endpoint for the participant is set to a valid value.</p></li><li><p>The current time in the participant's time zone is later than or equal to the time specified by the QuietTime.Start property for the journey.</p></li><li><p>The current time in the participant's time zone is earlier than or equal to the time specified by the QuietTime.End property for the journey.</p></li></ul><p>If any of the preceding conditions isn't met, the participant will receive messages from the journey, even if quiet time is enabled.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingQuietTime * _Nullable quietTime;

/**
 <p>The frequency with which Amazon Pinpoint evaluates segment and event data for the journey, as a duration in ISO 8601 format.</p>
 */
@property (nonatomic, strong) NSString * _Nullable refreshFrequency;

/**
 <p>The schedule settings for the journey.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingJourneySchedule * _Nullable schedule;

/**
 <p>The unique identifier for the first activity in the journey. The identifier for this activity can contain a maximum of 128 characters. The characters must be alphanumeric characters.</p>
 */
@property (nonatomic, strong) NSString * _Nullable startActivity;

/**
 <p>The segment that defines which users are participants in the journey.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingStartCondition * _Nullable startCondition;

/**
 <p>The status of the journey. Valid values are:</p><ul><li><p>DRAFT - Saves the journey and doesn't publish it.</p></li><li><p>ACTIVE - Saves and publishes the journey. Depending on the journey's schedule, the journey starts running immediately or at the scheduled start time. If a journey's status is ACTIVE, you can't add, change, or remove activities from it.</p></li></ul><p>The CANCELLED, COMPLETED, and CLOSED values are not supported in requests to create or update a journey. To cancel a journey, use the <linklinkend="apps-application-id-journeys-journey-id-state">Journey State</link> resource.</p>
 */
@property (nonatomic, assign) AWSPinpointTargetingState state;

@end

/**
 <p>Specifies the configuration, dimension, and other settings for a segment. A WriteSegmentRequest object can include a Dimensions object or a SegmentGroups object, but not both.</p>
 */
@interface AWSPinpointTargetingWriteSegmentRequest : AWSModel


/**
 <p>The criteria that define the dimensions for the segment.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingSegmentDimensions * _Nullable dimensions;

/**
 <p>The name of the segment.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The segment group to use and the dimensions to apply to the group's base segments in order to build the segment. A segment group can consist of zero or more base segments. Your request can include only one segment group.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingSegmentGroupList * _Nullable segmentGroups;

/**
 <p>A string-to-string map of key-value pairs that defines the tags to associate with the segment. Each tag consists of a required tag key and an associated tag value.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 <p>Specifies the settings for a campaign treatment. A treatment is a variation of a campaign that's used for A/B testing of a campaign.</p>
 Required parameters: [SizePercent]
 */
@interface AWSPinpointTargetingWriteTreatmentResource : AWSModel


/**
 <p>The message configuration settings for the treatment.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingMessageConfiguration * _Nullable messageConfiguration;

/**
 <p>The schedule settings for the treatment.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingSchedule * _Nullable schedule;

/**
 <p>The allocated percentage of users (segment members) to send the treatment to.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable sizePercent;

/**
 <p>The message template to use for the treatment.</p>
 */
@property (nonatomic, strong) AWSPinpointTargetingTemplateConfiguration * _Nullable templateConfiguration;

/**
 <p>A custom description of the treatment.</p>
 */
@property (nonatomic, strong) NSString * _Nullable treatmentDescription;

/**
 <p>A custom name for the treatment. A treatment is a variation of a campaign that's used for A/B testing of a campaign.</p>
 */
@property (nonatomic, strong) NSString * _Nullable treatmentName;

@end

NS_ASSUME_NONNULL_END
