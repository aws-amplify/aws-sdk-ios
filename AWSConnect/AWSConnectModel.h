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

#import <Foundation/Foundation.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSModel.h>

NS_ASSUME_NONNULL_BEGIN

FOUNDATION_EXPORT NSString *const AWSConnectErrorDomain;

typedef NS_ENUM(NSInteger, AWSConnectErrorType) {
    AWSConnectErrorUnknown,
    AWSConnectErrorAccessDenied,
    AWSConnectErrorContactFlowNotPublished,
    AWSConnectErrorContactNotFound,
    AWSConnectErrorDestinationNotAllowed,
    AWSConnectErrorDuplicateResource,
    AWSConnectErrorIdempotency,
    AWSConnectErrorInternalService,
    AWSConnectErrorInvalidContactFlow,
    AWSConnectErrorInvalidContactFlowModule,
    AWSConnectErrorInvalidParameter,
    AWSConnectErrorInvalidRequest,
    AWSConnectErrorLimitExceeded,
    AWSConnectErrorOutboundContactNotPermitted,
    AWSConnectErrorPropertyValidation,
    AWSConnectErrorResourceConflict,
    AWSConnectErrorResourceInUse,
    AWSConnectErrorResourceNotFound,
    AWSConnectErrorResourceNotReady,
    AWSConnectErrorServiceQuotaExceeded,
    AWSConnectErrorThrottling,
    AWSConnectErrorUserNotFound,
};

typedef NS_ENUM(NSInteger, AWSConnectActionType) {
    AWSConnectActionTypeUnknown,
    AWSConnectActionTypeCreateTask,
    AWSConnectActionTypeAssignContactCategory,
    AWSConnectActionTypeGenerateEventbridgeEvent,
    AWSConnectActionTypeSendNotification,
};

typedef NS_ENUM(NSInteger, AWSConnectAgentStatusState) {
    AWSConnectAgentStatusStateUnknown,
    AWSConnectAgentStatusStateEnabled,
    AWSConnectAgentStatusStateDisabled,
};

typedef NS_ENUM(NSInteger, AWSConnectAgentStatusType) {
    AWSConnectAgentStatusTypeUnknown,
    AWSConnectAgentStatusTypeRoutable,
    AWSConnectAgentStatusTypeCustom,
    AWSConnectAgentStatusTypeOffline,
};

typedef NS_ENUM(NSInteger, AWSConnectBehaviorType) {
    AWSConnectBehaviorTypeUnknown,
    AWSConnectBehaviorTypeRouteCurrentChannelOnly,
    AWSConnectBehaviorTypeRouteAnyChannel,
};

typedef NS_ENUM(NSInteger, AWSConnectChannel) {
    AWSConnectChannelUnknown,
    AWSConnectChannelVoice,
    AWSConnectChannelChat,
    AWSConnectChannelTask,
};

typedef NS_ENUM(NSInteger, AWSConnectComparison) {
    AWSConnectComparisonUnknown,
    AWSConnectComparisonLT,
};

typedef NS_ENUM(NSInteger, AWSConnectContactFlowModuleState) {
    AWSConnectContactFlowModuleStateUnknown,
    AWSConnectContactFlowModuleStateActive,
    AWSConnectContactFlowModuleStateArchived,
};

typedef NS_ENUM(NSInteger, AWSConnectContactFlowModuleStatus) {
    AWSConnectContactFlowModuleStatusUnknown,
    AWSConnectContactFlowModuleStatusPublished,
    AWSConnectContactFlowModuleStatusSaved,
};

typedef NS_ENUM(NSInteger, AWSConnectContactFlowState) {
    AWSConnectContactFlowStateUnknown,
    AWSConnectContactFlowStateActive,
    AWSConnectContactFlowStateArchived,
};

typedef NS_ENUM(NSInteger, AWSConnectContactFlowType) {
    AWSConnectContactFlowTypeUnknown,
    AWSConnectContactFlowTypeContactFlow,
    AWSConnectContactFlowTypeCustomerQueue,
    AWSConnectContactFlowTypeCustomerHold,
    AWSConnectContactFlowTypeCustomerWhisper,
    AWSConnectContactFlowTypeAgentHold,
    AWSConnectContactFlowTypeAgentWhisper,
    AWSConnectContactFlowTypeOutboundWhisper,
    AWSConnectContactFlowTypeAgentTransfer,
    AWSConnectContactFlowTypeQueueTransfer,
};

typedef NS_ENUM(NSInteger, AWSConnectContactInitiationMethod) {
    AWSConnectContactInitiationMethodUnknown,
    AWSConnectContactInitiationMethodInbound,
    AWSConnectContactInitiationMethodOutbound,
    AWSConnectContactInitiationMethodTransfer,
    AWSConnectContactInitiationMethodQueueTransfer,
    AWSConnectContactInitiationMethodCallback,
    AWSConnectContactInitiationMethodApi,
    AWSConnectContactInitiationMethodDisconnect,
    AWSConnectContactInitiationMethodMonitor,
    AWSConnectContactInitiationMethodExternalOutbound,
};

typedef NS_ENUM(NSInteger, AWSConnectContactState) {
    AWSConnectContactStateUnknown,
    AWSConnectContactStateIncoming,
    AWSConnectContactStatePending,
    AWSConnectContactStateConnecting,
    AWSConnectContactStateConnected,
    AWSConnectContactStateConnectedOnhold,
    AWSConnectContactStateMissed,
    AWSConnectContactStateError,
    AWSConnectContactStateEnded,
    AWSConnectContactStateRejected,
};

typedef NS_ENUM(NSInteger, AWSConnectCurrentMetricName) {
    AWSConnectCurrentMetricNameUnknown,
    AWSConnectCurrentMetricNameAgentsOnline,
    AWSConnectCurrentMetricNameAgentsAvailable,
    AWSConnectCurrentMetricNameAgentsOnCall,
    AWSConnectCurrentMetricNameAgentsNonProductive,
    AWSConnectCurrentMetricNameAgentsAfterContactWork,
    AWSConnectCurrentMetricNameAgentsError,
    AWSConnectCurrentMetricNameAgentsStaffed,
    AWSConnectCurrentMetricNameContactsInQueue,
    AWSConnectCurrentMetricNameOldestContactAge,
    AWSConnectCurrentMetricNameContactsScheduled,
    AWSConnectCurrentMetricNameAgentsOnContact,
    AWSConnectCurrentMetricNameSlotsActive,
    AWSConnectCurrentMetricNameSlotsAvailable,
};

typedef NS_ENUM(NSInteger, AWSConnectDirectoryType) {
    AWSConnectDirectoryTypeUnknown,
    AWSConnectDirectoryTypeSaml,
    AWSConnectDirectoryTypeConnectManaged,
    AWSConnectDirectoryTypeExistingDirectory,
};

typedef NS_ENUM(NSInteger, AWSConnectEncryptionType) {
    AWSConnectEncryptionTypeUnknown,
    AWSConnectEncryptionTypeKms,
};

typedef NS_ENUM(NSInteger, AWSConnectEvaluationFormQuestionType) {
    AWSConnectEvaluationFormQuestionTypeUnknown,
    AWSConnectEvaluationFormQuestionTypeText,
    AWSConnectEvaluationFormQuestionTypeSingleselect,
    AWSConnectEvaluationFormQuestionTypeNumeric,
};

typedef NS_ENUM(NSInteger, AWSConnectEvaluationFormScoringMode) {
    AWSConnectEvaluationFormScoringModeUnknown,
    AWSConnectEvaluationFormScoringModeQuestionOnly,
    AWSConnectEvaluationFormScoringModeSectionOnly,
};

typedef NS_ENUM(NSInteger, AWSConnectEvaluationFormScoringStatus) {
    AWSConnectEvaluationFormScoringStatusUnknown,
    AWSConnectEvaluationFormScoringStatusEnabled,
    AWSConnectEvaluationFormScoringStatusDisabled,
};

typedef NS_ENUM(NSInteger, AWSConnectEvaluationFormSingleSelectQuestionDisplayMode) {
    AWSConnectEvaluationFormSingleSelectQuestionDisplayModeUnknown,
    AWSConnectEvaluationFormSingleSelectQuestionDisplayModeDropdown,
    AWSConnectEvaluationFormSingleSelectQuestionDisplayModeRadio,
};

typedef NS_ENUM(NSInteger, AWSConnectEvaluationFormVersionStatus) {
    AWSConnectEvaluationFormVersionStatusUnknown,
    AWSConnectEvaluationFormVersionStatusDraft,
    AWSConnectEvaluationFormVersionStatusActive,
};

typedef NS_ENUM(NSInteger, AWSConnectEvaluationStatus) {
    AWSConnectEvaluationStatusUnknown,
    AWSConnectEvaluationStatusDraft,
    AWSConnectEvaluationStatusSubmitted,
};

typedef NS_ENUM(NSInteger, AWSConnectEventSourceName) {
    AWSConnectEventSourceNameUnknown,
    AWSConnectEventSourceNameOnPostCallAnalysisAvailable,
    AWSConnectEventSourceNameOnRealTimeCallAnalysisAvailable,
    AWSConnectEventSourceNameOnPostChatAnalysisAvailable,
    AWSConnectEventSourceNameOnZendeskTicketCreate,
    AWSConnectEventSourceNameOnZendeskTicketStatusUpdate,
    AWSConnectEventSourceNameOnSalesforceCaseCreate,
    AWSConnectEventSourceNameOnContactEvaluationSubmit,
};

typedef NS_ENUM(NSInteger, AWSConnectGrouping) {
    AWSConnectGroupingUnknown,
    AWSConnectGroupingQueue,
    AWSConnectGroupingChannel,
    AWSConnectGroupingRoutingProfile,
};

typedef NS_ENUM(NSInteger, AWSConnectHierarchyGroupMatchType) {
    AWSConnectHierarchyGroupMatchTypeUnknown,
    AWSConnectHierarchyGroupMatchTypeExact,
    AWSConnectHierarchyGroupMatchTypeWithChildGroups,
};

typedef NS_ENUM(NSInteger, AWSConnectHistoricalMetricName) {
    AWSConnectHistoricalMetricNameUnknown,
    AWSConnectHistoricalMetricNameContactsQueued,
    AWSConnectHistoricalMetricNameContactsHandled,
    AWSConnectHistoricalMetricNameContactsAbandoned,
    AWSConnectHistoricalMetricNameContactsConsulted,
    AWSConnectHistoricalMetricNameContactsAgentHungUpFirst,
    AWSConnectHistoricalMetricNameContactsHandledIncoming,
    AWSConnectHistoricalMetricNameContactsHandledOutbound,
    AWSConnectHistoricalMetricNameContactsHoldAbandons,
    AWSConnectHistoricalMetricNameContactsTransferredIn,
    AWSConnectHistoricalMetricNameContactsTransferredOut,
    AWSConnectHistoricalMetricNameContactsTransferredInFromQueue,
    AWSConnectHistoricalMetricNameContactsTransferredOutFromQueue,
    AWSConnectHistoricalMetricNameContactsMissed,
    AWSConnectHistoricalMetricNameCallbackContactsHandled,
    AWSConnectHistoricalMetricNameApiContactsHandled,
    AWSConnectHistoricalMetricNameOccupancy,
    AWSConnectHistoricalMetricNameHandleTime,
    AWSConnectHistoricalMetricNameAfterContactWorkTime,
    AWSConnectHistoricalMetricNameQueuedTime,
    AWSConnectHistoricalMetricNameAbandonTime,
    AWSConnectHistoricalMetricNameQueueAnswerTime,
    AWSConnectHistoricalMetricNameHoldTime,
    AWSConnectHistoricalMetricNameInteractionTime,
    AWSConnectHistoricalMetricNameInteractionAndHoldTime,
    AWSConnectHistoricalMetricNameServiceLevel,
};

typedef NS_ENUM(NSInteger, AWSConnectHoursOfOperationDays) {
    AWSConnectHoursOfOperationDaysUnknown,
    AWSConnectHoursOfOperationDaysSunday,
    AWSConnectHoursOfOperationDaysMonday,
    AWSConnectHoursOfOperationDaysTuesday,
    AWSConnectHoursOfOperationDaysWednesday,
    AWSConnectHoursOfOperationDaysThursday,
    AWSConnectHoursOfOperationDaysFriday,
    AWSConnectHoursOfOperationDaysSaturday,
};

typedef NS_ENUM(NSInteger, AWSConnectInstanceAttributeType) {
    AWSConnectInstanceAttributeTypeUnknown,
    AWSConnectInstanceAttributeTypeInboundCalls,
    AWSConnectInstanceAttributeTypeOutboundCalls,
    AWSConnectInstanceAttributeTypeContactflowLogs,
    AWSConnectInstanceAttributeTypeContactLens,
    AWSConnectInstanceAttributeTypeAutoResolveBestVoices,
    AWSConnectInstanceAttributeTypeUseCustomTtsVoices,
    AWSConnectInstanceAttributeTypeEarlyMedia,
    AWSConnectInstanceAttributeTypeMultiPartyConference,
    AWSConnectInstanceAttributeTypeHighVolumeOutbound,
    AWSConnectInstanceAttributeTypeEnhancedContactMonitoring,
};

typedef NS_ENUM(NSInteger, AWSConnectInstanceStatus) {
    AWSConnectInstanceStatusUnknown,
    AWSConnectInstanceStatusCreationInProgress,
    AWSConnectInstanceStatusActive,
    AWSConnectInstanceStatusCreationFailed,
};

typedef NS_ENUM(NSInteger, AWSConnectInstanceStorageResourceType) {
    AWSConnectInstanceStorageResourceTypeUnknown,
    AWSConnectInstanceStorageResourceTypeChatTranscripts,
    AWSConnectInstanceStorageResourceTypeCallRecordings,
    AWSConnectInstanceStorageResourceTypeScheduledReports,
    AWSConnectInstanceStorageResourceTypeMediaStreams,
    AWSConnectInstanceStorageResourceTypeContactTraceRecords,
    AWSConnectInstanceStorageResourceTypeAgentEvents,
    AWSConnectInstanceStorageResourceTypeRealTimeContactAnalysisSegments,
    AWSConnectInstanceStorageResourceTypeAttachments,
    AWSConnectInstanceStorageResourceTypeContactEvaluations,
};

typedef NS_ENUM(NSInteger, AWSConnectIntegrationType) {
    AWSConnectIntegrationTypeUnknown,
    AWSConnectIntegrationTypeEvent,
    AWSConnectIntegrationTypeVoiceId,
    AWSConnectIntegrationTypePinpointApp,
    AWSConnectIntegrationTypeWisdomAssistant,
    AWSConnectIntegrationTypeWisdomKnowledgeBase,
    AWSConnectIntegrationTypeCasesDomain,
};

typedef NS_ENUM(NSInteger, AWSConnectLexVersion) {
    AWSConnectLexVersionUnknown,
    AWSConnectLexVersionV1,
    AWSConnectLexVersionV2,
};

typedef NS_ENUM(NSInteger, AWSConnectMonitorCapability) {
    AWSConnectMonitorCapabilityUnknown,
    AWSConnectMonitorCapabilitySilentMonitor,
    AWSConnectMonitorCapabilityBarge,
};

typedef NS_ENUM(NSInteger, AWSConnectNotificationContentType) {
    AWSConnectNotificationContentTypeUnknown,
    AWSConnectNotificationContentTypePlainText,
};

typedef NS_ENUM(NSInteger, AWSConnectNotificationDeliveryType) {
    AWSConnectNotificationDeliveryTypeUnknown,
    AWSConnectNotificationDeliveryTypeEmail,
};

typedef NS_ENUM(NSInteger, AWSConnectNumericQuestionPropertyAutomationLabel) {
    AWSConnectNumericQuestionPropertyAutomationLabelUnknown,
    AWSConnectNumericQuestionPropertyAutomationLabelOverallCustomerSentimentScore,
    AWSConnectNumericQuestionPropertyAutomationLabelOverallAgentSentimentScore,
    AWSConnectNumericQuestionPropertyAutomationLabelNonTalkTime,
    AWSConnectNumericQuestionPropertyAutomationLabelNonTalkTimePercentage,
    AWSConnectNumericQuestionPropertyAutomationLabelNumberOfInterruptions,
    AWSConnectNumericQuestionPropertyAutomationLabelContactDuration,
    AWSConnectNumericQuestionPropertyAutomationLabelAgentInteractionDuration,
    AWSConnectNumericQuestionPropertyAutomationLabelCustomerHoldTime,
};

typedef NS_ENUM(NSInteger, AWSConnectParticipantRole) {
    AWSConnectParticipantRoleUnknown,
    AWSConnectParticipantRoleAgent,
    AWSConnectParticipantRoleCustomer,
    AWSConnectParticipantRoleSystem,
    AWSConnectParticipantRoleCustomBot,
};

typedef NS_ENUM(NSInteger, AWSConnectParticipantTimerAction) {
    AWSConnectParticipantTimerActionUnknown,
    AWSConnectParticipantTimerActionUnset,
};

typedef NS_ENUM(NSInteger, AWSConnectParticipantTimerType) {
    AWSConnectParticipantTimerTypeUnknown,
    AWSConnectParticipantTimerTypeIdle,
    AWSConnectParticipantTimerTypeDisconnectNoncustomer,
};

typedef NS_ENUM(NSInteger, AWSConnectPhoneNumberCountryCode) {
    AWSConnectPhoneNumberCountryCodeUnknown,
    AWSConnectPhoneNumberCountryCodeAf,
    AWSConnectPhoneNumberCountryCodeAl,
    AWSConnectPhoneNumberCountryCodeDz,
    AWSConnectPhoneNumberCountryCodeAs,
    AWSConnectPhoneNumberCountryCodeAd,
    AWSConnectPhoneNumberCountryCodeAo,
    AWSConnectPhoneNumberCountryCodeAi,
    AWSConnectPhoneNumberCountryCodeAq,
    AWSConnectPhoneNumberCountryCodeAg,
    AWSConnectPhoneNumberCountryCodeAr,
    AWSConnectPhoneNumberCountryCodeAm,
    AWSConnectPhoneNumberCountryCodeAw,
    AWSConnectPhoneNumberCountryCodeAu,
    AWSConnectPhoneNumberCountryCodeAt,
    AWSConnectPhoneNumberCountryCodeAz,
    AWSConnectPhoneNumberCountryCodeBs,
    AWSConnectPhoneNumberCountryCodeBh,
    AWSConnectPhoneNumberCountryCodeBd,
    AWSConnectPhoneNumberCountryCodeBb,
    AWSConnectPhoneNumberCountryCodeBy,
    AWSConnectPhoneNumberCountryCodeBe,
    AWSConnectPhoneNumberCountryCodeBz,
    AWSConnectPhoneNumberCountryCodeBj,
    AWSConnectPhoneNumberCountryCodeBm,
    AWSConnectPhoneNumberCountryCodeBt,
    AWSConnectPhoneNumberCountryCodeBo,
    AWSConnectPhoneNumberCountryCodeBa,
    AWSConnectPhoneNumberCountryCodeBw,
    AWSConnectPhoneNumberCountryCodeBr,
    AWSConnectPhoneNumberCountryCodeIo,
    AWSConnectPhoneNumberCountryCodeVg,
    AWSConnectPhoneNumberCountryCodeBn,
    AWSConnectPhoneNumberCountryCodeBg,
    AWSConnectPhoneNumberCountryCodeBf,
    AWSConnectPhoneNumberCountryCodeBi,
    AWSConnectPhoneNumberCountryCodeKh,
    AWSConnectPhoneNumberCountryCodeCm,
    AWSConnectPhoneNumberCountryCodeCa,
    AWSConnectPhoneNumberCountryCodeCv,
    AWSConnectPhoneNumberCountryCodeKy,
    AWSConnectPhoneNumberCountryCodeCf,
    AWSConnectPhoneNumberCountryCodeTd,
    AWSConnectPhoneNumberCountryCodeCl,
    AWSConnectPhoneNumberCountryCodeCn,
    AWSConnectPhoneNumberCountryCodeCx,
    AWSConnectPhoneNumberCountryCodeCc,
    AWSConnectPhoneNumberCountryCodeCo,
    AWSConnectPhoneNumberCountryCodeKm,
    AWSConnectPhoneNumberCountryCodeCk,
    AWSConnectPhoneNumberCountryCodeCr,
    AWSConnectPhoneNumberCountryCodeHr,
    AWSConnectPhoneNumberCountryCodeCu,
    AWSConnectPhoneNumberCountryCodeCw,
    AWSConnectPhoneNumberCountryCodeCy,
    AWSConnectPhoneNumberCountryCodeCz,
    AWSConnectPhoneNumberCountryCodeCd,
    AWSConnectPhoneNumberCountryCodeDk,
    AWSConnectPhoneNumberCountryCodeDj,
    AWSConnectPhoneNumberCountryCodeDm,
    AWSConnectPhoneNumberCountryCodeDo,
    AWSConnectPhoneNumberCountryCodeTl,
    AWSConnectPhoneNumberCountryCodeEc,
    AWSConnectPhoneNumberCountryCodeEg,
    AWSConnectPhoneNumberCountryCodeSv,
    AWSConnectPhoneNumberCountryCodeGq,
    AWSConnectPhoneNumberCountryCodeEr,
    AWSConnectPhoneNumberCountryCodeEe,
    AWSConnectPhoneNumberCountryCodeEt,
    AWSConnectPhoneNumberCountryCodeFk,
    AWSConnectPhoneNumberCountryCodeFo,
    AWSConnectPhoneNumberCountryCodeFj,
    AWSConnectPhoneNumberCountryCodeFi,
    AWSConnectPhoneNumberCountryCodeFr,
    AWSConnectPhoneNumberCountryCodePf,
    AWSConnectPhoneNumberCountryCodeGa,
    AWSConnectPhoneNumberCountryCodeGm,
    AWSConnectPhoneNumberCountryCodeGE,
    AWSConnectPhoneNumberCountryCodeDe,
    AWSConnectPhoneNumberCountryCodeGh,
    AWSConnectPhoneNumberCountryCodeGi,
    AWSConnectPhoneNumberCountryCodeGr,
    AWSConnectPhoneNumberCountryCodeGl,
    AWSConnectPhoneNumberCountryCodeGd,
    AWSConnectPhoneNumberCountryCodeGu,
    AWSConnectPhoneNumberCountryCodeGT,
    AWSConnectPhoneNumberCountryCodeGg,
    AWSConnectPhoneNumberCountryCodeGn,
    AWSConnectPhoneNumberCountryCodeGw,
    AWSConnectPhoneNumberCountryCodeGy,
    AWSConnectPhoneNumberCountryCodeHt,
    AWSConnectPhoneNumberCountryCodeHn,
    AWSConnectPhoneNumberCountryCodeHk,
    AWSConnectPhoneNumberCountryCodeHu,
    AWSConnectPhoneNumberCountryCodeIs,
    AWSConnectPhoneNumberCountryCodeIN,
    AWSConnectPhoneNumberCountryCodeId,
    AWSConnectPhoneNumberCountryCodeIr,
    AWSConnectPhoneNumberCountryCodeIq,
    AWSConnectPhoneNumberCountryCodeIe,
    AWSConnectPhoneNumberCountryCodeIm,
    AWSConnectPhoneNumberCountryCodeIl,
    AWSConnectPhoneNumberCountryCodeIt,
    AWSConnectPhoneNumberCountryCodeCi,
    AWSConnectPhoneNumberCountryCodeJm,
    AWSConnectPhoneNumberCountryCodeJp,
    AWSConnectPhoneNumberCountryCodeJe,
    AWSConnectPhoneNumberCountryCodeJo,
    AWSConnectPhoneNumberCountryCodeKz,
    AWSConnectPhoneNumberCountryCodeKe,
    AWSConnectPhoneNumberCountryCodeKi,
    AWSConnectPhoneNumberCountryCodeKw,
    AWSConnectPhoneNumberCountryCodeKg,
    AWSConnectPhoneNumberCountryCodeLa,
    AWSConnectPhoneNumberCountryCodeLv,
    AWSConnectPhoneNumberCountryCodeLb,
    AWSConnectPhoneNumberCountryCodeLs,
    AWSConnectPhoneNumberCountryCodeLr,
    AWSConnectPhoneNumberCountryCodeLy,
    AWSConnectPhoneNumberCountryCodeLi,
    AWSConnectPhoneNumberCountryCodeLT,
    AWSConnectPhoneNumberCountryCodeLu,
    AWSConnectPhoneNumberCountryCodeMo,
    AWSConnectPhoneNumberCountryCodeMk,
    AWSConnectPhoneNumberCountryCodeMg,
    AWSConnectPhoneNumberCountryCodeMw,
    AWSConnectPhoneNumberCountryCodeMy,
    AWSConnectPhoneNumberCountryCodeMv,
    AWSConnectPhoneNumberCountryCodeMl,
    AWSConnectPhoneNumberCountryCodeMt,
    AWSConnectPhoneNumberCountryCodeMh,
    AWSConnectPhoneNumberCountryCodeMr,
    AWSConnectPhoneNumberCountryCodeMu,
    AWSConnectPhoneNumberCountryCodeYt,
    AWSConnectPhoneNumberCountryCodeMx,
    AWSConnectPhoneNumberCountryCodeFm,
    AWSConnectPhoneNumberCountryCodeMd,
    AWSConnectPhoneNumberCountryCodeMc,
    AWSConnectPhoneNumberCountryCodeMn,
    AWSConnectPhoneNumberCountryCodeMe,
    AWSConnectPhoneNumberCountryCodeMs,
    AWSConnectPhoneNumberCountryCodeMa,
    AWSConnectPhoneNumberCountryCodeMz,
    AWSConnectPhoneNumberCountryCodeMm,
    AWSConnectPhoneNumberCountryCodeNa,
    AWSConnectPhoneNumberCountryCodeNr,
    AWSConnectPhoneNumberCountryCodeNp,
    AWSConnectPhoneNumberCountryCodeNl,
    AWSConnectPhoneNumberCountryCodeAn,
    AWSConnectPhoneNumberCountryCodeNc,
    AWSConnectPhoneNumberCountryCodeNz,
    AWSConnectPhoneNumberCountryCodeNi,
    AWSConnectPhoneNumberCountryCodeNE,
    AWSConnectPhoneNumberCountryCodeNg,
    AWSConnectPhoneNumberCountryCodeNu,
    AWSConnectPhoneNumberCountryCodeKp,
    AWSConnectPhoneNumberCountryCodeMp,
    AWSConnectPhoneNumberCountryCodeNo,
    AWSConnectPhoneNumberCountryCodeOm,
    AWSConnectPhoneNumberCountryCodePk,
    AWSConnectPhoneNumberCountryCodePw,
    AWSConnectPhoneNumberCountryCodePa,
    AWSConnectPhoneNumberCountryCodePg,
    AWSConnectPhoneNumberCountryCodePy,
    AWSConnectPhoneNumberCountryCodePe,
    AWSConnectPhoneNumberCountryCodePh,
    AWSConnectPhoneNumberCountryCodePn,
    AWSConnectPhoneNumberCountryCodePl,
    AWSConnectPhoneNumberCountryCodePt,
    AWSConnectPhoneNumberCountryCodePr,
    AWSConnectPhoneNumberCountryCodeQa,
    AWSConnectPhoneNumberCountryCodeCg,
    AWSConnectPhoneNumberCountryCodeRe,
    AWSConnectPhoneNumberCountryCodeRo,
    AWSConnectPhoneNumberCountryCodeRu,
    AWSConnectPhoneNumberCountryCodeRw,
    AWSConnectPhoneNumberCountryCodeBl,
    AWSConnectPhoneNumberCountryCodeSh,
    AWSConnectPhoneNumberCountryCodeKn,
    AWSConnectPhoneNumberCountryCodeLc,
    AWSConnectPhoneNumberCountryCodeMf,
    AWSConnectPhoneNumberCountryCodePm,
    AWSConnectPhoneNumberCountryCodeVc,
    AWSConnectPhoneNumberCountryCodeWs,
    AWSConnectPhoneNumberCountryCodeSm,
    AWSConnectPhoneNumberCountryCodeSt,
    AWSConnectPhoneNumberCountryCodeSa,
    AWSConnectPhoneNumberCountryCodeSn,
    AWSConnectPhoneNumberCountryCodeRs,
    AWSConnectPhoneNumberCountryCodeSc,
    AWSConnectPhoneNumberCountryCodeSl,
    AWSConnectPhoneNumberCountryCodeSg,
    AWSConnectPhoneNumberCountryCodeSx,
    AWSConnectPhoneNumberCountryCodeSk,
    AWSConnectPhoneNumberCountryCodeSi,
    AWSConnectPhoneNumberCountryCodeSb,
    AWSConnectPhoneNumberCountryCodeSo,
    AWSConnectPhoneNumberCountryCodeZa,
    AWSConnectPhoneNumberCountryCodeKr,
    AWSConnectPhoneNumberCountryCodeEs,
    AWSConnectPhoneNumberCountryCodeLk,
    AWSConnectPhoneNumberCountryCodeSd,
    AWSConnectPhoneNumberCountryCodeSr,
    AWSConnectPhoneNumberCountryCodeSj,
    AWSConnectPhoneNumberCountryCodeSz,
    AWSConnectPhoneNumberCountryCodeSe,
    AWSConnectPhoneNumberCountryCodeCh,
    AWSConnectPhoneNumberCountryCodeSy,
    AWSConnectPhoneNumberCountryCodeTw,
    AWSConnectPhoneNumberCountryCodeTj,
    AWSConnectPhoneNumberCountryCodeTz,
    AWSConnectPhoneNumberCountryCodeTh,
    AWSConnectPhoneNumberCountryCodeTg,
    AWSConnectPhoneNumberCountryCodeTk,
    AWSConnectPhoneNumberCountryCodeTo,
    AWSConnectPhoneNumberCountryCodeTt,
    AWSConnectPhoneNumberCountryCodeTn,
    AWSConnectPhoneNumberCountryCodeTr,
    AWSConnectPhoneNumberCountryCodeTm,
    AWSConnectPhoneNumberCountryCodeTc,
    AWSConnectPhoneNumberCountryCodeTv,
    AWSConnectPhoneNumberCountryCodeVi,
    AWSConnectPhoneNumberCountryCodeUg,
    AWSConnectPhoneNumberCountryCodeUa,
    AWSConnectPhoneNumberCountryCodeAe,
    AWSConnectPhoneNumberCountryCodeGb,
    AWSConnectPhoneNumberCountryCodeUs,
    AWSConnectPhoneNumberCountryCodeUy,
    AWSConnectPhoneNumberCountryCodeUz,
    AWSConnectPhoneNumberCountryCodeVu,
    AWSConnectPhoneNumberCountryCodeVa,
    AWSConnectPhoneNumberCountryCodeVe,
    AWSConnectPhoneNumberCountryCodeVn,
    AWSConnectPhoneNumberCountryCodeWf,
    AWSConnectPhoneNumberCountryCodeEh,
    AWSConnectPhoneNumberCountryCodeYe,
    AWSConnectPhoneNumberCountryCodeZm,
    AWSConnectPhoneNumberCountryCodeZw,
};

typedef NS_ENUM(NSInteger, AWSConnectPhoneNumberType) {
    AWSConnectPhoneNumberTypeUnknown,
    AWSConnectPhoneNumberTypeTollFree,
    AWSConnectPhoneNumberTypeDid,
};

typedef NS_ENUM(NSInteger, AWSConnectPhoneNumberWorkflowStatus) {
    AWSConnectPhoneNumberWorkflowStatusUnknown,
    AWSConnectPhoneNumberWorkflowStatusClaimed,
    AWSConnectPhoneNumberWorkflowStatusInProgress,
    AWSConnectPhoneNumberWorkflowStatusFailed,
};

typedef NS_ENUM(NSInteger, AWSConnectPhoneType) {
    AWSConnectPhoneTypeUnknown,
    AWSConnectPhoneTypeSoftPhone,
    AWSConnectPhoneTypeDeskPhone,
};

typedef NS_ENUM(NSInteger, AWSConnectPropertyValidationExceptionReason) {
    AWSConnectPropertyValidationExceptionReasonUnknown,
    AWSConnectPropertyValidationExceptionReasonInvalidFormat,
    AWSConnectPropertyValidationExceptionReasonUniqueConstraintViolated,
    AWSConnectPropertyValidationExceptionReasonReferencedResourceNotFound,
    AWSConnectPropertyValidationExceptionReasonResourceNameAlreadyExists,
    AWSConnectPropertyValidationExceptionReasonRequiredPropertyMissing,
    AWSConnectPropertyValidationExceptionReasonNotSupported,
};

typedef NS_ENUM(NSInteger, AWSConnectQueueStatus) {
    AWSConnectQueueStatusUnknown,
    AWSConnectQueueStatusEnabled,
    AWSConnectQueueStatusDisabled,
};

typedef NS_ENUM(NSInteger, AWSConnectQueueType) {
    AWSConnectQueueTypeUnknown,
    AWSConnectQueueTypeStandard,
    AWSConnectQueueTypeAgent,
};

typedef NS_ENUM(NSInteger, AWSConnectQuickConnectType) {
    AWSConnectQuickConnectTypeUnknown,
    AWSConnectQuickConnectTypeUser,
    AWSConnectQuickConnectTypeQueue,
    AWSConnectQuickConnectTypePhoneNumber,
};

typedef NS_ENUM(NSInteger, AWSConnectReferenceStatus) {
    AWSConnectReferenceStatusUnknown,
    AWSConnectReferenceStatusApproved,
    AWSConnectReferenceStatusRejected,
};

typedef NS_ENUM(NSInteger, AWSConnectReferenceType) {
    AWSConnectReferenceTypeUnknown,
    AWSConnectReferenceTypeUrl,
    AWSConnectReferenceTypeAttachment,
    AWSConnectReferenceTypeNumber,
    AWSConnectReferenceTypeString,
    AWSConnectReferenceTypeDate,
    AWSConnectReferenceTypeEmail,
};

typedef NS_ENUM(NSInteger, AWSConnectRehydrationType) {
    AWSConnectRehydrationTypeUnknown,
    AWSConnectRehydrationTypeEntirePastSession,
    AWSConnectRehydrationTypeFromSegment,
};

typedef NS_ENUM(NSInteger, AWSConnectResourceType) {
    AWSConnectResourceTypeUnknown,
    AWSConnectResourceTypeContact,
    AWSConnectResourceTypeContactFlow,
    AWSConnectResourceTypeInstance,
    AWSConnectResourceTypeParticipant,
    AWSConnectResourceTypeHierarchyLevel,
    AWSConnectResourceTypeHierarchyGroup,
    AWSConnectResourceTypeUser,
};

typedef NS_ENUM(NSInteger, AWSConnectRulePublishStatus) {
    AWSConnectRulePublishStatusUnknown,
    AWSConnectRulePublishStatusDraft,
    AWSConnectRulePublishStatusPublished,
};

typedef NS_ENUM(NSInteger, AWSConnectSearchableQueueType) {
    AWSConnectSearchableQueueTypeUnknown,
    AWSConnectSearchableQueueTypeStandard,
};

typedef NS_ENUM(NSInteger, AWSConnectSingleSelectQuestionRuleCategoryAutomationCondition) {
    AWSConnectSingleSelectQuestionRuleCategoryAutomationConditionUnknown,
    AWSConnectSingleSelectQuestionRuleCategoryAutomationConditionPresent,
    AWSConnectSingleSelectQuestionRuleCategoryAutomationConditionNotPresent,
};

typedef NS_ENUM(NSInteger, AWSConnectSortOrder) {
    AWSConnectSortOrderUnknown,
    AWSConnectSortOrderAscending,
    AWSConnectSortOrderDescending,
};

typedef NS_ENUM(NSInteger, AWSConnectSourceType) {
    AWSConnectSourceTypeUnknown,
    AWSConnectSourceTypeSalesforce,
    AWSConnectSourceTypeZendesk,
};

typedef NS_ENUM(NSInteger, AWSConnectStatistic) {
    AWSConnectStatisticUnknown,
    AWSConnectStatisticSum,
    AWSConnectStatisticMax,
    AWSConnectStatisticAvg,
};

typedef NS_ENUM(NSInteger, AWSConnectStorageType) {
    AWSConnectStorageTypeUnknown,
    AWSConnectStorageTypeS3,
    AWSConnectStorageTypeKinesisVideoStream,
    AWSConnectStorageTypeKinesisStream,
    AWSConnectStorageTypeKinesisFirehose,
};

typedef NS_ENUM(NSInteger, AWSConnectStringComparisonType) {
    AWSConnectStringComparisonTypeUnknown,
    AWSConnectStringComparisonTypeStartsWith,
    AWSConnectStringComparisonTypeContains,
    AWSConnectStringComparisonTypeExact,
};

typedef NS_ENUM(NSInteger, AWSConnectTaskTemplateFieldType) {
    AWSConnectTaskTemplateFieldTypeUnknown,
    AWSConnectTaskTemplateFieldTypeName,
    AWSConnectTaskTemplateFieldTypeDescription,
    AWSConnectTaskTemplateFieldTypeScheduledTime,
    AWSConnectTaskTemplateFieldTypeQuickConnect,
    AWSConnectTaskTemplateFieldTypeUrl,
    AWSConnectTaskTemplateFieldTypeNumber,
    AWSConnectTaskTemplateFieldTypeText,
    AWSConnectTaskTemplateFieldTypeTextArea,
    AWSConnectTaskTemplateFieldTypeDateTime,
    AWSConnectTaskTemplateFieldTypeBoolean,
    AWSConnectTaskTemplateFieldTypeSingleSelect,
    AWSConnectTaskTemplateFieldTypeEmail,
};

typedef NS_ENUM(NSInteger, AWSConnectTaskTemplateStatus) {
    AWSConnectTaskTemplateStatusUnknown,
    AWSConnectTaskTemplateStatusActive,
    AWSConnectTaskTemplateStatusInactive,
};

typedef NS_ENUM(NSInteger, AWSConnectTimerEligibleParticipantRoles) {
    AWSConnectTimerEligibleParticipantRolesUnknown,
    AWSConnectTimerEligibleParticipantRolesCustomer,
    AWSConnectTimerEligibleParticipantRolesAgent,
};

typedef NS_ENUM(NSInteger, AWSConnectTrafficDistributionGroupStatus) {
    AWSConnectTrafficDistributionGroupStatusUnknown,
    AWSConnectTrafficDistributionGroupStatusCreationInProgress,
    AWSConnectTrafficDistributionGroupStatusActive,
    AWSConnectTrafficDistributionGroupStatusCreationFailed,
    AWSConnectTrafficDistributionGroupStatusPendingDeletion,
    AWSConnectTrafficDistributionGroupStatusDeletionFailed,
    AWSConnectTrafficDistributionGroupStatusUpdateInProgress,
};

typedef NS_ENUM(NSInteger, AWSConnectTrafficType) {
    AWSConnectTrafficTypeUnknown,
    AWSConnectTrafficTypeGeneral,
    AWSConnectTrafficTypeCampaign,
};

typedef NS_ENUM(NSInteger, AWSConnectUnit) {
    AWSConnectUnitUnknown,
    AWSConnectUnitSeconds,
    AWSConnectUnitCount,
    AWSConnectUnitPercent,
};

typedef NS_ENUM(NSInteger, AWSConnectUseCaseType) {
    AWSConnectUseCaseTypeUnknown,
    AWSConnectUseCaseTypeRulesEvaluation,
    AWSConnectUseCaseTypeConnectCampaigns,
};

typedef NS_ENUM(NSInteger, AWSConnectVocabularyLanguageCode) {
    AWSConnectVocabularyLanguageCodeUnknown,
    AWSConnectVocabularyLanguageCodeArAE,
    AWSConnectVocabularyLanguageCodeDeCH,
    AWSConnectVocabularyLanguageCodeDeDE,
    AWSConnectVocabularyLanguageCodeEnAB,
    AWSConnectVocabularyLanguageCodeEnAU,
    AWSConnectVocabularyLanguageCodeEnGB,
    AWSConnectVocabularyLanguageCodeEnIE,
    AWSConnectVocabularyLanguageCodeEnIN,
    AWSConnectVocabularyLanguageCodeEnUS,
    AWSConnectVocabularyLanguageCodeEnWL,
    AWSConnectVocabularyLanguageCodeEsES,
    AWSConnectVocabularyLanguageCodeEsUS,
    AWSConnectVocabularyLanguageCodeFrCA,
    AWSConnectVocabularyLanguageCodeFrFR,
    AWSConnectVocabularyLanguageCodeHiIN,
    AWSConnectVocabularyLanguageCodeItIT,
    AWSConnectVocabularyLanguageCodeJaJP,
    AWSConnectVocabularyLanguageCodeKoKR,
    AWSConnectVocabularyLanguageCodePtBR,
    AWSConnectVocabularyLanguageCodePtPT,
    AWSConnectVocabularyLanguageCodeZhCN,
    AWSConnectVocabularyLanguageCodeEnNZ,
    AWSConnectVocabularyLanguageCodeEnZA,
};

typedef NS_ENUM(NSInteger, AWSConnectVocabularyState) {
    AWSConnectVocabularyStateUnknown,
    AWSConnectVocabularyStateCreationInProgress,
    AWSConnectVocabularyStateActive,
    AWSConnectVocabularyStateCreationFailed,
    AWSConnectVocabularyStateDeleteInProgress,
};

typedef NS_ENUM(NSInteger, AWSConnectVoiceRecordingTrack) {
    AWSConnectVoiceRecordingTrackUnknown,
    AWSConnectVoiceRecordingTrackFromAgent,
    AWSConnectVoiceRecordingTrackToAgent,
    AWSConnectVoiceRecordingTrackAll,
};

@class AWSConnectActionSummary;
@class AWSConnectActivateEvaluationFormRequest;
@class AWSConnectActivateEvaluationFormResponse;
@class AWSConnectAgentContactReference;
@class AWSConnectAgentInfo;
@class AWSConnectAgentStatus;
@class AWSConnectAgentStatusReference;
@class AWSConnectAgentStatusSummary;
@class AWSConnectAnswerMachineDetectionConfig;
@class AWSConnectAssignContactCategoryActionDefinition;
@class AWSConnectAssociateApprovedOriginRequest;
@class AWSConnectAssociateBotRequest;
@class AWSConnectAssociateDefaultVocabularyRequest;
@class AWSConnectAssociateDefaultVocabularyResponse;
@class AWSConnectAssociateInstanceStorageConfigRequest;
@class AWSConnectAssociateInstanceStorageConfigResponse;
@class AWSConnectAssociateLambdaFunctionRequest;
@class AWSConnectAssociateLexBotRequest;
@class AWSConnectAssociatePhoneNumberContactFlowRequest;
@class AWSConnectAssociateQueueQuickConnectsRequest;
@class AWSConnectAssociateRoutingProfileQueuesRequest;
@class AWSConnectAssociateSecurityKeyRequest;
@class AWSConnectAssociateSecurityKeyResponse;
@class AWSConnectAttachmentReference;
@class AWSConnectAttribute;
@class AWSConnectAvailableNumberSummary;
@class AWSConnectChatMessage;
@class AWSConnectChatParticipantRoleConfig;
@class AWSConnectChatStreamingConfiguration;
@class AWSConnectClaimPhoneNumberRequest;
@class AWSConnectClaimPhoneNumberResponse;
@class AWSConnectClaimedPhoneNumberSummary;
@class AWSConnectContact;
@class AWSConnectContactFilter;
@class AWSConnectContactFlow;
@class AWSConnectContactFlowModule;
@class AWSConnectContactFlowModuleSummary;
@class AWSConnectContactFlowSummary;
@class AWSConnectControlPlaneTagFilter;
@class AWSConnectCreateAgentStatusRequest;
@class AWSConnectCreateAgentStatusResponse;
@class AWSConnectCreateContactFlowModuleRequest;
@class AWSConnectCreateContactFlowModuleResponse;
@class AWSConnectCreateContactFlowRequest;
@class AWSConnectCreateContactFlowResponse;
@class AWSConnectCreateEvaluationFormRequest;
@class AWSConnectCreateEvaluationFormResponse;
@class AWSConnectCreateHoursOfOperationRequest;
@class AWSConnectCreateHoursOfOperationResponse;
@class AWSConnectCreateInstanceRequest;
@class AWSConnectCreateInstanceResponse;
@class AWSConnectCreateIntegrationAssociationRequest;
@class AWSConnectCreateIntegrationAssociationResponse;
@class AWSConnectCreateParticipantRequest;
@class AWSConnectCreateParticipantResponse;
@class AWSConnectCreatePromptRequest;
@class AWSConnectCreatePromptResponse;
@class AWSConnectCreateQueueRequest;
@class AWSConnectCreateQueueResponse;
@class AWSConnectCreateQuickConnectRequest;
@class AWSConnectCreateQuickConnectResponse;
@class AWSConnectCreateRoutingProfileRequest;
@class AWSConnectCreateRoutingProfileResponse;
@class AWSConnectCreateRuleRequest;
@class AWSConnectCreateRuleResponse;
@class AWSConnectCreateSecurityProfileRequest;
@class AWSConnectCreateSecurityProfileResponse;
@class AWSConnectCreateTaskTemplateRequest;
@class AWSConnectCreateTaskTemplateResponse;
@class AWSConnectCreateTrafficDistributionGroupRequest;
@class AWSConnectCreateTrafficDistributionGroupResponse;
@class AWSConnectCreateUseCaseRequest;
@class AWSConnectCreateUseCaseResponse;
@class AWSConnectCreateUserHierarchyGroupRequest;
@class AWSConnectCreateUserHierarchyGroupResponse;
@class AWSConnectCreateUserRequest;
@class AWSConnectCreateUserResponse;
@class AWSConnectCreateVocabularyRequest;
@class AWSConnectCreateVocabularyResponse;
@class AWSConnectCredentials;
@class AWSConnectCrossChannelBehavior;
@class AWSConnectCurrentMetric;
@class AWSConnectCurrentMetricData;
@class AWSConnectCurrentMetricResult;
@class AWSConnectCurrentMetricSortCriteria;
@class AWSConnectDateReference;
@class AWSConnectDeactivateEvaluationFormRequest;
@class AWSConnectDeactivateEvaluationFormResponse;
@class AWSConnectDefaultVocabulary;
@class AWSConnectDeleteContactEvaluationRequest;
@class AWSConnectDeleteContactFlowModuleRequest;
@class AWSConnectDeleteContactFlowModuleResponse;
@class AWSConnectDeleteContactFlowRequest;
@class AWSConnectDeleteContactFlowResponse;
@class AWSConnectDeleteEvaluationFormRequest;
@class AWSConnectDeleteHoursOfOperationRequest;
@class AWSConnectDeleteInstanceRequest;
@class AWSConnectDeleteIntegrationAssociationRequest;
@class AWSConnectDeletePromptRequest;
@class AWSConnectDeleteQuickConnectRequest;
@class AWSConnectDeleteRuleRequest;
@class AWSConnectDeleteSecurityProfileRequest;
@class AWSConnectDeleteTaskTemplateRequest;
@class AWSConnectDeleteTaskTemplateResponse;
@class AWSConnectDeleteTrafficDistributionGroupRequest;
@class AWSConnectDeleteTrafficDistributionGroupResponse;
@class AWSConnectDeleteUseCaseRequest;
@class AWSConnectDeleteUserHierarchyGroupRequest;
@class AWSConnectDeleteUserRequest;
@class AWSConnectDeleteVocabularyRequest;
@class AWSConnectDeleteVocabularyResponse;
@class AWSConnectDescribeAgentStatusRequest;
@class AWSConnectDescribeAgentStatusResponse;
@class AWSConnectDescribeContactEvaluationRequest;
@class AWSConnectDescribeContactEvaluationResponse;
@class AWSConnectDescribeContactFlowModuleRequest;
@class AWSConnectDescribeContactFlowModuleResponse;
@class AWSConnectDescribeContactFlowRequest;
@class AWSConnectDescribeContactFlowResponse;
@class AWSConnectDescribeContactRequest;
@class AWSConnectDescribeContactResponse;
@class AWSConnectDescribeEvaluationFormRequest;
@class AWSConnectDescribeEvaluationFormResponse;
@class AWSConnectDescribeHoursOfOperationRequest;
@class AWSConnectDescribeHoursOfOperationResponse;
@class AWSConnectDescribeInstanceAttributeRequest;
@class AWSConnectDescribeInstanceAttributeResponse;
@class AWSConnectDescribeInstanceRequest;
@class AWSConnectDescribeInstanceResponse;
@class AWSConnectDescribeInstanceStorageConfigRequest;
@class AWSConnectDescribeInstanceStorageConfigResponse;
@class AWSConnectDescribePhoneNumberRequest;
@class AWSConnectDescribePhoneNumberResponse;
@class AWSConnectDescribePromptRequest;
@class AWSConnectDescribePromptResponse;
@class AWSConnectDescribeQueueRequest;
@class AWSConnectDescribeQueueResponse;
@class AWSConnectDescribeQuickConnectRequest;
@class AWSConnectDescribeQuickConnectResponse;
@class AWSConnectDescribeRoutingProfileRequest;
@class AWSConnectDescribeRoutingProfileResponse;
@class AWSConnectDescribeRuleRequest;
@class AWSConnectDescribeRuleResponse;
@class AWSConnectDescribeSecurityProfileRequest;
@class AWSConnectDescribeSecurityProfileResponse;
@class AWSConnectDescribeTrafficDistributionGroupRequest;
@class AWSConnectDescribeTrafficDistributionGroupResponse;
@class AWSConnectDescribeUserHierarchyGroupRequest;
@class AWSConnectDescribeUserHierarchyGroupResponse;
@class AWSConnectDescribeUserHierarchyStructureRequest;
@class AWSConnectDescribeUserHierarchyStructureResponse;
@class AWSConnectDescribeUserRequest;
@class AWSConnectDescribeUserResponse;
@class AWSConnectDescribeVocabularyRequest;
@class AWSConnectDescribeVocabularyResponse;
@class AWSConnectDimensions;
@class AWSConnectDisassociateApprovedOriginRequest;
@class AWSConnectDisassociateBotRequest;
@class AWSConnectDisassociateInstanceStorageConfigRequest;
@class AWSConnectDisassociateLambdaFunctionRequest;
@class AWSConnectDisassociateLexBotRequest;
@class AWSConnectDisassociatePhoneNumberContactFlowRequest;
@class AWSConnectDisassociateQueueQuickConnectsRequest;
@class AWSConnectDisassociateRoutingProfileQueuesRequest;
@class AWSConnectDisassociateSecurityKeyRequest;
@class AWSConnectDismissUserContactRequest;
@class AWSConnectDismissUserContactResponse;
@class AWSConnectDistribution;
@class AWSConnectEmailReference;
@class AWSConnectEncryptionConfig;
@class AWSConnectEvaluation;
@class AWSConnectEvaluationAnswerData;
@class AWSConnectEvaluationAnswerInput;
@class AWSConnectEvaluationAnswerOutput;
@class AWSConnectEvaluationForm;
@class AWSConnectEvaluationFormContent;
@class AWSConnectEvaluationFormItem;
@class AWSConnectEvaluationFormNumericQuestionAutomation;
@class AWSConnectEvaluationFormNumericQuestionOption;
@class AWSConnectEvaluationFormNumericQuestionProperties;
@class AWSConnectEvaluationFormQuestion;
@class AWSConnectEvaluationFormQuestionTypeProperties;
@class AWSConnectEvaluationFormScoringStrategy;
@class AWSConnectEvaluationFormSection;
@class AWSConnectEvaluationFormSingleSelectQuestionAutomation;
@class AWSConnectEvaluationFormSingleSelectQuestionAutomationOption;
@class AWSConnectEvaluationFormSingleSelectQuestionOption;
@class AWSConnectEvaluationFormSingleSelectQuestionProperties;
@class AWSConnectEvaluationFormSummary;
@class AWSConnectEvaluationFormVersionSummary;
@class AWSConnectEvaluationMetadata;
@class AWSConnectEvaluationNote;
@class AWSConnectEvaluationScore;
@class AWSConnectEvaluationSummary;
@class AWSConnectEventBridgeActionDefinition;
@class AWSConnectFilterV2;
@class AWSConnectFilters;
@class AWSConnectGetContactAttributesRequest;
@class AWSConnectGetContactAttributesResponse;
@class AWSConnectGetCurrentMetricDataRequest;
@class AWSConnectGetCurrentMetricDataResponse;
@class AWSConnectGetCurrentUserDataRequest;
@class AWSConnectGetCurrentUserDataResponse;
@class AWSConnectGetFederationTokenRequest;
@class AWSConnectGetFederationTokenResponse;
@class AWSConnectGetMetricDataRequest;
@class AWSConnectGetMetricDataResponse;
@class AWSConnectGetMetricDataV2Request;
@class AWSConnectGetMetricDataV2Response;
@class AWSConnectGetPromptFileRequest;
@class AWSConnectGetPromptFileResponse;
@class AWSConnectGetTaskTemplateRequest;
@class AWSConnectGetTaskTemplateResponse;
@class AWSConnectGetTrafficDistributionRequest;
@class AWSConnectGetTrafficDistributionResponse;
@class AWSConnectHierarchyGroup;
@class AWSConnectHierarchyGroupCondition;
@class AWSConnectHierarchyGroupSummary;
@class AWSConnectHierarchyGroupSummaryReference;
@class AWSConnectHierarchyLevel;
@class AWSConnectHierarchyLevelUpdate;
@class AWSConnectHierarchyPath;
@class AWSConnectHierarchyPathReference;
@class AWSConnectHierarchyStructure;
@class AWSConnectHierarchyStructureUpdate;
@class AWSConnectHistoricalMetric;
@class AWSConnectHistoricalMetricData;
@class AWSConnectHistoricalMetricResult;
@class AWSConnectHoursOfOperation;
@class AWSConnectHoursOfOperationConfig;
@class AWSConnectHoursOfOperationSummary;
@class AWSConnectHoursOfOperationTimeSlice;
@class AWSConnectInstance;
@class AWSConnectInstanceStatusReason;
@class AWSConnectInstanceStorageConfig;
@class AWSConnectInstanceSummary;
@class AWSConnectIntegrationAssociationSummary;
@class AWSConnectInvisibleFieldInfo;
@class AWSConnectKinesisFirehoseConfig;
@class AWSConnectKinesisStreamConfig;
@class AWSConnectKinesisVideoStreamConfig;
@class AWSConnectLexBot;
@class AWSConnectLexBotConfig;
@class AWSConnectLexV2Bot;
@class AWSConnectListAgentStatusRequest;
@class AWSConnectListAgentStatusResponse;
@class AWSConnectListApprovedOriginsRequest;
@class AWSConnectListApprovedOriginsResponse;
@class AWSConnectListBotsRequest;
@class AWSConnectListBotsResponse;
@class AWSConnectListContactEvaluationsRequest;
@class AWSConnectListContactEvaluationsResponse;
@class AWSConnectListContactFlowModulesRequest;
@class AWSConnectListContactFlowModulesResponse;
@class AWSConnectListContactFlowsRequest;
@class AWSConnectListContactFlowsResponse;
@class AWSConnectListContactReferencesRequest;
@class AWSConnectListContactReferencesResponse;
@class AWSConnectListDefaultVocabulariesRequest;
@class AWSConnectListDefaultVocabulariesResponse;
@class AWSConnectListEvaluationFormVersionsRequest;
@class AWSConnectListEvaluationFormVersionsResponse;
@class AWSConnectListEvaluationFormsRequest;
@class AWSConnectListEvaluationFormsResponse;
@class AWSConnectListHoursOfOperationsRequest;
@class AWSConnectListHoursOfOperationsResponse;
@class AWSConnectListInstanceAttributesRequest;
@class AWSConnectListInstanceAttributesResponse;
@class AWSConnectListInstanceStorageConfigsRequest;
@class AWSConnectListInstanceStorageConfigsResponse;
@class AWSConnectListInstancesRequest;
@class AWSConnectListInstancesResponse;
@class AWSConnectListIntegrationAssociationsRequest;
@class AWSConnectListIntegrationAssociationsResponse;
@class AWSConnectListLambdaFunctionsRequest;
@class AWSConnectListLambdaFunctionsResponse;
@class AWSConnectListLexBotsRequest;
@class AWSConnectListLexBotsResponse;
@class AWSConnectListPhoneNumbersRequest;
@class AWSConnectListPhoneNumbersResponse;
@class AWSConnectListPhoneNumbersSummary;
@class AWSConnectListPhoneNumbersV2Request;
@class AWSConnectListPhoneNumbersV2Response;
@class AWSConnectListPromptsRequest;
@class AWSConnectListPromptsResponse;
@class AWSConnectListQueueQuickConnectsRequest;
@class AWSConnectListQueueQuickConnectsResponse;
@class AWSConnectListQueuesRequest;
@class AWSConnectListQueuesResponse;
@class AWSConnectListQuickConnectsRequest;
@class AWSConnectListQuickConnectsResponse;
@class AWSConnectListRoutingProfileQueuesRequest;
@class AWSConnectListRoutingProfileQueuesResponse;
@class AWSConnectListRoutingProfilesRequest;
@class AWSConnectListRoutingProfilesResponse;
@class AWSConnectListRulesRequest;
@class AWSConnectListRulesResponse;
@class AWSConnectListSecurityKeysRequest;
@class AWSConnectListSecurityKeysResponse;
@class AWSConnectListSecurityProfilePermissionsRequest;
@class AWSConnectListSecurityProfilePermissionsResponse;
@class AWSConnectListSecurityProfilesRequest;
@class AWSConnectListSecurityProfilesResponse;
@class AWSConnectListTagsForResourceRequest;
@class AWSConnectListTagsForResourceResponse;
@class AWSConnectListTaskTemplatesRequest;
@class AWSConnectListTaskTemplatesResponse;
@class AWSConnectListTrafficDistributionGroupsRequest;
@class AWSConnectListTrafficDistributionGroupsResponse;
@class AWSConnectListUseCasesRequest;
@class AWSConnectListUseCasesResponse;
@class AWSConnectListUserHierarchyGroupsRequest;
@class AWSConnectListUserHierarchyGroupsResponse;
@class AWSConnectListUsersRequest;
@class AWSConnectListUsersResponse;
@class AWSConnectMediaConcurrency;
@class AWSConnectMetricDataV2;
@class AWSConnectMetricFilterV2;
@class AWSConnectMetricResultV2;
@class AWSConnectMetricV2;
@class AWSConnectMonitorContactRequest;
@class AWSConnectMonitorContactResponse;
@class AWSConnectNotificationRecipientType;
@class AWSConnectNumberReference;
@class AWSConnectNumericQuestionPropertyValueAutomation;
@class AWSConnectOutboundCallerConfig;
@class AWSConnectParticipantDetails;
@class AWSConnectParticipantDetailsToAdd;
@class AWSConnectParticipantTimerConfiguration;
@class AWSConnectParticipantTimerValue;
@class AWSConnectParticipantTokenCredentials;
@class AWSConnectPersistentChat;
@class AWSConnectPhoneNumberQuickConnectConfig;
@class AWSConnectPhoneNumberStatus;
@class AWSConnectPhoneNumberSummary;
@class AWSConnectProblemDetail;
@class AWSConnectPrompt;
@class AWSConnectPromptSummary;
@class AWSConnectPropertyValidationExceptionProperty;
@class AWSConnectPutUserStatusRequest;
@class AWSConnectPutUserStatusResponse;
@class AWSConnectQueue;
@class AWSConnectQueueInfo;
@class AWSConnectQueueQuickConnectConfig;
@class AWSConnectQueueReference;
@class AWSConnectQueueSearchCriteria;
@class AWSConnectQueueSearchFilter;
@class AWSConnectQueueSummary;
@class AWSConnectQuickConnect;
@class AWSConnectQuickConnectConfig;
@class AWSConnectQuickConnectSummary;
@class AWSConnectReadOnlyFieldInfo;
@class AWSConnectReference;
@class AWSConnectReferenceSummary;
@class AWSConnectReleasePhoneNumberRequest;
@class AWSConnectReplicateInstanceRequest;
@class AWSConnectReplicateInstanceResponse;
@class AWSConnectRequiredFieldInfo;
@class AWSConnectResumeContactRecordingRequest;
@class AWSConnectResumeContactRecordingResponse;
@class AWSConnectRoutingProfile;
@class AWSConnectRoutingProfileQueueConfig;
@class AWSConnectRoutingProfileQueueConfigSummary;
@class AWSConnectRoutingProfileQueueReference;
@class AWSConnectRoutingProfileReference;
@class AWSConnectRoutingProfileSearchCriteria;
@class AWSConnectRoutingProfileSearchFilter;
@class AWSConnectRoutingProfileSummary;
@class AWSConnectRule;
@class AWSConnectRuleAction;
@class AWSConnectRuleSummary;
@class AWSConnectRuleTriggerEventSource;
@class AWSConnectS3Config;
@class AWSConnectSearchAvailablePhoneNumbersRequest;
@class AWSConnectSearchAvailablePhoneNumbersResponse;
@class AWSConnectSearchQueuesRequest;
@class AWSConnectSearchQueuesResponse;
@class AWSConnectSearchRoutingProfilesRequest;
@class AWSConnectSearchRoutingProfilesResponse;
@class AWSConnectSearchSecurityProfilesRequest;
@class AWSConnectSearchSecurityProfilesResponse;
@class AWSConnectSearchUsersRequest;
@class AWSConnectSearchUsersResponse;
@class AWSConnectSearchVocabulariesRequest;
@class AWSConnectSearchVocabulariesResponse;
@class AWSConnectSecurityKey;
@class AWSConnectSecurityProfile;
@class AWSConnectSecurityProfileSearchCriteria;
@class AWSConnectSecurityProfileSearchSummary;
@class AWSConnectSecurityProfileSummary;
@class AWSConnectSecurityProfilesSearchFilter;
@class AWSConnectSendNotificationActionDefinition;
@class AWSConnectSingleSelectQuestionRuleCategoryAutomation;
@class AWSConnectStartChatContactRequest;
@class AWSConnectStartChatContactResponse;
@class AWSConnectStartContactEvaluationRequest;
@class AWSConnectStartContactEvaluationResponse;
@class AWSConnectStartContactRecordingRequest;
@class AWSConnectStartContactRecordingResponse;
@class AWSConnectStartContactStreamingRequest;
@class AWSConnectStartContactStreamingResponse;
@class AWSConnectStartOutboundVoiceContactRequest;
@class AWSConnectStartOutboundVoiceContactResponse;
@class AWSConnectStartTaskContactRequest;
@class AWSConnectStartTaskContactResponse;
@class AWSConnectStopContactRecordingRequest;
@class AWSConnectStopContactRecordingResponse;
@class AWSConnectStopContactRequest;
@class AWSConnectStopContactResponse;
@class AWSConnectStopContactStreamingRequest;
@class AWSConnectStopContactStreamingResponse;
@class AWSConnectStringCondition;
@class AWSConnectStringReference;
@class AWSConnectSubmitContactEvaluationRequest;
@class AWSConnectSubmitContactEvaluationResponse;
@class AWSConnectSuspendContactRecordingRequest;
@class AWSConnectSuspendContactRecordingResponse;
@class AWSConnectTagCondition;
@class AWSConnectTagResourceRequest;
@class AWSConnectTaskActionDefinition;
@class AWSConnectTaskTemplateConstraints;
@class AWSConnectTaskTemplateDefaultFieldValue;
@class AWSConnectTaskTemplateDefaults;
@class AWSConnectTaskTemplateField;
@class AWSConnectTaskTemplateFieldIdentifier;
@class AWSConnectTaskTemplateMetadata;
@class AWSConnectTelephonyConfig;
@class AWSConnectThreshold;
@class AWSConnectThresholdV2;
@class AWSConnectTrafficDistributionGroup;
@class AWSConnectTrafficDistributionGroupSummary;
@class AWSConnectTransferContactRequest;
@class AWSConnectTransferContactResponse;
@class AWSConnectUntagResourceRequest;
@class AWSConnectUpdateAgentStatusRequest;
@class AWSConnectUpdateContactAttributesRequest;
@class AWSConnectUpdateContactAttributesResponse;
@class AWSConnectUpdateContactEvaluationRequest;
@class AWSConnectUpdateContactEvaluationResponse;
@class AWSConnectUpdateContactFlowContentRequest;
@class AWSConnectUpdateContactFlowContentResponse;
@class AWSConnectUpdateContactFlowMetadataRequest;
@class AWSConnectUpdateContactFlowMetadataResponse;
@class AWSConnectUpdateContactFlowModuleContentRequest;
@class AWSConnectUpdateContactFlowModuleContentResponse;
@class AWSConnectUpdateContactFlowModuleMetadataRequest;
@class AWSConnectUpdateContactFlowModuleMetadataResponse;
@class AWSConnectUpdateContactFlowNameRequest;
@class AWSConnectUpdateContactFlowNameResponse;
@class AWSConnectUpdateContactRequest;
@class AWSConnectUpdateContactResponse;
@class AWSConnectUpdateContactScheduleRequest;
@class AWSConnectUpdateContactScheduleResponse;
@class AWSConnectUpdateEvaluationFormRequest;
@class AWSConnectUpdateEvaluationFormResponse;
@class AWSConnectUpdateHoursOfOperationRequest;
@class AWSConnectUpdateInstanceAttributeRequest;
@class AWSConnectUpdateInstanceStorageConfigRequest;
@class AWSConnectUpdateParticipantRoleConfigChannelInfo;
@class AWSConnectUpdateParticipantRoleConfigRequest;
@class AWSConnectUpdateParticipantRoleConfigResponse;
@class AWSConnectUpdatePhoneNumberRequest;
@class AWSConnectUpdatePhoneNumberResponse;
@class AWSConnectUpdatePromptRequest;
@class AWSConnectUpdatePromptResponse;
@class AWSConnectUpdateQueueHoursOfOperationRequest;
@class AWSConnectUpdateQueueMaxContactsRequest;
@class AWSConnectUpdateQueueNameRequest;
@class AWSConnectUpdateQueueOutboundCallerConfigRequest;
@class AWSConnectUpdateQueueStatusRequest;
@class AWSConnectUpdateQuickConnectConfigRequest;
@class AWSConnectUpdateQuickConnectNameRequest;
@class AWSConnectUpdateRoutingProfileConcurrencyRequest;
@class AWSConnectUpdateRoutingProfileDefaultOutboundQueueRequest;
@class AWSConnectUpdateRoutingProfileNameRequest;
@class AWSConnectUpdateRoutingProfileQueuesRequest;
@class AWSConnectUpdateRuleRequest;
@class AWSConnectUpdateSecurityProfileRequest;
@class AWSConnectUpdateTaskTemplateRequest;
@class AWSConnectUpdateTaskTemplateResponse;
@class AWSConnectUpdateTrafficDistributionRequest;
@class AWSConnectUpdateTrafficDistributionResponse;
@class AWSConnectUpdateUserHierarchyGroupNameRequest;
@class AWSConnectUpdateUserHierarchyRequest;
@class AWSConnectUpdateUserHierarchyStructureRequest;
@class AWSConnectUpdateUserIdentityInfoRequest;
@class AWSConnectUpdateUserPhoneConfigRequest;
@class AWSConnectUpdateUserRoutingProfileRequest;
@class AWSConnectUpdateUserSecurityProfilesRequest;
@class AWSConnectUrlReference;
@class AWSConnectUseCase;
@class AWSConnectUser;
@class AWSConnectUserData;
@class AWSConnectUserDataFilters;
@class AWSConnectUserIdentityInfo;
@class AWSConnectUserIdentityInfoLite;
@class AWSConnectUserPhoneConfig;
@class AWSConnectUserQuickConnectConfig;
@class AWSConnectUserReference;
@class AWSConnectUserSearchCriteria;
@class AWSConnectUserSearchFilter;
@class AWSConnectUserSearchSummary;
@class AWSConnectUserSummary;
@class AWSConnectVocabulary;
@class AWSConnectVocabularySummary;
@class AWSConnectVoiceRecordingConfiguration;
@class AWSConnectWisdomInfo;

/**
 <p>Information about an action.</p>
 Required parameters: [ActionType]
 */
@interface AWSConnectActionSummary : AWSModel


/**
 <p>The action type.</p>
 */
@property (nonatomic, assign) AWSConnectActionType actionType;

@end

/**
 
 */
@interface AWSConnectActivateEvaluationFormRequest : AWSRequest


/**
 <p>The unique identifier for the evaluation form.</p>
 */
@property (nonatomic, strong) NSString * _Nullable evaluationFormId;

/**
 <p>The version of the evaluation form to activate. If the version property is not provided, the latest version of the evaluation form is activated.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable evaluationFormVersion;

/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

@end

/**
 
 */
@interface AWSConnectActivateEvaluationFormResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) for the evaluation form resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable evaluationFormArn;

/**
 <p>The unique identifier for the evaluation form.</p>
 */
@property (nonatomic, strong) NSString * _Nullable evaluationFormId;

/**
 <p>A version of the evaluation form.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable evaluationFormVersion;

@end

/**
 <p>Information about the <a href="https://docs.aws.amazon.com/connect/latest/APIReference/API_Contact.html">contact</a> associated to the user.</p>
 */
@interface AWSConnectAgentContactReference : AWSModel


/**
 <p>The <a href="https://docs.aws.amazon.com/connect/latest/adminguide/about-contact-states.html">state of the contact</a>.</p>
 */
@property (nonatomic, assign) AWSConnectContactState agentContactState;

/**
 <p>The channel of the contact.</p>
 */
@property (nonatomic, assign) AWSConnectChannel channel;

/**
 <p>The time at which the contact was connected to an agent.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable connectedToAgentTimestamp;

/**
 <p>The identifier of the contact in this instance of Amazon Connect. </p>
 */
@property (nonatomic, strong) NSString * _Nullable contactId;

/**
 <p>How the contact was initiated.</p>
 */
@property (nonatomic, assign) AWSConnectContactInitiationMethod initiationMethod;

/**
 <p>Contains information about a queue resource for which metrics are returned.</p>
 */
@property (nonatomic, strong) AWSConnectQueueReference * _Nullable queue;

/**
 <p>The epoch timestamp when the contact state started.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable stateStartTimestamp;

@end

/**
 <p>Information about the agent who accepted the contact.</p>
 */
@interface AWSConnectAgentInfo : AWSModel


/**
 <p>The timestamp when the contact was connected to the agent.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable connectedToAgentTimestamp;

/**
 <p>The identifier of the agent who accepted the contact.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

@end

/**
 <p>Contains information about an agent status.</p>
 */
@interface AWSConnectAgentStatus : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the agent status.</p>
 */
@property (nonatomic, strong) NSString * _Nullable agentStatusARN;

/**
 <p>The identifier of the agent status.</p>
 */
@property (nonatomic, strong) NSString * _Nullable agentStatusId;

/**
 <p>The description of the agent status.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The display order of the agent status.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable displayOrder;

/**
 <p>The name of the agent status.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The state of the agent status.</p>
 */
@property (nonatomic, assign) AWSConnectAgentStatusState state;

/**
 <p>The tags used to organize, track, or control access for this resource. For example, { "tags": {"key1":"value1", "key2":"value2"} }.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

/**
 <p>The type of agent status.</p>
 */
@property (nonatomic, assign) AWSConnectAgentStatusType types;

@end

/**
 <p>Information about the agent's status.</p>
 */
@interface AWSConnectAgentStatusReference : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the agent's status.</p>
 */
@property (nonatomic, strong) NSString * _Nullable statusArn;

/**
 <p>The name of the agent status.</p>
 */
@property (nonatomic, strong) NSString * _Nullable statusName;

/**
 <p>The start timestamp of the agent's status.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable statusStartTimestamp;

@end

/**
 <p>Summary information for an agent status.</p>
 */
@interface AWSConnectAgentStatusSummary : AWSModel


/**
 <p>The Amazon Resource Name (ARN) for the agent status.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The identifier for an agent status.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The name of the agent status.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The type of the agent status.</p>
 */
@property (nonatomic, assign) AWSConnectAgentStatusType types;

@end

/**
 <p>Configuration of the answering machine detection.</p>
 */
@interface AWSConnectAnswerMachineDetectionConfig : AWSModel


/**
 <p>Wait for the answering machine prompt.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable awaitAnswerMachinePrompt;

/**
 <p>The flag to indicate if answer machine detection analysis needs to be performed for a voice call. If set to <code>true</code>, <code>TrafficType</code> must be set as <code>CAMPAIGN</code>. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enableAnswerMachineDetection;

@end

/**
 <p>This action must be set if <code>TriggerEventSource</code> is one of the following values: <code>OnPostCallAnalysisAvailable</code> | <code>OnRealTimeCallAnalysisAvailable</code> | <code>OnPostChatAnalysisAvailable</code>. Contact is categorized using the rule name.</p><p><code>RuleName</code> is used as <code>ContactCategory</code>.</p>
 */
@interface AWSConnectAssignContactCategoryActionDefinition : AWSModel


@end

/**
 
 */
@interface AWSConnectAssociateApprovedOriginRequest : AWSRequest


/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The domain to add to your allow list.</p>
 */
@property (nonatomic, strong) NSString * _Nullable origin;

@end

/**
 
 */
@interface AWSConnectAssociateBotRequest : AWSRequest


/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>Configuration information of an Amazon Lex bot.</p>
 */
@property (nonatomic, strong) AWSConnectLexBot * _Nullable lexBot;

/**
 <p>The Amazon Lex V2 bot to associate with the instance.</p>
 */
@property (nonatomic, strong) AWSConnectLexV2Bot * _Nullable lexV2Bot;

@end

/**
 
 */
@interface AWSConnectAssociateDefaultVocabularyRequest : AWSRequest


/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The language code of the vocabulary entries. For a list of languages and their corresponding language codes, see <a href="https://docs.aws.amazon.com/transcribe/latest/dg/transcribe-whatis.html">What is Amazon Transcribe?</a></p>
 */
@property (nonatomic, assign) AWSConnectVocabularyLanguageCode languageCode;

/**
 <p>The identifier of the custom vocabulary. If this is empty, the default is set to none.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vocabularyId;

@end

/**
 
 */
@interface AWSConnectAssociateDefaultVocabularyResponse : AWSModel


@end

/**
 
 */
@interface AWSConnectAssociateInstanceStorageConfigRequest : AWSRequest


/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>A valid resource type.</p>
 */
@property (nonatomic, assign) AWSConnectInstanceStorageResourceType resourceType;

/**
 <p>A valid storage type.</p>
 */
@property (nonatomic, strong) AWSConnectInstanceStorageConfig * _Nullable storageConfig;

@end

/**
 
 */
@interface AWSConnectAssociateInstanceStorageConfigResponse : AWSModel


/**
 <p>The existing association identifier that uniquely identifies the resource type and storage config for the given instance ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable associationId;

@end

/**
 
 */
@interface AWSConnectAssociateLambdaFunctionRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) for the Lambda function being associated. Maximum number of characters allowed is 140.</p>
 */
@property (nonatomic, strong) NSString * _Nullable functionArn;

/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

@end

/**
 
 */
@interface AWSConnectAssociateLexBotRequest : AWSRequest


/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The Amazon Lex bot to associate with the instance.</p>
 */
@property (nonatomic, strong) AWSConnectLexBot * _Nullable lexBot;

@end

/**
 
 */
@interface AWSConnectAssociatePhoneNumberContactFlowRequest : AWSRequest


/**
 <p>The identifier of the flow.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contactFlowId;

/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>A unique identifier for the phone number.</p>
 */
@property (nonatomic, strong) NSString * _Nullable phoneNumberId;

@end

/**
 
 */
@interface AWSConnectAssociateQueueQuickConnectsRequest : AWSRequest


/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The identifier for the queue.</p>
 */
@property (nonatomic, strong) NSString * _Nullable queueId;

/**
 <p>The quick connects to associate with this queue.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable quickConnectIds;

@end

/**
 
 */
@interface AWSConnectAssociateRoutingProfileQueuesRequest : AWSRequest


/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The queues to associate with this routing profile.</p>
 */
@property (nonatomic, strong) NSArray<AWSConnectRoutingProfileQueueConfig *> * _Nullable queueConfigs;

/**
 <p>The identifier of the routing profile.</p>
 */
@property (nonatomic, strong) NSString * _Nullable routingProfileId;

@end

/**
 
 */
@interface AWSConnectAssociateSecurityKeyRequest : AWSRequest


/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>A valid security key in PEM format.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

@end

/**
 
 */
@interface AWSConnectAssociateSecurityKeyResponse : AWSModel


/**
 <p>The existing association identifier that uniquely identifies the resource type and storage config for the given instance ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable associationId;

@end

/**
 <p>Information about a reference when the <code>referenceType</code> is <code>ATTACHMENT</code>. Otherwise, null.</p>
 */
@interface AWSConnectAttachmentReference : AWSModel


/**
 <p>Identifier of the attachment reference.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>Status of the attachment reference type.</p>
 */
@property (nonatomic, assign) AWSConnectReferenceStatus status;

/**
 <p>The location path of the attachment reference.</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 <p>A toggle for an individual feature at the instance level.</p>
 */
@interface AWSConnectAttribute : AWSModel


/**
 <p>The type of attribute.</p>
 */
@property (nonatomic, assign) AWSConnectInstanceAttributeType attributeType;

/**
 <p>The value of the attribute.</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 <p>Information about available phone numbers.</p>
 */
@interface AWSConnectAvailableNumberSummary : AWSModel


/**
 <p>The phone number. Phone numbers are formatted <code>[+] [country code] [subscriber number including area code]</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable phoneNumber;

/**
 <p>The ISO country code.</p>
 */
@property (nonatomic, assign) AWSConnectPhoneNumberCountryCode phoneNumberCountryCode;

/**
 <p>The type of phone number.</p>
 */
@property (nonatomic, assign) AWSConnectPhoneNumberType phoneNumberType;

@end

/**
 <p>A chat message.</p>
 Required parameters: [ContentType, Content]
 */
@interface AWSConnectChatMessage : AWSModel


/**
 <p>The content of the chat message. </p><ul><li><p>For <code>text/plain</code> and <code>text/markdown</code>, the Length Constraints are Minimum of 1, Maximum of 1024. </p></li><li><p>For <code>application/json</code>, the Length Constraints are Minimum of 1, Maximum of 12000. </p></li><li><p>For <code>application/vnd.amazonaws.connect.message.interactive.response</code>, the Length Constraints are Minimum of 1, Maximum of 12288.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable content;

/**
 <p>The type of the content. Supported types are <code>text/plain</code>, <code>text/markdown</code>, <code>application/json</code>, and <code>application/vnd.amazonaws.connect.message.interactive.response</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contentType;

@end

/**
 <p>Configuration information for the chat participant role.</p>
 Required parameters: [ParticipantTimerConfigList]
 */
@interface AWSConnectChatParticipantRoleConfig : AWSModel


/**
 <p>A list of participant timers. You can specify any unique combination of role and timer type. Duplicate entries error out the request with a 400.</p>
 */
@property (nonatomic, strong) NSArray<AWSConnectParticipantTimerConfiguration *> * _Nullable participantTimerConfigList;

@end

/**
 <p>The streaming configuration, such as the Amazon SNS streaming endpoint.</p>
 Required parameters: [StreamingEndpointArn]
 */
@interface AWSConnectChatStreamingConfiguration : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the standard Amazon SNS topic. The Amazon Resource Name (ARN) of the streaming endpoint that is used to publish real-time message streaming for chat conversations.</p>
 */
@property (nonatomic, strong) NSString * _Nullable streamingEndpointArn;

@end

/**
 
 */
@interface AWSConnectClaimPhoneNumberRequest : AWSRequest


/**
 <p>A unique, case-sensitive identifier that you provide to ensure the idempotency of the request. If not provided, the Amazon Web Services SDK populates this field. For more information about idempotency, see <a href="https://aws.amazon.com/builders-library/making-retries-safe-with-idempotent-APIs/">Making retries safe with idempotent APIs</a>.</p><p>Pattern: <code>^[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}$</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>The phone number you want to claim. Phone numbers are formatted <code>[+] [country code] [subscriber number including area code]</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable phoneNumber;

/**
 <p>The description of the phone number.</p>
 */
@property (nonatomic, strong) NSString * _Nullable phoneNumberDescription;

/**
 <p>The tags used to organize, track, or control access for this resource. For example, { "tags": {"key1":"value1", "key2":"value2"} }.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

/**
 <p>The Amazon Resource Name (ARN) for Amazon Connect instances or traffic distribution groups that phone numbers are claimed to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable targetArn;

@end

/**
 
 */
@interface AWSConnectClaimPhoneNumberResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the phone number.</p>
 */
@property (nonatomic, strong) NSString * _Nullable phoneNumberArn;

/**
 <p>A unique identifier for the phone number.</p>
 */
@property (nonatomic, strong) NSString * _Nullable phoneNumberId;

@end

/**
 <p>Information about a phone number that has been claimed to your Amazon Connect instance or traffic distribution group.</p>
 */
@interface AWSConnectClaimedPhoneNumberSummary : AWSModel


/**
 <p>The phone number. Phone numbers are formatted <code>[+] [country code] [subscriber number including area code]</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable phoneNumber;

/**
 <p>The Amazon Resource Name (ARN) of the phone number.</p>
 */
@property (nonatomic, strong) NSString * _Nullable phoneNumberArn;

/**
 <p>The ISO country code.</p>
 */
@property (nonatomic, assign) AWSConnectPhoneNumberCountryCode phoneNumberCountryCode;

/**
 <p>The description of the phone number.</p>
 */
@property (nonatomic, strong) NSString * _Nullable phoneNumberDescription;

/**
 <p>A unique identifier for the phone number.</p>
 */
@property (nonatomic, strong) NSString * _Nullable phoneNumberId;

/**
 <p>The status of the phone number.</p><ul><li><p><code>CLAIMED</code> means the previous <a href="https://docs.aws.amazon.com/connect/latest/APIReference/API_ClaimedPhoneNumber.html">ClaimedPhoneNumber</a> or <a href="https://docs.aws.amazon.com/connect/latest/APIReference/API_UpdatePhoneNumber.html">UpdatePhoneNumber</a> operation succeeded.</p></li><li><p><code>IN_PROGRESS</code> means a <a href="https://docs.aws.amazon.com/connect/latest/APIReference/API_ClaimedPhoneNumber.html">ClaimedPhoneNumber</a> or <a href="https://docs.aws.amazon.com/connect/latest/APIReference/API_UpdatePhoneNumber.html">UpdatePhoneNumber</a> operation is still in progress and has not yet completed. You can call <a href="https://docs.aws.amazon.com/connect/latest/APIReference/API_DescribePhoneNumber.html">DescribePhoneNumber</a> at a later time to verify if the previous operation has completed.</p></li><li><p><code>FAILED</code> indicates that the previous <a href="https://docs.aws.amazon.com/connect/latest/APIReference/API_ClaimedPhoneNumber.html">ClaimedPhoneNumber</a> or <a href="https://docs.aws.amazon.com/connect/latest/APIReference/API_UpdatePhoneNumber.html">UpdatePhoneNumber</a> operation has failed. It will include a message indicating the failure reason. A common reason for a failure may be that the <code>TargetArn</code> value you are claiming or updating a phone number to has reached its limit of total claimed numbers. If you received a <code>FAILED</code> status from a <code>ClaimPhoneNumber</code> API call, you have one day to retry claiming the phone number before the number is released back to the inventory for other customers to claim.</p></li></ul><note><p>You will not be billed for the phone number during the 1-day period if number claiming fails. </p></note>
 */
@property (nonatomic, strong) AWSConnectPhoneNumberStatus * _Nullable phoneNumberStatus;

/**
 <p>The type of phone number.</p>
 */
@property (nonatomic, assign) AWSConnectPhoneNumberType phoneNumberType;

/**
 <p>The tags used to organize, track, or control access for this resource. For example, { "tags": {"key1":"value1", "key2":"value2"} }.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

/**
 <p>The Amazon Resource Name (ARN) for Amazon Connect instances or traffic distribution groups that phone numbers are claimed to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable targetArn;

@end

/**
 <p>Contains information about a contact.</p>
 */
@interface AWSConnectContact : AWSModel


/**
 <p>Information about the agent who accepted the contact.</p>
 */
@property (nonatomic, strong) AWSConnectAgentInfo * _Nullable agentInfo;

/**
 <p>The Amazon Resource Name (ARN) for the contact.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>How the contact reached your contact center.</p>
 */
@property (nonatomic, assign) AWSConnectChannel channel;

/**
 <p>The description of the contact.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The timestamp when the customer endpoint disconnected from Amazon Connect.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable disconnectTimestamp;

/**
 <p>The identifier for the contact.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>If this contact is related to other contacts, this is the ID of the initial contact.</p>
 */
@property (nonatomic, strong) NSString * _Nullable initialContactId;

/**
 <p>Indicates how the contact was initiated.</p>
 */
@property (nonatomic, assign) AWSConnectContactInitiationMethod initiationMethod;

/**
 <p>The date and time this contact was initiated, in UTC time. For <code>INBOUND</code>, this is when the contact arrived. For <code>OUTBOUND</code>, this is when the agent began dialing. For <code>CALLBACK</code>, this is when the callback contact was created. For <code>TRANSFER</code> and <code>QUEUE_TRANSFER</code>, this is when the transfer was initiated. For <code>API</code>, this is when the request arrived.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable initiationTimestamp;

/**
 <p>The timestamp when contact was last updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdateTimestamp;

/**
 <p>The name of the contact.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>If this contact is not the first contact, this is the ID of the previous contact.</p>
 */
@property (nonatomic, strong) NSString * _Nullable previousContactId;

/**
 <p>If this contact was queued, this contains information about the queue. </p>
 */
@property (nonatomic, strong) AWSConnectQueueInfo * _Nullable queueInfo;

/**
 <p>The contactId that is <a href="https://docs.aws.amazon.com/connect/latest/adminguide/chat-persistence.html#relatedcontactid">related</a> to this contact.</p>
 */
@property (nonatomic, strong) NSString * _Nullable relatedContactId;

/**
 <p>The timestamp, in Unix epoch time format, at which to start running the inbound flow. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable scheduledTimestamp;

/**
 <p>Information about Amazon Connect Wisdom.</p>
 */
@property (nonatomic, strong) AWSConnectWisdomInfo * _Nullable wisdomInfo;

@end

/**
 <p>Filters user data based on the contact information that is associated to the users. It contains a list of <a href="https://docs.aws.amazon.com/connect/latest/adminguide/about-contact-states.html">contact states</a>.</p>
 */
@interface AWSConnectContactFilter : AWSModel


/**
 <p>A list of up to 9 <a href="https://docs.aws.amazon.com/connect/latest/adminguide/about-contact-states.html">contact states</a>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable contactStates;

@end

/**
 <p>Contains information about a flow.</p>
 */
@interface AWSConnectContactFlow : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the flow.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The content of the flow.</p>
 */
@property (nonatomic, strong) NSString * _Nullable content;

/**
 <p>The description of the flow.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The identifier of the flow.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The name of the flow.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The type of flow.</p>
 */
@property (nonatomic, assign) AWSConnectContactFlowState state;

/**
 <p>The tags used to organize, track, or control access for this resource. For example, { "tags": {"key1":"value1", "key2":"value2"} }.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

/**
 <p>The type of the flow. For descriptions of the available types, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/create-contact-flow.html#contact-flow-types">Choose a flow type</a> in the <i>Amazon Connect Administrator Guide</i>.</p>
 */
@property (nonatomic, assign) AWSConnectContactFlowType types;

@end

/**
 <p>Contains information about a flow module.</p>
 */
@interface AWSConnectContactFlowModule : AWSModel


/**
 <p>The Amazon Resource Name (ARN).</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The content of the flow module.</p>
 */
@property (nonatomic, strong) NSString * _Nullable content;

/**
 <p>The description of the flow module.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The identifier of the flow module.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The name of the flow module.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The type of flow module.</p>
 */
@property (nonatomic, assign) AWSConnectContactFlowModuleState state;

/**
 <p>The status of the flow module.</p>
 */
@property (nonatomic, assign) AWSConnectContactFlowModuleStatus status;

/**
 <p>The tags used to organize, track, or control access for this resource. For example, { "tags": {"key1":"value1", "key2":"value2"} }.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 <p>Contains summary information about a flow.</p>
 */
@interface AWSConnectContactFlowModuleSummary : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the flow module.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The identifier of the flow module.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The name of the flow module.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The type of flow module.</p>
 */
@property (nonatomic, assign) AWSConnectContactFlowModuleState state;

@end

/**
 <p>Contains summary information about a flow.</p><p>You can also create and update flows using the <a href="https://docs.aws.amazon.com/connect/latest/APIReference/flow-language.html">Amazon Connect Flow language</a>.</p>
 */
@interface AWSConnectContactFlowSummary : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the flow.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The type of flow.</p>
 */
@property (nonatomic, assign) AWSConnectContactFlowState contactFlowState;

/**
 <p>The type of flow.</p>
 */
@property (nonatomic, assign) AWSConnectContactFlowType contactFlowType;

/**
 <p>The identifier of the flow.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The name of the flow.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 <p>An object that can be used to specify Tag conditions inside the <code>SearchFilter</code>. This accepts an <code>OR</code> of <code>AND</code> (List of List) input where: </p><ul><li><p>Top level list specifies conditions that need to be applied with <code>OR</code> operator</p></li><li><p>Inner list specifies conditions that need to be applied with <code>AND</code> operator.</p></li></ul>
 */
@interface AWSConnectControlPlaneTagFilter : AWSModel


/**
 <p>A list of conditions which would be applied together with an <code>AND</code> condition.</p>
 */
@property (nonatomic, strong) NSArray<AWSConnectTagCondition *> * _Nullable andConditions;

/**
 <p>A list of conditions which would be applied together with an <code>OR</code> condition. </p>
 */
@property (nonatomic, strong) NSArray<NSArray<AWSConnectTagCondition *> *> * _Nullable orConditions;

/**
 <p>A leaf node condition which can be used to specify a tag condition. </p>
 */
@property (nonatomic, strong) AWSConnectTagCondition * _Nullable tagCondition;

@end

/**
 
 */
@interface AWSConnectCreateAgentStatusRequest : AWSRequest


/**
 <p>The description of the status.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The display order of the status.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable displayOrder;

/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The name of the status.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The state of the status.</p>
 */
@property (nonatomic, assign) AWSConnectAgentStatusState state;

/**
 <p>The tags used to organize, track, or control access for this resource. For example, { "tags": {"key1":"value1", "key2":"value2"} }.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSConnectCreateAgentStatusResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the agent status.</p>
 */
@property (nonatomic, strong) NSString * _Nullable agentStatusARN;

/**
 <p>The identifier of the agent status.</p>
 */
@property (nonatomic, strong) NSString * _Nullable agentStatusId;

@end

/**
 
 */
@interface AWSConnectCreateContactFlowModuleRequest : AWSRequest


/**
 <p>A unique, case-sensitive identifier that you provide to ensure the idempotency of the request. If not provided, the Amazon Web Services SDK populates this field. For more information about idempotency, see <a href="https://aws.amazon.com/builders-library/making-retries-safe-with-idempotent-APIs/">Making retries safe with idempotent APIs</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>The content of the flow module.</p>
 */
@property (nonatomic, strong) NSString * _Nullable content;

/**
 <p>The description of the flow module. </p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The name of the flow module.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The tags used to organize, track, or control access for this resource. For example, { "tags": {"key1":"value1", "key2":"value2"} }.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSConnectCreateContactFlowModuleResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the flow module.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The identifier of the flow module.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

@end

/**
 
 */
@interface AWSConnectCreateContactFlowRequest : AWSRequest


/**
 <p>The content of the flow. </p>
 */
@property (nonatomic, strong) NSString * _Nullable content;

/**
 <p>The description of the flow. </p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The identifier of the Amazon Connect instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The name of the flow.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The tags used to organize, track, or control access for this resource. For example, { "tags": {"key1":"value1", "key2":"value2"} }.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

/**
 <p>The type of the flow. For descriptions of the available types, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/create-contact-flow.html#contact-flow-types">Choose a flow type</a> in the <i>Amazon Connect Administrator Guide</i>.</p>
 */
@property (nonatomic, assign) AWSConnectContactFlowType types;

@end

/**
 
 */
@interface AWSConnectCreateContactFlowResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the flow.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contactFlowArn;

/**
 <p>The identifier of the flow.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contactFlowId;

@end

/**
 
 */
@interface AWSConnectCreateEvaluationFormRequest : AWSRequest


/**
 <p>A unique, case-sensitive identifier that you provide to ensure the idempotency of the request. If not provided, the Amazon Web Services SDK populates this field. For more information about idempotency, see <a href="https://aws.amazon.com/builders-library/making-retries-safe-with-idempotent-APIs/">Making retries safe with idempotent APIs</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>The description of the evaluation form.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>Items that are part of the evaluation form. The total number of sections and questions must not exceed 100 each. Questions must be contained in a section.</p>
 */
@property (nonatomic, strong) NSArray<AWSConnectEvaluationFormItem *> * _Nullable items;

/**
 <p>A scoring strategy of the evaluation form.</p>
 */
@property (nonatomic, strong) AWSConnectEvaluationFormScoringStrategy * _Nullable scoringStrategy;

/**
 <p>A title of the evaluation form.</p>
 */
@property (nonatomic, strong) NSString * _Nullable title;

@end

/**
 
 */
@interface AWSConnectCreateEvaluationFormResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) for the evaluation form resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable evaluationFormArn;

/**
 <p>The unique identifier for the evaluation form.</p>
 */
@property (nonatomic, strong) NSString * _Nullable evaluationFormId;

@end

/**
 
 */
@interface AWSConnectCreateHoursOfOperationRequest : AWSRequest


/**
 <p>Configuration information for the hours of operation: day, start time, and end time.</p>
 */
@property (nonatomic, strong) NSArray<AWSConnectHoursOfOperationConfig *> * _Nullable config;

/**
 <p>The description of the hours of operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The name of the hours of operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The tags used to organize, track, or control access for this resource. For example, { "tags": {"key1":"value1", "key2":"value2"} }.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

/**
 <p>The time zone of the hours of operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable timeZone;

@end

/**
 
 */
@interface AWSConnectCreateHoursOfOperationResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) for the hours of operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable hoursOfOperationArn;

/**
 <p>The identifier for the hours of operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable hoursOfOperationId;

@end

/**
 
 */
@interface AWSConnectCreateInstanceRequest : AWSRequest


/**
 <p>The idempotency token.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>The identifier for the directory.</p>
 */
@property (nonatomic, strong) NSString * _Nullable directoryId;

/**
 <p>The type of identity management for your Amazon Connect users.</p>
 */
@property (nonatomic, assign) AWSConnectDirectoryType identityManagementType;

/**
 <p>Your contact center handles incoming contacts.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable inboundCallsEnabled;

/**
 <p>The name for your instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceAlias;

/**
 <p>Your contact center allows outbound calls.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable outboundCallsEnabled;

@end

/**
 
 */
@interface AWSConnectCreateInstanceResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The identifier for the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

@end

/**
 
 */
@interface AWSConnectCreateIntegrationAssociationRequest : AWSRequest


/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The Amazon Resource Name (ARN) of the integration.</p><note><p>When integrating with Amazon Pinpoint, the Amazon Connect and Amazon Pinpoint instances must be in the same account.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable integrationArn;

/**
 <p>The type of information to be ingested.</p>
 */
@property (nonatomic, assign) AWSConnectIntegrationType integrationType;

/**
 <p>The name of the external application. This field is only required for the EVENT integration type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceApplicationName;

/**
 <p>The URL for the external application. This field is only required for the EVENT integration type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceApplicationUrl;

/**
 <p>The type of the data source. This field is only required for the EVENT integration type.</p>
 */
@property (nonatomic, assign) AWSConnectSourceType sourceType;

/**
 <p>The tags used to organize, track, or control access for this resource. For example, { "tags": {"key1":"value1", "key2":"value2"} }.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSConnectCreateIntegrationAssociationResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) for the association.</p>
 */
@property (nonatomic, strong) NSString * _Nullable integrationAssociationArn;

/**
 <p>The identifier for the integration association.</p>
 */
@property (nonatomic, strong) NSString * _Nullable integrationAssociationId;

@end

/**
 
 */
@interface AWSConnectCreateParticipantRequest : AWSRequest


/**
 <p>A unique, case-sensitive identifier that you provide to ensure the idempotency of the request. If not provided, the Amazon Web Services SDK populates this field. For more information about idempotency, see <a href="https://aws.amazon.com/builders-library/making-retries-safe-with-idempotent-APIs/">Making retries safe with idempotent APIs</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>The identifier of the contact in this instance of Amazon Connect. Only contacts in the CHAT channel are supported.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contactId;

/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance. </p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>Information identifying the participant.</p><important><p>The only Valid value for <code>ParticipantRole</code> is <code>CUSTOM_BOT</code>. </p><p><code>DisplayName</code> is <b>Required</b>.</p></important>
 */
@property (nonatomic, strong) AWSConnectParticipantDetailsToAdd * _Nullable participantDetails;

@end

/**
 
 */
@interface AWSConnectCreateParticipantResponse : AWSModel


/**
 <p>The token used by the chat participant to call <code>CreateParticipantConnection</code>. The participant token is valid for the lifetime of a chat participant.</p>
 */
@property (nonatomic, strong) AWSConnectParticipantTokenCredentials * _Nullable participantCredentials;

/**
 <p>The identifier for a chat participant. The participantId for a chat participant is the same throughout the chat lifecycle.</p>
 */
@property (nonatomic, strong) NSString * _Nullable participantId;

@end

/**
 
 */
@interface AWSConnectCreatePromptRequest : AWSRequest


/**
 <p>The description of the prompt.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The name of the prompt.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The URI for the S3 bucket where the prompt is stored.</p>
 */
@property (nonatomic, strong) NSString * _Nullable s3Uri;

/**
 <p>The tags used to organize, track, or control access for this resource. For example, { "tags": {"key1":"value1", "key2":"value2"} }.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSConnectCreatePromptResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the prompt.</p>
 */
@property (nonatomic, strong) NSString * _Nullable promptARN;

/**
 <p>A unique identifier for the prompt.</p>
 */
@property (nonatomic, strong) NSString * _Nullable promptId;

@end

/**
 
 */
@interface AWSConnectCreateQueueRequest : AWSRequest


/**
 <p>The description of the queue.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The identifier for the hours of operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable hoursOfOperationId;

/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The maximum number of contacts that can be in the queue before it is considered full.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxContacts;

/**
 <p>The name of the queue.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The outbound caller ID name, number, and outbound whisper flow.</p>
 */
@property (nonatomic, strong) AWSConnectOutboundCallerConfig * _Nullable outboundCallerConfig;

/**
 <p>The quick connects available to agents who are working the queue.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable quickConnectIds;

/**
 <p>The tags used to organize, track, or control access for this resource. For example, { "tags": {"key1":"value1", "key2":"value2"} }.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSConnectCreateQueueResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the queue.</p>
 */
@property (nonatomic, strong) NSString * _Nullable queueArn;

/**
 <p>The identifier for the queue.</p>
 */
@property (nonatomic, strong) NSString * _Nullable queueId;

@end

/**
 
 */
@interface AWSConnectCreateQuickConnectRequest : AWSRequest


/**
 <p>The description of the quick connect.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The name of the quick connect.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>Configuration settings for the quick connect.</p>
 */
@property (nonatomic, strong) AWSConnectQuickConnectConfig * _Nullable quickConnectConfig;

/**
 <p>The tags used to organize, track, or control access for this resource. For example, { "tags": {"key1":"value1", "key2":"value2"} }.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSConnectCreateQuickConnectResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) for the quick connect. </p>
 */
@property (nonatomic, strong) NSString * _Nullable quickConnectARN;

/**
 <p>The identifier for the quick connect. </p>
 */
@property (nonatomic, strong) NSString * _Nullable quickConnectId;

@end

/**
 
 */
@interface AWSConnectCreateRoutingProfileRequest : AWSRequest


/**
 <p>The default outbound queue for the routing profile.</p>
 */
@property (nonatomic, strong) NSString * _Nullable defaultOutboundQueueId;

/**
 <p>Description of the routing profile. Must not be more than 250 characters.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The channels that agents can handle in the Contact Control Panel (CCP) for this routing profile.</p>
 */
@property (nonatomic, strong) NSArray<AWSConnectMediaConcurrency *> * _Nullable mediaConcurrencies;

/**
 <p>The name of the routing profile. Must not be more than 127 characters.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The inbound queues associated with the routing profile. If no queue is added, the agent can make only outbound calls.</p><p>The limit of 10 array members applies to the maximum number of <code>RoutingProfileQueueConfig</code> objects that can be passed during a CreateRoutingProfile API request. It is different from the quota of 50 queues per routing profile per instance that is listed in <a href="https://docs.aws.amazon.com/connect/latest/adminguide/amazon-connect-service-limits.html">Amazon Connect service quotas</a>. </p>
 */
@property (nonatomic, strong) NSArray<AWSConnectRoutingProfileQueueConfig *> * _Nullable queueConfigs;

/**
 <p>The tags used to organize, track, or control access for this resource. For example, { "tags": {"key1":"value1", "key2":"value2"} }.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSConnectCreateRoutingProfileResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the routing profile.</p>
 */
@property (nonatomic, strong) NSString * _Nullable routingProfileArn;

/**
 <p>The identifier of the routing profile.</p>
 */
@property (nonatomic, strong) NSString * _Nullable routingProfileId;

@end

/**
 
 */
@interface AWSConnectCreateRuleRequest : AWSRequest


/**
 <p>A list of actions to be run when the rule is triggered.</p>
 */
@property (nonatomic, strong) NSArray<AWSConnectRuleAction *> * _Nullable actions;

/**
 <p>A unique, case-sensitive identifier that you provide to ensure the idempotency of the request. If not provided, the Amazon Web Services SDK populates this field. For more information about idempotency, see <a href="https://aws.amazon.com/builders-library/making-retries-safe-with-idempotent-APIs/">Making retries safe with idempotent APIs</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>The conditions of the rule.</p>
 */
@property (nonatomic, strong) NSString * _Nullable function;

/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>A unique name for the rule.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The publish status of the rule.</p>
 */
@property (nonatomic, assign) AWSConnectRulePublishStatus publishStatus;

/**
 <p>The event source to trigger the rule.</p>
 */
@property (nonatomic, strong) AWSConnectRuleTriggerEventSource * _Nullable triggerEventSource;

@end

/**
 
 */
@interface AWSConnectCreateRuleResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the rule.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ruleArn;

/**
 <p>A unique identifier for the rule.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ruleId;

@end

/**
 
 */
@interface AWSConnectCreateSecurityProfileRequest : AWSRequest


/**
 <p>The list of tags that a security profile uses to restrict access to resources in Amazon Connect.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable allowedAccessControlTags;

/**
 <p>The description of the security profile.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>Permissions assigned to the security profile. For a list of valid permissions, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/security-profile-list.html">List of security profile permissions</a>. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable permissions;

/**
 <p>The name of the security profile.</p>
 */
@property (nonatomic, strong) NSString * _Nullable securityProfileName;

/**
 <p>The list of resources that a security profile applies tag restrictions to in Amazon Connect. Following are acceptable ResourceNames: <code>User</code> | <code>SecurityProfile</code> | <code>Queue</code> | <code>RoutingProfile</code></p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable tagRestrictedResources;

/**
 <p>The tags used to organize, track, or control access for this resource. For example, { "tags": {"key1":"value1", "key2":"value2"} }.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSConnectCreateSecurityProfileResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) for the security profile.</p>
 */
@property (nonatomic, strong) NSString * _Nullable securityProfileArn;

/**
 <p>The identifier for the security profle.</p>
 */
@property (nonatomic, strong) NSString * _Nullable securityProfileId;

@end

/**
 
 */
@interface AWSConnectCreateTaskTemplateRequest : AWSRequest


/**
 <p>A unique, case-sensitive identifier that you provide to ensure the idempotency of the request. If not provided, the Amazon Web Services SDK populates this field. For more information about idempotency, see <a href="https://aws.amazon.com/builders-library/making-retries-safe-with-idempotent-APIs/">Making retries safe with idempotent APIs</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>Constraints that are applicable to the fields listed.</p>
 */
@property (nonatomic, strong) AWSConnectTaskTemplateConstraints * _Nullable constraints;

/**
 <p>The identifier of the flow that runs by default when a task is created by referencing this template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contactFlowId;

/**
 <p>The default values for fields when a task is created by referencing this template.</p>
 */
@property (nonatomic, strong) AWSConnectTaskTemplateDefaults * _Nullable defaults;

/**
 <p>The description of the task template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>Fields that are part of the template.</p>
 */
@property (nonatomic, strong) NSArray<AWSConnectTaskTemplateField *> * _Nullable fields;

/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The name of the task template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>Marks a template as <code>ACTIVE</code> or <code>INACTIVE</code> for a task to refer to it. Tasks can only be created from <code>ACTIVE</code> templates. If a template is marked as <code>INACTIVE</code>, then a task that refers to this template cannot be created. </p>
 */
@property (nonatomic, assign) AWSConnectTaskTemplateStatus status;

@end

/**
 
 */
@interface AWSConnectCreateTaskTemplateResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) for the task template resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The identifier of the task template resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

@end

/**
 
 */
@interface AWSConnectCreateTrafficDistributionGroupRequest : AWSRequest


/**
 <p>A unique, case-sensitive identifier that you provide to ensure the idempotency of the request. If not provided, the Amazon Web Services SDK populates this field. For more information about idempotency, see <a href="https://aws.amazon.com/builders-library/making-retries-safe-with-idempotent-APIs/">Making retries safe with idempotent APIs</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>A description for the traffic distribution group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The identifier of the Amazon Connect instance that has been replicated. You can find the <code>instanceId</code> in the ARN of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The name for the traffic distribution group. </p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The tags used to organize, track, or control access for this resource. For example, { "tags": {"key1":"value1", "key2":"value2"} }.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSConnectCreateTrafficDistributionGroupResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the traffic distribution group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The identifier of the traffic distribution group. This can be the ID or the ARN if the API is being called in the Region where the traffic distribution group was created. The ARN must be provided if the call is from the replicated Region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

@end

/**
 
 */
@interface AWSConnectCreateUseCaseRequest : AWSRequest


/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The identifier for the integration association.</p>
 */
@property (nonatomic, strong) NSString * _Nullable integrationAssociationId;

/**
 <p>The tags used to organize, track, or control access for this resource. For example, { "tags": {"key1":"value1", "key2":"value2"} }.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

/**
 <p>The type of use case to associate to the integration association. Each integration association can have only one of each use case type.</p>
 */
@property (nonatomic, assign) AWSConnectUseCaseType useCaseType;

@end

/**
 
 */
@interface AWSConnectCreateUseCaseResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) for the use case.</p>
 */
@property (nonatomic, strong) NSString * _Nullable useCaseArn;

/**
 <p>The identifier of the use case.</p>
 */
@property (nonatomic, strong) NSString * _Nullable useCaseId;

@end

/**
 
 */
@interface AWSConnectCreateUserHierarchyGroupRequest : AWSRequest


/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The name of the user hierarchy group. Must not be more than 100 characters.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The identifier for the parent hierarchy group. The user hierarchy is created at level one if the parent group ID is null.</p>
 */
@property (nonatomic, strong) NSString * _Nullable parentGroupId;

/**
 <p>The tags used to organize, track, or control access for this resource. For example, { "tags": {"key1":"value1", "key2":"value2"} }.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSConnectCreateUserHierarchyGroupResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the hierarchy group. </p>
 */
@property (nonatomic, strong) NSString * _Nullable hierarchyGroupArn;

/**
 <p>The identifier of the hierarchy group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable hierarchyGroupId;

@end

/**
 
 */
@interface AWSConnectCreateUserRequest : AWSRequest


/**
 <p>The identifier of the user account in the directory used for identity management. If Amazon Connect cannot access the directory, you can specify this identifier to authenticate users. If you include the identifier, we assume that Amazon Connect cannot access the directory. Otherwise, the identity information is used to authenticate users from your directory.</p><p>This parameter is required if you are using an existing directory for identity management in Amazon Connect when Amazon Connect cannot access your directory to authenticate users. If you are using SAML for identity management and include this parameter, an error is returned.</p>
 */
@property (nonatomic, strong) NSString * _Nullable directoryUserId;

/**
 <p>The identifier of the hierarchy group for the user.</p>
 */
@property (nonatomic, strong) NSString * _Nullable hierarchyGroupId;

/**
 <p>The information about the identity of the user.</p>
 */
@property (nonatomic, strong) AWSConnectUserIdentityInfo * _Nullable identityInfo;

/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The password for the user account. A password is required if you are using Amazon Connect for identity management. Otherwise, it is an error to include a password.</p>
 */
@property (nonatomic, strong) NSString * _Nullable password;

/**
 <p>The phone settings for the user.</p>
 */
@property (nonatomic, strong) AWSConnectUserPhoneConfig * _Nullable phoneConfig;

/**
 <p>The identifier of the routing profile for the user.</p>
 */
@property (nonatomic, strong) NSString * _Nullable routingProfileId;

/**
 <p>The identifier of the security profile for the user.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable securityProfileIds;

/**
 <p>The tags used to organize, track, or control access for this resource. For example, { "tags": {"key1":"value1", "key2":"value2"} }.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

/**
 <p>The user name for the account. For instances not using SAML for identity management, the user name can include up to 20 characters. If you are using SAML for identity management, the user name can include up to 64 characters from [a-zA-Z0-9_-.\@]+.</p>
 */
@property (nonatomic, strong) NSString * _Nullable username;

@end

/**
 
 */
@interface AWSConnectCreateUserResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the user account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userArn;

/**
 <p>The identifier of the user account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userId;

@end

/**
 
 */
@interface AWSConnectCreateVocabularyRequest : AWSRequest


/**
 <p>A unique, case-sensitive identifier that you provide to ensure the idempotency of the request. If not provided, the Amazon Web Services SDK populates this field. For more information about idempotency, see <a href="https://aws.amazon.com/builders-library/making-retries-safe-with-idempotent-APIs/">Making retries safe with idempotent APIs</a>. If a create request is received more than once with same client token, subsequent requests return the previous response without creating a vocabulary again.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>The content of the custom vocabulary in plain-text format with a table of values. Each row in the table represents a word or a phrase, described with <code>Phrase</code>, <code>IPA</code>, <code>SoundsLike</code>, and <code>DisplayAs</code> fields. Separate the fields with TAB characters. The size limit is 50KB. For more information, see <a href="https://docs.aws.amazon.com/transcribe/latest/dg/custom-vocabulary.html#create-vocabulary-table">Create a custom vocabulary using a table</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable content;

/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The language code of the vocabulary entries. For a list of languages and their corresponding language codes, see <a href="https://docs.aws.amazon.com/transcribe/latest/dg/transcribe-whatis.html">What is Amazon Transcribe?</a></p>
 */
@property (nonatomic, assign) AWSConnectVocabularyLanguageCode languageCode;

/**
 <p>The tags used to organize, track, or control access for this resource. For example, { "tags": {"key1":"value1", "key2":"value2"} }.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

/**
 <p>A unique name of the custom vocabulary.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vocabularyName;

@end

/**
 
 */
@interface AWSConnectCreateVocabularyResponse : AWSModel


/**
 <p>The current state of the custom vocabulary.</p>
 */
@property (nonatomic, assign) AWSConnectVocabularyState state;

/**
 <p>The Amazon Resource Name (ARN) of the custom vocabulary.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vocabularyArn;

/**
 <p>The identifier of the custom vocabulary.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vocabularyId;

@end

/**
 <p>Contains credentials to use for federation.</p>
 */
@interface AWSConnectCredentials : AWSModel


/**
 <p>An access token generated for a federated user to access Amazon Connect.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accessToken;

/**
 <p>A token generated with an expiration time for the session a user is logged in to Amazon Connect.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable accessTokenExpiration;

/**
 <p>Renews a token generated for a user to access the Amazon Connect instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable refreshToken;

/**
 <p>Renews the expiration timer for a generated token.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable refreshTokenExpiration;

@end

/**
 <p>Defines the cross-channel routing behavior that allows an agent working on a contact in one channel to be offered a contact from a different channel.</p>
 Required parameters: [BehaviorType]
 */
@interface AWSConnectCrossChannelBehavior : AWSModel


/**
 <p>Specifies the other channels that can be routed to an agent handling their current channel.</p>
 */
@property (nonatomic, assign) AWSConnectBehaviorType behaviorType;

@end

/**
 <p>Contains information about a real-time metric. For a description of each metric, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/real-time-metrics-definitions.html">Real-time Metrics Definitions</a> in the <i>Amazon Connect Administrator Guide</i>.</p>
 */
@interface AWSConnectCurrentMetric : AWSModel


/**
 <p>The name of the metric.</p>
 */
@property (nonatomic, assign) AWSConnectCurrentMetricName name;

/**
 <p>The unit for the metric.</p>
 */
@property (nonatomic, assign) AWSConnectUnit unit;

@end

/**
 <p>Contains the data for a real-time metric.</p>
 */
@interface AWSConnectCurrentMetricData : AWSModel


/**
 <p>Information about the metric.</p>
 */
@property (nonatomic, strong) AWSConnectCurrentMetric * _Nullable metric;

/**
 <p>The value of the metric.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable value;

@end

/**
 <p>Contains information about a set of real-time metrics.</p>
 */
@interface AWSConnectCurrentMetricResult : AWSModel


/**
 <p>The set of metrics.</p>
 */
@property (nonatomic, strong) NSArray<AWSConnectCurrentMetricData *> * _Nullable collections;

/**
 <p>The dimensions for the metrics.</p>
 */
@property (nonatomic, strong) AWSConnectDimensions * _Nullable dimensions;

@end

/**
 <p>The way to sort the resulting response based on metrics. By default resources are sorted based on <code>AGENTS_ONLINE</code>, <code>DESCENDING</code>. The metric collection is sorted based on the input metrics.</p>
 */
@interface AWSConnectCurrentMetricSortCriteria : AWSModel


/**
 <p>The current metric names.</p>
 */
@property (nonatomic, assign) AWSConnectCurrentMetricName sortByMetric;

/**
 <p>The way to sort.</p>
 */
@property (nonatomic, assign) AWSConnectSortOrder sortOrder;

@end

/**
 <p>Information about a reference when the <code>referenceType</code> is <code>DATE</code>. Otherwise, null.</p>
 */
@interface AWSConnectDateReference : AWSModel


/**
 <p>Identifier of the date reference.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>A valid date.</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 
 */
@interface AWSConnectDeactivateEvaluationFormRequest : AWSRequest


/**
 <p>The unique identifier for the evaluation form.</p>
 */
@property (nonatomic, strong) NSString * _Nullable evaluationFormId;

/**
 <p>A version of the evaluation form. If the version property is not provided, the latest version of the evaluation form is deactivated.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable evaluationFormVersion;

/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

@end

/**
 
 */
@interface AWSConnectDeactivateEvaluationFormResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) for the evaluation form resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable evaluationFormArn;

/**
 <p>The unique identifier for the evaluation form.</p>
 */
@property (nonatomic, strong) NSString * _Nullable evaluationFormId;

/**
 <p>The version of the deactivated evaluation form resource.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable evaluationFormVersion;

@end

/**
 <p>Contains information about a default vocabulary.</p>
 Required parameters: [InstanceId, LanguageCode, VocabularyId, VocabularyName]
 */
@interface AWSConnectDefaultVocabulary : AWSModel


/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The language code of the vocabulary entries. For a list of languages and their corresponding language codes, see <a href="https://docs.aws.amazon.com/transcribe/latest/dg/transcribe-whatis.html">What is Amazon Transcribe?</a></p>
 */
@property (nonatomic, assign) AWSConnectVocabularyLanguageCode languageCode;

/**
 <p>The identifier of the custom vocabulary.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vocabularyId;

/**
 <p>A unique name of the custom vocabulary.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vocabularyName;

@end

/**
 
 */
@interface AWSConnectDeleteContactEvaluationRequest : AWSRequest


/**
 <p>A unique identifier for the contact evaluation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable evaluationId;

/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

@end

/**
 
 */
@interface AWSConnectDeleteContactFlowModuleRequest : AWSRequest


/**
 <p>The identifier of the flow module.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contactFlowModuleId;

/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

@end

/**
 
 */
@interface AWSConnectDeleteContactFlowModuleResponse : AWSModel


@end

/**
 
 */
@interface AWSConnectDeleteContactFlowRequest : AWSRequest


/**
 <p>The identifier of the flow.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contactFlowId;

/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

@end

/**
 
 */
@interface AWSConnectDeleteContactFlowResponse : AWSModel


@end

/**
 
 */
@interface AWSConnectDeleteEvaluationFormRequest : AWSRequest


/**
 <p>The unique identifier for the evaluation form.</p>
 */
@property (nonatomic, strong) NSString * _Nullable evaluationFormId;

/**
 <p>The unique identifier for the evaluation form.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable evaluationFormVersion;

/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

@end

/**
 
 */
@interface AWSConnectDeleteHoursOfOperationRequest : AWSRequest


/**
 <p>The identifier for the hours of operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable hoursOfOperationId;

/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

@end

/**
 
 */
@interface AWSConnectDeleteInstanceRequest : AWSRequest


/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

@end

/**
 
 */
@interface AWSConnectDeleteIntegrationAssociationRequest : AWSRequest


/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The identifier for the integration association.</p>
 */
@property (nonatomic, strong) NSString * _Nullable integrationAssociationId;

@end

/**
 
 */
@interface AWSConnectDeletePromptRequest : AWSRequest


/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>A unique identifier for the prompt.</p>
 */
@property (nonatomic, strong) NSString * _Nullable promptId;

@end

/**
 
 */
@interface AWSConnectDeleteQuickConnectRequest : AWSRequest


/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The identifier for the quick connect.</p>
 */
@property (nonatomic, strong) NSString * _Nullable quickConnectId;

@end

/**
 
 */
@interface AWSConnectDeleteRuleRequest : AWSRequest


/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>A unique identifier for the rule.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ruleId;

@end

/**
 
 */
@interface AWSConnectDeleteSecurityProfileRequest : AWSRequest


/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The identifier for the security profle.</p>
 */
@property (nonatomic, strong) NSString * _Nullable securityProfileId;

@end

/**
 
 */
@interface AWSConnectDeleteTaskTemplateRequest : AWSRequest


/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>A unique identifier for the task template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable taskTemplateId;

@end

/**
 
 */
@interface AWSConnectDeleteTaskTemplateResponse : AWSModel


@end

/**
 
 */
@interface AWSConnectDeleteTrafficDistributionGroupRequest : AWSRequest


/**
 <p>The identifier of the traffic distribution group. This can be the ID or the ARN if the API is being called in the Region where the traffic distribution group was created. The ARN must be provided if the call is from the replicated Region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable trafficDistributionGroupId;

@end

/**
 
 */
@interface AWSConnectDeleteTrafficDistributionGroupResponse : AWSModel


@end

/**
 
 */
@interface AWSConnectDeleteUseCaseRequest : AWSRequest


/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The identifier for the integration association.</p>
 */
@property (nonatomic, strong) NSString * _Nullable integrationAssociationId;

/**
 <p>The identifier for the use case.</p>
 */
@property (nonatomic, strong) NSString * _Nullable useCaseId;

@end

/**
 
 */
@interface AWSConnectDeleteUserHierarchyGroupRequest : AWSRequest


/**
 <p>The identifier of the hierarchy group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable hierarchyGroupId;

/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

@end

/**
 
 */
@interface AWSConnectDeleteUserRequest : AWSRequest


/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The identifier of the user.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userId;

@end

/**
 
 */
@interface AWSConnectDeleteVocabularyRequest : AWSRequest


/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The identifier of the custom vocabulary.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vocabularyId;

@end

/**
 
 */
@interface AWSConnectDeleteVocabularyResponse : AWSModel


/**
 <p>The current state of the custom vocabulary.</p>
 */
@property (nonatomic, assign) AWSConnectVocabularyState state;

/**
 <p>The Amazon Resource Name (ARN) of the custom vocabulary.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vocabularyArn;

/**
 <p>The identifier of the custom vocabulary.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vocabularyId;

@end

/**
 
 */
@interface AWSConnectDescribeAgentStatusRequest : AWSRequest


/**
 <p>The identifier for the agent status.</p>
 */
@property (nonatomic, strong) NSString * _Nullable agentStatusId;

/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

@end

/**
 
 */
@interface AWSConnectDescribeAgentStatusResponse : AWSModel


/**
 <p>The agent status.</p>
 */
@property (nonatomic, strong) AWSConnectAgentStatus * _Nullable agentStatus;

@end

/**
 
 */
@interface AWSConnectDescribeContactEvaluationRequest : AWSRequest


/**
 <p>A unique identifier for the contact evaluation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable evaluationId;

/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

@end

/**
 
 */
@interface AWSConnectDescribeContactEvaluationResponse : AWSModel


/**
 <p>Information about the evaluation form completed for a specific contact.</p>
 */
@property (nonatomic, strong) AWSConnectEvaluation * _Nullable evaluation;

/**
 <p>Information about the evaluation form.</p>
 */
@property (nonatomic, strong) AWSConnectEvaluationFormContent * _Nullable evaluationForm;

@end

/**
 
 */
@interface AWSConnectDescribeContactFlowModuleRequest : AWSRequest


/**
 <p>The identifier of the flow module.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contactFlowModuleId;

/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

@end

/**
 
 */
@interface AWSConnectDescribeContactFlowModuleResponse : AWSModel


/**
 <p>Information about the flow module.</p>
 */
@property (nonatomic, strong) AWSConnectContactFlowModule * _Nullable contactFlowModule;

@end

/**
 
 */
@interface AWSConnectDescribeContactFlowRequest : AWSRequest


/**
 <p>The identifier of the flow.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contactFlowId;

/**
 <p>The identifier of the Amazon Connect instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

@end

/**
 
 */
@interface AWSConnectDescribeContactFlowResponse : AWSModel


/**
 <p>Information about the flow.</p>
 */
@property (nonatomic, strong) AWSConnectContactFlow * _Nullable contactFlow;

@end

/**
 
 */
@interface AWSConnectDescribeContactRequest : AWSRequest


/**
 <p>The identifier of the contact.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contactId;

/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

@end

/**
 
 */
@interface AWSConnectDescribeContactResponse : AWSModel


/**
 <p>Information about the contact.</p>
 */
@property (nonatomic, strong) AWSConnectContact * _Nullable contact;

@end

/**
 
 */
@interface AWSConnectDescribeEvaluationFormRequest : AWSRequest


/**
 <p>A unique identifier for the contact evaluation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable evaluationFormId;

/**
 <p>A version of the evaluation form.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable evaluationFormVersion;

/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

@end

/**
 
 */
@interface AWSConnectDescribeEvaluationFormResponse : AWSModel


/**
 <p>Information about the evaluation form.</p>
 */
@property (nonatomic, strong) AWSConnectEvaluationForm * _Nullable evaluationForm;

@end

/**
 
 */
@interface AWSConnectDescribeHoursOfOperationRequest : AWSRequest


/**
 <p>The identifier for the hours of operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable hoursOfOperationId;

/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

@end

/**
 
 */
@interface AWSConnectDescribeHoursOfOperationResponse : AWSModel


/**
 <p>The hours of operation.</p>
 */
@property (nonatomic, strong) AWSConnectHoursOfOperation * _Nullable hoursOfOperation;

@end

/**
 
 */
@interface AWSConnectDescribeInstanceAttributeRequest : AWSRequest


/**
 <p>The type of attribute.</p>
 */
@property (nonatomic, assign) AWSConnectInstanceAttributeType attributeType;

/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

@end

/**
 
 */
@interface AWSConnectDescribeInstanceAttributeResponse : AWSModel


/**
 <p>The type of attribute.</p>
 */
@property (nonatomic, strong) AWSConnectAttribute * _Nullable attribute;

@end

/**
 
 */
@interface AWSConnectDescribeInstanceRequest : AWSRequest


/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

@end

/**
 
 */
@interface AWSConnectDescribeInstanceResponse : AWSModel


/**
 <p>The name of the instance.</p>
 */
@property (nonatomic, strong) AWSConnectInstance * _Nullable instance;

@end

/**
 
 */
@interface AWSConnectDescribeInstanceStorageConfigRequest : AWSRequest


/**
 <p>The existing association identifier that uniquely identifies the resource type and storage config for the given instance ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable associationId;

/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>A valid resource type.</p>
 */
@property (nonatomic, assign) AWSConnectInstanceStorageResourceType resourceType;

@end

/**
 
 */
@interface AWSConnectDescribeInstanceStorageConfigResponse : AWSModel


/**
 <p>A valid storage type.</p>
 */
@property (nonatomic, strong) AWSConnectInstanceStorageConfig * _Nullable storageConfig;

@end

/**
 
 */
@interface AWSConnectDescribePhoneNumberRequest : AWSRequest


/**
 <p>A unique identifier for the phone number.</p>
 */
@property (nonatomic, strong) NSString * _Nullable phoneNumberId;

@end

/**
 
 */
@interface AWSConnectDescribePhoneNumberResponse : AWSModel


/**
 <p>Information about a phone number that's been claimed to your Amazon Connect instance or traffic distribution group.</p>
 */
@property (nonatomic, strong) AWSConnectClaimedPhoneNumberSummary * _Nullable claimedPhoneNumberSummary;

@end

/**
 
 */
@interface AWSConnectDescribePromptRequest : AWSRequest


/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>A unique identifier for the prompt.</p>
 */
@property (nonatomic, strong) NSString * _Nullable promptId;

@end

/**
 
 */
@interface AWSConnectDescribePromptResponse : AWSModel


/**
 <p>Information about the prompt.</p>
 */
@property (nonatomic, strong) AWSConnectPrompt * _Nullable prompt;

@end

/**
 
 */
@interface AWSConnectDescribeQueueRequest : AWSRequest


/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The identifier for the queue.</p>
 */
@property (nonatomic, strong) NSString * _Nullable queueId;

@end

/**
 
 */
@interface AWSConnectDescribeQueueResponse : AWSModel


/**
 <p>The name of the queue.</p>
 */
@property (nonatomic, strong) AWSConnectQueue * _Nullable queue;

@end

/**
 
 */
@interface AWSConnectDescribeQuickConnectRequest : AWSRequest


/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The identifier for the quick connect.</p>
 */
@property (nonatomic, strong) NSString * _Nullable quickConnectId;

@end

/**
 
 */
@interface AWSConnectDescribeQuickConnectResponse : AWSModel


/**
 <p>Information about the quick connect.</p>
 */
@property (nonatomic, strong) AWSConnectQuickConnect * _Nullable quickConnect;

@end

/**
 
 */
@interface AWSConnectDescribeRoutingProfileRequest : AWSRequest


/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The identifier of the routing profile.</p>
 */
@property (nonatomic, strong) NSString * _Nullable routingProfileId;

@end

/**
 
 */
@interface AWSConnectDescribeRoutingProfileResponse : AWSModel


/**
 <p>The routing profile.</p>
 */
@property (nonatomic, strong) AWSConnectRoutingProfile * _Nullable routingProfile;

@end

/**
 
 */
@interface AWSConnectDescribeRuleRequest : AWSRequest


/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>A unique identifier for the rule.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ruleId;

@end

/**
 
 */
@interface AWSConnectDescribeRuleResponse : AWSModel


/**
 <p>Information about the rule.</p>
 */
@property (nonatomic, strong) AWSConnectRule * _Nullable rule;

@end

/**
 
 */
@interface AWSConnectDescribeSecurityProfileRequest : AWSRequest


/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The identifier for the security profle.</p>
 */
@property (nonatomic, strong) NSString * _Nullable securityProfileId;

@end

/**
 
 */
@interface AWSConnectDescribeSecurityProfileResponse : AWSModel


/**
 <p>The security profile.</p>
 */
@property (nonatomic, strong) AWSConnectSecurityProfile * _Nullable securityProfile;

@end

/**
 
 */
@interface AWSConnectDescribeTrafficDistributionGroupRequest : AWSRequest


/**
 <p>The identifier of the traffic distribution group. This can be the ID or the ARN if the API is being called in the Region where the traffic distribution group was created. The ARN must be provided if the call is from the replicated Region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable trafficDistributionGroupId;

@end

/**
 
 */
@interface AWSConnectDescribeTrafficDistributionGroupResponse : AWSModel


/**
 <p>Information about the traffic distribution group.</p>
 */
@property (nonatomic, strong) AWSConnectTrafficDistributionGroup * _Nullable trafficDistributionGroup;

@end

/**
 
 */
@interface AWSConnectDescribeUserHierarchyGroupRequest : AWSRequest


/**
 <p>The identifier of the hierarchy group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable hierarchyGroupId;

/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

@end

/**
 
 */
@interface AWSConnectDescribeUserHierarchyGroupResponse : AWSModel


/**
 <p>Information about the hierarchy group.</p>
 */
@property (nonatomic, strong) AWSConnectHierarchyGroup * _Nullable hierarchyGroup;

@end

/**
 
 */
@interface AWSConnectDescribeUserHierarchyStructureRequest : AWSRequest


/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

@end

/**
 
 */
@interface AWSConnectDescribeUserHierarchyStructureResponse : AWSModel


/**
 <p>Information about the hierarchy structure.</p>
 */
@property (nonatomic, strong) AWSConnectHierarchyStructure * _Nullable hierarchyStructure;

@end

/**
 
 */
@interface AWSConnectDescribeUserRequest : AWSRequest


/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The identifier of the user account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userId;

@end

/**
 
 */
@interface AWSConnectDescribeUserResponse : AWSModel


/**
 <p>Information about the user account and configuration settings.</p>
 */
@property (nonatomic, strong) AWSConnectUser * _Nullable user;

@end

/**
 
 */
@interface AWSConnectDescribeVocabularyRequest : AWSRequest


/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The identifier of the custom vocabulary.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vocabularyId;

@end

/**
 
 */
@interface AWSConnectDescribeVocabularyResponse : AWSModel


/**
 <p>A list of specific words that you want Contact Lens for Amazon Connect to recognize in your audio input. They are generally domain-specific words and phrases, words that Contact Lens is not recognizing, or proper nouns.</p>
 */
@property (nonatomic, strong) AWSConnectVocabulary * _Nullable vocabulary;

@end

/**
 <p>Contains information about the dimensions for a set of metrics.</p>
 */
@interface AWSConnectDimensions : AWSModel


/**
 <p>The channel used for grouping and filters.</p>
 */
@property (nonatomic, assign) AWSConnectChannel channel;

/**
 <p>Information about the queue for which metrics are returned.</p>
 */
@property (nonatomic, strong) AWSConnectQueueReference * _Nullable queue;

/**
 <p>Information about the routing profile assigned to the user.</p>
 */
@property (nonatomic, strong) AWSConnectRoutingProfileReference * _Nullable routingProfile;

@end

/**
 
 */
@interface AWSConnectDisassociateApprovedOriginRequest : AWSRequest


/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The domain URL of the integrated application.</p>
 */
@property (nonatomic, strong) NSString * _Nullable origin;

@end

/**
 
 */
@interface AWSConnectDisassociateBotRequest : AWSRequest


/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>Configuration information of an Amazon Lex bot.</p>
 */
@property (nonatomic, strong) AWSConnectLexBot * _Nullable lexBot;

/**
 <p>The Amazon Lex V2 bot to disassociate from the instance.</p>
 */
@property (nonatomic, strong) AWSConnectLexV2Bot * _Nullable lexV2Bot;

@end

/**
 
 */
@interface AWSConnectDisassociateInstanceStorageConfigRequest : AWSRequest


/**
 <p>The existing association identifier that uniquely identifies the resource type and storage config for the given instance ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable associationId;

/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>A valid resource type.</p>
 */
@property (nonatomic, assign) AWSConnectInstanceStorageResourceType resourceType;

@end

/**
 
 */
@interface AWSConnectDisassociateLambdaFunctionRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the Lambda function being disassociated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable functionArn;

/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance..</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

@end

/**
 
 */
@interface AWSConnectDisassociateLexBotRequest : AWSRequest


/**
 <p>The name of the Amazon Lex bot. Maximum character limit of 50.</p>
 */
@property (nonatomic, strong) NSString * _Nullable botName;

/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The Amazon Web Services Region in which the Amazon Lex bot has been created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lexRegion;

@end

/**
 
 */
@interface AWSConnectDisassociatePhoneNumberContactFlowRequest : AWSRequest


/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>A unique identifier for the phone number.</p>
 */
@property (nonatomic, strong) NSString * _Nullable phoneNumberId;

@end

/**
 
 */
@interface AWSConnectDisassociateQueueQuickConnectsRequest : AWSRequest


/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The identifier for the queue.</p>
 */
@property (nonatomic, strong) NSString * _Nullable queueId;

/**
 <p>The quick connects to disassociate from the queue.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable quickConnectIds;

@end

/**
 
 */
@interface AWSConnectDisassociateRoutingProfileQueuesRequest : AWSRequest


/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The queues to disassociate from this routing profile.</p>
 */
@property (nonatomic, strong) NSArray<AWSConnectRoutingProfileQueueReference *> * _Nullable queueReferences;

/**
 <p>The identifier of the routing profile.</p>
 */
@property (nonatomic, strong) NSString * _Nullable routingProfileId;

@end

/**
 
 */
@interface AWSConnectDisassociateSecurityKeyRequest : AWSRequest


/**
 <p>The existing association identifier that uniquely identifies the resource type and storage config for the given instance ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable associationId;

/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

@end

/**
 
 */
@interface AWSConnectDismissUserContactRequest : AWSRequest


/**
 <p>The identifier of the contact.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contactId;

/**
 <p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The identifier of the user account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userId;

@end

/**
 
 */
@interface AWSConnectDismissUserContactResponse : AWSModel


@end

/**
 <p>Information about a traffic distribution.</p>
 Required parameters: [Region, Percentage]
 */
@interface AWSConnectDistribution : AWSModel


/**
 <p>The percentage of the traffic that is distributed, in increments of 10.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable percentage;

/**
 <p>The Amazon Web Services Region where the traffic is distributed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable region;

@end

/**
 <p>Information about a reference when the <code>referenceType</code> is <code>EMAIL</code>. Otherwise, null.</p>
 */
@interface AWSConnectEmailReference : AWSModel


/**
 <p>Identifier of the email reference.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>A valid email address.</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 <p>The encryption configuration.</p>
 Required parameters: [EncryptionType, KeyId]
 */
@interface AWSConnectEncryptionConfig : AWSModel


/**
 <p>The type of encryption.</p>
 */
@property (nonatomic, assign) AWSConnectEncryptionType encryptionType;

/**
 <p>The full ARN of the encryption key. </p><note><p>Be sure to provide the full ARN of the encryption key, not just the ID.</p><p>Amazon Connect supports only KMS keys with the default key spec of <a href="https://docs.aws.amazon.com/kms/latest/developerguide/asymmetric-key-specs.html#key-spec-symmetric-default"><code>SYMMETRIC_DEFAULT</code></a>. </p></note>
 */
@property (nonatomic, strong) NSString * _Nullable keyId;

@end

/**
 <p>Information about a contact evaluation.</p>
 Required parameters: [EvaluationId, EvaluationArn, Metadata, Answers, Notes, Status, CreatedTime, LastModifiedTime]
 */
@interface AWSConnectEvaluation : AWSModel


/**
 <p>A map of question identifiers to answer value.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSConnectEvaluationAnswerOutput *> * _Nullable answers;

/**
 <p>The timestamp for when the evaluation was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdTime;

/**
 <p>The Amazon Resource Name (ARN) for the contact evaluation resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable evaluationArn;

/**
 <p>A unique identifier for the contact evaluation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable evaluationId;

/**
 <p>The timestamp for when the evaluation was last updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedTime;

/**
 <p>Metadata about the contact evaluation.</p>
 */
@property (nonatomic, strong) AWSConnectEvaluationMetadata * _Nullable metadata;

/**
 <p>A map of question identifiers to note value.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSConnectEvaluationNote *> * _Nullable notes;

/**
 <p>A map of item (section or question) identifiers to score value.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSConnectEvaluationScore *> * _Nullable scores;

/**
 <p>The status of the contact evaluation.</p>
 */
@property (nonatomic, assign) AWSConnectEvaluationStatus status;

/**
 <p>The tags used to organize, track, or control access for this resource. For example, { "tags": {"key1":"value1", "key2":"value2"} }.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 <p>Information about answer data for a contact evaluation. Answer data must be either string, numeric, or not applicable.</p>
 */
@interface AWSConnectEvaluationAnswerData : AWSModel


/**
 <p>The flag to mark the question as not applicable.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable notApplicable;

/**
 <p>The numeric value for an answer in a contact evaluation.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable numericValue;

/**
 <p>The string value for an answer in a contact evaluation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stringValue;

@end

/**
 <p>Information about input answers for a contact evaluation.</p>
 */
@interface AWSConnectEvaluationAnswerInput : AWSModel


/**
 <p>The value for an answer in a contact evaluation.</p>
 */
@property (nonatomic, strong) AWSConnectEvaluationAnswerData * _Nullable value;

@end

/**
 <p>Information about output answers for a contact evaluation.</p>
 */
@interface AWSConnectEvaluationAnswerOutput : AWSModel


/**
 <p>The system suggested value for an answer in a contact evaluation.</p>
 */
@property (nonatomic, strong) AWSConnectEvaluationAnswerData * _Nullable systemSuggestedValue;

/**
 <p>The value for an answer in a contact evaluation.</p>
 */
@property (nonatomic, strong) AWSConnectEvaluationAnswerData * _Nullable value;

@end

/**
 <p>Information about the evaluation form.</p>
 Required parameters: [EvaluationFormId, EvaluationFormVersion, Locked, EvaluationFormArn, Title, Status, Items, CreatedTime, CreatedBy, LastModifiedTime, LastModifiedBy]
 */
@interface AWSConnectEvaluationForm : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the user who created the evaluation form.</p>
 */
@property (nonatomic, strong) NSString * _Nullable createdBy;

/**
 <p>The timestamp for when the evaluation form was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdTime;

/**
 <p>The description of the evaluation form.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The Amazon Resource Name (ARN) for the evaluation form resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable evaluationFormArn;

/**
 <p>The unique identifier for the evaluation form.</p>
 */
@property (nonatomic, strong) NSString * _Nullable evaluationFormId;

/**
 <p>A version of the evaluation form.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable evaluationFormVersion;

/**
 <p>Items that are part of the evaluation form. The total number of sections and questions must not exceed 100 each. Questions must be contained in a section.</p>
 */
@property (nonatomic, strong) NSArray<AWSConnectEvaluationFormItem *> * _Nullable items;

/**
 <p>The Amazon Resource Name (ARN) of the user who last updated the evaluation form.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lastModifiedBy;

/**
 <p>The timestamp for when the evaluation form was last updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedTime;

/**
 <p>The flag indicating whether the evaluation form is locked for changes.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable locked;

/**
 <p>A scoring strategy of the evaluation form.</p>
 */
@property (nonatomic, strong) AWSConnectEvaluationFormScoringStrategy * _Nullable scoringStrategy;

/**
 <p>The status of the evaluation form.</p>
 */
@property (nonatomic, assign) AWSConnectEvaluationFormVersionStatus status;

/**
 <p>The tags used to organize, track, or control access for this resource. For example, { "tags": {"key1":"value1", "key2":"value2"} }.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

/**
 <p>A title of the evaluation form.</p>
 */
@property (nonatomic, strong) NSString * _Nullable title;

@end

/**
 <p>Information about an evaluation form used in a contact evaluation.</p>
 Required parameters: [EvaluationFormVersion, EvaluationFormId, EvaluationFormArn, Title, Items]
 */
@interface AWSConnectEvaluationFormContent : AWSModel


/**
 <p>The description of the evaluation form.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The Amazon Resource Name (ARN) for the evaluation form resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable evaluationFormArn;

/**
 <p>The unique identifier for the evaluation form.</p>
 */
@property (nonatomic, strong) NSString * _Nullable evaluationFormId;

/**
 <p>A version of the evaluation form.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable evaluationFormVersion;

/**
 <p>Items that are part of the evaluation form. The total number of sections and questions must not exceed 100 each. Questions must be contained in a section.</p>
 */
@property (nonatomic, strong) NSArray<AWSConnectEvaluationFormItem *> * _Nullable items;

/**
 <p>A scoring strategy of the evaluation form.</p>
 */
@property (nonatomic, strong) AWSConnectEvaluationFormScoringStrategy * _Nullable scoringStrategy;

/**
 <p>A title of the evaluation form.</p>
 */
@property (nonatomic, strong) NSString * _Nullable title;

@end

/**
 <p>Information about an item from an evaluation form. The item must be either a section or a question.</p>
 */
@interface AWSConnectEvaluationFormItem : AWSModel


/**
 <p>The information of the question.</p>
 */
@property (nonatomic, strong) AWSConnectEvaluationFormQuestion * _Nullable question;

/**
 <p>The information of the section.</p>
 */
@property (nonatomic, strong) AWSConnectEvaluationFormSection * _Nullable section;

@end

/**
 <p>Information about the automation configuration in numeric questions.</p>
 */
@interface AWSConnectEvaluationFormNumericQuestionAutomation : AWSModel


/**
 <p>The property value of the automation.</p>
 */
@property (nonatomic, strong) AWSConnectNumericQuestionPropertyValueAutomation * _Nullable propertyValue;

@end

/**
 <p>Information about the option range used for scoring in numeric questions.</p>
 Required parameters: [MinValue, MaxValue]
 */
@interface AWSConnectEvaluationFormNumericQuestionOption : AWSModel


/**
 <p>The flag to mark the option as automatic fail. If an automatic fail answer is provided, the overall evaluation gets a score of 0.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable automaticFail;

/**
 <p>The maximum answer value of the range option.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxValue;

/**
 <p>The minimum answer value of the range option.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable minValue;

/**
 <p>The score assigned to answer values within the range option.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable score;

@end

/**
 <p>Information about properties for a numeric question in an evaluation form.</p>
 Required parameters: [MinValue, MaxValue]
 */
@interface AWSConnectEvaluationFormNumericQuestionProperties : AWSModel


/**
 <p>The automation properties of the numeric question.</p>
 */
@property (nonatomic, strong) AWSConnectEvaluationFormNumericQuestionAutomation * _Nullable automation;

/**
 <p>The maximum answer value.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxValue;

/**
 <p>The minimum answer value.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable minValue;

/**
 <p>The scoring options of the numeric question.</p>
 */
@property (nonatomic, strong) NSArray<AWSConnectEvaluationFormNumericQuestionOption *> * _Nullable options;

@end

/**
 <p>Information about a question from an evaluation form.</p>
 Required parameters: [Title, RefId, QuestionType]
 */
@interface AWSConnectEvaluationFormQuestion : AWSModel


/**
 <p>The instructions of the section.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instructions;

/**
 <p>The flag to enable not applicable answers to the question.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable notApplicableEnabled;

/**
 <p>The type of the question.</p>
 */
@property (nonatomic, assign) AWSConnectEvaluationFormQuestionType questionType;

/**
 <p>The properties of the type of question. Text questions do not have to define question type properties.</p>
 */
@property (nonatomic, strong) AWSConnectEvaluationFormQuestionTypeProperties * _Nullable questionTypeProperties;

/**
 <p>The identifier of the question. An identifier must be unique within the evaluation form.</p>
 */
@property (nonatomic, strong) NSString * _Nullable refId;

/**
 <p>The title of the question.</p>
 */
@property (nonatomic, strong) NSString * _Nullable title;

/**
 <p>The scoring weight of the section.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable weight;

@end

/**
 <p>Information about properties for a question in an evaluation form. The question type properties must be either for a numeric question or a single select question.</p>
 */
@interface AWSConnectEvaluationFormQuestionTypeProperties : AWSModel


/**
 <p>The properties of the numeric question.</p>
 */
@property (nonatomic, strong) AWSConnectEvaluationFormNumericQuestionProperties * _Nullable numeric;

/**
 <p>The properties of the numeric question.</p>
 */
@property (nonatomic, strong) AWSConnectEvaluationFormSingleSelectQuestionProperties * _Nullable singleSelect;

@end

/**
 <p>Information about scoring strategy for an evaluation form.</p>
 Required parameters: [Mode, Status]
 */
@interface AWSConnectEvaluationFormScoringStrategy : AWSModel


/**
 <p>The scoring mode of the evaluation form.</p>
 */
@property (nonatomic, assign) AWSConnectEvaluationFormScoringMode mode;

/**
 <p>The scoring status of the evaluation form.</p>
 */
@property (nonatomic, assign) AWSConnectEvaluationFormScoringStatus status;

@end

/**
 <p>Information about a section from an evaluation form. A section can contain sections and/or questions. Evaluation forms can only contain sections and subsections (two level nesting).</p>
 Required parameters: [Title, RefId, Items]
 */
@interface AWSConnectEvaluationFormSection : AWSModel


/**
 <p>The instructions of the section.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instructions;

/**
 <p>The items of the section.</p>
 */
@property (nonatomic, strong) NSArray<AWSConnectEvaluationFormItem *> * _Nullable items;

/**
 <p>The identifier of the section. An identifier must be unique within the evaluation form.</p>
 */
@property (nonatomic, strong) NSString * _Nullable refId;

/**
 <p>The title of the section.</p>
 */
@property (nonatomic, strong) NSString * _Nullable title;

/**
 <p>The scoring weight of the section.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable weight;

@end

/**
 <p>Information about the automation configuration in single select questions. Automation options are evaluated in order, and the first matched option is applied. If no automation option matches, and there is a default option, then the default option is applied.</p>
 Required parameters: [Options]
 */
@interface AWSConnectEvaluationFormSingleSelectQuestionAutomation : AWSModel


/**
 <p>The identifier of the default answer option, when none of the automation options match the criteria.</p>
 */
@property (nonatomic, strong) NSString * _Nullable defaultOptionRefId;

/**
 <p>The automation options of the single select question.</p>
 */
@property (nonatomic, strong) NSArray<AWSConnectEvaluationFormSingleSelectQuestionAutomationOption *> * _Nullable options;

@end

/**
 <p>Information about the automation option of a single select question.</p>
 */
@interface AWSConnectEvaluationFormSingleSelectQuestionAutomationOption : AWSModel


/**
 <p>The automation option based on a rule category for the single select question.</p>
 */
@property (nonatomic, strong) AWSConnectSingleSelectQuestionRuleCategoryAutomation * _Nullable ruleCategory;

@end

/**
 <p>Information about the automation configuration in single select questions.</p>
 Required parameters: [RefId, Text]
 */
@interface AWSConnectEvaluationFormSingleSelectQuestionOption : AWSModel


/**
 <p>The flag to mark the option as automatic fail. If an automatic fail answer is provided, the overall evaluation gets a score of 0.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable automaticFail;

/**
 <p>The identifier of the answer option. An identifier must be unique within the question.</p>
 */
@property (nonatomic, strong) NSString * _Nullable refId;

/**
 <p>The score assigned to the answer option.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable score;

/**
 <p>The title of the answer option.</p>
 */
@property (nonatomic, strong) NSString * _Nullable text;

@end

/**
 <p>Information about the options in single select questions.</p>
 Required parameters: [Options]
 */
@interface AWSConnectEvaluationFormSingleSelectQuestionProperties : AWSModel


/**
 <p>The display mode of the single select question.</p>
 */
@property (nonatomic, strong) AWSConnectEvaluationFormSingleSelectQuestionAutomation * _Nullable automation;

/**
 <p>The display mode of the single select question.</p>
 */
@property (nonatomic, assign) AWSConnectEvaluationFormSingleSelectQuestionDisplayMode displayAs;

/**
 <p>The answer options of the single select question.</p>
 */
@property (nonatomic, strong) NSArray<AWSConnectEvaluationFormSingleSelectQuestionOption *> * _Nullable options;

@end

/**
 <p>Summary information about an evaluation form.</p>
 Required parameters: [EvaluationFormId, EvaluationFormArn, Title, CreatedTime, CreatedBy, LastModifiedTime, LastModifiedBy, LatestVersion]
 */
@interface AWSConnectEvaluationFormSummary : AWSModel


/**
 <p>The version of the active evaluation form version.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable activeVersion;

/**
 <p>The Amazon Resource Name (ARN) of the user who created the evaluation form.</p>
 */
@property (nonatomic, strong) NSString * _Nullable createdBy;

/**
 <p>The timestamp for when the evaluation form was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdTime;

/**
 <p>The Amazon Resource Name (ARN) for the evaluation form resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable evaluationFormArn;

/**
 <p>The unique identifier for the evaluation form.</p>
 */
@property (nonatomic, strong) NSString * _Nullable evaluationFormId;

/**
 <p> The Amazon Resource Name (ARN) of the user who last activated the evaluation form.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lastActivatedBy;

/**
 <p>The timestamp for when the evaluation form was last activated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastActivatedTime;

/**
 <p>The Amazon Resource Name (ARN) of the user who last updated the evaluation form.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lastModifiedBy;

/**
 <p>The timestamp for when the evaluation form was last updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedTime;

/**
 <p>The version number of the latest evaluation form version.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable latestVersion;

/**
 <p>A title of the evaluation form.</p>
 */
@property (nonatomic, strong) NSString * _Nullable title;

@end

/**
 <p>Summary information about an evaluation form.</p>
 Required parameters: [EvaluationFormArn, EvaluationFormId, EvaluationFormVersion, Locked, Status, CreatedTime, CreatedBy, LastModifiedTime, LastModifiedBy]
 */
@interface AWSConnectEvaluationFormVersionSummary : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the user who created the evaluation form.</p>
 */
@property (nonatomic, strong) NSString * _Nullable createdBy;

/**
 <p>The timestamp for when the evaluation form was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdTime;

/**
 <p>The Amazon Resource Name (ARN) for the evaluation form resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable evaluationFormArn;

/**
 <p>The unique identifier for the evaluation form.</p>
 */
@property (nonatomic, strong) NSString * _Nullable evaluationFormId;

/**
 <p>A version of the evaluation form.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable evaluationFormVersion;

/**
 <p>The Amazon Resource Name (ARN) of the user who last updated the evaluation form.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lastModifiedBy;

/**
 <p>The timestamp for when the evaluation form was last updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedTime;

/**
 <p>The flag indicating whether the evaluation form is locked for changes.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable locked;

/**
 <p>The status of the evaluation form.</p>
 */
@property (nonatomic, assign) AWSConnectEvaluationFormVersionStatus status;

@end

/**
 <p>Metadata information about a contact evaluation.</p>
 Required parameters: [ContactId, EvaluatorArn]
 */
@interface AWSConnectEvaluationMetadata : AWSModel


/**
 <p>The identifier of the agent who performed the contact.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contactAgentId;

/**
 <p>The identifier of the contact in this instance of Amazon Connect. </p>
 */
@property (nonatomic, strong) NSString * _Nullable contactId;

/**
 <p>The Amazon Resource Name (ARN) of the user who last updated the evaluation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable evaluatorArn;

/**
 <p>The overall score of the contact evaluation.</p>
 */
@property (nonatomic, strong) AWSConnectEvaluationScore * _Nullable score;

@end

/**
 <p>Information about notes for a contact evaluation.</p>
 */
@interface AWSConnectEvaluationNote : AWSModel


/**
 <p>The note for an item (section or question) in a contact evaluation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 <p>Information about scores of a contact evaluation item (section or question).</p>
 */
@interface AWSConnectEvaluationScore : AWSModel


/**
 <p>The flag that marks the item as automatic fail. If the item or a child item gets an automatic fail answer, this flag will be true.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable automaticFail;

/**
 <p>The flag to mark the item as not applicable for scoring.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable notApplicable;

/**
 <p>The score percentage for an item in a contact evaluation.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable percentage;

@end

/**
 <p>Summary information about a contact evaluation.</p>
 Required parameters: [EvaluationId, EvaluationArn, EvaluationFormTitle, EvaluationFormId, Status, EvaluatorArn, CreatedTime, LastModifiedTime]
 */
@interface AWSConnectEvaluationSummary : AWSModel


/**
 <p>The timestamp for when the evaluation was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdTime;

/**
 <p>The Amazon Resource Name (ARN) for the contact evaluation resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable evaluationArn;

/**
 <p>The unique identifier for the evaluation form.</p>
 */
@property (nonatomic, strong) NSString * _Nullable evaluationFormId;

/**
 <p>A title of the evaluation form.</p>
 */
@property (nonatomic, strong) NSString * _Nullable evaluationFormTitle;

/**
 <p>A unique identifier for the contact evaluation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable evaluationId;

/**
 <p>The Amazon Resource Name (ARN) of the user who last updated the evaluation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable evaluatorArn;

/**
 <p>The timestamp for when the evaluation was last updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedTime;

/**
 <p>The overall score of the contact evaluation.</p>
 */
@property (nonatomic, strong) AWSConnectEvaluationScore * _Nullable score;

/**
 <p>The status of the contact evaluation.</p>
 */
@property (nonatomic, assign) AWSConnectEvaluationStatus status;

@end

/**
 <p>The EventBridge action definition.</p>
 Required parameters: [Name]
 */
@interface AWSConnectEventBridgeActionDefinition : AWSModel


/**
 <p>The name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 <p>Contains the filter to apply when retrieving metrics with the <a href="https://docs.aws.amazon.com/connect/latest/APIReference/API_GetMetricDataV2.html">GetMetricDataV2</a> API.</p>
 */
@interface AWSConnectFilterV2 : AWSModel


/**
 <p>The key to use for filtering data. For example, <code>QUEUE</code>, <code>ROUTING_PROFILE, AGENT</code>, <code>CHANNEL</code>, <code>AGENT_HIERARCHY_LEVEL_ONE</code>, <code>AGENT_HIERARCHY_LEVEL_TWO</code>, <code>AGENT_HIERARCHY_LEVEL_THREE</code>, <code>AGENT_HIERARCHY_LEVEL_FOUR</code>, <code>AGENT_HIERARCHY_LEVEL_FIVE</code>. There must be at least 1 key and a maximum 5 keys. </p>
 */
@property (nonatomic, strong) NSString * _Nullable filterKey;

/**
 <p>The identifiers to use for filtering data. For example, if you have a filter key of <code>QUEUE</code>, you would add queue IDs or ARNs in <code>FilterValues</code>. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable filterValues;

@end

/**
 <p>Contains the filter to apply when retrieving metrics.</p>
 */
@interface AWSConnectFilters : AWSModel


/**
 <p>The channel to use to filter the metrics.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable channels;

/**
 <p>The queues to use to filter the metrics. You should specify at least one queue, and can specify up to 100 queues per request. The <code>GetCurrentMetricsData</code> API in particular requires a queue when you include a <code>Filter</code> in your request. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable queues;

/**
 <p>A list of up to 100 routing profile IDs or ARNs.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable routingProfiles;

@end

/**
 
 */
@interface AWSConnectGetContactAttributesRequest : AWSRequest


/**
 <p>The identifier of the initial contact.</p>
 */
@property (nonatomic, strong) NSString * _Nullable initialContactId;

/**
 <p>The identifier of the Amazon Connect instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

@end

/**
 
 */
@interface AWSConnectGetContactAttributesResponse : AWSModel


/**
 <p>Information about the attributes.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable attributes;

@end

/**
 
 */
@interface AWSConnectGetCurrentMetricDataRequest : AWSRequest


/**
 <p>The metrics to retrieve. Specify the name and unit for each metric. The following metrics are available. For a description of all the metrics, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/real-time-metrics-definitions.html">Real-time Metrics Definitions</a> in the <i>Amazon Connect Administrator Guide</i>.</p><dl><dt>AGENTS_AFTER_CONTACT_WORK</dt><dd><p>Unit: COUNT</p><p>Name in real-time metrics report: <a href="https://docs.aws.amazon.com/connect/latest/adminguide/real-time-metrics-definitions.html#aftercallwork-real-time">ACW</a></p></dd><dt>AGENTS_AVAILABLE</dt><dd><p>Unit: COUNT</p><p>Name in real-time metrics report: <a href="https://docs.aws.amazon.com/connect/latest/adminguide/real-time-metrics-definitions.html#available-real-time">Available</a></p></dd><dt>AGENTS_ERROR</dt><dd><p>Unit: COUNT</p><p>Name in real-time metrics report: <a href="https://docs.aws.amazon.com/connect/latest/adminguide/real-time-metrics-definitions.html#error-real-time">Error</a></p></dd><dt>AGENTS_NON_PRODUCTIVE</dt><dd><p>Unit: COUNT</p><p>Name in real-time metrics report: <a href="https://docs.aws.amazon.com/connect/latest/adminguide/real-time-metrics-definitions.html#non-productive-time-real-time">NPT (Non-Productive Time)</a></p></dd><dt>AGENTS_ON_CALL</dt><dd><p>Unit: COUNT</p><p>Name in real-time metrics report: <a href="https://docs.aws.amazon.com/connect/latest/adminguide/real-time-metrics-definitions.html#on-call-real-time">On contact</a></p></dd><dt>AGENTS_ON_CONTACT</dt><dd><p>Unit: COUNT</p><p>Name in real-time metrics report: <a href="https://docs.aws.amazon.com/connect/latest/adminguide/real-time-metrics-definitions.html#on-call-real-time">On contact</a></p></dd><dt>AGENTS_ONLINE</dt><dd><p>Unit: COUNT</p><p>Name in real-time metrics report: <a href="https://docs.aws.amazon.com/connect/latest/adminguide/real-time-metrics-definitions.html#online-real-time">Online</a></p></dd><dt>AGENTS_STAFFED</dt><dd><p>Unit: COUNT</p><p>Name in real-time metrics report: <a href="https://docs.aws.amazon.com/connect/latest/adminguide/real-time-metrics-definitions.html#staffed-real-time">Staffed</a></p></dd><dt>CONTACTS_IN_QUEUE</dt><dd><p>Unit: COUNT</p><p>Name in real-time metrics report: <a href="https://docs.aws.amazon.com/connect/latest/adminguide/real-time-metrics-definitions.html#in-queue-real-time">In queue</a></p></dd><dt>CONTACTS_SCHEDULED</dt><dd><p>Unit: COUNT</p><p>Name in real-time metrics report: <a href="https://docs.aws.amazon.com/connect/latest/adminguide/real-time-metrics-definitions.html#scheduled-real-time">Scheduled</a></p></dd><dt>OLDEST_CONTACT_AGE</dt><dd><p>Unit: SECONDS</p><p>When you use groupings, Unit says SECONDS and the Value is returned in SECONDS. </p><p>When you do not use groupings, Unit says SECONDS but the Value is returned in MILLISECONDS. For example, if you get a response like this:</p><p><code>{ "Metric": { "Name": "OLDEST_CONTACT_AGE", "Unit": "SECONDS" }, "Value": 24113.0 </code>}</p><p>The actual OLDEST_CONTACT_AGE is 24 seconds.</p><p>Name in real-time metrics report: <a href="https://docs.aws.amazon.com/connect/latest/adminguide/real-time-metrics-definitions.html#oldest-real-time">Oldest</a></p></dd><dt>SLOTS_ACTIVE</dt><dd><p>Unit: COUNT</p><p>Name in real-time metrics report: <a href="https://docs.aws.amazon.com/connect/latest/adminguide/real-time-metrics-definitions.html#active-real-time">Active</a></p></dd><dt>SLOTS_AVAILABLE</dt><dd><p>Unit: COUNT</p><p>Name in real-time metrics report: <a href="https://docs.aws.amazon.com/connect/latest/adminguide/real-time-metrics-definitions.html#availability-real-time">Availability</a></p></dd></dl>
 */
@property (nonatomic, strong) NSArray<AWSConnectCurrentMetric *> * _Nullable currentMetrics;

/**
 <p>The filters to apply to returned metrics. You can filter up to the following limits:</p><ul><li><p>Queues: 100</p></li><li><p>Routing profiles: 100</p></li><li><p>Channels: 3 (VOICE, CHAT, and TASK channels are supported.)</p></li></ul><p>Metric data is retrieved only for the resources associated with the queues or routing profiles, and by any channels included in the filter. (You cannot filter by both queue AND routing profile.) You can include both resource IDs and resource ARNs in the same request. </p><p>Currently tagging is only supported on the resources that are passed in the filter.</p>
 */
@property (nonatomic, strong) AWSConnectFilters * _Nullable filters;

/**
 <p>The grouping applied to the metrics returned. For example, when grouped by <code>QUEUE</code>, the metrics returned apply to each queue rather than aggregated for all queues. </p><ul><li><p>If you group by <code>CHANNEL</code>, you should include a Channels filter. VOICE, CHAT, and TASK channels are supported.</p></li><li><p>If you group by <code>ROUTING_PROFILE</code>, you must include either a queue or routing profile filter. In addition, a routing profile filter is required for metrics <code>CONTACTS_SCHEDULED</code>, <code>CONTACTS_IN_QUEUE</code>, and <code> OLDEST_CONTACT_AGE</code>.</p></li><li><p>If no <code>Grouping</code> is included in the request, a summary of metrics is returned.</p></li></ul>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable groupings;

/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The maximum number of results to return per page.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results.</p><p>The token expires after 5 minutes from the time it is created. Subsequent requests that use the token must use the same request parameters as the request that generated the token.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The way to sort the resulting response based on metrics. You can enter one sort criteria. By default resources are sorted based on <code>AGENTS_ONLINE</code>, <code>DESCENDING</code>. The metric collection is sorted based on the input metrics.</p><p>Note the following:</p><ul><li><p>Sorting on <code>SLOTS_ACTIVE</code> and <code>SLOTS_AVAILABLE</code> is not supported.</p></li></ul>
 */
@property (nonatomic, strong) NSArray<AWSConnectCurrentMetricSortCriteria *> * _Nullable sortCriteria;

@end

/**
 
 */
@interface AWSConnectGetCurrentMetricDataResponse : AWSModel


/**
 <p>The total count of the result, regardless of the current page size. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable approximateTotalCount;

/**
 <p>The time at which the metrics were retrieved and cached for pagination.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable dataSnapshotTime;

/**
 <p>Information about the real-time metrics.</p>
 */
@property (nonatomic, strong) NSArray<AWSConnectCurrentMetricResult *> * _Nullable metricResults;

/**
 <p>If there are additional results, this is the token for the next set of results.</p><p>The token expires after 5 minutes from the time it is created. Subsequent requests that use the token must use the same request parameters as the request that generated the token.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSConnectGetCurrentUserDataRequest : AWSRequest


/**
 <p>The filters to apply to returned user data. You can filter up to the following limits:</p><ul><li><p>Queues: 100</p></li><li><p>Routing profiles: 100</p></li><li><p>Agents: 100</p></li><li><p>Contact states: 9</p></li><li><p>User hierarchy groups: 1</p></li></ul><p> The user data is retrieved for only the specified values/resources in the filter. A maximum of one filter can be passed from queues, routing profiles, agents, and user hierarchy groups. </p><p>Currently tagging is only supported on the resources that are passed in the filter.</p>
 */
@property (nonatomic, strong) AWSConnectUserDataFilters * _Nullable filters;

/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The maximum number of results to return per page.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSConnectGetCurrentUserDataResponse : AWSModel


/**
 <p>The total count of the result, regardless of the current page size.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable approximateTotalCount;

/**
 <p>If there are additional results, this is the token for the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>A list of the user data that is returned.</p>
 */
@property (nonatomic, strong) NSArray<AWSConnectUserData *> * _Nullable userDataList;

@end

/**
 
 */
@interface AWSConnectGetFederationTokenRequest : AWSRequest


/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

@end

/**
 
 */
@interface AWSConnectGetFederationTokenResponse : AWSModel


/**
 <p>The credentials to use for federation.</p>
 */
@property (nonatomic, strong) AWSConnectCredentials * _Nullable credentials;

/**
 <p>The URL to sign into the user's instance. </p>
 */
@property (nonatomic, strong) NSString * _Nullable signInUrl;

/**
 <p>The Amazon Resource Name (ARN) of the user.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userArn;

/**
 <p>The identifier for the user.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userId;

@end

/**
 
 */
@interface AWSConnectGetMetricDataRequest : AWSRequest


/**
 <p>The timestamp, in UNIX Epoch time format, at which to end the reporting interval for the retrieval of historical metrics data. The time must be specified using an interval of 5 minutes, such as 11:00, 11:05, 11:10, and must be later than the start time timestamp.</p><p>The time range between the start and end time must be less than 24 hours.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable endTime;

/**
 <p>The queues, up to 100, or channels, to use to filter the metrics returned. Metric data is retrieved only for the resources associated with the queues or channels included in the filter. You can include both queue IDs and queue ARNs in the same request. VOICE, CHAT, and TASK channels are supported.</p><note><p>To filter by <code>Queues</code>, enter the queue ID/ARN, not the name of the queue.</p></note>
 */
@property (nonatomic, strong) AWSConnectFilters * _Nullable filters;

/**
 <p>The grouping applied to the metrics returned. For example, when results are grouped by queue, the metrics returned are grouped by queue. The values returned apply to the metrics for each queue rather than aggregated for all queues.</p><p>If no grouping is specified, a summary of metrics for all queues is returned.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable groupings;

/**
 <p>The metrics to retrieve. Specify the name, unit, and statistic for each metric. The following historical metrics are available. For a description of each metric, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/historical-metrics-definitions.html">Historical Metrics Definitions</a> in the <i>Amazon Connect Administrator Guide</i>.</p><note><p>This API does not support a contacts incoming metric (there's no CONTACTS_INCOMING metric missing from the documented list). </p></note><dl><dt>ABANDON_TIME</dt><dd><p>Unit: SECONDS</p><p>Statistic: AVG</p></dd><dt>AFTER_CONTACT_WORK_TIME</dt><dd><p>Unit: SECONDS</p><p>Statistic: AVG</p></dd><dt>API_CONTACTS_HANDLED</dt><dd><p>Unit: COUNT</p><p>Statistic: SUM</p></dd><dt>CALLBACK_CONTACTS_HANDLED</dt><dd><p>Unit: COUNT</p><p>Statistic: SUM</p></dd><dt>CONTACTS_ABANDONED</dt><dd><p>Unit: COUNT</p><p>Statistic: SUM</p></dd><dt>CONTACTS_AGENT_HUNG_UP_FIRST</dt><dd><p>Unit: COUNT</p><p>Statistic: SUM</p></dd><dt>CONTACTS_CONSULTED</dt><dd><p>Unit: COUNT</p><p>Statistic: SUM</p></dd><dt>CONTACTS_HANDLED</dt><dd><p>Unit: COUNT</p><p>Statistic: SUM</p></dd><dt>CONTACTS_HANDLED_INCOMING</dt><dd><p>Unit: COUNT</p><p>Statistic: SUM</p></dd><dt>CONTACTS_HANDLED_OUTBOUND</dt><dd><p>Unit: COUNT</p><p>Statistic: SUM</p></dd><dt>CONTACTS_HOLD_ABANDONS</dt><dd><p>Unit: COUNT</p><p>Statistic: SUM</p></dd><dt>CONTACTS_MISSED</dt><dd><p>Unit: COUNT</p><p>Statistic: SUM</p></dd><dt>CONTACTS_QUEUED</dt><dd><p>Unit: COUNT</p><p>Statistic: SUM</p></dd><dt>CONTACTS_TRANSFERRED_IN</dt><dd><p>Unit: COUNT</p><p>Statistic: SUM</p></dd><dt>CONTACTS_TRANSFERRED_IN_FROM_QUEUE</dt><dd><p>Unit: COUNT</p><p>Statistic: SUM</p></dd><dt>CONTACTS_TRANSFERRED_OUT</dt><dd><p>Unit: COUNT</p><p>Statistic: SUM</p></dd><dt>CONTACTS_TRANSFERRED_OUT_FROM_QUEUE</dt><dd><p>Unit: COUNT</p><p>Statistic: SUM</p></dd><dt>HANDLE_TIME</dt><dd><p>Unit: SECONDS</p><p>Statistic: AVG</p></dd><dt>HOLD_TIME</dt><dd><p>Unit: SECONDS</p><p>Statistic: AVG</p></dd><dt>INTERACTION_AND_HOLD_TIME</dt><dd><p>Unit: SECONDS</p><p>Statistic: AVG</p></dd><dt>INTERACTION_TIME</dt><dd><p>Unit: SECONDS</p><p>Statistic: AVG</p></dd><dt>OCCUPANCY</dt><dd><p>Unit: PERCENT</p><p>Statistic: AVG</p></dd><dt>QUEUE_ANSWER_TIME</dt><dd><p>Unit: SECONDS</p><p>Statistic: AVG</p></dd><dt>QUEUED_TIME</dt><dd><p>Unit: SECONDS</p><p>Statistic: MAX</p></dd><dt>SERVICE_LEVEL</dt><dd><p>You can include up to 20 SERVICE_LEVEL metrics in a request.</p><p>Unit: PERCENT</p><p>Statistic: AVG</p><p>Threshold: For <code>ThresholdValue</code>, enter any whole number from 1 to 604800 (inclusive), in seconds. For <code>Comparison</code>, you must enter <code>LT</code> (for "Less than"). </p></dd></dl>
 */
@property (nonatomic, strong) NSArray<AWSConnectHistoricalMetric *> * _Nullable historicalMetrics;

/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The maximum number of results to return per page.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The timestamp, in UNIX Epoch time format, at which to start the reporting interval for the retrieval of historical metrics data. The time must be specified using a multiple of 5 minutes, such as 10:05, 10:10, 10:15.</p><p>The start time cannot be earlier than 24 hours before the time of the request. Historical metrics are available only for 24 hours.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable startTime;

@end

/**
 
 */
@interface AWSConnectGetMetricDataResponse : AWSModel


/**
 <p>Information about the historical metrics.</p><p>If no grouping is specified, a summary of metric data is returned.</p>
 */
@property (nonatomic, strong) NSArray<AWSConnectHistoricalMetricResult *> * _Nullable metricResults;

/**
 <p>If there are additional results, this is the token for the next set of results.</p><p>The token expires after 5 minutes from the time it is created. Subsequent requests that use the token must use the same request parameters as the request that generated the token.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSConnectGetMetricDataV2Request : AWSRequest


/**
 <p>The timestamp, in UNIX Epoch time format, at which to end the reporting interval for the retrieval of historical metrics data. The time must be later than the start time timestamp. It cannot be later than the current timestamp.</p><p>The time range between the start and end time must be less than 24 hours.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable endTime;

/**
 <p>The filters to apply to returned metrics. You can filter on the following resources:</p><ul><li><p>Queues</p></li><li><p>Routing profiles</p></li><li><p>Agents</p></li><li><p>Channels</p></li><li><p>User hierarchy groups</p></li></ul><p>At least one filter must be passed from queues, routing profiles, agents, or user hierarchy groups.</p><p>To filter by phone number, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/create-historical-metrics-report.html">Create a historical metrics report</a> in the <i>Amazon Connect Administrator's Guide</i>.</p><p>Note the following limits:</p><ul><li><p><b>Filter keys</b>: A maximum of 5 filter keys are supported in a single request. Valid filter keys: <code>QUEUE</code> | <code>ROUTING_PROFILE</code> | <code>AGENT</code> | <code>CHANNEL</code> | <code>AGENT_HIERARCHY_LEVEL_ONE</code> | <code>AGENT_HIERARCHY_LEVEL_TWO</code> | <code>AGENT_HIERARCHY_LEVEL_THREE</code> | <code>AGENT_HIERARCHY_LEVEL_FOUR</code> | <code>AGENT_HIERARCHY_LEVEL_FIVE</code></p></li><li><p><b>Filter values</b>: A maximum of 100 filter values are supported in a single request. For example, a <code>GetMetricDataV2</code> request can filter by 50 queues, 35 agents, and 15 routing profiles for a total of 100 filter values. <code>VOICE</code>, <code>CHAT</code>, and <code>TASK</code> are valid <code>filterValue</code> for the <code>CHANNEL</code> filter key.</p></li></ul>
 */
@property (nonatomic, strong) NSArray<AWSConnectFilterV2 *> * _Nullable filters;

/**
 <p>The grouping applied to the metrics that are returned. For example, when results are grouped by queue, the metrics returned are grouped by queue. The values that are returned apply to the metrics for each queue. They are not aggregated for all queues.</p><p>If no grouping is specified, a summary of all metrics is returned.</p><p>Valid grouping keys: <code>QUEUE</code> | <code>ROUTING_PROFILE</code> | <code>AGENT</code> | <code>CHANNEL</code> | <code>AGENT_HIERARCHY_LEVEL_ONE</code> | <code>AGENT_HIERARCHY_LEVEL_TWO</code> | <code>AGENT_HIERARCHY_LEVEL_THREE</code> | <code>AGENT_HIERARCHY_LEVEL_FOUR</code> | <code>AGENT_HIERARCHY_LEVEL_FIVE</code></p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable groupings;

/**
 <p>The maximum number of results to return per page.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The metrics to retrieve. Specify the name, groupings, and filters for each metric. The following historical metrics are available. For a description of each metric, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/historical-metrics-definitions.html">Historical metrics definitions</a> in the <i>Amazon Connect Administrator's Guide</i>.</p><dl><dt>AGENT_ADHERENT_TIME</dt><dd><p>This metric is available only in Amazon Web Services Regions where <a href="https://docs.aws.amazon.com/connect/latest/adminguide/regions.html#optimization_region">Forecasting, capacity planning, and scheduling</a> is available.</p><p>Unit: Seconds</p><p>Valid groupings and filters: Queue, Channel, Routing Profile, Agent, Agent Hierarchy </p></dd><dt>AGENT_NON_RESPONSE</dt><dd><p>Unit: Count</p><p>Valid groupings and filters: Queue, Channel, Routing Profile, Agent, Agent Hierarchy </p></dd><dt>AGENT_OCCUPANCY</dt><dd><p>Unit: Percentage</p><p>Valid groupings and filters: Routing Profile, Agent, Agent Hierarchy </p></dd><dt>AGENT_SCHEDULE_ADHERENCE</dt><dd><p>This metric is available only in Amazon Web Services Regions where <a href="https://docs.aws.amazon.com/connect/latest/adminguide/regions.html#optimization_region">Forecasting, capacity planning, and scheduling</a> is available.</p><p>Unit: Percent</p><p>Valid groupings and filters: Queue, Channel, Routing Profile, Agent, Agent Hierarchy</p></dd><dt>AGENT_SCHEDULED_TIME</dt><dd><p>This metric is available only in Amazon Web Services Regions where <a href="https://docs.aws.amazon.com/connect/latest/adminguide/regions.html#optimization_region">Forecasting, capacity planning, and scheduling</a> is available.</p><p>Unit: Seconds</p><p>Valid groupings and filters: Queue, Channel, Routing Profile, Agent, Agent Hierarchy</p></dd><dt>AVG_ABANDON_TIME</dt><dd><p>Unit: Seconds</p><p>Valid groupings and filters: Queue, Channel, Routing Profile, Agent, Agent Hierarchy</p></dd><dt>AVG_AFTER_CONTACT_WORK_TIME</dt><dd><p>Unit: Seconds</p><p>Valid groupings and filters: Queue, Channel, Routing Profile, Agent, Agent Hierarchy</p></dd><dt>AVG_AGENT_CONNECTING_TIME</dt><dd><p>Unit: Seconds</p><p>Valid metric filter key: <code>INITIATION_METHOD</code>. For now, this metric only supports the following as <code>INITIATION_METHOD</code>: <code>INBOUND</code> | <code>OUTBOUND</code> | <code>CALLBACK</code> | <code>API</code></p><p>Valid groupings and filters: Queue, Channel, Routing Profile, Agent, Agent Hierarchy</p></dd><dt>AVG_HANDLE_TIME</dt><dd><p>Unit: Seconds</p><p>Valid groupings and filters: Queue, Channel, Routing Profile, Agent, Agent Hierarchy</p></dd><dt>AVG_HOLD_TIME</dt><dd><p>Unit: Seconds</p><p>Valid groupings and filters: Queue, Channel, Routing Profile, Agent, Agent Hierarchy</p></dd><dt>AVG_INTERACTION_AND_HOLD_TIME</dt><dd><p>Unit: Seconds</p><p>Valid groupings and filters: Queue, Channel, Routing Profile, Agent, Agent Hierarchy</p></dd><dt>AVG_INTERACTION_TIME</dt><dd><p>Unit: Seconds</p><p>Valid groupings and filters: Queue, Channel, Routing Profile</p></dd><dt>AVG_QUEUE_ANSWER_TIME</dt><dd><p>Unit: Seconds</p><p>Valid groupings and filters: Queue, Channel, Routing Profile</p></dd><dt>CONTACTS_ABANDONED</dt><dd><p>Unit: Count</p><p>Valid groupings and filters: Queue, Channel, Routing Profile, Agent, Agent Hierarchy</p></dd><dt>CONTACTS_CREATED</dt><dd><p>Unit: Count</p><p>Valid metric filter key: <code>INITIATION_METHOD</code></p><p>Valid groupings and filters: Queue, Channel, Routing Profile</p></dd><dt>CONTACTS_HANDLED</dt><dd><p>Unit: Count</p><p>Valid metric filter key: <code>INITIATION_METHOD</code>, <code>DISCONNECT_REASON</code></p><p>Valid groupings and filters: Queue, Channel, Routing Profile, Agent, Agent Hierarchy</p></dd><dt>CONTACTS_HOLD_ABANDONS</dt><dd><p>Unit: Count</p><p>Valid groupings and filters: Queue, Channel, Routing Profile, Agent, Agent Hierarchy</p></dd><dt>CONTACTS_QUEUED</dt><dd><p>Unit: Count</p><p>Valid groupings and filters: Queue, Channel, Routing Profile, Agent, Agent Hierarchy</p></dd><dt>CONTACTS_TRANSFERRED_OUT</dt><dd><p>Unit: Count</p><p>Valid groupings and filters: Queue, Channel, Routing Profile, Agent, Agent Hierarchy</p></dd><dt>CONTACTS_TRANSFERRED_OUT_BY_AGENT</dt><dd><p>Unit: Count</p><p>Valid groupings and filters: Queue, Channel, Routing Profile, Agent, Agent Hierarchy</p></dd><dt>CONTACTS_TRANSFERRED_OUT_FROM_QUEUE</dt><dd><p>Unit: Count</p><p>Valid groupings and filters: Queue, Channel, Routing Profile, Agent, Agent Hierarchy</p></dd><dt>MAX_QUEUED_TIME</dt><dd><p>Unit: Seconds</p><p>Valid groupings and filters: Queue, Channel, Routing Profile, Agent, Agent Hierarchy</p></dd><dt>SERVICE_LEVEL</dt><dd><p>You can include up to 20 SERVICE_LEVEL metrics in a request.</p><p>Unit: Percent</p><p>Valid groupings and filters: Queue, Channel, Routing Profile</p><p>Threshold: For <code>ThresholdValue</code>, enter any whole number from 1 to 604800 (inclusive), in seconds. For <code>Comparison</code>, you must enter <code>LT</code> (for "Less than"). </p></dd><dt>SUM_CONTACTS_ANSWERED_IN_X</dt><dd><p>Unit: Count</p><p>Valid groupings and filters: Queue, Channel, Routing Profile</p><p>Threshold: For <code>ThresholdValue</code>, enter any whole number from 1 to 604800 (inclusive), in seconds. For <code>Comparison</code>, you must enter <code>LT</code> (for "Less than"). </p></dd><dt>SUM_CONTACTS_ABANDONED_IN_X</dt><dd><p>Unit: Count</p><p>Valid groupings and filters: Queue, Channel, Routing Profile</p><p>Threshold: For <code>ThresholdValue</code>, enter any whole number from 1 to 604800 (inclusive), in seconds. For <code>Comparison</code>, you must enter <code>LT</code> (for "Less than"). </p></dd><dt>SUM_CONTACTS_DISCONNECTED </dt><dd><p>Valid metric filter key: <code>DISCONNECT_REASON</code></p><p>Unit: Count</p><p>Valid groupings and filters: Queue, Channel, Routing Profile</p></dd><dt>SUM_RETRY_CALLBACK_ATTEMPTS</dt><dd><p>Unit: Count</p><p>Valid groupings and filters: Queue, Channel, Routing Profile</p></dd></dl>
 */
@property (nonatomic, strong) NSArray<AWSConnectMetricV2 *> * _Nullable metrics;

/**
 <p>The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The Amazon Resource Name (ARN) of the resource. This includes the <code>instanceId</code> an Amazon Connect instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

/**
 <p>The timestamp, in UNIX Epoch time format, at which to start the reporting interval for the retrieval of historical metrics data. The time must be before the end time timestamp. The time range between the start and end time must be less than 24 hours. The start time cannot be earlier than 35 days before the time of the request. Historical metrics are available for 35 days.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable startTime;

@end

/**
 
 */
@interface AWSConnectGetMetricDataV2Response : AWSModel


/**
 <p>Information about the metrics requested in the API request If no grouping is specified, a summary of metric data is returned. </p>
 */
@property (nonatomic, strong) NSArray<AWSConnectMetricResultV2 *> * _Nullable metricResults;

/**
 <p>If there are additional results, this is the token for the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSConnectGetPromptFileRequest : AWSRequest


/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>A unique identifier for the prompt.</p>
 */
@property (nonatomic, strong) NSString * _Nullable promptId;

@end

/**
 
 */
@interface AWSConnectGetPromptFileResponse : AWSModel


/**
 <p>A generated URL to the prompt that can be given to an unauthorized user so they can access the prompt in S3.</p>
 */
@property (nonatomic, strong) NSString * _Nullable promptPresignedUrl;

@end

/**
 
 */
@interface AWSConnectGetTaskTemplateRequest : AWSRequest


/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The system generated version of a task template that is associated with a task, when the task is created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable snapshotVersion;

/**
 <p>A unique identifier for the task template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable taskTemplateId;

@end

/**
 
 */
@interface AWSConnectGetTaskTemplateResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN).</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>Constraints that are applicable to the fields listed.</p>
 */
@property (nonatomic, strong) AWSConnectTaskTemplateConstraints * _Nullable constraints;

/**
 <p>The identifier of the flow that runs by default when a task is created by referencing this template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contactFlowId;

/**
 <p>The timestamp when the task template was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdTime;

/**
 <p>The default values for fields when a task is created by referencing this template.</p>
 */
@property (nonatomic, strong) AWSConnectTaskTemplateDefaults * _Nullable defaults;

/**
 <p>The description of the task template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>Fields that are part of the template.</p>
 */
@property (nonatomic, strong) NSArray<AWSConnectTaskTemplateField *> * _Nullable fields;

/**
 <p>A unique identifier for the task template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The timestamp when the task template was last modified.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedTime;

/**
 <p>The name of the task template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>Marks a template as <code>ACTIVE</code> or <code>INACTIVE</code> for a task to refer to it. Tasks can only be created from <code>ACTIVE</code> templates. If a template is marked as <code>INACTIVE</code>, then a task that refers to this template cannot be created.</p>
 */
@property (nonatomic, assign) AWSConnectTaskTemplateStatus status;

/**
 <p>The tags used to organize, track, or control access for this resource. For example, { "tags": {"key1":"value1", "key2":"value2"} }.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSConnectGetTrafficDistributionRequest : AWSRequest


/**
 <p>The identifier of the traffic distribution group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

@end

/**
 
 */
@interface AWSConnectGetTrafficDistributionResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the traffic distribution group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The identifier of the traffic distribution group. This can be the ID or the ARN if the API is being called in the Region where the traffic distribution group was created. The ARN must be provided if the call is from the replicated Region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The distribution of traffic between the instance and its replicas.</p>
 */
@property (nonatomic, strong) AWSConnectTelephonyConfig * _Nullable telephonyConfig;

@end

/**
 <p>Contains information about a hierarchy group.</p>
 */
@interface AWSConnectHierarchyGroup : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the hierarchy group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>Information about the levels in the hierarchy group.</p>
 */
@property (nonatomic, strong) AWSConnectHierarchyPath * _Nullable hierarchyPath;

/**
 <p>The identifier of the hierarchy group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The identifier of the level in the hierarchy group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable levelId;

/**
 <p>The name of the hierarchy group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The tags used to organize, track, or control access for this resource. For example, { "tags": {"key1":"value1", "key2":"value2"} }.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 <p>A leaf node condition which can be used to specify a hierarchy group condition.</p>
 */
@interface AWSConnectHierarchyGroupCondition : AWSModel


/**
 <p>The type of hierarchy group match.</p>
 */
@property (nonatomic, assign) AWSConnectHierarchyGroupMatchType hierarchyGroupMatchType;

/**
 <p>The value in the hierarchy group condition.</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 <p>Contains summary information about a hierarchy group.</p>
 */
@interface AWSConnectHierarchyGroupSummary : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the hierarchy group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The identifier of the hierarchy group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The name of the hierarchy group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 <p>Information about the hierarchy group.</p>
 */
@interface AWSConnectHierarchyGroupSummaryReference : AWSModel


/**
 <p>The Amazon Resource Name (ARN) for the hierarchy group. </p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The unique identifier for the hierarchy group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

@end

/**
 <p>Contains information about a hierarchy level.</p>
 */
@interface AWSConnectHierarchyLevel : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the hierarchy level.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The identifier of the hierarchy level.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The name of the hierarchy level.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 <p>Contains information about the hierarchy level to update.</p>
 Required parameters: [Name]
 */
@interface AWSConnectHierarchyLevelUpdate : AWSModel


/**
 <p>The name of the user hierarchy level. Must not be more than 50 characters.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 <p>Contains information about the levels of a hierarchy group.</p>
 */
@interface AWSConnectHierarchyPath : AWSModel


/**
 <p>Information about level five.</p>
 */
@property (nonatomic, strong) AWSConnectHierarchyGroupSummary * _Nullable levelFive;

/**
 <p>Information about level four.</p>
 */
@property (nonatomic, strong) AWSConnectHierarchyGroupSummary * _Nullable levelFour;

/**
 <p>Information about level one.</p>
 */
@property (nonatomic, strong) AWSConnectHierarchyGroupSummary * _Nullable levelOne;

/**
 <p>Information about level three.</p>
 */
@property (nonatomic, strong) AWSConnectHierarchyGroupSummary * _Nullable levelThree;

/**
 <p>Information about level two.</p>
 */
@property (nonatomic, strong) AWSConnectHierarchyGroupSummary * _Nullable levelTwo;

@end

/**
 <p>Information about the levels in the hierarchy group.</p>
 */
@interface AWSConnectHierarchyPathReference : AWSModel


/**
 <p>Information about level five.</p>
 */
@property (nonatomic, strong) AWSConnectHierarchyGroupSummaryReference * _Nullable levelFive;

/**
 <p>Information about level four.</p>
 */
@property (nonatomic, strong) AWSConnectHierarchyGroupSummaryReference * _Nullable levelFour;

/**
 <p>Information about level one.</p>
 */
@property (nonatomic, strong) AWSConnectHierarchyGroupSummaryReference * _Nullable levelOne;

/**
 <p>Information about level three.</p>
 */
@property (nonatomic, strong) AWSConnectHierarchyGroupSummaryReference * _Nullable levelThree;

/**
 <p>Information about level two.</p>
 */
@property (nonatomic, strong) AWSConnectHierarchyGroupSummaryReference * _Nullable levelTwo;

@end

/**
 <p>Contains information about a hierarchy structure.</p>
 */
@interface AWSConnectHierarchyStructure : AWSModel


/**
 <p>Information about level five.</p>
 */
@property (nonatomic, strong) AWSConnectHierarchyLevel * _Nullable levelFive;

/**
 <p>Information about level four.</p>
 */
@property (nonatomic, strong) AWSConnectHierarchyLevel * _Nullable levelFour;

/**
 <p>Information about level one.</p>
 */
@property (nonatomic, strong) AWSConnectHierarchyLevel * _Nullable levelOne;

/**
 <p>Information about level three.</p>
 */
@property (nonatomic, strong) AWSConnectHierarchyLevel * _Nullable levelThree;

/**
 <p>Information about level two.</p>
 */
@property (nonatomic, strong) AWSConnectHierarchyLevel * _Nullable levelTwo;

@end

/**
 <p>Contains information about the level hierarchy to update.</p>
 */
@interface AWSConnectHierarchyStructureUpdate : AWSModel


/**
 <p>The update for level five.</p>
 */
@property (nonatomic, strong) AWSConnectHierarchyLevelUpdate * _Nullable levelFive;

/**
 <p>The update for level four.</p>
 */
@property (nonatomic, strong) AWSConnectHierarchyLevelUpdate * _Nullable levelFour;

/**
 <p>The update for level one.</p>
 */
@property (nonatomic, strong) AWSConnectHierarchyLevelUpdate * _Nullable levelOne;

/**
 <p>The update for level three.</p>
 */
@property (nonatomic, strong) AWSConnectHierarchyLevelUpdate * _Nullable levelThree;

/**
 <p>The update for level two.</p>
 */
@property (nonatomic, strong) AWSConnectHierarchyLevelUpdate * _Nullable levelTwo;

@end

/**
 <p>Contains information about a historical metric. For a description of each metric, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/historical-metrics-definitions.html">Historical Metrics Definitions</a> in the <i>Amazon Connect Administrator Guide</i>.</p>
 */
@interface AWSConnectHistoricalMetric : AWSModel


/**
 <p>The name of the metric.</p>
 */
@property (nonatomic, assign) AWSConnectHistoricalMetricName name;

/**
 <p>The statistic for the metric.</p>
 */
@property (nonatomic, assign) AWSConnectStatistic statistic;

/**
 <p>The threshold for the metric, used with service level metrics.</p>
 */
@property (nonatomic, strong) AWSConnectThreshold * _Nullable threshold;

/**
 <p>The unit for the metric.</p>
 */
@property (nonatomic, assign) AWSConnectUnit unit;

@end

/**
 <p>Contains the data for a historical metric.</p>
 */
@interface AWSConnectHistoricalMetricData : AWSModel


/**
 <p>Information about the metric.</p>
 */
@property (nonatomic, strong) AWSConnectHistoricalMetric * _Nullable metric;

/**
 <p>The value of the metric.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable value;

@end

/**
 <p>Contains information about the historical metrics retrieved.</p>
 */
@interface AWSConnectHistoricalMetricResult : AWSModel


/**
 <p>The set of metrics.</p>
 */
@property (nonatomic, strong) NSArray<AWSConnectHistoricalMetricData *> * _Nullable collections;

/**
 <p>The dimension for the metrics.</p>
 */
@property (nonatomic, strong) AWSConnectDimensions * _Nullable dimensions;

@end

/**
 <p>Information about of the hours of operation.</p>
 */
@interface AWSConnectHoursOfOperation : AWSModel


/**
 <p>Configuration information for the hours of operation.</p>
 */
@property (nonatomic, strong) NSArray<AWSConnectHoursOfOperationConfig *> * _Nullable config;

/**
 <p>The description for the hours of operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The Amazon Resource Name (ARN) for the hours of operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable hoursOfOperationArn;

/**
 <p>The identifier for the hours of operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable hoursOfOperationId;

/**
 <p>The name for the hours of operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The tags used to organize, track, or control access for this resource. For example, { "tags": {"key1":"value1", "key2":"value2"} }.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

/**
 <p>The time zone for the hours of operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable timeZone;

@end

/**
 <p>Contains information about the hours of operation.</p>
 Required parameters: [Day, StartTime, EndTime]
 */
@interface AWSConnectHoursOfOperationConfig : AWSModel


/**
 <p>The day that the hours of operation applies to.</p>
 */
@property (nonatomic, assign) AWSConnectHoursOfOperationDays day;

/**
 <p>The end time that your contact center closes.</p>
 */
@property (nonatomic, strong) AWSConnectHoursOfOperationTimeSlice * _Nullable endTime;

/**
 <p>The start time that your contact center opens.</p>
 */
@property (nonatomic, strong) AWSConnectHoursOfOperationTimeSlice * _Nullable startTime;

@end

/**
 <p>Contains summary information about hours of operation for a contact center.</p>
 */
@interface AWSConnectHoursOfOperationSummary : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the hours of operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The identifier of the hours of operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The name of the hours of operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 <p>The start time or end time for an hours of operation.</p>
 Required parameters: [Hours, Minutes]
 */
@interface AWSConnectHoursOfOperationTimeSlice : AWSModel


/**
 <p>The hours.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable hours;

/**
 <p>The minutes.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable minutes;

@end

/**
 <p>The Amazon Connect instance.</p>
 */
@interface AWSConnectInstance : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>When the instance was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdTime;

/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The identity management type.</p>
 */
@property (nonatomic, assign) AWSConnectDirectoryType identityManagementType;

/**
 <p>Whether inbound calls are enabled.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable inboundCallsEnabled;

/**
 <p>The alias of instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceAlias;

/**
 <p>The state of the instance.</p>
 */
@property (nonatomic, assign) AWSConnectInstanceStatus instanceStatus;

/**
 <p>Whether outbound calls are enabled.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable outboundCallsEnabled;

/**
 <p>The service role of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable serviceRole;

/**
 <p>Relevant details why the instance was not successfully created. </p>
 */
@property (nonatomic, strong) AWSConnectInstanceStatusReason * _Nullable statusReason;

@end

/**
 <p>Relevant details why the instance was not successfully created.</p>
 */
@interface AWSConnectInstanceStatusReason : AWSModel


/**
 <p>The message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

@end

/**
 <p>The storage configuration for the instance.</p>
 Required parameters: [StorageType]
 */
@interface AWSConnectInstanceStorageConfig : AWSModel


/**
 <p>The existing association identifier that uniquely identifies the resource type and storage config for the given instance ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable associationId;

/**
 <p>The configuration of the Kinesis Firehose delivery stream.</p>
 */
@property (nonatomic, strong) AWSConnectKinesisFirehoseConfig * _Nullable kinesisFirehoseConfig;

/**
 <p>The configuration of the Kinesis data stream.</p>
 */
@property (nonatomic, strong) AWSConnectKinesisStreamConfig * _Nullable kinesisStreamConfig;

/**
 <p>The configuration of the Kinesis video stream.</p>
 */
@property (nonatomic, strong) AWSConnectKinesisVideoStreamConfig * _Nullable kinesisVideoStreamConfig;

/**
 <p>The S3 bucket configuration.</p>
 */
@property (nonatomic, strong) AWSConnectS3Config * _Nullable s3Config;

/**
 <p>A valid storage type.</p>
 */
@property (nonatomic, assign) AWSConnectStorageType storageType;

@end

/**
 <p>Information about the instance.</p>
 */
@interface AWSConnectInstanceSummary : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>When the instance was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdTime;

/**
 <p>The identifier of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The identity management type of the instance.</p>
 */
@property (nonatomic, assign) AWSConnectDirectoryType identityManagementType;

/**
 <p>Whether inbound calls are enabled.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable inboundCallsEnabled;

/**
 <p>The alias of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceAlias;

/**
 <p>The state of the instance.</p>
 */
@property (nonatomic, assign) AWSConnectInstanceStatus instanceStatus;

/**
 <p>Whether outbound calls are enabled.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable outboundCallsEnabled;

/**
 <p>The service role of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable serviceRole;

@end

/**
 <p>Contains summary information about the associated AppIntegrations.</p>
 */
@interface AWSConnectIntegrationAssociationSummary : AWSModel


/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The Amazon Resource Name (ARN) for the AppIntegration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable integrationArn;

/**
 <p>The Amazon Resource Name (ARN) for the AppIntegration association.</p>
 */
@property (nonatomic, strong) NSString * _Nullable integrationAssociationArn;

/**
 <p>The identifier for the AppIntegration association.</p>
 */
@property (nonatomic, strong) NSString * _Nullable integrationAssociationId;

/**
 <p>The integration type.</p>
 */
@property (nonatomic, assign) AWSConnectIntegrationType integrationType;

/**
 <p>The user-provided, friendly name for the external application.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceApplicationName;

/**
 <p>The URL for the external application.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceApplicationUrl;

/**
 <p>The name of the source.</p>
 */
@property (nonatomic, assign) AWSConnectSourceType sourceType;

@end

/**
 <p>A field that is invisible to an agent.</p>
 */
@interface AWSConnectInvisibleFieldInfo : AWSModel


/**
 <p>Identifier of the invisible field.</p>
 */
@property (nonatomic, strong) AWSConnectTaskTemplateFieldIdentifier * _Nullable identifier;

@end

/**
 <p>Configuration information of a Kinesis Data Firehose delivery stream.</p>
 Required parameters: [FirehoseArn]
 */
@interface AWSConnectKinesisFirehoseConfig : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the delivery stream.</p>
 */
@property (nonatomic, strong) NSString * _Nullable firehoseArn;

@end

/**
 <p>Configuration information of a Kinesis data stream.</p>
 Required parameters: [StreamArn]
 */
@interface AWSConnectKinesisStreamConfig : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the data stream.</p>
 */
@property (nonatomic, strong) NSString * _Nullable streamArn;

@end

/**
 <p>Configuration information of a Kinesis video stream.</p>
 Required parameters: [Prefix, RetentionPeriodHours, EncryptionConfig]
 */
@interface AWSConnectKinesisVideoStreamConfig : AWSModel


/**
 <p>The encryption configuration.</p>
 */
@property (nonatomic, strong) AWSConnectEncryptionConfig * _Nullable encryptionConfig;

/**
 <p>The prefix of the video stream.</p>
 */
@property (nonatomic, strong) NSString * _Nullable prefix;

/**
 <p>The number of hours data is retained in the stream. Kinesis Video Streams retains the data in a data store that is associated with the stream.</p><p>The default value is 0, indicating that the stream does not persist data.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable retentionPeriodHours;

@end

/**
 <p>Configuration information of an Amazon Lex bot.</p>
 Required parameters: [Name, LexRegion]
 */
@interface AWSConnectLexBot : AWSModel


/**
 <p>The Amazon Web Services Region where the Amazon Lex bot was created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lexRegion;

/**
 <p>The name of the Amazon Lex bot.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 <p>Configuration information of an Amazon Lex or Amazon Lex V2 bot.</p>
 */
@interface AWSConnectLexBotConfig : AWSModel


/**
 <p>Configuration information of an Amazon Lex bot.</p>
 */
@property (nonatomic, strong) AWSConnectLexBot * _Nullable lexBot;

/**
 <p>Configuration information of an Amazon Lex V2 bot.</p>
 */
@property (nonatomic, strong) AWSConnectLexV2Bot * _Nullable lexV2Bot;

@end

/**
 <p>Configuration information of an Amazon Lex V2 bot.</p>
 */
@interface AWSConnectLexV2Bot : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the Amazon Lex V2 bot.</p>
 */
@property (nonatomic, strong) NSString * _Nullable aliasArn;

@end

/**
 
 */
@interface AWSConnectListAgentStatusRequest : AWSRequest


/**
 <p>Available agent status types.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable agentStatusTypes;

/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The maximum number of results to return per page.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSConnectListAgentStatusResponse : AWSModel


/**
 <p>A summary of agent statuses.</p>
 */
@property (nonatomic, strong) NSArray<AWSConnectAgentStatusSummary *> * _Nullable agentStatusSummaryList;

/**
 <p>If there are additional results, this is the token for the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSConnectListApprovedOriginsRequest : AWSRequest


/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The maximum number of results to return per page.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSConnectListApprovedOriginsResponse : AWSModel


/**
 <p>If there are additional results, this is the token for the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The approved origins.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable origins;

@end

/**
 
 */
@interface AWSConnectListBotsRequest : AWSRequest


/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The version of Amazon Lex or Amazon Lex V2.</p>
 */
@property (nonatomic, assign) AWSConnectLexVersion lexVersion;

/**
 <p>The maximum number of results to return per page.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSConnectListBotsResponse : AWSModel


/**
 <p>The names and Amazon Web Services Regions of the Amazon Lex or Amazon Lex V2 bots associated with the specified instance.</p>
 */
@property (nonatomic, strong) NSArray<AWSConnectLexBotConfig *> * _Nullable lexBots;

/**
 <p>If there are additional results, this is the token for the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSConnectListContactEvaluationsRequest : AWSRequest


/**
 <p>The identifier of the contact in this instance of Amazon Connect. </p>
 */
@property (nonatomic, strong) NSString * _Nullable contactId;

/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results.</p><important><p>This is not expected to be set because the value returned in the previous response is always null.</p></important>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSConnectListContactEvaluationsResponse : AWSModel


/**
 <p>Provides details about a list of contact evaluations belonging to an instance.</p>
 */
@property (nonatomic, strong) NSArray<AWSConnectEvaluationSummary *> * _Nullable evaluationSummaryList;

/**
 <p>If there are additional results, this is the token for the next set of results.</p><important><p>This is always returned as null in the response.</p></important>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSConnectListContactFlowModulesRequest : AWSRequest


/**
 <p>The state of the flow module.</p>
 */
@property (nonatomic, assign) AWSConnectContactFlowModuleState contactFlowModuleState;

/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The maximum number of results to return per page.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSConnectListContactFlowModulesResponse : AWSModel


/**
 <p>Information about the flow module.</p>
 */
@property (nonatomic, strong) NSArray<AWSConnectContactFlowModuleSummary *> * _Nullable contactFlowModulesSummaryList;

/**
 <p>If there are additional results, this is the token for the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSConnectListContactFlowsRequest : AWSRequest


/**
 <p>The type of flow.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable contactFlowTypes;

/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The maximum number of results to return per page. The default MaxResult size is 100.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSConnectListContactFlowsResponse : AWSModel


/**
 <p>Information about the flows.</p>
 */
@property (nonatomic, strong) NSArray<AWSConnectContactFlowSummary *> * _Nullable contactFlowSummaryList;

/**
 <p>If there are additional results, this is the token for the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSConnectListContactReferencesRequest : AWSRequest


/**
 <p>The identifier of the initial contact.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contactId;

/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results.</p><important><p>This is not expected to be set, because the value returned in the previous response is always null.</p></important>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The type of reference.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable referenceTypes;

@end

/**
 
 */
@interface AWSConnectListContactReferencesResponse : AWSModel


/**
 <p>If there are additional results, this is the token for the next set of results.</p><important><p>This is always returned as null in the response.</p></important>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>Information about the flows.</p>
 */
@property (nonatomic, strong) NSArray<AWSConnectReferenceSummary *> * _Nullable referenceSummaryList;

@end

/**
 
 */
@interface AWSConnectListDefaultVocabulariesRequest : AWSRequest


/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The language code of the vocabulary entries. For a list of languages and their corresponding language codes, see <a href="https://docs.aws.amazon.com/transcribe/latest/dg/transcribe-whatis.html">What is Amazon Transcribe?</a></p>
 */
@property (nonatomic, assign) AWSConnectVocabularyLanguageCode languageCode;

/**
 <p>The maximum number of results to return per page.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSConnectListDefaultVocabulariesResponse : AWSModel


/**
 <p>A list of default vocabularies.</p>
 */
@property (nonatomic, strong) NSArray<AWSConnectDefaultVocabulary *> * _Nullable defaultVocabularyList;

/**
 <p>If there are additional results, this is the token for the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSConnectListEvaluationFormVersionsRequest : AWSRequest


/**
 <p>The unique identifier for the evaluation form.</p>
 */
@property (nonatomic, strong) NSString * _Nullable evaluationFormId;

/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The maximum number of results to return per page.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSConnectListEvaluationFormVersionsResponse : AWSModel


/**
 <p>Provides details about a list of evaluation forms belonging to an instance.</p>
 */
@property (nonatomic, strong) NSArray<AWSConnectEvaluationFormVersionSummary *> * _Nullable evaluationFormVersionSummaryList;

/**
 <p>If there are additional results, this is the token for the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSConnectListEvaluationFormsRequest : AWSRequest


/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The maximum number of results to return per page.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSConnectListEvaluationFormsResponse : AWSModel


/**
 <p>Provides details about a list of evaluation forms belonging to an instance.</p>
 */
@property (nonatomic, strong) NSArray<AWSConnectEvaluationFormSummary *> * _Nullable evaluationFormSummaryList;

/**
 <p>If there are additional results, this is the token for the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSConnectListHoursOfOperationsRequest : AWSRequest


/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The maximum number of results to return per page. The default MaxResult size is 100.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSConnectListHoursOfOperationsResponse : AWSModel


/**
 <p>Information about the hours of operation.</p>
 */
@property (nonatomic, strong) NSArray<AWSConnectHoursOfOperationSummary *> * _Nullable hoursOfOperationSummaryList;

/**
 <p>If there are additional results, this is the token for the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSConnectListInstanceAttributesRequest : AWSRequest


/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The maximum number of results to return per page.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSConnectListInstanceAttributesResponse : AWSModel


/**
 <p>The attribute types.</p>
 */
@property (nonatomic, strong) NSArray<AWSConnectAttribute *> * _Nullable attributes;

/**
 <p>If there are additional results, this is the token for the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSConnectListInstanceStorageConfigsRequest : AWSRequest


/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The maximum number of results to return per page.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>A valid resource type.</p>
 */
@property (nonatomic, assign) AWSConnectInstanceStorageResourceType resourceType;

@end

/**
 
 */
@interface AWSConnectListInstanceStorageConfigsResponse : AWSModel


/**
 <p>If there are additional results, this is the token for the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>A valid storage type.</p>
 */
@property (nonatomic, strong) NSArray<AWSConnectInstanceStorageConfig *> * _Nullable storageConfigs;

@end

/**
 
 */
@interface AWSConnectListInstancesRequest : AWSRequest


/**
 <p>The maximum number of results to return per page.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSConnectListInstancesResponse : AWSModel


/**
 <p>Information about the instances.</p>
 */
@property (nonatomic, strong) NSArray<AWSConnectInstanceSummary *> * _Nullable instanceSummaryList;

/**
 <p>If there are additional results, this is the token for the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSConnectListIntegrationAssociationsRequest : AWSRequest


/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The integration type.</p>
 */
@property (nonatomic, assign) AWSConnectIntegrationType integrationType;

/**
 <p>The maximum number of results to return per page.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSConnectListIntegrationAssociationsResponse : AWSModel


/**
 <p>The associations.</p>
 */
@property (nonatomic, strong) NSArray<AWSConnectIntegrationAssociationSummary *> * _Nullable integrationAssociationSummaryList;

/**
 <p>If there are additional results, this is the token for the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSConnectListLambdaFunctionsRequest : AWSRequest


/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The maximum number of results to return per page.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSConnectListLambdaFunctionsResponse : AWSModel


/**
 <p>The Lambdafunction ARNs associated with the specified instance.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable lambdaFunctions;

/**
 <p>If there are additional results, this is the token for the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSConnectListLexBotsRequest : AWSRequest


/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The maximum number of results to return per page. If no value is specified, the default is 10. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSConnectListLexBotsResponse : AWSModel


/**
 <p>The names and Amazon Web Services Regions of the Amazon Lex bots associated with the specified instance.</p>
 */
@property (nonatomic, strong) NSArray<AWSConnectLexBot *> * _Nullable lexBots;

/**
 <p>If there are additional results, this is the token for the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSConnectListPhoneNumbersRequest : AWSRequest


/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The maximum number of results to return per page. The default MaxResult size is 100.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The ISO country code.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable phoneNumberCountryCodes;

/**
 <p>The type of phone number.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable phoneNumberTypes;

@end

/**
 
 */
@interface AWSConnectListPhoneNumbersResponse : AWSModel


/**
 <p>If there are additional results, this is the token for the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>Information about the phone numbers.</p>
 */
@property (nonatomic, strong) NSArray<AWSConnectPhoneNumberSummary *> * _Nullable phoneNumberSummaryList;

@end

/**
 <p>Information about phone numbers that have been claimed to your Amazon Connect instance or traffic distribution group.</p>
 */
@interface AWSConnectListPhoneNumbersSummary : AWSModel


/**
 <p>The phone number. Phone numbers are formatted <code>[+] [country code] [subscriber number including area code]</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable phoneNumber;

/**
 <p>The Amazon Resource Name (ARN) of the phone number.</p>
 */
@property (nonatomic, strong) NSString * _Nullable phoneNumberArn;

/**
 <p>The ISO country code.</p>
 */
@property (nonatomic, assign) AWSConnectPhoneNumberCountryCode phoneNumberCountryCode;

/**
 <p>A unique identifier for the phone number.</p>
 */
@property (nonatomic, strong) NSString * _Nullable phoneNumberId;

/**
 <p>The type of phone number.</p>
 */
@property (nonatomic, assign) AWSConnectPhoneNumberType phoneNumberType;

/**
 <p>The Amazon Resource Name (ARN) for Amazon Connect instances or traffic distribution groups that phone numbers are claimed to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable targetArn;

@end

/**
 
 */
@interface AWSConnectListPhoneNumbersV2Request : AWSRequest


/**
 <p>The maximum number of results to return per page.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The ISO country code.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable phoneNumberCountryCodes;

/**
 <p>The prefix of the phone number. If provided, it must contain <code>+</code> as part of the country code.</p>
 */
@property (nonatomic, strong) NSString * _Nullable phoneNumberPrefix;

/**
 <p>The type of phone number.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable phoneNumberTypes;

/**
 <p>The Amazon Resource Name (ARN) for Amazon Connect instances or traffic distribution groups that phone numbers are claimed to. If <code>TargetArn</code> input is not provided, this API lists numbers claimed to all the Amazon Connect instances belonging to your account in the same Amazon Web Services Region as the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable targetArn;

@end

/**
 
 */
@interface AWSConnectListPhoneNumbersV2Response : AWSModel


/**
 <p>Information about phone numbers that have been claimed to your Amazon Connect instances or traffic distribution groups.</p>
 */
@property (nonatomic, strong) NSArray<AWSConnectListPhoneNumbersSummary *> * _Nullable listPhoneNumbersSummaryList;

/**
 <p>If there are additional results, this is the token for the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSConnectListPromptsRequest : AWSRequest


/**
 <p>The identifier of the Amazon Connect instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The maximum number of results to return per page. The default MaxResult size is 100.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSConnectListPromptsResponse : AWSModel


/**
 <p>If there are additional results, this is the token for the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>Information about the prompts.</p>
 */
@property (nonatomic, strong) NSArray<AWSConnectPromptSummary *> * _Nullable promptSummaryList;

@end

/**
 
 */
@interface AWSConnectListQueueQuickConnectsRequest : AWSRequest


/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The maximum number of results to return per page. The default MaxResult size is 100.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The identifier for the queue.</p>
 */
@property (nonatomic, strong) NSString * _Nullable queueId;

@end

/**
 
 */
@interface AWSConnectListQueueQuickConnectsResponse : AWSModel


/**
 <p>If there are additional results, this is the token for the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>Information about the quick connects.</p>
 */
@property (nonatomic, strong) NSArray<AWSConnectQuickConnectSummary *> * _Nullable quickConnectSummaryList;

@end

/**
 
 */
@interface AWSConnectListQueuesRequest : AWSRequest


/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The maximum number of results to return per page. The default MaxResult size is 100.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The type of queue.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable queueTypes;

@end

/**
 
 */
@interface AWSConnectListQueuesResponse : AWSModel


/**
 <p>If there are additional results, this is the token for the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>Information about the queues.</p>
 */
@property (nonatomic, strong) NSArray<AWSConnectQueueSummary *> * _Nullable queueSummaryList;

@end

/**
 
 */
@interface AWSConnectListQuickConnectsRequest : AWSRequest


/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The maximum number of results to return per page. The default MaxResult size is 100.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The type of quick connect. In the Amazon Connect console, when you create a quick connect, you are prompted to assign one of the following types: Agent (USER), External (PHONE_NUMBER), or Queue (QUEUE).</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable quickConnectTypes;

@end

/**
 
 */
@interface AWSConnectListQuickConnectsResponse : AWSModel


/**
 <p>If there are additional results, this is the token for the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>Information about the quick connects.</p>
 */
@property (nonatomic, strong) NSArray<AWSConnectQuickConnectSummary *> * _Nullable quickConnectSummaryList;

@end

/**
 
 */
@interface AWSConnectListRoutingProfileQueuesRequest : AWSRequest


/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The maximum number of results to return per page. The default MaxResult size is 100.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The identifier of the routing profile.</p>
 */
@property (nonatomic, strong) NSString * _Nullable routingProfileId;

@end

/**
 
 */
@interface AWSConnectListRoutingProfileQueuesResponse : AWSModel


/**
 <p>If there are additional results, this is the token for the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>Information about the routing profiles.</p>
 */
@property (nonatomic, strong) NSArray<AWSConnectRoutingProfileQueueConfigSummary *> * _Nullable routingProfileQueueConfigSummaryList;

@end

/**
 
 */
@interface AWSConnectListRoutingProfilesRequest : AWSRequest


/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The maximum number of results to return per page. The default MaxResult size is 100.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSConnectListRoutingProfilesResponse : AWSModel


/**
 <p>If there are additional results, this is the token for the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>Information about the routing profiles.</p>
 */
@property (nonatomic, strong) NSArray<AWSConnectRoutingProfileSummary *> * _Nullable routingProfileSummaryList;

@end

/**
 
 */
@interface AWSConnectListRulesRequest : AWSRequest


/**
 <p>The name of the event source.</p>
 */
@property (nonatomic, assign) AWSConnectEventSourceName eventSourceName;

/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The maximum number of results to return per page.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The publish status of the rule.</p>
 */
@property (nonatomic, assign) AWSConnectRulePublishStatus publishStatus;

@end

/**
 
 */
@interface AWSConnectListRulesResponse : AWSModel


/**
 <p>If there are additional results, this is the token for the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>Summary information about a rule.</p>
 */
@property (nonatomic, strong) NSArray<AWSConnectRuleSummary *> * _Nullable ruleSummaryList;

@end

/**
 
 */
@interface AWSConnectListSecurityKeysRequest : AWSRequest


/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The maximum number of results to return per page.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSConnectListSecurityKeysResponse : AWSModel


/**
 <p>If there are additional results, this is the token for the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The security keys.</p>
 */
@property (nonatomic, strong) NSArray<AWSConnectSecurityKey *> * _Nullable securityKeys;

@end

/**
 
 */
@interface AWSConnectListSecurityProfilePermissionsRequest : AWSRequest


/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The maximum number of results to return per page.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The identifier for the security profle.</p>
 */
@property (nonatomic, strong) NSString * _Nullable securityProfileId;

@end

/**
 
 */
@interface AWSConnectListSecurityProfilePermissionsResponse : AWSModel


/**
 <p>If there are additional results, this is the token for the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The permissions granted to the security profile. For a complete list of valid permissions, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/security-profile-list.html">List of security profile permissions</a>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable permissions;

@end

/**
 
 */
@interface AWSConnectListSecurityProfilesRequest : AWSRequest


/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The maximum number of results to return per page. The default MaxResult size is 100.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSConnectListSecurityProfilesResponse : AWSModel


/**
 <p>If there are additional results, this is the token for the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>Information about the security profiles.</p>
 */
@property (nonatomic, strong) NSArray<AWSConnectSecurityProfileSummary *> * _Nullable securityProfileSummaryList;

@end

/**
 
 */
@interface AWSConnectListTagsForResourceRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the resource. All Amazon Connect resources (instances, queues, flows, routing profiles, etc) have an ARN. To locate the ARN for an instance, for example, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">Find your Amazon Connect instance ID/ARN</a>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

@end

/**
 
 */
@interface AWSConnectListTagsForResourceResponse : AWSModel


/**
 <p>Information about the tags.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSConnectListTaskTemplatesRequest : AWSRequest


/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The maximum number of results to return per page.</p><important><p>It is not expected that you set this.</p></important>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The name of the task template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results.</p><important><p>It is not expected that you set this because the value returned in the previous response is always null.</p></important>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>Marks a template as <code>ACTIVE</code> or <code>INACTIVE</code> for a task to refer to it. Tasks can only be created from <code>ACTIVE</code> templates. If a template is marked as <code>INACTIVE</code>, then a task that refers to this template cannot be created.</p>
 */
@property (nonatomic, assign) AWSConnectTaskTemplateStatus status;

@end

/**
 
 */
@interface AWSConnectListTaskTemplatesResponse : AWSModel


/**
 <p>If there are additional results, this is the token for the next set of results.</p><important><p>This is always returned as a null in the response.</p></important>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>Provides details about a list of task templates belonging to an instance.</p>
 */
@property (nonatomic, strong) NSArray<AWSConnectTaskTemplateMetadata *> * _Nullable taskTemplates;

@end

/**
 
 */
@interface AWSConnectListTrafficDistributionGroupsRequest : AWSRequest


/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The maximum number of results to return per page.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSConnectListTrafficDistributionGroupsResponse : AWSModel


/**
 <p>If there are additional results, this is the token for the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>A list of traffic distribution groups.</p>
 */
@property (nonatomic, strong) NSArray<AWSConnectTrafficDistributionGroupSummary *> * _Nullable trafficDistributionGroupSummaryList;

@end

/**
 <p>Provides summary information about the use cases for the specified integration association.</p>
 Required parameters: [InstanceId, IntegrationAssociationId]
 */
@interface AWSConnectListUseCasesRequest : AWSRequest


/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The identifier for the integration association.</p>
 */
@property (nonatomic, strong) NSString * _Nullable integrationAssociationId;

/**
 <p>The maximum number of results to return per page.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSConnectListUseCasesResponse : AWSModel


/**
 <p>If there are additional results, this is the token for the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The use cases.</p>
 */
@property (nonatomic, strong) NSArray<AWSConnectUseCase *> * _Nullable useCaseSummaryList;

@end

/**
 
 */
@interface AWSConnectListUserHierarchyGroupsRequest : AWSRequest


/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The maximum number of results to return per page. The default MaxResult size is 100.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSConnectListUserHierarchyGroupsResponse : AWSModel


/**
 <p>If there are additional results, this is the token for the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>Information about the hierarchy groups.</p>
 */
@property (nonatomic, strong) NSArray<AWSConnectHierarchyGroupSummary *> * _Nullable userHierarchyGroupSummaryList;

@end

/**
 
 */
@interface AWSConnectListUsersRequest : AWSRequest


/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The maximum number of results to return per page. The default MaxResult size is 100.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSConnectListUsersResponse : AWSModel


/**
 <p>If there are additional results, this is the token for the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>Information about the users.</p>
 */
@property (nonatomic, strong) NSArray<AWSConnectUserSummary *> * _Nullable userSummaryList;

@end

/**
 <p>Contains information about which channels are supported, and how many contacts an agent can have on a channel simultaneously.</p>
 Required parameters: [Channel, Concurrency]
 */
@interface AWSConnectMediaConcurrency : AWSModel


/**
 <p>The channels that agents can handle in the Contact Control Panel (CCP).</p>
 */
@property (nonatomic, assign) AWSConnectChannel channel;

/**
 <p>The number of contacts an agent can have on a channel simultaneously.</p><p>Valid Range for <code>VOICE</code>: Minimum value of 1. Maximum value of 1.</p><p>Valid Range for <code>CHAT</code>: Minimum value of 1. Maximum value of 10.</p><p>Valid Range for <code>TASK</code>: Minimum value of 1. Maximum value of 10.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable concurrency;

/**
 <p>Defines the cross-channel routing behavior for each channel that is enabled for this Routing Profile. For example, this allows you to offer an agent a different contact from another channel when they are currently working with a contact from a Voice channel.</p>
 */
@property (nonatomic, strong) AWSConnectCrossChannelBehavior * _Nullable crossChannelBehavior;

@end

/**
 <p>Contains the name, thresholds, and metric filters.</p>
 */
@interface AWSConnectMetricDataV2 : AWSModel


/**
 <p>The metric name, thresholds, and metric filters of the returned metric.</p>
 */
@property (nonatomic, strong) AWSConnectMetricV2 * _Nullable metric;

/**
 <p>The corresponding value of the metric returned in the response.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable value;

@end

/**
 <p>Contains information about the filter used when retrieving metrics. <code>MetricFiltersV2</code> can be used on the following metrics: <code>AVG_AGENT_CONNECTING_TIME</code>, <code>CONTACTS_CREATED</code>, <code>CONTACTS_HANDLED</code>, <code>SUM_CONTACTS_DISCONNECTED</code>.</p>
 */
@interface AWSConnectMetricFilterV2 : AWSModel


/**
 <p>The key to use for filtering data. </p><p>Valid metric filter keys: <code>INITIATION_METHOD</code>, <code>DISCONNECT_REASON</code>. These are the same values as the <code>InitiationMethod</code> and <code>DisconnectReason</code> in the contact record. For more information, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/ctr-data-model.html#ctr-ContactTraceRecord">ContactTraceRecord</a> in the <i>Amazon Connect Administrator's Guide</i>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable metricFilterKey;

/**
 <p>The values to use for filtering data. </p><p>Valid metric filter values for <code>INITIATION_METHOD</code>: <code>INBOUND</code> | <code>OUTBOUND</code> | <code>TRANSFER</code> | <code>QUEUE_TRANSFER</code> | <code>CALLBACK</code> | <code>API</code></p><p>Valid metric filter values for <code>DISCONNECT_REASON</code>: <code>CUSTOMER_DISCONNECT</code> | <code>AGENT_DISCONNECT</code> | <code>THIRD_PARTY_DISCONNECT</code> | <code>TELECOM_PROBLEM</code> | <code>BARGED</code> | <code>CONTACT_FLOW_DISCONNECT</code> | <code>OTHER</code> | <code>EXPIRED</code> | <code>API</code></p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable metricFilterValues;

@end

/**
 <p>Contains information about the metric results.</p>
 */
@interface AWSConnectMetricResultV2 : AWSModel


/**
 <p>The set of metrics.</p>
 */
@property (nonatomic, strong) NSArray<AWSConnectMetricDataV2 *> * _Nullable collections;

/**
 <p>The dimension for the metrics.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable dimensions;

@end

/**
 <p>Contains information about the metric.</p>
 */
@interface AWSConnectMetricV2 : AWSModel


/**
 <p>Contains the filters to be used when returning data.</p>
 */
@property (nonatomic, strong) NSArray<AWSConnectMetricFilterV2 *> * _Nullable metricFilters;

/**
 <p>The name of the metric.</p><important><p>This parameter is required. The following Required = No is incorrect.</p></important>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>Contains information about the threshold for service level metrics.</p>
 */
@property (nonatomic, strong) NSArray<AWSConnectThresholdV2 *> * _Nullable threshold;

@end

/**
 
 */
@interface AWSConnectMonitorContactRequest : AWSRequest


/**
 <p>Specify which monitoring actions the user is allowed to take. For example, whether the user is allowed to escalate from silent monitoring to barge.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable allowedMonitorCapabilities;

/**
 <p>A unique, case-sensitive identifier that you provide to ensure the idempotency of the request. If not provided, the Amazon Web Services SDK populates this field. For more information about idempotency, see <a href="https://aws.amazon.com/builders-library/making-retries-safe-with-idempotent-APIs/">Making retries safe with idempotent APIs</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>The identifier of the contact.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contactId;

/**
 <p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The identifier of the user account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userId;

@end

/**
 
 */
@interface AWSConnectMonitorContactResponse : AWSModel


/**
 <p>The ARN of the contact.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contactArn;

/**
 <p>The identifier of the contact.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contactId;

@end

/**
 <p>The type of notification recipient.</p>
 */
@interface AWSConnectNotificationRecipientType : AWSModel


/**
 <p>A list of user IDs.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable userIds;

/**
 <p>The tags used to organize, track, or control access for this resource. For example, { "tags": {"key1":"value1", "key2":"value2"} }. Amazon Connect users with the specified tags will be notified.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable userTags;

@end

/**
 <p>Information about a reference when the <code>referenceType</code> is <code>NUMBER</code>. Otherwise, null.</p>
 */
@interface AWSConnectNumberReference : AWSModel


/**
 <p>Identifier of the number reference.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>A valid number.</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 <p>Information about the property value used in automation of a numeric questions. Label values are associated with minimum and maximum values for the numeric question.</p><ul><li><p>Sentiment scores have a minimum value of -5 and maximum value of 5.</p></li><li><p> Duration labels, such as <code>NON_TALK_TIME</code>, <code>CONTACT_DURATION</code>, <code>AGENT_INTERACTION_DURATION</code>, <code>CUSTOMER_HOLD_TIME</code> have a minimum value of 0 and maximum value of 28800.</p></li><li><p>Percentages have a minimum value of 0 and maximum value of 100. </p></li><li><p><code>NUMBER_OF_INTERRUPTIONS</code> has a minimum value of 0 and maximum value of 1000.</p></li></ul>
 Required parameters: [Label]
 */
@interface AWSConnectNumericQuestionPropertyValueAutomation : AWSModel


/**
 <p>The property label of the automation.</p>
 */
@property (nonatomic, assign) AWSConnectNumericQuestionPropertyAutomationLabel label;

@end

/**
 <p>The outbound caller ID name, number, and outbound whisper flow.</p>
 */
@interface AWSConnectOutboundCallerConfig : AWSModel


/**
 <p>The caller ID name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable outboundCallerIdName;

/**
 <p>The caller ID number.</p>
 */
@property (nonatomic, strong) NSString * _Nullable outboundCallerIdNumberId;

/**
 <p>The outbound whisper flow to be used during an outbound call.</p>
 */
@property (nonatomic, strong) NSString * _Nullable outboundFlowId;

@end

/**
 <p>The customer's details.</p>
 Required parameters: [DisplayName]
 */
@interface AWSConnectParticipantDetails : AWSModel


/**
 <p>Display name of the participant.</p>
 */
@property (nonatomic, strong) NSString * _Nullable displayName;

@end

/**
 <p>The details to add for the participant.</p>
 */
@interface AWSConnectParticipantDetailsToAdd : AWSModel


/**
 <p>The display name of the participant.</p>
 */
@property (nonatomic, strong) NSString * _Nullable displayName;

/**
 <p>The role of the participant being added.</p>
 */
@property (nonatomic, assign) AWSConnectParticipantRole participantRole;

@end

/**
 <p>Configuration information for the timer. After the timer configuration is set, it persists for the duration of the chat. It persists across new contacts in the chain, for example, transfer contacts.</p><p>For more information about how chat timeouts work, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/setup-chat-timeouts.html">Set up chat timeouts for human participants</a>. </p>
 Required parameters: [ParticipantRole, TimerType, TimerValue]
 */
@interface AWSConnectParticipantTimerConfiguration : AWSModel


/**
 <p>The role of the participant in the chat conversation.</p>
 */
@property (nonatomic, assign) AWSConnectTimerEligibleParticipantRoles participantRole;

/**
 <p>The type of timer. <code>IDLE</code> indicates the timer applies for considering a human chat participant as idle. <code>DISCONNECT_NONCUSTOMER</code> indicates the timer applies to automatically disconnecting a chat participant due to idleness.</p>
 */
@property (nonatomic, assign) AWSConnectParticipantTimerType timerType;

/**
 <p>The value of the timer. Either the timer action (Unset to delete the timer), or the duration of the timer in minutes. Only one value can be set.</p>
 */
@property (nonatomic, strong) AWSConnectParticipantTimerValue * _Nullable timerValue;

@end

/**
 <p>The value of the timer. Either the timer action (<code>Unset</code> to delete the timer), or the duration of the timer in minutes. Only one value can be set.</p><p>For more information about how chat timeouts work, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/setup-chat-timeouts.html">Set up chat timeouts for human participants</a>. </p>
 */
@interface AWSConnectParticipantTimerValue : AWSModel


/**
 <p>The timer action. Currently only one value is allowed: <code>Unset</code>. It deletes a timer.</p>
 */
@property (nonatomic, assign) AWSConnectParticipantTimerAction participantTimerAction;

/**
 <p>The duration of a timer, in minutes. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable participantTimerDurationInMinutes;

@end

/**
 <p>The credentials used by the participant.</p>
 */
@interface AWSConnectParticipantTokenCredentials : AWSModel


/**
 <p>The expiration of the token. It's specified in ISO 8601 format: yyyy-MM-ddThh:mm:ss.SSSZ. For example, 2019-11-08T02:41:28.172Z.</p>
 */
@property (nonatomic, strong) NSString * _Nullable expiry;

/**
 <p>The token used by the chat participant to call <a href="https://docs.aws.amazon.com/connect-participant/latest/APIReference/API_CreateParticipantConnection.html">CreateParticipantConnection</a>. The participant token is valid for the lifetime of a chat participant. </p>
 */
@property (nonatomic, strong) NSString * _Nullable participantToken;

@end

/**
 <p>Enable persistent chats. For more information about enabling persistent chat, and for example use cases and how to configure for them, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/chat-persistence.html">Enable persistent chat</a>.</p>
 */
@interface AWSConnectPersistentChat : AWSModel


/**
 <p>The contactId that is used for rehydration depends on the rehydration type. RehydrationType is required for persistent chat. </p><ul><li><p><code>ENTIRE_PAST_SESSION</code>: Rehydrates a chat from the most recently terminated past chat contact of the specified past ended chat session. To use this type, provide the <code>initialContactId</code> of the past ended chat session in the <code>sourceContactId</code> field. In this type, Amazon Connect determines the most recent chat contact on the specified chat session that has ended, and uses it to start a persistent chat. </p></li><li><p><code>FROM_SEGMENT</code>: Rehydrates a chat from the past chat contact that is specified in the <code>sourceContactId</code> field. </p></li></ul><p>The actual contactId used for rehydration is provided in the response of this API. </p>
 */
@property (nonatomic, assign) AWSConnectRehydrationType rehydrationType;

/**
 <p>The contactId from which a persistent chat session must be started.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceContactId;

@end

/**
 <p>Contains information about a phone number for a quick connect.</p>
 Required parameters: [PhoneNumber]
 */
@interface AWSConnectPhoneNumberQuickConnectConfig : AWSModel


/**
 <p>The phone number in E.164 format.</p>
 */
@property (nonatomic, strong) NSString * _Nullable phoneNumber;

@end

/**
 <p>The status of the phone number.</p><ul><li><p><code>CLAIMED</code> means the previous <a href="https://docs.aws.amazon.com/connect/latest/APIReference/API_ClaimedPhoneNumber.html">ClaimedPhoneNumber</a> or <a href="https://docs.aws.amazon.com/connect/latest/APIReference/API_UpdatePhoneNumber.html">UpdatePhoneNumber</a> operation succeeded.</p></li><li><p><code>IN_PROGRESS</code> means a <a href="https://docs.aws.amazon.com/connect/latest/APIReference/API_ClaimedPhoneNumber.html">ClaimedPhoneNumber</a> or <a href="https://docs.aws.amazon.com/connect/latest/APIReference/API_UpdatePhoneNumber.html">UpdatePhoneNumber</a> operation is still in progress and has not yet completed. You can call <a href="https://docs.aws.amazon.com/connect/latest/APIReference/API_DescribePhoneNumber.html">DescribePhoneNumber</a> at a later time to verify if the previous operation has completed.</p></li><li><p><code>FAILED</code> indicates that the previous <a href="https://docs.aws.amazon.com/connect/latest/APIReference/API_ClaimedPhoneNumber.html">ClaimedPhoneNumber</a> or <a href="https://docs.aws.amazon.com/connect/latest/APIReference/API_UpdatePhoneNumber.html">UpdatePhoneNumber</a> operation has failed. It will include a message indicating the failure reason. A common reason for a failure may be that the <code>TargetArn</code> value you are claiming or updating a phone number to has reached its limit of total claimed numbers. If you received a <code>FAILED</code> status from a <code>ClaimPhoneNumber</code> API call, you have one day to retry claiming the phone number before the number is released back to the inventory for other customers to claim.</p></li></ul>
 */
@interface AWSConnectPhoneNumberStatus : AWSModel


/**
 <p>The status message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

/**
 <p>The status.</p>
 */
@property (nonatomic, assign) AWSConnectPhoneNumberWorkflowStatus status;

@end

/**
 <p>Contains summary information about a phone number for a contact center.</p>
 */
@interface AWSConnectPhoneNumberSummary : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the phone number.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The identifier of the phone number.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The phone number.</p>
 */
@property (nonatomic, strong) NSString * _Nullable phoneNumber;

/**
 <p>The ISO country code.</p>
 */
@property (nonatomic, assign) AWSConnectPhoneNumberCountryCode phoneNumberCountryCode;

/**
 <p>The type of phone number.</p>
 */
@property (nonatomic, assign) AWSConnectPhoneNumberType phoneNumberType;

@end

/**
 <p>Information about a problem detail.</p>
 */
@interface AWSConnectProblemDetail : AWSModel


/**
 <p>The problem detail's message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

@end

/**
 <p>Information about a prompt.</p>
 */
@interface AWSConnectPrompt : AWSModel


/**
 <p>A description for the prompt.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The name of the prompt.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The Amazon Resource Name (ARN) of the prompt.</p>
 */
@property (nonatomic, strong) NSString * _Nullable promptARN;

/**
 <p>A unique identifier for the prompt.</p>
 */
@property (nonatomic, strong) NSString * _Nullable promptId;

/**
 <p>The tags used to organize, track, or control access for this resource. For example, { "tags": {"key1":"value1", "key2":"value2"} }.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 <p>Contains information about the prompt.</p>
 */
@interface AWSConnectPromptSummary : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the prompt.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The identifier of the prompt.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The name of the prompt.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 <p>Contains information about why a property is not valid.</p>
 Required parameters: [PropertyPath, Reason, Message]
 */
@interface AWSConnectPropertyValidationExceptionProperty : AWSModel


/**
 <p>A message describing why the property is not valid.</p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

/**
 <p>The full property path.</p>
 */
@property (nonatomic, strong) NSString * _Nullable propertyPath;

/**
 <p>Why the property is not valid.</p>
 */
@property (nonatomic, assign) AWSConnectPropertyValidationExceptionReason reason;

@end

/**
 
 */
@interface AWSConnectPutUserStatusRequest : AWSRequest


/**
 <p>The identifier of the agent status.</p>
 */
@property (nonatomic, strong) NSString * _Nullable agentStatusId;

/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The identifier of the user.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userId;

@end

/**
 
 */
@interface AWSConnectPutUserStatusResponse : AWSModel


@end

/**
 <p>Contains information about a queue.</p>
 */
@interface AWSConnectQueue : AWSModel


/**
 <p>The description of the queue.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The identifier for the hours of operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable hoursOfOperationId;

/**
 <p>The maximum number of contacts that can be in the queue before it is considered full.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxContacts;

/**
 <p>The name of the queue.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The outbound caller ID name, number, and outbound whisper flow.</p>
 */
@property (nonatomic, strong) AWSConnectOutboundCallerConfig * _Nullable outboundCallerConfig;

/**
 <p>The Amazon Resource Name (ARN) for the queue.</p>
 */
@property (nonatomic, strong) NSString * _Nullable queueArn;

/**
 <p>The identifier for the queue.</p>
 */
@property (nonatomic, strong) NSString * _Nullable queueId;

/**
 <p>The status of the queue.</p>
 */
@property (nonatomic, assign) AWSConnectQueueStatus status;

/**
 <p>The tags used to organize, track, or control access for this resource. For example, { "tags": {"key1":"value1", "key2":"value2"} }.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 <p>If this contact was queued, this contains information about the queue. </p>
 */
@interface AWSConnectQueueInfo : AWSModel


/**
 <p>The timestamp when the contact was added to the queue.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable enqueueTimestamp;

/**
 <p>The unique identifier for the queue.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

@end

/**
 <p>Contains information about a queue for a quick connect. The flow must be of type Transfer to Queue.</p>
 Required parameters: [QueueId, ContactFlowId]
 */
@interface AWSConnectQueueQuickConnectConfig : AWSModel


/**
 <p>The identifier of the flow.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contactFlowId;

/**
 <p>The identifier for the queue.</p>
 */
@property (nonatomic, strong) NSString * _Nullable queueId;

@end

/**
 <p>Contains information about a queue resource for which metrics are returned.</p>
 */
@interface AWSConnectQueueReference : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the queue.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The identifier of the queue.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

@end

/**
 <p>The search criteria to be used to return queues.</p><note><p>The <code>name</code> and <code>description</code> fields support "contains" queries with a minimum of 2 characters and a maximum of 25 characters. Any queries with character lengths outside of this range will throw invalid results. </p></note>
 */
@interface AWSConnectQueueSearchCriteria : AWSModel


/**
 <p>A list of conditions which would be applied together with an AND condition.</p>
 */
@property (nonatomic, strong) NSArray<AWSConnectQueueSearchCriteria *> * _Nullable andConditions;

/**
 <p>A list of conditions which would be applied together with an OR condition.</p>
 */
@property (nonatomic, strong) NSArray<AWSConnectQueueSearchCriteria *> * _Nullable orConditions;

/**
 <p>The type of queue.</p>
 */
@property (nonatomic, assign) AWSConnectSearchableQueueType queueTypeCondition;

/**
 <p>A leaf node condition which can be used to specify a string condition. </p><note><p>The currently supported value for <code>FieldName</code>: <code>name</code></p></note>
 */
@property (nonatomic, strong) AWSConnectStringCondition * _Nullable stringCondition;

@end

/**
 <p>Filters to be applied to search results.</p>
 */
@interface AWSConnectQueueSearchFilter : AWSModel


/**
 <p>An object that can be used to specify Tag conditions inside the <code>SearchFilter</code>. This accepts an <code>OR</code> of <code>AND</code> (List of List) input where: </p><ul><li><p>Top level list specifies conditions that need to be applied with <code>OR</code> operator</p></li><li><p>Inner list specifies conditions that need to be applied with <code>AND</code> operator.</p></li></ul>
 */
@property (nonatomic, strong) AWSConnectControlPlaneTagFilter * _Nullable tagFilter;

@end

/**
 <p>Contains summary information about a queue.</p>
 */
@interface AWSConnectQueueSummary : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the queue.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The identifier of the queue.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The name of the queue.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The type of queue.</p>
 */
@property (nonatomic, assign) AWSConnectQueueType queueType;

@end

/**
 <p>Contains information about a quick connect.</p>
 */
@interface AWSConnectQuickConnect : AWSModel


/**
 <p>The description.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The name of the quick connect.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The Amazon Resource Name (ARN) of the quick connect.</p>
 */
@property (nonatomic, strong) NSString * _Nullable quickConnectARN;

/**
 <p>Contains information about the quick connect.</p>
 */
@property (nonatomic, strong) AWSConnectQuickConnectConfig * _Nullable quickConnectConfig;

/**
 <p>The identifier for the quick connect.</p>
 */
@property (nonatomic, strong) NSString * _Nullable quickConnectId;

/**
 <p>The tags used to organize, track, or control access for this resource. For example, { "tags": {"key1":"value1", "key2":"value2"} }.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 <p>Contains configuration settings for a quick connect.</p>
 Required parameters: [QuickConnectType]
 */
@interface AWSConnectQuickConnectConfig : AWSModel


/**
 <p>The phone configuration. This is required only if QuickConnectType is PHONE_NUMBER.</p>
 */
@property (nonatomic, strong) AWSConnectPhoneNumberQuickConnectConfig * _Nullable phoneConfig;

/**
 <p>The queue configuration. This is required only if QuickConnectType is QUEUE.</p>
 */
@property (nonatomic, strong) AWSConnectQueueQuickConnectConfig * _Nullable queueConfig;

/**
 <p>The type of quick connect. In the Amazon Connect console, when you create a quick connect, you are prompted to assign one of the following types: Agent (USER), External (PHONE_NUMBER), or Queue (QUEUE). </p>
 */
@property (nonatomic, assign) AWSConnectQuickConnectType quickConnectType;

/**
 <p>The user configuration. This is required only if QuickConnectType is USER.</p>
 */
@property (nonatomic, strong) AWSConnectUserQuickConnectConfig * _Nullable userConfig;

@end

/**
 <p>Contains summary information about a quick connect.</p>
 */
@interface AWSConnectQuickConnectSummary : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the quick connect.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The identifier for the quick connect.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The name of the quick connect.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The type of quick connect. In the Amazon Connect console, when you create a quick connect, you are prompted to assign one of the following types: Agent (USER), External (PHONE_NUMBER), or Queue (QUEUE).</p>
 */
@property (nonatomic, assign) AWSConnectQuickConnectType quickConnectType;

@end

/**
 <p>Indicates a field that is read-only to an agent.</p>
 */
@interface AWSConnectReadOnlyFieldInfo : AWSModel


/**
 <p>Identifier of the read-only field.</p>
 */
@property (nonatomic, strong) AWSConnectTaskTemplateFieldIdentifier * _Nullable identifier;

@end

/**
 <p>Well-formed data on a contact, used by agents to complete a contact request. You can have up to 4,096 UTF-8 bytes across all references for a contact.</p>
 Required parameters: [Value, Type]
 */
@interface AWSConnectReference : AWSModel


/**
 <p>The type of the reference. <code>DATE</code> must be of type Epoch timestamp. </p>
 */
@property (nonatomic, assign) AWSConnectReferenceType types;

/**
 <p>A valid value for the reference. For example, for a URL reference, a formatted URL that is displayed to an agent in the Contact Control Panel (CCP).</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 <p>Contains summary information about a reference. <code>ReferenceSummary</code> contains only one non null field between the URL and attachment based on the reference type.</p>
 */
@interface AWSConnectReferenceSummary : AWSModel


/**
 <p>Information about the reference when the <code>referenceType</code> is <code>ATTACHMENT</code>. Otherwise, null.</p>
 */
@property (nonatomic, strong) AWSConnectAttachmentReference * _Nullable attachment;

/**
 <p>Information about a reference when the <code>referenceType</code> is <code>DATE</code>. Otherwise, null.</p>
 */
@property (nonatomic, strong) AWSConnectDateReference * _Nullable date;

/**
 <p>Information about a reference when the <code>referenceType</code> is <code>EMAIL</code>. Otherwise, null.</p>
 */
@property (nonatomic, strong) AWSConnectEmailReference * _Nullable email;

/**
 <p>Information about a reference when the <code>referenceType</code> is <code>NUMBER</code>. Otherwise, null.</p>
 */
@property (nonatomic, strong) AWSConnectNumberReference * _Nullable number;

/**
 <p>Information about a reference when the <code>referenceType</code> is <code>STRING</code>. Otherwise, null.</p>
 */
@property (nonatomic, strong) AWSConnectStringReference * _Nullable string;

/**
 <p>Information about the reference when the <code>referenceType</code> is <code>URL</code>. Otherwise, null.</p>
 */
@property (nonatomic, strong) AWSConnectUrlReference * _Nullable url;

@end

/**
 
 */
@interface AWSConnectReleasePhoneNumberRequest : AWSRequest


/**
 <p>A unique, case-sensitive identifier that you provide to ensure the idempotency of the request. If not provided, the Amazon Web Services SDK populates this field. For more information about idempotency, see <a href="https://aws.amazon.com/builders-library/making-retries-safe-with-idempotent-APIs/">Making retries safe with idempotent APIs</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>A unique identifier for the phone number.</p>
 */
@property (nonatomic, strong) NSString * _Nullable phoneNumberId;

@end

/**
 
 */
@interface AWSConnectReplicateInstanceRequest : AWSRequest


/**
 <p>A unique, case-sensitive identifier that you provide to ensure the idempotency of the request. If not provided, the Amazon Web Services SDK populates this field. For more information about idempotency, see <a href="https://aws.amazon.com/builders-library/making-retries-safe-with-idempotent-APIs/">Making retries safe with idempotent APIs</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance. You can provide the <code>InstanceId</code>, or the entire ARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The alias for the replicated instance. The <code>ReplicaAlias</code> must be unique.</p>
 */
@property (nonatomic, strong) NSString * _Nullable replicaAlias;

/**
 <p>The Amazon Web Services Region where to replicate the Amazon Connect instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable replicaRegion;

@end

/**
 
 */
@interface AWSConnectReplicateInstanceResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the replicated instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The identifier of the replicated instance. You can find the <code>instanceId</code> in the ARN of the instance. The replicated instance has the same identifier as the instance it was replicated from.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

@end

/**
 <p>Information about a required field.</p>
 */
@interface AWSConnectRequiredFieldInfo : AWSModel


/**
 <p>The unique identifier for the field.</p>
 */
@property (nonatomic, strong) AWSConnectTaskTemplateFieldIdentifier * _Nullable identifier;

@end

/**
 
 */
@interface AWSConnectResumeContactRecordingRequest : AWSRequest


/**
 <p>The identifier of the contact.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contactId;

/**
 <p>The identifier of the contact. This is the identifier of the contact associated with the first interaction with the contact center.</p>
 */
@property (nonatomic, strong) NSString * _Nullable initialContactId;

/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

@end

/**
 
 */
@interface AWSConnectResumeContactRecordingResponse : AWSModel


@end

/**
 <p>Contains information about a routing profile.</p>
 */
@interface AWSConnectRoutingProfile : AWSModel


/**
 <p>The identifier of the default outbound queue for this routing profile.</p>
 */
@property (nonatomic, strong) NSString * _Nullable defaultOutboundQueueId;

/**
 <p>The description of the routing profile.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The channels agents can handle in the Contact Control Panel (CCP) for this routing profile.</p>
 */
@property (nonatomic, strong) NSArray<AWSConnectMediaConcurrency *> * _Nullable mediaConcurrencies;

/**
 <p>The name of the routing profile.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The number of associated queues in routing profile.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable numberOfAssociatedQueues;

/**
 <p>The number of associated users in routing profile.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable numberOfAssociatedUsers;

/**
 <p>The Amazon Resource Name (ARN) of the routing profile.</p>
 */
@property (nonatomic, strong) NSString * _Nullable routingProfileArn;

/**
 <p>The identifier of the routing profile.</p>
 */
@property (nonatomic, strong) NSString * _Nullable routingProfileId;

/**
 <p>The tags used to organize, track, or control access for this resource. For example, { "tags": {"key1":"value1", "key2":"value2"} }.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 <p>Contains information about the queue and channel for which priority and delay can be set.</p>
 Required parameters: [QueueReference, Priority, Delay]
 */
@interface AWSConnectRoutingProfileQueueConfig : AWSModel


/**
 <p>The delay, in seconds, a contact should be in the queue before they are routed to an available agent. For more information, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/concepts-routing-profiles-priority.html">Queues: priority and delay</a> in the <i>Amazon Connect Administrator Guide</i>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable delay;

/**
 <p>The order in which contacts are to be handled for the queue. For more information, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/concepts-routing-profiles-priority.html">Queues: priority and delay</a>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable priority;

/**
 <p>Contains information about a queue resource.</p>
 */
@property (nonatomic, strong) AWSConnectRoutingProfileQueueReference * _Nullable queueReference;

@end

/**
 <p>Contains summary information about a routing profile queue.</p>
 Required parameters: [QueueId, QueueArn, QueueName, Priority, Delay, Channel]
 */
@interface AWSConnectRoutingProfileQueueConfigSummary : AWSModel


/**
 <p>The channels this queue supports.</p>
 */
@property (nonatomic, assign) AWSConnectChannel channel;

/**
 <p>The delay, in seconds, that a contact should be in the queue before they are routed to an available agent. For more information, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/concepts-routing-profiles-priority.html">Queues: priority and delay</a> in the <i>Amazon Connect Administrator Guide</i>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable delay;

/**
 <p>The order in which contacts are to be handled for the queue. For more information, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/concepts-routing-profiles-priority.html">Queues: priority and delay</a>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable priority;

/**
 <p>The Amazon Resource Name (ARN) of the queue.</p>
 */
@property (nonatomic, strong) NSString * _Nullable queueArn;

/**
 <p>The identifier for the queue.</p>
 */
@property (nonatomic, strong) NSString * _Nullable queueId;

/**
 <p>The name of the queue.</p>
 */
@property (nonatomic, strong) NSString * _Nullable queueName;

@end

/**
 <p>Contains the channel and queue identifier for a routing profile.</p>
 Required parameters: [QueueId, Channel]
 */
@interface AWSConnectRoutingProfileQueueReference : AWSModel


/**
 <p>The channels agents can handle in the Contact Control Panel (CCP) for this routing profile.</p>
 */
@property (nonatomic, assign) AWSConnectChannel channel;

/**
 <p>The identifier for the queue.</p>
 */
@property (nonatomic, strong) NSString * _Nullable queueId;

@end

/**
 <p>Information about the routing profile assigned to the user.</p>
 */
@interface AWSConnectRoutingProfileReference : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the routing profile.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The identifier of the routing profile.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

@end

/**
 <p>The search criteria to be used to return routing profiles.</p><note><p>The <code>name</code> and <code>description</code> fields support "contains" queries with a minimum of 2 characters and a maximum of 25 characters. Any queries with character lengths outside of this range will throw invalid results. </p></note>
 */
@interface AWSConnectRoutingProfileSearchCriteria : AWSModel


/**
 <p>A list of conditions which would be applied together with an AND condition.</p>
 */
@property (nonatomic, strong) NSArray<AWSConnectRoutingProfileSearchCriteria *> * _Nullable andConditions;

/**
 <p>A list of conditions which would be applied together with an OR condition.</p>
 */
@property (nonatomic, strong) NSArray<AWSConnectRoutingProfileSearchCriteria *> * _Nullable orConditions;

/**
 <p>A leaf node condition which can be used to specify a string condition. </p><note><p>The currently supported value for <code>FieldName</code>: <code>name</code></p></note>
 */
@property (nonatomic, strong) AWSConnectStringCondition * _Nullable stringCondition;

@end

/**
 <p>Filters to be applied to search results.</p>
 */
@interface AWSConnectRoutingProfileSearchFilter : AWSModel


/**
 <p>An object that can be used to specify Tag conditions inside the <code>SearchFilter</code>. This accepts an <code>OR</code> of <code>AND</code> (List of List) input where: </p><ul><li><p>Top level list specifies conditions that need to be applied with <code>OR</code> operator</p></li><li><p>Inner list specifies conditions that need to be applied with <code>AND</code> operator.</p></li></ul>
 */
@property (nonatomic, strong) AWSConnectControlPlaneTagFilter * _Nullable tagFilter;

@end

/**
 <p>Contains summary information about a routing profile.</p>
 */
@interface AWSConnectRoutingProfileSummary : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the routing profile.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The identifier of the routing profile.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The name of the routing profile.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 <p>Information about a rule.</p>
 Required parameters: [Name, RuleId, RuleArn, TriggerEventSource, Function, Actions, PublishStatus, CreatedTime, LastUpdatedTime, LastUpdatedBy]
 */
@interface AWSConnectRule : AWSModel


/**
 <p>A list of actions to be run when the rule is triggered.</p>
 */
@property (nonatomic, strong) NSArray<AWSConnectRuleAction *> * _Nullable actions;

/**
 <p>The timestamp for when the rule was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdTime;

/**
 <p>The conditions of the rule.</p>
 */
@property (nonatomic, strong) NSString * _Nullable function;

/**
 <p>The Amazon Resource Name (ARN) of the user who last updated the rule.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lastUpdatedBy;

/**
 <p>The timestamp for the when the rule was last updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdatedTime;

/**
 <p>The name of the rule.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The publish status of the rule.</p>
 */
@property (nonatomic, assign) AWSConnectRulePublishStatus publishStatus;

/**
 <p>The Amazon Resource Name (ARN) of the rule.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ruleArn;

/**
 <p>A unique identifier for the rule.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ruleId;

/**
 <p>The tags used to organize, track, or control access for this resource. For example, { "tags": {"key1":"value1", "key2":"value2"} }.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

/**
 <p>The event source to trigger the rule.</p>
 */
@property (nonatomic, strong) AWSConnectRuleTriggerEventSource * _Nullable triggerEventSource;

@end

/**
 <p>Information about the action to be performed when a rule is triggered.</p>
 Required parameters: [ActionType]
 */
@interface AWSConnectRuleAction : AWSModel


/**
 <p>The type of action that creates a rule.</p>
 */
@property (nonatomic, assign) AWSConnectActionType actionType;

/**
 <p>Information about the contact category action.</p>
 */
@property (nonatomic, strong) AWSConnectAssignContactCategoryActionDefinition * _Nullable assignContactCategoryAction;

/**
 <p>Information about the EventBridge action.</p>
 */
@property (nonatomic, strong) AWSConnectEventBridgeActionDefinition * _Nullable eventBridgeAction;

/**
 <p>Information about the send notification action.</p>
 */
@property (nonatomic, strong) AWSConnectSendNotificationActionDefinition * _Nullable sendNotificationAction;

/**
 <p>Information about the task action. This field is required if <code>TriggerEventSource</code> is one of the following values: <code>OnZendeskTicketCreate</code> | <code>OnZendeskTicketStatusUpdate</code> | <code>OnSalesforceCaseCreate</code></p>
 */
@property (nonatomic, strong) AWSConnectTaskActionDefinition * _Nullable taskAction;

@end

/**
 <p>A list of <code>ActionTypes</code> associated with a rule. </p>
 Required parameters: [Name, RuleId, RuleArn, EventSourceName, PublishStatus, ActionSummaries, CreatedTime, LastUpdatedTime]
 */
@interface AWSConnectRuleSummary : AWSModel


/**
 <p>A list of ActionTypes associated with a rule. </p>
 */
@property (nonatomic, strong) NSArray<AWSConnectActionSummary *> * _Nullable actionSummaries;

/**
 <p>The timestamp for when the rule was created. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdTime;

/**
 <p>The name of the event source.</p>
 */
@property (nonatomic, assign) AWSConnectEventSourceName eventSourceName;

/**
 <p>The timestamp for when the rule was last updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdatedTime;

/**
 <p>The name of the rule.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The publish status of the rule.</p>
 */
@property (nonatomic, assign) AWSConnectRulePublishStatus publishStatus;

/**
 <p>The Amazon Resource Name (ARN) of the rule.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ruleArn;

/**
 <p>A unique identifier for the rule.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ruleId;

@end

/**
 <p>The name of the event source. This field is required if <code>TriggerEventSource</code> is one of the following values: <code>OnZendeskTicketCreate</code> | <code>OnZendeskTicketStatusUpdate</code> | <code>OnSalesforceCaseCreate</code></p>
 Required parameters: [EventSourceName]
 */
@interface AWSConnectRuleTriggerEventSource : AWSModel


/**
 <p>The name of the event source.</p>
 */
@property (nonatomic, assign) AWSConnectEventSourceName eventSourceName;

/**
 <p>The identifier for the integration association.</p>
 */
@property (nonatomic, strong) NSString * _Nullable integrationAssociationId;

@end

/**
 <p>Information about the Amazon Simple Storage Service (Amazon S3) storage type.</p>
 Required parameters: [BucketName, BucketPrefix]
 */
@interface AWSConnectS3Config : AWSModel


/**
 <p>The S3 bucket name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucketName;

/**
 <p>The S3 bucket prefix.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucketPrefix;

/**
 <p>The Amazon S3 encryption configuration.</p>
 */
@property (nonatomic, strong) AWSConnectEncryptionConfig * _Nullable encryptionConfig;

@end

/**
 
 */
@interface AWSConnectSearchAvailablePhoneNumbersRequest : AWSRequest


/**
 <p>The maximum number of results to return per page.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The ISO country code.</p>
 */
@property (nonatomic, assign) AWSConnectPhoneNumberCountryCode phoneNumberCountryCode;

/**
 <p>The prefix of the phone number. If provided, it must contain <code>+</code> as part of the country code.</p>
 */
@property (nonatomic, strong) NSString * _Nullable phoneNumberPrefix;

/**
 <p>The type of phone number.</p>
 */
@property (nonatomic, assign) AWSConnectPhoneNumberType phoneNumberType;

/**
 <p>The Amazon Resource Name (ARN) for Amazon Connect instances or traffic distribution groups that phone numbers are claimed to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable targetArn;

@end

/**
 
 */
@interface AWSConnectSearchAvailablePhoneNumbersResponse : AWSModel


/**
 <p>A list of available phone numbers that you can claim to your Amazon Connect instance or traffic distribution group.</p>
 */
@property (nonatomic, strong) NSArray<AWSConnectAvailableNumberSummary *> * _Nullable availableNumbersList;

/**
 <p>If there are additional results, this is the token for the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSConnectSearchQueuesRequest : AWSRequest


/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The maximum number of results to return per page.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The search criteria to be used to return queues.</p><note><p>The <code>name</code> and <code>description</code> fields support "contains" queries with a minimum of 2 characters and a maximum of 25 characters. Any queries with character lengths outside of this range will throw invalid results. </p></note>
 */
@property (nonatomic, strong) AWSConnectQueueSearchCriteria * _Nullable searchCriteria;

/**
 <p>Filters to be applied to search results.</p>
 */
@property (nonatomic, strong) AWSConnectQueueSearchFilter * _Nullable searchFilter;

@end

/**
 
 */
@interface AWSConnectSearchQueuesResponse : AWSModel


/**
 <p>The total number of queues which matched your search query.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable approximateTotalCount;

/**
 <p>If there are additional results, this is the token for the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>Information about the queues.</p>
 */
@property (nonatomic, strong) NSArray<AWSConnectQueue *> * _Nullable queues;

@end

/**
 
 */
@interface AWSConnectSearchRoutingProfilesRequest : AWSRequest


/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The maximum number of results to return per page.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The search criteria to be used to return routing profiles.</p><note><p>The <code>name</code> and <code>description</code> fields support "contains" queries with a minimum of 2 characters and a maximum of 25 characters. Any queries with character lengths outside of this range will throw invalid results. </p></note>
 */
@property (nonatomic, strong) AWSConnectRoutingProfileSearchCriteria * _Nullable searchCriteria;

/**
 <p>Filters to be applied to search results.</p>
 */
@property (nonatomic, strong) AWSConnectRoutingProfileSearchFilter * _Nullable searchFilter;

@end

/**
 
 */
@interface AWSConnectSearchRoutingProfilesResponse : AWSModel


/**
 <p>The total number of routing profiles which matched your search query.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable approximateTotalCount;

/**
 <p>If there are additional results, this is the token for the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>Information about the routing profiles.</p>
 */
@property (nonatomic, strong) NSArray<AWSConnectRoutingProfile *> * _Nullable routingProfiles;

@end

/**
 
 */
@interface AWSConnectSearchSecurityProfilesRequest : AWSRequest


/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The maximum number of results to return per page.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The search criteria to be used to return security profiles. </p><note><p>The <code>name</code> field support "contains" queries with a minimum of 2 characters and maximum of 25 characters. Any queries with character lengths outside of this range will throw invalid results.</p></note><note><p>The currently supported value for <code>FieldName</code>: <code>name</code></p></note>
 */
@property (nonatomic, strong) AWSConnectSecurityProfileSearchCriteria * _Nullable searchCriteria;

/**
 <p>Filters to be applied to search results.</p>
 */
@property (nonatomic, strong) AWSConnectSecurityProfilesSearchFilter * _Nullable searchFilter;

@end

/**
 
 */
@interface AWSConnectSearchSecurityProfilesResponse : AWSModel


/**
 <p>The total number of security profiles which matched your search query.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable approximateTotalCount;

/**
 <p>If there are additional results, this is the token for the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>Information about the security profiles.</p>
 */
@property (nonatomic, strong) NSArray<AWSConnectSecurityProfileSearchSummary *> * _Nullable securityProfiles;

@end

/**
 
 */
@interface AWSConnectSearchUsersRequest : AWSRequest


/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The maximum number of results to return per page.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The search criteria to be used to return users.</p><note><p>The <code>name</code> and <code>description</code> fields support "contains" queries with a minimum of 2 characters and a maximum of 25 characters. Any queries with character lengths outside of this range will throw invalid results. </p></note>
 */
@property (nonatomic, strong) AWSConnectUserSearchCriteria * _Nullable searchCriteria;

/**
 <p>Filters to be applied to search results.</p>
 */
@property (nonatomic, strong) AWSConnectUserSearchFilter * _Nullable searchFilter;

@end

/**
 
 */
@interface AWSConnectSearchUsersResponse : AWSModel


/**
 <p>The total number of users who matched your search query.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable approximateTotalCount;

/**
 <p>If there are additional results, this is the token for the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>Information about the users.</p>
 */
@property (nonatomic, strong) NSArray<AWSConnectUserSearchSummary *> * _Nullable users;

@end

/**
 
 */
@interface AWSConnectSearchVocabulariesRequest : AWSRequest


/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The language code of the vocabulary entries. For a list of languages and their corresponding language codes, see <a href="https://docs.aws.amazon.com/transcribe/latest/dg/transcribe-whatis.html">What is Amazon Transcribe?</a></p>
 */
@property (nonatomic, assign) AWSConnectVocabularyLanguageCode languageCode;

/**
 <p>The maximum number of results to return per page.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The starting pattern of the name of the vocabulary.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nameStartsWith;

/**
 <p>The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The current state of the custom vocabulary.</p>
 */
@property (nonatomic, assign) AWSConnectVocabularyState state;

@end

/**
 
 */
@interface AWSConnectSearchVocabulariesResponse : AWSModel


/**
 <p>If there are additional results, this is the token for the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The list of the available custom vocabularies.</p>
 */
@property (nonatomic, strong) NSArray<AWSConnectVocabularySummary *> * _Nullable vocabularySummaryList;

@end

/**
 <p>Configuration information of the security key.</p>
 */
@interface AWSConnectSecurityKey : AWSModel


/**
 <p>The existing association identifier that uniquely identifies the resource type and storage config for the given instance ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable associationId;

/**
 <p>When the security key was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTime;

/**
 <p>The key of the security key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

@end

/**
 <p>Contains information about a security profile.</p>
 */
@interface AWSConnectSecurityProfile : AWSModel


/**
 <p>The list of tags that a security profile uses to restrict access to resources in Amazon Connect.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable allowedAccessControlTags;

/**
 <p>The Amazon Resource Name (ARN) for the secruity profile.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The description of the security profile.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The identifier for the security profile.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The organization resource identifier for the security profile.</p>
 */
@property (nonatomic, strong) NSString * _Nullable organizationResourceId;

/**
 <p>The name for the security profile.</p>
 */
@property (nonatomic, strong) NSString * _Nullable securityProfileName;

/**
 <p>The list of resources that a security profile applies tag restrictions to in Amazon Connect.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable tagRestrictedResources;

/**
 <p>The tags used to organize, track, or control access for this resource. For example, { "tags": {"key1":"value1", "key2":"value2"} }.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 <p>The search criteria to be used to return security profiles.</p><note><p>The <code>name</code> field support "contains" queries with a minimum of 2 characters and maximum of 25 characters. Any queries with character lengths outside of this range will throw invalid results.</p></note>
 */
@interface AWSConnectSecurityProfileSearchCriteria : AWSModel


/**
 <p>A list of conditions which would be applied together with an AND condition.</p>
 */
@property (nonatomic, strong) NSArray<AWSConnectSecurityProfileSearchCriteria *> * _Nullable andConditions;

/**
 <p>A list of conditions which would be applied together with an OR condition.</p>
 */
@property (nonatomic, strong) NSArray<AWSConnectSecurityProfileSearchCriteria *> * _Nullable orConditions;

/**
 <p>A leaf node condition which can be used to specify a string condition. </p><note><p>The currently supported value for <code>FieldName</code>: <code>name</code></p></note>
 */
@property (nonatomic, strong) AWSConnectStringCondition * _Nullable stringCondition;

@end

/**
 <p>Information about the returned security profiles.</p>
 */
@interface AWSConnectSecurityProfileSearchSummary : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the security profile.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The description of the security profile.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The identifier of the security profile.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The organization resource identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable organizationResourceId;

/**
 <p>The name of the security profile.</p>
 */
@property (nonatomic, strong) NSString * _Nullable securityProfileName;

/**
 <p>The tags used to organize, track, or control access for this resource. For example, { "tags": {"key1":"value1", "key2":"value2"} }.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 <p>Contains information about a security profile.</p>
 */
@interface AWSConnectSecurityProfileSummary : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the security profile.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The identifier of the security profile.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The name of the security profile.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 <p>Filters to be applied to search results.</p>
 */
@interface AWSConnectSecurityProfilesSearchFilter : AWSModel


/**
 <p>An object that can be used to specify Tag conditions inside the <code>SearchFilter</code>. This accepts an <code>OR</code> of <code>AND</code> (List of List) input where: </p><ul><li><p>Top level list specifies conditions that need to be applied with <code>OR</code> operator</p></li><li><p>Inner list specifies conditions that need to be applied with <code>AND</code> operator.</p></li></ul>
 */
@property (nonatomic, strong) AWSConnectControlPlaneTagFilter * _Nullable tagFilter;

@end

/**
 <p>Information about the send notification action.</p>
 Required parameters: [DeliveryMethod, Content, ContentType, Recipient]
 */
@interface AWSConnectSendNotificationActionDefinition : AWSModel


/**
 <p>Notification content. Supports variable injection. For more information, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/contact-lens-variable-injection.html">JSONPath reference</a> in the <i>Amazon Connect Administrators Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable content;

/**
 <p>Content type format.</p>
 */
@property (nonatomic, assign) AWSConnectNotificationContentType contentType;

/**
 <p>Notification delivery method.</p>
 */
@property (nonatomic, assign) AWSConnectNotificationDeliveryType deliveryMethod;

/**
 <p>Notification recipient.</p>
 */
@property (nonatomic, strong) AWSConnectNotificationRecipientType * _Nullable recipient;

/**
 <p>The subject of the email if the delivery method is <code>EMAIL</code>. Supports variable injection. For more information, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/contact-lens-variable-injection.html">JSONPath reference</a> in the <i>Amazon Connect Administrators Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable subject;

@end

/**
 <p>Information about the automation option based on a rule category for a single select question.</p>
 Required parameters: [Category, Condition, OptionRefId]
 */
@interface AWSConnectSingleSelectQuestionRuleCategoryAutomation : AWSModel


/**
 <p> The category name, as defined in Rules.</p>
 */
@property (nonatomic, strong) NSString * _Nullable category;

/**
 <p>The condition to apply for the automation option. If the condition is <code>PRESENT</code>, then the option is applied when the contact data includes the category. Similarly, if the condition is <code>NOT_PRESENT</code>, then the option is applied when the contact data does not include the category.</p>
 */
@property (nonatomic, assign) AWSConnectSingleSelectQuestionRuleCategoryAutomationCondition condition;

/**
 <p>The identifier of the answer option.</p>
 */
@property (nonatomic, strong) NSString * _Nullable optionRefId;

@end

/**
 
 */
@interface AWSConnectStartChatContactRequest : AWSRequest


/**
 <p>A custom key-value pair using an attribute map. The attributes are standard Amazon Connect attributes. They can be accessed in flows just like any other contact attributes. </p><p>There can be up to 32,768 UTF-8 bytes across all key-value pairs per contact. Attribute keys can include only alphanumeric, dash, and underscore characters.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable attributes;

/**
 <p>The total duration of the newly started chat session. If not specified, the chat session duration defaults to 25 hour. The minimum configurable time is 60 minutes. The maximum configurable time is 10,080 minutes (7 days).</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable chatDurationInMinutes;

/**
 <p>A unique, case-sensitive identifier that you provide to ensure the idempotency of the request. If not provided, the Amazon Web Services SDK populates this field. For more information about idempotency, see <a href="https://aws.amazon.com/builders-library/making-retries-safe-with-idempotent-APIs/">Making retries safe with idempotent APIs</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>The identifier of the flow for initiating the chat. To see the ContactFlowId in the Amazon Connect console user interface, on the navigation menu go to <b>Routing</b>, <b>Contact Flows</b>. Choose the flow. On the flow page, under the name of the flow, choose <b>Show additional flow information</b>. The ContactFlowId is the last part of the ARN, shown here in bold: </p><p>arn:aws:connect:us-west-2:xxxxxxxxxxxx:instance/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/contact-flow/<b>846ec553-a005-41c0-8341-xxxxxxxxxxxx</b></p>
 */
@property (nonatomic, strong) NSString * _Nullable contactFlowId;

/**
 <p>The initial message to be sent to the newly created chat.</p>
 */
@property (nonatomic, strong) AWSConnectChatMessage * _Nullable initialMessage;

/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>Information identifying the participant.</p>
 */
@property (nonatomic, strong) AWSConnectParticipantDetails * _Nullable participantDetails;

/**
 <p>Enable persistent chats. For more information about enabling persistent chat, and for example use cases and how to configure for them, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/chat-persistence.html">Enable persistent chat</a>.</p>
 */
@property (nonatomic, strong) AWSConnectPersistentChat * _Nullable persistentChat;

/**
 <p>The unique identifier for an Amazon Connect contact. This identifier is related to the chat starting.</p><note><p>You cannot provide data for both RelatedContactId and PersistentChat. </p></note>
 */
@property (nonatomic, strong) NSString * _Nullable relatedContactId;

/**
 <p>The supported chat message content types. Supported types are <code>text/plain</code>, <code>text/markdown</code>, <code>application/json</code>, <code>application/vnd.amazonaws.connect.message.interactive</code>, and <code>application/vnd.amazonaws.connect.message.interactive.response</code>. </p><p>Content types must always contain <code>text/plain</code>. You can then put any other supported type in the list. For example, all the following lists are valid because they contain <code>text/plain</code>: <code>[text/plain, text/markdown, application/json]</code>, <code>[text/markdown, text/plain]</code>, <code>[text/plain, application/json, application/vnd.amazonaws.connect.message.interactive.response]</code>. </p><note><p>The type <code>application/vnd.amazonaws.connect.message.interactive</code> is required to use the <a href="https://docs.aws.amazon.com/connect/latest/adminguide/show-view-block.html">Show view</a> flow block.</p></note>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable supportedMessagingContentTypes;

@end

/**
 
 */
@interface AWSConnectStartChatContactResponse : AWSModel


/**
 <p>The identifier of this contact within the Amazon Connect instance. </p>
 */
@property (nonatomic, strong) NSString * _Nullable contactId;

/**
 <p>The contactId from which a persistent chat session is started. This field is populated only for persistent chats.</p>
 */
@property (nonatomic, strong) NSString * _Nullable continuedFromContactId;

/**
 <p>The identifier for a chat participant. The participantId for a chat participant is the same throughout the chat lifecycle.</p>
 */
@property (nonatomic, strong) NSString * _Nullable participantId;

/**
 <p>The token used by the chat participant to call <a href="https://docs.aws.amazon.com/connect-participant/latest/APIReference/API_CreateParticipantConnection.html">CreateParticipantConnection</a>. The participant token is valid for the lifetime of a chat participant.</p>
 */
@property (nonatomic, strong) NSString * _Nullable participantToken;

@end

/**
 
 */
@interface AWSConnectStartContactEvaluationRequest : AWSRequest


/**
 <p>A unique, case-sensitive identifier that you provide to ensure the idempotency of the request. If not provided, the Amazon Web Services SDK populates this field. For more information about idempotency, see <a href="https://aws.amazon.com/builders-library/making-retries-safe-with-idempotent-APIs/">Making retries safe with idempotent APIs</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>The identifier of the contact in this instance of Amazon Connect. </p>
 */
@property (nonatomic, strong) NSString * _Nullable contactId;

/**
 <p>The unique identifier for the evaluation form.</p>
 */
@property (nonatomic, strong) NSString * _Nullable evaluationFormId;

/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

@end

/**
 
 */
@interface AWSConnectStartContactEvaluationResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) for the contact evaluation resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable evaluationArn;

/**
 <p>A unique identifier for the contact evaluation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable evaluationId;

@end

/**
 
 */
@interface AWSConnectStartContactRecordingRequest : AWSRequest


/**
 <p>The identifier of the contact.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contactId;

/**
 <p>The identifier of the contact. This is the identifier of the contact associated with the first interaction with the contact center.</p>
 */
@property (nonatomic, strong) NSString * _Nullable initialContactId;

/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The person being recorded.</p>
 */
@property (nonatomic, strong) AWSConnectVoiceRecordingConfiguration * _Nullable voiceRecordingConfiguration;

@end

/**
 
 */
@interface AWSConnectStartContactRecordingResponse : AWSModel


@end

/**
 
 */
@interface AWSConnectStartContactStreamingRequest : AWSRequest


/**
 <p>The streaming configuration, such as the Amazon SNS streaming endpoint.</p>
 */
@property (nonatomic, strong) AWSConnectChatStreamingConfiguration * _Nullable chatStreamingConfiguration;

/**
 <p>A unique, case-sensitive identifier that you provide to ensure the idempotency of the request. If not provided, the Amazon Web Services SDK populates this field. For more information about idempotency, see <a href="https://aws.amazon.com/builders-library/making-retries-safe-with-idempotent-APIs/">Making retries safe with idempotent APIs</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>The identifier of the contact. This is the identifier of the contact associated with the first interaction with the contact center.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contactId;

/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

@end

/**
 
 */
@interface AWSConnectStartContactStreamingResponse : AWSModel


/**
 <p>The identifier of the streaming configuration enabled. </p>
 */
@property (nonatomic, strong) NSString * _Nullable streamingId;

@end

/**
 
 */
@interface AWSConnectStartOutboundVoiceContactRequest : AWSRequest


/**
 <p>Configuration of the answering machine detection for this outbound call. </p>
 */
@property (nonatomic, strong) AWSConnectAnswerMachineDetectionConfig * _Nullable answerMachineDetectionConfig;

/**
 <p>A custom key-value pair using an attribute map. The attributes are standard Amazon Connect attributes, and can be accessed in flows just like any other contact attributes.</p><p>There can be up to 32,768 UTF-8 bytes across all key-value pairs per contact. Attribute keys can include only alphanumeric, dash, and underscore characters.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable attributes;

/**
 <p>The campaign identifier of the outbound communication.</p>
 */
@property (nonatomic, strong) NSString * _Nullable campaignId;

/**
 <p>A unique, case-sensitive identifier that you provide to ensure the idempotency of the request. If not provided, the Amazon Web Services SDK populates this field. For more information about idempotency, see <a href="https://aws.amazon.com/builders-library/making-retries-safe-with-idempotent-APIs/">Making retries safe with idempotent APIs</a>. The token is valid for 7 days after creation. If a contact is already started, the contact ID is returned. </p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>The identifier of the flow for the outbound call. To see the ContactFlowId in the Amazon Connect console user interface, on the navigation menu go to <b>Routing</b>, <b>Contact Flows</b>. Choose the flow. On the flow page, under the name of the flow, choose <b>Show additional flow information</b>. The ContactFlowId is the last part of the ARN, shown here in bold: </p><p>arn:aws:connect:us-west-2:xxxxxxxxxxxx:instance/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/contact-flow/<b>846ec553-a005-41c0-8341-xxxxxxxxxxxx</b></p>
 */
@property (nonatomic, strong) NSString * _Nullable contactFlowId;

/**
 <p>The phone number of the customer, in E.164 format.</p>
 */
@property (nonatomic, strong) NSString * _Nullable destinationPhoneNumber;

/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The queue for the call. If you specify a queue, the phone displayed for caller ID is the phone number specified in the queue. If you do not specify a queue, the queue defined in the flow is used. If you do not specify a queue, you must specify a source phone number.</p>
 */
@property (nonatomic, strong) NSString * _Nullable queueId;

/**
 <p>The phone number associated with the Amazon Connect instance, in E.164 format. If you do not specify a source phone number, you must specify a queue.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourcePhoneNumber;

/**
 <p>Denotes the class of traffic. Calls with different traffic types are handled differently by Amazon Connect. The default value is <code>GENERAL</code>. Use <code>CAMPAIGN</code> if <code>EnableAnswerMachineDetection</code> is set to <code>true</code>. For all other cases, use <code>GENERAL</code>. </p>
 */
@property (nonatomic, assign) AWSConnectTrafficType trafficType;

@end

/**
 
 */
@interface AWSConnectStartOutboundVoiceContactResponse : AWSModel


/**
 <p>The identifier of this contact within the Amazon Connect instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contactId;

@end

/**
 
 */
@interface AWSConnectStartTaskContactRequest : AWSRequest


/**
 <p>A custom key-value pair using an attribute map. The attributes are standard Amazon Connect attributes, and can be accessed in flows just like any other contact attributes.</p><p>There can be up to 32,768 UTF-8 bytes across all key-value pairs per contact. Attribute keys can include only alphanumeric, dash, and underscore characters.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable attributes;

/**
 <p>A unique, case-sensitive identifier that you provide to ensure the idempotency of the request. If not provided, the Amazon Web Services SDK populates this field. For more information about idempotency, see <a href="https://aws.amazon.com/builders-library/making-retries-safe-with-idempotent-APIs/">Making retries safe with idempotent APIs</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>The identifier of the flow for initiating the tasks. To see the ContactFlowId in the Amazon Connect console user interface, on the navigation menu go to <b>Routing</b>, <b>Contact Flows</b>. Choose the flow. On the flow page, under the name of the flow, choose <b>Show additional flow information</b>. The ContactFlowId is the last part of the ARN, shown here in bold: </p><p>arn:aws:connect:us-west-2:xxxxxxxxxxxx:instance/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/contact-flow/<b>846ec553-a005-41c0-8341-xxxxxxxxxxxx</b></p>
 */
@property (nonatomic, strong) NSString * _Nullable contactFlowId;

/**
 <p>A description of the task that is shown to an agent in the Contact Control Panel (CCP).</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The name of a task that is shown to an agent in the Contact Control Panel (CCP).</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The identifier of the previous chat, voice, or task contact. </p>
 */
@property (nonatomic, strong) NSString * _Nullable previousContactId;

/**
 <p>The identifier for the quick connect.</p>
 */
@property (nonatomic, strong) NSString * _Nullable quickConnectId;

/**
 <p>A formatted URL that is shown to an agent in the Contact Control Panel (CCP).</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSConnectReference *> * _Nullable references;

/**
 <p>The contactId that is <a href="https://docs.aws.amazon.com/connect/latest/adminguide/tasks.html#linked-tasks">related</a> to this contact.</p>
 */
@property (nonatomic, strong) NSString * _Nullable relatedContactId;

/**
 <p>The timestamp, in Unix Epoch seconds format, at which to start running the inbound flow. The scheduled time cannot be in the past. It must be within up to 6 days in future. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable scheduledTime;

/**
 <p>A unique identifier for the task template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable taskTemplateId;

@end

/**
 
 */
@interface AWSConnectStartTaskContactResponse : AWSModel


/**
 <p>The identifier of this contact within the Amazon Connect instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contactId;

@end

/**
 
 */
@interface AWSConnectStopContactRecordingRequest : AWSRequest


/**
 <p>The identifier of the contact.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contactId;

/**
 <p>The identifier of the contact. This is the identifier of the contact associated with the first interaction with the contact center.</p>
 */
@property (nonatomic, strong) NSString * _Nullable initialContactId;

/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

@end

/**
 
 */
@interface AWSConnectStopContactRecordingResponse : AWSModel


@end

/**
 
 */
@interface AWSConnectStopContactRequest : AWSRequest


/**
 <p>The ID of the contact.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contactId;

/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

@end

/**
 
 */
@interface AWSConnectStopContactResponse : AWSModel


@end

/**
 
 */
@interface AWSConnectStopContactStreamingRequest : AWSRequest


/**
 <p>The identifier of the contact. This is the identifier of the contact that is associated with the first interaction with the contact center.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contactId;

/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The identifier of the streaming configuration enabled. </p>
 */
@property (nonatomic, strong) NSString * _Nullable streamingId;

@end

/**
 
 */
@interface AWSConnectStopContactStreamingResponse : AWSModel


@end

/**
 <p>A leaf node condition which can be used to specify a string condition. </p><note><p>The currently supported value for <code>FieldName</code>: <code>name</code></p></note>
 */
@interface AWSConnectStringCondition : AWSModel


/**
 <p>The type of comparison to be made when evaluating the string condition.</p>
 */
@property (nonatomic, assign) AWSConnectStringComparisonType comparisonType;

/**
 <p>The name of the field in the string condition.</p>
 */
@property (nonatomic, strong) NSString * _Nullable fieldName;

/**
 <p>The value of the string.</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 <p>Information about a reference when the <code>referenceType</code> is <code>STRING</code>. Otherwise, null.</p>
 */
@interface AWSConnectStringReference : AWSModel


/**
 <p>Identifier of the string reference.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>A valid string.</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 
 */
@interface AWSConnectSubmitContactEvaluationRequest : AWSRequest


/**
 <p>A map of question identifiers to answer value.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSConnectEvaluationAnswerInput *> * _Nullable answers;

/**
 <p>A unique identifier for the contact evaluation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable evaluationId;

/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>A map of question identifiers to note value.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSConnectEvaluationNote *> * _Nullable notes;

@end

/**
 
 */
@interface AWSConnectSubmitContactEvaluationResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) for the contact evaluation resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable evaluationArn;

/**
 <p>A unique identifier for the contact evaluation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable evaluationId;

@end

/**
 
 */
@interface AWSConnectSuspendContactRecordingRequest : AWSRequest


/**
 <p>The identifier of the contact.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contactId;

/**
 <p>The identifier of the contact. This is the identifier of the contact associated with the first interaction with the contact center.</p>
 */
@property (nonatomic, strong) NSString * _Nullable initialContactId;

/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

@end

/**
 
 */
@interface AWSConnectSuspendContactRecordingResponse : AWSModel


@end

/**
 <p>A leaf node condition which can be used to specify a tag condition, for example, <code>HAVE BPO = 123</code>. </p>
 */
@interface AWSConnectTagCondition : AWSModel


/**
 <p>The tag key in the tag condition.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tagKey;

/**
 <p>The tag value in the tag condition.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tagValue;

@end

/**
 
 */
@interface AWSConnectTagResourceRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

/**
 <p>The tags used to organize, track, or control access for this resource. For example, { "tags": {"key1":"value1", "key2":"value2"} }.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 <p>Information about the task action.</p>
 Required parameters: [Name, ContactFlowId]
 */
@interface AWSConnectTaskActionDefinition : AWSModel


/**
 <p>The identifier of the flow.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contactFlowId;

/**
 <p>The description. Supports variable injection. For more information, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/contact-lens-variable-injection.html">JSONPath reference</a> in the <i>Amazon Connect Administrators Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The name. Supports variable injection. For more information, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/contact-lens-variable-injection.html">JSONPath reference</a> in the <i>Amazon Connect Administrators Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>Information about the reference when the <code>referenceType</code> is <code>URL</code>. Otherwise, null. (Supports variable injection in the <code>Value</code> field.)</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSConnectReference *> * _Nullable references;

@end

/**
 <p>Describes constraints that apply to the template fields.</p>
 */
@interface AWSConnectTaskTemplateConstraints : AWSModel


/**
 <p>Lists the fields that are invisible to agents.</p>
 */
@property (nonatomic, strong) NSArray<AWSConnectInvisibleFieldInfo *> * _Nullable invisibleFields;

/**
 <p>Lists the fields that are read-only to agents, and cannot be edited.</p>
 */
@property (nonatomic, strong) NSArray<AWSConnectReadOnlyFieldInfo *> * _Nullable readOnlyFields;

/**
 <p>Lists the fields that are required to be filled by agents.</p>
 */
@property (nonatomic, strong) NSArray<AWSConnectRequiredFieldInfo *> * _Nullable requiredFields;

@end

/**
 <p>Describes a default field and its corresponding value.</p>
 */
@interface AWSConnectTaskTemplateDefaultFieldValue : AWSModel


/**
 <p>Default value for the field.</p>
 */
@property (nonatomic, strong) NSString * _Nullable defaultValue;

/**
 <p>Identifier of a field. </p>
 */
@property (nonatomic, strong) AWSConnectTaskTemplateFieldIdentifier * _Nullable identifier;

@end

/**
 <p>Describes default values for fields on a template.</p>
 */
@interface AWSConnectTaskTemplateDefaults : AWSModel


/**
 <p>Default value for the field.</p>
 */
@property (nonatomic, strong) NSArray<AWSConnectTaskTemplateDefaultFieldValue *> * _Nullable defaultFieldValues;

@end

/**
 <p>Describes a single task template field.</p>
 Required parameters: [Id]
 */
@interface AWSConnectTaskTemplateField : AWSModel


/**
 <p>The description of the field.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The unique identifier for the field.</p>
 */
@property (nonatomic, strong) AWSConnectTaskTemplateFieldIdentifier * _Nullable identifier;

/**
 <p>A list of options for a single select field.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable singleSelectOptions;

/**
 <p>Indicates the type of field.</p>
 */
@property (nonatomic, assign) AWSConnectTaskTemplateFieldType types;

@end

/**
 <p>The identifier of the task template field.</p>
 */
@interface AWSConnectTaskTemplateFieldIdentifier : AWSModel


/**
 <p>The name of the task template field.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 <p>Contains summary information about the task template.</p>
 */
@interface AWSConnectTaskTemplateMetadata : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the task template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The timestamp when the task template was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdTime;

/**
 <p>The description of the task template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>A unique identifier for the task template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The timestamp when the task template was last modified.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedTime;

/**
 <p>The name of the task template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>Marks a template as <code>ACTIVE</code> or <code>INACTIVE</code> for a task to refer to it. Tasks can only be created from <code>ACTIVE</code> templates. If a template is marked as <code>INACTIVE</code>, then a task that refers to this template cannot be created.</p>
 */
@property (nonatomic, assign) AWSConnectTaskTemplateStatus status;

@end

/**
 <p>The distribution of traffic between the instance and its replicas.</p>
 Required parameters: [Distributions]
 */
@interface AWSConnectTelephonyConfig : AWSModel


/**
 <p>Information about traffic distributions.</p>
 */
@property (nonatomic, strong) NSArray<AWSConnectDistribution *> * _Nullable distributions;

@end

/**
 <p>Contains information about the threshold for service level metrics.</p>
 */
@interface AWSConnectThreshold : AWSModel


/**
 <p>The type of comparison. Only "less than" (LT) comparisons are supported.</p>
 */
@property (nonatomic, assign) AWSConnectComparison comparison;

/**
 <p>The threshold value to compare.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable thresholdValue;

@end

/**
 <p>Contains information about the threshold for service level metrics.</p>
 */
@interface AWSConnectThresholdV2 : AWSModel


/**
 <p>The type of comparison. Only "less than" (LT) comparisons are supported.</p>
 */
@property (nonatomic, strong) NSString * _Nullable comparison;

/**
 <p>The threshold value to compare.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable thresholdValue;

@end

/**
 <p>Information about a traffic distribution group.</p>
 */
@interface AWSConnectTrafficDistributionGroup : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the traffic distribution group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The description of the traffic distribution group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The identifier of the traffic distribution group. This can be the ID or the ARN if the API is being called in the Region where the traffic distribution group was created. The ARN must be provided if the call is from the replicated Region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The Amazon Resource Name (ARN).</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceArn;

/**
 <p>The name of the traffic distribution group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The status of the traffic distribution group.</p><ul><li><p><code>CREATION_IN_PROGRESS</code> means the previous <a href="https://docs.aws.amazon.com/connect/latest/APIReference/API_CreateTrafficDistributionGroup.html">CreateTrafficDistributionGroup</a> operation is still in progress and has not yet completed.</p></li><li><p><code>ACTIVE</code> means the previous <a href="https://docs.aws.amazon.com/connect/latest/APIReference/API_CreateTrafficDistributionGroup.html">CreateTrafficDistributionGroup</a> operation has succeeded.</p></li><li><p><code>CREATION_FAILED</code> indicates that the previous <a href="https://docs.aws.amazon.com/connect/latest/APIReference/API_CreateTrafficDistributionGroup.html">CreateTrafficDistributionGroup</a> operation has failed.</p></li><li><p><code>PENDING_DELETION</code> means the previous <a href="https://docs.aws.amazon.com/connect/latest/APIReference/API_DeleteTrafficDistributionGroup.html">DeleteTrafficDistributionGroup</a> operation is still in progress and has not yet completed.</p></li><li><p><code>DELETION_FAILED</code> means the previous <a href="https://docs.aws.amazon.com/connect/latest/APIReference/API_DeleteTrafficDistributionGroup.html">DeleteTrafficDistributionGroup</a> operation has failed.</p></li><li><p><code>UPDATE_IN_PROGRESS</code> means the previous <a href="https://docs.aws.amazon.com/connect/latest/APIReference/API_UpdateTrafficDistributionGroup.html">UpdateTrafficDistributionGroup</a> operation is still in progress and has not yet completed.</p></li></ul>
 */
@property (nonatomic, assign) AWSConnectTrafficDistributionGroupStatus status;

/**
 <p>The tags used to organize, track, or control access for this resource. For example, { "tags": {"key1":"value1", "key2":"value2"} }.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 <p>Information about traffic distribution groups.</p>
 */
@interface AWSConnectTrafficDistributionGroupSummary : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the traffic distribution group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The identifier of the traffic distribution group. This can be the ID or the ARN if the API is being called in the Region where the traffic distribution group was created. The ARN must be provided if the call is from the replicated Region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The Amazon Resource Name (ARN) of the traffic distribution group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceArn;

/**
 <p>The name of the traffic distribution group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The status of the traffic distribution group. </p><ul><li><p><code>CREATION_IN_PROGRESS</code> means the previous <a href="https://docs.aws.amazon.com/connect/latest/APIReference/API_CreateTrafficDistributionGroup.html">CreateTrafficDistributionGroup</a> operation is still in progress and has not yet completed.</p></li><li><p><code>ACTIVE</code> means the previous <a href="https://docs.aws.amazon.com/connect/latest/APIReference/API_CreateTrafficDistributionGroup.html">CreateTrafficDistributionGroup</a> operation has succeeded.</p></li><li><p><code>CREATION_FAILED</code> indicates that the previous <a href="https://docs.aws.amazon.com/connect/latest/APIReference/API_CreateTrafficDistributionGroup.html">CreateTrafficDistributionGroup</a> operation has failed.</p></li><li><p><code>PENDING_DELETION</code> means the previous <a href="https://docs.aws.amazon.com/connect/latest/APIReference/API_DeleteTrafficDistributionGroup.html">DeleteTrafficDistributionGroup</a> operation is still in progress and has not yet completed.</p></li><li><p><code>DELETION_FAILED</code> means the previous <a href="https://docs.aws.amazon.com/connect/latest/APIReference/API_DeleteTrafficDistributionGroup.html">DeleteTrafficDistributionGroup</a> operation has failed.</p></li><li><p><code>UPDATE_IN_PROGRESS</code> means the previous <a href="https://docs.aws.amazon.com/connect/latest/APIReference/API_UpdateTrafficDistributionGroup.html">UpdateTrafficDistributionGroup</a> operation is still in progress and has not yet completed.</p></li></ul>
 */
@property (nonatomic, assign) AWSConnectTrafficDistributionGroupStatus status;

@end

/**
 
 */
@interface AWSConnectTransferContactRequest : AWSRequest


/**
 <p>A unique, case-sensitive identifier that you provide to ensure the idempotency of the request. If not provided, the Amazon Web Services SDK populates this field. For more information about idempotency, see <a href="https://aws.amazon.com/builders-library/making-retries-safe-with-idempotent-APIs/">Making retries safe with idempotent APIs</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>The identifier of the flow.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contactFlowId;

/**
 <p>The identifier of the contact in this instance of Amazon Connect. </p>
 */
@property (nonatomic, strong) NSString * _Nullable contactId;

/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The identifier for the queue.</p>
 */
@property (nonatomic, strong) NSString * _Nullable queueId;

/**
 <p>The identifier for the user.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userId;

@end

/**
 
 */
@interface AWSConnectTransferContactResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the contact.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contactArn;

/**
 <p>The identifier of the contact in this instance of Amazon Connect. </p>
 */
@property (nonatomic, strong) NSString * _Nullable contactId;

@end

/**
 
 */
@interface AWSConnectUntagResourceRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

/**
 <p>The tag keys.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable tagKeys;

@end

/**
 
 */
@interface AWSConnectUpdateAgentStatusRequest : AWSRequest


/**
 <p>The identifier of the agent status.</p>
 */
@property (nonatomic, strong) NSString * _Nullable agentStatusId;

/**
 <p>The description of the agent status.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The display order of the agent status.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable displayOrder;

/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The name of the agent status.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>A number indicating the reset order of the agent status.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable resetOrderNumber;

/**
 <p>The state of the agent status.</p>
 */
@property (nonatomic, assign) AWSConnectAgentStatusState state;

@end

/**
 
 */
@interface AWSConnectUpdateContactAttributesRequest : AWSRequest


/**
 <p>The Amazon Connect attributes. These attributes can be accessed in flows just like any other contact attributes.</p><p>You can have up to 32,768 UTF-8 bytes across all attributes for a contact. Attribute keys can include only alphanumeric, dash, and underscore characters.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable attributes;

/**
 <p>The identifier of the contact. This is the identifier of the contact associated with the first interaction with the contact center.</p>
 */
@property (nonatomic, strong) NSString * _Nullable initialContactId;

/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

@end

/**
 
 */
@interface AWSConnectUpdateContactAttributesResponse : AWSModel


@end

/**
 
 */
@interface AWSConnectUpdateContactEvaluationRequest : AWSRequest


/**
 <p>A map of question identifiers to answer value.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSConnectEvaluationAnswerInput *> * _Nullable answers;

/**
 <p>A unique identifier for the contact evaluation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable evaluationId;

/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>A map of question identifiers to note value.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSConnectEvaluationNote *> * _Nullable notes;

@end

/**
 
 */
@interface AWSConnectUpdateContactEvaluationResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) for the contact evaluation resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable evaluationArn;

/**
 <p>A unique identifier for the contact evaluation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable evaluationId;

@end

/**
 
 */
@interface AWSConnectUpdateContactFlowContentRequest : AWSRequest


/**
 <p>The identifier of the flow.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contactFlowId;

/**
 <p>The JSON string that represents flow's content. For an example, see <a href="https://docs.aws.amazon.com/connect/latest/APIReference/flow-language-example.html">Example contact flow in Amazon Connect Flow language</a>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable content;

/**
 <p>The identifier of the Amazon Connect instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

@end

/**
 
 */
@interface AWSConnectUpdateContactFlowContentResponse : AWSModel


@end

/**
 
 */
@interface AWSConnectUpdateContactFlowMetadataRequest : AWSRequest


/**
 <p>The identifier of the flow.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contactFlowId;

/**
 <p>The state of flow.</p>
 */
@property (nonatomic, assign) AWSConnectContactFlowState contactFlowState;

/**
 <p>The description of the flow.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The name of the flow.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSConnectUpdateContactFlowMetadataResponse : AWSModel


@end

/**
 
 */
@interface AWSConnectUpdateContactFlowModuleContentRequest : AWSRequest


/**
 <p>The identifier of the flow module.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contactFlowModuleId;

/**
 <p>The content of the flow module.</p>
 */
@property (nonatomic, strong) NSString * _Nullable content;

/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

@end

/**
 
 */
@interface AWSConnectUpdateContactFlowModuleContentResponse : AWSModel


@end

/**
 
 */
@interface AWSConnectUpdateContactFlowModuleMetadataRequest : AWSRequest


/**
 <p>The identifier of the flow module.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contactFlowModuleId;

/**
 <p>The description of the flow module.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The name of the flow module.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The state of flow module.</p>
 */
@property (nonatomic, assign) AWSConnectContactFlowModuleState state;

@end

/**
 
 */
@interface AWSConnectUpdateContactFlowModuleMetadataResponse : AWSModel


@end

/**
 
 */
@interface AWSConnectUpdateContactFlowNameRequest : AWSRequest


/**
 <p>The identifier of the flow.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contactFlowId;

/**
 <p>The description of the flow.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The identifier of the Amazon Connect instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The name of the flow.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSConnectUpdateContactFlowNameResponse : AWSModel


@end

/**
 
 */
@interface AWSConnectUpdateContactRequest : AWSRequest


/**
 <p>The identifier of the contact. This is the identifier of the contact associated with the first interaction with your contact center.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contactId;

/**
 <p>The description of the contact.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The name of the contact.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>Well-formed data on contact, shown to agents on Contact Control Panel (CCP).</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSConnectReference *> * _Nullable references;

@end

/**
 
 */
@interface AWSConnectUpdateContactResponse : AWSModel


@end

/**
 
 */
@interface AWSConnectUpdateContactScheduleRequest : AWSRequest


/**
 <p>The identifier of the contact.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contactId;

/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The timestamp, in Unix Epoch seconds format, at which to start running the inbound flow. The scheduled time cannot be in the past. It must be within up to 6 days in future. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable scheduledTime;

@end

/**
 
 */
@interface AWSConnectUpdateContactScheduleResponse : AWSModel


@end

/**
 
 */
@interface AWSConnectUpdateEvaluationFormRequest : AWSRequest


/**
 <p>A unique, case-sensitive identifier that you provide to ensure the idempotency of the request. If not provided, the Amazon Web Services SDK populates this field. For more information about idempotency, see <a href="https://aws.amazon.com/builders-library/making-retries-safe-with-idempotent-APIs/">Making retries safe with idempotent APIs</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>A flag indicating whether the operation must create a new version.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable createNewVersion;

/**
 <p>The description of the evaluation form.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The unique identifier for the evaluation form.</p>
 */
@property (nonatomic, strong) NSString * _Nullable evaluationFormId;

/**
 <p>A version of the evaluation form to update.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable evaluationFormVersion;

/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>Items that are part of the evaluation form. The total number of sections and questions must not exceed 100 each. Questions must be contained in a section.</p>
 */
@property (nonatomic, strong) NSArray<AWSConnectEvaluationFormItem *> * _Nullable items;

/**
 <p>A scoring strategy of the evaluation form.</p>
 */
@property (nonatomic, strong) AWSConnectEvaluationFormScoringStrategy * _Nullable scoringStrategy;

/**
 <p>A title of the evaluation form.</p>
 */
@property (nonatomic, strong) NSString * _Nullable title;

@end

/**
 
 */
@interface AWSConnectUpdateEvaluationFormResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) for the contact evaluation resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable evaluationFormArn;

/**
 <p>The unique identifier for the evaluation form.</p>
 */
@property (nonatomic, strong) NSString * _Nullable evaluationFormId;

/**
 <p>The version of the updated evaluation form resource.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable evaluationFormVersion;

@end

/**
 
 */
@interface AWSConnectUpdateHoursOfOperationRequest : AWSRequest


/**
 <p>Configuration information of the hours of operation.</p>
 */
@property (nonatomic, strong) NSArray<AWSConnectHoursOfOperationConfig *> * _Nullable config;

/**
 <p>The description of the hours of operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The identifier of the hours of operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable hoursOfOperationId;

/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The name of the hours of operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The time zone of the hours of operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable timeZone;

@end

/**
 
 */
@interface AWSConnectUpdateInstanceAttributeRequest : AWSRequest


/**
 <p>The type of attribute.</p><note><p>Only allowlisted customers can consume USE_CUSTOM_TTS_VOICES. To access this feature, contact Amazon Web Services Support for allowlisting.</p></note>
 */
@property (nonatomic, assign) AWSConnectInstanceAttributeType attributeType;

/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The value for the attribute. Maximum character limit is 100. </p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 
 */
@interface AWSConnectUpdateInstanceStorageConfigRequest : AWSRequest


/**
 <p>The existing association identifier that uniquely identifies the resource type and storage config for the given instance ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable associationId;

/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>A valid resource type.</p>
 */
@property (nonatomic, assign) AWSConnectInstanceStorageResourceType resourceType;

/**
 <p>The storage configuration for the instance.</p>
 */
@property (nonatomic, strong) AWSConnectInstanceStorageConfig * _Nullable storageConfig;

@end

/**
 <p>Configuration information for the chat participant role.</p>
 */
@interface AWSConnectUpdateParticipantRoleConfigChannelInfo : AWSModel


/**
 <p>Configuration information for the chat participant role.</p>
 */
@property (nonatomic, strong) AWSConnectChatParticipantRoleConfig * _Nullable chat;

@end

/**
 
 */
@interface AWSConnectUpdateParticipantRoleConfigRequest : AWSRequest


/**
 <p>The Amazon Connect channel you want to configure.</p>
 */
@property (nonatomic, strong) AWSConnectUpdateParticipantRoleConfigChannelInfo * _Nullable channelConfiguration;

/**
 <p>The identifier of the contact in this instance of Amazon Connect. </p>
 */
@property (nonatomic, strong) NSString * _Nullable contactId;

/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

@end

/**
 
 */
@interface AWSConnectUpdateParticipantRoleConfigResponse : AWSModel


@end

/**
 
 */
@interface AWSConnectUpdatePhoneNumberRequest : AWSRequest


/**
 <p>A unique, case-sensitive identifier that you provide to ensure the idempotency of the request. If not provided, the Amazon Web Services SDK populates this field. For more information about idempotency, see <a href="https://aws.amazon.com/builders-library/making-retries-safe-with-idempotent-APIs/">Making retries safe with idempotent APIs</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>A unique identifier for the phone number.</p>
 */
@property (nonatomic, strong) NSString * _Nullable phoneNumberId;

/**
 <p>The Amazon Resource Name (ARN) for Amazon Connect instances or traffic distribution groups that phone numbers are claimed to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable targetArn;

@end

/**
 
 */
@interface AWSConnectUpdatePhoneNumberResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the phone number.</p>
 */
@property (nonatomic, strong) NSString * _Nullable phoneNumberArn;

/**
 <p>A unique identifier for the phone number.</p>
 */
@property (nonatomic, strong) NSString * _Nullable phoneNumberId;

@end

/**
 
 */
@interface AWSConnectUpdatePromptRequest : AWSRequest


/**
 <p>A description of the prompt.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The name of the prompt.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>A unique identifier for the prompt.</p>
 */
@property (nonatomic, strong) NSString * _Nullable promptId;

/**
 <p>The URI for the S3 bucket where the prompt is stored.</p>
 */
@property (nonatomic, strong) NSString * _Nullable s3Uri;

@end

/**
 
 */
@interface AWSConnectUpdatePromptResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the prompt.</p>
 */
@property (nonatomic, strong) NSString * _Nullable promptARN;

/**
 <p>A unique identifier for the prompt.</p>
 */
@property (nonatomic, strong) NSString * _Nullable promptId;

@end

/**
 
 */
@interface AWSConnectUpdateQueueHoursOfOperationRequest : AWSRequest


/**
 <p>The identifier for the hours of operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable hoursOfOperationId;

/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The identifier for the queue.</p>
 */
@property (nonatomic, strong) NSString * _Nullable queueId;

@end

/**
 
 */
@interface AWSConnectUpdateQueueMaxContactsRequest : AWSRequest


/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The maximum number of contacts that can be in the queue before it is considered full.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxContacts;

/**
 <p>The identifier for the queue.</p>
 */
@property (nonatomic, strong) NSString * _Nullable queueId;

@end

/**
 
 */
@interface AWSConnectUpdateQueueNameRequest : AWSRequest


/**
 <p>The description of the queue.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The name of the queue.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The identifier for the queue.</p>
 */
@property (nonatomic, strong) NSString * _Nullable queueId;

@end

/**
 
 */
@interface AWSConnectUpdateQueueOutboundCallerConfigRequest : AWSRequest


/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The outbound caller ID name, number, and outbound whisper flow.</p>
 */
@property (nonatomic, strong) AWSConnectOutboundCallerConfig * _Nullable outboundCallerConfig;

/**
 <p>The identifier for the queue.</p>
 */
@property (nonatomic, strong) NSString * _Nullable queueId;

@end

/**
 
 */
@interface AWSConnectUpdateQueueStatusRequest : AWSRequest


/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The identifier for the queue.</p>
 */
@property (nonatomic, strong) NSString * _Nullable queueId;

/**
 <p>The status of the queue.</p>
 */
@property (nonatomic, assign) AWSConnectQueueStatus status;

@end

/**
 
 */
@interface AWSConnectUpdateQuickConnectConfigRequest : AWSRequest


/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>Information about the configuration settings for the quick connect.</p>
 */
@property (nonatomic, strong) AWSConnectQuickConnectConfig * _Nullable quickConnectConfig;

/**
 <p>The identifier for the quick connect.</p>
 */
@property (nonatomic, strong) NSString * _Nullable quickConnectId;

@end

/**
 
 */
@interface AWSConnectUpdateQuickConnectNameRequest : AWSRequest


/**
 <p>The description of the quick connect.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The name of the quick connect.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The identifier for the quick connect.</p>
 */
@property (nonatomic, strong) NSString * _Nullable quickConnectId;

@end

/**
 
 */
@interface AWSConnectUpdateRoutingProfileConcurrencyRequest : AWSRequest


/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The channels that agents can handle in the Contact Control Panel (CCP).</p>
 */
@property (nonatomic, strong) NSArray<AWSConnectMediaConcurrency *> * _Nullable mediaConcurrencies;

/**
 <p>The identifier of the routing profile.</p>
 */
@property (nonatomic, strong) NSString * _Nullable routingProfileId;

@end

/**
 
 */
@interface AWSConnectUpdateRoutingProfileDefaultOutboundQueueRequest : AWSRequest


/**
 <p>The identifier for the default outbound queue.</p>
 */
@property (nonatomic, strong) NSString * _Nullable defaultOutboundQueueId;

/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The identifier of the routing profile.</p>
 */
@property (nonatomic, strong) NSString * _Nullable routingProfileId;

@end

/**
 
 */
@interface AWSConnectUpdateRoutingProfileNameRequest : AWSRequest


/**
 <p>The description of the routing profile. Must not be more than 250 characters.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The name of the routing profile. Must not be more than 127 characters.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The identifier of the routing profile.</p>
 */
@property (nonatomic, strong) NSString * _Nullable routingProfileId;

@end

/**
 
 */
@interface AWSConnectUpdateRoutingProfileQueuesRequest : AWSRequest


/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The queues to be updated for this routing profile. Queues must first be associated to the routing profile. You can do this using AssociateRoutingProfileQueues.</p>
 */
@property (nonatomic, strong) NSArray<AWSConnectRoutingProfileQueueConfig *> * _Nullable queueConfigs;

/**
 <p>The identifier of the routing profile.</p>
 */
@property (nonatomic, strong) NSString * _Nullable routingProfileId;

@end

/**
 
 */
@interface AWSConnectUpdateRuleRequest : AWSRequest


/**
 <p>A list of actions to be run when the rule is triggered.</p>
 */
@property (nonatomic, strong) NSArray<AWSConnectRuleAction *> * _Nullable actions;

/**
 <p>The conditions of the rule.</p>
 */
@property (nonatomic, strong) NSString * _Nullable function;

/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The name of the rule. You can change the name only if <code>TriggerEventSource</code> is one of the following values: <code>OnZendeskTicketCreate</code> | <code>OnZendeskTicketStatusUpdate</code> | <code>OnSalesforceCaseCreate</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The publish status of the rule.</p>
 */
@property (nonatomic, assign) AWSConnectRulePublishStatus publishStatus;

/**
 <p>A unique identifier for the rule.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ruleId;

@end

/**
 
 */
@interface AWSConnectUpdateSecurityProfileRequest : AWSRequest


/**
 <p>The list of tags that a security profile uses to restrict access to resources in Amazon Connect.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable allowedAccessControlTags;

/**
 <p>The description of the security profile.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The permissions granted to a security profile. For a list of valid permissions, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/security-profile-list.html">List of security profile permissions</a>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable permissions;

/**
 <p>The identifier for the security profle.</p>
 */
@property (nonatomic, strong) NSString * _Nullable securityProfileId;

/**
 <p>The list of resources that a security profile applies tag restrictions to in Amazon Connect.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable tagRestrictedResources;

@end

/**
 
 */
@interface AWSConnectUpdateTaskTemplateRequest : AWSRequest


/**
 <p>Constraints that are applicable to the fields listed.</p>
 */
@property (nonatomic, strong) AWSConnectTaskTemplateConstraints * _Nullable constraints;

/**
 <p>The identifier of the flow that runs by default when a task is created by referencing this template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contactFlowId;

/**
 <p>The default values for fields when a task is created by referencing this template.</p>
 */
@property (nonatomic, strong) AWSConnectTaskTemplateDefaults * _Nullable defaults;

/**
 <p>The description of the task template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>Fields that are part of the template.</p>
 */
@property (nonatomic, strong) NSArray<AWSConnectTaskTemplateField *> * _Nullable fields;

/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The name of the task template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>Marks a template as <code>ACTIVE</code> or <code>INACTIVE</code> for a task to refer to it. Tasks can only be created from <code>ACTIVE</code> templates. If a template is marked as <code>INACTIVE</code>, then a task that refers to this template cannot be created.</p>
 */
@property (nonatomic, assign) AWSConnectTaskTemplateStatus status;

/**
 <p>A unique identifier for the task template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable taskTemplateId;

@end

/**
 
 */
@interface AWSConnectUpdateTaskTemplateResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) for the task template resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>Constraints that are applicable to the fields listed.</p>
 */
@property (nonatomic, strong) AWSConnectTaskTemplateConstraints * _Nullable constraints;

/**
 <p>The identifier of the flow that runs by default when a task is created by referencing this template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contactFlowId;

/**
 <p>The timestamp when the task template was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdTime;

/**
 <p>The default values for fields when a task is created by referencing this template.</p>
 */
@property (nonatomic, strong) AWSConnectTaskTemplateDefaults * _Nullable defaults;

/**
 <p>The description of the task template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>Fields that are part of the template.</p>
 */
@property (nonatomic, strong) NSArray<AWSConnectTaskTemplateField *> * _Nullable fields;

/**
 <p>The identifier of the task template resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The timestamp when the task template was last modified.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedTime;

/**
 <p>The name of the task template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>Marks a template as <code>ACTIVE</code> or <code>INACTIVE</code> for a task to refer to it. Tasks can only be created from <code>ACTIVE</code> templates. If a template is marked as <code>INACTIVE</code>, then a task that refers to this template cannot be created.</p>
 */
@property (nonatomic, assign) AWSConnectTaskTemplateStatus status;

@end

/**
 
 */
@interface AWSConnectUpdateTrafficDistributionRequest : AWSRequest


/**
 <p>The identifier of the traffic distribution group. This can be the ID or the ARN if the API is being called in the Region where the traffic distribution group was created. The ARN must be provided if the call is from the replicated Region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The distribution of traffic between the instance and its replica(s).</p>
 */
@property (nonatomic, strong) AWSConnectTelephonyConfig * _Nullable telephonyConfig;

@end

/**
 
 */
@interface AWSConnectUpdateTrafficDistributionResponse : AWSModel


@end

/**
 
 */
@interface AWSConnectUpdateUserHierarchyGroupNameRequest : AWSRequest


/**
 <p>The identifier of the hierarchy group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable hierarchyGroupId;

/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The name of the hierarchy group. Must not be more than 100 characters.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSConnectUpdateUserHierarchyRequest : AWSRequest


/**
 <p>The identifier of the hierarchy group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable hierarchyGroupId;

/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The identifier of the user account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userId;

@end

/**
 
 */
@interface AWSConnectUpdateUserHierarchyStructureRequest : AWSRequest


/**
 <p>The hierarchy levels to update.</p>
 */
@property (nonatomic, strong) AWSConnectHierarchyStructureUpdate * _Nullable hierarchyStructure;

/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

@end

/**
 
 */
@interface AWSConnectUpdateUserIdentityInfoRequest : AWSRequest


/**
 <p>The identity information for the user.</p>
 */
@property (nonatomic, strong) AWSConnectUserIdentityInfo * _Nullable identityInfo;

/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The identifier of the user account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userId;

@end

/**
 
 */
@interface AWSConnectUpdateUserPhoneConfigRequest : AWSRequest


/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>Information about phone configuration settings for the user.</p>
 */
@property (nonatomic, strong) AWSConnectUserPhoneConfig * _Nullable phoneConfig;

/**
 <p>The identifier of the user account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userId;

@end

/**
 
 */
@interface AWSConnectUpdateUserRoutingProfileRequest : AWSRequest


/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The identifier of the routing profile for the user.</p>
 */
@property (nonatomic, strong) NSString * _Nullable routingProfileId;

/**
 <p>The identifier of the user account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userId;

@end

/**
 
 */
@interface AWSConnectUpdateUserSecurityProfilesRequest : AWSRequest


/**
 <p>The identifier of the Amazon Connect instance. You can <a href="https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The identifiers of the security profiles for the user.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable securityProfileIds;

/**
 <p>The identifier of the user account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userId;

@end

/**
 <p>The URL reference.</p>
 */
@interface AWSConnectUrlReference : AWSModel


/**
 <p>Identifier of the URL reference.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>A valid URL.</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 <p>Contains the use case.</p>
 */
@interface AWSConnectUseCase : AWSModel


/**
 <p>The Amazon Resource Name (ARN) for the use case.</p>
 */
@property (nonatomic, strong) NSString * _Nullable useCaseArn;

/**
 <p>The identifier for the use case.</p>
 */
@property (nonatomic, strong) NSString * _Nullable useCaseId;

/**
 <p>The type of use case to associate to the integration association. Each integration association can have only one of each use case type.</p>
 */
@property (nonatomic, assign) AWSConnectUseCaseType useCaseType;

@end

/**
 <p>Contains information about a user account for an Amazon Connect instance.</p>
 */
@interface AWSConnectUser : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the user account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The identifier of the user account in the directory used for identity management.</p>
 */
@property (nonatomic, strong) NSString * _Nullable directoryUserId;

/**
 <p>The identifier of the hierarchy group for the user.</p>
 */
@property (nonatomic, strong) NSString * _Nullable hierarchyGroupId;

/**
 <p>The identifier of the user account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>Information about the user identity.</p>
 */
@property (nonatomic, strong) AWSConnectUserIdentityInfo * _Nullable identityInfo;

/**
 <p>Information about the phone configuration for the user.</p>
 */
@property (nonatomic, strong) AWSConnectUserPhoneConfig * _Nullable phoneConfig;

/**
 <p>The identifier of the routing profile for the user.</p>
 */
@property (nonatomic, strong) NSString * _Nullable routingProfileId;

/**
 <p>The identifiers of the security profiles for the user.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable securityProfileIds;

/**
 <p>The tags.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

/**
 <p>The user name assigned to the user account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable username;

@end

/**
 <p>Data for a user.</p>
 */
@interface AWSConnectUserData : AWSModel


/**
 <p> A map of active slots by channel. The key is a channel name. The value is an integer: the number of active slots. </p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSNumber *> * _Nullable activeSlotsByChannel;

/**
 <p>A map of available slots by channel. The key is a channel name. The value is an integer: the available number of slots. </p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSNumber *> * _Nullable availableSlotsByChannel;

/**
 <p>A list of contact reference information.</p>
 */
@property (nonatomic, strong) NSArray<AWSConnectAgentContactReference *> * _Nullable contacts;

/**
 <p>Contains information about the levels of a hierarchy group assigned to a user.</p>
 */
@property (nonatomic, strong) AWSConnectHierarchyPathReference * _Nullable hierarchyPath;

/**
 <p>A map of maximum slots by channel. The key is a channel name. The value is an integer: the maximum number of slots. This is calculated from <a href="https://docs.aws.amazon.com/connect/latest/APIReference/API_MediaConcurrency.html">MediaConcurrency</a> of the <code>RoutingProfile</code> assigned to the agent. </p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSNumber *> * _Nullable maxSlotsByChannel;

/**
 <p>The Next status of the agent.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextStatus;

/**
 <p>Information about the routing profile that is assigned to the user.</p>
 */
@property (nonatomic, strong) AWSConnectRoutingProfileReference * _Nullable routingProfile;

/**
 <p>The status of the agent that they manually set in their Contact Control Panel (CCP), or that the supervisor manually changes in the real-time metrics report.</p>
 */
@property (nonatomic, strong) AWSConnectAgentStatusReference * _Nullable status;

/**
 <p>Information about the user for the data that is returned. It contains the <code>resourceId</code> and ARN of the user. </p>
 */
@property (nonatomic, strong) AWSConnectUserReference * _Nullable user;

@end

/**
 <p>A filter for the user data.</p>
 */
@interface AWSConnectUserDataFilters : AWSModel


/**
 <p>A list of up to 100 agent IDs or ARNs.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable agents;

/**
 <p>A filter for the user data based on the contact information that is associated to the user. It contains a list of contact states. </p>
 */
@property (nonatomic, strong) AWSConnectContactFilter * _Nullable contactFilter;

/**
 <p>A list of up to 100 queues or ARNs.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable queues;

/**
 <p>A list of up to 100 routing profile IDs or ARNs.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable routingProfiles;

/**
 <p>A UserHierarchyGroup ID or ARN.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable userHierarchyGroups;

@end

/**
 <p>Contains information about the identity of a user.</p>
 */
@interface AWSConnectUserIdentityInfo : AWSModel


/**
 <p>The email address. If you are using SAML for identity management and include this parameter, an error is returned.</p>
 */
@property (nonatomic, strong) NSString * _Nullable email;

/**
 <p>The first name. This is required if you are using Amazon Connect or SAML for identity management.</p>
 */
@property (nonatomic, strong) NSString * _Nullable firstName;

/**
 <p>The last name. This is required if you are using Amazon Connect or SAML for identity management.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lastName;

/**
 <p>The user's mobile number.</p>
 */
@property (nonatomic, strong) NSString * _Nullable mobile;

/**
 <p>The user's secondary email address. If you provide a secondary email, the user receives email notifications - other than password reset notifications - to this email address instead of to their primary email address.</p><p>Pattern: <code>(?=^.{0,265}$)[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,63}</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable secondaryEmail;

@end

/**
 <p>The user's first name and last name.</p>
 */
@interface AWSConnectUserIdentityInfoLite : AWSModel


/**
 <p>The user's first name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable firstName;

/**
 <p>The user's last name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lastName;

@end

/**
 <p>Contains information about the phone configuration settings for a user.</p>
 Required parameters: [PhoneType]
 */
@interface AWSConnectUserPhoneConfig : AWSModel


/**
 <p>The After Call Work (ACW) timeout setting, in seconds.</p><note><p>When returned by a <code>SearchUsers</code> call, <code>AfterContactWorkTimeLimit</code> is returned in milliseconds. </p></note>
 */
@property (nonatomic, strong) NSNumber * _Nullable afterContactWorkTimeLimit;

/**
 <p>The Auto accept setting.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable autoAccept;

/**
 <p>The phone number for the user's desk phone.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deskPhoneNumber;

/**
 <p>The phone type.</p>
 */
@property (nonatomic, assign) AWSConnectPhoneType phoneType;

@end

/**
 <p>Contains information about the quick connect configuration settings for a user. The contact flow must be of type Transfer to Agent.</p>
 Required parameters: [UserId, ContactFlowId]
 */
@interface AWSConnectUserQuickConnectConfig : AWSModel


/**
 <p>The identifier of the flow.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contactFlowId;

/**
 <p>The identifier of the user.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userId;

@end

/**
 <p>Information about the user.</p>
 */
@interface AWSConnectUserReference : AWSModel


/**
 <p>The Amazon Resource Name (ARN) for the user.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The unique identifier for the user.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

@end

/**
 <p>The search criteria to be used to return users.</p><note><p>The <code>name</code> and <code>description</code> fields support "contains" queries with a minimum of 2 characters and a maximum of 25 characters. Any queries with character lengths outside of this range will throw invalid results. </p></note>
 */
@interface AWSConnectUserSearchCriteria : AWSModel


/**
 <p>A list of conditions which would be applied together with an <code>AND</code> condition. </p>
 */
@property (nonatomic, strong) NSArray<AWSConnectUserSearchCriteria *> * _Nullable andConditions;

/**
 <p>A leaf node condition which can be used to specify a hierarchy group condition.</p>
 */
@property (nonatomic, strong) AWSConnectHierarchyGroupCondition * _Nullable hierarchyGroupCondition;

/**
 <p>A list of conditions which would be applied together with an <code>OR</code> condition.</p>
 */
@property (nonatomic, strong) NSArray<AWSConnectUserSearchCriteria *> * _Nullable orConditions;

/**
 <p>A leaf node condition which can be used to specify a string condition.</p>
 */
@property (nonatomic, strong) AWSConnectStringCondition * _Nullable stringCondition;

@end

/**
 <p>Filters to be applied to search results.</p>
 */
@interface AWSConnectUserSearchFilter : AWSModel


/**
 <p>An object that can be used to specify Tag conditions inside the <code>SearchFilter</code>. This accepts an <code>OR</code> of <code>AND</code> (List of List) input where: </p><ul><li><p>Top level list specifies conditions that need to be applied with <code>OR</code> operator</p></li><li><p>Inner list specifies conditions that need to be applied with <code>AND</code> operator.</p></li></ul>
 */
@property (nonatomic, strong) AWSConnectControlPlaneTagFilter * _Nullable tagFilter;

@end

/**
 <p>Information about the returned users.</p>
 */
@interface AWSConnectUserSearchSummary : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the user.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The directory identifier of the user.</p>
 */
@property (nonatomic, strong) NSString * _Nullable directoryUserId;

/**
 <p>The identifier of the user's hierarchy group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable hierarchyGroupId;

/**
 <p>The identifier of the user's summary.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The user's first name and last name.</p>
 */
@property (nonatomic, strong) AWSConnectUserIdentityInfoLite * _Nullable identityInfo;

/**
 <p>Contains information about the phone configuration settings for a user.</p>
 */
@property (nonatomic, strong) AWSConnectUserPhoneConfig * _Nullable phoneConfig;

/**
 <p>The identifier of the user's routing profile.</p>
 */
@property (nonatomic, strong) NSString * _Nullable routingProfileId;

/**
 <p>The identifiers of the user's security profiles.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable securityProfileIds;

/**
 <p>The tags used to organize, track, or control access for this resource. For example, { "tags": {"key1":"value1", "key2":"value2"} }.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

/**
 <p>The name of the user.</p>
 */
@property (nonatomic, strong) NSString * _Nullable username;

@end

/**
 <p>Contains summary information about a user.</p>
 */
@interface AWSConnectUserSummary : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the user account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The identifier of the user account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The Amazon Connect user name of the user account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable username;

@end

/**
 <p>Contains information about a custom vocabulary.</p>
 Required parameters: [Name, Id, Arn, LanguageCode, State, LastModifiedTime]
 */
@interface AWSConnectVocabulary : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the custom vocabulary.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The content of the custom vocabulary in plain-text format with a table of values. Each row in the table represents a word or a phrase, described with <code>Phrase</code>, <code>IPA</code>, <code>SoundsLike</code>, and <code>DisplayAs</code> fields. Separate the fields with TAB characters. For more information, see <a href="https://docs.aws.amazon.com/transcribe/latest/dg/custom-vocabulary.html#create-vocabulary-table">Create a custom vocabulary using a table</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable content;

/**
 <p>The reason why the custom vocabulary was not created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable failureReason;

/**
 <p>The identifier of the custom vocabulary.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The language code of the vocabulary entries. For a list of languages and their corresponding language codes, see <a href="https://docs.aws.amazon.com/transcribe/latest/dg/transcribe-whatis.html">What is Amazon Transcribe?</a></p>
 */
@property (nonatomic, assign) AWSConnectVocabularyLanguageCode languageCode;

/**
 <p>The timestamp when the custom vocabulary was last modified.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedTime;

/**
 <p>A unique name of the custom vocabulary.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The current state of the custom vocabulary.</p>
 */
@property (nonatomic, assign) AWSConnectVocabularyState state;

/**
 <p>The tags used to organize, track, or control access for this resource. For example, { "tags": {"key1":"value1", "key2":"value2"} }.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 <p>Contains summary information about the custom vocabulary.</p>
 Required parameters: [Name, Id, Arn, LanguageCode, State, LastModifiedTime]
 */
@interface AWSConnectVocabularySummary : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the custom vocabulary.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The reason why the custom vocabulary was not created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable failureReason;

/**
 <p>The identifier of the custom vocabulary.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The language code of the vocabulary entries. For a list of languages and their corresponding language codes, see <a href="https://docs.aws.amazon.com/transcribe/latest/dg/transcribe-whatis.html">What is Amazon Transcribe?</a></p>
 */
@property (nonatomic, assign) AWSConnectVocabularyLanguageCode languageCode;

/**
 <p>The timestamp when the custom vocabulary was last modified.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedTime;

/**
 <p>A unique name of the custom vocabulary.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The current state of the custom vocabulary.</p>
 */
@property (nonatomic, assign) AWSConnectVocabularyState state;

@end

/**
 <p>Contains information about the recording configuration settings.</p>
 */
@interface AWSConnectVoiceRecordingConfiguration : AWSModel


/**
 <p>Identifies which track is being recorded.</p>
 */
@property (nonatomic, assign) AWSConnectVoiceRecordingTrack voiceRecordingTrack;

@end

/**
 <p>Information about Amazon Connect Wisdom.</p>
 */
@interface AWSConnectWisdomInfo : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the Wisdom session.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sessionArn;

@end

NS_ASSUME_NONNULL_END
