//
// Copyright 2010-2023 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import <XCTest/XCTest.h>
#import <AWSNSSecureCodingTestBase/AWSNSSecureCodingTestBase.h>
#import "AWSPinpointTargetingModel.h"

@interface AWSPinpointTargetingNSSecureCodingTests : AWSNSSecureCodingTest

- (void) test_AWSPinpointTargetingADMChannelRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingADMChannelResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingADMMessage API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingAPNSChannelRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingAPNSChannelResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingAPNSMessage API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingAPNSPushNotificationTemplate API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingAPNSSandboxChannelRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingAPNSSandboxChannelResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingAPNSVoipChannelRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingAPNSVoipChannelResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingAPNSVoipSandboxChannelRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingAPNSVoipSandboxChannelResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingActivitiesResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingActivity API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingActivityResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingAddressConfiguration API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingAndroidPushNotificationTemplate API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingApplicationDateRangeKpiResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingApplicationResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingApplicationSettingsJourneyLimits API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingApplicationSettingsResource API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingApplicationsResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingAttributeDimension API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingAttributesResource API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingBaiduChannelRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingBaiduChannelResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingBaiduMessage API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingBaseKpiResult API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingCampaignCustomMessage API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingCampaignDateRangeKpiResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingCampaignEmailMessage API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingCampaignEventFilter API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingCampaignHook API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingCampaignInAppMessage API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingCampaignLimits API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingCampaignResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingCampaignSmsMessage API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingCampaignState API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingCampaignsResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingChannelResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingChannelsResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingCondition API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingConditionalSplitActivity API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingContactCenterActivity API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingCreateAppRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingCreateAppResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingCreateApplicationRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingCreateCampaignRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingCreateCampaignResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingCreateEmailTemplateRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingCreateEmailTemplateResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingCreateExportJobRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingCreateExportJobResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingCreateImportJobRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingCreateImportJobResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingCreateInAppTemplateRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingCreateInAppTemplateResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingCreateJourneyRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingCreateJourneyResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingCreatePushTemplateRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingCreatePushTemplateResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingCreateRecommenderConfiguration API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingCreateRecommenderConfigurationRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingCreateRecommenderConfigurationResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingCreateSegmentRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingCreateSegmentResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingCreateSmsTemplateRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingCreateSmsTemplateResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingCreateTemplateMessageBody API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingCreateVoiceTemplateRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingCreateVoiceTemplateResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingCustomDeliveryConfiguration API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingCustomMessageActivity API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingDefaultButtonConfiguration API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingDefaultMessage API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingDefaultPushNotificationMessage API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingDefaultPushNotificationTemplate API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingDeleteAdmChannelRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingDeleteAdmChannelResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingDeleteApnsChannelRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingDeleteApnsChannelResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingDeleteApnsSandboxChannelRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingDeleteApnsSandboxChannelResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingDeleteApnsVoipChannelRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingDeleteApnsVoipChannelResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingDeleteApnsVoipSandboxChannelRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingDeleteApnsVoipSandboxChannelResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingDeleteAppRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingDeleteAppResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingDeleteBaiduChannelRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingDeleteBaiduChannelResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingDeleteCampaignRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingDeleteCampaignResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingDeleteEmailChannelRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingDeleteEmailChannelResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingDeleteEmailTemplateRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingDeleteEmailTemplateResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingDeleteEndpointRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingDeleteEndpointResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingDeleteEventStreamRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingDeleteEventStreamResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingDeleteGcmChannelRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingDeleteGcmChannelResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingDeleteInAppTemplateRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingDeleteInAppTemplateResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingDeleteJourneyRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingDeleteJourneyResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingDeletePushTemplateRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingDeletePushTemplateResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingDeleteRecommenderConfigurationRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingDeleteRecommenderConfigurationResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingDeleteSegmentRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingDeleteSegmentResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingDeleteSmsChannelRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingDeleteSmsChannelResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingDeleteSmsTemplateRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingDeleteSmsTemplateResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingDeleteUserEndpointsRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingDeleteUserEndpointsResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingDeleteVoiceChannelRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingDeleteVoiceChannelResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingDeleteVoiceTemplateRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingDeleteVoiceTemplateResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingDirectMessageConfiguration API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingEmailChannelRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingEmailChannelResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingEmailMessage API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingEmailMessageActivity API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingEmailTemplateRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingEmailTemplateResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingEndpointBatchItem API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingEndpointBatchRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingEndpointDemographic API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingEndpointItemResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingEndpointLocation API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingEndpointMessageResult API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingEndpointRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingEndpointResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingEndpointSendConfiguration API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingEndpointUser API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingEndpointsResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingEvent API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingEventCondition API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingEventDimensions API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingEventFilter API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingEventItemResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingEventStartCondition API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingEventStream API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingEventsBatch API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingEventsRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingEventsResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingExportJobRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingExportJobResource API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingExportJobResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingExportJobsResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingGCMChannelRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingGCMChannelResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingGCMMessage API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingGPSCoordinates API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingGPSPointDimension API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingGetAdmChannelRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingGetAdmChannelResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingGetApnsChannelRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingGetApnsChannelResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingGetApnsSandboxChannelRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingGetApnsSandboxChannelResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingGetApnsVoipChannelRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingGetApnsVoipChannelResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingGetApnsVoipSandboxChannelRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingGetApnsVoipSandboxChannelResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingGetAppRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingGetAppResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingGetApplicationDateRangeKpiRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingGetApplicationDateRangeKpiResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingGetApplicationSettingsRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingGetApplicationSettingsResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingGetAppsRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingGetAppsResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingGetBaiduChannelRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingGetBaiduChannelResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingGetCampaignActivitiesRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingGetCampaignActivitiesResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingGetCampaignDateRangeKpiRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingGetCampaignDateRangeKpiResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingGetCampaignRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingGetCampaignResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingGetCampaignVersionRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingGetCampaignVersionResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingGetCampaignVersionsRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingGetCampaignVersionsResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingGetCampaignsRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingGetCampaignsResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingGetChannelsRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingGetChannelsResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingGetEmailChannelRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingGetEmailChannelResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingGetEmailTemplateRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingGetEmailTemplateResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingGetEndpointRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingGetEndpointResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingGetEventStreamRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingGetEventStreamResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingGetExportJobRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingGetExportJobResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingGetExportJobsRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingGetExportJobsResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingGetGcmChannelRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingGetGcmChannelResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingGetImportJobRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingGetImportJobResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingGetImportJobsRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingGetImportJobsResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingGetInAppMessagesRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingGetInAppMessagesResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingGetInAppTemplateRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingGetInAppTemplateResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingGetJourneyDateRangeKpiRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingGetJourneyDateRangeKpiResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingGetJourneyExecutionActivityMetricsRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingGetJourneyExecutionActivityMetricsResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingGetJourneyExecutionMetricsRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingGetJourneyExecutionMetricsResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingGetJourneyRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingGetJourneyResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingGetJourneyRunExecutionActivityMetricsRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingGetJourneyRunExecutionActivityMetricsResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingGetJourneyRunExecutionMetricsRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingGetJourneyRunExecutionMetricsResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingGetJourneyRunsRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingGetJourneyRunsResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingGetPushTemplateRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingGetPushTemplateResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingGetRecommenderConfigurationRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingGetRecommenderConfigurationResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingGetRecommenderConfigurationsRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingGetRecommenderConfigurationsResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingGetSegmentExportJobsRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingGetSegmentExportJobsResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingGetSegmentImportJobsRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingGetSegmentImportJobsResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingGetSegmentRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingGetSegmentResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingGetSegmentVersionRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingGetSegmentVersionResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingGetSegmentVersionsRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingGetSegmentVersionsResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingGetSegmentsRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingGetSegmentsResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingGetSmsChannelRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingGetSmsChannelResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingGetSmsTemplateRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingGetSmsTemplateResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingGetUserEndpointsRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingGetUserEndpointsResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingGetVoiceChannelRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingGetVoiceChannelResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingGetVoiceTemplateRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingGetVoiceTemplateResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingHoldoutActivity API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingImportJobRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingImportJobResource API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingImportJobResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingImportJobsResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingInAppCampaignSchedule API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingInAppMessage API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingInAppMessageBodyConfig API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingInAppMessageButton API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingInAppMessageCampaign API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingInAppMessageContent API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingInAppMessageHeaderConfig API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingInAppMessagesResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingInAppTemplateRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingInAppTemplateResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingItemResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingJourneyCustomMessage API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingJourneyDateRangeKpiResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingJourneyEmailMessage API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingJourneyExecutionActivityMetricsResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingJourneyExecutionMetricsResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingJourneyLimits API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingJourneyPushMessage API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingJourneyChannelSettings API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingJourneyResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingJourneyRunExecutionActivityMetricsResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingJourneyRunExecutionMetricsResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingJourneyRunResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingJourneyRunsResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingJourneySMSMessage API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingJourneySchedule API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingJourneyStateRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingJourneyTimeframeCap API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingJourneysResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingListJourneysRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingListJourneysResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingListRecommenderConfigurationsResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingListTagsForResourceRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingListTagsForResourceResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingListTemplateVersionsRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingListTemplateVersionsResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingListTemplatesRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingListTemplatesResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingMessage API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingMessageBody API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingMessageConfiguration API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingMessageRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingMessageResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingMessageResult API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingMetricDimension API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingMultiConditionalBranch API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingMultiConditionalSplitActivity API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingNumberValidateRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingNumberValidateResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingOverrideButtonConfiguration API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingPhoneNumberValidateRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingPhoneNumberValidateResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingPublicEndpoint API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingPushMessageActivity API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingPushNotificationTemplateRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingPushNotificationTemplateResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingPutEventStreamRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingPutEventStreamResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingPutEventsRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingPutEventsResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingQuietTime API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingRandomSplitActivity API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingRandomSplitEntry API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingRawEmail API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingRecencyDimension API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingRecommenderConfigurationResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingRemoveAttributesRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingRemoveAttributesResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingResultRow API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingResultRowValue API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingSMSChannelRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingSMSChannelResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingSMSMessage API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingSMSMessageActivity API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingSMSTemplateRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingSMSTemplateResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingSchedule API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingSegmentBehaviors API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingSegmentCondition API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingSegmentDemographics API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingSegmentDimensions API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingSegmentGroup API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingSegmentGroupList API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingSegmentImportResource API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingSegmentLocation API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingSegmentReference API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingSegmentResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingSegmentsResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingSendMessagesRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingSendMessagesResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingSendOTPMessageRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingSendOTPMessageRequestParameters API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingSendOTPMessageResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingSendUsersMessageRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingSendUsersMessageResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingSendUsersMessagesRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingSendUsersMessagesResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingSession API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingSetDimension API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingSimpleCondition API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingSimpleEmail API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingSimpleEmailPart API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingStartCondition API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingTagResourceRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingTagsModel API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingTemplate API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingTemplateActiveVersionRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingTemplateConfiguration API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingTemplateCreateMessageBody API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingTemplateResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingTemplateVersionResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingTemplateVersionsResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingTemplatesResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingTreatmentResource API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingUntagResourceRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingUpdateAdmChannelRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingUpdateAdmChannelResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingUpdateApnsChannelRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingUpdateApnsChannelResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingUpdateApnsSandboxChannelRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingUpdateApnsSandboxChannelResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingUpdateApnsVoipChannelRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingUpdateApnsVoipChannelResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingUpdateApnsVoipSandboxChannelRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingUpdateApnsVoipSandboxChannelResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingUpdateApplicationSettingsRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingUpdateApplicationSettingsResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingUpdateAttributesRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingUpdateBaiduChannelRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingUpdateBaiduChannelResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingUpdateCampaignRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingUpdateCampaignResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingUpdateEmailChannelRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingUpdateEmailChannelResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingUpdateEmailTemplateRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingUpdateEmailTemplateResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingUpdateEndpointRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingUpdateEndpointResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingUpdateEndpointsBatchRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingUpdateEndpointsBatchResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingUpdateGcmChannelRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingUpdateGcmChannelResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingUpdateInAppTemplateRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingUpdateInAppTemplateResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingUpdateJourneyRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingUpdateJourneyResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingUpdateJourneyStateRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingUpdateJourneyStateResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingUpdatePushTemplateRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingUpdatePushTemplateResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingUpdateRecommenderConfiguration API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingUpdateRecommenderConfigurationRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingUpdateRecommenderConfigurationResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingUpdateSegmentRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingUpdateSegmentResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingUpdateSmsChannelRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingUpdateSmsChannelResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingUpdateSmsTemplateRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingUpdateSmsTemplateResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingUpdateTemplateActiveVersionRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingUpdateTemplateActiveVersionResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingUpdateVoiceChannelRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingUpdateVoiceChannelResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingUpdateVoiceTemplateRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingUpdateVoiceTemplateResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingVerificationResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingVerifyOTPMessageRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingVerifyOTPMessageRequestParameters API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingVerifyOTPMessageResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingVoiceChannelRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingVoiceChannelResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingVoiceMessage API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingVoiceTemplateRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingVoiceTemplateResponse API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingWaitActivity API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingWaitTime API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingWriteApplicationSettingsRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingWriteCampaignRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingWriteEventStream API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingWriteJourneyRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingWriteSegmentRequest API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingWriteTreatmentResource API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingOpenHoursRule API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingOpenHours API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingClosedDaysRule API_AVAILABLE(ios(11));
- (void) test_AWSPinpointTargetingClosedDays API_AVAILABLE(ios(11));

