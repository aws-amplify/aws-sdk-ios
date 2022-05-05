//
// Copyright 2010-2022 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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
    AWSConnectErrorResourceConflict,
    AWSConnectErrorResourceInUse,
    AWSConnectErrorResourceNotFound,
    AWSConnectErrorServiceQuotaExceeded,
    AWSConnectErrorThrottling,
    AWSConnectErrorUserNotFound,
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

typedef NS_ENUM(NSInteger, AWSConnectGrouping) {
    AWSConnectGroupingUnknown,
    AWSConnectGroupingQueue,
    AWSConnectGroupingChannel,
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
};

typedef NS_ENUM(NSInteger, AWSConnectIntegrationType) {
    AWSConnectIntegrationTypeUnknown,
    AWSConnectIntegrationTypeEvent,
    AWSConnectIntegrationTypeVoiceId,
    AWSConnectIntegrationTypePinpointApp,
    AWSConnectIntegrationTypeWisdomAssistant,
    AWSConnectIntegrationTypeWisdomKnowledgeBase,
};

typedef NS_ENUM(NSInteger, AWSConnectLexVersion) {
    AWSConnectLexVersionUnknown,
    AWSConnectLexVersionV1,
    AWSConnectLexVersionV2,
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

@class AWSConnectAgentInfo;
@class AWSConnectAgentStatus;
@class AWSConnectAgentStatusSummary;
@class AWSConnectAnswerMachineDetectionConfig;
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
@class AWSConnectChatStreamingConfiguration;
@class AWSConnectClaimPhoneNumberRequest;
@class AWSConnectClaimPhoneNumberResponse;
@class AWSConnectClaimedPhoneNumberSummary;
@class AWSConnectContact;
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
@class AWSConnectCreateHoursOfOperationRequest;
@class AWSConnectCreateHoursOfOperationResponse;
@class AWSConnectCreateInstanceRequest;
@class AWSConnectCreateInstanceResponse;
@class AWSConnectCreateIntegrationAssociationRequest;
@class AWSConnectCreateIntegrationAssociationResponse;
@class AWSConnectCreateQueueRequest;
@class AWSConnectCreateQueueResponse;
@class AWSConnectCreateQuickConnectRequest;
@class AWSConnectCreateQuickConnectResponse;
@class AWSConnectCreateRoutingProfileRequest;
@class AWSConnectCreateRoutingProfileResponse;
@class AWSConnectCreateSecurityProfileRequest;
@class AWSConnectCreateSecurityProfileResponse;
@class AWSConnectCreateUseCaseRequest;
@class AWSConnectCreateUseCaseResponse;
@class AWSConnectCreateUserHierarchyGroupRequest;
@class AWSConnectCreateUserHierarchyGroupResponse;
@class AWSConnectCreateUserRequest;
@class AWSConnectCreateUserResponse;
@class AWSConnectCreateVocabularyRequest;
@class AWSConnectCreateVocabularyResponse;
@class AWSConnectCredentials;
@class AWSConnectCurrentMetric;
@class AWSConnectCurrentMetricData;
@class AWSConnectCurrentMetricResult;
@class AWSConnectDefaultVocabulary;
@class AWSConnectDeleteContactFlowModuleRequest;
@class AWSConnectDeleteContactFlowModuleResponse;
@class AWSConnectDeleteContactFlowRequest;
@class AWSConnectDeleteHoursOfOperationRequest;
@class AWSConnectDeleteInstanceRequest;
@class AWSConnectDeleteIntegrationAssociationRequest;
@class AWSConnectDeleteQuickConnectRequest;
@class AWSConnectDeleteSecurityProfileRequest;
@class AWSConnectDeleteUseCaseRequest;
@class AWSConnectDeleteUserHierarchyGroupRequest;
@class AWSConnectDeleteUserRequest;
@class AWSConnectDeleteVocabularyRequest;
@class AWSConnectDeleteVocabularyResponse;
@class AWSConnectDescribeAgentStatusRequest;
@class AWSConnectDescribeAgentStatusResponse;
@class AWSConnectDescribeContactFlowModuleRequest;
@class AWSConnectDescribeContactFlowModuleResponse;
@class AWSConnectDescribeContactFlowRequest;
@class AWSConnectDescribeContactFlowResponse;
@class AWSConnectDescribeContactRequest;
@class AWSConnectDescribeContactResponse;
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
@class AWSConnectDescribeQueueRequest;
@class AWSConnectDescribeQueueResponse;
@class AWSConnectDescribeQuickConnectRequest;
@class AWSConnectDescribeQuickConnectResponse;
@class AWSConnectDescribeRoutingProfileRequest;
@class AWSConnectDescribeRoutingProfileResponse;
@class AWSConnectDescribeSecurityProfileRequest;
@class AWSConnectDescribeSecurityProfileResponse;
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
@class AWSConnectEncryptionConfig;
@class AWSConnectFilters;
@class AWSConnectGetContactAttributesRequest;
@class AWSConnectGetContactAttributesResponse;
@class AWSConnectGetCurrentMetricDataRequest;
@class AWSConnectGetCurrentMetricDataResponse;
@class AWSConnectGetFederationTokenRequest;
@class AWSConnectGetFederationTokenResponse;
@class AWSConnectGetMetricDataRequest;
@class AWSConnectGetMetricDataResponse;
@class AWSConnectHierarchyGroup;
@class AWSConnectHierarchyGroupCondition;
@class AWSConnectHierarchyGroupSummary;
@class AWSConnectHierarchyLevel;
@class AWSConnectHierarchyLevelUpdate;
@class AWSConnectHierarchyPath;
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
@class AWSConnectListContactFlowModulesRequest;
@class AWSConnectListContactFlowModulesResponse;
@class AWSConnectListContactFlowsRequest;
@class AWSConnectListContactFlowsResponse;
@class AWSConnectListContactReferencesRequest;
@class AWSConnectListContactReferencesResponse;
@class AWSConnectListDefaultVocabulariesRequest;
@class AWSConnectListDefaultVocabulariesResponse;
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
@class AWSConnectListSecurityKeysRequest;
@class AWSConnectListSecurityKeysResponse;
@class AWSConnectListSecurityProfilePermissionsRequest;
@class AWSConnectListSecurityProfilePermissionsResponse;
@class AWSConnectListSecurityProfilesRequest;
@class AWSConnectListSecurityProfilesResponse;
@class AWSConnectListTagsForResourceRequest;
@class AWSConnectListTagsForResourceResponse;
@class AWSConnectListUseCasesRequest;
@class AWSConnectListUseCasesResponse;
@class AWSConnectListUserHierarchyGroupsRequest;
@class AWSConnectListUserHierarchyGroupsResponse;
@class AWSConnectListUsersRequest;
@class AWSConnectListUsersResponse;
@class AWSConnectMediaConcurrency;
@class AWSConnectOutboundCallerConfig;
@class AWSConnectParticipantDetails;
@class AWSConnectPhoneNumberQuickConnectConfig;
@class AWSConnectPhoneNumberStatus;
@class AWSConnectPhoneNumberSummary;
@class AWSConnectProblemDetail;
@class AWSConnectPromptSummary;
@class AWSConnectPutUserStatusRequest;
@class AWSConnectPutUserStatusResponse;
@class AWSConnectQueue;
@class AWSConnectQueueInfo;
@class AWSConnectQueueQuickConnectConfig;
@class AWSConnectQueueReference;
@class AWSConnectQueueSummary;
@class AWSConnectQuickConnect;
@class AWSConnectQuickConnectConfig;
@class AWSConnectQuickConnectSummary;
@class AWSConnectReference;
@class AWSConnectReferenceSummary;
@class AWSConnectReleasePhoneNumberRequest;
@class AWSConnectResumeContactRecordingRequest;
@class AWSConnectResumeContactRecordingResponse;
@class AWSConnectRoutingProfile;
@class AWSConnectRoutingProfileQueueConfig;
@class AWSConnectRoutingProfileQueueConfigSummary;
@class AWSConnectRoutingProfileQueueReference;
@class AWSConnectRoutingProfileSummary;
@class AWSConnectS3Config;
@class AWSConnectSearchAvailablePhoneNumbersRequest;
@class AWSConnectSearchAvailablePhoneNumbersResponse;
@class AWSConnectSearchUsersRequest;
@class AWSConnectSearchUsersResponse;
@class AWSConnectSearchVocabulariesRequest;
@class AWSConnectSearchVocabulariesResponse;
@class AWSConnectSecurityKey;
@class AWSConnectSecurityProfile;
@class AWSConnectSecurityProfileSummary;
@class AWSConnectStartChatContactRequest;
@class AWSConnectStartChatContactResponse;
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
@class AWSConnectSuspendContactRecordingRequest;
@class AWSConnectSuspendContactRecordingResponse;
@class AWSConnectTagCondition;
@class AWSConnectTagResourceRequest;
@class AWSConnectThreshold;
@class AWSConnectUntagResourceRequest;
@class AWSConnectUpdateAgentStatusRequest;
@class AWSConnectUpdateContactAttributesRequest;
@class AWSConnectUpdateContactAttributesResponse;
@class AWSConnectUpdateContactFlowContentRequest;
@class AWSConnectUpdateContactFlowMetadataRequest;
@class AWSConnectUpdateContactFlowModuleContentRequest;
@class AWSConnectUpdateContactFlowModuleContentResponse;
@class AWSConnectUpdateContactFlowModuleMetadataRequest;
@class AWSConnectUpdateContactFlowModuleMetadataResponse;
@class AWSConnectUpdateContactFlowNameRequest;
@class AWSConnectUpdateContactRequest;
@class AWSConnectUpdateContactResponse;
@class AWSConnectUpdateContactScheduleRequest;
@class AWSConnectUpdateContactScheduleResponse;
@class AWSConnectUpdateHoursOfOperationRequest;
@class AWSConnectUpdateInstanceAttributeRequest;
@class AWSConnectUpdateInstanceStorageConfigRequest;
@class AWSConnectUpdatePhoneNumberRequest;
@class AWSConnectUpdatePhoneNumberResponse;
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
@class AWSConnectUpdateSecurityProfileRequest;
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
@class AWSConnectUserIdentityInfo;
@class AWSConnectUserIdentityInfoLite;
@class AWSConnectUserPhoneConfig;
@class AWSConnectUserQuickConnectConfig;
@class AWSConnectUserSearchCriteria;
@class AWSConnectUserSearchFilter;
@class AWSConnectUserSearchSummary;
@class AWSConnectUserSummary;
@class AWSConnectVocabulary;
@class AWSConnectVocabularySummary;
@class AWSConnectVoiceRecordingConfiguration;

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
 <p>The tags used to organize, track, or control access for this resource.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

/**
 <p>The type of agent status.</p>
 */
@property (nonatomic, assign) AWSConnectAgentStatusType types;

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
 
 */
@interface AWSConnectAssociateApprovedOriginRequest : AWSRequest


/**
 <p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>
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
 <p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>
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
 <p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>
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
 <p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>
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
 <p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

@end

/**
 
 */
@interface AWSConnectAssociateLexBotRequest : AWSRequest


/**
 <p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>
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
 <p>The identifier of the contact flow.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contactFlowId;

/**
 <p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>
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
 <p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>
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
 <p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>
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
 <p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>
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
 <p>Information about the attachment reference if the <code>referenceType</code> is <code>ATTACHMENT</code>. Otherwise, null.</p>
 */
@interface AWSConnectAttachmentReference : AWSModel


/**
 <p>Identifier of the attachment reference.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>Status of an attachment reference type.</p>
 */
@property (nonatomic, assign) AWSConnectReferenceStatus status;

/**
 <p>Contains the location path of the attachment reference.</p>
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
 <p>The content of the chat message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable content;

/**
 <p>The type of the content. Supported types are <code>text/plain</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contentType;

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
 <p>A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.</p>
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
 <p>The tags used to organize, track, or control access for this resource.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

/**
 <p>The Amazon Resource Name (ARN) for Amazon Connect instances that phone numbers are claimed to.</p>
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
 <p>Information about a phone number that has been claimed to your Amazon Connect instance.</p>
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
 <p>The status of the phone number.</p>
 */
@property (nonatomic, strong) AWSConnectPhoneNumberStatus * _Nullable phoneNumberStatus;

/**
 <p>The type of phone number.</p>
 */
@property (nonatomic, assign) AWSConnectPhoneNumberType phoneNumberType;

/**
 <p>The tags used to organize, track, or control access for this resource.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

/**
 <p>The Amazon Resource Name (ARN) for Amazon Connect instances that phone numbers are claimed to.</p>
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
 <p>The timestamp, in Unix epoch time format, at which to start running the inbound flow. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable scheduledTimestamp;

@end

/**
 <p>Contains information about a contact flow.</p>
 */
@interface AWSConnectContactFlow : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the contact flow.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The content of the contact flow.</p>
 */
@property (nonatomic, strong) NSString * _Nullable content;

/**
 <p>The description of the contact flow.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The identifier of the contact flow.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The name of the contact flow.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The type of contact flow.</p>
 */
@property (nonatomic, assign) AWSConnectContactFlowState state;

/**
 <p>One or more tags.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

/**
 <p>The type of the contact flow. For descriptions of the available types, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/create-contact-flow.html#contact-flow-types">Choose a Contact Flow Type</a> in the <i>Amazon Connect Administrator Guide</i>.</p>
 */
@property (nonatomic, assign) AWSConnectContactFlowType types;

@end

/**
 <p>Contains information about a contact flow module.</p>
 */
@interface AWSConnectContactFlowModule : AWSModel


/**
 <p>The Amazon Resource Name (ARN).</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The content of the contact flow module.</p>
 */
@property (nonatomic, strong) NSString * _Nullable content;

/**
 <p>The description of the contact flow module.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The identifier of the contact flow module.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The name of the contact flow module.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The type of contact flow module.</p>
 */
@property (nonatomic, assign) AWSConnectContactFlowModuleState state;

/**
 <p>The status of the contact flow module.</p>
 */
@property (nonatomic, assign) AWSConnectContactFlowModuleStatus status;

/**
 <p>The tags used to organize, track, or control access for this resource.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 <p>Contains summary information about a contact flow.</p>
 */
@interface AWSConnectContactFlowModuleSummary : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the contact flow module.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The identifier of the contact flow module.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The name of the contact flow module.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The type of contact flow module.</p>
 */
@property (nonatomic, assign) AWSConnectContactFlowModuleState state;

@end

/**
 <p>Contains summary information about a contact flow.</p><p>You can also create and update contact flows using the <a href="https://docs.aws.amazon.com/connect/latest/adminguide/flow-language.html">Amazon Connect Flow language</a>.</p>
 */
@interface AWSConnectContactFlowSummary : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the contact flow.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The type of contact flow.</p>
 */
@property (nonatomic, assign) AWSConnectContactFlowState contactFlowState;

/**
 <p>The type of contact flow.</p>
 */
@property (nonatomic, assign) AWSConnectContactFlowType contactFlowType;

/**
 <p>The identifier of the contact flow.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The name of the contact flow.</p>
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
 <p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>
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
 <p>The tags used to organize, track, or control access for this resource.</p>
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
 <p>A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>The content of the contact flow module.</p>
 */
@property (nonatomic, strong) NSString * _Nullable content;

/**
 <p>The description of the contact flow module. </p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The name of the contact flow module.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The tags used to organize, track, or control access for this resource.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSConnectCreateContactFlowModuleResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the contact flow module.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The identifier of the contact flow module.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

@end

/**
 
 */
@interface AWSConnectCreateContactFlowRequest : AWSRequest


/**
 <p>The content of the contact flow. </p>
 */
@property (nonatomic, strong) NSString * _Nullable content;

/**
 <p>The description of the contact flow. </p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The identifier of the Amazon Connect instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The name of the contact flow.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>One or more tags.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

/**
 <p>The type of the contact flow. For descriptions of the available types, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/create-contact-flow.html#contact-flow-types">Choose a Contact Flow Type</a> in the <i>Amazon Connect Administrator Guide</i>.</p>
 */
@property (nonatomic, assign) AWSConnectContactFlowType types;

@end

/**
 
 */
@interface AWSConnectCreateContactFlowResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the contact flow.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contactFlowArn;

/**
 <p>The identifier of the contact flow.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contactFlowId;

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
 <p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The name of the hours of operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The tags used to organize, track, or control access for this resource.</p>
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
 <p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The Amazon Resource Name (ARN) of the integration.</p>
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
 <p>The tags used to organize, track, or control access for this resource.</p>
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
 <p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>
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
 <p>The tags used to organize, track, or control access for this resource.</p>
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
 <p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>
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
 <p>The tags used to organize, track, or control access for this resource.</p>
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
 <p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>
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
 <p>The inbound queues associated with the routing profile. If no queue is added, the agent can make only outbound calls.</p>
 */
@property (nonatomic, strong) NSArray<AWSConnectRoutingProfileQueueConfig *> * _Nullable queueConfigs;

/**
 <p>One or more tags.</p>
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
@interface AWSConnectCreateSecurityProfileRequest : AWSRequest


/**
 <p>The description of the security profile.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>Permissions assigned to the security profile.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable permissions;

/**
 <p>The name of the security profile.</p>
 */
@property (nonatomic, strong) NSString * _Nullable securityProfileName;

/**
 <p>The tags used to organize, track, or control access for this resource.</p>
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
@interface AWSConnectCreateUseCaseRequest : AWSRequest


/**
 <p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The identifier for the integration association.</p>
 */
@property (nonatomic, strong) NSString * _Nullable integrationAssociationId;

/**
 <p>The tags used to organize, track, or control access for this resource.</p>
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
 <p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>
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
 <p>The tags used to organize, track, or control access for this resource.</p>
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
 <p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>
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
 <p>One or more tags.</p>
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
 <p>A unique, case-sensitive identifier that you provide to ensure the idempotency of the request. If a create request is received more than once with same client token, subsequent requests return the previous response without creating a vocabulary again.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>The content of the custom vocabulary in plain-text format with a table of values. Each row in the table represents a word or a phrase, described with <code>Phrase</code>, <code>IPA</code>, <code>SoundsLike</code>, and <code>DisplayAs</code> fields. Separate the fields with TAB characters. The size limit is 50KB. For more information, see <a href="https://docs.aws.amazon.com/transcribe/latest/dg/custom-vocabulary.html#create-vocabulary-table">Create a custom vocabulary using a table</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable content;

/**
 <p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The language code of the vocabulary entries. For a list of languages and their corresponding language codes, see <a href="https://docs.aws.amazon.com/transcribe/latest/dg/transcribe-whatis.html">What is Amazon Transcribe?</a></p>
 */
@property (nonatomic, assign) AWSConnectVocabularyLanguageCode languageCode;

/**
 <p>The tags used to organize, track, or control access for this resource.</p>
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
 <p>Contains information about a default vocabulary.</p>
 Required parameters: [InstanceId, LanguageCode, VocabularyId, VocabularyName]
 */
@interface AWSConnectDefaultVocabulary : AWSModel


/**
 <p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>
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
@interface AWSConnectDeleteContactFlowModuleRequest : AWSRequest


/**
 <p>The identifier of the contact flow module.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contactFlowModuleId;

/**
 <p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>
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
 <p>The identifier of the contact flow.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contactFlowId;

/**
 <p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>
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
 <p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

@end

/**
 
 */
@interface AWSConnectDeleteInstanceRequest : AWSRequest


/**
 <p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

@end

/**
 
 */
@interface AWSConnectDeleteIntegrationAssociationRequest : AWSRequest


/**
 <p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The identifier for the integration association.</p>
 */
@property (nonatomic, strong) NSString * _Nullable integrationAssociationId;

@end

/**
 
 */
@interface AWSConnectDeleteQuickConnectRequest : AWSRequest


/**
 <p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The identifier for the quick connect.</p>
 */
@property (nonatomic, strong) NSString * _Nullable quickConnectId;

@end

/**
 
 */
@interface AWSConnectDeleteSecurityProfileRequest : AWSRequest


/**
 <p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The identifier for the security profle.</p>
 */
@property (nonatomic, strong) NSString * _Nullable securityProfileId;

@end

/**
 
 */
@interface AWSConnectDeleteUseCaseRequest : AWSRequest


/**
 <p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>
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
 <p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

@end

/**
 
 */
@interface AWSConnectDeleteUserRequest : AWSRequest


/**
 <p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>
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
 <p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>
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
 <p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>
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
@interface AWSConnectDescribeContactFlowModuleRequest : AWSRequest


/**
 <p>The identifier of the contact flow module.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contactFlowModuleId;

/**
 <p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

@end

/**
 
 */
@interface AWSConnectDescribeContactFlowModuleResponse : AWSModel


/**
 <p>Information about the contact flow module.</p>
 */
@property (nonatomic, strong) AWSConnectContactFlowModule * _Nullable contactFlowModule;

@end

/**
 
 */
@interface AWSConnectDescribeContactFlowRequest : AWSRequest


/**
 <p>The identifier of the contact flow.</p>
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
 <p>Information about the contact flow.</p>
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
 <p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>
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
@interface AWSConnectDescribeHoursOfOperationRequest : AWSRequest


/**
 <p>The identifier for the hours of operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable hoursOfOperationId;

/**
 <p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>
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
 <p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>
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
 <p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>
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
 <p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>
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
 <p>Information about a phone number that's been claimed to your Amazon Connect instance.</p>
 */
@property (nonatomic, strong) AWSConnectClaimedPhoneNumberSummary * _Nullable claimedPhoneNumberSummary;

@end

/**
 
 */
@interface AWSConnectDescribeQueueRequest : AWSRequest


/**
 <p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>
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
 <p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>
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
 <p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>
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
@interface AWSConnectDescribeSecurityProfileRequest : AWSRequest


/**
 <p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>
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
@interface AWSConnectDescribeUserHierarchyGroupRequest : AWSRequest


/**
 <p>The identifier of the hierarchy group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable hierarchyGroupId;

/**
 <p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>
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
 <p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>
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
 <p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>
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

@end

/**
 
 */
@interface AWSConnectDisassociateApprovedOriginRequest : AWSRequest


/**
 <p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>
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
 <p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>
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
 <p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>
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
 <p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance..</p>
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
 <p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The Region in which the Amazon Lex bot has been created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lexRegion;

@end

/**
 
 */
@interface AWSConnectDisassociatePhoneNumberContactFlowRequest : AWSRequest


/**
 <p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>
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
 <p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>
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
 <p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>
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
 <p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

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
 <p>The full ARN of the encryption key. </p><note><p>Be sure to provide the full ARN of the encryption key, not just the ID.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable keyId;

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
 <p>The queues, up to 100, or channels, to use to filter the metrics returned. Metric data is retrieved only for the resources associated with the queues or channels included in the filter. You can include both queue IDs and queue ARNs in the same request. VOICE, CHAT, and TASK channels are supported.</p>
 */
@property (nonatomic, strong) AWSConnectFilters * _Nullable filters;

/**
 <p>The grouping applied to the metrics returned. For example, when grouped by <code>QUEUE</code>, the metrics returned apply to each queue rather than aggregated for all queues. If you group by <code>CHANNEL</code>, you should include a Channels filter. VOICE, CHAT, and TASK channels are supported.</p><p>If no <code>Grouping</code> is included in the request, a summary of metrics is returned.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable groupings;

/**
 <p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>
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

@end

/**
 
 */
@interface AWSConnectGetCurrentMetricDataResponse : AWSModel


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
@interface AWSConnectGetFederationTokenRequest : AWSRequest


/**
 <p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>
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
 <p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>
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
 <p>The tags used to organize, track, or control access for this resource.</p>
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
 <p>The tags used to organize, track, or control access for this resource.</p>
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
 <p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>
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
 <p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>
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
 */
@interface AWSConnectLexBot : AWSModel


/**
 <p>The Region that the Amazon Lex bot was created in.</p>
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
 <p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>
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
 <p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>
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
 <p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>
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
 <p>The names and Regions of the Amazon Lex or Amazon Lex V2 bots associated with the specified instance.</p>
 */
@property (nonatomic, strong) NSArray<AWSConnectLexBotConfig *> * _Nullable lexBots;

/**
 <p>If there are additional results, this is the token for the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSConnectListContactFlowModulesRequest : AWSRequest


/**
 <p>The state of the contact flow module.</p>
 */
@property (nonatomic, assign) AWSConnectContactFlowModuleState contactFlowModuleState;

/**
 <p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>
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
 <p>Information about the contact flow module.</p>
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
 <p>The type of contact flow.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable contactFlowTypes;

/**
 <p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>
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
@interface AWSConnectListContactFlowsResponse : AWSModel


/**
 <p>Information about the contact flows.</p>
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
 <p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>
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
 <p>Information about the contact flows.</p>
 */
@property (nonatomic, strong) NSArray<AWSConnectReferenceSummary *> * _Nullable referenceSummaryList;

@end

/**
 
 */
@interface AWSConnectListDefaultVocabulariesRequest : AWSRequest


/**
 <p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>
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
@interface AWSConnectListHoursOfOperationsRequest : AWSRequest


/**
 <p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>
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
 <p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>
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
 <p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>
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
 <p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>
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
 <p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>
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
 <p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>
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
 <p>The names and Regions of the Amazon Lex bots associated with the specified instance.</p>
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
 <p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>
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
 <p>Information about phone numbers that have been claimed to your Amazon Connect instance.</p>
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
 <p>The Amazon Resource Name (ARN) for Amazon Connect instances that phone numbers are claimed to.</p>
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
 <p>The Amazon Resource Name (ARN) for Amazon Connect instances that phone numbers are claimed to. If <code>TargetArn</code> input is not provided, this API lists numbers claimed to all the Amazon Connect instances belonging to your account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable targetArn;

@end

/**
 
 */
@interface AWSConnectListPhoneNumbersV2Response : AWSModel


/**
 <p>Information about phone numbers that have been claimed to your Amazon Connect instances.</p>
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
 <p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>
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
 <p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>
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
 <p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>
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
 <p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>
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
 <p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>
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
@interface AWSConnectListSecurityKeysRequest : AWSRequest


/**
 <p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>
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
 <p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>
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
 <p>The permissions granted to the security profile.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable permissions;

@end

/**
 
 */
@interface AWSConnectListSecurityProfilesRequest : AWSRequest


/**
 <p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>
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
 <p>The Amazon Resource Name (ARN) of the resource.</p>
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
 <p>Provides summary information about the use cases for the specified integration association.</p>
 Required parameters: [InstanceId, IntegrationAssociationId]
 */
@interface AWSConnectListUseCasesRequest : AWSRequest


/**
 <p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>
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
 <p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>
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
 <p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>
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
 <p>The status of the phone number.</p>
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
 
 */
@interface AWSConnectPutUserStatusRequest : AWSRequest


/**
 <p>The identifier of the agent status.</p>
 */
@property (nonatomic, strong) NSString * _Nullable agentStatusId;

/**
 <p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>
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
 <p>The tags used to organize, track, or control access for this resource.</p>
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
 <p>The identifier of the agent who accepted the contact.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

@end

/**
 <p>Contains information about a queue for a quick connect. The contact flow must be of type Transfer to Queue.</p>
 Required parameters: [QueueId, ContactFlowId]
 */
@interface AWSConnectQueueQuickConnectConfig : AWSModel


/**
 <p>The identifier of the contact flow.</p>
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
 <p>The tags used to organize, track, or control access for this resource.</p>
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
 <p>A link that an agent selects to complete a given task. You can have up to 4,096 UTF-8 bytes across all references for a contact.</p>
 Required parameters: [Value, Type]
 */
@interface AWSConnectReference : AWSModel


/**
 <p>The type of the reference. Only <code>URL</code> type can be added or updated on a contact.</p>
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
 <p>Information about the attachment reference if the <code>referenceType</code> is <code>ATTACHMENT</code>. Otherwise, null.</p>
 */
@property (nonatomic, strong) AWSConnectAttachmentReference * _Nullable attachment;

/**
 <p>Information about the URL reference if the <code>referenceType</code> is <code>URL</code>. Otherwise, null.</p>
 */
@property (nonatomic, strong) AWSConnectUrlReference * _Nullable url;

@end

/**
 
 */
@interface AWSConnectReleasePhoneNumberRequest : AWSRequest


/**
 <p>A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>A unique identifier for the phone number.</p>
 */
@property (nonatomic, strong) NSString * _Nullable phoneNumberId;

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
 <p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>
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
 <p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>
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
 <p>The Amazon Resource Name (ARN) of the routing profile.</p>
 */
@property (nonatomic, strong) NSString * _Nullable routingProfileArn;

/**
 <p>The identifier of the routing profile.</p>
 */
@property (nonatomic, strong) NSString * _Nullable routingProfileId;

/**
 <p>One or more tags.</p>
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
 <p>The Amazon Resource Name (ARN) for Amazon Connect instances that phone numbers are claimed to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable targetArn;

@end

/**
 
 */
@interface AWSConnectSearchAvailablePhoneNumbersResponse : AWSModel


/**
 <p>A list of available phone numbers that you can claim for your Amazon Connect instance.</p>
 */
@property (nonatomic, strong) NSArray<AWSConnectAvailableNumberSummary *> * _Nullable availableNumbersList;

/**
 <p>If there are additional results, this is the token for the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSConnectSearchUsersRequest : AWSRequest


/**
 <p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>
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
 <p>The search criteria to be used to return users.</p>
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
 <p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>
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
 <p>The tags used to organize, track, or control access for this resource.</p>
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
 
 */
@interface AWSConnectStartChatContactRequest : AWSRequest


/**
 <p>A custom key-value pair using an attribute map. The attributes are standard Amazon Connect attributes. They can be accessed in contact flows just like any other contact attributes. </p><p>There can be up to 32,768 UTF-8 bytes across all key-value pairs per contact. Attribute keys can include only alphanumeric, dash, and underscore characters.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable attributes;

/**
 <p>The total duration of the newly started chat session. If not specified, the chat session duration defaults to 25 hour. The minumum configurable time is 60 minutes. The maximum configurable time is 10,080 minutes (7 days).</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable chatDurationInMinutes;

/**
 <p>A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>The identifier of the contact flow for initiating the chat. To see the ContactFlowId in the Amazon Connect console user interface, on the navigation menu go to <b>Routing</b>, <b>Contact Flows</b>. Choose the contact flow. On the contact flow page, under the name of the contact flow, choose <b>Show additional flow information</b>. The ContactFlowId is the last part of the ARN, shown here in bold: </p><p>arn:aws:connect:us-west-2:xxxxxxxxxxxx:instance/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/contact-flow/<b>846ec553-a005-41c0-8341-xxxxxxxxxxxx</b></p>
 */
@property (nonatomic, strong) NSString * _Nullable contactFlowId;

/**
 <p>The initial message to be sent to the newly created chat.</p>
 */
@property (nonatomic, strong) AWSConnectChatMessage * _Nullable initialMessage;

/**
 <p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>Information identifying the participant.</p>
 */
@property (nonatomic, strong) AWSConnectParticipantDetails * _Nullable participantDetails;

/**
 <p>The supported chat message content types. Content types can be text/plain or both text/plain and text/markdown.</p>
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
 <p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>
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
 <p>A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>The identifier of the contact. This is the identifier of the contact associated with the first interaction with the contact center.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contactId;

/**
 <p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>
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
 <p>A custom key-value pair using an attribute map. The attributes are standard Amazon Connect attributes, and can be accessed in contact flows just like any other contact attributes.</p><p>There can be up to 32,768 UTF-8 bytes across all key-value pairs per contact. Attribute keys can include only alphanumeric, dash, and underscore characters.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable attributes;

/**
 <p>The campaign identifier of the outbound communication.</p>
 */
@property (nonatomic, strong) NSString * _Nullable campaignId;

/**
 <p>A unique, case-sensitive identifier that you provide to ensure the idempotency of the request. The token is valid for 7 days after creation. If a contact is already started, the contact ID is returned. </p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>The identifier of the contact flow for the outbound call. To see the ContactFlowId in the Amazon Connect console user interface, on the navigation menu go to <b>Routing</b>, <b>Contact Flows</b>. Choose the contact flow. On the contact flow page, under the name of the contact flow, choose <b>Show additional flow information</b>. The ContactFlowId is the last part of the ARN, shown here in bold: </p><p>arn:aws:connect:us-west-2:xxxxxxxxxxxx:instance/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/contact-flow/<b>846ec553-a005-41c0-8341-xxxxxxxxxxxx</b></p>
 */
@property (nonatomic, strong) NSString * _Nullable contactFlowId;

/**
 <p>The phone number of the customer, in E.164 format.</p>
 */
@property (nonatomic, strong) NSString * _Nullable destinationPhoneNumber;

/**
 <p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The queue for the call. If you specify a queue, the phone displayed for caller ID is the phone number specified in the queue. If you do not specify a queue, the queue defined in the contact flow is used. If you do not specify a queue, you must specify a source phone number.</p>
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
 <p>A custom key-value pair using an attribute map. The attributes are standard Amazon Connect attributes, and can be accessed in contact flows just like any other contact attributes.</p><p>There can be up to 32,768 UTF-8 bytes across all key-value pairs per contact. Attribute keys can include only alphanumeric, dash, and underscore characters.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable attributes;

/**
 <p>A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>The identifier of the contact flow for initiating the tasks. To see the ContactFlowId in the Amazon Connect console user interface, on the navigation menu go to <b>Routing</b>, <b>Contact Flows</b>. Choose the contact flow. On the contact flow page, under the name of the contact flow, choose <b>Show additional flow information</b>. The ContactFlowId is the last part of the ARN, shown here in bold: </p><p>arn:aws:connect:us-west-2:xxxxxxxxxxxx:instance/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/contact-flow/<b>846ec553-a005-41c0-8341-xxxxxxxxxxxx</b></p>
 */
@property (nonatomic, strong) NSString * _Nullable contactFlowId;

/**
 <p>A description of the task that is shown to an agent in the Contact Control Panel (CCP).</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>
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
 <p>A formatted URL that is shown to an agent in the Contact Control Panel (CCP).</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSConnectReference *> * _Nullable references;

/**
 <p>The timestamp, in Unix Epoch seconds format, at which to start running the inbound contact flow. The scheduled time cannot be in the past. It must be within up to 6 days in future. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable scheduledTime;

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
 <p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>
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
 <p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>
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
 <p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>
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
 <p>A leaf node condition which can be used to specify a string condition, for example, <code>username = 'abc'</code>. </p>
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
 <p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>
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
 <p>One or more tags. For example, { "tags": {"key1":"value1", "key2":"value2"} }.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

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
 <p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>
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
 <p>The Amazon Connect attributes. These attributes can be accessed in contact flows just like any other contact attributes.</p><p>You can have up to 32,768 UTF-8 bytes across all attributes for a contact. Attribute keys can include only alphanumeric, dash, and underscore characters.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable attributes;

/**
 <p>The identifier of the contact. This is the identifier of the contact associated with the first interaction with the contact center.</p>
 */
@property (nonatomic, strong) NSString * _Nullable initialContactId;

/**
 <p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

@end

/**
 
 */
@interface AWSConnectUpdateContactAttributesResponse : AWSModel


@end

/**
 
 */
@interface AWSConnectUpdateContactFlowContentRequest : AWSRequest


/**
 <p>The identifier of the contact flow.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contactFlowId;

/**
 <p>The JSON string that represents contact flow’s content. For an example, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/flow-language-example.html">Example contact flow in Amazon Connect Flow language</a> in the <i>Amazon Connect Administrator Guide</i>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable content;

/**
 <p>The identifier of the Amazon Connect instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

@end

/**
 
 */
@interface AWSConnectUpdateContactFlowMetadataRequest : AWSRequest


/**
 <p>The identifier of the contact flow.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contactFlowId;

/**
 <p>The state of contact flow.</p>
 */
@property (nonatomic, assign) AWSConnectContactFlowState contactFlowState;

/**
 <p>The description of the contact flow.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>TThe name of the contact flow.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSConnectUpdateContactFlowModuleContentRequest : AWSRequest


/**
 <p>The identifier of the contact flow module.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contactFlowModuleId;

/**
 <p>The content of the contact flow module.</p>
 */
@property (nonatomic, strong) NSString * _Nullable content;

/**
 <p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>
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
 <p>The identifier of the contact flow module.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contactFlowModuleId;

/**
 <p>The description of the contact flow module.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The name of the contact flow module.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The state of contact flow module.</p>
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
 <p>The identifier of the contact flow.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contactFlowId;

/**
 <p>The description of the contact flow.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The identifier of the Amazon Connect instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The name of the contact flow.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

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
 <p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The name of the contact.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>A formatted URL that is shown to an agent in the Contact Control Panel (CCP).</p>
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
 <p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The timestamp, in Unix Epoch seconds format, at which to start running the inbound contact flow. The scheduled time cannot be in the past. It must be within up to 6 days in future. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable scheduledTime;

@end

/**
 
 */
@interface AWSConnectUpdateContactScheduleResponse : AWSModel


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
 <p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>
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
 <p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>
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
 <p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>
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
 
 */
@interface AWSConnectUpdatePhoneNumberRequest : AWSRequest


/**
 <p>A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>A unique identifier for the phone number.</p>
 */
@property (nonatomic, strong) NSString * _Nullable phoneNumberId;

/**
 <p>The Amazon Resource Name (ARN) for Amazon Connect instances that phone numbers are claimed to.</p>
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
@interface AWSConnectUpdateQueueHoursOfOperationRequest : AWSRequest


/**
 <p>The identifier for the hours of operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable hoursOfOperationId;

/**
 <p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>
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
 <p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>
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
 <p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>
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
 <p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>
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
 <p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>
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
 <p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>
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
 <p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>
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
 <p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>
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
 <p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>
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
 <p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>
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
 <p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>
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
@interface AWSConnectUpdateSecurityProfileRequest : AWSRequest


/**
 <p>The description of the security profile.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The permissions granted to a security profile.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable permissions;

/**
 <p>The identifier for the security profle.</p>
 */
@property (nonatomic, strong) NSString * _Nullable securityProfileId;

@end

/**
 
 */
@interface AWSConnectUpdateUserHierarchyGroupNameRequest : AWSRequest


/**
 <p>The identifier of the hierarchy group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable hierarchyGroupId;

/**
 <p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>
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
@interface AWSConnectUpdateUserHierarchyStructureRequest : AWSRequest


/**
 <p>The hierarchy levels to update.</p>
 */
@property (nonatomic, strong) AWSConnectHierarchyStructureUpdate * _Nullable hierarchyStructure;

/**
 <p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>
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
@interface AWSConnectUpdateUserPhoneConfigRequest : AWSRequest


/**
 <p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>
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
 <p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>
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
 <p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>
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
 <p>Contains information about a user account for a Amazon Connect instance.</p>
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
 <p>The After Call Work (ACW) timeout setting, in seconds.</p>
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
 <p>The identifier of the contact flow.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contactFlowId;

/**
 <p>The identifier of the user.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userId;

@end

/**
 <p>The search criteria to be used to return users.</p>
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
 <p>The tags used to organize, track, or control access for this resource.</p>
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
 <p>The tags used to organize, track, or control access for this resource.</p>
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

NS_ASSUME_NONNULL_END