@end

@implementation AWSPinpointTargetingNSSecureCodingTests

- (void) test_AWSPinpointTargetingADMChannelRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingADMChannelRequest class]];
}

- (void) test_AWSPinpointTargetingADMChannelResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingADMChannelResponse class]];
}

- (void) test_AWSPinpointTargetingADMMessage {
    [self validateSecureCodingForClass:[AWSPinpointTargetingADMMessage class]];
}

- (void) test_AWSPinpointTargetingAPNSChannelRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingAPNSChannelRequest class]];
}

- (void) test_AWSPinpointTargetingAPNSChannelResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingAPNSChannelResponse class]];
}

- (void) test_AWSPinpointTargetingAPNSMessage {
    [self validateSecureCodingForClass:[AWSPinpointTargetingAPNSMessage class]];
}

- (void) test_AWSPinpointTargetingAPNSPushNotificationTemplate {
    [self validateSecureCodingForClass:[AWSPinpointTargetingAPNSPushNotificationTemplate class]];
}

- (void) test_AWSPinpointTargetingAPNSSandboxChannelRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingAPNSSandboxChannelRequest class]];
}

- (void) test_AWSPinpointTargetingAPNSSandboxChannelResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingAPNSSandboxChannelResponse class]];
}

- (void) test_AWSPinpointTargetingAPNSVoipChannelRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingAPNSVoipChannelRequest class]];
}

- (void) test_AWSPinpointTargetingAPNSVoipChannelResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingAPNSVoipChannelResponse class]];
}

- (void) test_AWSPinpointTargetingAPNSVoipSandboxChannelRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingAPNSVoipSandboxChannelRequest class]];
}

- (void) test_AWSPinpointTargetingAPNSVoipSandboxChannelResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingAPNSVoipSandboxChannelResponse class]];
}

- (void) test_AWSPinpointTargetingActivitiesResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingActivitiesResponse class]];
}

- (void) test_AWSPinpointTargetingActivity {
    [self validateSecureCodingForClass:[AWSPinpointTargetingActivity class]];
}

- (void) test_AWSPinpointTargetingActivityResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingActivityResponse class]];
}

- (void) test_AWSPinpointTargetingAddressConfiguration {
    [self validateSecureCodingForClass:[AWSPinpointTargetingAddressConfiguration class]];
}

- (void) test_AWSPinpointTargetingAndroidPushNotificationTemplate {
    [self validateSecureCodingForClass:[AWSPinpointTargetingAndroidPushNotificationTemplate class]];
}

- (void) test_AWSPinpointTargetingApplicationDateRangeKpiResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingApplicationDateRangeKpiResponse class]];
}

- (void) test_AWSPinpointTargetingApplicationResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingApplicationResponse class]];
}

- (void) test_AWSPinpointTargetingApplicationSettingsJourneyLimits {
    [self validateSecureCodingForClass:[AWSPinpointTargetingApplicationSettingsJourneyLimits class]];
}

- (void) test_AWSPinpointTargetingApplicationSettingsResource {
    [self validateSecureCodingForClass:[AWSPinpointTargetingApplicationSettingsResource class]];
}

- (void) test_AWSPinpointTargetingApplicationsResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingApplicationsResponse class]];
}

- (void) test_AWSPinpointTargetingAttributeDimension {
    [self validateSecureCodingForClass:[AWSPinpointTargetingAttributeDimension class]];
}

- (void) test_AWSPinpointTargetingAttributesResource {
    [self validateSecureCodingForClass:[AWSPinpointTargetingAttributesResource class]];
}

- (void) test_AWSPinpointTargetingBaiduChannelRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingBaiduChannelRequest class]];
}

- (void) test_AWSPinpointTargetingBaiduChannelResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingBaiduChannelResponse class]];
}

- (void) test_AWSPinpointTargetingBaiduMessage {
    [self validateSecureCodingForClass:[AWSPinpointTargetingBaiduMessage class]];
}

- (void) test_AWSPinpointTargetingBaseKpiResult {
    [self validateSecureCodingForClass:[AWSPinpointTargetingBaseKpiResult class]];
}

- (void) test_AWSPinpointTargetingCampaignCustomMessage {
    [self validateSecureCodingForClass:[AWSPinpointTargetingCampaignCustomMessage class]];
}

- (void) test_AWSPinpointTargetingCampaignDateRangeKpiResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingCampaignDateRangeKpiResponse class]];
}

- (void) test_AWSPinpointTargetingCampaignEmailMessage {
    [self validateSecureCodingForClass:[AWSPinpointTargetingCampaignEmailMessage class]];
}

- (void) test_AWSPinpointTargetingCampaignEventFilter {
    [self validateSecureCodingForClass:[AWSPinpointTargetingCampaignEventFilter class]];
}

- (void) test_AWSPinpointTargetingCampaignHook {
    [self validateSecureCodingForClass:[AWSPinpointTargetingCampaignHook class]];
}

- (void) test_AWSPinpointTargetingCampaignInAppMessage {
    [self validateSecureCodingForClass:[AWSPinpointTargetingCampaignInAppMessage class]];
}

- (void) test_AWSPinpointTargetingCampaignLimits {
    [self validateSecureCodingForClass:[AWSPinpointTargetingCampaignLimits class]];
}

- (void) test_AWSPinpointTargetingCampaignResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingCampaignResponse class]];
}

- (void) test_AWSPinpointTargetingCampaignSmsMessage {
    [self validateSecureCodingForClass:[AWSPinpointTargetingCampaignSmsMessage class]];
}

- (void) test_AWSPinpointTargetingCampaignState {
    [self validateSecureCodingForClass:[AWSPinpointTargetingCampaignState class]];
}

- (void) test_AWSPinpointTargetingCampaignsResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingCampaignsResponse class]];
}

- (void) test_AWSPinpointTargetingChannelResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingChannelResponse class]];
}

- (void) test_AWSPinpointTargetingChannelsResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingChannelsResponse class]];
}

- (void) test_AWSPinpointTargetingCondition {
    [self validateSecureCodingForClass:[AWSPinpointTargetingCondition class]];
}

- (void) test_AWSPinpointTargetingConditionalSplitActivity {
    [self validateSecureCodingForClass:[AWSPinpointTargetingConditionalSplitActivity class]];
}

- (void) test_AWSPinpointTargetingContactCenterActivity {
    [self validateSecureCodingForClass:[AWSPinpointTargetingContactCenterActivity class]];
}

- (void) test_AWSPinpointTargetingCreateAppRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingCreateAppRequest class]];
}

- (void) test_AWSPinpointTargetingCreateAppResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingCreateAppResponse class]];
}

- (void) test_AWSPinpointTargetingCreateApplicationRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingCreateApplicationRequest class]];
}

- (void) test_AWSPinpointTargetingCreateCampaignRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingCreateCampaignRequest class]];
}

- (void) test_AWSPinpointTargetingCreateCampaignResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingCreateCampaignResponse class]];
}

- (void) test_AWSPinpointTargetingCreateEmailTemplateRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingCreateEmailTemplateRequest class]];
}

- (void) test_AWSPinpointTargetingCreateEmailTemplateResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingCreateEmailTemplateResponse class]];
}

- (void) test_AWSPinpointTargetingCreateExportJobRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingCreateExportJobRequest class]];
}

- (void) test_AWSPinpointTargetingCreateExportJobResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingCreateExportJobResponse class]];
}

- (void) test_AWSPinpointTargetingCreateImportJobRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingCreateImportJobRequest class]];
}

- (void) test_AWSPinpointTargetingCreateImportJobResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingCreateImportJobResponse class]];
}

- (void) test_AWSPinpointTargetingCreateInAppTemplateRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingCreateInAppTemplateRequest class]];
}

- (void) test_AWSPinpointTargetingCreateInAppTemplateResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingCreateInAppTemplateResponse class]];
}

- (void) test_AWSPinpointTargetingCreateJourneyRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingCreateJourneyRequest class]];
}

- (void) test_AWSPinpointTargetingCreateJourneyResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingCreateJourneyResponse class]];
}

- (void) test_AWSPinpointTargetingCreatePushTemplateRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingCreatePushTemplateRequest class]];
}

- (void) test_AWSPinpointTargetingCreatePushTemplateResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingCreatePushTemplateResponse class]];
}

- (void) test_AWSPinpointTargetingCreateRecommenderConfiguration {
    [self validateSecureCodingForClass:[AWSPinpointTargetingCreateRecommenderConfiguration class]];
}

- (void) test_AWSPinpointTargetingCreateRecommenderConfigurationRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingCreateRecommenderConfigurationRequest class]];
}

- (void) test_AWSPinpointTargetingCreateRecommenderConfigurationResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingCreateRecommenderConfigurationResponse class]];
}

- (void) test_AWSPinpointTargetingCreateSegmentRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingCreateSegmentRequest class]];
}

- (void) test_AWSPinpointTargetingCreateSegmentResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingCreateSegmentResponse class]];
}

- (void) test_AWSPinpointTargetingCreateSmsTemplateRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingCreateSmsTemplateRequest class]];
}

- (void) test_AWSPinpointTargetingCreateSmsTemplateResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingCreateSmsTemplateResponse class]];
}

- (void) test_AWSPinpointTargetingCreateTemplateMessageBody {
    [self validateSecureCodingForClass:[AWSPinpointTargetingCreateTemplateMessageBody class]];
}

- (void) test_AWSPinpointTargetingCreateVoiceTemplateRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingCreateVoiceTemplateRequest class]];
}

- (void) test_AWSPinpointTargetingCreateVoiceTemplateResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingCreateVoiceTemplateResponse class]];
}

- (void) test_AWSPinpointTargetingCustomDeliveryConfiguration {
    [self validateSecureCodingForClass:[AWSPinpointTargetingCustomDeliveryConfiguration class]];
}

- (void) test_AWSPinpointTargetingCustomMessageActivity {
    [self validateSecureCodingForClass:[AWSPinpointTargetingCustomMessageActivity class]];
}

- (void) test_AWSPinpointTargetingDefaultButtonConfiguration {
    [self validateSecureCodingForClass:[AWSPinpointTargetingDefaultButtonConfiguration class]];
}

- (void) test_AWSPinpointTargetingDefaultMessage {
    [self validateSecureCodingForClass:[AWSPinpointTargetingDefaultMessage class]];
}

- (void) test_AWSPinpointTargetingDefaultPushNotificationMessage {
    [self validateSecureCodingForClass:[AWSPinpointTargetingDefaultPushNotificationMessage class]];
}

- (void) test_AWSPinpointTargetingDefaultPushNotificationTemplate {
    [self validateSecureCodingForClass:[AWSPinpointTargetingDefaultPushNotificationTemplate class]];
}

- (void) test_AWSPinpointTargetingDeleteAdmChannelRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingDeleteAdmChannelRequest class]];
}

- (void) test_AWSPinpointTargetingDeleteAdmChannelResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingDeleteAdmChannelResponse class]];
}

- (void) test_AWSPinpointTargetingDeleteApnsChannelRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingDeleteApnsChannelRequest class]];
}

- (void) test_AWSPinpointTargetingDeleteApnsChannelResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingDeleteApnsChannelResponse class]];
}

- (void) test_AWSPinpointTargetingDeleteApnsSandboxChannelRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingDeleteApnsSandboxChannelRequest class]];
}

- (void) test_AWSPinpointTargetingDeleteApnsSandboxChannelResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingDeleteApnsSandboxChannelResponse class]];
}

- (void) test_AWSPinpointTargetingDeleteApnsVoipChannelRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingDeleteApnsVoipChannelRequest class]];
}

- (void) test_AWSPinpointTargetingDeleteApnsVoipChannelResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingDeleteApnsVoipChannelResponse class]];
}

- (void) test_AWSPinpointTargetingDeleteApnsVoipSandboxChannelRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingDeleteApnsVoipSandboxChannelRequest class]];
}

- (void) test_AWSPinpointTargetingDeleteApnsVoipSandboxChannelResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingDeleteApnsVoipSandboxChannelResponse class]];
}

- (void) test_AWSPinpointTargetingDeleteAppRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingDeleteAppRequest class]];
}

- (void) test_AWSPinpointTargetingDeleteAppResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingDeleteAppResponse class]];
}

- (void) test_AWSPinpointTargetingDeleteBaiduChannelRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingDeleteBaiduChannelRequest class]];
}

- (void) test_AWSPinpointTargetingDeleteBaiduChannelResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingDeleteBaiduChannelResponse class]];
}

- (void) test_AWSPinpointTargetingDeleteCampaignRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingDeleteCampaignRequest class]];
}

- (void) test_AWSPinpointTargetingDeleteCampaignResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingDeleteCampaignResponse class]];
}

- (void) test_AWSPinpointTargetingDeleteEmailChannelRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingDeleteEmailChannelRequest class]];
}

- (void) test_AWSPinpointTargetingDeleteEmailChannelResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingDeleteEmailChannelResponse class]];
}

- (void) test_AWSPinpointTargetingDeleteEmailTemplateRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingDeleteEmailTemplateRequest class]];
}

- (void) test_AWSPinpointTargetingDeleteEmailTemplateResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingDeleteEmailTemplateResponse class]];
}

- (void) test_AWSPinpointTargetingDeleteEndpointRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingDeleteEndpointRequest class]];
}

- (void) test_AWSPinpointTargetingDeleteEndpointResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingDeleteEndpointResponse class]];
}

- (void) test_AWSPinpointTargetingDeleteEventStreamRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingDeleteEventStreamRequest class]];
}

- (void) test_AWSPinpointTargetingDeleteEventStreamResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingDeleteEventStreamResponse class]];
}

- (void) test_AWSPinpointTargetingDeleteGcmChannelRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingDeleteGcmChannelRequest class]];
}

- (void) test_AWSPinpointTargetingDeleteGcmChannelResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingDeleteGcmChannelResponse class]];
}

- (void) test_AWSPinpointTargetingDeleteInAppTemplateRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingDeleteInAppTemplateRequest class]];
}

- (void) test_AWSPinpointTargetingDeleteInAppTemplateResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingDeleteInAppTemplateResponse class]];
}

- (void) test_AWSPinpointTargetingDeleteJourneyRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingDeleteJourneyRequest class]];
}

- (void) test_AWSPinpointTargetingDeleteJourneyResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingDeleteJourneyResponse class]];
}

- (void) test_AWSPinpointTargetingDeletePushTemplateRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingDeletePushTemplateRequest class]];
}

- (void) test_AWSPinpointTargetingDeletePushTemplateResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingDeletePushTemplateResponse class]];
}

- (void) test_AWSPinpointTargetingDeleteRecommenderConfigurationRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingDeleteRecommenderConfigurationRequest class]];
}

- (void) test_AWSPinpointTargetingDeleteRecommenderConfigurationResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingDeleteRecommenderConfigurationResponse class]];
}

- (void) test_AWSPinpointTargetingDeleteSegmentRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingDeleteSegmentRequest class]];
}

- (void) test_AWSPinpointTargetingDeleteSegmentResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingDeleteSegmentResponse class]];
}

- (void) test_AWSPinpointTargetingDeleteSmsChannelRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingDeleteSmsChannelRequest class]];
}

- (void) test_AWSPinpointTargetingDeleteSmsChannelResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingDeleteSmsChannelResponse class]];
}

- (void) test_AWSPinpointTargetingDeleteSmsTemplateRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingDeleteSmsTemplateRequest class]];
}

- (void) test_AWSPinpointTargetingDeleteSmsTemplateResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingDeleteSmsTemplateResponse class]];
}

- (void) test_AWSPinpointTargetingDeleteUserEndpointsRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingDeleteUserEndpointsRequest class]];
}

- (void) test_AWSPinpointTargetingDeleteUserEndpointsResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingDeleteUserEndpointsResponse class]];
}

- (void) test_AWSPinpointTargetingDeleteVoiceChannelRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingDeleteVoiceChannelRequest class]];
}

- (void) test_AWSPinpointTargetingDeleteVoiceChannelResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingDeleteVoiceChannelResponse class]];
}

- (void) test_AWSPinpointTargetingDeleteVoiceTemplateRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingDeleteVoiceTemplateRequest class]];
}

- (void) test_AWSPinpointTargetingDeleteVoiceTemplateResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingDeleteVoiceTemplateResponse class]];
}

- (void) test_AWSPinpointTargetingDirectMessageConfiguration {
    [self validateSecureCodingForClass:[AWSPinpointTargetingDirectMessageConfiguration class]];
}

- (void) test_AWSPinpointTargetingEmailChannelRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingEmailChannelRequest class]];
}

- (void) test_AWSPinpointTargetingEmailChannelResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingEmailChannelResponse class]];
}

- (void) test_AWSPinpointTargetingEmailMessage {
    [self validateSecureCodingForClass:[AWSPinpointTargetingEmailMessage class]];
}

- (void) test_AWSPinpointTargetingEmailMessageActivity {
    [self validateSecureCodingForClass:[AWSPinpointTargetingEmailMessageActivity class]];
}

- (void) test_AWSPinpointTargetingEmailTemplateRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingEmailTemplateRequest class]];
}

- (void) test_AWSPinpointTargetingEmailTemplateResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingEmailTemplateResponse class]];
}

- (void) test_AWSPinpointTargetingEndpointBatchItem {
    [self validateSecureCodingForClass:[AWSPinpointTargetingEndpointBatchItem class]];
}

- (void) test_AWSPinpointTargetingEndpointBatchRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingEndpointBatchRequest class]];
}

- (void) test_AWSPinpointTargetingEndpointDemographic {
    [self validateSecureCodingForClass:[AWSPinpointTargetingEndpointDemographic class]];
}

- (void) test_AWSPinpointTargetingEndpointItemResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingEndpointItemResponse class]];
}

- (void) test_AWSPinpointTargetingEndpointLocation {
    [self validateSecureCodingForClass:[AWSPinpointTargetingEndpointLocation class]];
}

- (void) test_AWSPinpointTargetingEndpointMessageResult {
    [self validateSecureCodingForClass:[AWSPinpointTargetingEndpointMessageResult class]];
}

- (void) test_AWSPinpointTargetingEndpointRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingEndpointRequest class]];
}

- (void) test_AWSPinpointTargetingEndpointResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingEndpointResponse class]];
}

- (void) test_AWSPinpointTargetingEndpointSendConfiguration {
    [self validateSecureCodingForClass:[AWSPinpointTargetingEndpointSendConfiguration class]];
}

- (void) test_AWSPinpointTargetingEndpointUser {
    [self validateSecureCodingForClass:[AWSPinpointTargetingEndpointUser class]];
}

- (void) test_AWSPinpointTargetingEndpointsResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingEndpointsResponse class]];
}

- (void) test_AWSPinpointTargetingEvent {
    [self validateSecureCodingForClass:[AWSPinpointTargetingEvent class]];
}

- (void) test_AWSPinpointTargetingEventCondition {
    [self validateSecureCodingForClass:[AWSPinpointTargetingEventCondition class]];
}

- (void) test_AWSPinpointTargetingEventDimensions {
    [self validateSecureCodingForClass:[AWSPinpointTargetingEventDimensions class]];
}

- (void) test_AWSPinpointTargetingEventFilter {
    [self validateSecureCodingForClass:[AWSPinpointTargetingEventFilter class]];
}

- (void) test_AWSPinpointTargetingEventItemResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingEventItemResponse class]];
}

- (void) test_AWSPinpointTargetingEventStartCondition {
    [self validateSecureCodingForClass:[AWSPinpointTargetingEventStartCondition class]];
}

- (void) test_AWSPinpointTargetingEventStream {
    [self validateSecureCodingForClass:[AWSPinpointTargetingEventStream class]];
}

- (void) test_AWSPinpointTargetingEventsBatch {
    [self validateSecureCodingForClass:[AWSPinpointTargetingEventsBatch class]];
}

- (void) test_AWSPinpointTargetingEventsRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingEventsRequest class]];
}

- (void) test_AWSPinpointTargetingEventsResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingEventsResponse class]];
}

- (void) test_AWSPinpointTargetingExportJobRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingExportJobRequest class]];
}

- (void) test_AWSPinpointTargetingExportJobResource {
    [self validateSecureCodingForClass:[AWSPinpointTargetingExportJobResource class]];
}

- (void) test_AWSPinpointTargetingExportJobResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingExportJobResponse class]];
}

- (void) test_AWSPinpointTargetingExportJobsResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingExportJobsResponse class]];
}

- (void) test_AWSPinpointTargetingGCMChannelRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingGCMChannelRequest class]];
}

- (void) test_AWSPinpointTargetingGCMChannelResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingGCMChannelResponse class]];
}

- (void) test_AWSPinpointTargetingGCMMessage {
    [self validateSecureCodingForClass:[AWSPinpointTargetingGCMMessage class]];
}

- (void) test_AWSPinpointTargetingGPSCoordinates {
    [self validateSecureCodingForClass:[AWSPinpointTargetingGPSCoordinates class]];
}

- (void) test_AWSPinpointTargetingGPSPointDimension {
    [self validateSecureCodingForClass:[AWSPinpointTargetingGPSPointDimension class]];
}

- (void) test_AWSPinpointTargetingGetAdmChannelRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingGetAdmChannelRequest class]];
}

- (void) test_AWSPinpointTargetingGetAdmChannelResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingGetAdmChannelResponse class]];
}

- (void) test_AWSPinpointTargetingGetApnsChannelRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingGetApnsChannelRequest class]];
}

- (void) test_AWSPinpointTargetingGetApnsChannelResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingGetApnsChannelResponse class]];
}

- (void) test_AWSPinpointTargetingGetApnsSandboxChannelRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingGetApnsSandboxChannelRequest class]];
}

- (void) test_AWSPinpointTargetingGetApnsSandboxChannelResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingGetApnsSandboxChannelResponse class]];
}

- (void) test_AWSPinpointTargetingGetApnsVoipChannelRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingGetApnsVoipChannelRequest class]];
}

- (void) test_AWSPinpointTargetingGetApnsVoipChannelResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingGetApnsVoipChannelResponse class]];
}

- (void) test_AWSPinpointTargetingGetApnsVoipSandboxChannelRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingGetApnsVoipSandboxChannelRequest class]];
}

- (void) test_AWSPinpointTargetingGetApnsVoipSandboxChannelResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingGetApnsVoipSandboxChannelResponse class]];
}

- (void) test_AWSPinpointTargetingGetAppRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingGetAppRequest class]];
}

- (void) test_AWSPinpointTargetingGetAppResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingGetAppResponse class]];
}

- (void) test_AWSPinpointTargetingGetApplicationDateRangeKpiRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingGetApplicationDateRangeKpiRequest class]];
}

- (void) test_AWSPinpointTargetingGetApplicationDateRangeKpiResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingGetApplicationDateRangeKpiResponse class]];
}

- (void) test_AWSPinpointTargetingGetApplicationSettingsRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingGetApplicationSettingsRequest class]];
}

- (void) test_AWSPinpointTargetingGetApplicationSettingsResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingGetApplicationSettingsResponse class]];
}

- (void) test_AWSPinpointTargetingGetAppsRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingGetAppsRequest class]];
}

- (void) test_AWSPinpointTargetingGetAppsResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingGetAppsResponse class]];
}

- (void) test_AWSPinpointTargetingGetBaiduChannelRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingGetBaiduChannelRequest class]];
}

- (void) test_AWSPinpointTargetingGetBaiduChannelResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingGetBaiduChannelResponse class]];
}

- (void) test_AWSPinpointTargetingGetCampaignActivitiesRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingGetCampaignActivitiesRequest class]];
}

- (void) test_AWSPinpointTargetingGetCampaignActivitiesResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingGetCampaignActivitiesResponse class]];
}

- (void) test_AWSPinpointTargetingGetCampaignDateRangeKpiRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingGetCampaignDateRangeKpiRequest class]];
}

- (void) test_AWSPinpointTargetingGetCampaignDateRangeKpiResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingGetCampaignDateRangeKpiResponse class]];
}

- (void) test_AWSPinpointTargetingGetCampaignRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingGetCampaignRequest class]];
}

- (void) test_AWSPinpointTargetingGetCampaignResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingGetCampaignResponse class]];
}

- (void) test_AWSPinpointTargetingGetCampaignVersionRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingGetCampaignVersionRequest class]];
}

- (void) test_AWSPinpointTargetingGetCampaignVersionResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingGetCampaignVersionResponse class]];
}

- (void) test_AWSPinpointTargetingGetCampaignVersionsRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingGetCampaignVersionsRequest class]];
}

- (void) test_AWSPinpointTargetingGetCampaignVersionsResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingGetCampaignVersionsResponse class]];
}

- (void) test_AWSPinpointTargetingGetCampaignsRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingGetCampaignsRequest class]];
}

- (void) test_AWSPinpointTargetingGetCampaignsResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingGetCampaignsResponse class]];
}

- (void) test_AWSPinpointTargetingGetChannelsRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingGetChannelsRequest class]];
}

- (void) test_AWSPinpointTargetingGetChannelsResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingGetChannelsResponse class]];
}

- (void) test_AWSPinpointTargetingGetEmailChannelRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingGetEmailChannelRequest class]];
}

- (void) test_AWSPinpointTargetingGetEmailChannelResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingGetEmailChannelResponse class]];
}

- (void) test_AWSPinpointTargetingGetEmailTemplateRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingGetEmailTemplateRequest class]];
}

- (void) test_AWSPinpointTargetingGetEmailTemplateResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingGetEmailTemplateResponse class]];
}

- (void) test_AWSPinpointTargetingGetEndpointRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingGetEndpointRequest class]];
}

- (void) test_AWSPinpointTargetingGetEndpointResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingGetEndpointResponse class]];
}

- (void) test_AWSPinpointTargetingGetEventStreamRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingGetEventStreamRequest class]];
}

- (void) test_AWSPinpointTargetingGetEventStreamResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingGetEventStreamResponse class]];
}

- (void) test_AWSPinpointTargetingGetExportJobRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingGetExportJobRequest class]];
}

- (void) test_AWSPinpointTargetingGetExportJobResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingGetExportJobResponse class]];
}

- (void) test_AWSPinpointTargetingGetExportJobsRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingGetExportJobsRequest class]];
}

- (void) test_AWSPinpointTargetingGetExportJobsResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingGetExportJobsResponse class]];
}

- (void) test_AWSPinpointTargetingGetGcmChannelRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingGetGcmChannelRequest class]];
}

- (void) test_AWSPinpointTargetingGetGcmChannelResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingGetGcmChannelResponse class]];
}

- (void) test_AWSPinpointTargetingGetImportJobRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingGetImportJobRequest class]];
}

- (void) test_AWSPinpointTargetingGetImportJobResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingGetImportJobResponse class]];
}

- (void) test_AWSPinpointTargetingGetImportJobsRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingGetImportJobsRequest class]];
}

- (void) test_AWSPinpointTargetingGetImportJobsResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingGetImportJobsResponse class]];
}

- (void) test_AWSPinpointTargetingGetInAppMessagesRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingGetInAppMessagesRequest class]];
}

- (void) test_AWSPinpointTargetingGetInAppMessagesResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingGetInAppMessagesResponse class]];
}

- (void) test_AWSPinpointTargetingGetInAppTemplateRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingGetInAppTemplateRequest class]];
}

- (void) test_AWSPinpointTargetingGetInAppTemplateResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingGetInAppTemplateResponse class]];
}

- (void) test_AWSPinpointTargetingGetJourneyDateRangeKpiRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingGetJourneyDateRangeKpiRequest class]];
}

- (void) test_AWSPinpointTargetingGetJourneyDateRangeKpiResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingGetJourneyDateRangeKpiResponse class]];
}

- (void) test_AWSPinpointTargetingGetJourneyExecutionActivityMetricsRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingGetJourneyExecutionActivityMetricsRequest class]];
}

- (void) test_AWSPinpointTargetingGetJourneyExecutionActivityMetricsResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingGetJourneyExecutionActivityMetricsResponse class]];
}

- (void) test_AWSPinpointTargetingGetJourneyExecutionMetricsRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingGetJourneyExecutionMetricsRequest class]];
}

- (void) test_AWSPinpointTargetingGetJourneyExecutionMetricsResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingGetJourneyExecutionMetricsResponse class]];
}

- (void) test_AWSPinpointTargetingGetJourneyRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingGetJourneyRequest class]];
}

- (void) test_AWSPinpointTargetingGetJourneyResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingGetJourneyResponse class]];
}

- (void) test_AWSPinpointTargetingGetJourneyRunExecutionActivityMetricsRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingGetJourneyRunExecutionActivityMetricsRequest class]];
}

- (void) test_AWSPinpointTargetingGetJourneyRunExecutionActivityMetricsResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingGetJourneyRunExecutionActivityMetricsResponse class]];
}

- (void) test_AWSPinpointTargetingGetJourneyRunExecutionMetricsRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingGetJourneyRunExecutionMetricsRequest class]];
}

- (void) test_AWSPinpointTargetingGetJourneyRunExecutionMetricsResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingGetJourneyRunExecutionMetricsResponse class]];
}

- (void) test_AWSPinpointTargetingGetJourneyRunsRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingGetJourneyRunsRequest class]];
}

- (void) test_AWSPinpointTargetingGetJourneyRunsResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingGetJourneyRunsResponse class]];
}

- (void) test_AWSPinpointTargetingGetPushTemplateRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingGetPushTemplateRequest class]];
}

- (void) test_AWSPinpointTargetingGetPushTemplateResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingGetPushTemplateResponse class]];
}

- (void) test_AWSPinpointTargetingGetRecommenderConfigurationRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingGetRecommenderConfigurationRequest class]];
}

- (void) test_AWSPinpointTargetingGetRecommenderConfigurationResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingGetRecommenderConfigurationResponse class]];
}

- (void) test_AWSPinpointTargetingGetRecommenderConfigurationsRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingGetRecommenderConfigurationsRequest class]];
}

- (void) test_AWSPinpointTargetingGetRecommenderConfigurationsResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingGetRecommenderConfigurationsResponse class]];
}

- (void) test_AWSPinpointTargetingGetSegmentExportJobsRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingGetSegmentExportJobsRequest class]];
}

- (void) test_AWSPinpointTargetingGetSegmentExportJobsResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingGetSegmentExportJobsResponse class]];
}

- (void) test_AWSPinpointTargetingGetSegmentImportJobsRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingGetSegmentImportJobsRequest class]];
}

- (void) test_AWSPinpointTargetingGetSegmentImportJobsResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingGetSegmentImportJobsResponse class]];
}

- (void) test_AWSPinpointTargetingGetSegmentRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingGetSegmentRequest class]];
}

- (void) test_AWSPinpointTargetingGetSegmentResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingGetSegmentResponse class]];
}

- (void) test_AWSPinpointTargetingGetSegmentVersionRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingGetSegmentVersionRequest class]];
}

- (void) test_AWSPinpointTargetingGetSegmentVersionResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingGetSegmentVersionResponse class]];
}

- (void) test_AWSPinpointTargetingGetSegmentVersionsRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingGetSegmentVersionsRequest class]];
}

- (void) test_AWSPinpointTargetingGetSegmentVersionsResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingGetSegmentVersionsResponse class]];
}

- (void) test_AWSPinpointTargetingGetSegmentsRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingGetSegmentsRequest class]];
}

- (void) test_AWSPinpointTargetingGetSegmentsResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingGetSegmentsResponse class]];
}

- (void) test_AWSPinpointTargetingGetSmsChannelRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingGetSmsChannelRequest class]];
}

- (void) test_AWSPinpointTargetingGetSmsChannelResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingGetSmsChannelResponse class]];
}

- (void) test_AWSPinpointTargetingGetSmsTemplateRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingGetSmsTemplateRequest class]];
}

- (void) test_AWSPinpointTargetingGetSmsTemplateResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingGetSmsTemplateResponse class]];
}

- (void) test_AWSPinpointTargetingGetUserEndpointsRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingGetUserEndpointsRequest class]];
}

- (void) test_AWSPinpointTargetingGetUserEndpointsResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingGetUserEndpointsResponse class]];
}

- (void) test_AWSPinpointTargetingGetVoiceChannelRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingGetVoiceChannelRequest class]];
}

- (void) test_AWSPinpointTargetingGetVoiceChannelResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingGetVoiceChannelResponse class]];
}

- (void) test_AWSPinpointTargetingGetVoiceTemplateRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingGetVoiceTemplateRequest class]];
}

- (void) test_AWSPinpointTargetingGetVoiceTemplateResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingGetVoiceTemplateResponse class]];
}

- (void) test_AWSPinpointTargetingHoldoutActivity {
    [self validateSecureCodingForClass:[AWSPinpointTargetingHoldoutActivity class]];
}

- (void) test_AWSPinpointTargetingImportJobRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingImportJobRequest class]];
}

- (void) test_AWSPinpointTargetingImportJobResource {
    [self validateSecureCodingForClass:[AWSPinpointTargetingImportJobResource class]];
}

- (void) test_AWSPinpointTargetingImportJobResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingImportJobResponse class]];
}

- (void) test_AWSPinpointTargetingImportJobsResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingImportJobsResponse class]];
}

- (void) test_AWSPinpointTargetingInAppCampaignSchedule {
    [self validateSecureCodingForClass:[AWSPinpointTargetingInAppCampaignSchedule class]];
}

- (void) test_AWSPinpointTargetingInAppMessage {
    [self validateSecureCodingForClass:[AWSPinpointTargetingInAppMessage class]];
}

- (void) test_AWSPinpointTargetingInAppMessageBodyConfig {
    [self validateSecureCodingForClass:[AWSPinpointTargetingInAppMessageBodyConfig class]];
}

- (void) test_AWSPinpointTargetingInAppMessageButton {
    [self validateSecureCodingForClass:[AWSPinpointTargetingInAppMessageButton class]];
}

- (void) test_AWSPinpointTargetingInAppMessageCampaign {
    [self validateSecureCodingForClass:[AWSPinpointTargetingInAppMessageCampaign class]];
}

- (void) test_AWSPinpointTargetingInAppMessageContent {
    [self validateSecureCodingForClass:[AWSPinpointTargetingInAppMessageContent class]];
}

- (void) test_AWSPinpointTargetingInAppMessageHeaderConfig {
    [self validateSecureCodingForClass:[AWSPinpointTargetingInAppMessageHeaderConfig class]];
}

- (void) test_AWSPinpointTargetingInAppMessagesResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingInAppMessagesResponse class]];
}

- (void) test_AWSPinpointTargetingInAppTemplateRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingInAppTemplateRequest class]];
}

- (void) test_AWSPinpointTargetingInAppTemplateResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingInAppTemplateResponse class]];
}

- (void) test_AWSPinpointTargetingItemResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingItemResponse class]];
}

- (void) test_AWSPinpointTargetingJourneyCustomMessage {
    [self validateSecureCodingForClass:[AWSPinpointTargetingJourneyCustomMessage class]];
}

- (void) test_AWSPinpointTargetingJourneyDateRangeKpiResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingJourneyDateRangeKpiResponse class]];
}

- (void) test_AWSPinpointTargetingJourneyEmailMessage {
    [self validateSecureCodingForClass:[AWSPinpointTargetingJourneyEmailMessage class]];
}

- (void) test_AWSPinpointTargetingJourneyExecutionActivityMetricsResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingJourneyExecutionActivityMetricsResponse class]];
}

- (void) test_AWSPinpointTargetingJourneyExecutionMetricsResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingJourneyExecutionMetricsResponse class]];
}

- (void) test_AWSPinpointTargetingJourneyLimits {
    [self validateSecureCodingForClass:[AWSPinpointTargetingJourneyLimits class]];
}

- (void) test_AWSPinpointTargetingJourneyPushMessage {
    [self validateSecureCodingForClass:[AWSPinpointTargetingJourneyPushMessage class]];
}

- (void) test_AWSPinpointTargetingJourneyChannelSettings {
    [self validateSecureCodingForClass:[AWSPinpointTargetingJourneyChannelSettings class]];
}

- (void) test_AWSPinpointTargetingJourneyResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingJourneyResponse class]];
}

- (void) test_AWSPinpointTargetingJourneyRunExecutionActivityMetricsResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingJourneyRunExecutionActivityMetricsResponse class]];
}

- (void) test_AWSPinpointTargetingJourneyRunExecutionMetricsResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingJourneyRunExecutionMetricsResponse class]];
}

- (void) test_AWSPinpointTargetingJourneyRunResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingJourneyRunResponse class]];
}

- (void) test_AWSPinpointTargetingJourneyRunsResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingJourneyRunsResponse class]];
}

- (void) test_AWSPinpointTargetingJourneySMSMessage {
    [self validateSecureCodingForClass:[AWSPinpointTargetingJourneySMSMessage class]];
}

- (void) test_AWSPinpointTargetingJourneySchedule {
    [self validateSecureCodingForClass:[AWSPinpointTargetingJourneySchedule class]];
}

- (void) test_AWSPinpointTargetingJourneyStateRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingJourneyStateRequest class]];
}

- (void) test_AWSPinpointTargetingJourneyTimeframeCap {
    [self validateSecureCodingForClass:[AWSPinpointTargetingJourneyTimeframeCap class]];
}

- (void) test_AWSPinpointTargetingJourneysResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingJourneysResponse class]];
}

- (void) test_AWSPinpointTargetingListJourneysRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingListJourneysRequest class]];
}

- (void) test_AWSPinpointTargetingListJourneysResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingListJourneysResponse class]];
}

- (void) test_AWSPinpointTargetingListRecommenderConfigurationsResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingListRecommenderConfigurationsResponse class]];
}

- (void) test_AWSPinpointTargetingListTagsForResourceRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingListTagsForResourceRequest class]];
}

- (void) test_AWSPinpointTargetingListTagsForResourceResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingListTagsForResourceResponse class]];
}

- (void) test_AWSPinpointTargetingListTemplateVersionsRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingListTemplateVersionsRequest class]];
}

- (void) test_AWSPinpointTargetingListTemplateVersionsResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingListTemplateVersionsResponse class]];
}

- (void) test_AWSPinpointTargetingListTemplatesRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingListTemplatesRequest class]];
}

- (void) test_AWSPinpointTargetingListTemplatesResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingListTemplatesResponse class]];
}

- (void) test_AWSPinpointTargetingMessage {
    [self validateSecureCodingForClass:[AWSPinpointTargetingMessage class]];
}

- (void) test_AWSPinpointTargetingMessageBody {
    [self validateSecureCodingForClass:[AWSPinpointTargetingMessageBody class]];
}

- (void) test_AWSPinpointTargetingMessageConfiguration {
    [self validateSecureCodingForClass:[AWSPinpointTargetingMessageConfiguration class]];
}

- (void) test_AWSPinpointTargetingMessageRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingMessageRequest class]];
}

- (void) test_AWSPinpointTargetingMessageResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingMessageResponse class]];
}

- (void) test_AWSPinpointTargetingMessageResult {
    [self validateSecureCodingForClass:[AWSPinpointTargetingMessageResult class]];
}

- (void) test_AWSPinpointTargetingMetricDimension {
    [self validateSecureCodingForClass:[AWSPinpointTargetingMetricDimension class]];
}

- (void) test_AWSPinpointTargetingMultiConditionalBranch {
    [self validateSecureCodingForClass:[AWSPinpointTargetingMultiConditionalBranch class]];
}

- (void) test_AWSPinpointTargetingMultiConditionalSplitActivity {
    [self validateSecureCodingForClass:[AWSPinpointTargetingMultiConditionalSplitActivity class]];
}

- (void) test_AWSPinpointTargetingNumberValidateRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingNumberValidateRequest class]];
}

- (void) test_AWSPinpointTargetingNumberValidateResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingNumberValidateResponse class]];
}

- (void) test_AWSPinpointTargetingOverrideButtonConfiguration {
    [self validateSecureCodingForClass:[AWSPinpointTargetingOverrideButtonConfiguration class]];
}

- (void) test_AWSPinpointTargetingPhoneNumberValidateRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingPhoneNumberValidateRequest class]];
}

- (void) test_AWSPinpointTargetingPhoneNumberValidateResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingPhoneNumberValidateResponse class]];
}

- (void) test_AWSPinpointTargetingPublicEndpoint {
    [self validateSecureCodingForClass:[AWSPinpointTargetingPublicEndpoint class]];
}

- (void) test_AWSPinpointTargetingPushMessageActivity {
    [self validateSecureCodingForClass:[AWSPinpointTargetingPushMessageActivity class]];
}

- (void) test_AWSPinpointTargetingPushNotificationTemplateRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingPushNotificationTemplateRequest class]];
}

- (void) test_AWSPinpointTargetingPushNotificationTemplateResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingPushNotificationTemplateResponse class]];
}

- (void) test_AWSPinpointTargetingPutEventStreamRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingPutEventStreamRequest class]];
}

- (void) test_AWSPinpointTargetingPutEventStreamResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingPutEventStreamResponse class]];
}

- (void) test_AWSPinpointTargetingPutEventsRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingPutEventsRequest class]];
}

- (void) test_AWSPinpointTargetingPutEventsResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingPutEventsResponse class]];
}

- (void) test_AWSPinpointTargetingQuietTime {
    [self validateSecureCodingForClass:[AWSPinpointTargetingQuietTime class]];
}

- (void) test_AWSPinpointTargetingRandomSplitActivity {
    [self validateSecureCodingForClass:[AWSPinpointTargetingRandomSplitActivity class]];
}

- (void) test_AWSPinpointTargetingRandomSplitEntry {
    [self validateSecureCodingForClass:[AWSPinpointTargetingRandomSplitEntry class]];
}

- (void) test_AWSPinpointTargetingRawEmail {
    [self validateSecureCodingForClass:[AWSPinpointTargetingRawEmail class]];
}

- (void) test_AWSPinpointTargetingRecencyDimension {
    [self validateSecureCodingForClass:[AWSPinpointTargetingRecencyDimension class]];
}

- (void) test_AWSPinpointTargetingRecommenderConfigurationResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingRecommenderConfigurationResponse class]];
}

- (void) test_AWSPinpointTargetingRemoveAttributesRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingRemoveAttributesRequest class]];
}

- (void) test_AWSPinpointTargetingRemoveAttributesResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingRemoveAttributesResponse class]];
}

- (void) test_AWSPinpointTargetingResultRow {
    [self validateSecureCodingForClass:[AWSPinpointTargetingResultRow class]];
}

- (void) test_AWSPinpointTargetingResultRowValue {
    [self validateSecureCodingForClass:[AWSPinpointTargetingResultRowValue class]];
}

- (void) test_AWSPinpointTargetingSMSChannelRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingSMSChannelRequest class]];
}

- (void) test_AWSPinpointTargetingSMSChannelResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingSMSChannelResponse class]];
}

- (void) test_AWSPinpointTargetingSMSMessage {
    [self validateSecureCodingForClass:[AWSPinpointTargetingSMSMessage class]];
}

- (void) test_AWSPinpointTargetingSMSMessageActivity {
    [self validateSecureCodingForClass:[AWSPinpointTargetingSMSMessageActivity class]];
}

- (void) test_AWSPinpointTargetingSMSTemplateRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingSMSTemplateRequest class]];
}

- (void) test_AWSPinpointTargetingSMSTemplateResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingSMSTemplateResponse class]];
}

- (void) test_AWSPinpointTargetingSchedule {
    [self validateSecureCodingForClass:[AWSPinpointTargetingSchedule class]];
}

- (void) test_AWSPinpointTargetingSegmentBehaviors {
    [self validateSecureCodingForClass:[AWSPinpointTargetingSegmentBehaviors class]];
}

- (void) test_AWSPinpointTargetingSegmentCondition {
    [self validateSecureCodingForClass:[AWSPinpointTargetingSegmentCondition class]];
}

- (void) test_AWSPinpointTargetingSegmentDemographics {
    [self validateSecureCodingForClass:[AWSPinpointTargetingSegmentDemographics class]];
}

- (void) test_AWSPinpointTargetingSegmentDimensions {
    [self validateSecureCodingForClass:[AWSPinpointTargetingSegmentDimensions class]];
}

- (void) test_AWSPinpointTargetingSegmentGroup {
    [self validateSecureCodingForClass:[AWSPinpointTargetingSegmentGroup class]];
}

- (void) test_AWSPinpointTargetingSegmentGroupList {
    [self validateSecureCodingForClass:[AWSPinpointTargetingSegmentGroupList class]];
}

- (void) test_AWSPinpointTargetingSegmentImportResource {
    [self validateSecureCodingForClass:[AWSPinpointTargetingSegmentImportResource class]];
}

- (void) test_AWSPinpointTargetingSegmentLocation {
    [self validateSecureCodingForClass:[AWSPinpointTargetingSegmentLocation class]];
}

- (void) test_AWSPinpointTargetingSegmentReference {
    [self validateSecureCodingForClass:[AWSPinpointTargetingSegmentReference class]];
}

- (void) test_AWSPinpointTargetingSegmentResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingSegmentResponse class]];
}

- (void) test_AWSPinpointTargetingSegmentsResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingSegmentsResponse class]];
}

- (void) test_AWSPinpointTargetingSendMessagesRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingSendMessagesRequest class]];
}

- (void) test_AWSPinpointTargetingSendMessagesResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingSendMessagesResponse class]];
}

- (void) test_AWSPinpointTargetingSendOTPMessageRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingSendOTPMessageRequest class]];
}

- (void) test_AWSPinpointTargetingSendOTPMessageRequestParameters {
    [self validateSecureCodingForClass:[AWSPinpointTargetingSendOTPMessageRequestParameters class]];
}

- (void) test_AWSPinpointTargetingSendOTPMessageResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingSendOTPMessageResponse class]];
}

- (void) test_AWSPinpointTargetingSendUsersMessageRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingSendUsersMessageRequest class]];
}

- (void) test_AWSPinpointTargetingSendUsersMessageResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingSendUsersMessageResponse class]];
}

- (void) test_AWSPinpointTargetingSendUsersMessagesRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingSendUsersMessagesRequest class]];
}

- (void) test_AWSPinpointTargetingSendUsersMessagesResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingSendUsersMessagesResponse class]];
}

- (void) test_AWSPinpointTargetingSession {
    [self validateSecureCodingForClass:[AWSPinpointTargetingSession class]];
}

- (void) test_AWSPinpointTargetingSetDimension {
    [self validateSecureCodingForClass:[AWSPinpointTargetingSetDimension class]];
}

- (void) test_AWSPinpointTargetingSimpleCondition {
    [self validateSecureCodingForClass:[AWSPinpointTargetingSimpleCondition class]];
}

- (void) test_AWSPinpointTargetingSimpleEmail {
    [self validateSecureCodingForClass:[AWSPinpointTargetingSimpleEmail class]];
}

- (void) test_AWSPinpointTargetingSimpleEmailPart {
    [self validateSecureCodingForClass:[AWSPinpointTargetingSimpleEmailPart class]];
}

- (void) test_AWSPinpointTargetingStartCondition {
    [self validateSecureCodingForClass:[AWSPinpointTargetingStartCondition class]];
}

- (void) test_AWSPinpointTargetingTagResourceRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingTagResourceRequest class]];
}

- (void) test_AWSPinpointTargetingTagsModel {
    [self validateSecureCodingForClass:[AWSPinpointTargetingTagsModel class]];
}

- (void) test_AWSPinpointTargetingTemplate {
    [self validateSecureCodingForClass:[AWSPinpointTargetingTemplate class]];
}

- (void) test_AWSPinpointTargetingTemplateActiveVersionRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingTemplateActiveVersionRequest class]];
}

- (void) test_AWSPinpointTargetingTemplateConfiguration {
    [self validateSecureCodingForClass:[AWSPinpointTargetingTemplateConfiguration class]];
}

- (void) test_AWSPinpointTargetingTemplateCreateMessageBody {
    [self validateSecureCodingForClass:[AWSPinpointTargetingTemplateCreateMessageBody class]];
}

- (void) test_AWSPinpointTargetingTemplateResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingTemplateResponse class]];
}

- (void) test_AWSPinpointTargetingTemplateVersionResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingTemplateVersionResponse class]];
}

- (void) test_AWSPinpointTargetingTemplateVersionsResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingTemplateVersionsResponse class]];
}

- (void) test_AWSPinpointTargetingTemplatesResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingTemplatesResponse class]];
}

- (void) test_AWSPinpointTargetingTreatmentResource {
    [self validateSecureCodingForClass:[AWSPinpointTargetingTreatmentResource class]];
}

- (void) test_AWSPinpointTargetingUntagResourceRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingUntagResourceRequest class]];
}

- (void) test_AWSPinpointTargetingUpdateAdmChannelRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingUpdateAdmChannelRequest class]];
}

- (void) test_AWSPinpointTargetingUpdateAdmChannelResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingUpdateAdmChannelResponse class]];
}

- (void) test_AWSPinpointTargetingUpdateApnsChannelRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingUpdateApnsChannelRequest class]];
}

- (void) test_AWSPinpointTargetingUpdateApnsChannelResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingUpdateApnsChannelResponse class]];
}

- (void) test_AWSPinpointTargetingUpdateApnsSandboxChannelRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingUpdateApnsSandboxChannelRequest class]];
}

- (void) test_AWSPinpointTargetingUpdateApnsSandboxChannelResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingUpdateApnsSandboxChannelResponse class]];
}

- (void) test_AWSPinpointTargetingUpdateApnsVoipChannelRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingUpdateApnsVoipChannelRequest class]];
}

- (void) test_AWSPinpointTargetingUpdateApnsVoipChannelResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingUpdateApnsVoipChannelResponse class]];
}

- (void) test_AWSPinpointTargetingUpdateApnsVoipSandboxChannelRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingUpdateApnsVoipSandboxChannelRequest class]];
}

- (void) test_AWSPinpointTargetingUpdateApnsVoipSandboxChannelResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingUpdateApnsVoipSandboxChannelResponse class]];
}

- (void) test_AWSPinpointTargetingUpdateApplicationSettingsRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingUpdateApplicationSettingsRequest class]];
}

- (void) test_AWSPinpointTargetingUpdateApplicationSettingsResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingUpdateApplicationSettingsResponse class]];
}

- (void) test_AWSPinpointTargetingUpdateAttributesRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingUpdateAttributesRequest class]];
}

- (void) test_AWSPinpointTargetingUpdateBaiduChannelRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingUpdateBaiduChannelRequest class]];
}

- (void) test_AWSPinpointTargetingUpdateBaiduChannelResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingUpdateBaiduChannelResponse class]];
}

- (void) test_AWSPinpointTargetingUpdateCampaignRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingUpdateCampaignRequest class]];
}

- (void) test_AWSPinpointTargetingUpdateCampaignResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingUpdateCampaignResponse class]];
}

- (void) test_AWSPinpointTargetingUpdateEmailChannelRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingUpdateEmailChannelRequest class]];
}

- (void) test_AWSPinpointTargetingUpdateEmailChannelResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingUpdateEmailChannelResponse class]];
}

- (void) test_AWSPinpointTargetingUpdateEmailTemplateRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingUpdateEmailTemplateRequest class]];
}

- (void) test_AWSPinpointTargetingUpdateEmailTemplateResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingUpdateEmailTemplateResponse class]];
}

- (void) test_AWSPinpointTargetingUpdateEndpointRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingUpdateEndpointRequest class]];
}

- (void) test_AWSPinpointTargetingUpdateEndpointResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingUpdateEndpointResponse class]];
}

- (void) test_AWSPinpointTargetingUpdateEndpointsBatchRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingUpdateEndpointsBatchRequest class]];
}

- (void) test_AWSPinpointTargetingUpdateEndpointsBatchResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingUpdateEndpointsBatchResponse class]];
}

- (void) test_AWSPinpointTargetingUpdateGcmChannelRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingUpdateGcmChannelRequest class]];
}

- (void) test_AWSPinpointTargetingUpdateGcmChannelResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingUpdateGcmChannelResponse class]];
}

- (void) test_AWSPinpointTargetingUpdateInAppTemplateRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingUpdateInAppTemplateRequest class]];
}

- (void) test_AWSPinpointTargetingUpdateInAppTemplateResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingUpdateInAppTemplateResponse class]];
}

- (void) test_AWSPinpointTargetingUpdateJourneyRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingUpdateJourneyRequest class]];
}

- (void) test_AWSPinpointTargetingUpdateJourneyResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingUpdateJourneyResponse class]];
}

- (void) test_AWSPinpointTargetingUpdateJourneyStateRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingUpdateJourneyStateRequest class]];
}

- (void) test_AWSPinpointTargetingUpdateJourneyStateResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingUpdateJourneyStateResponse class]];
}

- (void) test_AWSPinpointTargetingUpdatePushTemplateRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingUpdatePushTemplateRequest class]];
}

- (void) test_AWSPinpointTargetingUpdatePushTemplateResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingUpdatePushTemplateResponse class]];
}

- (void) test_AWSPinpointTargetingUpdateRecommenderConfiguration {
    [self validateSecureCodingForClass:[AWSPinpointTargetingUpdateRecommenderConfiguration class]];
}

- (void) test_AWSPinpointTargetingUpdateRecommenderConfigurationRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingUpdateRecommenderConfigurationRequest class]];
}

- (void) test_AWSPinpointTargetingUpdateRecommenderConfigurationResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingUpdateRecommenderConfigurationResponse class]];
}

- (void) test_AWSPinpointTargetingUpdateSegmentRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingUpdateSegmentRequest class]];
}

- (void) test_AWSPinpointTargetingUpdateSegmentResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingUpdateSegmentResponse class]];
}

- (void) test_AWSPinpointTargetingUpdateSmsChannelRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingUpdateSmsChannelRequest class]];
}

- (void) test_AWSPinpointTargetingUpdateSmsChannelResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingUpdateSmsChannelResponse class]];
}

- (void) test_AWSPinpointTargetingUpdateSmsTemplateRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingUpdateSmsTemplateRequest class]];
}

- (void) test_AWSPinpointTargetingUpdateSmsTemplateResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingUpdateSmsTemplateResponse class]];
}

- (void) test_AWSPinpointTargetingUpdateTemplateActiveVersionRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingUpdateTemplateActiveVersionRequest class]];
}

- (void) test_AWSPinpointTargetingUpdateTemplateActiveVersionResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingUpdateTemplateActiveVersionResponse class]];
}

- (void) test_AWSPinpointTargetingUpdateVoiceChannelRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingUpdateVoiceChannelRequest class]];
}

- (void) test_AWSPinpointTargetingUpdateVoiceChannelResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingUpdateVoiceChannelResponse class]];
}

- (void) test_AWSPinpointTargetingUpdateVoiceTemplateRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingUpdateVoiceTemplateRequest class]];
}

- (void) test_AWSPinpointTargetingUpdateVoiceTemplateResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingUpdateVoiceTemplateResponse class]];
}

- (void) test_AWSPinpointTargetingVerificationResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingVerificationResponse class]];
}

- (void) test_AWSPinpointTargetingVerifyOTPMessageRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingVerifyOTPMessageRequest class]];
}

- (void) test_AWSPinpointTargetingVerifyOTPMessageRequestParameters {
    [self validateSecureCodingForClass:[AWSPinpointTargetingVerifyOTPMessageRequestParameters class]];
}

- (void) test_AWSPinpointTargetingVerifyOTPMessageResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingVerifyOTPMessageResponse class]];
}

- (void) test_AWSPinpointTargetingVoiceChannelRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingVoiceChannelRequest class]];
}

- (void) test_AWSPinpointTargetingVoiceChannelResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingVoiceChannelResponse class]];
}

- (void) test_AWSPinpointTargetingVoiceMessage {
    [self validateSecureCodingForClass:[AWSPinpointTargetingVoiceMessage class]];
}

- (void) test_AWSPinpointTargetingVoiceTemplateRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingVoiceTemplateRequest class]];
}

- (void) test_AWSPinpointTargetingVoiceTemplateResponse {
    [self validateSecureCodingForClass:[AWSPinpointTargetingVoiceTemplateResponse class]];
}

- (void) test_AWSPinpointTargetingWaitActivity {
    [self validateSecureCodingForClass:[AWSPinpointTargetingWaitActivity class]];
}

- (void) test_AWSPinpointTargetingWaitTime {
    [self validateSecureCodingForClass:[AWSPinpointTargetingWaitTime class]];
}

- (void) test_AWSPinpointTargetingWriteApplicationSettingsRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingWriteApplicationSettingsRequest class]];
}

- (void) test_AWSPinpointTargetingWriteCampaignRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingWriteCampaignRequest class]];
}

- (void) test_AWSPinpointTargetingWriteEventStream {
    [self validateSecureCodingForClass:[AWSPinpointTargetingWriteEventStream class]];
}

- (void) test_AWSPinpointTargetingWriteJourneyRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingWriteJourneyRequest class]];
}

- (void) test_AWSPinpointTargetingWriteSegmentRequest {
    [self validateSecureCodingForClass:[AWSPinpointTargetingWriteSegmentRequest class]];
}

- (void) test_AWSPinpointTargetingWriteTreatmentResource {
    [self validateSecureCodingForClass:[AWSPinpointTargetingWriteTreatmentResource class]];
}

- (void) test_AWSPinpointTargetingOpenHoursRule {
    [self validateSecureCodingForClass:[AWSPinpointTargetingOpenHoursRule class]];
}

- (void) test_AWSPinpointTargetingOpenHours {
    [self validateSecureCodingForClass:[AWSPinpointTargetingOpenHours class]];
}

- (void) test_AWSPinpointTargetingClosedDaysRule {
    [self validateSecureCodingForClass:[AWSPinpointTargetingClosedDaysRule class]];
}

- (void) test_AWSPinpointTargetingClosedDays {
    [self validateSecureCodingForClass:[AWSPinpointTargetingClosedDays class]];
}

@end

