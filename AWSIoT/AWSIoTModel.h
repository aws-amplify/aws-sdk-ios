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

FOUNDATION_EXPORT NSString *const AWSIoTErrorDomain;

typedef NS_ENUM(NSInteger, AWSIoTErrorType) {
    AWSIoTErrorUnknown,
    AWSIoTErrorCertificateConflict,
    AWSIoTErrorCertificateState,
    AWSIoTErrorCertificateValidation,
    AWSIoTErrorConflict,
    AWSIoTErrorConflictingResourceUpdate,
    AWSIoTErrorDeleteConflict,
    AWSIoTErrorIndexNotReady,
    AWSIoTErrorInternal,
    AWSIoTErrorInternalFailure,
    AWSIoTErrorInternalServer,
    AWSIoTErrorInvalidAggregation,
    AWSIoTErrorInvalidQuery,
    AWSIoTErrorInvalidRequest,
    AWSIoTErrorInvalidResponse,
    AWSIoTErrorInvalidStateTransition,
    AWSIoTErrorLimitExceeded,
    AWSIoTErrorMalformedPolicy,
    AWSIoTErrorNotConfigured,
    AWSIoTErrorRegistrationCodeValidation,
    AWSIoTErrorResourceAlreadyExists,
    AWSIoTErrorResourceNotFound,
    AWSIoTErrorResourceRegistrationFailure,
    AWSIoTErrorServiceUnavailable,
    AWSIoTErrorSqlParse,
    AWSIoTErrorTaskAlreadyExists,
    AWSIoTErrorThrottling,
    AWSIoTErrorTransferAlreadyCompleted,
    AWSIoTErrorTransferConflict,
    AWSIoTErrorUnauthorized,
    AWSIoTErrorVersionConflict,
    AWSIoTErrorVersionsLimitExceeded,
};

typedef NS_ENUM(NSInteger, AWSIoTAbortAction) {
    AWSIoTAbortActionUnknown,
    AWSIoTAbortActionCancel,
};

typedef NS_ENUM(NSInteger, AWSIoTActionType) {
    AWSIoTActionTypeUnknown,
    AWSIoTActionTypePublish,
    AWSIoTActionTypeSubscribe,
    AWSIoTActionTypeReceive,
    AWSIoTActionTypeConnect,
};

typedef NS_ENUM(NSInteger, AWSIoTAggregationTypeName) {
    AWSIoTAggregationTypeNameUnknown,
    AWSIoTAggregationTypeNameStatistics,
    AWSIoTAggregationTypeNamePercentiles,
    AWSIoTAggregationTypeNameCardinality,
};

typedef NS_ENUM(NSInteger, AWSIoTAlertTargetType) {
    AWSIoTAlertTargetTypeUnknown,
    AWSIoTAlertTargetTypeSns,
};

typedef NS_ENUM(NSInteger, AWSIoTAuditCheckRunStatus) {
    AWSIoTAuditCheckRunStatusUnknown,
    AWSIoTAuditCheckRunStatusInProgress,
    AWSIoTAuditCheckRunStatusWaitingForDataCollection,
    AWSIoTAuditCheckRunStatusCanceled,
    AWSIoTAuditCheckRunStatusCompletedCompliant,
    AWSIoTAuditCheckRunStatusCompletedNonCompliant,
    AWSIoTAuditCheckRunStatusFailed,
};

typedef NS_ENUM(NSInteger, AWSIoTAuditFindingSeverity) {
    AWSIoTAuditFindingSeverityUnknown,
    AWSIoTAuditFindingSeverityCritical,
    AWSIoTAuditFindingSeverityHigh,
    AWSIoTAuditFindingSeverityMedium,
    AWSIoTAuditFindingSeverityLow,
};

typedef NS_ENUM(NSInteger, AWSIoTAuditFrequency) {
    AWSIoTAuditFrequencyUnknown,
    AWSIoTAuditFrequencyDaily,
    AWSIoTAuditFrequencyWeekly,
    AWSIoTAuditFrequencyBiweekly,
    AWSIoTAuditFrequencyMonthly,
};

typedef NS_ENUM(NSInteger, AWSIoTAuditMitigationActionsExecutionStatus) {
    AWSIoTAuditMitigationActionsExecutionStatusUnknown,
    AWSIoTAuditMitigationActionsExecutionStatusInProgress,
    AWSIoTAuditMitigationActionsExecutionStatusCompleted,
    AWSIoTAuditMitigationActionsExecutionStatusFailed,
    AWSIoTAuditMitigationActionsExecutionStatusCanceled,
    AWSIoTAuditMitigationActionsExecutionStatusSkipped,
    AWSIoTAuditMitigationActionsExecutionStatusPending,
};

typedef NS_ENUM(NSInteger, AWSIoTAuditMitigationActionsTaskStatus) {
    AWSIoTAuditMitigationActionsTaskStatusUnknown,
    AWSIoTAuditMitigationActionsTaskStatusInProgress,
    AWSIoTAuditMitigationActionsTaskStatusCompleted,
    AWSIoTAuditMitigationActionsTaskStatusFailed,
    AWSIoTAuditMitigationActionsTaskStatusCanceled,
};

typedef NS_ENUM(NSInteger, AWSIoTAuditNotificationType) {
    AWSIoTAuditNotificationTypeUnknown,
    AWSIoTAuditNotificationTypeSns,
};

typedef NS_ENUM(NSInteger, AWSIoTAuditTaskStatus) {
    AWSIoTAuditTaskStatusUnknown,
    AWSIoTAuditTaskStatusInProgress,
    AWSIoTAuditTaskStatusCompleted,
    AWSIoTAuditTaskStatusFailed,
    AWSIoTAuditTaskStatusCanceled,
};

typedef NS_ENUM(NSInteger, AWSIoTAuditTaskType) {
    AWSIoTAuditTaskTypeUnknown,
    AWSIoTAuditTaskTypeOnDemandAuditTask,
    AWSIoTAuditTaskTypeScheduledAuditTask,
};

typedef NS_ENUM(NSInteger, AWSIoTAuthDecision) {
    AWSIoTAuthDecisionUnknown,
    AWSIoTAuthDecisionAllowed,
    AWSIoTAuthDecisionExplicitDeny,
    AWSIoTAuthDecisionImplicitDeny,
};

typedef NS_ENUM(NSInteger, AWSIoTAuthorizerStatus) {
    AWSIoTAuthorizerStatusUnknown,
    AWSIoTAuthorizerStatusActive,
    AWSIoTAuthorizerStatusInactive,
};

typedef NS_ENUM(NSInteger, AWSIoTAutoRegistrationStatus) {
    AWSIoTAutoRegistrationStatusUnknown,
    AWSIoTAutoRegistrationStatusEnable,
    AWSIoTAutoRegistrationStatusDisable,
};

typedef NS_ENUM(NSInteger, AWSIoTAwsJobAbortCriteriaAbortAction) {
    AWSIoTAwsJobAbortCriteriaAbortActionUnknown,
    AWSIoTAwsJobAbortCriteriaAbortActionCancel,
};

typedef NS_ENUM(NSInteger, AWSIoTAwsJobAbortCriteriaFailureType) {
    AWSIoTAwsJobAbortCriteriaFailureTypeUnknown,
    AWSIoTAwsJobAbortCriteriaFailureTypeFailed,
    AWSIoTAwsJobAbortCriteriaFailureTypeRejected,
    AWSIoTAwsJobAbortCriteriaFailureTypeTimedOut,
    AWSIoTAwsJobAbortCriteriaFailureTypeAll,
};

typedef NS_ENUM(NSInteger, AWSIoTBehaviorCriteriaType) {
    AWSIoTBehaviorCriteriaTypeUnknown,
    AWSIoTBehaviorCriteriaTypeStatic,
    AWSIoTBehaviorCriteriaTypeStatistical,
    AWSIoTBehaviorCriteriaTypeMachineLearning,
};

typedef NS_ENUM(NSInteger, AWSIoTCACertificateStatus) {
    AWSIoTCACertificateStatusUnknown,
    AWSIoTCACertificateStatusActive,
    AWSIoTCACertificateStatusInactive,
};

typedef NS_ENUM(NSInteger, AWSIoTCACertificateUpdateAction) {
    AWSIoTCACertificateUpdateActionUnknown,
    AWSIoTCACertificateUpdateActionDeactivate,
};

typedef NS_ENUM(NSInteger, AWSIoTCannedAccessControlList) {
    AWSIoTCannedAccessControlListUnknown,
    AWSIoTCannedAccessControlListPrivate,
    AWSIoTCannedAccessControlListPublicRead,
    AWSIoTCannedAccessControlListPublicReadWrite,
    AWSIoTCannedAccessControlListAwsExecRead,
    AWSIoTCannedAccessControlListAuthenticatedRead,
    AWSIoTCannedAccessControlListBucketOwnerRead,
    AWSIoTCannedAccessControlListBucketOwnerFullControl,
    AWSIoTCannedAccessControlListLogDeliveryWrite,
};

typedef NS_ENUM(NSInteger, AWSIoTCertificateMode) {
    AWSIoTCertificateModeUnknown,
    AWSIoTCertificateModeDefault,
    AWSIoTCertificateModeSniOnly,
};

typedef NS_ENUM(NSInteger, AWSIoTCertificateStatus) {
    AWSIoTCertificateStatusUnknown,
    AWSIoTCertificateStatusActive,
    AWSIoTCertificateStatusInactive,
    AWSIoTCertificateStatusRevoked,
    AWSIoTCertificateStatusPendingTransfer,
    AWSIoTCertificateStatusRegisterInactive,
    AWSIoTCertificateStatusPendingActivation,
};

typedef NS_ENUM(NSInteger, AWSIoTComparisonOperator) {
    AWSIoTComparisonOperatorUnknown,
    AWSIoTComparisonOperatorLessThan,
    AWSIoTComparisonOperatorLessThanEquals,
    AWSIoTComparisonOperatorGreaterThan,
    AWSIoTComparisonOperatorGreaterThanEquals,
    AWSIoTComparisonOperatorInCidrSet,
    AWSIoTComparisonOperatorNotInCidrSet,
    AWSIoTComparisonOperatorInPortSet,
    AWSIoTComparisonOperatorNotInPortSet,
    AWSIoTComparisonOperatorInSet,
    AWSIoTComparisonOperatorNotInSet,
};

typedef NS_ENUM(NSInteger, AWSIoTConfidenceLevel) {
    AWSIoTConfidenceLevelUnknown,
    AWSIoTConfidenceLevelLow,
    AWSIoTConfidenceLevelMedium,
    AWSIoTConfidenceLevelHigh,
};

typedef NS_ENUM(NSInteger, AWSIoTCustomMetricType) {
    AWSIoTCustomMetricTypeUnknown,
    AWSIoTCustomMetricTypeStringList,
    AWSIoTCustomMetricTypeIpAddressList,
    AWSIoTCustomMetricTypeNumberList,
    AWSIoTCustomMetricTypeNumber,
};

typedef NS_ENUM(NSInteger, AWSIoTDayOfWeek) {
    AWSIoTDayOfWeekUnknown,
    AWSIoTDayOfWeekSun,
    AWSIoTDayOfWeekMon,
    AWSIoTDayOfWeekTue,
    AWSIoTDayOfWeekWed,
    AWSIoTDayOfWeekThu,
    AWSIoTDayOfWeekFri,
    AWSIoTDayOfWeekSat,
};

typedef NS_ENUM(NSInteger, AWSIoTDetectMitigationActionExecutionStatus) {
    AWSIoTDetectMitigationActionExecutionStatusUnknown,
    AWSIoTDetectMitigationActionExecutionStatusInProgress,
    AWSIoTDetectMitigationActionExecutionStatusSuccessful,
    AWSIoTDetectMitigationActionExecutionStatusFailed,
    AWSIoTDetectMitigationActionExecutionStatusSkipped,
};

typedef NS_ENUM(NSInteger, AWSIoTDetectMitigationActionsTaskStatus) {
    AWSIoTDetectMitigationActionsTaskStatusUnknown,
    AWSIoTDetectMitigationActionsTaskStatusInProgress,
    AWSIoTDetectMitigationActionsTaskStatusSuccessful,
    AWSIoTDetectMitigationActionsTaskStatusFailed,
    AWSIoTDetectMitigationActionsTaskStatusCanceled,
};

typedef NS_ENUM(NSInteger, AWSIoTDeviceCertificateUpdateAction) {
    AWSIoTDeviceCertificateUpdateActionUnknown,
    AWSIoTDeviceCertificateUpdateActionDeactivate,
};

typedef NS_ENUM(NSInteger, AWSIoTDeviceDefenderIndexingMode) {
    AWSIoTDeviceDefenderIndexingModeUnknown,
    AWSIoTDeviceDefenderIndexingModeOff,
    AWSIoTDeviceDefenderIndexingModeViolations,
};

typedef NS_ENUM(NSInteger, AWSIoTDimensionType) {
    AWSIoTDimensionTypeUnknown,
    AWSIoTDimensionTypeTopicFilter,
};

typedef NS_ENUM(NSInteger, AWSIoTDimensionValueOperator) {
    AWSIoTDimensionValueOperatorUnknown,
    AWSIoTDimensionValueOperatorIN,
    AWSIoTDimensionValueOperatorNotIn,
};

typedef NS_ENUM(NSInteger, AWSIoTDomainConfigurationStatus) {
    AWSIoTDomainConfigurationStatusUnknown,
    AWSIoTDomainConfigurationStatusEnabled,
    AWSIoTDomainConfigurationStatusDisabled,
};

typedef NS_ENUM(NSInteger, AWSIoTDomainType) {
    AWSIoTDomainTypeUnknown,
    AWSIoTDomainTypeEndpoint,
    AWSIoTDomainTypeAwsManaged,
    AWSIoTDomainTypeCustomerManaged,
};

typedef NS_ENUM(NSInteger, AWSIoTDynamicGroupStatus) {
    AWSIoTDynamicGroupStatusUnknown,
    AWSIoTDynamicGroupStatusActive,
    AWSIoTDynamicGroupStatusBuilding,
    AWSIoTDynamicGroupStatusRebuilding,
};

typedef NS_ENUM(NSInteger, AWSIoTDynamoKeyType) {
    AWSIoTDynamoKeyTypeUnknown,
    AWSIoTDynamoKeyTypeString,
    AWSIoTDynamoKeyTypeNumber,
};

typedef NS_ENUM(NSInteger, AWSIoTEventType) {
    AWSIoTEventTypeUnknown,
    AWSIoTEventTypeThing,
    AWSIoTEventTypeThingGroup,
    AWSIoTEventTypeThingType,
    AWSIoTEventTypeThingGroupMembership,
    AWSIoTEventTypeThingGroupHierarchy,
    AWSIoTEventTypeThingTypeAssociation,
    AWSIoTEventTypeJob,
    AWSIoTEventTypeJobExecution,
    AWSIoTEventTypePolicy,
    AWSIoTEventTypeCertificate,
    AWSIoTEventTypeCaCertificate,
};

typedef NS_ENUM(NSInteger, AWSIoTFieldType) {
    AWSIoTFieldTypeUnknown,
    AWSIoTFieldTypeNumber,
    AWSIoTFieldTypeString,
    AWSIoTFieldTypeBoolean,
};

typedef NS_ENUM(NSInteger, AWSIoTFleetMetricUnit) {
    AWSIoTFleetMetricUnitUnknown,
    AWSIoTFleetMetricUnitSeconds,
    AWSIoTFleetMetricUnitMicroseconds,
    AWSIoTFleetMetricUnitMilliseconds,
    AWSIoTFleetMetricUnitBytes,
    AWSIoTFleetMetricUnitKilobytes,
    AWSIoTFleetMetricUnitMegabytes,
    AWSIoTFleetMetricUnitGigabytes,
    AWSIoTFleetMetricUnitTerabytes,
    AWSIoTFleetMetricUnitBits,
    AWSIoTFleetMetricUnitKilobits,
    AWSIoTFleetMetricUnitMegabits,
    AWSIoTFleetMetricUnitGigabits,
    AWSIoTFleetMetricUnitTerabits,
    AWSIoTFleetMetricUnitPercent,
    AWSIoTFleetMetricUnitCount,
    AWSIoTFleetMetricUnitBytesSecond,
    AWSIoTFleetMetricUnitKilobytesSecond,
    AWSIoTFleetMetricUnitMegabytesSecond,
    AWSIoTFleetMetricUnitGigabytesSecond,
    AWSIoTFleetMetricUnitTerabytesSecond,
    AWSIoTFleetMetricUnitBitsSecond,
    AWSIoTFleetMetricUnitKilobitsSecond,
    AWSIoTFleetMetricUnitMegabitsSecond,
    AWSIoTFleetMetricUnitGigabitsSecond,
    AWSIoTFleetMetricUnitTerabitsSecond,
    AWSIoTFleetMetricUnitCountSecond,
    AWSIoTFleetMetricUnitNone,
};

typedef NS_ENUM(NSInteger, AWSIoTIndexStatus) {
    AWSIoTIndexStatusUnknown,
    AWSIoTIndexStatusActive,
    AWSIoTIndexStatusBuilding,
    AWSIoTIndexStatusRebuilding,
};

typedef NS_ENUM(NSInteger, AWSIoTJobExecutionFailureType) {
    AWSIoTJobExecutionFailureTypeUnknown,
    AWSIoTJobExecutionFailureTypeFailed,
    AWSIoTJobExecutionFailureTypeRejected,
    AWSIoTJobExecutionFailureTypeTimedOut,
    AWSIoTJobExecutionFailureTypeAll,
};

typedef NS_ENUM(NSInteger, AWSIoTJobExecutionStatus) {
    AWSIoTJobExecutionStatusUnknown,
    AWSIoTJobExecutionStatusQueued,
    AWSIoTJobExecutionStatusInProgress,
    AWSIoTJobExecutionStatusSucceeded,
    AWSIoTJobExecutionStatusFailed,
    AWSIoTJobExecutionStatusTimedOut,
    AWSIoTJobExecutionStatusRejected,
    AWSIoTJobExecutionStatusRemoved,
    AWSIoTJobExecutionStatusCanceled,
};

typedef NS_ENUM(NSInteger, AWSIoTJobStatus) {
    AWSIoTJobStatusUnknown,
    AWSIoTJobStatusInProgress,
    AWSIoTJobStatusCanceled,
    AWSIoTJobStatusCompleted,
    AWSIoTJobStatusDeletionInProgress,
};

typedef NS_ENUM(NSInteger, AWSIoTLogLevel) {
    AWSIoTLogLevelUnknown,
    AWSIoTLogLevelDebug,
    AWSIoTLogLevelInfo,
    AWSIoTLogLevelError,
    AWSIoTLogLevelWarn,
    AWSIoTLogLevelDisabled,
};

typedef NS_ENUM(NSInteger, AWSIoTLogTargetType) {
    AWSIoTLogTargetTypeUnknown,
    AWSIoTLogTargetTypeDefault,
    AWSIoTLogTargetTypeThingGroup,
    AWSIoTLogTargetTypeClientId,
    AWSIoTLogTargetTypeSourceIp,
    AWSIoTLogTargetTypePrincipalId,
};

typedef NS_ENUM(NSInteger, AWSIoTMessageFormat) {
    AWSIoTMessageFormatUnknown,
    AWSIoTMessageFormatRAW,
    AWSIoTMessageFormatJson,
};

typedef NS_ENUM(NSInteger, AWSIoTMitigationActionType) {
    AWSIoTMitigationActionTypeUnknown,
    AWSIoTMitigationActionTypeUpdateDeviceCertificate,
    AWSIoTMitigationActionTypeUpdateCaCertificate,
    AWSIoTMitigationActionTypeAddThingsToThingGroup,
    AWSIoTMitigationActionTypeReplaceDefaultPolicyVersion,
    AWSIoTMitigationActionTypeEnableIotLogging,
    AWSIoTMitigationActionTypePublishFindingToSns,
};

typedef NS_ENUM(NSInteger, AWSIoTModelStatus) {
    AWSIoTModelStatusUnknown,
    AWSIoTModelStatusPendingBuild,
    AWSIoTModelStatusActive,
    AWSIoTModelStatusExpired,
};

typedef NS_ENUM(NSInteger, AWSIoTNamedShadowIndexingMode) {
    AWSIoTNamedShadowIndexingModeUnknown,
    AWSIoTNamedShadowIndexingModeOff,
    AWSIoTNamedShadowIndexingModeOn,
};

typedef NS_ENUM(NSInteger, AWSIoTOTAUpdateStatus) {
    AWSIoTOTAUpdateStatusUnknown,
    AWSIoTOTAUpdateStatusCreatePending,
    AWSIoTOTAUpdateStatusCreateInProgress,
    AWSIoTOTAUpdateStatusCreateComplete,
    AWSIoTOTAUpdateStatusCreateFailed,
};

typedef NS_ENUM(NSInteger, AWSIoTPolicyTemplateName) {
    AWSIoTPolicyTemplateNameUnknown,
    AWSIoTPolicyTemplateNameBlankPolicy,
};

typedef NS_ENUM(NSInteger, AWSIoTProtocols) {
    AWSIoTProtocolsUnknown,
    AWSIoTProtocolsMqtt,
    AWSIoTProtocolsHttp,
};

typedef NS_ENUM(NSInteger, AWSIoTReportType) {
    AWSIoTReportTypeUnknown,
    AWSIoTReportTypeErrors,
    AWSIoTReportTypeResults,
};

typedef NS_ENUM(NSInteger, AWSIoTResourceType) {
    AWSIoTResourceTypeUnknown,
    AWSIoTResourceTypeDeviceCertificate,
    AWSIoTResourceTypeCaCertificate,
    AWSIoTResourceTypeIotPolicy,
    AWSIoTResourceTypeCognitoIdentityPool,
    AWSIoTResourceTypeClientId,
    AWSIoTResourceTypeAccountSettings,
    AWSIoTResourceTypeRoleAlias,
    AWSIoTResourceTypeIamRole,
};

typedef NS_ENUM(NSInteger, AWSIoTRetryableFailureType) {
    AWSIoTRetryableFailureTypeUnknown,
    AWSIoTRetryableFailureTypeFailed,
    AWSIoTRetryableFailureTypeTimedOut,
    AWSIoTRetryableFailureTypeAll,
};

typedef NS_ENUM(NSInteger, AWSIoTServerCertificateStatus) {
    AWSIoTServerCertificateStatusUnknown,
    AWSIoTServerCertificateStatusInvalid,
    AWSIoTServerCertificateStatusValid,
};

typedef NS_ENUM(NSInteger, AWSIoTServiceType) {
    AWSIoTServiceTypeUnknown,
    AWSIoTServiceTypeData,
    AWSIoTServiceTypeCredentialProvider,
    AWSIoTServiceTypeJobs,
};

typedef NS_ENUM(NSInteger, AWSIoTStatus) {
    AWSIoTStatusUnknown,
    AWSIoTStatusInProgress,
    AWSIoTStatusCompleted,
    AWSIoTStatusFailed,
    AWSIoTStatusCancelled,
    AWSIoTStatusCancelling,
};

typedef NS_ENUM(NSInteger, AWSIoTTargetSelection) {
    AWSIoTTargetSelectionUnknown,
    AWSIoTTargetSelectionContinuous,
    AWSIoTTargetSelectionSnapshot,
};

typedef NS_ENUM(NSInteger, AWSIoTTemplateType) {
    AWSIoTTemplateTypeUnknown,
    AWSIoTTemplateTypeFleetProvisioning,
    AWSIoTTemplateTypeJitp,
};

typedef NS_ENUM(NSInteger, AWSIoTThingConnectivityIndexingMode) {
    AWSIoTThingConnectivityIndexingModeUnknown,
    AWSIoTThingConnectivityIndexingModeOff,
    AWSIoTThingConnectivityIndexingModeStatus,
};

typedef NS_ENUM(NSInteger, AWSIoTThingGroupIndexingMode) {
    AWSIoTThingGroupIndexingModeUnknown,
    AWSIoTThingGroupIndexingModeOff,
    AWSIoTThingGroupIndexingModeOn,
};

typedef NS_ENUM(NSInteger, AWSIoTThingIndexingMode) {
    AWSIoTThingIndexingModeUnknown,
    AWSIoTThingIndexingModeOff,
    AWSIoTThingIndexingModeRegistry,
    AWSIoTThingIndexingModeRegistryAndShadow,
};

typedef NS_ENUM(NSInteger, AWSIoTTopicRuleDestinationStatus) {
    AWSIoTTopicRuleDestinationStatusUnknown,
    AWSIoTTopicRuleDestinationStatusEnabled,
    AWSIoTTopicRuleDestinationStatusInProgress,
    AWSIoTTopicRuleDestinationStatusDisabled,
    AWSIoTTopicRuleDestinationStatusError,
    AWSIoTTopicRuleDestinationStatusDeleting,
};

typedef NS_ENUM(NSInteger, AWSIoTVerificationState) {
    AWSIoTVerificationStateUnknown,
    AWSIoTVerificationStateFalsePositive,
    AWSIoTVerificationStateBenignPositive,
    AWSIoTVerificationStateTruePositive,
};

typedef NS_ENUM(NSInteger, AWSIoTViolationEventType) {
    AWSIoTViolationEventTypeUnknown,
    AWSIoTViolationEventTypeInAlarm,
    AWSIoTViolationEventTypeAlarmCleared,
    AWSIoTViolationEventTypeAlarmInvalidated,
};

@class AWSIoTAbortConfig;
@class AWSIoTAbortCriteria;
@class AWSIoTAcceptCertificateTransferRequest;
@class AWSIoTAction;
@class AWSIoTActiveViolation;
@class AWSIoTAddThingToBillingGroupRequest;
@class AWSIoTAddThingToBillingGroupResponse;
@class AWSIoTAddThingToThingGroupRequest;
@class AWSIoTAddThingToThingGroupResponse;
@class AWSIoTAddThingsToThingGroupParams;
@class AWSIoTAggregationType;
@class AWSIoTAlertTarget;
@class AWSIoTAllowed;
@class AWSIoTAssetPropertyTimestamp;
@class AWSIoTAssetPropertyValue;
@class AWSIoTAssetPropertyVariant;
@class AWSIoTAssociateTargetsWithJobRequest;
@class AWSIoTAssociateTargetsWithJobResponse;
@class AWSIoTAttachPolicyRequest;
@class AWSIoTAttachPrincipalPolicyRequest;
@class AWSIoTAttachSecurityProfileRequest;
@class AWSIoTAttachSecurityProfileResponse;
@class AWSIoTAttachThingPrincipalRequest;
@class AWSIoTAttachThingPrincipalResponse;
@class AWSIoTAttributePayload;
@class AWSIoTAuditCheckConfiguration;
@class AWSIoTAuditCheckDetails;
@class AWSIoTAuditFinding;
@class AWSIoTAuditMitigationActionExecutionMetadata;
@class AWSIoTAuditMitigationActionsTaskMetadata;
@class AWSIoTAuditMitigationActionsTaskTarget;
@class AWSIoTAuditNotificationTarget;
@class AWSIoTAuditSuppression;
@class AWSIoTAuditTaskMetadata;
@class AWSIoTAuthInfo;
@class AWSIoTAuthResult;
@class AWSIoTAuthorizerConfig;
@class AWSIoTAuthorizerDescription;
@class AWSIoTAuthorizerSummary;
@class AWSIoTAwsJobAbortConfig;
@class AWSIoTAwsJobAbortCriteria;
@class AWSIoTAwsJobExecutionsRolloutConfig;
@class AWSIoTAwsJobExponentialRolloutRate;
@class AWSIoTAwsJobPresignedUrlConfig;
@class AWSIoTAwsJobRateIncreaseCriteria;
@class AWSIoTAwsJobTimeoutConfig;
@class AWSIoTBehavior;
@class AWSIoTBehaviorCriteria;
@class AWSIoTBehaviorModelTrainingSummary;
@class AWSIoTBillingGroupMetadata;
@class AWSIoTBillingGroupProperties;
@class AWSIoTBucket;
@class AWSIoTBucketsAggregationType;
@class AWSIoTCACertificate;
@class AWSIoTCACertificateDescription;
@class AWSIoTCancelAuditMitigationActionsTaskRequest;
@class AWSIoTCancelAuditMitigationActionsTaskResponse;
@class AWSIoTCancelAuditTaskRequest;
@class AWSIoTCancelAuditTaskResponse;
@class AWSIoTCancelCertificateTransferRequest;
@class AWSIoTCancelDetectMitigationActionsTaskRequest;
@class AWSIoTCancelDetectMitigationActionsTaskResponse;
@class AWSIoTCancelJobExecutionRequest;
@class AWSIoTCancelJobRequest;
@class AWSIoTCancelJobResponse;
@class AWSIoTCertificate;
@class AWSIoTCertificateDescription;
@class AWSIoTCertificateValidity;
@class AWSIoTClearDefaultAuthorizerRequest;
@class AWSIoTClearDefaultAuthorizerResponse;
@class AWSIoTCloudwatchAlarmAction;
@class AWSIoTCloudwatchLogsAction;
@class AWSIoTCloudwatchMetricAction;
@class AWSIoTCodeSigning;
@class AWSIoTCodeSigningCertificateChain;
@class AWSIoTCodeSigningSignature;
@class AWSIoTConfiguration;
@class AWSIoTConfirmTopicRuleDestinationRequest;
@class AWSIoTConfirmTopicRuleDestinationResponse;
@class AWSIoTCreateAuditSuppressionRequest;
@class AWSIoTCreateAuditSuppressionResponse;
@class AWSIoTCreateAuthorizerRequest;
@class AWSIoTCreateAuthorizerResponse;
@class AWSIoTCreateBillingGroupRequest;
@class AWSIoTCreateBillingGroupResponse;
@class AWSIoTCreateCertificateFromCsrRequest;
@class AWSIoTCreateCertificateFromCsrResponse;
@class AWSIoTCreateCustomMetricRequest;
@class AWSIoTCreateCustomMetricResponse;
@class AWSIoTCreateDimensionRequest;
@class AWSIoTCreateDimensionResponse;
@class AWSIoTCreateDomainConfigurationRequest;
@class AWSIoTCreateDomainConfigurationResponse;
@class AWSIoTCreateDynamicThingGroupRequest;
@class AWSIoTCreateDynamicThingGroupResponse;
@class AWSIoTCreateFleetMetricRequest;
@class AWSIoTCreateFleetMetricResponse;
@class AWSIoTCreateJobRequest;
@class AWSIoTCreateJobResponse;
@class AWSIoTCreateJobTemplateRequest;
@class AWSIoTCreateJobTemplateResponse;
@class AWSIoTCreateKeysAndCertificateRequest;
@class AWSIoTCreateKeysAndCertificateResponse;
@class AWSIoTCreateMitigationActionRequest;
@class AWSIoTCreateMitigationActionResponse;
@class AWSIoTCreateOTAUpdateRequest;
@class AWSIoTCreateOTAUpdateResponse;
@class AWSIoTCreatePolicyRequest;
@class AWSIoTCreatePolicyResponse;
@class AWSIoTCreatePolicyVersionRequest;
@class AWSIoTCreatePolicyVersionResponse;
@class AWSIoTCreateProvisioningClaimRequest;
@class AWSIoTCreateProvisioningClaimResponse;
@class AWSIoTCreateProvisioningTemplateRequest;
@class AWSIoTCreateProvisioningTemplateResponse;
@class AWSIoTCreateProvisioningTemplateVersionRequest;
@class AWSIoTCreateProvisioningTemplateVersionResponse;
@class AWSIoTCreateRoleAliasRequest;
@class AWSIoTCreateRoleAliasResponse;
@class AWSIoTCreateScheduledAuditRequest;
@class AWSIoTCreateScheduledAuditResponse;
@class AWSIoTCreateSecurityProfileRequest;
@class AWSIoTCreateSecurityProfileResponse;
@class AWSIoTCreateStreamRequest;
@class AWSIoTCreateStreamResponse;
@class AWSIoTCreateThingGroupRequest;
@class AWSIoTCreateThingGroupResponse;
@class AWSIoTCreateThingRequest;
@class AWSIoTCreateThingResponse;
@class AWSIoTCreateThingTypeRequest;
@class AWSIoTCreateThingTypeResponse;
@class AWSIoTCreateTopicRuleDestinationRequest;
@class AWSIoTCreateTopicRuleDestinationResponse;
@class AWSIoTCreateTopicRuleRequest;
@class AWSIoTCustomCodeSigning;
@class AWSIoTDeleteAccountAuditConfigurationRequest;
@class AWSIoTDeleteAccountAuditConfigurationResponse;
@class AWSIoTDeleteAuditSuppressionRequest;
@class AWSIoTDeleteAuditSuppressionResponse;
@class AWSIoTDeleteAuthorizerRequest;
@class AWSIoTDeleteAuthorizerResponse;
@class AWSIoTDeleteBillingGroupRequest;
@class AWSIoTDeleteBillingGroupResponse;
@class AWSIoTDeleteCACertificateRequest;
@class AWSIoTDeleteCACertificateResponse;
@class AWSIoTDeleteCertificateRequest;
@class AWSIoTDeleteCustomMetricRequest;
@class AWSIoTDeleteCustomMetricResponse;
@class AWSIoTDeleteDimensionRequest;
@class AWSIoTDeleteDimensionResponse;
@class AWSIoTDeleteDomainConfigurationRequest;
@class AWSIoTDeleteDomainConfigurationResponse;
@class AWSIoTDeleteDynamicThingGroupRequest;
@class AWSIoTDeleteDynamicThingGroupResponse;
@class AWSIoTDeleteFleetMetricRequest;
@class AWSIoTDeleteJobExecutionRequest;
@class AWSIoTDeleteJobRequest;
@class AWSIoTDeleteJobTemplateRequest;
@class AWSIoTDeleteMitigationActionRequest;
@class AWSIoTDeleteMitigationActionResponse;
@class AWSIoTDeleteOTAUpdateRequest;
@class AWSIoTDeleteOTAUpdateResponse;
@class AWSIoTDeletePolicyRequest;
@class AWSIoTDeletePolicyVersionRequest;
@class AWSIoTDeleteProvisioningTemplateRequest;
@class AWSIoTDeleteProvisioningTemplateResponse;
@class AWSIoTDeleteProvisioningTemplateVersionRequest;
@class AWSIoTDeleteProvisioningTemplateVersionResponse;
@class AWSIoTDeleteRegistrationCodeRequest;
@class AWSIoTDeleteRegistrationCodeResponse;
@class AWSIoTDeleteRoleAliasRequest;
@class AWSIoTDeleteRoleAliasResponse;
@class AWSIoTDeleteScheduledAuditRequest;
@class AWSIoTDeleteScheduledAuditResponse;
@class AWSIoTDeleteSecurityProfileRequest;
@class AWSIoTDeleteSecurityProfileResponse;
@class AWSIoTDeleteStreamRequest;
@class AWSIoTDeleteStreamResponse;
@class AWSIoTDeleteThingGroupRequest;
@class AWSIoTDeleteThingGroupResponse;
@class AWSIoTDeleteThingRequest;
@class AWSIoTDeleteThingResponse;
@class AWSIoTDeleteThingTypeRequest;
@class AWSIoTDeleteThingTypeResponse;
@class AWSIoTDeleteTopicRuleDestinationRequest;
@class AWSIoTDeleteTopicRuleDestinationResponse;
@class AWSIoTDeleteTopicRuleRequest;
@class AWSIoTDeleteV2LoggingLevelRequest;
@class AWSIoTDenied;
@class AWSIoTDeprecateThingTypeRequest;
@class AWSIoTDeprecateThingTypeResponse;
@class AWSIoTDescribeAccountAuditConfigurationRequest;
@class AWSIoTDescribeAccountAuditConfigurationResponse;
@class AWSIoTDescribeAuditFindingRequest;
@class AWSIoTDescribeAuditFindingResponse;
@class AWSIoTDescribeAuditMitigationActionsTaskRequest;
@class AWSIoTDescribeAuditMitigationActionsTaskResponse;
@class AWSIoTDescribeAuditSuppressionRequest;
@class AWSIoTDescribeAuditSuppressionResponse;
@class AWSIoTDescribeAuditTaskRequest;
@class AWSIoTDescribeAuditTaskResponse;
@class AWSIoTDescribeAuthorizerRequest;
@class AWSIoTDescribeAuthorizerResponse;
@class AWSIoTDescribeBillingGroupRequest;
@class AWSIoTDescribeBillingGroupResponse;
@class AWSIoTDescribeCACertificateRequest;
@class AWSIoTDescribeCACertificateResponse;
@class AWSIoTDescribeCertificateRequest;
@class AWSIoTDescribeCertificateResponse;
@class AWSIoTDescribeCustomMetricRequest;
@class AWSIoTDescribeCustomMetricResponse;
@class AWSIoTDescribeDefaultAuthorizerRequest;
@class AWSIoTDescribeDefaultAuthorizerResponse;
@class AWSIoTDescribeDetectMitigationActionsTaskRequest;
@class AWSIoTDescribeDetectMitigationActionsTaskResponse;
@class AWSIoTDescribeDimensionRequest;
@class AWSIoTDescribeDimensionResponse;
@class AWSIoTDescribeDomainConfigurationRequest;
@class AWSIoTDescribeDomainConfigurationResponse;
@class AWSIoTDescribeEndpointRequest;
@class AWSIoTDescribeEndpointResponse;
@class AWSIoTDescribeEventConfigurationsRequest;
@class AWSIoTDescribeEventConfigurationsResponse;
@class AWSIoTDescribeFleetMetricRequest;
@class AWSIoTDescribeFleetMetricResponse;
@class AWSIoTDescribeIndexRequest;
@class AWSIoTDescribeIndexResponse;
@class AWSIoTDescribeJobExecutionRequest;
@class AWSIoTDescribeJobExecutionResponse;
@class AWSIoTDescribeJobRequest;
@class AWSIoTDescribeJobResponse;
@class AWSIoTDescribeJobTemplateRequest;
@class AWSIoTDescribeJobTemplateResponse;
@class AWSIoTDescribeManagedJobTemplateRequest;
@class AWSIoTDescribeManagedJobTemplateResponse;
@class AWSIoTDescribeMitigationActionRequest;
@class AWSIoTDescribeMitigationActionResponse;
@class AWSIoTDescribeProvisioningTemplateRequest;
@class AWSIoTDescribeProvisioningTemplateResponse;
@class AWSIoTDescribeProvisioningTemplateVersionRequest;
@class AWSIoTDescribeProvisioningTemplateVersionResponse;
@class AWSIoTDescribeRoleAliasRequest;
@class AWSIoTDescribeRoleAliasResponse;
@class AWSIoTDescribeScheduledAuditRequest;
@class AWSIoTDescribeScheduledAuditResponse;
@class AWSIoTDescribeSecurityProfileRequest;
@class AWSIoTDescribeSecurityProfileResponse;
@class AWSIoTDescribeStreamRequest;
@class AWSIoTDescribeStreamResponse;
@class AWSIoTDescribeThingGroupRequest;
@class AWSIoTDescribeThingGroupResponse;
@class AWSIoTDescribeThingRegistrationTaskRequest;
@class AWSIoTDescribeThingRegistrationTaskResponse;
@class AWSIoTDescribeThingRequest;
@class AWSIoTDescribeThingResponse;
@class AWSIoTDescribeThingTypeRequest;
@class AWSIoTDescribeThingTypeResponse;
@class AWSIoTDestination;
@class AWSIoTDetachPolicyRequest;
@class AWSIoTDetachPrincipalPolicyRequest;
@class AWSIoTDetachSecurityProfileRequest;
@class AWSIoTDetachSecurityProfileResponse;
@class AWSIoTDetachThingPrincipalRequest;
@class AWSIoTDetachThingPrincipalResponse;
@class AWSIoTDetectMitigationActionExecution;
@class AWSIoTDetectMitigationActionsTaskStatistics;
@class AWSIoTDetectMitigationActionsTaskSummary;
@class AWSIoTDetectMitigationActionsTaskTarget;
@class AWSIoTDisableTopicRuleRequest;
@class AWSIoTDocumentParameter;
@class AWSIoTDomainConfigurationSummary;
@class AWSIoTDynamoDBAction;
@class AWSIoTDynamoDBv2Action;
@class AWSIoTEffectivePolicy;
@class AWSIoTElasticsearchAction;
@class AWSIoTEnableIoTLoggingParams;
@class AWSIoTEnableTopicRuleRequest;
@class AWSIoTErrorInfo;
@class AWSIoTExplicitDeny;
@class AWSIoTExponentialRolloutRate;
@class AWSIoTField;
@class AWSIoTFileLocation;
@class AWSIoTFirehoseAction;
@class AWSIoTFleetMetricNameAndArn;
@class AWSIoTGetBehaviorModelTrainingSummariesRequest;
@class AWSIoTGetBehaviorModelTrainingSummariesResponse;
@class AWSIoTGetBucketsAggregationRequest;
@class AWSIoTGetBucketsAggregationResponse;
@class AWSIoTGetCardinalityRequest;
@class AWSIoTGetCardinalityResponse;
@class AWSIoTGetEffectivePoliciesRequest;
@class AWSIoTGetEffectivePoliciesResponse;
@class AWSIoTGetIndexingConfigurationRequest;
@class AWSIoTGetIndexingConfigurationResponse;
@class AWSIoTGetJobDocumentRequest;
@class AWSIoTGetJobDocumentResponse;
@class AWSIoTGetLoggingOptionsRequest;
@class AWSIoTGetLoggingOptionsResponse;
@class AWSIoTGetOTAUpdateRequest;
@class AWSIoTGetOTAUpdateResponse;
@class AWSIoTGetPercentilesRequest;
@class AWSIoTGetPercentilesResponse;
@class AWSIoTGetPolicyRequest;
@class AWSIoTGetPolicyResponse;
@class AWSIoTGetPolicyVersionRequest;
@class AWSIoTGetPolicyVersionResponse;
@class AWSIoTGetRegistrationCodeRequest;
@class AWSIoTGetRegistrationCodeResponse;
@class AWSIoTGetStatisticsRequest;
@class AWSIoTGetStatisticsResponse;
@class AWSIoTGetTopicRuleDestinationRequest;
@class AWSIoTGetTopicRuleDestinationResponse;
@class AWSIoTGetTopicRuleRequest;
@class AWSIoTGetTopicRuleResponse;
@class AWSIoTGetV2LoggingOptionsRequest;
@class AWSIoTGetV2LoggingOptionsResponse;
@class AWSIoTGroupNameAndArn;
@class AWSIoTHttpAction;
@class AWSIoTHttpActionHeader;
@class AWSIoTHttpAuthorization;
@class AWSIoTHttpContext;
@class AWSIoTHttpUrlDestinationConfiguration;
@class AWSIoTHttpUrlDestinationProperties;
@class AWSIoTHttpUrlDestinationSummary;
@class AWSIoTImplicitDeny;
@class AWSIoTIndexingFilter;
@class AWSIoTIotAnalyticsAction;
@class AWSIoTIotEventsAction;
@class AWSIoTIotSiteWiseAction;
@class AWSIoTJob;
@class AWSIoTJobExecution;
@class AWSIoTJobExecutionStatusDetails;
@class AWSIoTJobExecutionSummary;
@class AWSIoTJobExecutionSummaryForJob;
@class AWSIoTJobExecutionSummaryForThing;
@class AWSIoTJobExecutionsRetryConfig;
@class AWSIoTJobExecutionsRolloutConfig;
@class AWSIoTJobProcessDetails;
@class AWSIoTJobSummary;
@class AWSIoTJobTemplateSummary;
@class AWSIoTKafkaAction;
@class AWSIoTKeyPair;
@class AWSIoTKinesisAction;
@class AWSIoTLambdaAction;
@class AWSIoTListActiveViolationsRequest;
@class AWSIoTListActiveViolationsResponse;
@class AWSIoTListAttachedPoliciesRequest;
@class AWSIoTListAttachedPoliciesResponse;
@class AWSIoTListAuditFindingsRequest;
@class AWSIoTListAuditFindingsResponse;
@class AWSIoTListAuditMitigationActionsExecutionsRequest;
@class AWSIoTListAuditMitigationActionsExecutionsResponse;
@class AWSIoTListAuditMitigationActionsTasksRequest;
@class AWSIoTListAuditMitigationActionsTasksResponse;
@class AWSIoTListAuditSuppressionsRequest;
@class AWSIoTListAuditSuppressionsResponse;
@class AWSIoTListAuditTasksRequest;
@class AWSIoTListAuditTasksResponse;
@class AWSIoTListAuthorizersRequest;
@class AWSIoTListAuthorizersResponse;
@class AWSIoTListBillingGroupsRequest;
@class AWSIoTListBillingGroupsResponse;
@class AWSIoTListCACertificatesRequest;
@class AWSIoTListCACertificatesResponse;
@class AWSIoTListCertificatesByCARequest;
@class AWSIoTListCertificatesByCAResponse;
@class AWSIoTListCertificatesRequest;
@class AWSIoTListCertificatesResponse;
@class AWSIoTListCustomMetricsRequest;
@class AWSIoTListCustomMetricsResponse;
@class AWSIoTListDetectMitigationActionsExecutionsRequest;
@class AWSIoTListDetectMitigationActionsExecutionsResponse;
@class AWSIoTListDetectMitigationActionsTasksRequest;
@class AWSIoTListDetectMitigationActionsTasksResponse;
@class AWSIoTListDimensionsRequest;
@class AWSIoTListDimensionsResponse;
@class AWSIoTListDomainConfigurationsRequest;
@class AWSIoTListDomainConfigurationsResponse;
@class AWSIoTListFleetMetricsRequest;
@class AWSIoTListFleetMetricsResponse;
@class AWSIoTListIndicesRequest;
@class AWSIoTListIndicesResponse;
@class AWSIoTListJobExecutionsForJobRequest;
@class AWSIoTListJobExecutionsForJobResponse;
@class AWSIoTListJobExecutionsForThingRequest;
@class AWSIoTListJobExecutionsForThingResponse;
@class AWSIoTListJobTemplatesRequest;
@class AWSIoTListJobTemplatesResponse;
@class AWSIoTListJobsRequest;
@class AWSIoTListJobsResponse;
@class AWSIoTListManagedJobTemplatesRequest;
@class AWSIoTListManagedJobTemplatesResponse;
@class AWSIoTListMetricValuesRequest;
@class AWSIoTListMetricValuesResponse;
@class AWSIoTListMitigationActionsRequest;
@class AWSIoTListMitigationActionsResponse;
@class AWSIoTListOTAUpdatesRequest;
@class AWSIoTListOTAUpdatesResponse;
@class AWSIoTListOutgoingCertificatesRequest;
@class AWSIoTListOutgoingCertificatesResponse;
@class AWSIoTListPoliciesRequest;
@class AWSIoTListPoliciesResponse;
@class AWSIoTListPolicyPrincipalsRequest;
@class AWSIoTListPolicyPrincipalsResponse;
@class AWSIoTListPolicyVersionsRequest;
@class AWSIoTListPolicyVersionsResponse;
@class AWSIoTListPrincipalPoliciesRequest;
@class AWSIoTListPrincipalPoliciesResponse;
@class AWSIoTListPrincipalThingsRequest;
@class AWSIoTListPrincipalThingsResponse;
@class AWSIoTListProvisioningTemplateVersionsRequest;
@class AWSIoTListProvisioningTemplateVersionsResponse;
@class AWSIoTListProvisioningTemplatesRequest;
@class AWSIoTListProvisioningTemplatesResponse;
@class AWSIoTListRoleAliasesRequest;
@class AWSIoTListRoleAliasesResponse;
@class AWSIoTListScheduledAuditsRequest;
@class AWSIoTListScheduledAuditsResponse;
@class AWSIoTListSecurityProfilesForTargetRequest;
@class AWSIoTListSecurityProfilesForTargetResponse;
@class AWSIoTListSecurityProfilesRequest;
@class AWSIoTListSecurityProfilesResponse;
@class AWSIoTListStreamsRequest;
@class AWSIoTListStreamsResponse;
@class AWSIoTListTagsForResourceRequest;
@class AWSIoTListTagsForResourceResponse;
@class AWSIoTListTargetsForPolicyRequest;
@class AWSIoTListTargetsForPolicyResponse;
@class AWSIoTListTargetsForSecurityProfileRequest;
@class AWSIoTListTargetsForSecurityProfileResponse;
@class AWSIoTListThingGroupsForThingRequest;
@class AWSIoTListThingGroupsForThingResponse;
@class AWSIoTListThingGroupsRequest;
@class AWSIoTListThingGroupsResponse;
@class AWSIoTListThingPrincipalsRequest;
@class AWSIoTListThingPrincipalsResponse;
@class AWSIoTListThingRegistrationTaskReportsRequest;
@class AWSIoTListThingRegistrationTaskReportsResponse;
@class AWSIoTListThingRegistrationTasksRequest;
@class AWSIoTListThingRegistrationTasksResponse;
@class AWSIoTListThingTypesRequest;
@class AWSIoTListThingTypesResponse;
@class AWSIoTListThingsInBillingGroupRequest;
@class AWSIoTListThingsInBillingGroupResponse;
@class AWSIoTListThingsInThingGroupRequest;
@class AWSIoTListThingsInThingGroupResponse;
@class AWSIoTListThingsRequest;
@class AWSIoTListThingsResponse;
@class AWSIoTListTopicRuleDestinationsRequest;
@class AWSIoTListTopicRuleDestinationsResponse;
@class AWSIoTListTopicRulesRequest;
@class AWSIoTListTopicRulesResponse;
@class AWSIoTListV2LoggingLevelsRequest;
@class AWSIoTListV2LoggingLevelsResponse;
@class AWSIoTListViolationEventsRequest;
@class AWSIoTListViolationEventsResponse;
@class AWSIoTLogTarget;
@class AWSIoTLogTargetConfiguration;
@class AWSIoTLoggingOptionsPayload;
@class AWSIoTMachineLearningDetectionConfig;
@class AWSIoTManagedJobTemplateSummary;
@class AWSIoTMetricDatum;
@class AWSIoTMetricDimension;
@class AWSIoTMetricToRetain;
@class AWSIoTMetricValue;
@class AWSIoTMitigationAction;
@class AWSIoTMitigationActionIdentifier;
@class AWSIoTMitigationActionParams;
@class AWSIoTMqttContext;
@class AWSIoTNonCompliantResource;
@class AWSIoTOTAUpdateFile;
@class AWSIoTOTAUpdateInfo;
@class AWSIoTOTAUpdateSummary;
@class AWSIoTOpenSearchAction;
@class AWSIoTOutgoingCertificate;
@class AWSIoTPercentPair;
@class AWSIoTPolicy;
@class AWSIoTPolicyVersion;
@class AWSIoTPolicyVersionIdentifier;
@class AWSIoTPresignedUrlConfig;
@class AWSIoTProvisioningHook;
@class AWSIoTProvisioningTemplateSummary;
@class AWSIoTProvisioningTemplateVersionSummary;
@class AWSIoTPublishFindingToSnsParams;
@class AWSIoTPutAssetPropertyValueEntry;
@class AWSIoTPutItemInput;
@class AWSIoTPutVerificationStateOnViolationRequest;
@class AWSIoTPutVerificationStateOnViolationResponse;
@class AWSIoTRateIncreaseCriteria;
@class AWSIoTRegisterCACertificateRequest;
@class AWSIoTRegisterCACertificateResponse;
@class AWSIoTRegisterCertificateRequest;
@class AWSIoTRegisterCertificateResponse;
@class AWSIoTRegisterCertificateWithoutCARequest;
@class AWSIoTRegisterCertificateWithoutCAResponse;
@class AWSIoTRegisterThingRequest;
@class AWSIoTRegisterThingResponse;
@class AWSIoTRegistrationConfig;
@class AWSIoTRejectCertificateTransferRequest;
@class AWSIoTRelatedResource;
@class AWSIoTRemoveThingFromBillingGroupRequest;
@class AWSIoTRemoveThingFromBillingGroupResponse;
@class AWSIoTRemoveThingFromThingGroupRequest;
@class AWSIoTRemoveThingFromThingGroupResponse;
@class AWSIoTReplaceDefaultPolicyVersionParams;
@class AWSIoTReplaceTopicRuleRequest;
@class AWSIoTRepublishAction;
@class AWSIoTResourceIdentifier;
@class AWSIoTRetryCriteria;
@class AWSIoTRoleAliasDescription;
@class AWSIoTS3Action;
@class AWSIoTS3Destination;
@class AWSIoTS3Location;
@class AWSIoTSalesforceAction;
@class AWSIoTScheduledAuditMetadata;
@class AWSIoTSearchIndexRequest;
@class AWSIoTSearchIndexResponse;
@class AWSIoTSecurityProfileIdentifier;
@class AWSIoTSecurityProfileTarget;
@class AWSIoTSecurityProfileTargetMapping;
@class AWSIoTServerCertificateSummary;
@class AWSIoTSetDefaultAuthorizerRequest;
@class AWSIoTSetDefaultAuthorizerResponse;
@class AWSIoTSetDefaultPolicyVersionRequest;
@class AWSIoTSetLoggingOptionsRequest;
@class AWSIoTSetV2LoggingLevelRequest;
@class AWSIoTSetV2LoggingOptionsRequest;
@class AWSIoTSigV4Authorization;
@class AWSIoTSigningProfileParameter;
@class AWSIoTSnsAction;
@class AWSIoTSqsAction;
@class AWSIoTStartAuditMitigationActionsTaskRequest;
@class AWSIoTStartAuditMitigationActionsTaskResponse;
@class AWSIoTStartDetectMitigationActionsTaskRequest;
@class AWSIoTStartDetectMitigationActionsTaskResponse;
@class AWSIoTStartOnDemandAuditTaskRequest;
@class AWSIoTStartOnDemandAuditTaskResponse;
@class AWSIoTStartSigningJobParameter;
@class AWSIoTStartThingRegistrationTaskRequest;
@class AWSIoTStartThingRegistrationTaskResponse;
@class AWSIoTStatisticalThreshold;
@class AWSIoTStatistics;
@class AWSIoTStepFunctionsAction;
@class AWSIoTStopThingRegistrationTaskRequest;
@class AWSIoTStopThingRegistrationTaskResponse;
@class AWSIoTStream;
@class AWSIoTStreamFile;
@class AWSIoTStreamInfo;
@class AWSIoTStreamSummary;
@class AWSIoTTag;
@class AWSIoTTagResourceRequest;
@class AWSIoTTagResourceResponse;
@class AWSIoTTaskStatistics;
@class AWSIoTTaskStatisticsForAuditCheck;
@class AWSIoTTermsAggregation;
@class AWSIoTTestAuthorizationRequest;
@class AWSIoTTestAuthorizationResponse;
@class AWSIoTTestInvokeAuthorizerRequest;
@class AWSIoTTestInvokeAuthorizerResponse;
@class AWSIoTThingAttribute;
@class AWSIoTThingConnectivity;
@class AWSIoTThingDocument;
@class AWSIoTThingGroupDocument;
@class AWSIoTThingGroupIndexingConfiguration;
@class AWSIoTThingGroupMetadata;
@class AWSIoTThingGroupProperties;
@class AWSIoTThingIndexingConfiguration;
@class AWSIoTThingTypeDefinition;
@class AWSIoTThingTypeMetadata;
@class AWSIoTThingTypeProperties;
@class AWSIoTTimeoutConfig;
@class AWSIoTTimestreamAction;
@class AWSIoTTimestreamDimension;
@class AWSIoTTimestreamTimestamp;
@class AWSIoTTlsContext;
@class AWSIoTTopicRule;
@class AWSIoTTopicRuleDestination;
@class AWSIoTTopicRuleDestinationConfiguration;
@class AWSIoTTopicRuleDestinationSummary;
@class AWSIoTTopicRuleListItem;
@class AWSIoTTopicRulePayload;
@class AWSIoTTransferCertificateRequest;
@class AWSIoTTransferCertificateResponse;
@class AWSIoTTransferData;
@class AWSIoTUntagResourceRequest;
@class AWSIoTUntagResourceResponse;
@class AWSIoTUpdateAccountAuditConfigurationRequest;
@class AWSIoTUpdateAccountAuditConfigurationResponse;
@class AWSIoTUpdateAuditSuppressionRequest;
@class AWSIoTUpdateAuditSuppressionResponse;
@class AWSIoTUpdateAuthorizerRequest;
@class AWSIoTUpdateAuthorizerResponse;
@class AWSIoTUpdateBillingGroupRequest;
@class AWSIoTUpdateBillingGroupResponse;
@class AWSIoTUpdateCACertificateParams;
@class AWSIoTUpdateCACertificateRequest;
@class AWSIoTUpdateCertificateRequest;
@class AWSIoTUpdateCustomMetricRequest;
@class AWSIoTUpdateCustomMetricResponse;
@class AWSIoTUpdateDeviceCertificateParams;
@class AWSIoTUpdateDimensionRequest;
@class AWSIoTUpdateDimensionResponse;
@class AWSIoTUpdateDomainConfigurationRequest;
@class AWSIoTUpdateDomainConfigurationResponse;
@class AWSIoTUpdateDynamicThingGroupRequest;
@class AWSIoTUpdateDynamicThingGroupResponse;
@class AWSIoTUpdateEventConfigurationsRequest;
@class AWSIoTUpdateEventConfigurationsResponse;
@class AWSIoTUpdateFleetMetricRequest;
@class AWSIoTUpdateIndexingConfigurationRequest;
@class AWSIoTUpdateIndexingConfigurationResponse;
@class AWSIoTUpdateJobRequest;
@class AWSIoTUpdateMitigationActionRequest;
@class AWSIoTUpdateMitigationActionResponse;
@class AWSIoTUpdateProvisioningTemplateRequest;
@class AWSIoTUpdateProvisioningTemplateResponse;
@class AWSIoTUpdateRoleAliasRequest;
@class AWSIoTUpdateRoleAliasResponse;
@class AWSIoTUpdateScheduledAuditRequest;
@class AWSIoTUpdateScheduledAuditResponse;
@class AWSIoTUpdateSecurityProfileRequest;
@class AWSIoTUpdateSecurityProfileResponse;
@class AWSIoTUpdateStreamRequest;
@class AWSIoTUpdateStreamResponse;
@class AWSIoTUpdateThingGroupRequest;
@class AWSIoTUpdateThingGroupResponse;
@class AWSIoTUpdateThingGroupsForThingRequest;
@class AWSIoTUpdateThingGroupsForThingResponse;
@class AWSIoTUpdateThingRequest;
@class AWSIoTUpdateThingResponse;
@class AWSIoTUpdateTopicRuleDestinationRequest;
@class AWSIoTUpdateTopicRuleDestinationResponse;
@class AWSIoTValidateSecurityProfileBehaviorsRequest;
@class AWSIoTValidateSecurityProfileBehaviorsResponse;
@class AWSIoTValidationError;
@class AWSIoTViolationEvent;
@class AWSIoTViolationEventAdditionalInfo;
@class AWSIoTViolationEventOccurrenceRange;
@class AWSIoTVpcDestinationConfiguration;
@class AWSIoTVpcDestinationProperties;
@class AWSIoTVpcDestinationSummary;

/**
 <p>The criteria that determine when and how a job abort takes place.</p>
 Required parameters: [criteriaList]
 */
@interface AWSIoTAbortConfig : AWSModel


/**
 <p>The list of criteria that determine when and how to abort the job.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTAbortCriteria *> * _Nullable criteriaList;

@end

/**
 <p>The criteria that determine when and how a job abort takes place.</p>
 Required parameters: [failureType, action, thresholdPercentage, minNumberOfExecutedThings]
 */
@interface AWSIoTAbortCriteria : AWSModel


/**
 <p>The type of job action to take to initiate the job abort.</p>
 */
@property (nonatomic, assign) AWSIoTAbortAction action;

/**
 <p>The type of job execution failures that can initiate a job abort.</p>
 */
@property (nonatomic, assign) AWSIoTJobExecutionFailureType failureType;

/**
 <p>The minimum number of things which must receive job execution notifications before the job can be aborted.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable minNumberOfExecutedThings;

/**
 <p>The minimum percentage of job execution failures that must occur to initiate the job abort.</p><p>Amazon Web Services IoT Core supports up to two digits after the decimal (for example, 10.9 and 10.99, but not 10.999).</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable thresholdPercentage;

@end

/**
 <p>The input for the AcceptCertificateTransfer operation.</p>
 Required parameters: [certificateId]
 */
@interface AWSIoTAcceptCertificateTransferRequest : AWSRequest


/**
 <p>The ID of the certificate. (The last part of the certificate ARN contains the certificate ID.)</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificateId;

/**
 <p>Specifies whether the certificate is active.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable setAsActive;

@end

/**
 <p>Describes the actions associated with a rule.</p>
 */
@interface AWSIoTAction : AWSModel


/**
 <p>Change the state of a CloudWatch alarm.</p>
 */
@property (nonatomic, strong) AWSIoTCloudwatchAlarmAction * _Nullable cloudwatchAlarm;

/**
 <p>Send data to CloudWatch Logs.</p>
 */
@property (nonatomic, strong) AWSIoTCloudwatchLogsAction * _Nullable cloudwatchLogs;

/**
 <p>Capture a CloudWatch metric.</p>
 */
@property (nonatomic, strong) AWSIoTCloudwatchMetricAction * _Nullable cloudwatchMetric;

/**
 <p>Write to a DynamoDB table.</p>
 */
@property (nonatomic, strong) AWSIoTDynamoDBAction * _Nullable dynamoDB;

/**
 <p>Write to a DynamoDB table. This is a new version of the DynamoDB action. It allows you to write each attribute in an MQTT message payload into a separate DynamoDB column.</p>
 */
@property (nonatomic, strong) AWSIoTDynamoDBv2Action * _Nullable dynamoDBv2;

/**
 <p>Write data to an Amazon OpenSearch Service domain.</p><note><p>The <code>Elasticsearch</code> action can only be used by existing rule actions. To create a new rule action or to update an existing rule action, use the <code>OpenSearch</code> rule action instead. For more information, see <a href="https://docs.aws.amazon.com/iot/latest/apireference/API_OpenSearchAction.html">OpenSearchAction</a>.</p></note>
 */
@property (nonatomic, strong) AWSIoTElasticsearchAction * _Nullable elasticsearch;

/**
 <p>Write to an Amazon Kinesis Firehose stream.</p>
 */
@property (nonatomic, strong) AWSIoTFirehoseAction * _Nullable firehose;

/**
 <p>Send data to an HTTPS endpoint.</p>
 */
@property (nonatomic, strong) AWSIoTHttpAction * _Nullable http;

/**
 <p>Sends message data to an IoT Analytics channel.</p>
 */
@property (nonatomic, strong) AWSIoTIotAnalyticsAction * _Nullable iotAnalytics;

/**
 <p>Sends an input to an IoT Events detector.</p>
 */
@property (nonatomic, strong) AWSIoTIotEventsAction * _Nullable iotEvents;

/**
 <p>Sends data from the MQTT message that triggered the rule to IoT SiteWise asset properties.</p>
 */
@property (nonatomic, strong) AWSIoTIotSiteWiseAction * _Nullable iotSiteWise;

/**
 <p>Send messages to an Amazon Managed Streaming for Apache Kafka (Amazon MSK) or self-managed Apache Kafka cluster.</p>
 */
@property (nonatomic, strong) AWSIoTKafkaAction * _Nullable kafka;

/**
 <p>Write data to an Amazon Kinesis stream.</p>
 */
@property (nonatomic, strong) AWSIoTKinesisAction * _Nullable kinesis;

/**
 <p>Invoke a Lambda function.</p>
 */
@property (nonatomic, strong) AWSIoTLambdaAction * _Nullable lambda;

/**
 <p>Write data to an Amazon OpenSearch Service domain.</p>
 */
@property (nonatomic, strong) AWSIoTOpenSearchAction * _Nullable openSearch;

/**
 <p>Publish to another MQTT topic.</p>
 */
@property (nonatomic, strong) AWSIoTRepublishAction * _Nullable republish;

/**
 <p>Write to an Amazon S3 bucket.</p>
 */
@property (nonatomic, strong) AWSIoTS3Action * _Nullable s3;

/**
 <p>Send a message to a Salesforce IoT Cloud Input Stream.</p>
 */
@property (nonatomic, strong) AWSIoTSalesforceAction * _Nullable salesforce;

/**
 <p>Publish to an Amazon SNS topic.</p>
 */
@property (nonatomic, strong) AWSIoTSnsAction * _Nullable sns;

/**
 <p>Publish to an Amazon SQS queue.</p>
 */
@property (nonatomic, strong) AWSIoTSqsAction * _Nullable sqs;

/**
 <p>Starts execution of a Step Functions state machine.</p>
 */
@property (nonatomic, strong) AWSIoTStepFunctionsAction * _Nullable stepFunctions;

/**
 <p>The Timestream rule action writes attributes (measures) from an MQTT message into an Amazon Timestream table. For more information, see the <a href="https://docs.aws.amazon.com/iot/latest/developerguide/timestream-rule-action.html">Timestream</a> topic rule action documentation.</p>
 */
@property (nonatomic, strong) AWSIoTTimestreamAction * _Nullable timestream;

@end

/**
 <p>Information about an active Device Defender security profile behavior violation.</p>
 */
@interface AWSIoTActiveViolation : AWSModel


/**
 <p>The behavior that is being violated.</p>
 */
@property (nonatomic, strong) AWSIoTBehavior * _Nullable behavior;

/**
 <p>The time the most recent violation occurred.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastViolationTime;

/**
 <p>The value of the metric (the measurement) that caused the most recent violation.</p>
 */
@property (nonatomic, strong) AWSIoTMetricValue * _Nullable lastViolationValue;

/**
 <p>The security profile with the behavior is in violation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable securityProfileName;

/**
 <p>The name of the thing responsible for the active violation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingName;

/**
 <p>The verification state of the violation (detect alarm).</p>
 */
@property (nonatomic, assign) AWSIoTVerificationState verificationState;

/**
 <p>The description of the verification state of the violation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable verificationStateDescription;

/**
 <p> The details of a violation event. </p>
 */
@property (nonatomic, strong) AWSIoTViolationEventAdditionalInfo * _Nullable violationEventAdditionalInfo;

/**
 <p>The ID of the active violation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable violationId;

/**
 <p>The time the violation started.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable violationStartTime;

@end

/**
 
 */
@interface AWSIoTAddThingToBillingGroupRequest : AWSRequest


/**
 <p>The ARN of the billing group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable billingGroupArn;

/**
 <p>The name of the billing group.</p><note><p>This call is asynchronous. It might take several seconds for the detachment to propagate.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable billingGroupName;

/**
 <p>The ARN of the thing to be added to the billing group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingArn;

/**
 <p>The name of the thing to be added to the billing group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingName;

@end

/**
 
 */
@interface AWSIoTAddThingToBillingGroupResponse : AWSModel


@end

/**
 
 */
@interface AWSIoTAddThingToThingGroupRequest : AWSRequest


/**
 <p>Override dynamic thing groups with static thing groups when 10-group limit is reached. If a thing belongs to 10 thing groups, and one or more of those groups are dynamic thing groups, adding a thing to a static group removes the thing from the last dynamic group.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable overrideDynamicGroups;

/**
 <p>The ARN of the thing to add to a group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingArn;

/**
 <p>The ARN of the group to which you are adding a thing.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingGroupArn;

/**
 <p>The name of the group to which you are adding a thing.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingGroupName;

/**
 <p>The name of the thing to add to a group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingName;

@end

/**
 
 */
@interface AWSIoTAddThingToThingGroupResponse : AWSModel


@end

/**
 <p>Parameters used when defining a mitigation action that move a set of things to a thing group.</p>
 Required parameters: [thingGroupNames]
 */
@interface AWSIoTAddThingsToThingGroupParams : AWSModel


/**
 <p>Specifies if this mitigation action can move the things that triggered the mitigation action even if they are part of one or more dynamic thing groups.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable overrideDynamicGroups;

/**
 <p>The list of groups to which you want to add the things that triggered the mitigation action. You can add a thing to a maximum of 10 groups, but you can't add a thing to more than one group in the same hierarchy.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable thingGroupNames;

@end

/**
 <p>The type of aggregation queries.</p>
 Required parameters: [name]
 */
@interface AWSIoTAggregationType : AWSModel


/**
 <p>The name of the aggregation type.</p>
 */
@property (nonatomic, assign) AWSIoTAggregationTypeName name;

/**
 <p>A list of the values of aggregation types.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable values;

@end

/**
 <p>A structure containing the alert target ARN and the role ARN.</p>
 Required parameters: [alertTargetArn, roleArn]
 */
@interface AWSIoTAlertTarget : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the notification target to which alerts are sent.</p>
 */
@property (nonatomic, strong) NSString * _Nullable alertTargetArn;

/**
 <p>The ARN of the role that grants permission to send alerts to the notification target.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

@end

/**
 <p>Contains information that allowed the authorization.</p>
 */
@interface AWSIoTAllowed : AWSModel


/**
 <p>A list of policies that allowed the authentication.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTPolicy *> * _Nullable policies;

@end

/**
 <p>An asset property timestamp entry containing the following information.</p>
 Required parameters: [timeInSeconds]
 */
@interface AWSIoTAssetPropertyTimestamp : AWSModel


/**
 <p>Optional. A string that contains the nanosecond time offset. Accepts substitution templates.</p>
 */
@property (nonatomic, strong) NSString * _Nullable offsetInNanos;

/**
 <p>A string that contains the time in seconds since epoch. Accepts substitution templates.</p>
 */
@property (nonatomic, strong) NSString * _Nullable timeInSeconds;

@end

/**
 <p>An asset property value entry containing the following information.</p>
 Required parameters: [value, timestamp]
 */
@interface AWSIoTAssetPropertyValue : AWSModel


/**
 <p>Optional. A string that describes the quality of the value. Accepts substitution templates. Must be <code>GOOD</code>, <code>BAD</code>, or <code>UNCERTAIN</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable quality;

/**
 <p>The asset property value timestamp.</p>
 */
@property (nonatomic, strong) AWSIoTAssetPropertyTimestamp * _Nullable timestamp;

/**
 <p>The value of the asset property.</p>
 */
@property (nonatomic, strong) AWSIoTAssetPropertyVariant * _Nullable value;

@end

/**
 <p>Contains an asset property value (of a single type).</p>
 */
@interface AWSIoTAssetPropertyVariant : AWSModel


/**
 <p>Optional. A string that contains the boolean value (<code>true</code> or <code>false</code>) of the value entry. Accepts substitution templates.</p>
 */
@property (nonatomic, strong) NSString * _Nullable booleanValueProperty;

/**
 <p>Optional. A string that contains the double value of the value entry. Accepts substitution templates.</p>
 */
@property (nonatomic, strong) NSString * _Nullable doubleValueProperty;

/**
 <p>Optional. A string that contains the integer value of the value entry. Accepts substitution templates.</p>
 */
@property (nonatomic, strong) NSString * _Nullable integerValueProperty;

/**
 <p>Optional. The string value of the value entry. Accepts substitution templates.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stringValueProperty;

@end

/**
 
 */
@interface AWSIoTAssociateTargetsWithJobRequest : AWSRequest


/**
 <p>An optional comment string describing why the job was associated with the targets.</p>
 */
@property (nonatomic, strong) NSString * _Nullable comment;

/**
 <p>The unique identifier you assigned to this job when it was created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

/**
 <p>The namespace used to indicate that a job is a customer-managed job.</p><p>When you specify a value for this parameter, Amazon Web Services IoT Core sends jobs notifications to MQTT topics that contain the value in the following format.</p><p><code>$aws/things/<i>THING_NAME</i>/jobs/<i>JOB_ID</i>/notify-namespace-<i>NAMESPACE_ID</i>/</code></p><note><p>The <code>namespaceId</code> feature is in public preview.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable namespaceId;

/**
 <p>A list of thing group ARNs that define the targets of the job.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable targets;

@end

/**
 
 */
@interface AWSIoTAssociateTargetsWithJobResponse : AWSModel


/**
 <p>A short text description of the job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>An ARN identifying the job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobArn;

/**
 <p>The unique identifier you assigned to this job when it was created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

@end

/**
 
 */
@interface AWSIoTAttachPolicyRequest : AWSRequest


/**
 <p>The name of the policy to attach.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyName;

/**
 <p>The <a href="https://docs.aws.amazon.com/iot/latest/developerguide/security-iam.html">identity</a> to which the policy is attached. For example, a thing group or a certificate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable target;

@end

/**
 <p>The input for the AttachPrincipalPolicy operation.</p>
 Required parameters: [policyName, principal]
 */
@interface AWSIoTAttachPrincipalPolicyRequest : AWSRequest


/**
 <p>The policy name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyName;

/**
 <p>The principal, which can be a certificate ARN (as returned from the CreateCertificate operation) or an Amazon Cognito ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable principal;

@end

/**
 
 */
@interface AWSIoTAttachSecurityProfileRequest : AWSRequest


/**
 <p>The security profile that is attached.</p>
 */
@property (nonatomic, strong) NSString * _Nullable securityProfileName;

/**
 <p>The ARN of the target (thing group) to which the security profile is attached.</p>
 */
@property (nonatomic, strong) NSString * _Nullable securityProfileTargetArn;

@end

/**
 
 */
@interface AWSIoTAttachSecurityProfileResponse : AWSModel


@end

/**
 <p>The input for the AttachThingPrincipal operation.</p>
 Required parameters: [thingName, principal]
 */
@interface AWSIoTAttachThingPrincipalRequest : AWSRequest


/**
 <p>The principal, which can be a certificate ARN (as returned from the CreateCertificate operation) or an Amazon Cognito ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable principal;

/**
 <p>The name of the thing.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingName;

@end

/**
 <p>The output from the AttachThingPrincipal operation.</p>
 */
@interface AWSIoTAttachThingPrincipalResponse : AWSModel


@end

/**
 <p>The attribute payload.</p>
 */
@interface AWSIoTAttributePayload : AWSModel


/**
 <p>A JSON string containing up to three key-value pair in JSON format. For example:</p><p><code>{\"attributes\":{\"string1\":\"string2\"}}</code></p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable attributes;

/**
 <p>Specifies whether the list of attributes provided in the <code>AttributePayload</code> is merged with the attributes stored in the registry, instead of overwriting them.</p><p>To remove an attribute, call <code>UpdateThing</code> with an empty attribute value.</p><note><p>The <code>merge</code> attribute is only valid when calling <code>UpdateThing</code> or <code>UpdateThingGroup</code>.</p></note>
 */
@property (nonatomic, strong) NSNumber * _Nullable merge;

@end

/**
 <p>Which audit checks are enabled and disabled for this account.</p>
 */
@interface AWSIoTAuditCheckConfiguration : AWSModel


/**
 <p>True if this audit check is enabled for this account.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

@end

/**
 <p>Information about the audit check.</p>
 */
@interface AWSIoTAuditCheckDetails : AWSModel


/**
 <p>True if the check is complete and found all resources compliant.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable checkCompliant;

/**
 <p>The completion status of this check. One of "IN_PROGRESS", "WAITING_FOR_DATA_COLLECTION", "CANCELED", "COMPLETED_COMPLIANT", "COMPLETED_NON_COMPLIANT", or "FAILED".</p>
 */
@property (nonatomic, assign) AWSIoTAuditCheckRunStatus checkRunStatus;

/**
 <p>The code of any error encountered when this check is performed during this audit. One of "INSUFFICIENT_PERMISSIONS" or "AUDIT_CHECK_DISABLED".</p>
 */
@property (nonatomic, strong) NSString * _Nullable errorCode;

/**
 <p>The message associated with any error encountered when this check is performed during this audit.</p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

/**
 <p>The number of resources that were found noncompliant during the check.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable nonCompliantResourcesCount;

/**
 <p> Describes how many of the non-compliant resources created during the evaluation of an audit check were marked as suppressed. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable suppressedNonCompliantResourcesCount;

/**
 <p>The number of resources on which the check was performed.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable totalResourcesCount;

@end

/**
 <p>The findings (results) of the audit.</p>
 */
@interface AWSIoTAuditFinding : AWSModel


/**
 <p>The audit check that generated this result.</p>
 */
@property (nonatomic, strong) NSString * _Nullable checkName;

/**
 <p>A unique identifier for this set of audit findings. This identifier is used to apply mitigation tasks to one or more sets of findings.</p>
 */
@property (nonatomic, strong) NSString * _Nullable findingId;

/**
 <p>The time the result (finding) was discovered.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable findingTime;

/**
 <p> Indicates whether the audit finding was suppressed or not during reporting. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isSuppressed;

/**
 <p>The resource that was found to be noncompliant with the audit check.</p>
 */
@property (nonatomic, strong) AWSIoTNonCompliantResource * _Nullable nonCompliantResource;

/**
 <p>The reason the resource was noncompliant.</p>
 */
@property (nonatomic, strong) NSString * _Nullable reasonForNonCompliance;

/**
 <p>A code that indicates the reason that the resource was noncompliant.</p>
 */
@property (nonatomic, strong) NSString * _Nullable reasonForNonComplianceCode;

/**
 <p>The list of related resources.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTRelatedResource *> * _Nullable relatedResources;

/**
 <p>The severity of the result (finding).</p>
 */
@property (nonatomic, assign) AWSIoTAuditFindingSeverity severity;

/**
 <p>The ID of the audit that generated this result (finding).</p>
 */
@property (nonatomic, strong) NSString * _Nullable taskId;

/**
 <p>The time the audit started.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable taskStartTime;

@end

/**
 <p>Returned by ListAuditMitigationActionsTask, this object contains information that describes a mitigation action that has been started.</p>
 */
@interface AWSIoTAuditMitigationActionExecutionMetadata : AWSModel


/**
 <p>The unique identifier for the mitigation action being applied by the task.</p>
 */
@property (nonatomic, strong) NSString * _Nullable actionId;

/**
 <p>The friendly name of the mitigation action being applied by the task.</p>
 */
@property (nonatomic, strong) NSString * _Nullable actionName;

/**
 <p>The date and time when the task was completed or canceled. Blank if the task is still running.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable endTime;

/**
 <p>If an error occurred, the code that indicates which type of error occurred.</p>
 */
@property (nonatomic, strong) NSString * _Nullable errorCode;

/**
 <p>The unique identifier for the findings to which the task and associated mitigation action are applied.</p>
 */
@property (nonatomic, strong) NSString * _Nullable findingId;

/**
 <p>If an error occurred, a message that describes the error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

/**
 <p>The date and time when the task was started.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable startTime;

/**
 <p>The current status of the task being executed.</p>
 */
@property (nonatomic, assign) AWSIoTAuditMitigationActionsExecutionStatus status;

/**
 <p>The unique identifier for the task that applies the mitigation action.</p>
 */
@property (nonatomic, strong) NSString * _Nullable taskId;

@end

/**
 <p>Information about an audit mitigation actions task that is returned by <code>ListAuditMitigationActionsTasks</code>.</p>
 */
@interface AWSIoTAuditMitigationActionsTaskMetadata : AWSModel


/**
 <p>The time at which the audit mitigation actions task was started.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable startTime;

/**
 <p>The unique identifier for the task.</p>
 */
@property (nonatomic, strong) NSString * _Nullable taskId;

/**
 <p>The current state of the audit mitigation actions task.</p>
 */
@property (nonatomic, assign) AWSIoTAuditMitigationActionsTaskStatus taskStatus;

@end

/**
 <p>Used in MitigationActionParams, this information identifies the target findings to which the mitigation actions are applied. Only one entry appears.</p>
 */
@interface AWSIoTAuditMitigationActionsTaskTarget : AWSModel


/**
 <p>Specifies a filter in the form of an audit check and set of reason codes that identify the findings from the audit to which the audit mitigation actions task apply.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSArray<NSString *> *> * _Nullable auditCheckToReasonCodeFilter;

/**
 <p>If the task will apply a mitigation action to findings from a specific audit, this value uniquely identifies the audit.</p>
 */
@property (nonatomic, strong) NSString * _Nullable auditTaskId;

/**
 <p>If the task will apply a mitigation action to one or more listed findings, this value uniquely identifies those findings.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable findingIds;

@end

/**
 <p>Information about the targets to which audit notifications are sent.</p>
 */
@interface AWSIoTAuditNotificationTarget : AWSModel


/**
 <p>True if notifications to the target are enabled.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

/**
 <p>The ARN of the role that grants permission to send notifications to the target.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 <p>The ARN of the target (SNS topic) to which audit notifications are sent.</p>
 */
@property (nonatomic, strong) NSString * _Nullable targetArn;

@end

/**
 <p> Filters out specific findings of a Device Defender audit. </p>
 Required parameters: [checkName, resourceIdentifier]
 */
@interface AWSIoTAuditSuppression : AWSModel


/**
 <p>An audit check name. Checks must be enabled for your account. (Use <code>DescribeAccountAuditConfiguration</code> to see the list of all checks, including those that are enabled or use <code>UpdateAccountAuditConfiguration</code> to select which checks are enabled.)</p>
 */
@property (nonatomic, strong) NSString * _Nullable checkName;

/**
 <p> The description of the audit suppression. </p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p> The expiration date (epoch timestamp in seconds) that you want the suppression to adhere to. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable expirationDate;

/**
 <p>Information that identifies the noncompliant resource.</p>
 */
@property (nonatomic, strong) AWSIoTResourceIdentifier * _Nullable resourceIdentifier;

/**
 <p> Indicates whether a suppression should exist indefinitely or not. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable suppressIndefinitely;

@end

/**
 <p>The audits that were performed.</p>
 */
@interface AWSIoTAuditTaskMetadata : AWSModel


/**
 <p>The ID of this audit.</p>
 */
@property (nonatomic, strong) NSString * _Nullable taskId;

/**
 <p>The status of this audit. One of "IN_PROGRESS", "COMPLETED", "FAILED", or "CANCELED".</p>
 */
@property (nonatomic, assign) AWSIoTAuditTaskStatus taskStatus;

/**
 <p>The type of this audit. One of "ON_DEMAND_AUDIT_TASK" or "SCHEDULED_AUDIT_TASK".</p>
 */
@property (nonatomic, assign) AWSIoTAuditTaskType taskType;

@end

/**
 <p>A collection of authorization information.</p>
 Required parameters: [resources]
 */
@interface AWSIoTAuthInfo : AWSModel


/**
 <p>The type of action for which the principal is being authorized.</p>
 */
@property (nonatomic, assign) AWSIoTActionType actionType;

/**
 <p>The resources for which the principal is being authorized to perform the specified action.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable resources;

@end

/**
 <p>The authorizer result.</p>
 */
@interface AWSIoTAuthResult : AWSModel


/**
 <p>The policies and statements that allowed the specified action.</p>
 */
@property (nonatomic, strong) AWSIoTAllowed * _Nullable allowed;

/**
 <p>The final authorization decision of this scenario. Multiple statements are taken into account when determining the authorization decision. An explicit deny statement can override multiple allow statements.</p>
 */
@property (nonatomic, assign) AWSIoTAuthDecision authDecision;

/**
 <p>Authorization information.</p>
 */
@property (nonatomic, strong) AWSIoTAuthInfo * _Nullable authInfo;

/**
 <p>The policies and statements that denied the specified action.</p>
 */
@property (nonatomic, strong) AWSIoTDenied * _Nullable denied;

/**
 <p>Contains any missing context values found while evaluating policy.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable missingContextValues;

@end

/**
 <p>An object that specifies the authorization service for a domain.</p>
 */
@interface AWSIoTAuthorizerConfig : AWSModel


/**
 <p>A Boolean that specifies whether the domain configuration's authorization service can be overridden.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable allowAuthorizerOverride;

/**
 <p>The name of the authorization service for a domain configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable defaultAuthorizerName;

@end

/**
 <p>The authorizer description.</p>
 */
@interface AWSIoTAuthorizerDescription : AWSModel


/**
 <p>The authorizer ARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable authorizerArn;

/**
 <p>The authorizer's Lambda function ARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable authorizerFunctionArn;

/**
 <p>The authorizer name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable authorizerName;

/**
 <p>The UNIX timestamp of when the authorizer was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDate;

/**
 <p>When <code>true</code>, the result from the authorizer’s Lambda function is cached for the time specified in <code>refreshAfterInSeconds</code>. The cached result is used while the device reuses the same HTTP connection.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enableCachingForHttp;

/**
 <p>The UNIX timestamp of when the authorizer was last updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedDate;

/**
 <p>Specifies whether IoT validates the token signature in an authorization request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable signingDisabled;

/**
 <p>The status of the authorizer.</p>
 */
@property (nonatomic, assign) AWSIoTAuthorizerStatus status;

/**
 <p>The key used to extract the token from the HTTP headers.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tokenKeyName;

/**
 <p>The public keys used to validate the token signature returned by your custom authentication service.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tokenSigningPublicKeys;

@end

/**
 <p>The authorizer summary.</p>
 */
@interface AWSIoTAuthorizerSummary : AWSModel


/**
 <p>The authorizer ARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable authorizerArn;

/**
 <p>The authorizer name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable authorizerName;

@end

/**
 <p>The criteria that determine when and how a job abort takes place.</p>
 Required parameters: [abortCriteriaList]
 */
@interface AWSIoTAwsJobAbortConfig : AWSModel


/**
 <p>The list of criteria that determine when and how to abort the job.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTAwsJobAbortCriteria *> * _Nullable abortCriteriaList;

@end

/**
 <p>The criteria that determine when and how a job abort takes place.</p>
 Required parameters: [failureType, action, thresholdPercentage, minNumberOfExecutedThings]
 */
@interface AWSIoTAwsJobAbortCriteria : AWSModel


/**
 <p>The type of job action to take to initiate the job abort.</p>
 */
@property (nonatomic, assign) AWSIoTAwsJobAbortCriteriaAbortAction action;

/**
 <p>The type of job execution failures that can initiate a job abort.</p>
 */
@property (nonatomic, assign) AWSIoTAwsJobAbortCriteriaFailureType failureType;

/**
 <p>The minimum number of things which must receive job execution notifications before the job can be aborted.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable minNumberOfExecutedThings;

/**
 <p>The minimum percentage of job execution failures that must occur to initiate the job abort.</p><p>Amazon Web Services IoT Core supports up to two digits after the decimal (for example, 10.9 and 10.99, but not 10.999).</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable thresholdPercentage;

@end

/**
 <p>Configuration for the rollout of OTA updates.</p>
 */
@interface AWSIoTAwsJobExecutionsRolloutConfig : AWSModel


/**
 <p>The rate of increase for a job rollout. This parameter allows you to define an exponential rate increase for a job rollout.</p>
 */
@property (nonatomic, strong) AWSIoTAwsJobExponentialRolloutRate * _Nullable exponentialRate;

/**
 <p>The maximum number of OTA update job executions started per minute.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maximumPerMinute;

@end

/**
 <p>The rate of increase for a job rollout. This parameter allows you to define an exponential rate increase for a job rollout.</p>
 Required parameters: [baseRatePerMinute, incrementFactor, rateIncreaseCriteria]
 */
@interface AWSIoTAwsJobExponentialRolloutRate : AWSModel


/**
 <p>The minimum number of things that will be notified of a pending job, per minute, at the start of the job rollout. This is the initial rate of the rollout.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable baseRatePerMinute;

/**
 <p>The rate of increase for a job rollout. The number of things notified is multiplied by this factor.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable incrementFactor;

/**
 <p>The criteria to initiate the increase in rate of rollout for a job.</p><p>Amazon Web Services IoT Core supports up to one digit after the decimal (for example, 1.5, but not 1.55).</p>
 */
@property (nonatomic, strong) AWSIoTAwsJobRateIncreaseCriteria * _Nullable rateIncreaseCriteria;

@end

/**
 <p>Configuration information for pre-signed URLs. Valid when <code>protocols</code> contains HTTP.</p>
 */
@interface AWSIoTAwsJobPresignedUrlConfig : AWSModel


/**
 <p>How long (in seconds) pre-signed URLs are valid. Valid values are 60 - 3600, the default value is 1800 seconds. Pre-signed URLs are generated when a request for the job document is received.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable expiresInSec;

@end

/**
 <p>The criteria to initiate the increase in rate of rollout for a job.</p>
 */
@interface AWSIoTAwsJobRateIncreaseCriteria : AWSModel


/**
 <p>When this number of things have been notified, it will initiate an increase in the rollout rate.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable numberOfNotifiedThings;

/**
 <p>When this number of things have succeeded in their job execution, it will initiate an increase in the rollout rate.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable numberOfSucceededThings;

@end

/**
 <p>Specifies the amount of time each device has to finish its execution of the job. A timer is started when the job execution status is set to <code>IN_PROGRESS</code>. If the job execution status is not set to another terminal state before the timer expires, it will be automatically set to <code>TIMED_OUT</code>.</p>
 */
@interface AWSIoTAwsJobTimeoutConfig : AWSModel


/**
 <p>Specifies the amount of time, in minutes, this device has to finish execution of this job. The timeout interval can be anywhere between 1 minute and 7 days (1 to 10080 minutes). The in progress timer can't be updated and will apply to all job executions for the job. Whenever a job execution remains in the IN_PROGRESS status for longer than this interval, the job execution will fail and switch to the terminal <code>TIMED_OUT</code> status.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable inProgressTimeoutInMinutes;

@end

/**
 <p>A Device Defender security profile behavior.</p>
 Required parameters: [name]
 */
@interface AWSIoTBehavior : AWSModel


/**
 <p>The criteria that determine if a device is behaving normally in regard to the <code>metric</code>.</p>
 */
@property (nonatomic, strong) AWSIoTBehaviorCriteria * _Nullable criteria;

/**
 <p>What is measured by the behavior.</p>
 */
@property (nonatomic, strong) NSString * _Nullable metric;

/**
 <p>The dimension for a metric in your behavior. For example, using a <code>TOPIC_FILTER</code> dimension, you can narrow down the scope of the metric to only MQTT topics where the name matches the pattern specified in the dimension. This can't be used with custom metrics.</p>
 */
@property (nonatomic, strong) AWSIoTMetricDimension * _Nullable metricDimension;

/**
 <p>The name you've given to the behavior.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p> Suppresses alerts. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable suppressAlerts;

@end

/**
 <p>The criteria by which the behavior is determined to be normal.</p>
 */
@interface AWSIoTBehaviorCriteria : AWSModel


/**
 <p>The operator that relates the thing measured (<code>metric</code>) to the criteria (containing a <code>value</code> or <code>statisticalThreshold</code>). Valid operators include:</p><ul><li><p><code>string-list</code>: <code>in-set</code> and <code>not-in-set</code></p></li><li><p><code>number-list</code>: <code>in-set</code> and <code>not-in-set</code></p></li><li><p><code>ip-address-list</code>: <code>in-cidr-set</code> and <code>not-in-cidr-set</code></p></li><li><p><code>number</code>: <code>less-than</code>, <code>less-than-equals</code>, <code>greater-than</code>, and <code>greater-than-equals</code></p></li></ul>
 */
@property (nonatomic, assign) AWSIoTComparisonOperator comparisonOperator;

/**
 <p>If a device is in violation of the behavior for the specified number of consecutive datapoints, an alarm occurs. If not specified, the default is 1.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable consecutiveDatapointsToAlarm;

/**
 <p>If an alarm has occurred and the offending device is no longer in violation of the behavior for the specified number of consecutive datapoints, the alarm is cleared. If not specified, the default is 1.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable consecutiveDatapointsToClear;

/**
 <p>Use this to specify the time duration over which the behavior is evaluated, for those criteria that have a time dimension (for example, <code>NUM_MESSAGES_SENT</code>). For a <code>statisticalThreshhold</code> metric comparison, measurements from all devices are accumulated over this time duration before being used to calculate percentiles, and later, measurements from an individual device are also accumulated over this time duration before being given a percentile rank. Cannot be used with list-based metric datatypes.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable durationSeconds;

/**
 <p> The configuration of an ML Detect </p>
 */
@property (nonatomic, strong) AWSIoTMachineLearningDetectionConfig * _Nullable mlDetectionConfig;

/**
 <p>A statistical ranking (percentile)that indicates a threshold value by which a behavior is determined to be in compliance or in violation of the behavior.</p>
 */
@property (nonatomic, strong) AWSIoTStatisticalThreshold * _Nullable statisticalThreshold;

/**
 <p>The value to be compared with the <code>metric</code>.</p>
 */
@property (nonatomic, strong) AWSIoTMetricValue * _Nullable value;

@end

/**
 <p> The summary of an ML Detect behavior model. </p>
 */
@interface AWSIoTBehaviorModelTrainingSummary : AWSModel


/**
 <p> The name of the behavior. </p>
 */
@property (nonatomic, strong) NSString * _Nullable behaviorName;

/**
 <p> The percentage of datapoints collected. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable datapointsCollectionPercentage;

/**
 <p> The date the model was last refreshed. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModelRefreshDate;

/**
 <p> The status of the behavior model. </p>
 */
@property (nonatomic, assign) AWSIoTModelStatus modelStatus;

/**
 <p> The name of the security profile. </p>
 */
@property (nonatomic, strong) NSString * _Nullable securityProfileName;

/**
 <p> The date a training model started collecting data. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable trainingDataCollectionStartDate;

@end

/**
 <p>Additional information about the billing group.</p>
 */
@interface AWSIoTBillingGroupMetadata : AWSModel


/**
 <p>The date the billing group was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDate;

@end

/**
 <p>The properties of a billing group.</p>
 */
@interface AWSIoTBillingGroupProperties : AWSModel


/**
 <p>The description of the billing group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable billingGroupDescription;

@end

/**
 <p>A count of documents that meets a specific aggregation criteria.</p>
 */
@interface AWSIoTBucket : AWSModel


/**
 <p>The number of documents that have the value counted for the particular bucket.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable count;

/**
 <p>The value counted for the particular bucket.</p>
 */
@property (nonatomic, strong) NSString * _Nullable keyValue;

@end

/**
 <p>The type of bucketed aggregation performed.</p>
 */
@interface AWSIoTBucketsAggregationType : AWSModel


/**
 <p>Performs an aggregation that will return a list of buckets. The list of buckets is a ranked list of the number of occurrences of an aggregation field value.</p>
 */
@property (nonatomic, strong) AWSIoTTermsAggregation * _Nullable termsAggregation;

@end

/**
 <p>A CA certificate.</p>
 */
@interface AWSIoTCACertificate : AWSModel


/**
 <p>The ARN of the CA certificate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificateArn;

/**
 <p>The ID of the CA certificate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificateId;

/**
 <p>The date the CA certificate was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDate;

/**
 <p>The status of the CA certificate.</p><p>The status value REGISTER_INACTIVE is deprecated and should not be used.</p>
 */
@property (nonatomic, assign) AWSIoTCACertificateStatus status;

@end

/**
 <p>Describes a CA certificate.</p>
 */
@interface AWSIoTCACertificateDescription : AWSModel


/**
 <p>Whether the CA certificate configured for auto registration of device certificates. Valid values are "ENABLE" and "DISABLE"</p>
 */
@property (nonatomic, assign) AWSIoTAutoRegistrationStatus autoRegistrationStatus;

/**
 <p>The CA certificate ARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificateArn;

/**
 <p>The CA certificate ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificateId;

/**
 <p>The mode of the CA. </p><p>All the device certificates that are registered using this CA will be registered in the same mode as the CA. For more information about certificate mode for device certificates, see <a href="https://docs.aws.amazon.com/iot/latest/apireference/API_CertificateDescription.html#iot-Type-CertificateDescription-certificateMode">certificate mode</a>.</p>
 */
@property (nonatomic, assign) AWSIoTCertificateMode certificateMode;

/**
 <p>The CA certificate data, in PEM format.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificatePem;

/**
 <p>The date the CA certificate was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDate;

/**
 <p>The customer version of the CA certificate.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable customerVersion;

/**
 <p>The generation ID of the CA certificate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable generationId;

/**
 <p>The date the CA certificate was last modified.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedDate;

/**
 <p>The owner of the CA certificate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ownedBy;

/**
 <p>The status of a CA certificate.</p>
 */
@property (nonatomic, assign) AWSIoTCACertificateStatus status;

/**
 <p>When the CA certificate is valid.</p>
 */
@property (nonatomic, strong) AWSIoTCertificateValidity * _Nullable validity;

@end

/**
 
 */
@interface AWSIoTCancelAuditMitigationActionsTaskRequest : AWSRequest


/**
 <p>The unique identifier for the task that you want to cancel. </p>
 */
@property (nonatomic, strong) NSString * _Nullable taskId;

@end

/**
 
 */
@interface AWSIoTCancelAuditMitigationActionsTaskResponse : AWSModel


@end

/**
 
 */
@interface AWSIoTCancelAuditTaskRequest : AWSRequest


/**
 <p>The ID of the audit you want to cancel. You can only cancel an audit that is "IN_PROGRESS".</p>
 */
@property (nonatomic, strong) NSString * _Nullable taskId;

@end

/**
 
 */
@interface AWSIoTCancelAuditTaskResponse : AWSModel


@end

/**
 <p>The input for the CancelCertificateTransfer operation.</p>
 Required parameters: [certificateId]
 */
@interface AWSIoTCancelCertificateTransferRequest : AWSRequest


/**
 <p>The ID of the certificate. (The last part of the certificate ARN contains the certificate ID.)</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificateId;

@end

/**
 
 */
@interface AWSIoTCancelDetectMitigationActionsTaskRequest : AWSRequest


/**
 <p> The unique identifier of the task. </p>
 */
@property (nonatomic, strong) NSString * _Nullable taskId;

@end

/**
 
 */
@interface AWSIoTCancelDetectMitigationActionsTaskResponse : AWSModel


@end

/**
 
 */
@interface AWSIoTCancelJobExecutionRequest : AWSRequest


/**
 <p>(Optional) The expected current version of the job execution. Each time you update the job execution, its version is incremented. If the version of the job execution stored in Jobs does not match, the update is rejected with a VersionMismatch error, and an ErrorResponse that contains the current job execution status data is returned. (This makes it unnecessary to perform a separate DescribeJobExecution request in order to obtain the job execution status data.)</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable expectedVersion;

/**
 <p>(Optional) If <code>true</code> the job execution will be canceled if it has status IN_PROGRESS or QUEUED, otherwise the job execution will be canceled only if it has status QUEUED. If you attempt to cancel a job execution that is IN_PROGRESS, and you do not set <code>force</code> to <code>true</code>, then an <code>InvalidStateTransitionException</code> will be thrown. The default is <code>false</code>.</p><p>Canceling a job execution which is "IN_PROGRESS", will cause the device to be unable to update the job execution status. Use caution and ensure that the device is able to recover to a valid state.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable force;

/**
 <p>The ID of the job to be canceled.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

/**
 <p>A collection of name/value pairs that describe the status of the job execution. If not specified, the statusDetails are unchanged. You can specify at most 10 name/value pairs.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable statusDetails;

/**
 <p>The name of the thing whose execution of the job will be canceled.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingName;

@end

/**
 
 */
@interface AWSIoTCancelJobRequest : AWSRequest


/**
 <p>An optional comment string describing why the job was canceled.</p>
 */
@property (nonatomic, strong) NSString * _Nullable comment;

/**
 <p>(Optional) If <code>true</code> job executions with status "IN_PROGRESS" and "QUEUED" are canceled, otherwise only job executions with status "QUEUED" are canceled. The default is <code>false</code>.</p><p>Canceling a job which is "IN_PROGRESS", will cause a device which is executing the job to be unable to update the job execution status. Use caution and ensure that each device executing a job which is canceled is able to recover to a valid state.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable force;

/**
 <p>The unique identifier you assigned to this job when it was created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

/**
 <p>(Optional)A reason code string that explains why the job was canceled.</p>
 */
@property (nonatomic, strong) NSString * _Nullable reasonCode;

@end

/**
 
 */
@interface AWSIoTCancelJobResponse : AWSModel


/**
 <p>A short text description of the job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The job ARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobArn;

/**
 <p>The unique identifier you assigned to this job when it was created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

@end

/**
 <p>Information about a certificate.</p>
 */
@interface AWSIoTCertificate : AWSModel


/**
 <p>The ARN of the certificate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificateArn;

/**
 <p>The ID of the certificate. (The last part of the certificate ARN contains the certificate ID.)</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificateId;

/**
 <p>The mode of the certificate.</p><p><code>DEFAULT</code>: A certificate in <code>DEFAULT</code> mode is either generated by Amazon Web Services IoT Core or registered with an issuer certificate authority (CA) in <code>DEFAULT</code> mode. Devices with certificates in <code>DEFAULT</code> mode aren't required to send the Server Name Indication (SNI) extension when connecting to Amazon Web Services IoT Core. However, to use features such as custom domains and VPC endpoints, we recommend that you use the SNI extension when connecting to Amazon Web Services IoT Core.</p><p><code>SNI_ONLY</code>: A certificate in <code>SNI_ONLY</code> mode is registered without an issuer CA. Devices with certificates in <code>SNI_ONLY</code> mode must send the SNI extension when connecting to Amazon Web Services IoT Core. </p>
 */
@property (nonatomic, assign) AWSIoTCertificateMode certificateMode;

/**
 <p>The date and time the certificate was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDate;

/**
 <p>The status of the certificate.</p><p>The status value REGISTER_INACTIVE is deprecated and should not be used.</p>
 */
@property (nonatomic, assign) AWSIoTCertificateStatus status;

@end

/**
 <p>Describes a certificate.</p>
 */
@interface AWSIoTCertificateDescription : AWSModel


/**
 <p>The certificate ID of the CA certificate used to sign this certificate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable caCertificateId;

/**
 <p>The ARN of the certificate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificateArn;

/**
 <p>The ID of the certificate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificateId;

/**
 <p>The mode of the certificate.</p><p><code>DEFAULT</code>: A certificate in <code>DEFAULT</code> mode is either generated by Amazon Web Services IoT Core or registered with an issuer certificate authority (CA) in <code>DEFAULT</code> mode. Devices with certificates in <code>DEFAULT</code> mode aren't required to send the Server Name Indication (SNI) extension when connecting to Amazon Web Services IoT Core. However, to use features such as custom domains and VPC endpoints, we recommend that you use the SNI extension when connecting to Amazon Web Services IoT Core.</p><p><code>SNI_ONLY</code>: A certificate in <code>SNI_ONLY</code> mode is registered without an issuer CA. Devices with certificates in <code>SNI_ONLY</code> mode must send the SNI extension when connecting to Amazon Web Services IoT Core. </p><p>For more information about the value for SNI extension, see <a href="https://docs.aws.amazon.com/iot/latest/developerguide/transport-security.html">Transport security in IoT</a>.</p>
 */
@property (nonatomic, assign) AWSIoTCertificateMode certificateMode;

/**
 <p>The certificate data, in PEM format.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificatePem;

/**
 <p>The date and time the certificate was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDate;

/**
 <p>The customer version of the certificate.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable customerVersion;

/**
 <p>The generation ID of the certificate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable generationId;

/**
 <p>The date and time the certificate was last modified.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedDate;

/**
 <p>The ID of the Amazon Web Services account that owns the certificate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ownedBy;

/**
 <p>The ID of the Amazon Web Services account of the previous owner of the certificate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable previousOwnedBy;

/**
 <p>The status of the certificate.</p>
 */
@property (nonatomic, assign) AWSIoTCertificateStatus status;

/**
 <p>The transfer data.</p>
 */
@property (nonatomic, strong) AWSIoTTransferData * _Nullable transferData;

/**
 <p>When the certificate is valid.</p>
 */
@property (nonatomic, strong) AWSIoTCertificateValidity * _Nullable validity;

@end

/**
 <p>When the certificate is valid.</p>
 */
@interface AWSIoTCertificateValidity : AWSModel


/**
 <p>The certificate is not valid after this date.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable notAfter;

/**
 <p>The certificate is not valid before this date.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable notBefore;

@end

/**
 
 */
@interface AWSIoTClearDefaultAuthorizerRequest : AWSRequest


@end

/**
 
 */
@interface AWSIoTClearDefaultAuthorizerResponse : AWSModel


@end

/**
 <p>Describes an action that updates a CloudWatch alarm.</p>
 Required parameters: [roleArn, alarmName, stateReason, stateValue]
 */
@interface AWSIoTCloudwatchAlarmAction : AWSModel


/**
 <p>The CloudWatch alarm name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable alarmName;

/**
 <p>The IAM role that allows access to the CloudWatch alarm.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 <p>The reason for the alarm change.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stateReason;

/**
 <p>The value of the alarm state. Acceptable values are: OK, ALARM, INSUFFICIENT_DATA.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stateValue;

@end

/**
 <p>Describes an action that sends data to CloudWatch Logs.</p>
 Required parameters: [roleArn, logGroupName]
 */
@interface AWSIoTCloudwatchLogsAction : AWSModel


/**
 <p>The CloudWatch log group to which the action sends data.</p>
 */
@property (nonatomic, strong) NSString * _Nullable logGroupName;

/**
 <p>The IAM role that allows access to the CloudWatch log.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

@end

/**
 <p>Describes an action that captures a CloudWatch metric.</p>
 Required parameters: [roleArn, metricNamespace, metricName, metricValue, metricUnit]
 */
@interface AWSIoTCloudwatchMetricAction : AWSModel


/**
 <p>The CloudWatch metric name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable metricName;

/**
 <p>The CloudWatch metric namespace name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable metricNamespace;

/**
 <p>An optional <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/DeveloperGuide/cloudwatch_concepts.html#about_timestamp">Unix timestamp</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable metricTimestamp;

/**
 <p>The <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/DeveloperGuide/cloudwatch_concepts.html#Unit">metric unit</a> supported by CloudWatch.</p>
 */
@property (nonatomic, strong) NSString * _Nullable metricUnit;

/**
 <p>The CloudWatch metric value.</p>
 */
@property (nonatomic, strong) NSString * _Nullable metricValue;

/**
 <p>The IAM role that allows access to the CloudWatch metric.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

@end

/**
 <p>Describes the method to use when code signing a file.</p>
 */
@interface AWSIoTCodeSigning : AWSModel


/**
 <p>The ID of the <code>AWSSignerJob</code> which was created to sign the file.</p>
 */
@property (nonatomic, strong) NSString * _Nullable awsSignerJobId;

/**
 <p>A custom method for code signing a file.</p>
 */
@property (nonatomic, strong) AWSIoTCustomCodeSigning * _Nullable customCodeSigning;

/**
 <p>Describes the code-signing job.</p>
 */
@property (nonatomic, strong) AWSIoTStartSigningJobParameter * _Nullable startSigningJobParameter;

@end

/**
 <p>Describes the certificate chain being used when code signing a file.</p>
 */
@interface AWSIoTCodeSigningCertificateChain : AWSModel


/**
 <p>The name of the certificate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificateName;

/**
 <p>A base64 encoded binary representation of the code signing certificate chain.</p>
 */
@property (nonatomic, strong) NSString * _Nullable inlineDocument;

@end

/**
 <p>Describes the signature for a file.</p>
 */
@interface AWSIoTCodeSigningSignature : AWSModel


/**
 <p>A base64 encoded binary representation of the code signing signature.</p>
 */
@property (nonatomic, strong) NSData * _Nullable inlineDocument;

@end

/**
 <p>Configuration.</p>
 */
@interface AWSIoTConfiguration : AWSModel


/**
 <p>True to enable the configuration.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

@end

/**
 
 */
@interface AWSIoTConfirmTopicRuleDestinationRequest : AWSRequest


/**
 <p>The token used to confirm ownership or access to the topic rule confirmation URL.</p>
 */
@property (nonatomic, strong) NSString * _Nullable confirmationToken;

@end

/**
 
 */
@interface AWSIoTConfirmTopicRuleDestinationResponse : AWSModel


@end

/**
 
 */
@interface AWSIoTCreateAuditSuppressionRequest : AWSRequest


/**
 <p>An audit check name. Checks must be enabled for your account. (Use <code>DescribeAccountAuditConfiguration</code> to see the list of all checks, including those that are enabled or use <code>UpdateAccountAuditConfiguration</code> to select which checks are enabled.)</p>
 */
@property (nonatomic, strong) NSString * _Nullable checkName;

/**
 <p> Each audit supression must have a unique client request token. If you try to create a new audit suppression with the same token as one that already exists, an exception occurs. If you omit this value, Amazon Web Services SDKs will automatically generate a unique client request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientRequestToken;

/**
 <p> The description of the audit suppression. </p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p> The epoch timestamp in seconds at which this suppression expires. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable expirationDate;

/**
 <p>Information that identifies the noncompliant resource.</p>
 */
@property (nonatomic, strong) AWSIoTResourceIdentifier * _Nullable resourceIdentifier;

/**
 <p> Indicates whether a suppression should exist indefinitely or not. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable suppressIndefinitely;

@end

/**
 
 */
@interface AWSIoTCreateAuditSuppressionResponse : AWSModel


@end

/**
 
 */
@interface AWSIoTCreateAuthorizerRequest : AWSRequest


/**
 <p>The ARN of the authorizer's Lambda function.</p>
 */
@property (nonatomic, strong) NSString * _Nullable authorizerFunctionArn;

/**
 <p>The authorizer name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable authorizerName;

/**
 <p>When <code>true</code>, the result from the authorizer’s Lambda function is cached for clients that use persistent HTTP connections. The results are cached for the time specified by the Lambda function in <code>refreshAfterInSeconds</code>. This value does not affect authorization of clients that use MQTT connections.</p><p>The default value is <code>false</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enableCachingForHttp;

/**
 <p>Specifies whether IoT validates the token signature in an authorization request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable signingDisabled;

/**
 <p>The status of the create authorizer request.</p>
 */
@property (nonatomic, assign) AWSIoTAuthorizerStatus status;

/**
 <p>Metadata which can be used to manage the custom authorizer.</p><note><p>For URI Request parameters use format: ...key1=value1&amp;key2=value2...</p><p>For the CLI command-line parameter use format: &amp;&amp;tags "key1=value1&amp;key2=value2..."</p><p>For the cli-input-json file use format: "tags": "key1=value1&amp;key2=value2..."</p></note>
 */
@property (nonatomic, strong) NSArray<AWSIoTTag *> * _Nullable tags;

/**
 <p>The name of the token key used to extract the token from the HTTP headers.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tokenKeyName;

/**
 <p>The public keys used to verify the digital signature returned by your custom authentication service.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tokenSigningPublicKeys;

@end

/**
 
 */
@interface AWSIoTCreateAuthorizerResponse : AWSModel


/**
 <p>The authorizer ARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable authorizerArn;

/**
 <p>The authorizer's name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable authorizerName;

@end

/**
 
 */
@interface AWSIoTCreateBillingGroupRequest : AWSRequest


/**
 <p>The name you wish to give to the billing group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable billingGroupName;

/**
 <p>The properties of the billing group.</p>
 */
@property (nonatomic, strong) AWSIoTBillingGroupProperties * _Nullable billingGroupProperties;

/**
 <p>Metadata which can be used to manage the billing group.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSIoTCreateBillingGroupResponse : AWSModel


/**
 <p>The ARN of the billing group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable billingGroupArn;

/**
 <p>The ID of the billing group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable billingGroupId;

/**
 <p>The name you gave to the billing group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable billingGroupName;

@end

/**
 <p>The input for the CreateCertificateFromCsr operation.</p>
 Required parameters: [certificateSigningRequest]
 */
@interface AWSIoTCreateCertificateFromCsrRequest : AWSRequest


/**
 <p>The certificate signing request (CSR).</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificateSigningRequest;

/**
 <p>Specifies whether the certificate is active.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable setAsActive;

@end

/**
 <p>The output from the CreateCertificateFromCsr operation.</p>
 */
@interface AWSIoTCreateCertificateFromCsrResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the certificate. You can use the ARN as a principal for policy operations.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificateArn;

/**
 <p>The ID of the certificate. Certificate management operations only take a certificateId.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificateId;

/**
 <p>The certificate data, in PEM format.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificatePem;

@end

/**
 
 */
@interface AWSIoTCreateCustomMetricRequest : AWSRequest


/**
 <p>Each custom metric must have a unique client request token. If you try to create a new custom metric that already exists with a different token, an exception occurs. If you omit this value, Amazon Web Services SDKs will automatically generate a unique client request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable clientRequestToken;

/**
 <p> The friendly name in the console for the custom metric. This name doesn't have to be unique. Don't use this name as the metric identifier in the device metric report. You can update the friendly name after you define it.</p>
 */
@property (nonatomic, strong) NSString * _Nullable displayName;

/**
 <p> The name of the custom metric. This will be used in the metric report submitted from the device/thing. The name can't begin with <code>aws:</code>. You can't change the name after you define it.</p>
 */
@property (nonatomic, strong) NSString * _Nullable metricName;

/**
 <p> The type of the custom metric. </p><important><p>The type <code>number</code> only takes a single metric value as an input, but when you submit the metrics value in the DeviceMetrics report, you must pass it as an array with a single value.</p></important>
 */
@property (nonatomic, assign) AWSIoTCustomMetricType metricType;

/**
 <p> Metadata that can be used to manage the custom metric. </p>
 */
@property (nonatomic, strong) NSArray<AWSIoTTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSIoTCreateCustomMetricResponse : AWSModel


/**
 <p> The Amazon Resource Number (ARN) of the custom metric. For example, <code>arn:<i>aws-partition</i>:iot:<i>region</i>:<i>accountId</i>:custommetric/<i>metricName</i></code></p>
 */
@property (nonatomic, strong) NSString * _Nullable metricArn;

/**
 <p> The name of the custom metric to be used in the metric report. </p>
 */
@property (nonatomic, strong) NSString * _Nullable metricName;

@end

/**
 
 */
@interface AWSIoTCreateDimensionRequest : AWSRequest


/**
 <p>Each dimension must have a unique client request token. If you try to create a new dimension with the same token as a dimension that already exists, an exception occurs. If you omit this value, Amazon Web Services SDKs will automatically generate a unique client request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientRequestToken;

/**
 <p>A unique identifier for the dimension. Choose something that describes the type and value to make it easy to remember what it does.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>Specifies the value or list of values for the dimension. For <code>TOPIC_FILTER</code> dimensions, this is a pattern used to match the MQTT topic (for example, "admin/#").</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable stringValues;

/**
 <p>Metadata that can be used to manage the dimension.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTTag *> * _Nullable tags;

/**
 <p>Specifies the type of dimension. Supported types: <code>TOPIC_FILTER.</code></p>
 */
@property (nonatomic, assign) AWSIoTDimensionType types;

@end

/**
 
 */
@interface AWSIoTCreateDimensionResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the created dimension.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>A unique identifier for the dimension.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSIoTCreateDomainConfigurationRequest : AWSRequest


/**
 <p>An object that specifies the authorization service for a domain.</p>
 */
@property (nonatomic, strong) AWSIoTAuthorizerConfig * _Nullable authorizerConfig;

/**
 <p>The name of the domain configuration. This value must be unique to a region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainConfigurationName;

/**
 <p>The name of the domain.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainName;

/**
 <p>The ARNs of the certificates that IoT passes to the device during the TLS handshake. Currently you can specify only one certificate ARN. This value is not required for Amazon Web Services-managed domains.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable serverCertificateArns;

/**
 <p>The type of service delivered by the endpoint.</p><note><p>Amazon Web Services IoT Core currently supports only the <code>DATA</code> service type.</p></note>
 */
@property (nonatomic, assign) AWSIoTServiceType serviceType;

/**
 <p>Metadata which can be used to manage the domain configuration.</p><note><p>For URI Request parameters use format: ...key1=value1&amp;key2=value2...</p><p>For the CLI command-line parameter use format: &amp;&amp;tags "key1=value1&amp;key2=value2..."</p><p>For the cli-input-json file use format: "tags": "key1=value1&amp;key2=value2..."</p></note>
 */
@property (nonatomic, strong) NSArray<AWSIoTTag *> * _Nullable tags;

/**
 <p>The certificate used to validate the server certificate and prove domain name ownership. This certificate must be signed by a public certificate authority. This value is not required for Amazon Web Services-managed domains.</p>
 */
@property (nonatomic, strong) NSString * _Nullable validationCertificateArn;

@end

/**
 
 */
@interface AWSIoTCreateDomainConfigurationResponse : AWSModel


/**
 <p>The ARN of the domain configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainConfigurationArn;

/**
 <p>The name of the domain configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainConfigurationName;

@end

/**
 
 */
@interface AWSIoTCreateDynamicThingGroupRequest : AWSRequest


/**
 <p>The dynamic thing group index name.</p><note><p>Currently one index is supported: <code>AWS_Things</code>.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable indexName;

/**
 <p>The dynamic thing group search query string.</p><p>See <a href="https://docs.aws.amazon.com/iot/latest/developerguide/query-syntax.html">Query Syntax</a> for information about query string syntax.</p>
 */
@property (nonatomic, strong) NSString * _Nullable queryString;

/**
 <p>The dynamic thing group query version.</p><note><p>Currently one query version is supported: "2017-09-30". If not specified, the query version defaults to this value.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable queryVersion;

/**
 <p>Metadata which can be used to manage the dynamic thing group.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTTag *> * _Nullable tags;

/**
 <p>The dynamic thing group name to create.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingGroupName;

/**
 <p>The dynamic thing group properties.</p>
 */
@property (nonatomic, strong) AWSIoTThingGroupProperties * _Nullable thingGroupProperties;

@end

/**
 
 */
@interface AWSIoTCreateDynamicThingGroupResponse : AWSModel


/**
 <p>The dynamic thing group index name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable indexName;

/**
 <p>The dynamic thing group search query string.</p>
 */
@property (nonatomic, strong) NSString * _Nullable queryString;

/**
 <p>The dynamic thing group query version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable queryVersion;

/**
 <p>The dynamic thing group ARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingGroupArn;

/**
 <p>The dynamic thing group ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingGroupId;

/**
 <p>The dynamic thing group name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingGroupName;

@end

/**
 
 */
@interface AWSIoTCreateFleetMetricRequest : AWSRequest


/**
 <p>The field to aggregate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable aggregationField;

/**
 <p>The type of the aggregation query.</p>
 */
@property (nonatomic, strong) AWSIoTAggregationType * _Nullable aggregationType;

/**
 <p>The fleet metric description.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The name of the index to search.</p>
 */
@property (nonatomic, strong) NSString * _Nullable indexName;

/**
 <p>The name of the fleet metric to create.</p>
 */
@property (nonatomic, strong) NSString * _Nullable metricName;

/**
 <p>The time in seconds between fleet metric emissions. Range [60(1 min), 86400(1 day)] and must be multiple of 60.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable period;

/**
 <p>The search query string.</p>
 */
@property (nonatomic, strong) NSString * _Nullable queryString;

/**
 <p>The query version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable queryVersion;

/**
 <p>Metadata, which can be used to manage the fleet metric.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTTag *> * _Nullable tags;

/**
 <p>Used to support unit transformation such as milliseconds to seconds. The unit must be supported by <a href="https://docs.aws.amazon.com/https:/docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_MetricDatum.html">CW metric</a>. Default to null.</p>
 */
@property (nonatomic, assign) AWSIoTFleetMetricUnit unit;

@end

/**
 
 */
@interface AWSIoTCreateFleetMetricResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the new fleet metric.</p>
 */
@property (nonatomic, strong) NSString * _Nullable metricArn;

/**
 <p>The name of the fleet metric to create.</p>
 */
@property (nonatomic, strong) NSString * _Nullable metricName;

@end

/**
 
 */
@interface AWSIoTCreateJobRequest : AWSRequest


/**
 <p>Allows you to create the criteria to abort a job.</p>
 */
@property (nonatomic, strong) AWSIoTAbortConfig * _Nullable abortConfig;

/**
 <p>A short text description of the job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The job document. Required if you don't specify a value for <code>documentSource</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable document;

/**
 <p>Parameters of an Amazon Web Services managed template that you can specify to create the job document.</p><note><p><code>documentParameters</code> can only be used when creating jobs from Amazon Web Services managed templates. This parameter can't be used with custom job templates or to create jobs from them.</p></note>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable documentParameters;

/**
 <p>An S3 link to the job document. Required if you don't specify a value for <code>document</code>.</p><note><p>If the job document resides in an S3 bucket, you must use a placeholder link when specifying the document.</p><p>The placeholder link is of the following form:</p><p><code>${aws:iot:s3-presigned-url:https://s3.amazonaws.com/<i>bucket</i>/<i>key</i>}</code></p><p>where <i>bucket</i> is your bucket name and <i>key</i> is the object in the bucket to which you are linking.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable documentSource;

/**
 <p>Allows you to create the criteria to retry a job.</p>
 */
@property (nonatomic, strong) AWSIoTJobExecutionsRetryConfig * _Nullable jobExecutionsRetryConfig;

/**
 <p>Allows you to create a staged rollout of the job.</p>
 */
@property (nonatomic, strong) AWSIoTJobExecutionsRolloutConfig * _Nullable jobExecutionsRolloutConfig;

/**
 <p>A job identifier which must be unique for your Amazon Web Services account. We recommend using a UUID. Alpha-numeric characters, "-" and "_" are valid for use here.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

/**
 <p>The ARN of the job template used to create the job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobTemplateArn;

/**
 <p>The namespace used to indicate that a job is a customer-managed job.</p><p>When you specify a value for this parameter, Amazon Web Services IoT Core sends jobs notifications to MQTT topics that contain the value in the following format.</p><p><code>$aws/things/<i>THING_NAME</i>/jobs/<i>JOB_ID</i>/notify-namespace-<i>NAMESPACE_ID</i>/</code></p><note><p>The <code>namespaceId</code> feature is in public preview.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable namespaceId;

/**
 <p>Configuration information for pre-signed S3 URLs.</p>
 */
@property (nonatomic, strong) AWSIoTPresignedUrlConfig * _Nullable presignedUrlConfig;

/**
 <p>Metadata which can be used to manage the job.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTTag *> * _Nullable tags;

/**
 <p>Specifies whether the job will continue to run (CONTINUOUS), or will be complete after all those things specified as targets have completed the job (SNAPSHOT). If continuous, the job may also be run on a thing when a change is detected in a target. For example, a job will run on a thing when the thing is added to a target group, even after the job was completed by all things originally in the group.</p><note><p>We recommend that you use continuous jobs instead of snapshot jobs for dynamic thing group targets. By using continuous jobs, devices that join the group receive the job execution even after the job has been created.</p></note>
 */
@property (nonatomic, assign) AWSIoTTargetSelection targetSelection;

/**
 <p>A list of things and thing groups to which the job should be sent.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable targets;

/**
 <p>Specifies the amount of time each device has to finish its execution of the job. The timer is started when the job execution status is set to <code>IN_PROGRESS</code>. If the job execution status is not set to another terminal state before the time expires, it will be automatically set to <code>TIMED_OUT</code>.</p>
 */
@property (nonatomic, strong) AWSIoTTimeoutConfig * _Nullable timeoutConfig;

@end

/**
 
 */
@interface AWSIoTCreateJobResponse : AWSModel


/**
 <p>The job description.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The job ARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobArn;

/**
 <p>The unique identifier you assigned to this job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

@end

/**
 
 */
@interface AWSIoTCreateJobTemplateRequest : AWSRequest


/**
 <p>The criteria that determine when and how a job abort takes place.</p>
 */
@property (nonatomic, strong) AWSIoTAbortConfig * _Nullable abortConfig;

/**
 <p>A description of the job document.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The job document. Required if you don't specify a value for <code>documentSource</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable document;

/**
 <p>An S3 link to the job document to use in the template. Required if you don't specify a value for <code>document</code>.</p><note><p>If the job document resides in an S3 bucket, you must use a placeholder link when specifying the document.</p><p>The placeholder link is of the following form:</p><p><code>${aws:iot:s3-presigned-url:https://s3.amazonaws.com/<i>bucket</i>/<i>key</i>}</code></p><p>where <i>bucket</i> is your bucket name and <i>key</i> is the object in the bucket to which you are linking.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable documentSource;

/**
 <p>The ARN of the job to use as the basis for the job template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobArn;

/**
 <p>Allows you to create the criteria to retry a job.</p>
 */
@property (nonatomic, strong) AWSIoTJobExecutionsRetryConfig * _Nullable jobExecutionsRetryConfig;

/**
 <p>Allows you to create a staged rollout of a job.</p>
 */
@property (nonatomic, strong) AWSIoTJobExecutionsRolloutConfig * _Nullable jobExecutionsRolloutConfig;

/**
 <p>A unique identifier for the job template. We recommend using a UUID. Alpha-numeric characters, "-", and "_" are valid for use here.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobTemplateId;

/**
 <p>Configuration for pre-signed S3 URLs.</p>
 */
@property (nonatomic, strong) AWSIoTPresignedUrlConfig * _Nullable presignedUrlConfig;

/**
 <p>Metadata that can be used to manage the job template.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTTag *> * _Nullable tags;

/**
 <p>Specifies the amount of time each device has to finish its execution of the job. A timer is started when the job execution status is set to <code>IN_PROGRESS</code>. If the job execution status is not set to another terminal state before the timer expires, it will be automatically set to <code>TIMED_OUT</code>.</p>
 */
@property (nonatomic, strong) AWSIoTTimeoutConfig * _Nullable timeoutConfig;

@end

/**
 
 */
@interface AWSIoTCreateJobTemplateResponse : AWSModel


/**
 <p>The ARN of the job template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobTemplateArn;

/**
 <p>The unique identifier of the job template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobTemplateId;

@end

/**
 <p>The input for the CreateKeysAndCertificate operation.</p><p>Requires permission to access the <a href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">CreateKeysAndCertificateRequest</a> action.</p>
 */
@interface AWSIoTCreateKeysAndCertificateRequest : AWSRequest


/**
 <p>Specifies whether the certificate is active.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable setAsActive;

@end

/**
 <p>The output of the CreateKeysAndCertificate operation.</p>
 */
@interface AWSIoTCreateKeysAndCertificateResponse : AWSModel


/**
 <p>The ARN of the certificate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificateArn;

/**
 <p>The ID of the certificate. IoT issues a default subject name for the certificate (for example, IoT Certificate).</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificateId;

/**
 <p>The certificate data, in PEM format.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificatePem;

/**
 <p>The generated key pair.</p>
 */
@property (nonatomic, strong) AWSIoTKeyPair * _Nullable keyPair;

@end

/**
 
 */
@interface AWSIoTCreateMitigationActionRequest : AWSRequest


/**
 <p>A friendly name for the action. Choose a friendly name that accurately describes the action (for example, <code>EnableLoggingAction</code>).</p>
 */
@property (nonatomic, strong) NSString * _Nullable actionName;

/**
 <p>Defines the type of action and the parameters for that action.</p>
 */
@property (nonatomic, strong) AWSIoTMitigationActionParams * _Nullable actionParams;

/**
 <p>The ARN of the IAM role that is used to apply the mitigation action.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 <p>Metadata that can be used to manage the mitigation action.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSIoTCreateMitigationActionResponse : AWSModel


/**
 <p>The ARN for the new mitigation action.</p>
 */
@property (nonatomic, strong) NSString * _Nullable actionArn;

/**
 <p>A unique identifier for the new mitigation action.</p>
 */
@property (nonatomic, strong) NSString * _Nullable actionId;

@end

/**
 
 */
@interface AWSIoTCreateOTAUpdateRequest : AWSRequest


/**
 <p>A list of additional OTA update parameters which are name-value pairs.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable additionalParameters;

/**
 <p>The criteria that determine when and how a job abort takes place.</p>
 */
@property (nonatomic, strong) AWSIoTAwsJobAbortConfig * _Nullable awsJobAbortConfig;

/**
 <p>Configuration for the rollout of OTA updates.</p>
 */
@property (nonatomic, strong) AWSIoTAwsJobExecutionsRolloutConfig * _Nullable awsJobExecutionsRolloutConfig;

/**
 <p>Configuration information for pre-signed URLs.</p>
 */
@property (nonatomic, strong) AWSIoTAwsJobPresignedUrlConfig * _Nullable awsJobPresignedUrlConfig;

/**
 <p>Specifies the amount of time each device has to finish its execution of the job. A timer is started when the job execution status is set to <code>IN_PROGRESS</code>. If the job execution status is not set to another terminal state before the timer expires, it will be automatically set to <code>TIMED_OUT</code>.</p>
 */
@property (nonatomic, strong) AWSIoTAwsJobTimeoutConfig * _Nullable awsJobTimeoutConfig;

/**
 <p>The description of the OTA update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The files to be streamed by the OTA update.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTOTAUpdateFile *> * _Nullable files;

/**
 <p>The ID of the OTA update to be created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable otaUpdateId;

/**
 <p>The protocol used to transfer the OTA update image. Valid values are [HTTP], [MQTT], [HTTP, MQTT]. When both HTTP and MQTT are specified, the target device can choose the protocol.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable protocols;

/**
 <p>The IAM role that grants Amazon Web Services IoT Core access to the Amazon S3, IoT jobs and Amazon Web Services Code Signing resources to create an OTA update job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 <p>Metadata which can be used to manage updates.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTTag *> * _Nullable tags;

/**
 <p>Specifies whether the update will continue to run (CONTINUOUS), or will be complete after all the things specified as targets have completed the update (SNAPSHOT). If continuous, the update may also be run on a thing when a change is detected in a target. For example, an update will run on a thing when the thing is added to a target group, even after the update was completed by all things originally in the group. Valid values: CONTINUOUS | SNAPSHOT.</p>
 */
@property (nonatomic, assign) AWSIoTTargetSelection targetSelection;

/**
 <p>The devices targeted to receive OTA updates.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable targets;

@end

/**
 
 */
@interface AWSIoTCreateOTAUpdateResponse : AWSModel


/**
 <p>The IoT job ARN associated with the OTA update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable awsIotJobArn;

/**
 <p>The IoT job ID associated with the OTA update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable awsIotJobId;

/**
 <p>The OTA update ARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable otaUpdateArn;

/**
 <p>The OTA update ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable otaUpdateId;

/**
 <p>The OTA update status.</p>
 */
@property (nonatomic, assign) AWSIoTOTAUpdateStatus otaUpdateStatus;

@end

/**
 <p>The input for the CreatePolicy operation.</p>
 Required parameters: [policyName, policyDocument]
 */
@interface AWSIoTCreatePolicyRequest : AWSRequest


/**
 <p>The JSON document that describes the policy. <b>policyDocument</b> must have a minimum length of 1, with a maximum length of 2048, excluding whitespace.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyDocument;

/**
 <p>The policy name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyName;

/**
 <p>Metadata which can be used to manage the policy.</p><note><p>For URI Request parameters use format: ...key1=value1&amp;key2=value2...</p><p>For the CLI command-line parameter use format: &amp;&amp;tags "key1=value1&amp;key2=value2..."</p><p>For the cli-input-json file use format: "tags": "key1=value1&amp;key2=value2..."</p></note>
 */
@property (nonatomic, strong) NSArray<AWSIoTTag *> * _Nullable tags;

@end

/**
 <p>The output from the CreatePolicy operation.</p>
 */
@interface AWSIoTCreatePolicyResponse : AWSModel


/**
 <p>The policy ARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyArn;

/**
 <p>The JSON document that describes the policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyDocument;

/**
 <p>The policy name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyName;

/**
 <p>The policy version ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyVersionId;

@end

/**
 <p>The input for the CreatePolicyVersion operation.</p>
 Required parameters: [policyName, policyDocument]
 */
@interface AWSIoTCreatePolicyVersionRequest : AWSRequest


/**
 <p>The JSON document that describes the policy. Minimum length of 1. Maximum length of 2048, excluding whitespace.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyDocument;

/**
 <p>The policy name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyName;

/**
 <p>Specifies whether the policy version is set as the default. When this parameter is true, the new policy version becomes the operative version (that is, the version that is in effect for the certificates to which the policy is attached).</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable setAsDefault;

@end

/**
 <p>The output of the CreatePolicyVersion operation.</p>
 */
@interface AWSIoTCreatePolicyVersionResponse : AWSModel


/**
 <p>Specifies whether the policy version is the default.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isDefaultVersion;

/**
 <p>The policy ARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyArn;

/**
 <p>The JSON document that describes the policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyDocument;

/**
 <p>The policy version ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyVersionId;

@end

/**
 
 */
@interface AWSIoTCreateProvisioningClaimRequest : AWSRequest


/**
 <p>The name of the provisioning template to use.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateName;

@end

/**
 
 */
@interface AWSIoTCreateProvisioningClaimResponse : AWSModel


/**
 <p>The ID of the certificate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificateId;

/**
 <p>The provisioning claim certificate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificatePem;

/**
 <p>The provisioning claim expiration time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable expiration;

/**
 <p>The provisioning claim key pair.</p>
 */
@property (nonatomic, strong) AWSIoTKeyPair * _Nullable keyPair;

@end

/**
 
 */
@interface AWSIoTCreateProvisioningTemplateRequest : AWSRequest


/**
 <p>The description of the provisioning template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>True to enable the provisioning template, otherwise false.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

/**
 <p>Creates a pre-provisioning hook template.</p>
 */
@property (nonatomic, strong) AWSIoTProvisioningHook * _Nullable preProvisioningHook;

/**
 <p>The role ARN for the role associated with the provisioning template. This IoT role grants permission to provision a device.</p>
 */
@property (nonatomic, strong) NSString * _Nullable provisioningRoleArn;

/**
 <p>Metadata which can be used to manage the provisioning template.</p><note><p>For URI Request parameters use format: ...key1=value1&amp;key2=value2...</p><p>For the CLI command-line parameter use format: &amp;&amp;tags "key1=value1&amp;key2=value2..."</p><p>For the cli-input-json file use format: "tags": "key1=value1&amp;key2=value2..."</p></note>
 */
@property (nonatomic, strong) NSArray<AWSIoTTag *> * _Nullable tags;

/**
 <p>The JSON formatted contents of the provisioning template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateBody;

/**
 <p>The name of the provisioning template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateName;

/**
 <p>The type you define in a provisioning template. You can create a template with only one type. You can't change the template type after its creation. The default value is <code>FLEET_PROVISIONING</code>. For more information about provisioning template, see: <a href="https://docs.aws.amazon.com/iot/latest/developerguide/provision-template.html">Provisioning template</a>. </p>
 */
@property (nonatomic, assign) AWSIoTTemplateType types;

@end

/**
 
 */
@interface AWSIoTCreateProvisioningTemplateResponse : AWSModel


/**
 <p>The default version of the provisioning template.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable defaultVersionId;

/**
 <p>The ARN that identifies the provisioning template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateArn;

/**
 <p>The name of the provisioning template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateName;

@end

/**
 
 */
@interface AWSIoTCreateProvisioningTemplateVersionRequest : AWSRequest


/**
 <p>Sets a fleet provision template version as the default version.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable setAsDefault;

/**
 <p>The JSON formatted contents of the provisioning template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateBody;

/**
 <p>The name of the provisioning template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateName;

@end

/**
 
 */
@interface AWSIoTCreateProvisioningTemplateVersionResponse : AWSModel


/**
 <p>True if the provisioning template version is the default version, otherwise false.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isDefaultVersion;

/**
 <p>The ARN that identifies the provisioning template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateArn;

/**
 <p>The name of the provisioning template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateName;

/**
 <p>The version of the provisioning template.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable versionId;

@end

/**
 
 */
@interface AWSIoTCreateRoleAliasRequest : AWSRequest


/**
 <p>How long (in seconds) the credentials will be valid. The default value is 3,600 seconds.</p><p>This value must be less than or equal to the maximum session duration of the IAM role that the role alias references.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable credentialDurationSeconds;

/**
 <p>The role alias that points to a role ARN. This allows you to change the role without having to update the device.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleAlias;

/**
 <p>The role ARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 <p>Metadata which can be used to manage the role alias.</p><note><p>For URI Request parameters use format: ...key1=value1&amp;key2=value2...</p><p>For the CLI command-line parameter use format: &amp;&amp;tags "key1=value1&amp;key2=value2..."</p><p>For the cli-input-json file use format: "tags": "key1=value1&amp;key2=value2..."</p></note>
 */
@property (nonatomic, strong) NSArray<AWSIoTTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSIoTCreateRoleAliasResponse : AWSModel


/**
 <p>The role alias.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleAlias;

/**
 <p>The role alias ARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleAliasArn;

@end

/**
 
 */
@interface AWSIoTCreateScheduledAuditRequest : AWSRequest


/**
 <p>The day of the month on which the scheduled audit takes place. This can be "1" through "31" or "LAST". This field is required if the "frequency" parameter is set to <code>MONTHLY</code>. If days 29 to 31 are specified, and the month doesn't have that many days, the audit takes place on the <code>LAST</code> day of the month.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dayOfMonth;

/**
 <p>The day of the week on which the scheduled audit takes place, either <code>SUN</code>, <code>MON</code>, <code>TUE</code>, <code>WED</code>, <code>THU</code>, <code>FRI</code>, or <code>SAT</code>. This field is required if the <code>frequency</code> parameter is set to <code>WEEKLY</code> or <code>BIWEEKLY</code>.</p>
 */
@property (nonatomic, assign) AWSIoTDayOfWeek dayOfWeek;

/**
 <p>How often the scheduled audit takes place, either <code>DAILY</code>, <code>WEEKLY</code>, <code>BIWEEKLY</code> or <code>MONTHLY</code>. The start time of each audit is determined by the system.</p>
 */
@property (nonatomic, assign) AWSIoTAuditFrequency frequency;

/**
 <p>The name you want to give to the scheduled audit. (Max. 128 chars)</p>
 */
@property (nonatomic, strong) NSString * _Nullable scheduledAuditName;

/**
 <p>Metadata that can be used to manage the scheduled audit.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTTag *> * _Nullable tags;

/**
 <p>Which checks are performed during the scheduled audit. Checks must be enabled for your account. (Use <code>DescribeAccountAuditConfiguration</code> to see the list of all checks, including those that are enabled or use <code>UpdateAccountAuditConfiguration</code> to select which checks are enabled.)</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable targetCheckNames;

@end

/**
 
 */
@interface AWSIoTCreateScheduledAuditResponse : AWSModel


/**
 <p>The ARN of the scheduled audit.</p>
 */
@property (nonatomic, strong) NSString * _Nullable scheduledAuditArn;

@end

/**
 
 */
@interface AWSIoTCreateSecurityProfileRequest : AWSRequest


/**
 <p><i>Please use <a>CreateSecurityProfileRequest$additionalMetricsToRetainV2</a> instead.</i></p><p>A list of metrics whose data is retained (stored). By default, data is retained for any metric used in the profile's <code>behaviors</code>, but it is also retained for any metric specified here. Can be used with custom metrics; cannot be used with dimensions.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable additionalMetricsToRetain;

/**
 <p>A list of metrics whose data is retained (stored). By default, data is retained for any metric used in the profile's <code>behaviors</code>, but it is also retained for any metric specified here. Can be used with custom metrics; cannot be used with dimensions.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTMetricToRetain *> * _Nullable additionalMetricsToRetainV2;

/**
 <p>Specifies the destinations to which alerts are sent. (Alerts are always sent to the console.) Alerts are generated when a device (thing) violates a behavior.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSIoTAlertTarget *> * _Nullable alertTargets;

/**
 <p>Specifies the behaviors that, when violated by a device (thing), cause an alert.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTBehavior *> * _Nullable behaviors;

/**
 <p>A description of the security profile.</p>
 */
@property (nonatomic, strong) NSString * _Nullable securityProfileDescription;

/**
 <p>The name you are giving to the security profile.</p>
 */
@property (nonatomic, strong) NSString * _Nullable securityProfileName;

/**
 <p>Metadata that can be used to manage the security profile.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSIoTCreateSecurityProfileResponse : AWSModel


/**
 <p>The ARN of the security profile.</p>
 */
@property (nonatomic, strong) NSString * _Nullable securityProfileArn;

/**
 <p>The name you gave to the security profile.</p>
 */
@property (nonatomic, strong) NSString * _Nullable securityProfileName;

@end

/**
 
 */
@interface AWSIoTCreateStreamRequest : AWSRequest


/**
 <p>A description of the stream.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The files to stream.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTStreamFile *> * _Nullable files;

/**
 <p>An IAM role that allows the IoT service principal to access your S3 files.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 <p>The stream ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable streamId;

/**
 <p>Metadata which can be used to manage streams.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSIoTCreateStreamResponse : AWSModel


/**
 <p>A description of the stream.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The stream ARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable streamArn;

/**
 <p>The stream ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable streamId;

/**
 <p>The version of the stream.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable streamVersion;

@end

/**
 
 */
@interface AWSIoTCreateThingGroupRequest : AWSRequest


/**
 <p>The name of the parent thing group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable parentGroupName;

/**
 <p>Metadata which can be used to manage the thing group.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTTag *> * _Nullable tags;

/**
 <p>The thing group name to create.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingGroupName;

/**
 <p>The thing group properties.</p>
 */
@property (nonatomic, strong) AWSIoTThingGroupProperties * _Nullable thingGroupProperties;

@end

/**
 
 */
@interface AWSIoTCreateThingGroupResponse : AWSModel


/**
 <p>The thing group ARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingGroupArn;

/**
 <p>The thing group ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingGroupId;

/**
 <p>The thing group name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingGroupName;

@end

/**
 <p>The input for the CreateThing operation.</p>
 Required parameters: [thingName]
 */
@interface AWSIoTCreateThingRequest : AWSRequest


/**
 <p>The attribute payload, which consists of up to three name/value pairs in a JSON document. For example:</p><p><code>{\"attributes\":{\"string1\":\"string2\"}}</code></p>
 */
@property (nonatomic, strong) AWSIoTAttributePayload * _Nullable attributePayload;

/**
 <p>The name of the billing group the thing will be added to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable billingGroupName;

/**
 <p>The name of the thing to create.</p><p>You can't change a thing's name after you create it. To change a thing's name, you must create a new thing, give it the new name, and then delete the old thing.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingName;

/**
 <p>The name of the thing type associated with the new thing.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingTypeName;

@end

/**
 <p>The output of the CreateThing operation.</p>
 */
@interface AWSIoTCreateThingResponse : AWSModel


/**
 <p>The ARN of the new thing.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingArn;

/**
 <p>The thing ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingId;

/**
 <p>The name of the new thing.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingName;

@end

/**
 <p>The input for the CreateThingType operation.</p>
 Required parameters: [thingTypeName]
 */
@interface AWSIoTCreateThingTypeRequest : AWSRequest


/**
 <p>Metadata which can be used to manage the thing type.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTTag *> * _Nullable tags;

/**
 <p>The name of the thing type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingTypeName;

/**
 <p>The ThingTypeProperties for the thing type to create. It contains information about the new thing type including a description, and a list of searchable thing attribute names.</p>
 */
@property (nonatomic, strong) AWSIoTThingTypeProperties * _Nullable thingTypeProperties;

@end

/**
 <p>The output of the CreateThingType operation.</p>
 */
@interface AWSIoTCreateThingTypeResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the thing type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingTypeArn;

/**
 <p>The thing type ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingTypeId;

/**
 <p>The name of the thing type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingTypeName;

@end

/**
 
 */
@interface AWSIoTCreateTopicRuleDestinationRequest : AWSRequest


/**
 <p>The topic rule destination configuration.</p>
 */
@property (nonatomic, strong) AWSIoTTopicRuleDestinationConfiguration * _Nullable destinationConfiguration;

@end

/**
 
 */
@interface AWSIoTCreateTopicRuleDestinationResponse : AWSModel


/**
 <p>The topic rule destination.</p>
 */
@property (nonatomic, strong) AWSIoTTopicRuleDestination * _Nullable topicRuleDestination;

@end

/**
 <p>The input for the CreateTopicRule operation.</p>
 Required parameters: [ruleName, topicRulePayload]
 */
@interface AWSIoTCreateTopicRuleRequest : AWSRequest


/**
 <p>The name of the rule.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ruleName;

/**
 <p>Metadata which can be used to manage the topic rule.</p><note><p>For URI Request parameters use format: ...key1=value1&amp;key2=value2...</p><p>For the CLI command-line parameter use format: --tags "key1=value1&amp;key2=value2..."</p><p>For the cli-input-json file use format: "tags": "key1=value1&amp;key2=value2..."</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable tags;

/**
 <p>The rule payload.</p>
 */
@property (nonatomic, strong) AWSIoTTopicRulePayload * _Nullable topicRulePayload;

@end

/**
 <p>Describes a custom method used to code sign a file.</p>
 */
@interface AWSIoTCustomCodeSigning : AWSModel


/**
 <p>The certificate chain.</p>
 */
@property (nonatomic, strong) AWSIoTCodeSigningCertificateChain * _Nullable certificateChain;

/**
 <p>The hash algorithm used to code sign the file. You can use a string as the algorithm name if the target over-the-air (OTA) update devices are able to verify the signature that was generated using the same signature algorithm. For example, FreeRTOS uses <code>SHA256</code> or <code>SHA1</code>, so you can pass either of them based on which was used for generating the signature.</p>
 */
@property (nonatomic, strong) NSString * _Nullable hashAlgorithm;

/**
 <p>The signature for the file.</p>
 */
@property (nonatomic, strong) AWSIoTCodeSigningSignature * _Nullable signature;

/**
 <p>The signature algorithm used to code sign the file. You can use a string as the algorithm name if the target over-the-air (OTA) update devices are able to verify the signature that was generated using the same signature algorithm. For example, FreeRTOS uses <code>ECDSA</code> or <code>RSA</code>, so you can pass either of them based on which was used for generating the signature.</p>
 */
@property (nonatomic, strong) NSString * _Nullable signatureAlgorithm;

@end

/**
 
 */
@interface AWSIoTDeleteAccountAuditConfigurationRequest : AWSRequest


/**
 <p>If true, all scheduled audits are deleted.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable deleteScheduledAudits;

@end

/**
 
 */
@interface AWSIoTDeleteAccountAuditConfigurationResponse : AWSModel


@end

/**
 
 */
@interface AWSIoTDeleteAuditSuppressionRequest : AWSRequest


/**
 <p>An audit check name. Checks must be enabled for your account. (Use <code>DescribeAccountAuditConfiguration</code> to see the list of all checks, including those that are enabled or use <code>UpdateAccountAuditConfiguration</code> to select which checks are enabled.)</p>
 */
@property (nonatomic, strong) NSString * _Nullable checkName;

/**
 <p>Information that identifies the noncompliant resource.</p>
 */
@property (nonatomic, strong) AWSIoTResourceIdentifier * _Nullable resourceIdentifier;

@end

/**
 
 */
@interface AWSIoTDeleteAuditSuppressionResponse : AWSModel


@end

/**
 
 */
@interface AWSIoTDeleteAuthorizerRequest : AWSRequest


/**
 <p>The name of the authorizer to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable authorizerName;

@end

/**
 
 */
@interface AWSIoTDeleteAuthorizerResponse : AWSModel


@end

/**
 
 */
@interface AWSIoTDeleteBillingGroupRequest : AWSRequest


/**
 <p>The name of the billing group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable billingGroupName;

/**
 <p>The expected version of the billing group. If the version of the billing group does not match the expected version specified in the request, the <code>DeleteBillingGroup</code> request is rejected with a <code>VersionConflictException</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable expectedVersion;

@end

/**
 
 */
@interface AWSIoTDeleteBillingGroupResponse : AWSModel


@end

/**
 <p>Input for the DeleteCACertificate operation.</p>
 Required parameters: [certificateId]
 */
@interface AWSIoTDeleteCACertificateRequest : AWSRequest


/**
 <p>The ID of the certificate to delete. (The last part of the certificate ARN contains the certificate ID.)</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificateId;

@end

/**
 <p>The output for the DeleteCACertificate operation.</p>
 */
@interface AWSIoTDeleteCACertificateResponse : AWSModel


@end

/**
 <p>The input for the DeleteCertificate operation.</p>
 Required parameters: [certificateId]
 */
@interface AWSIoTDeleteCertificateRequest : AWSRequest


/**
 <p>The ID of the certificate. (The last part of the certificate ARN contains the certificate ID.)</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificateId;

/**
 <p>Forces the deletion of a certificate if it is inactive and is not attached to an IoT thing.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable forceDelete;

@end

/**
 
 */
@interface AWSIoTDeleteCustomMetricRequest : AWSRequest


/**
 <p> The name of the custom metric. </p>
 */
@property (nonatomic, strong) NSString * _Nullable metricName;

@end

/**
 
 */
@interface AWSIoTDeleteCustomMetricResponse : AWSModel


@end

/**
 
 */
@interface AWSIoTDeleteDimensionRequest : AWSRequest


/**
 <p>The unique identifier for the dimension that you want to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSIoTDeleteDimensionResponse : AWSModel


@end

/**
 
 */
@interface AWSIoTDeleteDomainConfigurationRequest : AWSRequest


/**
 <p>The name of the domain configuration to be deleted.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainConfigurationName;

@end

/**
 
 */
@interface AWSIoTDeleteDomainConfigurationResponse : AWSModel


@end

/**
 
 */
@interface AWSIoTDeleteDynamicThingGroupRequest : AWSRequest


/**
 <p>The expected version of the dynamic thing group to delete.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable expectedVersion;

/**
 <p>The name of the dynamic thing group to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingGroupName;

@end

/**
 
 */
@interface AWSIoTDeleteDynamicThingGroupResponse : AWSModel


@end

/**
 
 */
@interface AWSIoTDeleteFleetMetricRequest : AWSRequest


/**
 <p>The expected version of the fleet metric to delete.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable expectedVersion;

/**
 <p>The name of the fleet metric to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable metricName;

@end

/**
 
 */
@interface AWSIoTDeleteJobExecutionRequest : AWSRequest


/**
 <p>The ID of the job execution to be deleted. The <code>executionNumber</code> refers to the execution of a particular job on a particular device.</p><p>Note that once a job execution is deleted, the <code>executionNumber</code> may be reused by IoT, so be sure you get and use the correct value here.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable executionNumber;

/**
 <p>(Optional) When true, you can delete a job execution which is "IN_PROGRESS". Otherwise, you can only delete a job execution which is in a terminal state ("SUCCEEDED", "FAILED", "REJECTED", "REMOVED" or "CANCELED") or an exception will occur. The default is false.</p><note><p>Deleting a job execution which is "IN_PROGRESS", will cause the device to be unable to access job information or update the job execution status. Use caution and ensure that the device is able to recover to a valid state.</p></note>
 */
@property (nonatomic, strong) NSNumber * _Nullable force;

/**
 <p>The ID of the job whose execution on a particular device will be deleted.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

/**
 <p>The namespace used to indicate that a job is a customer-managed job.</p><p>When you specify a value for this parameter, Amazon Web Services IoT Core sends jobs notifications to MQTT topics that contain the value in the following format.</p><p><code>$aws/things/<i>THING_NAME</i>/jobs/<i>JOB_ID</i>/notify-namespace-<i>NAMESPACE_ID</i>/</code></p><note><p>The <code>namespaceId</code> feature is in public preview.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable namespaceId;

/**
 <p>The name of the thing whose job execution will be deleted.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingName;

@end

/**
 
 */
@interface AWSIoTDeleteJobRequest : AWSRequest


/**
 <p>(Optional) When true, you can delete a job which is "IN_PROGRESS". Otherwise, you can only delete a job which is in a terminal state ("COMPLETED" or "CANCELED") or an exception will occur. The default is false.</p><note><p>Deleting a job which is "IN_PROGRESS", will cause a device which is executing the job to be unable to access job information or update the job execution status. Use caution and ensure that each device executing a job which is deleted is able to recover to a valid state.</p></note>
 */
@property (nonatomic, strong) NSNumber * _Nullable force;

/**
 <p>The ID of the job to be deleted.</p><p>After a job deletion is completed, you may reuse this jobId when you create a new job. However, this is not recommended, and you must ensure that your devices are not using the jobId to refer to the deleted job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

/**
 <p>The namespace used to indicate that a job is a customer-managed job.</p><p>When you specify a value for this parameter, Amazon Web Services IoT Core sends jobs notifications to MQTT topics that contain the value in the following format.</p><p><code>$aws/things/<i>THING_NAME</i>/jobs/<i>JOB_ID</i>/notify-namespace-<i>NAMESPACE_ID</i>/</code></p><note><p>The <code>namespaceId</code> feature is in public preview.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable namespaceId;

@end

/**
 
 */
@interface AWSIoTDeleteJobTemplateRequest : AWSRequest


/**
 <p>The unique identifier of the job template to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobTemplateId;

@end

/**
 
 */
@interface AWSIoTDeleteMitigationActionRequest : AWSRequest


/**
 <p>The name of the mitigation action that you want to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable actionName;

@end

/**
 
 */
@interface AWSIoTDeleteMitigationActionResponse : AWSModel


@end

/**
 
 */
@interface AWSIoTDeleteOTAUpdateRequest : AWSRequest


/**
 <p>When true, the stream created by the OTAUpdate process is deleted when the OTA update is deleted. Ignored if the stream specified in the OTAUpdate is supplied by the user.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable deleteStream;

/**
 <p>When true, deletes the IoT job created by the OTAUpdate process even if it is "IN_PROGRESS". Otherwise, if the job is not in a terminal state ("COMPLETED" or "CANCELED") an exception will occur. The default is false.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable forceDeleteAWSJob;

/**
 <p>The ID of the OTA update to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable otaUpdateId;

@end

/**
 
 */
@interface AWSIoTDeleteOTAUpdateResponse : AWSModel


@end

/**
 <p>The input for the DeletePolicy operation.</p>
 Required parameters: [policyName]
 */
@interface AWSIoTDeletePolicyRequest : AWSRequest


/**
 <p>The name of the policy to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyName;

@end

/**
 <p>The input for the DeletePolicyVersion operation.</p>
 Required parameters: [policyName, policyVersionId]
 */
@interface AWSIoTDeletePolicyVersionRequest : AWSRequest


/**
 <p>The name of the policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyName;

/**
 <p>The policy version ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyVersionId;

@end

/**
 
 */
@interface AWSIoTDeleteProvisioningTemplateRequest : AWSRequest


/**
 <p>The name of the fleet provision template to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateName;

@end

/**
 
 */
@interface AWSIoTDeleteProvisioningTemplateResponse : AWSModel


@end

/**
 
 */
@interface AWSIoTDeleteProvisioningTemplateVersionRequest : AWSRequest


/**
 <p>The name of the provisioning template version to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateName;

/**
 <p>The provisioning template version ID to delete.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable versionId;

@end

/**
 
 */
@interface AWSIoTDeleteProvisioningTemplateVersionResponse : AWSModel


@end

/**
 <p>The input for the DeleteRegistrationCode operation.</p>
 */
@interface AWSIoTDeleteRegistrationCodeRequest : AWSRequest


@end

/**
 <p>The output for the DeleteRegistrationCode operation.</p>
 */
@interface AWSIoTDeleteRegistrationCodeResponse : AWSModel


@end

/**
 
 */
@interface AWSIoTDeleteRoleAliasRequest : AWSRequest


/**
 <p>The role alias to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleAlias;

@end

/**
 
 */
@interface AWSIoTDeleteRoleAliasResponse : AWSModel


@end

/**
 
 */
@interface AWSIoTDeleteScheduledAuditRequest : AWSRequest


/**
 <p>The name of the scheduled audit you want to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable scheduledAuditName;

@end

/**
 
 */
@interface AWSIoTDeleteScheduledAuditResponse : AWSModel


@end

/**
 
 */
@interface AWSIoTDeleteSecurityProfileRequest : AWSRequest


/**
 <p>The expected version of the security profile. A new version is generated whenever the security profile is updated. If you specify a value that is different from the actual version, a <code>VersionConflictException</code> is thrown.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable expectedVersion;

/**
 <p>The name of the security profile to be deleted.</p>
 */
@property (nonatomic, strong) NSString * _Nullable securityProfileName;

@end

/**
 
 */
@interface AWSIoTDeleteSecurityProfileResponse : AWSModel


@end

/**
 
 */
@interface AWSIoTDeleteStreamRequest : AWSRequest


/**
 <p>The stream ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable streamId;

@end

/**
 
 */
@interface AWSIoTDeleteStreamResponse : AWSModel


@end

/**
 
 */
@interface AWSIoTDeleteThingGroupRequest : AWSRequest


/**
 <p>The expected version of the thing group to delete.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable expectedVersion;

/**
 <p>The name of the thing group to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingGroupName;

@end

/**
 
 */
@interface AWSIoTDeleteThingGroupResponse : AWSModel


@end

/**
 <p>The input for the DeleteThing operation.</p>
 Required parameters: [thingName]
 */
@interface AWSIoTDeleteThingRequest : AWSRequest


/**
 <p>The expected version of the thing record in the registry. If the version of the record in the registry does not match the expected version specified in the request, the <code>DeleteThing</code> request is rejected with a <code>VersionConflictException</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable expectedVersion;

/**
 <p>The name of the thing to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingName;

@end

/**
 <p>The output of the DeleteThing operation.</p>
 */
@interface AWSIoTDeleteThingResponse : AWSModel


@end

/**
 <p>The input for the DeleteThingType operation.</p>
 Required parameters: [thingTypeName]
 */
@interface AWSIoTDeleteThingTypeRequest : AWSRequest


/**
 <p>The name of the thing type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingTypeName;

@end

/**
 <p>The output for the DeleteThingType operation.</p>
 */
@interface AWSIoTDeleteThingTypeResponse : AWSModel


@end

/**
 
 */
@interface AWSIoTDeleteTopicRuleDestinationRequest : AWSRequest


/**
 <p>The ARN of the topic rule destination to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

@end

/**
 
 */
@interface AWSIoTDeleteTopicRuleDestinationResponse : AWSModel


@end

/**
 <p>The input for the DeleteTopicRule operation.</p>
 Required parameters: [ruleName]
 */
@interface AWSIoTDeleteTopicRuleRequest : AWSRequest


/**
 <p>The name of the rule.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ruleName;

@end

/**
 
 */
@interface AWSIoTDeleteV2LoggingLevelRequest : AWSRequest


/**
 <p>The name of the resource for which you are configuring logging.</p>
 */
@property (nonatomic, strong) NSString * _Nullable targetName;

/**
 <p>The type of resource for which you are configuring logging. Must be <code>THING_Group</code>.</p>
 */
@property (nonatomic, assign) AWSIoTLogTargetType targetType;

@end

/**
 <p>Contains information that denied the authorization.</p>
 */
@interface AWSIoTDenied : AWSModel


/**
 <p>Information that explicitly denies the authorization. </p>
 */
@property (nonatomic, strong) AWSIoTExplicitDeny * _Nullable explicitDeny;

/**
 <p>Information that implicitly denies the authorization. When a policy doesn't explicitly deny or allow an action on a resource it is considered an implicit deny.</p>
 */
@property (nonatomic, strong) AWSIoTImplicitDeny * _Nullable implicitDeny;

@end

/**
 <p>The input for the DeprecateThingType operation.</p>
 Required parameters: [thingTypeName]
 */
@interface AWSIoTDeprecateThingTypeRequest : AWSRequest


/**
 <p>The name of the thing type to deprecate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingTypeName;

/**
 <p>Whether to undeprecate a deprecated thing type. If <b>true</b>, the thing type will not be deprecated anymore and you can associate it with things.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable undoDeprecate;

@end

/**
 <p>The output for the DeprecateThingType operation.</p>
 */
@interface AWSIoTDeprecateThingTypeResponse : AWSModel


@end

/**
 
 */
@interface AWSIoTDescribeAccountAuditConfigurationRequest : AWSRequest


@end

/**
 
 */
@interface AWSIoTDescribeAccountAuditConfigurationResponse : AWSModel


/**
 <p>Which audit checks are enabled and disabled for this account.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSIoTAuditCheckConfiguration *> * _Nullable auditCheckConfigurations;

/**
 <p>Information about the targets to which audit notifications are sent for this account.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSIoTAuditNotificationTarget *> * _Nullable auditNotificationTargetConfigurations;

/**
 <p>The ARN of the role that grants permission to IoT to access information about your devices, policies, certificates, and other items as required when performing an audit.</p><p>On the first call to <code>UpdateAccountAuditConfiguration</code>, this parameter is required.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

@end

/**
 
 */
@interface AWSIoTDescribeAuditFindingRequest : AWSRequest


/**
 <p>A unique identifier for a single audit finding. You can use this identifier to apply mitigation actions to the finding.</p>
 */
@property (nonatomic, strong) NSString * _Nullable findingId;

@end

/**
 
 */
@interface AWSIoTDescribeAuditFindingResponse : AWSModel


/**
 <p>The findings (results) of the audit.</p>
 */
@property (nonatomic, strong) AWSIoTAuditFinding * _Nullable finding;

@end

/**
 
 */
@interface AWSIoTDescribeAuditMitigationActionsTaskRequest : AWSRequest


/**
 <p>The unique identifier for the audit mitigation task.</p>
 */
@property (nonatomic, strong) NSString * _Nullable taskId;

@end

/**
 
 */
@interface AWSIoTDescribeAuditMitigationActionsTaskResponse : AWSModel


/**
 <p>Specifies the mitigation actions and their parameters that are applied as part of this task.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTMitigationAction *> * _Nullable actionsDefinition;

/**
 <p>Specifies the mitigation actions that should be applied to specific audit checks.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSArray<NSString *> *> * _Nullable auditCheckToActionsMapping;

/**
 <p>The date and time when the task was completed or canceled.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable endTime;

/**
 <p>The date and time when the task was started.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable startTime;

/**
 <p>Identifies the findings to which the mitigation actions are applied. This can be by audit checks, by audit task, or a set of findings.</p>
 */
@property (nonatomic, strong) AWSIoTAuditMitigationActionsTaskTarget * _Nullable target;

/**
 <p>Aggregate counts of the results when the mitigation tasks were applied to the findings for this audit mitigation actions task.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSIoTTaskStatisticsForAuditCheck *> * _Nullable taskStatistics;

/**
 <p>The current status of the task.</p>
 */
@property (nonatomic, assign) AWSIoTAuditMitigationActionsTaskStatus taskStatus;

@end

/**
 
 */
@interface AWSIoTDescribeAuditSuppressionRequest : AWSRequest


/**
 <p>An audit check name. Checks must be enabled for your account. (Use <code>DescribeAccountAuditConfiguration</code> to see the list of all checks, including those that are enabled or use <code>UpdateAccountAuditConfiguration</code> to select which checks are enabled.)</p>
 */
@property (nonatomic, strong) NSString * _Nullable checkName;

/**
 <p>Information that identifies the noncompliant resource.</p>
 */
@property (nonatomic, strong) AWSIoTResourceIdentifier * _Nullable resourceIdentifier;

@end

/**
 
 */
@interface AWSIoTDescribeAuditSuppressionResponse : AWSModel


/**
 <p>An audit check name. Checks must be enabled for your account. (Use <code>DescribeAccountAuditConfiguration</code> to see the list of all checks, including those that are enabled or use <code>UpdateAccountAuditConfiguration</code> to select which checks are enabled.)</p>
 */
@property (nonatomic, strong) NSString * _Nullable checkName;

/**
 <p> The description of the audit suppression. </p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p> The epoch timestamp in seconds at which this suppression expires. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable expirationDate;

/**
 <p>Information that identifies the noncompliant resource.</p>
 */
@property (nonatomic, strong) AWSIoTResourceIdentifier * _Nullable resourceIdentifier;

/**
 <p> Indicates whether a suppression should exist indefinitely or not. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable suppressIndefinitely;

@end

/**
 
 */
@interface AWSIoTDescribeAuditTaskRequest : AWSRequest


/**
 <p>The ID of the audit whose information you want to get.</p>
 */
@property (nonatomic, strong) NSString * _Nullable taskId;

@end

/**
 
 */
@interface AWSIoTDescribeAuditTaskResponse : AWSModel


/**
 <p>Detailed information about each check performed during this audit.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSIoTAuditCheckDetails *> * _Nullable auditDetails;

/**
 <p>The name of the scheduled audit (only if the audit was a scheduled audit).</p>
 */
@property (nonatomic, strong) NSString * _Nullable scheduledAuditName;

/**
 <p>The time the audit started.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable taskStartTime;

/**
 <p>Statistical information about the audit.</p>
 */
@property (nonatomic, strong) AWSIoTTaskStatistics * _Nullable taskStatistics;

/**
 <p>The status of the audit: one of "IN_PROGRESS", "COMPLETED", "FAILED", or "CANCELED".</p>
 */
@property (nonatomic, assign) AWSIoTAuditTaskStatus taskStatus;

/**
 <p>The type of audit: "ON_DEMAND_AUDIT_TASK" or "SCHEDULED_AUDIT_TASK".</p>
 */
@property (nonatomic, assign) AWSIoTAuditTaskType taskType;

@end

/**
 
 */
@interface AWSIoTDescribeAuthorizerRequest : AWSRequest


/**
 <p>The name of the authorizer to describe.</p>
 */
@property (nonatomic, strong) NSString * _Nullable authorizerName;

@end

/**
 
 */
@interface AWSIoTDescribeAuthorizerResponse : AWSModel


/**
 <p>The authorizer description.</p>
 */
@property (nonatomic, strong) AWSIoTAuthorizerDescription * _Nullable authorizerDescription;

@end

/**
 
 */
@interface AWSIoTDescribeBillingGroupRequest : AWSRequest


/**
 <p>The name of the billing group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable billingGroupName;

@end

/**
 
 */
@interface AWSIoTDescribeBillingGroupResponse : AWSModel


/**
 <p>The ARN of the billing group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable billingGroupArn;

/**
 <p>The ID of the billing group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable billingGroupId;

/**
 <p>Additional information about the billing group.</p>
 */
@property (nonatomic, strong) AWSIoTBillingGroupMetadata * _Nullable billingGroupMetadata;

/**
 <p>The name of the billing group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable billingGroupName;

/**
 <p>The properties of the billing group.</p>
 */
@property (nonatomic, strong) AWSIoTBillingGroupProperties * _Nullable billingGroupProperties;

/**
 <p>The version of the billing group.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable version;

@end

/**
 <p>The input for the DescribeCACertificate operation.</p>
 Required parameters: [certificateId]
 */
@interface AWSIoTDescribeCACertificateRequest : AWSRequest


/**
 <p>The CA certificate identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificateId;

@end

/**
 <p>The output from the DescribeCACertificate operation.</p>
 */
@interface AWSIoTDescribeCACertificateResponse : AWSModel


/**
 <p>The CA certificate description.</p>
 */
@property (nonatomic, strong) AWSIoTCACertificateDescription * _Nullable certificateDescription;

/**
 <p>Information about the registration configuration.</p>
 */
@property (nonatomic, strong) AWSIoTRegistrationConfig * _Nullable registrationConfig;

@end

/**
 <p>The input for the DescribeCertificate operation.</p>
 Required parameters: [certificateId]
 */
@interface AWSIoTDescribeCertificateRequest : AWSRequest


/**
 <p>The ID of the certificate. (The last part of the certificate ARN contains the certificate ID.)</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificateId;

@end

/**
 <p>The output of the DescribeCertificate operation.</p>
 */
@interface AWSIoTDescribeCertificateResponse : AWSModel


/**
 <p>The description of the certificate.</p>
 */
@property (nonatomic, strong) AWSIoTCertificateDescription * _Nullable certificateDescription;

@end

/**
 
 */
@interface AWSIoTDescribeCustomMetricRequest : AWSRequest


/**
 <p> The name of the custom metric. </p>
 */
@property (nonatomic, strong) NSString * _Nullable metricName;

@end

/**
 
 */
@interface AWSIoTDescribeCustomMetricResponse : AWSModel


/**
 <p> The creation date of the custom metric in milliseconds since epoch. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDate;

/**
 <p> Field represents a friendly name in the console for the custom metric; doesn't have to be unique. Don't use this name as the metric identifier in the device metric report. Can be updated. </p>
 */
@property (nonatomic, strong) NSString * _Nullable displayName;

/**
 <p> The time the custom metric was last modified in milliseconds since epoch. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedDate;

/**
 <p> The Amazon Resource Number (ARN) of the custom metric. </p>
 */
@property (nonatomic, strong) NSString * _Nullable metricArn;

/**
 <p> The name of the custom metric. </p>
 */
@property (nonatomic, strong) NSString * _Nullable metricName;

/**
 <p> The type of the custom metric. </p><important><p>The type <code>number</code> only takes a single metric value as an input, but while submitting the metrics value in the DeviceMetrics report, it must be passed as an array with a single value.</p></important>
 */
@property (nonatomic, assign) AWSIoTCustomMetricType metricType;

@end

/**
 
 */
@interface AWSIoTDescribeDefaultAuthorizerRequest : AWSRequest


@end

/**
 
 */
@interface AWSIoTDescribeDefaultAuthorizerResponse : AWSModel


/**
 <p>The default authorizer's description.</p>
 */
@property (nonatomic, strong) AWSIoTAuthorizerDescription * _Nullable authorizerDescription;

@end

/**
 
 */
@interface AWSIoTDescribeDetectMitigationActionsTaskRequest : AWSRequest


/**
 <p> The unique identifier of the task. </p>
 */
@property (nonatomic, strong) NSString * _Nullable taskId;

@end

/**
 
 */
@interface AWSIoTDescribeDetectMitigationActionsTaskResponse : AWSModel


/**
 <p> The description of a task. </p>
 */
@property (nonatomic, strong) AWSIoTDetectMitigationActionsTaskSummary * _Nullable taskSummary;

@end

/**
 
 */
@interface AWSIoTDescribeDimensionRequest : AWSRequest


/**
 <p>The unique identifier for the dimension.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSIoTDescribeDimensionResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) for the dimension.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The date the dimension was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDate;

/**
 <p>The date the dimension was last modified.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedDate;

/**
 <p>The unique identifier for the dimension.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The value or list of values used to scope the dimension. For example, for topic filters, this is the pattern used to match the MQTT topic name.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable stringValues;

/**
 <p>The type of the dimension.</p>
 */
@property (nonatomic, assign) AWSIoTDimensionType types;

@end

/**
 
 */
@interface AWSIoTDescribeDomainConfigurationRequest : AWSRequest


/**
 <p>The name of the domain configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainConfigurationName;

@end

/**
 
 */
@interface AWSIoTDescribeDomainConfigurationResponse : AWSModel


/**
 <p>An object that specifies the authorization service for a domain.</p>
 */
@property (nonatomic, strong) AWSIoTAuthorizerConfig * _Nullable authorizerConfig;

/**
 <p>The ARN of the domain configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainConfigurationArn;

/**
 <p>The name of the domain configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainConfigurationName;

/**
 <p>A Boolean value that specifies the current state of the domain configuration.</p>
 */
@property (nonatomic, assign) AWSIoTDomainConfigurationStatus domainConfigurationStatus;

/**
 <p>The name of the domain.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainName;

/**
 <p>The type of the domain.</p>
 */
@property (nonatomic, assign) AWSIoTDomainType domainType;

/**
 <p>The date and time the domain configuration's status was last changed.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastStatusChangeDate;

/**
 <p>A list containing summary information about the server certificate included in the domain configuration.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTServerCertificateSummary *> * _Nullable serverCertificates;

/**
 <p>The type of service delivered by the endpoint.</p>
 */
@property (nonatomic, assign) AWSIoTServiceType serviceType;

@end

/**
 <p>The input for the DescribeEndpoint operation.</p>
 */
@interface AWSIoTDescribeEndpointRequest : AWSRequest


/**
 <p>The endpoint type. Valid endpoint types include:</p><ul><li><p><code>iot:Data</code> - Returns a VeriSign signed data endpoint.</p></li></ul><ul><li><p><code>iot:Data-ATS</code> - Returns an ATS signed data endpoint.</p></li></ul><ul><li><p><code>iot:CredentialProvider</code> - Returns an IoT credentials provider API endpoint.</p></li></ul><ul><li><p><code>iot:Jobs</code> - Returns an IoT device management Jobs API endpoint.</p></li></ul><p>We strongly recommend that customers use the newer <code>iot:Data-ATS</code> endpoint type to avoid issues related to the widespread distrust of Symantec certificate authorities.</p>
 */
@property (nonatomic, strong) NSString * _Nullable endpointType;

@end

/**
 <p>The output from the DescribeEndpoint operation.</p>
 */
@interface AWSIoTDescribeEndpointResponse : AWSModel


/**
 <p>The endpoint. The format of the endpoint is as follows: <i>identifier</i>.iot.<i>region</i>.amazonaws.com.</p>
 */
@property (nonatomic, strong) NSString * _Nullable endpointAddress;

@end

/**
 
 */
@interface AWSIoTDescribeEventConfigurationsRequest : AWSRequest


@end

/**
 
 */
@interface AWSIoTDescribeEventConfigurationsResponse : AWSModel


/**
 <p>The creation date of the event configuration.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDate;

/**
 <p>The event configurations.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSIoTConfiguration *> * _Nullable eventConfigurations;

/**
 <p>The date the event configurations were last modified.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedDate;

@end

/**
 
 */
@interface AWSIoTDescribeFleetMetricRequest : AWSRequest


/**
 <p>The name of the fleet metric to describe.</p>
 */
@property (nonatomic, strong) NSString * _Nullable metricName;

@end

/**
 
 */
@interface AWSIoTDescribeFleetMetricResponse : AWSModel


/**
 <p>The field to aggregate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable aggregationField;

/**
 <p>The type of the aggregation query.</p>
 */
@property (nonatomic, strong) AWSIoTAggregationType * _Nullable aggregationType;

/**
 <p>The date when the fleet metric is created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDate;

/**
 <p>The fleet metric description.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The name of the index to search.</p>
 */
@property (nonatomic, strong) NSString * _Nullable indexName;

/**
 <p>The date when the fleet metric is last modified.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedDate;

/**
 <p>The ARN of the fleet metric to describe.</p>
 */
@property (nonatomic, strong) NSString * _Nullable metricArn;

/**
 <p>The name of the fleet metric to describe.</p>
 */
@property (nonatomic, strong) NSString * _Nullable metricName;

/**
 <p>The time in seconds between fleet metric emissions. Range [60(1 min), 86400(1 day)] and must be multiple of 60.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable period;

/**
 <p>The search query string.</p>
 */
@property (nonatomic, strong) NSString * _Nullable queryString;

/**
 <p>The query version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable queryVersion;

/**
 <p>Used to support unit transformation such as milliseconds to seconds. The unit must be supported by <a href="https://docs.aws.amazon.com/https:/docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_MetricDatum.html">CW metric</a>.</p>
 */
@property (nonatomic, assign) AWSIoTFleetMetricUnit unit;

/**
 <p>The version of the fleet metric.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable version;

@end

/**
 
 */
@interface AWSIoTDescribeIndexRequest : AWSRequest


/**
 <p>The index name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable indexName;

@end

/**
 
 */
@interface AWSIoTDescribeIndexResponse : AWSModel


/**
 <p>The index name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable indexName;

/**
 <p>The index status.</p>
 */
@property (nonatomic, assign) AWSIoTIndexStatus indexStatus;

/**
 <p>Contains a value that specifies the type of indexing performed. Valid values are:</p><ul><li><p>REGISTRY – Your thing index contains only registry data.</p></li><li><p>REGISTRY_AND_SHADOW - Your thing index contains registry data and shadow data.</p></li><li><p>REGISTRY_AND_CONNECTIVITY_STATUS - Your thing index contains registry data and thing connectivity status data.</p></li><li><p>REGISTRY_AND_SHADOW_AND_CONNECTIVITY_STATUS - Your thing index contains registry data, shadow data, and thing connectivity status data.</p></li><li><p>MULTI_INDEXING_MODE - Your thing index contains multiple data sources. For more information, see <a href="https://docs.aws.amazon.com/iot/latest/apireference/API_GetIndexingConfiguration.html">GetIndexingConfiguration</a>.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable schema;

@end

/**
 
 */
@interface AWSIoTDescribeJobExecutionRequest : AWSRequest


/**
 <p>A string (consisting of the digits "0" through "9" which is used to specify a particular job execution on a particular device.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable executionNumber;

/**
 <p>The unique identifier you assigned to this job when it was created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

/**
 <p>The name of the thing on which the job execution is running.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingName;

@end

/**
 
 */
@interface AWSIoTDescribeJobExecutionResponse : AWSModel


/**
 <p>Information about the job execution.</p>
 */
@property (nonatomic, strong) AWSIoTJobExecution * _Nullable execution;

@end

/**
 
 */
@interface AWSIoTDescribeJobRequest : AWSRequest


/**
 <p>The unique identifier you assigned to this job when it was created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

@end

/**
 
 */
@interface AWSIoTDescribeJobResponse : AWSModel


/**
 <p>An S3 link to the job document.</p>
 */
@property (nonatomic, strong) NSString * _Nullable documentSource;

/**
 <p>Information about the job.</p>
 */
@property (nonatomic, strong) AWSIoTJob * _Nullable job;

@end

/**
 
 */
@interface AWSIoTDescribeJobTemplateRequest : AWSRequest


/**
 <p>The unique identifier of the job template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobTemplateId;

@end

/**
 
 */
@interface AWSIoTDescribeJobTemplateResponse : AWSModel


/**
 <p>The criteria that determine when and how a job abort takes place.</p>
 */
@property (nonatomic, strong) AWSIoTAbortConfig * _Nullable abortConfig;

/**
 <p>The time, in seconds since the epoch, when the job template was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdAt;

/**
 <p>A description of the job template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The job document.</p>
 */
@property (nonatomic, strong) NSString * _Nullable document;

/**
 <p>An S3 link to the job document.</p>
 */
@property (nonatomic, strong) NSString * _Nullable documentSource;

/**
 <p>The configuration that determines how many retries are allowed for each failure type for a job.</p>
 */
@property (nonatomic, strong) AWSIoTJobExecutionsRetryConfig * _Nullable jobExecutionsRetryConfig;

/**
 <p>Allows you to create a staged rollout of a job.</p>
 */
@property (nonatomic, strong) AWSIoTJobExecutionsRolloutConfig * _Nullable jobExecutionsRolloutConfig;

/**
 <p>The ARN of the job template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobTemplateArn;

/**
 <p>The unique identifier of the job template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobTemplateId;

/**
 <p>Configuration for pre-signed S3 URLs.</p>
 */
@property (nonatomic, strong) AWSIoTPresignedUrlConfig * _Nullable presignedUrlConfig;

/**
 <p>Specifies the amount of time each device has to finish its execution of the job. A timer is started when the job execution status is set to <code>IN_PROGRESS</code>. If the job execution status is not set to another terminal state before the timer expires, it will be automatically set to <code>TIMED_OUT</code>.</p>
 */
@property (nonatomic, strong) AWSIoTTimeoutConfig * _Nullable timeoutConfig;

@end

/**
 
 */
@interface AWSIoTDescribeManagedJobTemplateRequest : AWSRequest


/**
 <p>The unique name of a managed job template, which is required.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateName;

/**
 <p>An optional parameter to specify version of a managed template. If not specified, the pre-defined default version is returned.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateVersion;

@end

/**
 
 */
@interface AWSIoTDescribeManagedJobTemplateResponse : AWSModel


/**
 <p>The unique description of a managed template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The document schema for a managed job template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable document;

/**
 <p>A map of key-value pairs that you can use as guidance to specify the inputs for creating a job from a managed template.</p><note><p><code>documentParameters</code> can only be used when creating jobs from Amazon Web Services managed templates. This parameter can't be used with custom job templates or to create jobs from them.</p></note>
 */
@property (nonatomic, strong) NSArray<AWSIoTDocumentParameter *> * _Nullable documentParameters;

/**
 <p>A list of environments that are supported with the managed job template.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable environments;

/**
 <p>The unique Amazon Resource Name (ARN) of the managed template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateArn;

/**
 <p>The unique name of a managed template, such as <code>AWS-Reboot</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateName;

/**
 <p>The version for a managed template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateVersion;

@end

/**
 
 */
@interface AWSIoTDescribeMitigationActionRequest : AWSRequest


/**
 <p>The friendly name that uniquely identifies the mitigation action.</p>
 */
@property (nonatomic, strong) NSString * _Nullable actionName;

@end

/**
 
 */
@interface AWSIoTDescribeMitigationActionResponse : AWSModel


/**
 <p>The ARN that identifies this migration action.</p>
 */
@property (nonatomic, strong) NSString * _Nullable actionArn;

/**
 <p>A unique identifier for this action.</p>
 */
@property (nonatomic, strong) NSString * _Nullable actionId;

/**
 <p>The friendly name that uniquely identifies the mitigation action.</p>
 */
@property (nonatomic, strong) NSString * _Nullable actionName;

/**
 <p>Parameters that control how the mitigation action is applied, specific to the type of mitigation action.</p>
 */
@property (nonatomic, strong) AWSIoTMitigationActionParams * _Nullable actionParams;

/**
 <p>The type of mitigation action.</p>
 */
@property (nonatomic, assign) AWSIoTMitigationActionType actionType;

/**
 <p>The date and time when the mitigation action was added to your Amazon Web Services accounts.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDate;

/**
 <p>The date and time when the mitigation action was last changed.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedDate;

/**
 <p>The ARN of the IAM role used to apply this action.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

@end

/**
 
 */
@interface AWSIoTDescribeProvisioningTemplateRequest : AWSRequest


/**
 <p>The name of the provisioning template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateName;

@end

/**
 
 */
@interface AWSIoTDescribeProvisioningTemplateResponse : AWSModel


/**
 <p>The date when the provisioning template was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDate;

/**
 <p>The default fleet template version ID.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable defaultVersionId;

/**
 <p>The description of the provisioning template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>True if the provisioning template is enabled, otherwise false.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

/**
 <p>The date when the provisioning template was last modified.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedDate;

/**
 <p>Gets information about a pre-provisioned hook.</p>
 */
@property (nonatomic, strong) AWSIoTProvisioningHook * _Nullable preProvisioningHook;

/**
 <p>The ARN of the role associated with the provisioning template. This IoT role grants permission to provision a device.</p>
 */
@property (nonatomic, strong) NSString * _Nullable provisioningRoleArn;

/**
 <p>The ARN of the provisioning template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateArn;

/**
 <p>The JSON formatted contents of the provisioning template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateBody;

/**
 <p>The name of the provisioning template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateName;

/**
 <p>The type you define in a provisioning template. You can create a template with only one type. You can't change the template type after its creation. The default value is <code>FLEET_PROVISIONING</code>. For more information about provisioning template, see: <a href="https://docs.aws.amazon.com/iot/latest/developerguide/provision-template.html">Provisioning template</a>. </p>
 */
@property (nonatomic, assign) AWSIoTTemplateType types;

@end

/**
 
 */
@interface AWSIoTDescribeProvisioningTemplateVersionRequest : AWSRequest


/**
 <p>The template name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateName;

/**
 <p>The provisioning template version ID.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable versionId;

@end

/**
 
 */
@interface AWSIoTDescribeProvisioningTemplateVersionResponse : AWSModel


/**
 <p>The date when the provisioning template version was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDate;

/**
 <p>True if the provisioning template version is the default version.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isDefaultVersion;

/**
 <p>The JSON formatted contents of the provisioning template version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateBody;

/**
 <p>The provisioning template version ID.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable versionId;

@end

/**
 
 */
@interface AWSIoTDescribeRoleAliasRequest : AWSRequest


/**
 <p>The role alias to describe.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleAlias;

@end

/**
 
 */
@interface AWSIoTDescribeRoleAliasResponse : AWSModel


/**
 <p>The role alias description.</p>
 */
@property (nonatomic, strong) AWSIoTRoleAliasDescription * _Nullable roleAliasDescription;

@end

/**
 
 */
@interface AWSIoTDescribeScheduledAuditRequest : AWSRequest


/**
 <p>The name of the scheduled audit whose information you want to get.</p>
 */
@property (nonatomic, strong) NSString * _Nullable scheduledAuditName;

@end

/**
 
 */
@interface AWSIoTDescribeScheduledAuditResponse : AWSModel


/**
 <p>The day of the month on which the scheduled audit takes place. This is will be <code>1</code> through <code>31</code> or <code>LAST</code>. If days <code>29</code>-<code>31</code> are specified, and the month does not have that many days, the audit takes place on the <code>LAST</code> day of the month.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dayOfMonth;

/**
 <p>The day of the week on which the scheduled audit takes place, either one of <code>SUN</code>, <code>MON</code>, <code>TUE</code>, <code>WED</code>, <code>THU</code>, <code>FRI</code>, or <code>SAT</code>.</p>
 */
@property (nonatomic, assign) AWSIoTDayOfWeek dayOfWeek;

/**
 <p>How often the scheduled audit takes place, either one of <code>DAILY</code>, <code>WEEKLY</code>, <code>BIWEEKLY</code>, or <code>MONTHLY</code>. The start time of each audit is determined by the system.</p>
 */
@property (nonatomic, assign) AWSIoTAuditFrequency frequency;

/**
 <p>The ARN of the scheduled audit.</p>
 */
@property (nonatomic, strong) NSString * _Nullable scheduledAuditArn;

/**
 <p>The name of the scheduled audit.</p>
 */
@property (nonatomic, strong) NSString * _Nullable scheduledAuditName;

/**
 <p>Which checks are performed during the scheduled audit. Checks must be enabled for your account. (Use <code>DescribeAccountAuditConfiguration</code> to see the list of all checks, including those that are enabled or use <code>UpdateAccountAuditConfiguration</code> to select which checks are enabled.)</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable targetCheckNames;

@end

/**
 
 */
@interface AWSIoTDescribeSecurityProfileRequest : AWSRequest


/**
 <p>The name of the security profile whose information you want to get.</p>
 */
@property (nonatomic, strong) NSString * _Nullable securityProfileName;

@end

/**
 
 */
@interface AWSIoTDescribeSecurityProfileResponse : AWSModel


/**
 <p><i>Please use <a>DescribeSecurityProfileResponse$additionalMetricsToRetainV2</a> instead.</i></p><p>A list of metrics whose data is retained (stored). By default, data is retained for any metric used in the profile's <code>behaviors</code>, but it is also retained for any metric specified here.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable additionalMetricsToRetain;

/**
 <p>A list of metrics whose data is retained (stored). By default, data is retained for any metric used in the profile's behaviors, but it is also retained for any metric specified here.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTMetricToRetain *> * _Nullable additionalMetricsToRetainV2;

/**
 <p>Where the alerts are sent. (Alerts are always sent to the console.)</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSIoTAlertTarget *> * _Nullable alertTargets;

/**
 <p>Specifies the behaviors that, when violated by a device (thing), cause an alert.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTBehavior *> * _Nullable behaviors;

/**
 <p>The time the security profile was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDate;

/**
 <p>The time the security profile was last modified.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedDate;

/**
 <p>The ARN of the security profile.</p>
 */
@property (nonatomic, strong) NSString * _Nullable securityProfileArn;

/**
 <p>A description of the security profile (associated with the security profile when it was created or updated).</p>
 */
@property (nonatomic, strong) NSString * _Nullable securityProfileDescription;

/**
 <p>The name of the security profile.</p>
 */
@property (nonatomic, strong) NSString * _Nullable securityProfileName;

/**
 <p>The version of the security profile. A new version is generated whenever the security profile is updated.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable version;

@end

/**
 
 */
@interface AWSIoTDescribeStreamRequest : AWSRequest


/**
 <p>The stream ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable streamId;

@end

/**
 
 */
@interface AWSIoTDescribeStreamResponse : AWSModel


/**
 <p>Information about the stream.</p>
 */
@property (nonatomic, strong) AWSIoTStreamInfo * _Nullable streamInfo;

@end

/**
 
 */
@interface AWSIoTDescribeThingGroupRequest : AWSRequest


/**
 <p>The name of the thing group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingGroupName;

@end

/**
 
 */
@interface AWSIoTDescribeThingGroupResponse : AWSModel


/**
 <p>The dynamic thing group index name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable indexName;

/**
 <p>The dynamic thing group search query string.</p>
 */
@property (nonatomic, strong) NSString * _Nullable queryString;

/**
 <p>The dynamic thing group query version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable queryVersion;

/**
 <p>The dynamic thing group status.</p>
 */
@property (nonatomic, assign) AWSIoTDynamicGroupStatus status;

/**
 <p>The thing group ARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingGroupArn;

/**
 <p>The thing group ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingGroupId;

/**
 <p>Thing group metadata.</p>
 */
@property (nonatomic, strong) AWSIoTThingGroupMetadata * _Nullable thingGroupMetadata;

/**
 <p>The name of the thing group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingGroupName;

/**
 <p>The thing group properties.</p>
 */
@property (nonatomic, strong) AWSIoTThingGroupProperties * _Nullable thingGroupProperties;

/**
 <p>The version of the thing group.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable version;

@end

/**
 
 */
@interface AWSIoTDescribeThingRegistrationTaskRequest : AWSRequest


/**
 <p>The task ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable taskId;

@end

/**
 
 */
@interface AWSIoTDescribeThingRegistrationTaskResponse : AWSModel


/**
 <p>The task creation date.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDate;

/**
 <p>The number of things that failed to be provisioned.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable failureCount;

/**
 <p>The S3 bucket that contains the input file.</p>
 */
@property (nonatomic, strong) NSString * _Nullable inputFileBucket;

/**
 <p>The input file key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable inputFileKey;

/**
 <p>The date when the task was last modified.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedDate;

/**
 <p>The message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

/**
 <p>The progress of the bulk provisioning task expressed as a percentage.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable percentageProgress;

/**
 <p>The role ARN that grants access to the input file bucket.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 <p>The status of the bulk thing provisioning task.</p>
 */
@property (nonatomic, assign) AWSIoTStatus status;

/**
 <p>The number of things successfully provisioned.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable successCount;

/**
 <p>The task ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable taskId;

/**
 <p>The task's template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateBody;

@end

/**
 <p>The input for the DescribeThing operation.</p>
 Required parameters: [thingName]
 */
@interface AWSIoTDescribeThingRequest : AWSRequest


/**
 <p>The name of the thing.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingName;

@end

/**
 <p>The output from the DescribeThing operation.</p>
 */
@interface AWSIoTDescribeThingResponse : AWSModel


/**
 <p>The thing attributes.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable attributes;

/**
 <p>The name of the billing group the thing belongs to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable billingGroupName;

/**
 <p>The default MQTT client ID. For a typical device, the thing name is also used as the default MQTT client ID. Although we don’t require a mapping between a thing's registry name and its use of MQTT client IDs, certificates, or shadow state, we recommend that you choose a thing name and use it as the MQTT client ID for the registry and the Device Shadow service.</p><p>This lets you better organize your IoT fleet without removing the flexibility of the underlying device certificate model or shadows.</p>
 */
@property (nonatomic, strong) NSString * _Nullable defaultClientId;

/**
 <p>The ARN of the thing to describe.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingArn;

/**
 <p>The ID of the thing to describe.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingId;

/**
 <p>The name of the thing.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingName;

/**
 <p>The thing type name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingTypeName;

/**
 <p>The current version of the thing record in the registry.</p><note><p>To avoid unintentional changes to the information in the registry, you can pass the version information in the <code>expectedVersion</code> parameter of the <code>UpdateThing</code> and <code>DeleteThing</code> calls.</p></note>
 */
@property (nonatomic, strong) NSNumber * _Nullable version;

@end

/**
 <p>The input for the DescribeThingType operation.</p>
 Required parameters: [thingTypeName]
 */
@interface AWSIoTDescribeThingTypeRequest : AWSRequest


/**
 <p>The name of the thing type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingTypeName;

@end

/**
 <p>The output for the DescribeThingType operation.</p>
 */
@interface AWSIoTDescribeThingTypeResponse : AWSModel


/**
 <p>The thing type ARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingTypeArn;

/**
 <p>The thing type ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingTypeId;

/**
 <p>The ThingTypeMetadata contains additional information about the thing type including: creation date and time, a value indicating whether the thing type is deprecated, and a date and time when it was deprecated.</p>
 */
@property (nonatomic, strong) AWSIoTThingTypeMetadata * _Nullable thingTypeMetadata;

/**
 <p>The name of the thing type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingTypeName;

/**
 <p>The ThingTypeProperties contains information about the thing type including description, and a list of searchable thing attribute names.</p>
 */
@property (nonatomic, strong) AWSIoTThingTypeProperties * _Nullable thingTypeProperties;

@end

/**
 <p>Describes the location of the updated firmware.</p>
 */
@interface AWSIoTDestination : AWSModel


/**
 <p>Describes the location in S3 of the updated firmware.</p>
 */
@property (nonatomic, strong) AWSIoTS3Destination * _Nullable s3Destination;

@end

/**
 
 */
@interface AWSIoTDetachPolicyRequest : AWSRequest


/**
 <p>The policy to detach.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyName;

/**
 <p>The target from which the policy will be detached.</p>
 */
@property (nonatomic, strong) NSString * _Nullable target;

@end

/**
 <p>The input for the DetachPrincipalPolicy operation.</p>
 Required parameters: [policyName, principal]
 */
@interface AWSIoTDetachPrincipalPolicyRequest : AWSRequest


/**
 <p>The name of the policy to detach.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyName;

/**
 <p>The principal.</p><p>Valid principals are CertificateArn (arn:aws:iot:<i>region</i>:<i>accountId</i>:cert/<i>certificateId</i>), thingGroupArn (arn:aws:iot:<i>region</i>:<i>accountId</i>:thinggroup/<i>groupName</i>) and CognitoId (<i>region</i>:<i>id</i>).</p>
 */
@property (nonatomic, strong) NSString * _Nullable principal;

@end

/**
 
 */
@interface AWSIoTDetachSecurityProfileRequest : AWSRequest


/**
 <p>The security profile that is detached.</p>
 */
@property (nonatomic, strong) NSString * _Nullable securityProfileName;

/**
 <p>The ARN of the thing group from which the security profile is detached.</p>
 */
@property (nonatomic, strong) NSString * _Nullable securityProfileTargetArn;

@end

/**
 
 */
@interface AWSIoTDetachSecurityProfileResponse : AWSModel


@end

/**
 <p>The input for the DetachThingPrincipal operation.</p>
 Required parameters: [thingName, principal]
 */
@interface AWSIoTDetachThingPrincipalRequest : AWSRequest


/**
 <p>If the principal is a certificate, this value must be ARN of the certificate. If the principal is an Amazon Cognito identity, this value must be the ID of the Amazon Cognito identity.</p>
 */
@property (nonatomic, strong) NSString * _Nullable principal;

/**
 <p>The name of the thing.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingName;

@end

/**
 <p>The output from the DetachThingPrincipal operation.</p>
 */
@interface AWSIoTDetachThingPrincipalResponse : AWSModel


@end

/**
 <p> Describes which mitigation actions should be executed. </p>
 */
@interface AWSIoTDetectMitigationActionExecution : AWSModel


/**
 <p> The friendly name that uniquely identifies the mitigation action. </p>
 */
@property (nonatomic, strong) NSString * _Nullable actionName;

/**
 <p> The error code of a mitigation action. </p>
 */
@property (nonatomic, strong) NSString * _Nullable errorCode;

/**
 <p> The date a mitigation action ended. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable executionEndDate;

/**
 <p> The date a mitigation action was started. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable executionStartDate;

/**
 <p> The message of a mitigation action. </p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

/**
 <p> The status of a mitigation action. </p>
 */
@property (nonatomic, assign) AWSIoTDetectMitigationActionExecutionStatus status;

/**
 <p> The unique identifier of the task. </p>
 */
@property (nonatomic, strong) NSString * _Nullable taskId;

/**
 <p> The name of the thing. </p>
 */
@property (nonatomic, strong) NSString * _Nullable thingName;

/**
 <p> The unique identifier of the violation. </p>
 */
@property (nonatomic, strong) NSString * _Nullable violationId;

@end

/**
 <p> The statistics of a mitigation action task. </p>
 */
@interface AWSIoTDetectMitigationActionsTaskStatistics : AWSModel


/**
 <p> The actions that were performed. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable actionsExecuted;

/**
 <p> The actions that failed. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable actionsFailed;

/**
 <p> The actions that were skipped. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable actionsSkipped;

@end

/**
 <p> The summary of the mitigation action tasks. </p>
 */
@interface AWSIoTDetectMitigationActionsTaskSummary : AWSModel


/**
 <p> The definition of the actions. </p>
 */
@property (nonatomic, strong) NSArray<AWSIoTMitigationAction *> * _Nullable actionsDefinition;

/**
 <p> Includes only active violations. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable onlyActiveViolationsIncluded;

/**
 <p> Includes suppressed alerts. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable suppressedAlertsIncluded;

/**
 <p> Specifies the ML Detect findings to which the mitigation actions are applied. </p>
 */
@property (nonatomic, strong) AWSIoTDetectMitigationActionsTaskTarget * _Nullable target;

/**
 <p> The date the task ended. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable taskEndTime;

/**
 <p> The unique identifier of the task. </p>
 */
@property (nonatomic, strong) NSString * _Nullable taskId;

/**
 <p> The date the task started. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable taskStartTime;

/**
 <p> The statistics of a mitigation action task. </p>
 */
@property (nonatomic, strong) AWSIoTDetectMitigationActionsTaskStatistics * _Nullable taskStatistics;

/**
 <p> The status of the task. </p>
 */
@property (nonatomic, assign) AWSIoTDetectMitigationActionsTaskStatus taskStatus;

/**
 <p> Specifies the time period of which violation events occurred between. </p>
 */
@property (nonatomic, strong) AWSIoTViolationEventOccurrenceRange * _Nullable violationEventOccurrenceRange;

@end

/**
 <p> The target of a mitigation action task. </p>
 */
@interface AWSIoTDetectMitigationActionsTaskTarget : AWSModel


/**
 <p> The name of the behavior. </p>
 */
@property (nonatomic, strong) NSString * _Nullable behaviorName;

/**
 <p> The name of the security profile. </p>
 */
@property (nonatomic, strong) NSString * _Nullable securityProfileName;

/**
 <p> The unique identifiers of the violations. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable violationIds;

@end

/**
 <p>The input for the DisableTopicRuleRequest operation.</p>
 Required parameters: [ruleName]
 */
@interface AWSIoTDisableTopicRuleRequest : AWSRequest


/**
 <p>The name of the rule to disable.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ruleName;

@end

/**
 <p>A map of key-value pairs containing the patterns that need to be replaced in a managed template job document schema. You can use the description of each key as a guidance to specify the inputs during runtime when creating a job.</p><note><p><code>documentParameters</code> can only be used when creating jobs from Amazon Web Services managed templates. This parameter can't be used with custom job templates or to create jobs from them.</p></note>
 */
@interface AWSIoTDocumentParameter : AWSModel


/**
 <p>Description of the map field containing the patterns that need to be replaced in a managed template job document schema.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>An example illustrating a pattern that need to be replaced in a managed template job document schema.</p>
 */
@property (nonatomic, strong) NSString * _Nullable example;

/**
 <p>Key of the map field containing the patterns that need to be replaced in a managed template job document schema.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>Specifies whether a pattern that needs to be replaced in a managed template job document schema is optional or required.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable optionalValue;

/**
 <p>A regular expression of the patterns that need to be replaced in a managed template job document schema.</p>
 */
@property (nonatomic, strong) NSString * _Nullable regex;

@end

/**
 <p>The summary of a domain configuration. A domain configuration specifies custom IoT-specific information about a domain. A domain configuration can be associated with an Amazon Web Services-managed domain (for example, dbc123defghijk.iot.us-west-2.amazonaws.com), a customer managed domain, or a default endpoint.</p><ul><li><p>Data</p></li><li><p>Jobs</p></li><li><p>CredentialProvider</p></li></ul>
 */
@interface AWSIoTDomainConfigurationSummary : AWSModel


/**
 <p>The ARN of the domain configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainConfigurationArn;

/**
 <p>The name of the domain configuration. This value must be unique to a region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainConfigurationName;

/**
 <p>The type of service delivered by the endpoint.</p>
 */
@property (nonatomic, assign) AWSIoTServiceType serviceType;

@end

/**
 <p>Describes an action to write to a DynamoDB table.</p><p>The <code>tableName</code>, <code>hashKeyField</code>, and <code>rangeKeyField</code> values must match the values used when you created the table.</p><p>The <code>hashKeyValue</code> and <code>rangeKeyvalue</code> fields use a substitution template syntax. These templates provide data at runtime. The syntax is as follows: ${<i>sql-expression</i>}.</p><p>You can specify any valid expression in a WHERE or SELECT clause, including JSON properties, comparisons, calculations, and functions. For example, the following field uses the third level of the topic:</p><p><code>"hashKeyValue": "${topic(3)}"</code></p><p>The following field uses the timestamp:</p><p><code>"rangeKeyValue": "${timestamp()}"</code></p>
 Required parameters: [tableName, roleArn, hashKeyField, hashKeyValue]
 */
@interface AWSIoTDynamoDBAction : AWSModel


/**
 <p>The hash key name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable hashKeyField;

/**
 <p>The hash key type. Valid values are "STRING" or "NUMBER"</p>
 */
@property (nonatomic, assign) AWSIoTDynamoKeyType hashKeyType;

/**
 <p>The hash key value.</p>
 */
@property (nonatomic, strong) NSString * _Nullable hashKeyValue;

/**
 <p>The type of operation to be performed. This follows the substitution template, so it can be <code>${operation}</code>, but the substitution must result in one of the following: <code>INSERT</code>, <code>UPDATE</code>, or <code>DELETE</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable operation;

/**
 <p>The action payload. This name can be customized.</p>
 */
@property (nonatomic, strong) NSString * _Nullable payloadField;

/**
 <p>The range key name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable rangeKeyField;

/**
 <p>The range key type. Valid values are "STRING" or "NUMBER"</p>
 */
@property (nonatomic, assign) AWSIoTDynamoKeyType rangeKeyType;

/**
 <p>The range key value.</p>
 */
@property (nonatomic, strong) NSString * _Nullable rangeKeyValue;

/**
 <p>The ARN of the IAM role that grants access to the DynamoDB table.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 <p>The name of the DynamoDB table.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tableName;

@end

/**
 <p>Describes an action to write to a DynamoDB table.</p><p>This DynamoDB action writes each attribute in the message payload into it's own column in the DynamoDB table.</p>
 Required parameters: [roleArn, putItem]
 */
@interface AWSIoTDynamoDBv2Action : AWSModel


/**
 <p>Specifies the DynamoDB table to which the message data will be written. For example:</p><p><code>{ "dynamoDBv2": { "roleArn": "aws:iam:12341251:my-role" "putItem": { "tableName": "my-table" } } }</code></p><p>Each attribute in the message payload will be written to a separate column in the DynamoDB database.</p>
 */
@property (nonatomic, strong) AWSIoTPutItemInput * _Nullable putItem;

/**
 <p>The ARN of the IAM role that grants access to the DynamoDB table.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

@end

/**
 <p>The policy that has the effect on the authorization results.</p>
 */
@interface AWSIoTEffectivePolicy : AWSModel


/**
 <p>The policy ARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyArn;

/**
 <p>The IAM policy document.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyDocument;

/**
 <p>The policy name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyName;

@end

/**
 <p>Describes an action that writes data to an Amazon OpenSearch Service domain.</p><note><p>The <code>Elasticsearch</code> action can only be used by existing rule actions. To create a new rule action or to update an existing rule action, use the <code>OpenSearch</code> rule action instead. For more information, see <a href="https://docs.aws.amazon.com/iot/latest/apireference/API_OpenSearchAction.html">OpenSearchAction</a>.</p></note>
 Required parameters: [roleArn, endpoint, index, type, id]
 */
@interface AWSIoTElasticsearchAction : AWSModel


/**
 <p>The endpoint of your OpenSearch domain.</p>
 */
@property (nonatomic, strong) NSString * _Nullable endpoint;

/**
 <p>The unique identifier for the document you are storing.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The index where you want to store your data.</p>
 */
@property (nonatomic, strong) NSString * _Nullable index;

/**
 <p>The IAM role ARN that has access to OpenSearch.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 <p>The type of document you are storing.</p>
 */
@property (nonatomic, strong) NSString * _Nullable types;

@end

/**
 <p>Parameters used when defining a mitigation action that enable Amazon Web Services IoT Core logging.</p>
 Required parameters: [roleArnForLogging, logLevel]
 */
@interface AWSIoTEnableIoTLoggingParams : AWSModel


/**
 <p>Specifies the type of information to be logged.</p>
 */
@property (nonatomic, assign) AWSIoTLogLevel logLevel;

/**
 <p>The Amazon Resource Name (ARN) of the IAM role used for logging.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArnForLogging;

@end

/**
 <p>The input for the EnableTopicRuleRequest operation.</p>
 Required parameters: [ruleName]
 */
@interface AWSIoTEnableTopicRuleRequest : AWSRequest


/**
 <p>The name of the topic rule to enable.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ruleName;

@end

/**
 <p>Error information.</p>
 */
@interface AWSIoTErrorInfo : AWSModel


/**
 <p>The error code.</p>
 */
@property (nonatomic, strong) NSString * _Nullable code;

/**
 <p>The error message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

@end

/**
 <p>Information that explicitly denies authorization.</p>
 */
@interface AWSIoTExplicitDeny : AWSModel


/**
 <p>The policies that denied the authorization.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTPolicy *> * _Nullable policies;

@end

/**
 <p>Allows you to create an exponential rate of rollout for a job.</p>
 Required parameters: [baseRatePerMinute, incrementFactor, rateIncreaseCriteria]
 */
@interface AWSIoTExponentialRolloutRate : AWSModel


/**
 <p>The minimum number of things that will be notified of a pending job, per minute at the start of job rollout. This parameter allows you to define the initial rate of rollout.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable baseRatePerMinute;

/**
 <p>The exponential factor to increase the rate of rollout for a job.</p><p>Amazon Web Services IoT Core supports up to one digit after the decimal (for example, 1.5, but not 1.55).</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable incrementFactor;

/**
 <p>The criteria to initiate the increase in rate of rollout for a job.</p>
 */
@property (nonatomic, strong) AWSIoTRateIncreaseCriteria * _Nullable rateIncreaseCriteria;

@end

/**
 <p>Describes the name and data type at a field.</p>
 */
@interface AWSIoTField : AWSModel


/**
 <p>The name of the field.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The data type of the field.</p>
 */
@property (nonatomic, assign) AWSIoTFieldType types;

@end

/**
 <p>The location of the OTA update.</p>
 */
@interface AWSIoTFileLocation : AWSModel


/**
 <p>The location of the updated firmware in S3.</p>
 */
@property (nonatomic, strong) AWSIoTS3Location * _Nullable s3Location;

/**
 <p>The stream that contains the OTA update.</p>
 */
@property (nonatomic, strong) AWSIoTStream * _Nullable stream;

@end

/**
 <p>Describes an action that writes data to an Amazon Kinesis Firehose stream.</p>
 Required parameters: [roleArn, deliveryStreamName]
 */
@interface AWSIoTFirehoseAction : AWSModel


/**
 <p>Whether to deliver the Kinesis Data Firehose stream as a batch by using <a href="https://docs.aws.amazon.com/firehose/latest/APIReference/API_PutRecordBatch.html"><code>PutRecordBatch</code></a>. The default value is <code>false</code>.</p><p>When <code>batchMode</code> is <code>true</code> and the rule's SQL statement evaluates to an Array, each Array element forms one record in the <a href="https://docs.aws.amazon.com/firehose/latest/APIReference/API_PutRecordBatch.html"><code>PutRecordBatch</code></a> request. The resulting array can't have more than 500 records.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable batchMode;

/**
 <p>The delivery stream name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deliveryStreamName;

/**
 <p>The IAM role that grants access to the Amazon Kinesis Firehose stream.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 <p>A character separator that will be used to separate records written to the Firehose stream. Valid values are: '\n' (newline), '\t' (tab), '\r\n' (Windows newline), ',' (comma).</p>
 */
@property (nonatomic, strong) NSString * _Nullable separator;

@end

/**
 <p>The name and ARN of a fleet metric.</p>
 */
@interface AWSIoTFleetMetricNameAndArn : AWSModel


/**
 <p>The fleet metric ARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable metricArn;

/**
 <p>The fleet metric name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable metricName;

@end

/**
 
 */
@interface AWSIoTGetBehaviorModelTrainingSummariesRequest : AWSRequest


/**
 <p> The maximum number of results to return at one time. The default is 25. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p> The token for the next set of results. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p> The name of the security profile. </p>
 */
@property (nonatomic, strong) NSString * _Nullable securityProfileName;

@end

/**
 
 */
@interface AWSIoTGetBehaviorModelTrainingSummariesResponse : AWSModel


/**
 <p> A token that can be used to retrieve the next set of results, or <code>null</code> if there are no additional results. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p> A list of all ML Detect behaviors and their model status for a given Security Profile. </p>
 */
@property (nonatomic, strong) NSArray<AWSIoTBehaviorModelTrainingSummary *> * _Nullable summaries;

@end

/**
 
 */
@interface AWSIoTGetBucketsAggregationRequest : AWSRequest


/**
 <p>The aggregation field.</p>
 */
@property (nonatomic, strong) NSString * _Nullable aggregationField;

/**
 <p>The basic control of the response shape and the bucket aggregation type to perform. </p>
 */
@property (nonatomic, strong) AWSIoTBucketsAggregationType * _Nullable bucketsAggregationType;

/**
 <p>The name of the index to search.</p>
 */
@property (nonatomic, strong) NSString * _Nullable indexName;

/**
 <p>The search query string.</p>
 */
@property (nonatomic, strong) NSString * _Nullable queryString;

/**
 <p>The version of the query.</p>
 */
@property (nonatomic, strong) NSString * _Nullable queryVersion;

@end

/**
 
 */
@interface AWSIoTGetBucketsAggregationResponse : AWSModel


/**
 <p>The main part of the response with a list of buckets. Each bucket contains a <code>keyValue</code> and a <code>count</code>.</p><p><code>keyValue</code>: The aggregation field value counted for the particular bucket.</p><p><code>count</code>: The number of documents that have that value.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTBucket *> * _Nullable buckets;

/**
 <p>The total number of things that fit the query string criteria.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable totalCount;

@end

/**
 
 */
@interface AWSIoTGetCardinalityRequest : AWSRequest


/**
 <p>The field to aggregate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable aggregationField;

/**
 <p>The name of the index to search.</p>
 */
@property (nonatomic, strong) NSString * _Nullable indexName;

/**
 <p>The search query string.</p>
 */
@property (nonatomic, strong) NSString * _Nullable queryString;

/**
 <p>The query version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable queryVersion;

@end

/**
 
 */
@interface AWSIoTGetCardinalityResponse : AWSModel


/**
 <p>The approximate count of unique values that match the query.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable cardinality;

@end

/**
 
 */
@interface AWSIoTGetEffectivePoliciesRequest : AWSRequest


/**
 <p>The Cognito identity pool ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable cognitoIdentityPoolId;

/**
 <p>The principal. Valid principals are CertificateArn (arn:aws:iot:<i>region</i>:<i>accountId</i>:cert/<i>certificateId</i>), thingGroupArn (arn:aws:iot:<i>region</i>:<i>accountId</i>:thinggroup/<i>groupName</i>) and CognitoId (<i>region</i>:<i>id</i>).</p>
 */
@property (nonatomic, strong) NSString * _Nullable principal;

/**
 <p>The thing name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingName;

@end

/**
 
 */
@interface AWSIoTGetEffectivePoliciesResponse : AWSModel


/**
 <p>The effective policies.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTEffectivePolicy *> * _Nullable effectivePolicies;

@end

/**
 
 */
@interface AWSIoTGetIndexingConfigurationRequest : AWSRequest


@end

/**
 
 */
@interface AWSIoTGetIndexingConfigurationResponse : AWSModel


/**
 <p>The index configuration.</p>
 */
@property (nonatomic, strong) AWSIoTThingGroupIndexingConfiguration * _Nullable thingGroupIndexingConfiguration;

/**
 <p>Thing indexing configuration.</p>
 */
@property (nonatomic, strong) AWSIoTThingIndexingConfiguration * _Nullable thingIndexingConfiguration;

@end

/**
 
 */
@interface AWSIoTGetJobDocumentRequest : AWSRequest


/**
 <p>The unique identifier you assigned to this job when it was created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

@end

/**
 
 */
@interface AWSIoTGetJobDocumentResponse : AWSModel


/**
 <p>The job document content.</p>
 */
@property (nonatomic, strong) NSString * _Nullable document;

@end

/**
 <p>The input for the GetLoggingOptions operation.</p>
 */
@interface AWSIoTGetLoggingOptionsRequest : AWSRequest


@end

/**
 <p>The output from the GetLoggingOptions operation.</p>
 */
@interface AWSIoTGetLoggingOptionsResponse : AWSModel


/**
 <p>The logging level.</p>
 */
@property (nonatomic, assign) AWSIoTLogLevel logLevel;

/**
 <p>The ARN of the IAM role that grants access.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

@end

/**
 
 */
@interface AWSIoTGetOTAUpdateRequest : AWSRequest


/**
 <p>The OTA update ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable otaUpdateId;

@end

/**
 
 */
@interface AWSIoTGetOTAUpdateResponse : AWSModel


/**
 <p>The OTA update info.</p>
 */
@property (nonatomic, strong) AWSIoTOTAUpdateInfo * _Nullable otaUpdateInfo;

@end

/**
 
 */
@interface AWSIoTGetPercentilesRequest : AWSRequest


/**
 <p>The field to aggregate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable aggregationField;

/**
 <p>The name of the index to search.</p>
 */
@property (nonatomic, strong) NSString * _Nullable indexName;

/**
 <p>The percentile groups returned.</p>
 */
@property (nonatomic, strong) NSArray<NSNumber *> * _Nullable percents;

/**
 <p>The search query string.</p>
 */
@property (nonatomic, strong) NSString * _Nullable queryString;

/**
 <p>The query version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable queryVersion;

@end

/**
 
 */
@interface AWSIoTGetPercentilesResponse : AWSModel


/**
 <p>The percentile values of the aggregated fields.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTPercentPair *> * _Nullable percentiles;

@end

/**
 <p>The input for the GetPolicy operation.</p>
 Required parameters: [policyName]
 */
@interface AWSIoTGetPolicyRequest : AWSRequest


/**
 <p>The name of the policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyName;

@end

/**
 <p>The output from the GetPolicy operation.</p>
 */
@interface AWSIoTGetPolicyResponse : AWSModel


/**
 <p>The date the policy was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDate;

/**
 <p>The default policy version ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable defaultVersionId;

/**
 <p>The generation ID of the policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable generationId;

/**
 <p>The date the policy was last modified.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedDate;

/**
 <p>The policy ARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyArn;

/**
 <p>The JSON document that describes the policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyDocument;

/**
 <p>The policy name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyName;

@end

/**
 <p>The input for the GetPolicyVersion operation.</p>
 Required parameters: [policyName, policyVersionId]
 */
@interface AWSIoTGetPolicyVersionRequest : AWSRequest


/**
 <p>The name of the policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyName;

/**
 <p>The policy version ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyVersionId;

@end

/**
 <p>The output from the GetPolicyVersion operation.</p>
 */
@interface AWSIoTGetPolicyVersionResponse : AWSModel


/**
 <p>The date the policy was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDate;

/**
 <p>The generation ID of the policy version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable generationId;

/**
 <p>Specifies whether the policy version is the default.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isDefaultVersion;

/**
 <p>The date the policy was last modified.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedDate;

/**
 <p>The policy ARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyArn;

/**
 <p>The JSON document that describes the policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyDocument;

/**
 <p>The policy name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyName;

/**
 <p>The policy version ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyVersionId;

@end

/**
 <p>The input to the GetRegistrationCode operation.</p>
 */
@interface AWSIoTGetRegistrationCodeRequest : AWSRequest


@end

/**
 <p>The output from the GetRegistrationCode operation.</p>
 */
@interface AWSIoTGetRegistrationCodeResponse : AWSModel


/**
 <p>The CA certificate registration code.</p>
 */
@property (nonatomic, strong) NSString * _Nullable registrationCode;

@end

/**
 
 */
@interface AWSIoTGetStatisticsRequest : AWSRequest


/**
 <p>The aggregation field name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable aggregationField;

/**
 <p>The name of the index to search. The default value is <code>AWS_Things</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable indexName;

/**
 <p>The query used to search. You can specify "*" for the query string to get the count of all indexed things in your Amazon Web Services account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable queryString;

/**
 <p>The version of the query used to search.</p>
 */
@property (nonatomic, strong) NSString * _Nullable queryVersion;

@end

/**
 
 */
@interface AWSIoTGetStatisticsResponse : AWSModel


/**
 <p>The statistics returned by the Fleet Indexing service based on the query and aggregation field.</p>
 */
@property (nonatomic, strong) AWSIoTStatistics * _Nullable statistics;

@end

/**
 
 */
@interface AWSIoTGetTopicRuleDestinationRequest : AWSRequest


/**
 <p>The ARN of the topic rule destination.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

@end

/**
 
 */
@interface AWSIoTGetTopicRuleDestinationResponse : AWSModel


/**
 <p>The topic rule destination.</p>
 */
@property (nonatomic, strong) AWSIoTTopicRuleDestination * _Nullable topicRuleDestination;

@end

/**
 <p>The input for the GetTopicRule operation.</p>
 Required parameters: [ruleName]
 */
@interface AWSIoTGetTopicRuleRequest : AWSRequest


/**
 <p>The name of the rule.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ruleName;

@end

/**
 <p>The output from the GetTopicRule operation.</p>
 */
@interface AWSIoTGetTopicRuleResponse : AWSModel


/**
 <p>The rule.</p>
 */
@property (nonatomic, strong) AWSIoTTopicRule * _Nullable rule;

/**
 <p>The rule ARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ruleArn;

@end

/**
 
 */
@interface AWSIoTGetV2LoggingOptionsRequest : AWSRequest


@end

/**
 
 */
@interface AWSIoTGetV2LoggingOptionsResponse : AWSModel


/**
 <p>The default log level.</p>
 */
@property (nonatomic, assign) AWSIoTLogLevel defaultLogLevel;

/**
 <p>Disables all logs.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable disableAllLogs;

/**
 <p>The IAM role ARN IoT uses to write to your CloudWatch logs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

@end

/**
 <p>The name and ARN of a group.</p>
 */
@interface AWSIoTGroupNameAndArn : AWSModel


/**
 <p>The group ARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable groupArn;

/**
 <p>The group name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable groupName;

@end

/**
 <p>Send data to an HTTPS endpoint.</p>
 Required parameters: [url]
 */
@interface AWSIoTHttpAction : AWSModel


/**
 <p>The authentication method to use when sending data to an HTTPS endpoint.</p>
 */
@property (nonatomic, strong) AWSIoTHttpAuthorization * _Nullable auth;

/**
 <p>The URL to which IoT sends a confirmation message. The value of the confirmation URL must be a prefix of the endpoint URL. If you do not specify a confirmation URL IoT uses the endpoint URL as the confirmation URL. If you use substitution templates in the confirmationUrl, you must create and enable topic rule destinations that match each possible value of the substitution template before traffic is allowed to your endpoint URL.</p>
 */
@property (nonatomic, strong) NSString * _Nullable confirmationUrl;

/**
 <p>The HTTP headers to send with the message data.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTHttpActionHeader *> * _Nullable headers;

/**
 <p>The endpoint URL. If substitution templates are used in the URL, you must also specify a <code>confirmationUrl</code>. If this is a new destination, a new <code>TopicRuleDestination</code> is created if possible.</p>
 */
@property (nonatomic, strong) NSString * _Nullable url;

@end

/**
 <p>The HTTP action header.</p>
 Required parameters: [key, value]
 */
@interface AWSIoTHttpActionHeader : AWSModel


/**
 <p>The HTTP header key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>The HTTP header value. Substitution templates are supported.</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 <p>The authorization method used to send messages.</p>
 */
@interface AWSIoTHttpAuthorization : AWSModel


/**
 <p>Use Sig V4 authorization. For more information, see <a href="https://docs.aws.amazon.com/general/latest/gr/signature-version-4.html">Signature Version 4 Signing Process</a>.</p>
 */
@property (nonatomic, strong) AWSIoTSigV4Authorization * _Nullable sigv4;

@end

/**
 <p>Specifies the HTTP context to use for the test authorizer request.</p>
 */
@interface AWSIoTHttpContext : AWSModel


/**
 <p>The header keys and values in an HTTP authorization request.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable headers;

/**
 <p>The query string keys and values in an HTTP authorization request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable queryString;

@end

/**
 <p>HTTP URL destination configuration used by the topic rule's HTTP action.</p>
 Required parameters: [confirmationUrl]
 */
@interface AWSIoTHttpUrlDestinationConfiguration : AWSModel


/**
 <p>The URL IoT uses to confirm ownership of or access to the topic rule destination URL.</p>
 */
@property (nonatomic, strong) NSString * _Nullable confirmationUrl;

@end

/**
 <p>HTTP URL destination properties.</p>
 */
@interface AWSIoTHttpUrlDestinationProperties : AWSModel


/**
 <p>The URL used to confirm the HTTP topic rule destination URL.</p>
 */
@property (nonatomic, strong) NSString * _Nullable confirmationUrl;

@end

/**
 <p>Information about an HTTP URL destination.</p>
 */
@interface AWSIoTHttpUrlDestinationSummary : AWSModel


/**
 <p>The URL used to confirm ownership of or access to the HTTP topic rule destination URL.</p>
 */
@property (nonatomic, strong) NSString * _Nullable confirmationUrl;

@end

/**
 <p>Information that implicitly denies authorization. When policy doesn't explicitly deny or allow an action on a resource it is considered an implicit deny.</p>
 */
@interface AWSIoTImplicitDeny : AWSModel


/**
 <p>Policies that don't contain a matching allow or deny statement for the specified action on the specified resource. </p>
 */
@property (nonatomic, strong) NSArray<AWSIoTPolicy *> * _Nullable policies;

@end

/**
 <p>Provides additional filters for specific data sources. Named shadow is the only data source that currently supports and requires a filter. To add named shadows to your fleet indexing configuration, set <code>namedShadowIndexingMode</code> to be <code>ON</code> and specify your shadow names in <code>filter</code>.</p>
 */
@interface AWSIoTIndexingFilter : AWSModel


/**
 <p>The shadow names that you select to index. The default maximum number of shadow names for indexing is 10. To increase the limit, see <a href="https://docs.aws.amazon.com/general/latest/gr/iot_device_management.html#fleet-indexing-limits">Amazon Web Services IoT Device Management Quotas</a> in the <i>Amazon Web Services General Reference</i>. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable namedShadowNames;

@end

/**
 <p>Sends message data to an IoT Analytics channel.</p>
 */
@interface AWSIoTIotAnalyticsAction : AWSModel


/**
 <p>Whether to process the action as a batch. The default value is <code>false</code>.</p><p>When <code>batchMode</code> is <code>true</code> and the rule SQL statement evaluates to an Array, each Array element is delivered as a separate message when passed by <a href="https://docs.aws.amazon.com/iotanalytics/latest/APIReference/API_BatchPutMessage.html"><code>BatchPutMessage</code></a> to the IoT Analytics channel. The resulting array can't have more than 100 messages.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable batchMode;

/**
 <p>(deprecated) The ARN of the IoT Analytics channel to which message data will be sent.</p>
 */
@property (nonatomic, strong) NSString * _Nullable channelArn;

/**
 <p>The name of the IoT Analytics channel to which message data will be sent.</p>
 */
@property (nonatomic, strong) NSString * _Nullable channelName;

/**
 <p>The ARN of the role which has a policy that grants IoT Analytics permission to send message data via IoT Analytics (iotanalytics:BatchPutMessage).</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

@end

/**
 <p>Sends an input to an IoT Events detector.</p>
 Required parameters: [inputName, roleArn]
 */
@interface AWSIoTIotEventsAction : AWSModel


/**
 <p>Whether to process the event actions as a batch. The default value is <code>false</code>.</p><p>When <code>batchMode</code> is <code>true</code>, you can't specify a <code>messageId</code>. </p><p>When <code>batchMode</code> is <code>true</code> and the rule SQL statement evaluates to an Array, each Array element is treated as a separate message when it's sent to IoT Events by calling <a href="https://docs.aws.amazon.com/iotevents/latest/apireference/API_iotevents-data_BatchPutMessage.html"><code>BatchPutMessage</code></a>. The resulting array can't have more than 10 messages.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable batchMode;

/**
 <p>The name of the IoT Events input.</p>
 */
@property (nonatomic, strong) NSString * _Nullable inputName;

/**
 <p>The ID of the message. The default <code>messageId</code> is a new UUID value.</p><p>When <code>batchMode</code> is <code>true</code>, you can't specify a <code>messageId</code>--a new UUID value will be assigned.</p><p>Assign a value to this property to ensure that only one input (message) with a given <code>messageId</code> will be processed by an IoT Events detector.</p>
 */
@property (nonatomic, strong) NSString * _Nullable messageId;

/**
 <p>The ARN of the role that grants IoT permission to send an input to an IoT Events detector. ("Action":"iotevents:BatchPutMessage").</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

@end

/**
 <p>Describes an action to send data from an MQTT message that triggered the rule to IoT SiteWise asset properties.</p>
 Required parameters: [putAssetPropertyValueEntries, roleArn]
 */
@interface AWSIoTIotSiteWiseAction : AWSModel


/**
 <p>A list of asset property value entries.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTPutAssetPropertyValueEntry *> * _Nullable putAssetPropertyValueEntries;

/**
 <p>The ARN of the role that grants IoT permission to send an asset property value to IoT SiteWise. (<code>"Action": "iotsitewise:BatchPutAssetPropertyValue"</code>). The trust policy can restrict access to specific asset hierarchy paths.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

@end

/**
 <p>The <code>Job</code> object contains details about a job.</p>
 */
@interface AWSIoTJob : AWSModel


/**
 <p>Configuration for criteria to abort the job.</p>
 */
@property (nonatomic, strong) AWSIoTAbortConfig * _Nullable abortConfig;

/**
 <p>If the job was updated, describes the reason for the update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable comment;

/**
 <p>The time, in seconds since the epoch, when the job was completed.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable completedAt;

/**
 <p>The time, in seconds since the epoch, when the job was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdAt;

/**
 <p>A short text description of the job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>A key-value map that pairs the patterns that need to be replaced in a managed template job document schema. You can use the description of each key as a guidance to specify the inputs during runtime when creating a job.</p><note><p><code>documentParameters</code> can only be used when creating jobs from Amazon Web Services managed templates. This parameter can't be used with custom job templates or to create jobs from them.</p></note>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable documentParameters;

/**
 <p>Will be <code>true</code> if the job was canceled with the optional <code>force</code> parameter set to <code>true</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable forceCanceled;

/**
 <p>Indicates whether a job is concurrent. Will be true when a job is rolling out new job executions or canceling previously created executions, otherwise false.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isConcurrent;

/**
 <p>An ARN identifying the job with format "arn:aws:iot:region:account:job/jobId".</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobArn;

/**
 <p>The configuration for the criteria to retry the job.</p>
 */
@property (nonatomic, strong) AWSIoTJobExecutionsRetryConfig * _Nullable jobExecutionsRetryConfig;

/**
 <p>Allows you to create a staged rollout of a job.</p>
 */
@property (nonatomic, strong) AWSIoTJobExecutionsRolloutConfig * _Nullable jobExecutionsRolloutConfig;

/**
 <p>The unique identifier you assigned to this job when it was created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

/**
 <p>Details about the job process.</p>
 */
@property (nonatomic, strong) AWSIoTJobProcessDetails * _Nullable jobProcessDetails;

/**
 <p>The ARN of the job template used to create the job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobTemplateArn;

/**
 <p>The time, in seconds since the epoch, when the job was last updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdatedAt;

/**
 <p>The namespace used to indicate that a job is a customer-managed job.</p><p>When you specify a value for this parameter, Amazon Web Services IoT Core sends jobs notifications to MQTT topics that contain the value in the following format.</p><p><code>$aws/things/<i>THING_NAME</i>/jobs/<i>JOB_ID</i>/notify-namespace-<i>NAMESPACE_ID</i>/</code></p><note><p>The <code>namespaceId</code> feature is in public preview.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable namespaceId;

/**
 <p>Configuration for pre-signed S3 URLs.</p>
 */
@property (nonatomic, strong) AWSIoTPresignedUrlConfig * _Nullable presignedUrlConfig;

/**
 <p>If the job was updated, provides the reason code for the update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable reasonCode;

/**
 <p>The status of the job, one of <code>IN_PROGRESS</code>, <code>CANCELED</code>, <code>DELETION_IN_PROGRESS</code> or <code>COMPLETED</code>. </p>
 */
@property (nonatomic, assign) AWSIoTJobStatus status;

/**
 <p>Specifies whether the job will continue to run (CONTINUOUS), or will be complete after all those things specified as targets have completed the job (SNAPSHOT). If continuous, the job may also be run on a thing when a change is detected in a target. For example, a job will run on a device when the thing representing the device is added to a target group, even after the job was completed by all things originally in the group. </p><note><p>We recommend that you use continuous jobs instead of snapshot jobs for dynamic thing group targets. By using continuous jobs, devices that join the group receive the job execution even after the job has been created.</p></note>
 */
@property (nonatomic, assign) AWSIoTTargetSelection targetSelection;

/**
 <p>A list of IoT things and thing groups to which the job should be sent.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable targets;

/**
 <p>Specifies the amount of time each device has to finish its execution of the job. A timer is started when the job execution status is set to <code>IN_PROGRESS</code>. If the job execution status is not set to another terminal state before the timer expires, it will be automatically set to <code>TIMED_OUT</code>.</p>
 */
@property (nonatomic, strong) AWSIoTTimeoutConfig * _Nullable timeoutConfig;

@end

/**
 <p>The job execution object represents the execution of a job on a particular device.</p>
 */
@interface AWSIoTJobExecution : AWSModel


/**
 <p>The estimated number of seconds that remain before the job execution status will be changed to <code>TIMED_OUT</code>. The timeout interval can be anywhere between 1 minute and 7 days (1 to 10080 minutes). The actual job execution timeout can occur up to 60 seconds later than the estimated duration. This value will not be included if the job execution has reached a terminal status.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable approximateSecondsBeforeTimedOut;

/**
 <p>A string (consisting of the digits "0" through "9") which identifies this particular job execution on this particular device. It can be used in commands which return or update job execution information. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable executionNumber;

/**
 <p>Will be <code>true</code> if the job execution was canceled with the optional <code>force</code> parameter set to <code>true</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable forceCanceled;

/**
 <p>The unique identifier you assigned to the job when it was created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

/**
 <p>The time, in seconds since the epoch, when the job execution was last updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdatedAt;

/**
 <p>The time, in seconds since the epoch, when the job execution was queued.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable queuedAt;

/**
 <p>The time, in seconds since the epoch, when the job execution started.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable startedAt;

/**
 <p>The status of the job execution (IN_PROGRESS, QUEUED, FAILED, SUCCEEDED, TIMED_OUT, CANCELED, or REJECTED).</p>
 */
@property (nonatomic, assign) AWSIoTJobExecutionStatus status;

/**
 <p>A collection of name/value pairs that describe the status of the job execution.</p>
 */
@property (nonatomic, strong) AWSIoTJobExecutionStatusDetails * _Nullable statusDetails;

/**
 <p>The ARN of the thing on which the job execution is running.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingArn;

/**
 <p>The version of the job execution. Job execution versions are incremented each time they are updated by a device.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable versionNumber;

@end

/**
 <p>Details of the job execution status.</p>
 */
@interface AWSIoTJobExecutionStatusDetails : AWSModel


/**
 <p>The job execution status.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable detailsMap;

@end

/**
 <p>The job execution summary.</p>
 */
@interface AWSIoTJobExecutionSummary : AWSModel


/**
 <p>A string (consisting of the digits "0" through "9") which identifies this particular job execution on this particular device. It can be used later in commands which return or update job execution information.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable executionNumber;

/**
 <p>The time, in seconds since the epoch, when the job execution was last updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdatedAt;

/**
 <p>The time, in seconds since the epoch, when the job execution was queued.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable queuedAt;

/**
 <p>The number that indicates how many retry attempts have been completed for this job on this device.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable retryAttempt;

/**
 <p>The time, in seconds since the epoch, when the job execution started.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable startedAt;

/**
 <p>The status of the job execution.</p>
 */
@property (nonatomic, assign) AWSIoTJobExecutionStatus status;

@end

/**
 <p>Contains a summary of information about job executions for a specific job.</p>
 */
@interface AWSIoTJobExecutionSummaryForJob : AWSModel


/**
 <p>Contains a subset of information about a job execution.</p>
 */
@property (nonatomic, strong) AWSIoTJobExecutionSummary * _Nullable jobExecutionSummary;

/**
 <p>The ARN of the thing on which the job execution is running.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingArn;

@end

/**
 <p>The job execution summary for a thing.</p>
 */
@interface AWSIoTJobExecutionSummaryForThing : AWSModel


/**
 <p>Contains a subset of information about a job execution.</p>
 */
@property (nonatomic, strong) AWSIoTJobExecutionSummary * _Nullable jobExecutionSummary;

/**
 <p>The unique identifier you assigned to this job when it was created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

@end

/**
 <p>The configuration that determines how many retries are allowed for each failure type for a job.</p>
 Required parameters: [criteriaList]
 */
@interface AWSIoTJobExecutionsRetryConfig : AWSModel


/**
 <p>The list of criteria that determines how many retries are allowed for each failure type for a job.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTRetryCriteria *> * _Nullable criteriaList;

@end

/**
 <p>Allows you to create a staged rollout of a job.</p>
 */
@interface AWSIoTJobExecutionsRolloutConfig : AWSModel


/**
 <p>The rate of increase for a job rollout. This parameter allows you to define an exponential rate for a job rollout.</p>
 */
@property (nonatomic, strong) AWSIoTExponentialRolloutRate * _Nullable exponentialRate;

/**
 <p>The maximum number of things that will be notified of a pending job, per minute. This parameter allows you to create a staged rollout.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maximumPerMinute;

@end

/**
 <p>The job process details.</p>
 */
@interface AWSIoTJobProcessDetails : AWSModel


/**
 <p>The number of things that cancelled the job.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable numberOfCanceledThings;

/**
 <p>The number of things that failed executing the job.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable numberOfFailedThings;

/**
 <p>The number of things currently executing the job.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable numberOfInProgressThings;

/**
 <p>The number of things that are awaiting execution of the job.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable numberOfQueuedThings;

/**
 <p>The number of things that rejected the job.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable numberOfRejectedThings;

/**
 <p>The number of things that are no longer scheduled to execute the job because they have been deleted or have been removed from the group that was a target of the job.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable numberOfRemovedThings;

/**
 <p>The number of things which successfully completed the job.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable numberOfSucceededThings;

/**
 <p>The number of things whose job execution status is <code>TIMED_OUT</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable numberOfTimedOutThings;

/**
 <p>The target devices to which the job execution is being rolled out. This value will be null after the job execution has finished rolling out to all the target devices.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable processingTargets;

@end

/**
 <p>The job summary.</p>
 */
@interface AWSIoTJobSummary : AWSModel


/**
 <p>The time, in seconds since the epoch, when the job completed.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable completedAt;

/**
 <p>The time, in seconds since the epoch, when the job was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdAt;

/**
 <p>Indicates whether a job is concurrent. Will be true when a job is rolling out new job executions or canceling previously created executions, otherwise false.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isConcurrent;

/**
 <p>The job ARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobArn;

/**
 <p>The unique identifier you assigned to this job when it was created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

/**
 <p>The time, in seconds since the epoch, when the job was last updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdatedAt;

/**
 <p>The job summary status.</p>
 */
@property (nonatomic, assign) AWSIoTJobStatus status;

/**
 <p>Specifies whether the job will continue to run (CONTINUOUS), or will be complete after all those things specified as targets have completed the job (SNAPSHOT). If continuous, the job may also be run on a thing when a change is detected in a target. For example, a job will run on a thing when the thing is added to a target group, even after the job was completed by all things originally in the group.</p><note><p>We recommend that you use continuous jobs instead of snapshot jobs for dynamic thing group targets. By using continuous jobs, devices that join the group receive the job execution even after the job has been created.</p></note>
 */
@property (nonatomic, assign) AWSIoTTargetSelection targetSelection;

/**
 <p>The ID of the thing group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingGroupId;

@end

/**
 <p>An object that contains information about the job template.</p>
 */
@interface AWSIoTJobTemplateSummary : AWSModel


/**
 <p>The time, in seconds since the epoch, when the job template was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdAt;

/**
 <p>A description of the job template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The ARN of the job template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobTemplateArn;

/**
 <p>The unique identifier of the job template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobTemplateId;

@end

/**
 <p>Send messages to an Amazon Managed Streaming for Apache Kafka (Amazon MSK) or self-managed Apache Kafka cluster.</p>
 Required parameters: [destinationArn, topic, clientProperties]
 */
@interface AWSIoTKafkaAction : AWSModel


/**
 <p>Properties of the Apache Kafka producer client.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable clientProperties;

/**
 <p>The ARN of Kafka action's VPC <code>TopicRuleDestination</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable destinationArn;

/**
 <p>The Kafka message key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>The Kafka message partition.</p>
 */
@property (nonatomic, strong) NSString * _Nullable partition;

/**
 <p>The Kafka topic for messages to be sent to the Kafka broker.</p>
 */
@property (nonatomic, strong) NSString * _Nullable topic;

@end

/**
 <p>Describes a key pair.</p>
 */
@interface AWSIoTKeyPair : AWSModel


/**
 <p>The private key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable privateKey;

/**
 <p>The public key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable publicKey;

@end

/**
 <p>Describes an action to write data to an Amazon Kinesis stream.</p>
 Required parameters: [roleArn, streamName]
 */
@interface AWSIoTKinesisAction : AWSModel


/**
 <p>The partition key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable partitionKey;

/**
 <p>The ARN of the IAM role that grants access to the Amazon Kinesis stream.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 <p>The name of the Amazon Kinesis stream.</p>
 */
@property (nonatomic, strong) NSString * _Nullable streamName;

@end

/**
 <p>Describes an action to invoke a Lambda function.</p>
 Required parameters: [functionArn]
 */
@interface AWSIoTLambdaAction : AWSModel


/**
 <p>The ARN of the Lambda function.</p>
 */
@property (nonatomic, strong) NSString * _Nullable functionArn;

@end

/**
 
 */
@interface AWSIoTListActiveViolationsRequest : AWSRequest


/**
 <p> The criteria for a behavior. </p>
 */
@property (nonatomic, assign) AWSIoTBehaviorCriteriaType behaviorCriteriaType;

/**
 <p> A list of all suppressed alerts. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable listSuppressedAlerts;

/**
 <p>The maximum number of results to return at one time.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token for the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The name of the Device Defender security profile for which violations are listed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable securityProfileName;

/**
 <p>The name of the thing whose active violations are listed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingName;

/**
 <p>The verification state of the violation (detect alarm).</p>
 */
@property (nonatomic, assign) AWSIoTVerificationState verificationState;

@end

/**
 
 */
@interface AWSIoTListActiveViolationsResponse : AWSModel


/**
 <p>The list of active violations.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTActiveViolation *> * _Nullable activeViolations;

/**
 <p>A token that can be used to retrieve the next set of results, or <code>null</code> if there are no additional results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSIoTListAttachedPoliciesRequest : AWSRequest


/**
 <p>The token to retrieve the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>The maximum number of results to be returned per request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable pageSize;

/**
 <p>When true, recursively list attached policies.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable recursive;

/**
 <p>The group or principal for which the policies will be listed. Valid principals are CertificateArn (arn:aws:iot:<i>region</i>:<i>accountId</i>:cert/<i>certificateId</i>), thingGroupArn (arn:aws:iot:<i>region</i>:<i>accountId</i>:thinggroup/<i>groupName</i>) and CognitoId (<i>region</i>:<i>id</i>).</p>
 */
@property (nonatomic, strong) NSString * _Nullable target;

@end

/**
 
 */
@interface AWSIoTListAttachedPoliciesResponse : AWSModel


/**
 <p>The token to retrieve the next set of results, or ``null`` if there are no more results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextMarker;

/**
 <p>The policies.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTPolicy *> * _Nullable policies;

@end

/**
 
 */
@interface AWSIoTListAuditFindingsRequest : AWSRequest


/**
 <p>A filter to limit results to the findings for the specified audit check.</p>
 */
@property (nonatomic, strong) NSString * _Nullable checkName;

/**
 <p>A filter to limit results to those found before the specified time. You must specify either the startTime and endTime or the taskId, but not both.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable endTime;

/**
 <p> Boolean flag indicating whether only the suppressed findings or the unsuppressed findings should be listed. If this parameter isn't provided, the response will list both suppressed and unsuppressed findings. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable listSuppressedFindings;

/**
 <p>The maximum number of results to return at one time. The default is 25.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token for the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>Information identifying the noncompliant resource.</p>
 */
@property (nonatomic, strong) AWSIoTResourceIdentifier * _Nullable resourceIdentifier;

/**
 <p>A filter to limit results to those found after the specified time. You must specify either the startTime and endTime or the taskId, but not both.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable startTime;

/**
 <p>A filter to limit results to the audit with the specified ID. You must specify either the taskId or the startTime and endTime, but not both.</p>
 */
@property (nonatomic, strong) NSString * _Nullable taskId;

@end

/**
 
 */
@interface AWSIoTListAuditFindingsResponse : AWSModel


/**
 <p>The findings (results) of the audit.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTAuditFinding *> * _Nullable findings;

/**
 <p>A token that can be used to retrieve the next set of results, or <code>null</code> if there are no additional results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSIoTListAuditMitigationActionsExecutionsRequest : AWSRequest


/**
 <p>Specify this filter to limit results to those with a specific status.</p>
 */
@property (nonatomic, assign) AWSIoTAuditMitigationActionsExecutionStatus actionStatus;

/**
 <p>Specify this filter to limit results to those that were applied to a specific audit finding.</p>
 */
@property (nonatomic, strong) NSString * _Nullable findingId;

/**
 <p>The maximum number of results to return at one time. The default is 25.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token for the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>Specify this filter to limit results to actions for a specific audit mitigation actions task.</p>
 */
@property (nonatomic, strong) NSString * _Nullable taskId;

@end

/**
 
 */
@interface AWSIoTListAuditMitigationActionsExecutionsResponse : AWSModel


/**
 <p>A set of task execution results based on the input parameters. Details include the mitigation action applied, start time, and task status.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTAuditMitigationActionExecutionMetadata *> * _Nullable actionsExecutions;

/**
 <p>The token for the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSIoTListAuditMitigationActionsTasksRequest : AWSRequest


/**
 <p>Specify this filter to limit results to tasks that were applied to results for a specific audit.</p>
 */
@property (nonatomic, strong) NSString * _Nullable auditTaskId;

/**
 <p>Specify this filter to limit results to tasks that were completed or canceled on or before a specific date and time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable endTime;

/**
 <p>Specify this filter to limit results to tasks that were applied to a specific audit finding.</p>
 */
@property (nonatomic, strong) NSString * _Nullable findingId;

/**
 <p>The maximum number of results to return at one time. The default is 25.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token for the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>Specify this filter to limit results to tasks that began on or after a specific date and time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable startTime;

/**
 <p>Specify this filter to limit results to tasks that are in a specific state.</p>
 */
@property (nonatomic, assign) AWSIoTAuditMitigationActionsTaskStatus taskStatus;

@end

/**
 
 */
@interface AWSIoTListAuditMitigationActionsTasksResponse : AWSModel


/**
 <p>The token for the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The collection of audit mitigation tasks that matched the filter criteria.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTAuditMitigationActionsTaskMetadata *> * _Nullable tasks;

@end

/**
 
 */
@interface AWSIoTListAuditSuppressionsRequest : AWSRequest


/**
 <p> Determines whether suppressions are listed in ascending order by expiration date or not. If parameter isn't provided, <code>ascendingOrder=true</code>. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable ascendingOrder;

/**
 <p>An audit check name. Checks must be enabled for your account. (Use <code>DescribeAccountAuditConfiguration</code> to see the list of all checks, including those that are enabled or use <code>UpdateAccountAuditConfiguration</code> to select which checks are enabled.)</p>
 */
@property (nonatomic, strong) NSString * _Nullable checkName;

/**
 <p> The maximum number of results to return at one time. The default is 25. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p> The token for the next set of results. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>Information that identifies the noncompliant resource.</p>
 */
@property (nonatomic, strong) AWSIoTResourceIdentifier * _Nullable resourceIdentifier;

@end

/**
 
 */
@interface AWSIoTListAuditSuppressionsResponse : AWSModel


/**
 <p> A token that can be used to retrieve the next set of results, or <code>null</code> if there are no additional results. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p> List of audit suppressions. </p>
 */
@property (nonatomic, strong) NSArray<AWSIoTAuditSuppression *> * _Nullable suppressions;

@end

/**
 
 */
@interface AWSIoTListAuditTasksRequest : AWSRequest


/**
 <p>The end of the time period.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable endTime;

/**
 <p>The maximum number of results to return at one time. The default is 25.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token for the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The beginning of the time period. Audit information is retained for a limited time (90 days). Requesting a start time prior to what is retained results in an "InvalidRequestException".</p>
 */
@property (nonatomic, strong) NSDate * _Nullable startTime;

/**
 <p>A filter to limit the output to audits with the specified completion status: can be one of "IN_PROGRESS", "COMPLETED", "FAILED", or "CANCELED".</p>
 */
@property (nonatomic, assign) AWSIoTAuditTaskStatus taskStatus;

/**
 <p>A filter to limit the output to the specified type of audit: can be one of "ON_DEMAND_AUDIT_TASK" or "SCHEDULED__AUDIT_TASK".</p>
 */
@property (nonatomic, assign) AWSIoTAuditTaskType taskType;

@end

/**
 
 */
@interface AWSIoTListAuditTasksResponse : AWSModel


/**
 <p>A token that can be used to retrieve the next set of results, or <code>null</code> if there are no additional results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The audits that were performed during the specified time period.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTAuditTaskMetadata *> * _Nullable tasks;

@end

/**
 
 */
@interface AWSIoTListAuthorizersRequest : AWSRequest


/**
 <p>Return the list of authorizers in ascending alphabetical order.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable ascendingOrder;

/**
 <p>A marker used to get the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>The maximum number of results to return at one time.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable pageSize;

/**
 <p>The status of the list authorizers request.</p>
 */
@property (nonatomic, assign) AWSIoTAuthorizerStatus status;

@end

/**
 
 */
@interface AWSIoTListAuthorizersResponse : AWSModel


/**
 <p>The authorizers.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTAuthorizerSummary *> * _Nullable authorizers;

/**
 <p>A marker used to get the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextMarker;

@end

/**
 
 */
@interface AWSIoTListBillingGroupsRequest : AWSRequest


/**
 <p>The maximum number of results to return per request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>Limit the results to billing groups whose names have the given prefix.</p>
 */
@property (nonatomic, strong) NSString * _Nullable namePrefixFilter;

/**
 <p>To retrieve the next set of results, the <code>nextToken</code> value from a previous response; otherwise <b>null</b> to receive the first set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSIoTListBillingGroupsResponse : AWSModel


/**
 <p>The list of billing groups.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTGroupNameAndArn *> * _Nullable billingGroups;

/**
 <p>The token to use to get the next set of results, or <b>null</b> if there are no additional results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>Input for the ListCACertificates operation.</p>
 */
@interface AWSIoTListCACertificatesRequest : AWSRequest


/**
 <p>Determines the order of the results.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable ascendingOrder;

/**
 <p>The marker for the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>The result page size.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable pageSize;

/**
 <p>The name of the provisioning template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateName;

@end

/**
 <p>The output from the ListCACertificates operation.</p>
 */
@interface AWSIoTListCACertificatesResponse : AWSModel


/**
 <p>The CA certificates registered in your Amazon Web Services account.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTCACertificate *> * _Nullable certificates;

/**
 <p>The current position within the list of CA certificates.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextMarker;

@end

/**
 <p>The input to the ListCertificatesByCA operation.</p>
 Required parameters: [caCertificateId]
 */
@interface AWSIoTListCertificatesByCARequest : AWSRequest


/**
 <p>Specifies the order for results. If True, the results are returned in ascending order, based on the creation date.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable ascendingOrder;

/**
 <p>The ID of the CA certificate. This operation will list all registered device certificate that were signed by this CA certificate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable caCertificateId;

/**
 <p>The marker for the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>The result page size.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable pageSize;

@end

/**
 <p>The output of the ListCertificatesByCA operation.</p>
 */
@interface AWSIoTListCertificatesByCAResponse : AWSModel


/**
 <p>The device certificates signed by the specified CA certificate.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTCertificate *> * _Nullable certificates;

/**
 <p>The marker for the next set of results, or null if there are no additional results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextMarker;

@end

/**
 <p>The input for the ListCertificates operation.</p>
 */
@interface AWSIoTListCertificatesRequest : AWSRequest


/**
 <p>Specifies the order for results. If True, the results are returned in ascending order, based on the creation date.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable ascendingOrder;

/**
 <p>The marker for the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>The result page size.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable pageSize;

@end

/**
 <p>The output of the ListCertificates operation.</p>
 */
@interface AWSIoTListCertificatesResponse : AWSModel


/**
 <p>The descriptions of the certificates.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTCertificate *> * _Nullable certificates;

/**
 <p>The marker for the next set of results, or null if there are no additional results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextMarker;

@end

/**
 
 */
@interface AWSIoTListCustomMetricsRequest : AWSRequest


/**
 <p> The maximum number of results to return at one time. The default is 25. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p> The token for the next set of results. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSIoTListCustomMetricsResponse : AWSModel


/**
 <p> The name of the custom metric. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable metricNames;

/**
 <p> A token that can be used to retrieve the next set of results, or <code>null</code> if there are no additional results. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSIoTListDetectMitigationActionsExecutionsRequest : AWSRequest


/**
 <p> The end of the time period for which ML Detect mitigation actions executions are returned. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable endTime;

/**
 <p> The maximum number of results to return at one time. The default is 25. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p> The token for the next set of results. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p> A filter to limit results to those found after the specified time. You must specify either the startTime and endTime or the taskId, but not both. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable startTime;

/**
 <p> The unique identifier of the task. </p>
 */
@property (nonatomic, strong) NSString * _Nullable taskId;

/**
 <p> The name of the thing whose mitigation actions are listed. </p>
 */
@property (nonatomic, strong) NSString * _Nullable thingName;

/**
 <p> The unique identifier of the violation. </p>
 */
@property (nonatomic, strong) NSString * _Nullable violationId;

@end

/**
 
 */
@interface AWSIoTListDetectMitigationActionsExecutionsResponse : AWSModel


/**
 <p> List of actions executions. </p>
 */
@property (nonatomic, strong) NSArray<AWSIoTDetectMitigationActionExecution *> * _Nullable actionsExecutions;

/**
 <p> A token that can be used to retrieve the next set of results, or <code>null</code> if there are no additional results. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSIoTListDetectMitigationActionsTasksRequest : AWSRequest


/**
 <p> The end of the time period for which ML Detect mitigation actions tasks are returned. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable endTime;

/**
 <p>The maximum number of results to return at one time. The default is 25.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p> The token for the next set of results. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p> A filter to limit results to those found after the specified time. You must specify either the startTime and endTime or the taskId, but not both. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable startTime;

@end

/**
 
 */
@interface AWSIoTListDetectMitigationActionsTasksResponse : AWSModel


/**
 <p> A token that can be used to retrieve the next set of results, or <code>null</code> if there are no additional results. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p> The collection of ML Detect mitigation tasks that matched the filter criteria. </p>
 */
@property (nonatomic, strong) NSArray<AWSIoTDetectMitigationActionsTaskSummary *> * _Nullable tasks;

@end

/**
 
 */
@interface AWSIoTListDimensionsRequest : AWSRequest


/**
 <p>The maximum number of results to retrieve at one time.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token for the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSIoTListDimensionsResponse : AWSModel


/**
 <p>A list of the names of the defined dimensions. Use <code>DescribeDimension</code> to get details for a dimension.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable dimensionNames;

/**
 <p>A token that can be used to retrieve the next set of results, or <code>null</code> if there are no additional results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSIoTListDomainConfigurationsRequest : AWSRequest


/**
 <p>The marker for the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>The result page size.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable pageSize;

/**
 <p>The type of service delivered by the endpoint.</p>
 */
@property (nonatomic, assign) AWSIoTServiceType serviceType;

@end

/**
 
 */
@interface AWSIoTListDomainConfigurationsResponse : AWSModel


/**
 <p>A list of objects that contain summary information about the user's domain configurations.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTDomainConfigurationSummary *> * _Nullable domainConfigurations;

/**
 <p>The marker for the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextMarker;

@end

/**
 
 */
@interface AWSIoTListFleetMetricsRequest : AWSRequest


/**
 <p>The maximum number of results to return in this operation.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>To retrieve the next set of results, the <code>nextToken</code> value from a previous response; otherwise <code>null</code> to receive the first set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSIoTListFleetMetricsResponse : AWSModel


/**
 <p>The list of fleet metrics objects.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTFleetMetricNameAndArn *> * _Nullable fleetMetrics;

/**
 <p>The token for the next set of results. Will not be returned if the operation has returned all results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSIoTListIndicesRequest : AWSRequest


/**
 <p>The maximum number of results to return at one time.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token used to get the next set of results, or <code>null</code> if there are no additional results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSIoTListIndicesResponse : AWSModel


/**
 <p>The index names.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable indexNames;

/**
 <p>The token used to get the next set of results, or <code>null</code> if there are no additional results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSIoTListJobExecutionsForJobRequest : AWSRequest


/**
 <p>The unique identifier you assigned to this job when it was created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

/**
 <p>The maximum number of results to be returned per request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token to retrieve the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The status of the job.</p>
 */
@property (nonatomic, assign) AWSIoTJobExecutionStatus status;

@end

/**
 
 */
@interface AWSIoTListJobExecutionsForJobResponse : AWSModel


/**
 <p>A list of job execution summaries.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTJobExecutionSummaryForJob *> * _Nullable executionSummaries;

/**
 <p>The token for the next set of results, or <b>null</b> if there are no additional results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSIoTListJobExecutionsForThingRequest : AWSRequest


/**
 <p>The unique identifier you assigned to this job when it was created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

/**
 <p>The maximum number of results to be returned per request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The namespace used to indicate that a job is a customer-managed job.</p><p>When you specify a value for this parameter, Amazon Web Services IoT Core sends jobs notifications to MQTT topics that contain the value in the following format.</p><p><code>$aws/things/<i>THING_NAME</i>/jobs/<i>JOB_ID</i>/notify-namespace-<i>NAMESPACE_ID</i>/</code></p><note><p>The <code>namespaceId</code> feature is in public preview.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable namespaceId;

/**
 <p>The token to retrieve the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>An optional filter that lets you search for jobs that have the specified status.</p>
 */
@property (nonatomic, assign) AWSIoTJobExecutionStatus status;

/**
 <p>The thing name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingName;

@end

/**
 
 */
@interface AWSIoTListJobExecutionsForThingResponse : AWSModel


/**
 <p>A list of job execution summaries.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTJobExecutionSummaryForThing *> * _Nullable executionSummaries;

/**
 <p>The token for the next set of results, or <b>null</b> if there are no additional results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSIoTListJobTemplatesRequest : AWSRequest


/**
 <p>The maximum number of results to return in the list.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token to use to return the next set of results in the list.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSIoTListJobTemplatesResponse : AWSModel


/**
 <p>A list of objects that contain information about the job templates.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTJobTemplateSummary *> * _Nullable jobTemplates;

/**
 <p>The token for the next set of results, or <b>null</b> if there are no additional results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSIoTListJobsRequest : AWSRequest


/**
 <p>The maximum number of results to return per request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The namespace used to indicate that a job is a customer-managed job.</p><p>When you specify a value for this parameter, Amazon Web Services IoT Core sends jobs notifications to MQTT topics that contain the value in the following format.</p><p><code>$aws/things/<i>THING_NAME</i>/jobs/<i>JOB_ID</i>/notify-namespace-<i>NAMESPACE_ID</i>/</code></p><note><p>The <code>namespaceId</code> feature is in public preview.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable namespaceId;

/**
 <p>The token to retrieve the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>An optional filter that lets you search for jobs that have the specified status.</p>
 */
@property (nonatomic, assign) AWSIoTJobStatus status;

/**
 <p>Specifies whether the job will continue to run (CONTINUOUS), or will be complete after all those things specified as targets have completed the job (SNAPSHOT). If continuous, the job may also be run on a thing when a change is detected in a target. For example, a job will run on a thing when the thing is added to a target group, even after the job was completed by all things originally in the group. </p><note><p>We recommend that you use continuous jobs instead of snapshot jobs for dynamic thing group targets. By using continuous jobs, devices that join the group receive the job execution even after the job has been created.</p></note>
 */
@property (nonatomic, assign) AWSIoTTargetSelection targetSelection;

/**
 <p>A filter that limits the returned jobs to those for the specified group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingGroupId;

/**
 <p>A filter that limits the returned jobs to those for the specified group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingGroupName;

@end

/**
 
 */
@interface AWSIoTListJobsResponse : AWSModel


/**
 <p>A list of jobs.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTJobSummary *> * _Nullable jobs;

/**
 <p>The token for the next set of results, or <b>null</b> if there are no additional results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSIoTListManagedJobTemplatesRequest : AWSRequest


/**
 <p>Maximum number of entries that can be returned.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token to retrieve the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>An optional parameter for template name. If specified, only the versions of the managed job templates that have the specified template name will be returned.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateName;

@end

/**
 
 */
@interface AWSIoTListManagedJobTemplatesResponse : AWSModel


/**
 <p>A list of managed job templates that are returned.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTManagedJobTemplateSummary *> * _Nullable managedJobTemplates;

/**
 <p>The token to retrieve the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSIoTListMetricValuesRequest : AWSRequest


/**
 <p>The dimension name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dimensionName;

/**
 <p>The dimension value operator.</p>
 */
@property (nonatomic, assign) AWSIoTDimensionValueOperator dimensionValueOperator;

/**
 <p>The end of the time period for which metric values are returned.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable endTime;

/**
 <p>The maximum number of results to return at one time.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The name of the security profile metric for which values are returned.</p>
 */
@property (nonatomic, strong) NSString * _Nullable metricName;

/**
 <p>The token for the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The start of the time period for which metric values are returned.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable startTime;

/**
 <p>The name of the thing for which security profile metric values are returned.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingName;

@end

/**
 
 */
@interface AWSIoTListMetricValuesResponse : AWSModel


/**
 <p>The data the thing reports for the metric during the specified time period.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTMetricDatum *> * _Nullable metricDatumList;

/**
 <p>A token that can be used to retrieve the next set of results, or <code>null</code> if there are no additional results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSIoTListMitigationActionsRequest : AWSRequest


/**
 <p>Specify a value to limit the result to mitigation actions with a specific action type.</p>
 */
@property (nonatomic, assign) AWSIoTMitigationActionType actionType;

/**
 <p>The maximum number of results to return at one time. The default is 25.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token for the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSIoTListMitigationActionsResponse : AWSModel


/**
 <p>A set of actions that matched the specified filter criteria.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTMitigationActionIdentifier *> * _Nullable actionIdentifiers;

/**
 <p>The token for the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSIoTListOTAUpdatesRequest : AWSRequest


/**
 <p>The maximum number of results to return at one time.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>A token used to retrieve the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The OTA update job status.</p>
 */
@property (nonatomic, assign) AWSIoTOTAUpdateStatus otaUpdateStatus;

@end

/**
 
 */
@interface AWSIoTListOTAUpdatesResponse : AWSModel


/**
 <p>A token to use to get the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>A list of OTA update jobs.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTOTAUpdateSummary *> * _Nullable otaUpdates;

@end

/**
 <p>The input to the ListOutgoingCertificates operation.</p>
 */
@interface AWSIoTListOutgoingCertificatesRequest : AWSRequest


/**
 <p>Specifies the order for results. If True, the results are returned in ascending order, based on the creation date.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable ascendingOrder;

/**
 <p>The marker for the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>The result page size.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable pageSize;

@end

/**
 <p>The output from the ListOutgoingCertificates operation.</p>
 */
@interface AWSIoTListOutgoingCertificatesResponse : AWSModel


/**
 <p>The marker for the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextMarker;

/**
 <p>The certificates that are being transferred but not yet accepted.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTOutgoingCertificate *> * _Nullable outgoingCertificates;

@end

/**
 <p>The input for the ListPolicies operation.</p>
 */
@interface AWSIoTListPoliciesRequest : AWSRequest


/**
 <p>Specifies the order for results. If true, the results are returned in ascending creation order.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable ascendingOrder;

/**
 <p>The marker for the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>The result page size.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable pageSize;

@end

/**
 <p>The output from the ListPolicies operation.</p>
 */
@interface AWSIoTListPoliciesResponse : AWSModel


/**
 <p>The marker for the next set of results, or null if there are no additional results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextMarker;

/**
 <p>The descriptions of the policies.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTPolicy *> * _Nullable policies;

@end

/**
 <p>The input for the ListPolicyPrincipals operation.</p>
 Required parameters: [policyName]
 */
@interface AWSIoTListPolicyPrincipalsRequest : AWSRequest


/**
 <p>Specifies the order for results. If true, the results are returned in ascending creation order.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable ascendingOrder;

/**
 <p>The marker for the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>The result page size.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable pageSize;

/**
 <p>The policy name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyName;

@end

/**
 <p>The output from the ListPolicyPrincipals operation.</p>
 */
@interface AWSIoTListPolicyPrincipalsResponse : AWSModel


/**
 <p>The marker for the next set of results, or null if there are no additional results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextMarker;

/**
 <p>The descriptions of the principals.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable principals;

@end

/**
 <p>The input for the ListPolicyVersions operation.</p>
 Required parameters: [policyName]
 */
@interface AWSIoTListPolicyVersionsRequest : AWSRequest


/**
 <p>The policy name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyName;

@end

/**
 <p>The output from the ListPolicyVersions operation.</p>
 */
@interface AWSIoTListPolicyVersionsResponse : AWSModel


/**
 <p>The policy versions.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTPolicyVersion *> * _Nullable policyVersions;

@end

/**
 <p>The input for the ListPrincipalPolicies operation.</p>
 Required parameters: [principal]
 */
@interface AWSIoTListPrincipalPoliciesRequest : AWSRequest


/**
 <p>Specifies the order for results. If true, results are returned in ascending creation order.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable ascendingOrder;

/**
 <p>The marker for the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>The result page size.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable pageSize;

/**
 <p>The principal. Valid principals are CertificateArn (arn:aws:iot:<i>region</i>:<i>accountId</i>:cert/<i>certificateId</i>), thingGroupArn (arn:aws:iot:<i>region</i>:<i>accountId</i>:thinggroup/<i>groupName</i>) and CognitoId (<i>region</i>:<i>id</i>).</p>
 */
@property (nonatomic, strong) NSString * _Nullable principal;

@end

/**
 <p>The output from the ListPrincipalPolicies operation.</p>
 */
@interface AWSIoTListPrincipalPoliciesResponse : AWSModel


/**
 <p>The marker for the next set of results, or null if there are no additional results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextMarker;

/**
 <p>The policies.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTPolicy *> * _Nullable policies;

@end

/**
 <p>The input for the ListPrincipalThings operation.</p>
 Required parameters: [principal]
 */
@interface AWSIoTListPrincipalThingsRequest : AWSRequest


/**
 <p>The maximum number of results to return in this operation.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>To retrieve the next set of results, the <code>nextToken</code> value from a previous response; otherwise <b>null</b> to receive the first set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The principal.</p>
 */
@property (nonatomic, strong) NSString * _Nullable principal;

@end

/**
 <p>The output from the ListPrincipalThings operation.</p>
 */
@interface AWSIoTListPrincipalThingsResponse : AWSModel


/**
 <p>The token to use to get the next set of results, or <b>null</b> if there are no additional results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The things.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable things;

@end

/**
 
 */
@interface AWSIoTListProvisioningTemplateVersionsRequest : AWSRequest


/**
 <p>The maximum number of results to return at one time.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>A token to retrieve the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The name of the provisioning template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateName;

@end

/**
 
 */
@interface AWSIoTListProvisioningTemplateVersionsResponse : AWSModel


/**
 <p>A token to retrieve the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The list of provisioning template versions.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTProvisioningTemplateVersionSummary *> * _Nullable versions;

@end

/**
 
 */
@interface AWSIoTListProvisioningTemplatesRequest : AWSRequest


/**
 <p>The maximum number of results to return at one time.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>A token to retrieve the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSIoTListProvisioningTemplatesResponse : AWSModel


/**
 <p>A token to retrieve the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>A list of provisioning templates</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTProvisioningTemplateSummary *> * _Nullable templates;

@end

/**
 
 */
@interface AWSIoTListRoleAliasesRequest : AWSRequest


/**
 <p>Return the list of role aliases in ascending alphabetical order.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable ascendingOrder;

/**
 <p>A marker used to get the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>The maximum number of results to return at one time.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable pageSize;

@end

/**
 
 */
@interface AWSIoTListRoleAliasesResponse : AWSModel


/**
 <p>A marker used to get the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextMarker;

/**
 <p>The role aliases.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable roleAliases;

@end

/**
 
 */
@interface AWSIoTListScheduledAuditsRequest : AWSRequest


/**
 <p>The maximum number of results to return at one time. The default is 25.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token for the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSIoTListScheduledAuditsResponse : AWSModel


/**
 <p>A token that can be used to retrieve the next set of results, or <code>null</code> if there are no additional results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The list of scheduled audits.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTScheduledAuditMetadata *> * _Nullable scheduledAudits;

@end

/**
 
 */
@interface AWSIoTListSecurityProfilesForTargetRequest : AWSRequest


/**
 <p>The maximum number of results to return at one time.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token for the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>If true, return child groups too.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable recursive;

/**
 <p>The ARN of the target (thing group) whose attached security profiles you want to get.</p>
 */
@property (nonatomic, strong) NSString * _Nullable securityProfileTargetArn;

@end

/**
 
 */
@interface AWSIoTListSecurityProfilesForTargetResponse : AWSModel


/**
 <p>A token that can be used to retrieve the next set of results, or <code>null</code> if there are no additional results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>A list of security profiles and their associated targets.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTSecurityProfileTargetMapping *> * _Nullable securityProfileTargetMappings;

@end

/**
 
 */
@interface AWSIoTListSecurityProfilesRequest : AWSRequest


/**
 <p>A filter to limit results to the security profiles that use the defined dimension. Cannot be used with <code>metricName</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable dimensionName;

/**
 <p>The maximum number of results to return at one time.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p> The name of the custom metric. Cannot be used with <code>dimensionName</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable metricName;

/**
 <p>The token for the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSIoTListSecurityProfilesResponse : AWSModel


/**
 <p>A token that can be used to retrieve the next set of results, or <code>null</code> if there are no additional results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>A list of security profile identifiers (names and ARNs).</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTSecurityProfileIdentifier *> * _Nullable securityProfileIdentifiers;

@end

/**
 
 */
@interface AWSIoTListStreamsRequest : AWSRequest


/**
 <p>Set to true to return the list of streams in ascending order.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable ascendingOrder;

/**
 <p>The maximum number of results to return at a time.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>A token used to get the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSIoTListStreamsResponse : AWSModel


/**
 <p>A token used to get the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>A list of streams.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTStreamSummary *> * _Nullable streams;

@end

/**
 
 */
@interface AWSIoTListTagsForResourceRequest : AWSRequest


/**
 <p>To retrieve the next set of results, the <code>nextToken</code> value from a previous response; otherwise <b>null</b> to receive the first set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The ARN of the resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

@end

/**
 
 */
@interface AWSIoTListTagsForResourceResponse : AWSModel


/**
 <p>The token to use to get the next set of results, or <b>null</b> if there are no additional results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The list of tags assigned to the resource.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSIoTListTargetsForPolicyRequest : AWSRequest


/**
 <p>A marker used to get the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>The maximum number of results to return at one time.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable pageSize;

/**
 <p>The policy name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyName;

@end

/**
 
 */
@interface AWSIoTListTargetsForPolicyResponse : AWSModel


/**
 <p>A marker used to get the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextMarker;

/**
 <p>The policy targets.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable targets;

@end

/**
 
 */
@interface AWSIoTListTargetsForSecurityProfileRequest : AWSRequest


/**
 <p>The maximum number of results to return at one time.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token for the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The security profile.</p>
 */
@property (nonatomic, strong) NSString * _Nullable securityProfileName;

@end

/**
 
 */
@interface AWSIoTListTargetsForSecurityProfileResponse : AWSModel


/**
 <p>A token that can be used to retrieve the next set of results, or <code>null</code> if there are no additional results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The thing groups to which the security profile is attached.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTSecurityProfileTarget *> * _Nullable securityProfileTargets;

@end

/**
 
 */
@interface AWSIoTListThingGroupsForThingRequest : AWSRequest


/**
 <p>The maximum number of results to return at one time.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>To retrieve the next set of results, the <code>nextToken</code> value from a previous response; otherwise <b>null</b> to receive the first set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The thing name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingName;

@end

/**
 
 */
@interface AWSIoTListThingGroupsForThingResponse : AWSModel


/**
 <p>The token to use to get the next set of results, or <b>null</b> if there are no additional results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The thing groups.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTGroupNameAndArn *> * _Nullable thingGroups;

@end

/**
 
 */
@interface AWSIoTListThingGroupsRequest : AWSRequest


/**
 <p>The maximum number of results to return at one time.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>A filter that limits the results to those with the specified name prefix.</p>
 */
@property (nonatomic, strong) NSString * _Nullable namePrefixFilter;

/**
 <p>To retrieve the next set of results, the <code>nextToken</code> value from a previous response; otherwise <b>null</b> to receive the first set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>A filter that limits the results to those with the specified parent group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable parentGroup;

/**
 <p>If true, return child groups as well.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable recursive;

@end

/**
 
 */
@interface AWSIoTListThingGroupsResponse : AWSModel


/**
 <p>The token to use to get the next set of results. Will not be returned if operation has returned all results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The thing groups.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTGroupNameAndArn *> * _Nullable thingGroups;

@end

/**
 <p>The input for the ListThingPrincipal operation.</p>
 Required parameters: [thingName]
 */
@interface AWSIoTListThingPrincipalsRequest : AWSRequest


/**
 <p>The maximum number of results to return in this operation.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>To retrieve the next set of results, the <code>nextToken</code> value from a previous response; otherwise <b>null</b> to receive the first set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The name of the thing.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingName;

@end

/**
 <p>The output from the ListThingPrincipals operation.</p>
 */
@interface AWSIoTListThingPrincipalsResponse : AWSModel


/**
 <p>The token to use to get the next set of results, or <b>null</b> if there are no additional results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The principals associated with the thing.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable principals;

@end

/**
 
 */
@interface AWSIoTListThingRegistrationTaskReportsRequest : AWSRequest


/**
 <p>The maximum number of results to return per request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>To retrieve the next set of results, the <code>nextToken</code> value from a previous response; otherwise <b>null</b> to receive the first set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The type of task report.</p>
 */
@property (nonatomic, assign) AWSIoTReportType reportType;

/**
 <p>The id of the task.</p>
 */
@property (nonatomic, strong) NSString * _Nullable taskId;

@end

/**
 
 */
@interface AWSIoTListThingRegistrationTaskReportsResponse : AWSModel


/**
 <p>The token to use to get the next set of results, or <b>null</b> if there are no additional results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The type of task report.</p>
 */
@property (nonatomic, assign) AWSIoTReportType reportType;

/**
 <p>Links to the task resources.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable resourceLinks;

@end

/**
 
 */
@interface AWSIoTListThingRegistrationTasksRequest : AWSRequest


/**
 <p>The maximum number of results to return at one time.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>To retrieve the next set of results, the <code>nextToken</code> value from a previous response; otherwise <b>null</b> to receive the first set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The status of the bulk thing provisioning task.</p>
 */
@property (nonatomic, assign) AWSIoTStatus status;

@end

/**
 
 */
@interface AWSIoTListThingRegistrationTasksResponse : AWSModel


/**
 <p>The token to use to get the next set of results, or <b>null</b> if there are no additional results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>A list of bulk thing provisioning task IDs.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable taskIds;

@end

/**
 <p>The input for the ListThingTypes operation.</p>
 */
@interface AWSIoTListThingTypesRequest : AWSRequest


/**
 <p>The maximum number of results to return in this operation.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>To retrieve the next set of results, the <code>nextToken</code> value from a previous response; otherwise <b>null</b> to receive the first set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The name of the thing type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingTypeName;

@end

/**
 <p>The output for the ListThingTypes operation.</p>
 */
@interface AWSIoTListThingTypesResponse : AWSModel


/**
 <p>The token for the next set of results. Will not be returned if operation has returned all results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The thing types.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTThingTypeDefinition *> * _Nullable thingTypes;

@end

/**
 
 */
@interface AWSIoTListThingsInBillingGroupRequest : AWSRequest


/**
 <p>The name of the billing group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable billingGroupName;

/**
 <p>The maximum number of results to return per request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>To retrieve the next set of results, the <code>nextToken</code> value from a previous response; otherwise <b>null</b> to receive the first set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSIoTListThingsInBillingGroupResponse : AWSModel


/**
 <p>The token to use to get the next set of results. Will not be returned if operation has returned all results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>A list of things in the billing group.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable things;

@end

/**
 
 */
@interface AWSIoTListThingsInThingGroupRequest : AWSRequest


/**
 <p>The maximum number of results to return at one time.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>To retrieve the next set of results, the <code>nextToken</code> value from a previous response; otherwise <b>null</b> to receive the first set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>When true, list things in this thing group and in all child groups as well.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable recursive;

/**
 <p>The thing group name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingGroupName;

@end

/**
 
 */
@interface AWSIoTListThingsInThingGroupResponse : AWSModel


/**
 <p>The token to use to get the next set of results, or <b>null</b> if there are no additional results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The things in the specified thing group.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable things;

@end

/**
 <p>The input for the ListThings operation.</p>
 */
@interface AWSIoTListThingsRequest : AWSRequest


/**
 <p>The attribute name used to search for things.</p>
 */
@property (nonatomic, strong) NSString * _Nullable attributeName;

/**
 <p>The attribute value used to search for things.</p>
 */
@property (nonatomic, strong) NSString * _Nullable attributeValue;

/**
 <p>The maximum number of results to return in this operation.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>To retrieve the next set of results, the <code>nextToken</code> value from a previous response; otherwise <b>null</b> to receive the first set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The name of the thing type used to search for things.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingTypeName;

/**
 <p>When <code>true</code>, the action returns the thing resources with attribute values that start with the <code>attributeValue</code> provided.</p><p>When <code>false</code>, or not present, the action returns only the thing resources with attribute values that match the entire <code>attributeValue</code> provided. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable usePrefixAttributeValue;

@end

/**
 <p>The output from the ListThings operation.</p>
 */
@interface AWSIoTListThingsResponse : AWSModel


/**
 <p>The token to use to get the next set of results. Will not be returned if operation has returned all results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The things.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTThingAttribute *> * _Nullable things;

@end

/**
 
 */
@interface AWSIoTListTopicRuleDestinationsRequest : AWSRequest


/**
 <p>The maximum number of results to return at one time.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>To retrieve the next set of results, the <code>nextToken</code> value from a previous response; otherwise <b>null</b> to receive the first set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSIoTListTopicRuleDestinationsResponse : AWSModel


/**
 <p>Information about a topic rule destination.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTTopicRuleDestinationSummary *> * _Nullable destinationSummaries;

/**
 <p>The token to use to get the next set of results, or <b>null</b> if there are no additional results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>The input for the ListTopicRules operation.</p>
 */
@interface AWSIoTListTopicRulesRequest : AWSRequest


/**
 <p>The maximum number of results to return.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>To retrieve the next set of results, the <code>nextToken</code> value from a previous response; otherwise <b>null</b> to receive the first set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>Specifies whether the rule is disabled.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable ruleDisabled;

/**
 <p>The topic.</p>
 */
@property (nonatomic, strong) NSString * _Nullable topic;

@end

/**
 <p>The output from the ListTopicRules operation.</p>
 */
@interface AWSIoTListTopicRulesResponse : AWSModel


/**
 <p>The token to use to get the next set of results, or <b>null</b> if there are no additional results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The rules.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTTopicRuleListItem *> * _Nullable rules;

@end

/**
 
 */
@interface AWSIoTListV2LoggingLevelsRequest : AWSRequest


/**
 <p>The maximum number of results to return at one time.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>To retrieve the next set of results, the <code>nextToken</code> value from a previous response; otherwise <b>null</b> to receive the first set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The type of resource for which you are configuring logging. Must be <code>THING_Group</code>.</p>
 */
@property (nonatomic, assign) AWSIoTLogTargetType targetType;

@end

/**
 
 */
@interface AWSIoTListV2LoggingLevelsResponse : AWSModel


/**
 <p>The logging configuration for a target.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTLogTargetConfiguration *> * _Nullable logTargetConfigurations;

/**
 <p>The token to use to get the next set of results, or <b>null</b> if there are no additional results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSIoTListViolationEventsRequest : AWSRequest


/**
 <p> The criteria for a behavior. </p>
 */
@property (nonatomic, assign) AWSIoTBehaviorCriteriaType behaviorCriteriaType;

/**
 <p>The end time for the alerts to be listed.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable endTime;

/**
 <p> A list of all suppressed alerts. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable listSuppressedAlerts;

/**
 <p>The maximum number of results to return at one time.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token for the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>A filter to limit results to those alerts generated by the specified security profile.</p>
 */
@property (nonatomic, strong) NSString * _Nullable securityProfileName;

/**
 <p>The start time for the alerts to be listed.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable startTime;

/**
 <p>A filter to limit results to those alerts caused by the specified thing.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingName;

/**
 <p>The verification state of the violation (detect alarm).</p>
 */
@property (nonatomic, assign) AWSIoTVerificationState verificationState;

@end

/**
 
 */
@interface AWSIoTListViolationEventsResponse : AWSModel


/**
 <p>A token that can be used to retrieve the next set of results, or <code>null</code> if there are no additional results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The security profile violation alerts issued for this account during the given time period, potentially filtered by security profile, behavior violated, or thing (device) violating.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTViolationEvent *> * _Nullable violationEvents;

@end

/**
 <p>A log target.</p>
 Required parameters: [targetType]
 */
@interface AWSIoTLogTarget : AWSModel


/**
 <p>The target name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable targetName;

/**
 <p>The target type.</p>
 */
@property (nonatomic, assign) AWSIoTLogTargetType targetType;

@end

/**
 <p>The target configuration.</p>
 */
@interface AWSIoTLogTargetConfiguration : AWSModel


/**
 <p>The logging level.</p>
 */
@property (nonatomic, assign) AWSIoTLogLevel logLevel;

/**
 <p>A log target</p>
 */
@property (nonatomic, strong) AWSIoTLogTarget * _Nullable logTarget;

@end

/**
 <p>Describes the logging options payload.</p>
 Required parameters: [roleArn]
 */
@interface AWSIoTLoggingOptionsPayload : AWSModel


/**
 <p>The log level.</p>
 */
@property (nonatomic, assign) AWSIoTLogLevel logLevel;

/**
 <p>The ARN of the IAM role that grants access.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

@end

/**
 <p> The configuration of an ML Detect Security Profile. </p>
 Required parameters: [confidenceLevel]
 */
@interface AWSIoTMachineLearningDetectionConfig : AWSModel


/**
 <p> The sensitivity of anomalous behavior evaluation. Can be <code>Low</code>, <code>Medium</code>, or <code>High</code>. </p>
 */
@property (nonatomic, assign) AWSIoTConfidenceLevel confidenceLevel;

@end

/**
 <p>An object that contains information about the managed template.</p>
 */
@interface AWSIoTManagedJobTemplateSummary : AWSModel


/**
 <p>The description for a managed template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>A list of environments that are supported with the managed job template.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable environments;

/**
 <p>The Amazon Resource Name (ARN) for a managed template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateArn;

/**
 <p>The unique Name for a managed template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateName;

/**
 <p>The version for a managed template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateVersion;

@end

/**
 <p>A metric.</p>
 */
@interface AWSIoTMetricDatum : AWSModel


/**
 <p>The time the metric value was reported.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable timestamp;

/**
 <p>The value reported for the metric.</p>
 */
@property (nonatomic, strong) AWSIoTMetricValue * _Nullable value;

@end

/**
 <p>The dimension of a metric.</p>
 Required parameters: [dimensionName]
 */
@interface AWSIoTMetricDimension : AWSModel


/**
 <p>A unique identifier for the dimension.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dimensionName;

/**
 <p>Defines how the <code>dimensionValues</code> of a dimension are interpreted. For example, for dimension type TOPIC_FILTER, the <code>IN</code> operator, a message will be counted only if its topic matches one of the topic filters. With <code>NOT_IN</code> operator, a message will be counted only if it doesn't match any of the topic filters. The operator is optional: if it's not provided (is <code>null</code>), it will be interpreted as <code>IN</code>.</p>
 */
@property (nonatomic, assign) AWSIoTDimensionValueOperator operatorValue;

@end

/**
 <p>The metric you want to retain. Dimensions are optional.</p>
 Required parameters: [metric]
 */
@interface AWSIoTMetricToRetain : AWSModel


/**
 <p>What is measured by the behavior.</p>
 */
@property (nonatomic, strong) NSString * _Nullable metric;

/**
 <p>The dimension of a metric. This can't be used with custom metrics.</p>
 */
@property (nonatomic, strong) AWSIoTMetricDimension * _Nullable metricDimension;

@end

/**
 <p>The value to be compared with the <code>metric</code>.</p>
 */
@interface AWSIoTMetricValue : AWSModel


/**
 <p>If the <code>comparisonOperator</code> calls for a set of CIDRs, use this to specify that set to be compared with the <code>metric</code>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable cidrs;

/**
 <p>If the <code>comparisonOperator</code> calls for a numeric value, use this to specify that numeric value to be compared with the <code>metric</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable count;

/**
 <p> The numeral value of a metric. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable number;

/**
 <p> The numeral values of a metric. </p>
 */
@property (nonatomic, strong) NSArray<NSNumber *> * _Nullable numbers;

/**
 <p>If the <code>comparisonOperator</code> calls for a set of ports, use this to specify that set to be compared with the <code>metric</code>.</p>
 */
@property (nonatomic, strong) NSArray<NSNumber *> * _Nullable ports;

/**
 <p> The string values of a metric. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable strings;

@end

/**
 <p>Describes which changes should be applied as part of a mitigation action.</p>
 */
@interface AWSIoTMitigationAction : AWSModel


/**
 <p>The set of parameters for this mitigation action. The parameters vary, depending on the kind of action you apply.</p>
 */
@property (nonatomic, strong) AWSIoTMitigationActionParams * _Nullable actionParams;

/**
 <p>A unique identifier for the mitigation action.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>A user-friendly name for the mitigation action.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The IAM role ARN used to apply this mitigation action.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

@end

/**
 <p>Information that identifies a mitigation action. This information is returned by ListMitigationActions.</p>
 */
@interface AWSIoTMitigationActionIdentifier : AWSModel


/**
 <p>The IAM role ARN used to apply this mitigation action.</p>
 */
@property (nonatomic, strong) NSString * _Nullable actionArn;

/**
 <p>The friendly name of the mitigation action.</p>
 */
@property (nonatomic, strong) NSString * _Nullable actionName;

/**
 <p>The date when this mitigation action was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDate;

@end

/**
 <p>The set of parameters for this mitigation action. You can specify only one type of parameter (in other words, you can apply only one action for each defined mitigation action).</p>
 */
@interface AWSIoTMitigationActionParams : AWSModel


/**
 <p>Parameters to define a mitigation action that moves devices associated with a certificate to one or more specified thing groups, typically for quarantine.</p>
 */
@property (nonatomic, strong) AWSIoTAddThingsToThingGroupParams * _Nullable addThingsToThingGroupParams;

/**
 <p>Parameters to define a mitigation action that enables Amazon Web Services IoT Core logging at a specified level of detail.</p>
 */
@property (nonatomic, strong) AWSIoTEnableIoTLoggingParams * _Nullable enableIoTLoggingParams;

/**
 <p>Parameters to define a mitigation action that publishes findings to Amazon Simple Notification Service (Amazon SNS. You can implement your own custom actions in response to the Amazon SNS messages.</p>
 */
@property (nonatomic, strong) AWSIoTPublishFindingToSnsParams * _Nullable publishFindingToSnsParams;

/**
 <p>Parameters to define a mitigation action that adds a blank policy to restrict permissions.</p>
 */
@property (nonatomic, strong) AWSIoTReplaceDefaultPolicyVersionParams * _Nullable replaceDefaultPolicyVersionParams;

/**
 <p>Parameters to define a mitigation action that changes the state of the CA certificate to inactive.</p>
 */
@property (nonatomic, strong) AWSIoTUpdateCACertificateParams * _Nullable updateCACertificateParams;

/**
 <p>Parameters to define a mitigation action that changes the state of the device certificate to inactive.</p>
 */
@property (nonatomic, strong) AWSIoTUpdateDeviceCertificateParams * _Nullable updateDeviceCertificateParams;

@end

/**
 <p>Specifies the MQTT context to use for the test authorizer request</p>
 */
@interface AWSIoTMqttContext : AWSModel


/**
 <p>The value of the <code>clientId</code> key in an MQTT authorization request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientId;

/**
 <p>The value of the <code>password</code> key in an MQTT authorization request.</p>
 */
@property (nonatomic, strong) NSData * _Nullable password;

/**
 <p>The value of the <code>username</code> key in an MQTT authorization request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable username;

@end

/**
 <p>Information about the resource that was noncompliant with the audit check.</p>
 */
@interface AWSIoTNonCompliantResource : AWSModel


/**
 <p>Other information about the noncompliant resource.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable additionalInfo;

/**
 <p>Information that identifies the noncompliant resource.</p>
 */
@property (nonatomic, strong) AWSIoTResourceIdentifier * _Nullable resourceIdentifier;

/**
 <p>The type of the noncompliant resource.</p>
 */
@property (nonatomic, assign) AWSIoTResourceType resourceType;

@end

/**
 <p>Describes a file to be associated with an OTA update.</p>
 */
@interface AWSIoTOTAUpdateFile : AWSModel


/**
 <p>A list of name/attribute pairs.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable attributes;

/**
 <p>The code signing method of the file.</p>
 */
@property (nonatomic, strong) AWSIoTCodeSigning * _Nullable codeSigning;

/**
 <p>The location of the updated firmware.</p>
 */
@property (nonatomic, strong) AWSIoTFileLocation * _Nullable fileLocation;

/**
 <p>The name of the file.</p>
 */
@property (nonatomic, strong) NSString * _Nullable fileName;

/**
 <p>An integer value you can include in the job document to allow your devices to identify the type of file received from the cloud.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable fileType;

/**
 <p>The file version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable fileVersion;

@end

/**
 <p>Information about an OTA update.</p>
 */
@interface AWSIoTOTAUpdateInfo : AWSModel


/**
 <p>A collection of name/value pairs</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable additionalParameters;

/**
 <p>The IoT job ARN associated with the OTA update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable awsIotJobArn;

/**
 <p>The IoT job ID associated with the OTA update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable awsIotJobId;

/**
 <p>Configuration for the rollout of OTA updates.</p>
 */
@property (nonatomic, strong) AWSIoTAwsJobExecutionsRolloutConfig * _Nullable awsJobExecutionsRolloutConfig;

/**
 <p>Configuration information for pre-signed URLs. Valid when <code>protocols</code> contains HTTP.</p>
 */
@property (nonatomic, strong) AWSIoTAwsJobPresignedUrlConfig * _Nullable awsJobPresignedUrlConfig;

/**
 <p>The date when the OTA update was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDate;

/**
 <p>A description of the OTA update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>Error information associated with the OTA update.</p>
 */
@property (nonatomic, strong) AWSIoTErrorInfo * _Nullable errorInfo;

/**
 <p>The date when the OTA update was last updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedDate;

/**
 <p>The OTA update ARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable otaUpdateArn;

/**
 <p>A list of files associated with the OTA update.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTOTAUpdateFile *> * _Nullable otaUpdateFiles;

/**
 <p>The OTA update ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable otaUpdateId;

/**
 <p>The status of the OTA update.</p>
 */
@property (nonatomic, assign) AWSIoTOTAUpdateStatus otaUpdateStatus;

/**
 <p>The protocol used to transfer the OTA update image. Valid values are [HTTP], [MQTT], [HTTP, MQTT]. When both HTTP and MQTT are specified, the target device can choose the protocol.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable protocols;

/**
 <p>Specifies whether the OTA update will continue to run (CONTINUOUS), or will be complete after all those things specified as targets have completed the OTA update (SNAPSHOT). If continuous, the OTA update may also be run on a thing when a change is detected in a target. For example, an OTA update will run on a thing when the thing is added to a target group, even after the OTA update was completed by all things originally in the group. </p>
 */
@property (nonatomic, assign) AWSIoTTargetSelection targetSelection;

/**
 <p>The targets of the OTA update.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable targets;

@end

/**
 <p>An OTA update summary.</p>
 */
@interface AWSIoTOTAUpdateSummary : AWSModel


/**
 <p>The date when the OTA update was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDate;

/**
 <p>The OTA update ARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable otaUpdateArn;

/**
 <p>The OTA update ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable otaUpdateId;

@end

/**
 <p>Describes an action that writes data to an Amazon OpenSearch Service domain.</p>
 Required parameters: [roleArn, endpoint, index, type, id]
 */
@interface AWSIoTOpenSearchAction : AWSModel


/**
 <p>The endpoint of your OpenSearch domain.</p>
 */
@property (nonatomic, strong) NSString * _Nullable endpoint;

/**
 <p>The unique identifier for the document you are storing.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The OpenSearch index where you want to store your data.</p>
 */
@property (nonatomic, strong) NSString * _Nullable index;

/**
 <p>The IAM role ARN that has access to OpenSearch.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 <p>The type of document you are storing.</p>
 */
@property (nonatomic, strong) NSString * _Nullable types;

@end

/**
 <p>A certificate that has been transferred but not yet accepted.</p>
 */
@interface AWSIoTOutgoingCertificate : AWSModel


/**
 <p>The certificate ARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificateArn;

/**
 <p>The certificate ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificateId;

/**
 <p>The certificate creation date.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDate;

/**
 <p>The date the transfer was initiated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable transferDate;

/**
 <p>The transfer message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable transferMessage;

/**
 <p>The Amazon Web Services account to which the transfer was made.</p>
 */
@property (nonatomic, strong) NSString * _Nullable transferredTo;

@end

/**
 <p>Describes the percentile and percentile value.</p>
 */
@interface AWSIoTPercentPair : AWSModel


/**
 <p>The percentile.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable percent;

/**
 <p>The value of the percentile.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable value;

@end

/**
 <p>Describes an IoT policy.</p>
 */
@interface AWSIoTPolicy : AWSModel


/**
 <p>The policy ARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyArn;

/**
 <p>The policy name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyName;

@end

/**
 <p>Describes a policy version.</p>
 */
@interface AWSIoTPolicyVersion : AWSModel


/**
 <p>The date and time the policy was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createDate;

/**
 <p>Specifies whether the policy version is the default.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isDefaultVersion;

/**
 <p>The policy version ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable versionId;

@end

/**
 <p>Information about the version of the policy associated with the resource.</p>
 */
@interface AWSIoTPolicyVersionIdentifier : AWSModel


/**
 <p>The name of the policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyName;

/**
 <p>The ID of the version of the policy associated with the resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyVersionId;

@end

/**
 <p>Configuration for pre-signed S3 URLs.</p>
 */
@interface AWSIoTPresignedUrlConfig : AWSModel


/**
 <p>How long (in seconds) pre-signed URLs are valid. Valid values are 60 - 3600, the default value is 3600 seconds. Pre-signed URLs are generated when Jobs receives an MQTT request for the job document.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable expiresInSec;

/**
 <p>The ARN of an IAM role that grants grants permission to download files from the S3 bucket where the job data/updates are stored. The role must also grant permission for IoT to download the files.</p><important><p>For information about addressing the confused deputy problem, see <a href="https://docs.aws.amazon.com/iot/latest/developerguide/cross-service-confused-deputy-prevention.html">cross-service confused deputy prevention</a> in the <i>Amazon Web Services IoT Core developer guide</i>.</p></important>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

@end

/**
 <p>Structure that contains <code>payloadVersion</code> and <code>targetArn</code>.</p>
 Required parameters: [targetArn]
 */
@interface AWSIoTProvisioningHook : AWSModel


/**
 <p>The payload that was sent to the target function.</p><p><i>Note:</i> Only Lambda functions are currently supported.</p>
 */
@property (nonatomic, strong) NSString * _Nullable payloadVersion;

/**
 <p>The ARN of the target function.</p><p><i>Note:</i> Only Lambda functions are currently supported.</p>
 */
@property (nonatomic, strong) NSString * _Nullable targetArn;

@end

/**
 <p>A summary of information about a provisioning template.</p>
 */
@interface AWSIoTProvisioningTemplateSummary : AWSModel


/**
 <p>The date when the provisioning template summary was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDate;

/**
 <p>The description of the provisioning template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>True if the fleet provision template is enabled, otherwise false.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

/**
 <p>The date when the provisioning template summary was last modified.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedDate;

/**
 <p>The ARN of the provisioning template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateArn;

/**
 <p>The name of the provisioning template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateName;

/**
 <p>The type you define in a provisioning template. You can create a template with only one type. You can't change the template type after its creation. The default value is <code>FLEET_PROVISIONING</code>. For more information about provisioning template, see: <a href="https://docs.aws.amazon.com/iot/latest/developerguide/provision-template.html">Provisioning template</a>. </p>
 */
@property (nonatomic, assign) AWSIoTTemplateType types;

@end

/**
 <p>A summary of information about a fleet provision template version.</p>
 */
@interface AWSIoTProvisioningTemplateVersionSummary : AWSModel


/**
 <p>The date when the provisioning template version was created</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDate;

/**
 <p>True if the provisioning template version is the default version, otherwise false.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isDefaultVersion;

/**
 <p>The ID of the fleet privisioning template version.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable versionId;

@end

/**
 <p>Parameters to define a mitigation action that publishes findings to Amazon SNS. You can implement your own custom actions in response to the Amazon SNS messages.</p>
 Required parameters: [topicArn]
 */
@interface AWSIoTPublishFindingToSnsParams : AWSModel


/**
 <p>The ARN of the topic to which you want to publish the findings.</p>
 */
@property (nonatomic, strong) NSString * _Nullable topicArn;

@end

/**
 <p>An asset property value entry containing the following information.</p>
 Required parameters: [propertyValues]
 */
@interface AWSIoTPutAssetPropertyValueEntry : AWSModel


/**
 <p>The ID of the IoT SiteWise asset. You must specify either a <code>propertyAlias</code> or both an <code>aliasId</code> and a <code>propertyId</code>. Accepts substitution templates.</p>
 */
@property (nonatomic, strong) NSString * _Nullable assetId;

/**
 <p>Optional. A unique identifier for this entry that you can define to better track which message caused an error in case of failure. Accepts substitution templates. Defaults to a new UUID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable entryId;

/**
 <p>The name of the property alias associated with your asset property. You must specify either a <code>propertyAlias</code> or both an <code>aliasId</code> and a <code>propertyId</code>. Accepts substitution templates.</p>
 */
@property (nonatomic, strong) NSString * _Nullable propertyAlias;

/**
 <p>The ID of the asset's property. You must specify either a <code>propertyAlias</code> or both an <code>aliasId</code> and a <code>propertyId</code>. Accepts substitution templates.</p>
 */
@property (nonatomic, strong) NSString * _Nullable propertyId;

/**
 <p>A list of property values to insert that each contain timestamp, quality, and value (TQV) information.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTAssetPropertyValue *> * _Nullable propertyValues;

@end

/**
 <p>The input for the DynamoActionVS action that specifies the DynamoDB table to which the message data will be written.</p>
 Required parameters: [tableName]
 */
@interface AWSIoTPutItemInput : AWSModel


/**
 <p>The table where the message data will be written.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tableName;

@end

/**
 
 */
@interface AWSIoTPutVerificationStateOnViolationRequest : AWSRequest


/**
 <p>The verification state of the violation.</p>
 */
@property (nonatomic, assign) AWSIoTVerificationState verificationState;

/**
 <p>The description of the verification state of the violation (detect alarm).</p>
 */
@property (nonatomic, strong) NSString * _Nullable verificationStateDescription;

/**
 <p>The violation ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable violationId;

@end

/**
 
 */
@interface AWSIoTPutVerificationStateOnViolationResponse : AWSModel


@end

/**
 <p>Allows you to define a criteria to initiate the increase in rate of rollout for a job.</p>
 */
@interface AWSIoTRateIncreaseCriteria : AWSModel


/**
 <p>The threshold for number of notified things that will initiate the increase in rate of rollout.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable numberOfNotifiedThings;

/**
 <p>The threshold for number of succeeded things that will initiate the increase in rate of rollout.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable numberOfSucceededThings;

@end

/**
 <p>The input to the RegisterCACertificate operation.</p>
 Required parameters: [caCertificate]
 */
@interface AWSIoTRegisterCACertificateRequest : AWSRequest


/**
 <p>Allows this CA certificate to be used for auto registration of device certificates.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable allowAutoRegistration;

/**
 <p>The CA certificate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable caCertificate;

/**
 <p>Describes the certificate mode in which the Certificate Authority (CA) will be registered. If the <code>verificationCertificate</code> field is not provided, set <code>certificateMode</code> to be <code>SNI_ONLY</code>. If the <code>verificationCertificate</code> field is provided, set <code>certificateMode</code> to be <code>DEFAULT</code>. When <code>certificateMode</code> is not provided, it defaults to <code>DEFAULT</code>. All the device certificates that are registered using this CA will be registered in the same certificate mode as the CA. For more information about certificate mode for device certificates, see <a href="https://docs.aws.amazon.com/iot/latest/apireference/API_CertificateDescription.html#iot-Type-CertificateDescription-certificateMode"> certificate mode</a>. </p>
 */
@property (nonatomic, assign) AWSIoTCertificateMode certificateMode;

/**
 <p>Information about the registration configuration.</p>
 */
@property (nonatomic, strong) AWSIoTRegistrationConfig * _Nullable registrationConfig;

/**
 <p>A boolean value that specifies if the CA certificate is set to active.</p><p>Valid values: <code>ACTIVE | INACTIVE</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable setAsActive;

/**
 <p>Metadata which can be used to manage the CA certificate.</p><note><p>For URI Request parameters use format: ...key1=value1&amp;key2=value2...</p><p>For the CLI command-line parameter use format: &amp;&amp;tags "key1=value1&amp;key2=value2..."</p><p>For the cli-input-json file use format: "tags": "key1=value1&amp;key2=value2..."</p></note>
 */
@property (nonatomic, strong) NSArray<AWSIoTTag *> * _Nullable tags;

/**
 <p>The private key verification certificate. If <code>certificateMode</code> is <code>SNI_ONLY</code>, the <code>verificationCertificate</code> field must be empty. If <code>certificateMode</code> is <code>DEFAULT</code> or not provided, the <code>verificationCertificate</code> field must not be empty. </p>
 */
@property (nonatomic, strong) NSString * _Nullable verificationCertificate;

@end

/**
 <p>The output from the RegisterCACertificateResponse operation.</p>
 */
@interface AWSIoTRegisterCACertificateResponse : AWSModel


/**
 <p>The CA certificate ARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificateArn;

/**
 <p>The CA certificate identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificateId;

@end

/**
 <p>The input to the RegisterCertificate operation.</p>
 Required parameters: [certificatePem]
 */
@interface AWSIoTRegisterCertificateRequest : AWSRequest


/**
 <p>The CA certificate used to sign the device certificate being registered.</p>
 */
@property (nonatomic, strong) NSString * _Nullable caCertificatePem;

/**
 <p>The certificate data, in PEM format.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificatePem;

/**
 <p>A boolean value that specifies if the certificate is set to active.</p><p>Valid values: <code>ACTIVE | INACTIVE</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable setAsActive;

/**
 <p>The status of the register certificate request. Valid values that you can use include <code>ACTIVE</code>, <code>INACTIVE</code>, and <code>REVOKED</code>.</p>
 */
@property (nonatomic, assign) AWSIoTCertificateStatus status;

@end

/**
 <p>The output from the RegisterCertificate operation.</p>
 */
@interface AWSIoTRegisterCertificateResponse : AWSModel


/**
 <p>The certificate ARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificateArn;

/**
 <p>The certificate identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificateId;

@end

/**
 
 */
@interface AWSIoTRegisterCertificateWithoutCARequest : AWSRequest


/**
 <p>The certificate data, in PEM format.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificatePem;

/**
 <p>The status of the register certificate request.</p>
 */
@property (nonatomic, assign) AWSIoTCertificateStatus status;

@end

/**
 
 */
@interface AWSIoTRegisterCertificateWithoutCAResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the registered certificate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificateArn;

/**
 <p>The ID of the registered certificate. (The last part of the certificate ARN contains the certificate ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificateId;

@end

/**
 
 */
@interface AWSIoTRegisterThingRequest : AWSRequest


/**
 <p>The parameters for provisioning a thing. See <a href="https://docs.aws.amazon.com/iot/latest/developerguide/provision-template.html">Provisioning Templates</a> for more information.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable parameters;

/**
 <p>The provisioning template. See <a href="https://docs.aws.amazon.com/iot/latest/developerguide/provision-w-cert.html">Provisioning Devices That Have Device Certificates</a> for more information.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateBody;

@end

/**
 
 */
@interface AWSIoTRegisterThingResponse : AWSModel


/**
 <p>The certificate data, in PEM format.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificatePem;

/**
 <p>ARNs for the generated resources.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable resourceArns;

@end

/**
 <p>The registration configuration.</p>
 */
@interface AWSIoTRegistrationConfig : AWSModel


/**
 <p>The ARN of the role.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 <p>The template body.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateBody;

/**
 <p>The name of the provisioning template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateName;

@end

/**
 <p>The input for the RejectCertificateTransfer operation.</p>
 Required parameters: [certificateId]
 */
@interface AWSIoTRejectCertificateTransferRequest : AWSRequest


/**
 <p>The ID of the certificate. (The last part of the certificate ARN contains the certificate ID.)</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificateId;

/**
 <p>The reason the certificate transfer was rejected.</p>
 */
@property (nonatomic, strong) NSString * _Nullable rejectReason;

@end

/**
 <p>Information about a related resource.</p>
 */
@interface AWSIoTRelatedResource : AWSModel


/**
 <p>Other information about the resource.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable additionalInfo;

/**
 <p>Information that identifies the resource.</p>
 */
@property (nonatomic, strong) AWSIoTResourceIdentifier * _Nullable resourceIdentifier;

/**
 <p>The type of resource.</p>
 */
@property (nonatomic, assign) AWSIoTResourceType resourceType;

@end

/**
 
 */
@interface AWSIoTRemoveThingFromBillingGroupRequest : AWSRequest


/**
 <p>The ARN of the billing group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable billingGroupArn;

/**
 <p>The name of the billing group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable billingGroupName;

/**
 <p>The ARN of the thing to be removed from the billing group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingArn;

/**
 <p>The name of the thing to be removed from the billing group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingName;

@end

/**
 
 */
@interface AWSIoTRemoveThingFromBillingGroupResponse : AWSModel


@end

/**
 
 */
@interface AWSIoTRemoveThingFromThingGroupRequest : AWSRequest


/**
 <p>The ARN of the thing to remove from the group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingArn;

/**
 <p>The group ARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingGroupArn;

/**
 <p>The group name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingGroupName;

/**
 <p>The name of the thing to remove from the group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingName;

@end

/**
 
 */
@interface AWSIoTRemoveThingFromThingGroupResponse : AWSModel


@end

/**
 <p>Parameters to define a mitigation action that adds a blank policy to restrict permissions.</p>
 Required parameters: [templateName]
 */
@interface AWSIoTReplaceDefaultPolicyVersionParams : AWSModel


/**
 <p>The name of the template to be applied. The only supported value is <code>BLANK_POLICY</code>.</p>
 */
@property (nonatomic, assign) AWSIoTPolicyTemplateName templateName;

@end

/**
 <p>The input for the ReplaceTopicRule operation.</p>
 Required parameters: [ruleName, topicRulePayload]
 */
@interface AWSIoTReplaceTopicRuleRequest : AWSRequest


/**
 <p>The name of the rule.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ruleName;

/**
 <p>The rule payload.</p>
 */
@property (nonatomic, strong) AWSIoTTopicRulePayload * _Nullable topicRulePayload;

@end

/**
 <p>Describes an action to republish to another topic.</p>
 Required parameters: [roleArn, topic]
 */
@interface AWSIoTRepublishAction : AWSModel


/**
 <p>The Quality of Service (QoS) level to use when republishing messages. The default value is 0.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable qos;

/**
 <p>The ARN of the IAM role that grants access.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 <p>The name of the MQTT topic.</p>
 */
@property (nonatomic, strong) NSString * _Nullable topic;

@end

/**
 <p>Information that identifies the noncompliant resource.</p>
 */
@interface AWSIoTResourceIdentifier : AWSModel


/**
 <p>The account with which the resource is associated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable account;

/**
 <p>The ID of the CA certificate used to authorize the certificate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable caCertificateId;

/**
 <p>The client ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientId;

/**
 <p>The ID of the Amazon Cognito identity pool.</p>
 */
@property (nonatomic, strong) NSString * _Nullable cognitoIdentityPoolId;

/**
 <p>The ID of the certificate attached to the resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deviceCertificateId;

/**
 <p>The ARN of the IAM role that has overly permissive actions.</p>
 */
@property (nonatomic, strong) NSString * _Nullable iamRoleArn;

/**
 <p>The version of the policy associated with the resource.</p>
 */
@property (nonatomic, strong) AWSIoTPolicyVersionIdentifier * _Nullable policyVersionIdentifier;

/**
 <p>The ARN of the role alias that has overly permissive actions.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleAliasArn;

@end

/**
 <p>The criteria that determines how many retries are allowed for each failure type for a job.</p>
 Required parameters: [failureType, numberOfRetries]
 */
@interface AWSIoTRetryCriteria : AWSModel


/**
 <p>The type of job execution failures that can initiate a job retry.</p>
 */
@property (nonatomic, assign) AWSIoTRetryableFailureType failureType;

/**
 <p>The number of retries allowed for a failure type for the job.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable numberOfRetries;

@end

/**
 <p>Role alias description.</p>
 */
@interface AWSIoTRoleAliasDescription : AWSModel


/**
 <p>The UNIX timestamp of when the role alias was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDate;

/**
 <p>The number of seconds for which the credential is valid.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable credentialDurationSeconds;

/**
 <p>The UNIX timestamp of when the role alias was last modified.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedDate;

/**
 <p>The role alias owner.</p>
 */
@property (nonatomic, strong) NSString * _Nullable owner;

/**
 <p>The role alias.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleAlias;

/**
 <p>The ARN of the role alias.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleAliasArn;

/**
 <p>The role ARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

@end

/**
 <p>Describes an action to write data to an Amazon S3 bucket.</p>
 Required parameters: [roleArn, bucketName, key]
 */
@interface AWSIoTS3Action : AWSModel


/**
 <p>The Amazon S3 bucket.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucketName;

/**
 <p>The Amazon S3 canned ACL that controls access to the object identified by the object key. For more information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/acl-overview.html#canned-acl">S3 canned ACLs</a>.</p>
 */
@property (nonatomic, assign) AWSIoTCannedAccessControlList cannedAcl;

/**
 <p>The object key. For more information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/list_amazons3.html">Actions, resources, and condition keys for Amazon S3</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>The ARN of the IAM role that grants access.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

@end

/**
 <p>Describes the location of updated firmware in S3.</p>
 */
@interface AWSIoTS3Destination : AWSModel


/**
 <p>The S3 bucket that contains the updated firmware.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>The S3 prefix.</p>
 */
@property (nonatomic, strong) NSString * _Nullable prefix;

@end

/**
 <p>The S3 location.</p>
 */
@interface AWSIoTS3Location : AWSModel


/**
 <p>The S3 bucket.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>The S3 key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>The S3 bucket version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable version;

@end

/**
 <p>Describes an action to write a message to a Salesforce IoT Cloud Input Stream.</p>
 Required parameters: [token, url]
 */
@interface AWSIoTSalesforceAction : AWSModel


/**
 <p>The token used to authenticate access to the Salesforce IoT Cloud Input Stream. The token is available from the Salesforce IoT Cloud platform after creation of the Input Stream.</p>
 */
@property (nonatomic, strong) NSString * _Nullable token;

/**
 <p>The URL exposed by the Salesforce IoT Cloud Input Stream. The URL is available from the Salesforce IoT Cloud platform after creation of the Input Stream.</p>
 */
@property (nonatomic, strong) NSString * _Nullable url;

@end

/**
 <p>Information about the scheduled audit.</p>
 */
@interface AWSIoTScheduledAuditMetadata : AWSModel


/**
 <p>The day of the month on which the scheduled audit is run (if the <code>frequency</code> is "MONTHLY"). If days 29-31 are specified, and the month does not have that many days, the audit takes place on the "LAST" day of the month.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dayOfMonth;

/**
 <p>The day of the week on which the scheduled audit is run (if the <code>frequency</code> is "WEEKLY" or "BIWEEKLY").</p>
 */
@property (nonatomic, assign) AWSIoTDayOfWeek dayOfWeek;

/**
 <p>How often the scheduled audit occurs.</p>
 */
@property (nonatomic, assign) AWSIoTAuditFrequency frequency;

/**
 <p>The ARN of the scheduled audit.</p>
 */
@property (nonatomic, strong) NSString * _Nullable scheduledAuditArn;

/**
 <p>The name of the scheduled audit.</p>
 */
@property (nonatomic, strong) NSString * _Nullable scheduledAuditName;

@end

/**
 
 */
@interface AWSIoTSearchIndexRequest : AWSRequest


/**
 <p>The search index name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable indexName;

/**
 <p>The maximum number of results to return at one time.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token used to get the next set of results, or <code>null</code> if there are no additional results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The search query string. For more information about the search query syntax, see <a href="https://docs.aws.amazon.com/iot/latest/developerguide/query-syntax.html">Query syntax</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable queryString;

/**
 <p>The query version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable queryVersion;

@end

/**
 
 */
@interface AWSIoTSearchIndexResponse : AWSModel


/**
 <p>The token used to get the next set of results, or <code>null</code> if there are no additional results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The thing groups that match the search query.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTThingGroupDocument *> * _Nullable thingGroups;

/**
 <p>The things that match the search query.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTThingDocument *> * _Nullable things;

@end

/**
 <p>Identifying information for a Device Defender security profile.</p>
 Required parameters: [name, arn]
 */
@interface AWSIoTSecurityProfileIdentifier : AWSModel


/**
 <p>The ARN of the security profile.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The name you've given to the security profile.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 <p>A target to which an alert is sent when a security profile behavior is violated.</p>
 Required parameters: [arn]
 */
@interface AWSIoTSecurityProfileTarget : AWSModel


/**
 <p>The ARN of the security profile.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

@end

/**
 <p>Information about a security profile and the target associated with it.</p>
 */
@interface AWSIoTSecurityProfileTargetMapping : AWSModel


/**
 <p>Information that identifies the security profile.</p>
 */
@property (nonatomic, strong) AWSIoTSecurityProfileIdentifier * _Nullable securityProfileIdentifier;

/**
 <p>Information about the target (thing group) associated with the security profile.</p>
 */
@property (nonatomic, strong) AWSIoTSecurityProfileTarget * _Nullable target;

@end

/**
 <p>An object that contains information about a server certificate.</p>
 */
@interface AWSIoTServerCertificateSummary : AWSModel


/**
 <p>The ARN of the server certificate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable serverCertificateArn;

/**
 <p>The status of the server certificate.</p>
 */
@property (nonatomic, assign) AWSIoTServerCertificateStatus serverCertificateStatus;

/**
 <p>Details that explain the status of the server certificate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable serverCertificateStatusDetail;

@end

/**
 
 */
@interface AWSIoTSetDefaultAuthorizerRequest : AWSRequest


/**
 <p>The authorizer name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable authorizerName;

@end

/**
 
 */
@interface AWSIoTSetDefaultAuthorizerResponse : AWSModel


/**
 <p>The authorizer ARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable authorizerArn;

/**
 <p>The authorizer name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable authorizerName;

@end

/**
 <p>The input for the SetDefaultPolicyVersion operation.</p>
 Required parameters: [policyName, policyVersionId]
 */
@interface AWSIoTSetDefaultPolicyVersionRequest : AWSRequest


/**
 <p>The policy name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyName;

/**
 <p>The policy version ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyVersionId;

@end

/**
 <p>The input for the SetLoggingOptions operation.</p>
 Required parameters: [loggingOptionsPayload]
 */
@interface AWSIoTSetLoggingOptionsRequest : AWSRequest


/**
 <p>The logging options payload.</p>
 */
@property (nonatomic, strong) AWSIoTLoggingOptionsPayload * _Nullable loggingOptionsPayload;

@end

/**
 
 */
@interface AWSIoTSetV2LoggingLevelRequest : AWSRequest


/**
 <p>The log level.</p>
 */
@property (nonatomic, assign) AWSIoTLogLevel logLevel;

/**
 <p>The log target.</p>
 */
@property (nonatomic, strong) AWSIoTLogTarget * _Nullable logTarget;

@end

/**
 
 */
@interface AWSIoTSetV2LoggingOptionsRequest : AWSRequest


/**
 <p>The default logging level.</p>
 */
@property (nonatomic, assign) AWSIoTLogLevel defaultLogLevel;

/**
 <p>If true all logs are disabled. The default is false.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable disableAllLogs;

/**
 <p>The ARN of the role that allows IoT to write to Cloudwatch logs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

@end

/**
 <p>For more information, see <a href="https://docs.aws.amazon.com/general/latest/gr/signature-version-4.html">Signature Version 4 signing process</a>.</p>
 Required parameters: [signingRegion, serviceName, roleArn]
 */
@interface AWSIoTSigV4Authorization : AWSModel


/**
 <p>The ARN of the signing role.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 <p>The service name to use while signing with Sig V4.</p>
 */
@property (nonatomic, strong) NSString * _Nullable serviceName;

/**
 <p>The signing region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable signingRegion;

@end

/**
 <p>Describes the code-signing profile.</p>
 */
@interface AWSIoTSigningProfileParameter : AWSModel


/**
 <p>Certificate ARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificateArn;

/**
 <p>The location of the code-signing certificate on your device.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificatePathOnDevice;

/**
 <p>The hardware platform of your device.</p>
 */
@property (nonatomic, strong) NSString * _Nullable platform;

@end

/**
 <p>Describes an action to publish to an Amazon SNS topic.</p>
 Required parameters: [targetArn, roleArn]
 */
@interface AWSIoTSnsAction : AWSModel


/**
 <p>(Optional) The message format of the message to publish. Accepted values are "JSON" and "RAW". The default value of the attribute is "RAW". SNS uses this setting to determine if the payload should be parsed and relevant platform-specific bits of the payload should be extracted. To read more about SNS message formats, see <a href="https://docs.aws.amazon.com/sns/latest/dg/json-formats.html">https://docs.aws.amazon.com/sns/latest/dg/json-formats.html</a> refer to their official documentation.</p>
 */
@property (nonatomic, assign) AWSIoTMessageFormat messageFormat;

/**
 <p>The ARN of the IAM role that grants access.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 <p>The ARN of the SNS topic.</p>
 */
@property (nonatomic, strong) NSString * _Nullable targetArn;

@end

/**
 <p>Describes an action to publish data to an Amazon SQS queue.</p>
 Required parameters: [roleArn, queueUrl]
 */
@interface AWSIoTSqsAction : AWSModel


/**
 <p>The URL of the Amazon SQS queue.</p>
 */
@property (nonatomic, strong) NSString * _Nullable queueUrl;

/**
 <p>The ARN of the IAM role that grants access.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 <p>Specifies whether to use Base64 encoding.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable useBase64;

@end

/**
 
 */
@interface AWSIoTStartAuditMitigationActionsTaskRequest : AWSRequest


/**
 <p>For an audit check, specifies which mitigation actions to apply. Those actions must be defined in your Amazon Web Services accounts.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSArray<NSString *> *> * _Nullable auditCheckToActionsMapping;

/**
 <p>Each audit mitigation task must have a unique client request token. If you try to start a new task with the same token as a task that already exists, an exception occurs. If you omit this value, a unique client request token is generated automatically.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientRequestToken;

/**
 <p>Specifies the audit findings to which the mitigation actions are applied. You can apply them to a type of audit check, to all findings from an audit, or to a specific set of findings.</p>
 */
@property (nonatomic, strong) AWSIoTAuditMitigationActionsTaskTarget * _Nullable target;

/**
 <p>A unique identifier for the task. You can use this identifier to check the status of the task or to cancel it.</p>
 */
@property (nonatomic, strong) NSString * _Nullable taskId;

@end

/**
 
 */
@interface AWSIoTStartAuditMitigationActionsTaskResponse : AWSModel


/**
 <p>The unique identifier for the audit mitigation task. This matches the <code>taskId</code> that you specified in the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable taskId;

@end

/**
 
 */
@interface AWSIoTStartDetectMitigationActionsTaskRequest : AWSRequest


/**
 <p> The actions to be performed when a device has unexpected behavior. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable actions;

/**
 <p> Each mitigation action task must have a unique client request token. If you try to create a new task with the same token as a task that already exists, an exception occurs. If you omit this value, Amazon Web Services SDKs will automatically generate a unique client request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable clientRequestToken;

/**
 <p> Specifies to list only active violations. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable includeOnlyActiveViolations;

/**
 <p> Specifies to include suppressed alerts. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable includeSuppressedAlerts;

/**
 <p> Specifies the ML Detect findings to which the mitigation actions are applied. </p>
 */
@property (nonatomic, strong) AWSIoTDetectMitigationActionsTaskTarget * _Nullable target;

/**
 <p> The unique identifier of the task. </p>
 */
@property (nonatomic, strong) NSString * _Nullable taskId;

/**
 <p> Specifies the time period of which violation events occurred between. </p>
 */
@property (nonatomic, strong) AWSIoTViolationEventOccurrenceRange * _Nullable violationEventOccurrenceRange;

@end

/**
 
 */
@interface AWSIoTStartDetectMitigationActionsTaskResponse : AWSModel


/**
 <p> The unique identifier of the task. </p>
 */
@property (nonatomic, strong) NSString * _Nullable taskId;

@end

/**
 
 */
@interface AWSIoTStartOnDemandAuditTaskRequest : AWSRequest


/**
 <p>Which checks are performed during the audit. The checks you specify must be enabled for your account or an exception occurs. Use <code>DescribeAccountAuditConfiguration</code> to see the list of all checks, including those that are enabled or <code>UpdateAccountAuditConfiguration</code> to select which checks are enabled.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable targetCheckNames;

@end

/**
 
 */
@interface AWSIoTStartOnDemandAuditTaskResponse : AWSModel


/**
 <p>The ID of the on-demand audit you started.</p>
 */
@property (nonatomic, strong) NSString * _Nullable taskId;

@end

/**
 <p>Information required to start a signing job.</p>
 */
@interface AWSIoTStartSigningJobParameter : AWSModel


/**
 <p>The location to write the code-signed file.</p>
 */
@property (nonatomic, strong) AWSIoTDestination * _Nullable destination;

/**
 <p>The code-signing profile name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable signingProfileName;

/**
 <p>Describes the code-signing profile.</p>
 */
@property (nonatomic, strong) AWSIoTSigningProfileParameter * _Nullable signingProfileParameter;

@end

/**
 
 */
@interface AWSIoTStartThingRegistrationTaskRequest : AWSRequest


/**
 <p>The S3 bucket that contains the input file.</p>
 */
@property (nonatomic, strong) NSString * _Nullable inputFileBucket;

/**
 <p>The name of input file within the S3 bucket. This file contains a newline delimited JSON file. Each line contains the parameter values to provision one device (thing).</p>
 */
@property (nonatomic, strong) NSString * _Nullable inputFileKey;

/**
 <p>The IAM role ARN that grants permission the input file.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 <p>The provisioning template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateBody;

@end

/**
 
 */
@interface AWSIoTStartThingRegistrationTaskResponse : AWSModel


/**
 <p>The bulk thing provisioning task ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable taskId;

@end

/**
 <p>A statistical ranking (percentile) that indicates a threshold value by which a behavior is determined to be in compliance or in violation of the behavior.</p>
 */
@interface AWSIoTStatisticalThreshold : AWSModel


/**
 <p>The percentile that resolves to a threshold value by which compliance with a behavior is determined. Metrics are collected over the specified period (<code>durationSeconds</code>) from all reporting devices in your account and statistical ranks are calculated. Then, the measurements from a device are collected over the same period. If the accumulated measurements from the device fall above or below (<code>comparisonOperator</code>) the value associated with the percentile specified, then the device is considered to be in compliance with the behavior, otherwise a violation occurs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable statistic;

@end

/**
 <p>A map of key-value pairs for all supported statistics. For issues with missing or unexpected values for this API, consult <a href="https://docs.aws.amazon.com/iot/latest/developerguide/fleet-indexing-troubleshooting.html"> Fleet indexing troubleshooting guide</a>.</p>
 */
@interface AWSIoTStatistics : AWSModel


/**
 <p>The average of the aggregated field values.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable average;

/**
 <p>The count of things that match the query string criteria and contain a valid aggregation field value.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable count;

/**
 <p>The maximum aggregated field value.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maximum;

/**
 <p>The minimum aggregated field value.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable minimum;

/**
 <p>The standard deviation of the aggregated field values.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable stdDeviation;

/**
 <p>The sum of the aggregated field values.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable sum;

/**
 <p>The sum of the squares of the aggregated field values.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable sumOfSquares;

/**
 <p>The variance of the aggregated field values.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable variance;

@end

/**
 <p>Starts execution of a Step Functions state machine.</p>
 Required parameters: [stateMachineName, roleArn]
 */
@interface AWSIoTStepFunctionsAction : AWSModel


/**
 <p>(Optional) A name will be given to the state machine execution consisting of this prefix followed by a UUID. Step Functions automatically creates a unique name for each state machine execution if one is not provided.</p>
 */
@property (nonatomic, strong) NSString * _Nullable executionNamePrefix;

/**
 <p>The ARN of the role that grants IoT permission to start execution of a state machine ("Action":"states:StartExecution").</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 <p>The name of the Step Functions state machine whose execution will be started.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stateMachineName;

@end

/**
 
 */
@interface AWSIoTStopThingRegistrationTaskRequest : AWSRequest


/**
 <p>The bulk thing provisioning task ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable taskId;

@end

/**
 
 */
@interface AWSIoTStopThingRegistrationTaskResponse : AWSModel


@end

/**
 <p>Describes a group of files that can be streamed.</p>
 */
@interface AWSIoTStream : AWSModel


/**
 <p>The ID of a file associated with a stream.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable fileId;

/**
 <p>The stream ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable streamId;

@end

/**
 <p>Represents a file to stream.</p>
 */
@interface AWSIoTStreamFile : AWSModel


/**
 <p>The file ID.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable fileId;

/**
 <p>The location of the file in S3.</p>
 */
@property (nonatomic, strong) AWSIoTS3Location * _Nullable s3Location;

@end

/**
 <p>Information about a stream.</p>
 */
@interface AWSIoTStreamInfo : AWSModel


/**
 <p>The date when the stream was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdAt;

/**
 <p>The description of the stream.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The files to stream.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTStreamFile *> * _Nullable files;

/**
 <p>The date when the stream was last updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdatedAt;

/**
 <p>An IAM role IoT assumes to access your S3 files.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 <p>The stream ARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable streamArn;

/**
 <p>The stream ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable streamId;

/**
 <p>The stream version.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable streamVersion;

@end

/**
 <p>A summary of a stream.</p>
 */
@interface AWSIoTStreamSummary : AWSModel


/**
 <p>A description of the stream.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The stream ARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable streamArn;

/**
 <p>The stream ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable streamId;

/**
 <p>The stream version.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable streamVersion;

@end

/**
 <p>A set of key/value pairs that are used to manage the resource.</p>
 Required parameters: [Key]
 */
@interface AWSIoTTag : AWSModel


/**
 <p>The tag's key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>The tag's value.</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 
 */
@interface AWSIoTTagResourceRequest : AWSRequest


/**
 <p>The ARN of the resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

/**
 <p>The new or modified tags for the resource.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSIoTTagResourceResponse : AWSModel


@end

/**
 <p>Statistics for the checks performed during the audit.</p>
 */
@interface AWSIoTTaskStatistics : AWSModel


/**
 <p>The number of checks that did not run because the audit was canceled.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable canceledChecks;

/**
 <p>The number of checks that found compliant resources.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable compliantChecks;

/**
 <p>The number of checks.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable failedChecks;

/**
 <p>The number of checks in progress.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable inProgressChecks;

/**
 <p>The number of checks that found noncompliant resources.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable nonCompliantChecks;

/**
 <p>The number of checks in this audit.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable totalChecks;

/**
 <p>The number of checks waiting for data collection.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable waitingForDataCollectionChecks;

@end

/**
 <p>Provides summary counts of how many tasks for findings are in a particular state. This information is included in the response from DescribeAuditMitigationActionsTask.</p>
 */
@interface AWSIoTTaskStatisticsForAuditCheck : AWSModel


/**
 <p>The number of findings to which the mitigation action task was canceled when applied.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable canceledFindingsCount;

/**
 <p>The number of findings for which at least one of the actions failed when applied.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable failedFindingsCount;

/**
 <p>The number of findings skipped because of filter conditions provided in the parameters to the command.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable skippedFindingsCount;

/**
 <p>The number of findings for which all mitigation actions succeeded when applied.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable succeededFindingsCount;

/**
 <p>The total number of findings to which a task is being applied.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable totalFindingsCount;

@end

/**
 <p>Performs an aggregation that will return a list of buckets. The list of buckets is a ranked list of the number of occurrences of an aggregation field value.</p>
 */
@interface AWSIoTTermsAggregation : AWSModel


/**
 <p>The number of buckets to return in the response. Default to 10.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxBuckets;

@end

/**
 
 */
@interface AWSIoTTestAuthorizationRequest : AWSRequest


/**
 <p>A list of authorization info objects. Simulating authorization will create a response for each <code>authInfo</code> object in the list.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTAuthInfo *> * _Nullable authInfos;

/**
 <p>The MQTT client ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientId;

/**
 <p>The Cognito identity pool ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable cognitoIdentityPoolId;

/**
 <p>When testing custom authorization, the policies specified here are treated as if they are attached to the principal being authorized.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable policyNamesToAdd;

/**
 <p>When testing custom authorization, the policies specified here are treated as if they are not attached to the principal being authorized.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable policyNamesToSkip;

/**
 <p>The principal. Valid principals are CertificateArn (arn:aws:iot:<i>region</i>:<i>accountId</i>:cert/<i>certificateId</i>), thingGroupArn (arn:aws:iot:<i>region</i>:<i>accountId</i>:thinggroup/<i>groupName</i>) and CognitoId (<i>region</i>:<i>id</i>).</p>
 */
@property (nonatomic, strong) NSString * _Nullable principal;

@end

/**
 
 */
@interface AWSIoTTestAuthorizationResponse : AWSModel


/**
 <p>The authentication results.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTAuthResult *> * _Nullable authResults;

@end

/**
 
 */
@interface AWSIoTTestInvokeAuthorizerRequest : AWSRequest


/**
 <p>The custom authorizer name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable authorizerName;

/**
 <p>Specifies a test HTTP authorization request.</p>
 */
@property (nonatomic, strong) AWSIoTHttpContext * _Nullable httpContext;

/**
 <p>Specifies a test MQTT authorization request.</p>
 */
@property (nonatomic, strong) AWSIoTMqttContext * _Nullable mqttContext;

/**
 <p>Specifies a test TLS authorization request.</p>
 */
@property (nonatomic, strong) AWSIoTTlsContext * _Nullable tlsContext;

/**
 <p>The token returned by your custom authentication service.</p>
 */
@property (nonatomic, strong) NSString * _Nullable token;

/**
 <p>The signature made with the token and your custom authentication service's private key. This value must be Base-64-encoded.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tokenSignature;

@end

/**
 
 */
@interface AWSIoTTestInvokeAuthorizerResponse : AWSModel


/**
 <p>The number of seconds after which the connection is terminated.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable disconnectAfterInSeconds;

/**
 <p>True if the token is authenticated, otherwise false.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isAuthenticated;

/**
 <p>IAM policy documents.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable policyDocuments;

/**
 <p>The principal ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable principalId;

/**
 <p>The number of seconds after which the temporary credentials are refreshed.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable refreshAfterInSeconds;

@end

/**
 <p>The properties of the thing, including thing name, thing type name, and a list of thing attributes.</p>
 */
@interface AWSIoTThingAttribute : AWSModel


/**
 <p>A list of thing attributes which are name-value pairs.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable attributes;

/**
 <p>The thing ARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingArn;

/**
 <p>The name of the thing.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingName;

/**
 <p>The name of the thing type, if the thing has been associated with a type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingTypeName;

/**
 <p>The version of the thing record in the registry.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable version;

@end

/**
 <p>The connectivity status of the thing.</p>
 */
@interface AWSIoTThingConnectivity : AWSModel


/**
 <p>True if the thing is connected to the Amazon Web Services IoT Core service; false if it is not connected.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable connected;

/**
 <p>The reason why the client is disconnected. If the thing has been disconnected for approximately an hour, the <code>disconnectReason</code> value might be missing.</p>
 */
@property (nonatomic, strong) NSString * _Nullable disconnectReason;

/**
 <p>The epoch time (in milliseconds) when the thing last connected or disconnected. If the thing has been disconnected for approximately an hour, the time value might be missing.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable timestamp;

@end

/**
 <p>The thing search index document.</p>
 */
@interface AWSIoTThingDocument : AWSModel


/**
 <p>The attributes.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable attributes;

/**
 <p>Indicates whether the thing is connected to the Amazon Web Services IoT Core service.</p>
 */
@property (nonatomic, strong) AWSIoTThingConnectivity * _Nullable connectivity;

/**
 <p>Contains Device Defender data.</p><p>For more information about Device Defender, see <a href="https://docs.aws.amazon.com/iot/latest/developerguide/device-defender.html">Device Defender</a>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable deviceDefender;

/**
 <p>The unnamed shadow and named shadow.</p><p>For more information about shadows, see <a href="https://docs.aws.amazon.com/iot/latest/developerguide/iot-device-shadows.html">IoT Device Shadow service.</a></p>
 */
@property (nonatomic, strong) NSString * _Nullable shadow;

/**
 <p>Thing group names.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable thingGroupNames;

/**
 <p>The thing ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingId;

/**
 <p>The thing name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingName;

/**
 <p>The thing type name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingTypeName;

@end

/**
 <p>The thing group search index document.</p>
 */
@interface AWSIoTThingGroupDocument : AWSModel


/**
 <p>The thing group attributes.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable attributes;

/**
 <p>Parent group names.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable parentGroupNames;

/**
 <p>The thing group description.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingGroupDescription;

/**
 <p>The thing group ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingGroupId;

/**
 <p>The thing group name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingGroupName;

@end

/**
 <p>Thing group indexing configuration.</p>
 Required parameters: [thingGroupIndexingMode]
 */
@interface AWSIoTThingGroupIndexingConfiguration : AWSModel


/**
 <p>A list of thing group fields to index. This list cannot contain any managed fields. Use the GetIndexingConfiguration API to get a list of managed fields.</p><p>Contains custom field names and their data type.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTField *> * _Nullable customFields;

/**
 <p>Contains fields that are indexed and whose types are already known by the Fleet Indexing service.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTField *> * _Nullable managedFields;

/**
 <p>Thing group indexing mode.</p>
 */
@property (nonatomic, assign) AWSIoTThingGroupIndexingMode thingGroupIndexingMode;

@end

/**
 <p>Thing group metadata.</p>
 */
@interface AWSIoTThingGroupMetadata : AWSModel


/**
 <p>The UNIX timestamp of when the thing group was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDate;

/**
 <p>The parent thing group name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable parentGroupName;

/**
 <p>The root parent thing group.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTGroupNameAndArn *> * _Nullable rootToParentThingGroups;

@end

/**
 <p>Thing group properties.</p>
 */
@interface AWSIoTThingGroupProperties : AWSModel


/**
 <p>The thing group attributes in JSON format.</p>
 */
@property (nonatomic, strong) AWSIoTAttributePayload * _Nullable attributePayload;

/**
 <p>The thing group description.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingGroupDescription;

@end

/**
 <p>The thing indexing configuration. For more information, see <a href="https://docs.aws.amazon.com/iot/latest/developerguide/managing-index.html">Managing Thing Indexing</a>.</p>
 Required parameters: [thingIndexingMode]
 */
@interface AWSIoTThingIndexingConfiguration : AWSModel


/**
 <p>Contains custom field names and their data type.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTField *> * _Nullable customFields;

/**
 <p>Device Defender indexing mode. Valid values are:</p><ul><li><p>VIOLATIONS – Your thing index contains Device Defender violations. To enable Device Defender indexing, <i>deviceDefenderIndexingMode</i> must not be set to OFF.</p></li><li><p>OFF - Device Defender indexing is disabled.</p></li></ul><p>For more information about Device Defender violations, see <a href="https://docs.aws.amazon.com/iot/latest/developerguide/device-defender-detect.html">Device Defender Detect.</a></p>
 */
@property (nonatomic, assign) AWSIoTDeviceDefenderIndexingMode deviceDefenderIndexingMode;

/**
 <p>Provides additional filters for specific data sources. Named shadow is the only data source that currently supports and requires a filter. To add named shadows to your fleet indexing configuration, set <code>namedShadowIndexingMode</code> to be <code>ON</code> and specify your shadow names in <code>filter</code>.</p>
 */
@property (nonatomic, strong) AWSIoTIndexingFilter * _Nullable filter;

/**
 <p>Contains fields that are indexed and whose types are already known by the Fleet Indexing service.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTField *> * _Nullable managedFields;

/**
 <p>Named shadow indexing mode. Valid values are:</p><ul><li><p>ON – Your thing index contains named shadow. To enable thing named shadow indexing, <i>namedShadowIndexingMode</i> must not be set to OFF.</p></li><li><p>OFF - Named shadow indexing is disabled.</p></li></ul><p>For more information about Shadows, see <a href="https://docs.aws.amazon.com/iot/latest/developerguide/iot-device-shadows.html">IoT Device Shadow service.</a></p>
 */
@property (nonatomic, assign) AWSIoTNamedShadowIndexingMode namedShadowIndexingMode;

/**
 <p>Thing connectivity indexing mode. Valid values are: </p><ul><li><p>STATUS – Your thing index contains connectivity status. To enable thing connectivity indexing, <i>thingIndexMode</i> must not be set to OFF.</p></li><li><p>OFF - Thing connectivity status indexing is disabled.</p></li></ul>
 */
@property (nonatomic, assign) AWSIoTThingConnectivityIndexingMode thingConnectivityIndexingMode;

/**
 <p>Thing indexing mode. Valid values are:</p><ul><li><p>REGISTRY – Your thing index contains registry data only.</p></li><li><p>REGISTRY_AND_SHADOW - Your thing index contains registry and shadow data.</p></li><li><p>OFF - Thing indexing is disabled.</p></li></ul>
 */
@property (nonatomic, assign) AWSIoTThingIndexingMode thingIndexingMode;

@end

/**
 <p>The definition of the thing type, including thing type name and description.</p>
 */
@interface AWSIoTThingTypeDefinition : AWSModel


/**
 <p>The thing type ARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingTypeArn;

/**
 <p>The ThingTypeMetadata contains additional information about the thing type including: creation date and time, a value indicating whether the thing type is deprecated, and a date and time when it was deprecated.</p>
 */
@property (nonatomic, strong) AWSIoTThingTypeMetadata * _Nullable thingTypeMetadata;

/**
 <p>The name of the thing type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingTypeName;

/**
 <p>The ThingTypeProperties for the thing type.</p>
 */
@property (nonatomic, strong) AWSIoTThingTypeProperties * _Nullable thingTypeProperties;

@end

/**
 <p>The ThingTypeMetadata contains additional information about the thing type including: creation date and time, a value indicating whether the thing type is deprecated, and a date and time when time was deprecated.</p>
 */
@interface AWSIoTThingTypeMetadata : AWSModel


/**
 <p>The date and time when the thing type was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDate;

/**
 <p>Whether the thing type is deprecated. If <b>true</b>, no new things could be associated with this type.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable deprecated;

/**
 <p>The date and time when the thing type was deprecated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable deprecationDate;

@end

/**
 <p>The ThingTypeProperties contains information about the thing type including: a thing type description, and a list of searchable thing attribute names.</p>
 */
@interface AWSIoTThingTypeProperties : AWSModel


/**
 <p>A list of searchable thing attribute names.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable searchableAttributes;

/**
 <p>The description of the thing type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingTypeDescription;

@end

/**
 <p>Specifies the amount of time each device has to finish its execution of the job. A timer is started when the job execution status is set to <code>IN_PROGRESS</code>. If the job execution status is not set to another terminal state before the timer expires, it will be automatically set to <code>TIMED_OUT</code>.</p>
 */
@interface AWSIoTTimeoutConfig : AWSModel


/**
 <p>Specifies the amount of time, in minutes, this device has to finish execution of this job. The timeout interval can be anywhere between 1 minute and 7 days (1 to 10080 minutes). The in progress timer can't be updated and will apply to all job executions for the job. Whenever a job execution remains in the IN_PROGRESS status for longer than this interval, the job execution will fail and switch to the terminal <code>TIMED_OUT</code> status.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable inProgressTimeoutInMinutes;

@end

/**
 <p>The Timestream rule action writes attributes (measures) from an MQTT message into an Amazon Timestream table. For more information, see the <a href="https://docs.aws.amazon.com/iot/latest/developerguide/timestream-rule-action.html">Timestream</a> topic rule action documentation.</p>
 Required parameters: [roleArn, databaseName, tableName, dimensions]
 */
@interface AWSIoTTimestreamAction : AWSModel


/**
 <p>The name of an Amazon Timestream database.</p>
 */
@property (nonatomic, strong) NSString * _Nullable databaseName;

/**
 <p>Metadata attributes of the time series that are written in each measure record.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTTimestreamDimension *> * _Nullable dimensions;

/**
 <p>The ARN of the role that grants permission to write to the Amazon Timestream database table.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 <p>The name of the database table into which to write the measure records.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tableName;

/**
 <p>Specifies an application-defined value to replace the default value assigned to the Timestream record's timestamp in the <code>time</code> column.</p><p>You can use this property to specify the value and the precision of the Timestream record's timestamp. You can specify a value from the message payload or a value computed by a substitution template.</p><p>If omitted, the topic rule action assigns the timestamp, in milliseconds, at the time it processed the rule. </p>
 */
@property (nonatomic, strong) AWSIoTTimestreamTimestamp * _Nullable timestamp;

@end

/**
 <p>Metadata attributes of the time series that are written in each measure record.</p>
 Required parameters: [name, value]
 */
@interface AWSIoTTimestreamDimension : AWSModel


/**
 <p>The metadata dimension name. This is the name of the column in the Amazon Timestream database table record.</p><p>Dimensions cannot be named: <code>measure_name</code>, <code>measure_value</code>, or <code>time</code>. These names are reserved. Dimension names cannot start with <code>ts_</code> or <code>measure_value</code> and they cannot contain the colon (<code>:</code>) character.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The value to write in this column of the database record.</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 <p>Describes how to interpret an application-defined timestamp value from an MQTT message payload and the precision of that value.</p>
 Required parameters: [value, unit]
 */
@interface AWSIoTTimestreamTimestamp : AWSModel


/**
 <p>The precision of the timestamp value that results from the expression described in <code>value</code>.</p><p>Valid values: <code>SECONDS</code> | <code>MILLISECONDS</code> | <code>MICROSECONDS</code> | <code>NANOSECONDS</code>. The default is <code>MILLISECONDS</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable unit;

/**
 <p>An expression that returns a long epoch time value.</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 <p>Specifies the TLS context to use for the test authorizer request.</p>
 */
@interface AWSIoTTlsContext : AWSModel


/**
 <p>The value of the <code>serverName</code> key in a TLS authorization request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable serverName;

@end

/**
 <p>Describes a rule.</p>
 */
@interface AWSIoTTopicRule : AWSModel


/**
 <p>The actions associated with the rule.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTAction *> * _Nullable actions;

/**
 <p>The version of the SQL rules engine to use when evaluating the rule.</p>
 */
@property (nonatomic, strong) NSString * _Nullable awsIotSqlVersion;

/**
 <p>The date and time the rule was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdAt;

/**
 <p>The description of the rule.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The action to perform when an error occurs.</p>
 */
@property (nonatomic, strong) AWSIoTAction * _Nullable errorAction;

/**
 <p>Specifies whether the rule is disabled.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable ruleDisabled;

/**
 <p>The name of the rule.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ruleName;

/**
 <p>The SQL statement used to query the topic. When using a SQL query with multiple lines, be sure to escape the newline characters.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sql;

@end

/**
 <p>A topic rule destination.</p>
 */
@interface AWSIoTTopicRuleDestination : AWSModel


/**
 <p>The topic rule destination URL.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The date and time when the topic rule destination was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdAt;

/**
 <p>Properties of the HTTP URL.</p>
 */
@property (nonatomic, strong) AWSIoTHttpUrlDestinationProperties * _Nullable httpUrlProperties;

/**
 <p>The date and time when the topic rule destination was last updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdatedAt;

/**
 <p>The status of the topic rule destination. Valid values are:</p><dl><dt>IN_PROGRESS</dt><dd><p>A topic rule destination was created but has not been confirmed. You can set <code>status</code> to <code>IN_PROGRESS</code> by calling <code>UpdateTopicRuleDestination</code>. Calling <code>UpdateTopicRuleDestination</code> causes a new confirmation challenge to be sent to your confirmation endpoint.</p></dd><dt>ENABLED</dt><dd><p>Confirmation was completed, and traffic to this destination is allowed. You can set <code>status</code> to <code>DISABLED</code> by calling <code>UpdateTopicRuleDestination</code>.</p></dd><dt>DISABLED</dt><dd><p>Confirmation was completed, and traffic to this destination is not allowed. You can set <code>status</code> to <code>ENABLED</code> by calling <code>UpdateTopicRuleDestination</code>.</p></dd><dt>ERROR</dt><dd><p>Confirmation could not be completed, for example if the confirmation timed out. You can call <code>GetTopicRuleDestination</code> for details about the error. You can set <code>status</code> to <code>IN_PROGRESS</code> by calling <code>UpdateTopicRuleDestination</code>. Calling <code>UpdateTopicRuleDestination</code> causes a new confirmation challenge to be sent to your confirmation endpoint.</p></dd></dl>
 */
@property (nonatomic, assign) AWSIoTTopicRuleDestinationStatus status;

/**
 <p>Additional details or reason why the topic rule destination is in the current status.</p>
 */
@property (nonatomic, strong) NSString * _Nullable statusReason;

/**
 <p>Properties of the virtual private cloud (VPC) connection.</p>
 */
@property (nonatomic, strong) AWSIoTVpcDestinationProperties * _Nullable vpcProperties;

@end

/**
 <p>Configuration of the topic rule destination.</p>
 */
@interface AWSIoTTopicRuleDestinationConfiguration : AWSModel


/**
 <p>Configuration of the HTTP URL.</p>
 */
@property (nonatomic, strong) AWSIoTHttpUrlDestinationConfiguration * _Nullable httpUrlConfiguration;

/**
 <p>Configuration of the virtual private cloud (VPC) connection.</p>
 */
@property (nonatomic, strong) AWSIoTVpcDestinationConfiguration * _Nullable vpcConfiguration;

@end

/**
 <p>Information about the topic rule destination.</p>
 */
@interface AWSIoTTopicRuleDestinationSummary : AWSModel


/**
 <p>The topic rule destination ARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The date and time when the topic rule destination was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdAt;

/**
 <p>Information about the HTTP URL.</p>
 */
@property (nonatomic, strong) AWSIoTHttpUrlDestinationSummary * _Nullable httpUrlSummary;

/**
 <p>The date and time when the topic rule destination was last updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdatedAt;

/**
 <p>The status of the topic rule destination. Valid values are:</p><dl><dt>IN_PROGRESS</dt><dd><p>A topic rule destination was created but has not been confirmed. You can set <code>status</code> to <code>IN_PROGRESS</code> by calling <code>UpdateTopicRuleDestination</code>. Calling <code>UpdateTopicRuleDestination</code> causes a new confirmation challenge to be sent to your confirmation endpoint.</p></dd><dt>ENABLED</dt><dd><p>Confirmation was completed, and traffic to this destination is allowed. You can set <code>status</code> to <code>DISABLED</code> by calling <code>UpdateTopicRuleDestination</code>.</p></dd><dt>DISABLED</dt><dd><p>Confirmation was completed, and traffic to this destination is not allowed. You can set <code>status</code> to <code>ENABLED</code> by calling <code>UpdateTopicRuleDestination</code>.</p></dd><dt>ERROR</dt><dd><p>Confirmation could not be completed, for example if the confirmation timed out. You can call <code>GetTopicRuleDestination</code> for details about the error. You can set <code>status</code> to <code>IN_PROGRESS</code> by calling <code>UpdateTopicRuleDestination</code>. Calling <code>UpdateTopicRuleDestination</code> causes a new confirmation challenge to be sent to your confirmation endpoint.</p></dd></dl>
 */
@property (nonatomic, assign) AWSIoTTopicRuleDestinationStatus status;

/**
 <p>The reason the topic rule destination is in the current status.</p>
 */
@property (nonatomic, strong) NSString * _Nullable statusReason;

/**
 <p>Information about the virtual private cloud (VPC) connection.</p>
 */
@property (nonatomic, strong) AWSIoTVpcDestinationSummary * _Nullable vpcDestinationSummary;

@end

/**
 <p>Describes a rule.</p>
 */
@interface AWSIoTTopicRuleListItem : AWSModel


/**
 <p>The date and time the rule was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdAt;

/**
 <p>The rule ARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ruleArn;

/**
 <p>Specifies whether the rule is disabled.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable ruleDisabled;

/**
 <p>The name of the rule.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ruleName;

/**
 <p>The pattern for the topic names that apply.</p>
 */
@property (nonatomic, strong) NSString * _Nullable topicPattern;

@end

/**
 <p>Describes a rule.</p>
 Required parameters: [sql, actions]
 */
@interface AWSIoTTopicRulePayload : AWSModel


/**
 <p>The actions associated with the rule.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTAction *> * _Nullable actions;

/**
 <p>The version of the SQL rules engine to use when evaluating the rule.</p>
 */
@property (nonatomic, strong) NSString * _Nullable awsIotSqlVersion;

/**
 <p>The description of the rule.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The action to take when an error occurs.</p>
 */
@property (nonatomic, strong) AWSIoTAction * _Nullable errorAction;

/**
 <p>Specifies whether the rule is disabled.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable ruleDisabled;

/**
 <p>The SQL statement used to query the topic. For more information, see <a href="https://docs.aws.amazon.com/iot/latest/developerguide/iot-sql-reference.html">IoT SQL Reference</a> in the <i>IoT Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sql;

@end

/**
 <p>The input for the TransferCertificate operation.</p>
 Required parameters: [certificateId, targetAwsAccount]
 */
@interface AWSIoTTransferCertificateRequest : AWSRequest


/**
 <p>The ID of the certificate. (The last part of the certificate ARN contains the certificate ID.)</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificateId;

/**
 <p>The Amazon Web Services account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable targetAwsAccount;

/**
 <p>The transfer message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable transferMessage;

@end

/**
 <p>The output from the TransferCertificate operation.</p>
 */
@interface AWSIoTTransferCertificateResponse : AWSModel


/**
 <p>The ARN of the certificate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable transferredCertificateArn;

@end

/**
 <p>Data used to transfer a certificate to an Amazon Web Services account.</p>
 */
@interface AWSIoTTransferData : AWSModel


/**
 <p>The date the transfer was accepted.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable acceptDate;

/**
 <p>The date the transfer was rejected.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable rejectDate;

/**
 <p>The reason why the transfer was rejected.</p>
 */
@property (nonatomic, strong) NSString * _Nullable rejectReason;

/**
 <p>The date the transfer took place.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable transferDate;

/**
 <p>The transfer message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable transferMessage;

@end

/**
 
 */
@interface AWSIoTUntagResourceRequest : AWSRequest


/**
 <p>The ARN of the resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

/**
 <p>A list of the keys of the tags to be removed from the resource.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable tagKeys;

@end

/**
 
 */
@interface AWSIoTUntagResourceResponse : AWSModel


@end

/**
 
 */
@interface AWSIoTUpdateAccountAuditConfigurationRequest : AWSRequest


/**
 <p>Specifies which audit checks are enabled and disabled for this account. Use <code>DescribeAccountAuditConfiguration</code> to see the list of all checks, including those that are currently enabled.</p><p>Some data collection might start immediately when certain checks are enabled. When a check is disabled, any data collected so far in relation to the check is deleted.</p><p>You cannot disable a check if it's used by any scheduled audit. You must first delete the check from the scheduled audit or delete the scheduled audit itself.</p><p>On the first call to <code>UpdateAccountAuditConfiguration</code>, this parameter is required and must specify at least one enabled check.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSIoTAuditCheckConfiguration *> * _Nullable auditCheckConfigurations;

/**
 <p>Information about the targets to which audit notifications are sent.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSIoTAuditNotificationTarget *> * _Nullable auditNotificationTargetConfigurations;

/**
 <p>The Amazon Resource Name (ARN) of the role that grants permission to IoT to access information about your devices, policies, certificates, and other items as required when performing an audit.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

@end

/**
 
 */
@interface AWSIoTUpdateAccountAuditConfigurationResponse : AWSModel


@end

/**
 
 */
@interface AWSIoTUpdateAuditSuppressionRequest : AWSRequest


/**
 <p>An audit check name. Checks must be enabled for your account. (Use <code>DescribeAccountAuditConfiguration</code> to see the list of all checks, including those that are enabled or use <code>UpdateAccountAuditConfiguration</code> to select which checks are enabled.)</p>
 */
@property (nonatomic, strong) NSString * _Nullable checkName;

/**
 <p> The description of the audit suppression. </p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p> The expiration date (epoch timestamp in seconds) that you want the suppression to adhere to. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable expirationDate;

/**
 <p>Information that identifies the noncompliant resource.</p>
 */
@property (nonatomic, strong) AWSIoTResourceIdentifier * _Nullable resourceIdentifier;

/**
 <p> Indicates whether a suppression should exist indefinitely or not. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable suppressIndefinitely;

@end

/**
 
 */
@interface AWSIoTUpdateAuditSuppressionResponse : AWSModel


@end

/**
 
 */
@interface AWSIoTUpdateAuthorizerRequest : AWSRequest


/**
 <p>The ARN of the authorizer's Lambda function.</p>
 */
@property (nonatomic, strong) NSString * _Nullable authorizerFunctionArn;

/**
 <p>The authorizer name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable authorizerName;

/**
 <p>When <code>true</code>, the result from the authorizer’s Lambda function is cached for the time specified in <code>refreshAfterInSeconds</code>. The cached result is used while the device reuses the same HTTP connection.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enableCachingForHttp;

/**
 <p>The status of the update authorizer request.</p>
 */
@property (nonatomic, assign) AWSIoTAuthorizerStatus status;

/**
 <p>The key used to extract the token from the HTTP headers. </p>
 */
@property (nonatomic, strong) NSString * _Nullable tokenKeyName;

/**
 <p>The public keys used to verify the token signature.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tokenSigningPublicKeys;

@end

/**
 
 */
@interface AWSIoTUpdateAuthorizerResponse : AWSModel


/**
 <p>The authorizer ARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable authorizerArn;

/**
 <p>The authorizer name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable authorizerName;

@end

/**
 
 */
@interface AWSIoTUpdateBillingGroupRequest : AWSRequest


/**
 <p>The name of the billing group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable billingGroupName;

/**
 <p>The properties of the billing group.</p>
 */
@property (nonatomic, strong) AWSIoTBillingGroupProperties * _Nullable billingGroupProperties;

/**
 <p>The expected version of the billing group. If the version of the billing group does not match the expected version specified in the request, the <code>UpdateBillingGroup</code> request is rejected with a <code>VersionConflictException</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable expectedVersion;

@end

/**
 
 */
@interface AWSIoTUpdateBillingGroupResponse : AWSModel


/**
 <p>The latest version of the billing group.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable version;

@end

/**
 <p>Parameters to define a mitigation action that changes the state of the CA certificate to inactive.</p>
 Required parameters: [action]
 */
@interface AWSIoTUpdateCACertificateParams : AWSModel


/**
 <p>The action that you want to apply to the CA certificate. The only supported value is <code>DEACTIVATE</code>.</p>
 */
@property (nonatomic, assign) AWSIoTCACertificateUpdateAction action;

@end

/**
 <p>The input to the UpdateCACertificate operation.</p>
 Required parameters: [certificateId]
 */
@interface AWSIoTUpdateCACertificateRequest : AWSRequest


/**
 <p>The CA certificate identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificateId;

/**
 <p>The new value for the auto registration status. Valid values are: "ENABLE" or "DISABLE".</p>
 */
@property (nonatomic, assign) AWSIoTAutoRegistrationStatus latestAutoRegistrationStatus;

/**
 <p>The updated status of the CA certificate.</p><p><b>Note:</b> The status value REGISTER_INACTIVE is deprecated and should not be used.</p>
 */
@property (nonatomic, assign) AWSIoTCACertificateStatus latestStatus;

/**
 <p>Information about the registration configuration.</p>
 */
@property (nonatomic, strong) AWSIoTRegistrationConfig * _Nullable registrationConfig;

/**
 <p>If true, removes auto registration.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable removeAutoRegistration;

@end

/**
 <p>The input for the UpdateCertificate operation.</p>
 Required parameters: [certificateId, newStatus]
 */
@interface AWSIoTUpdateCertificateRequest : AWSRequest


/**
 <p>The ID of the certificate. (The last part of the certificate ARN contains the certificate ID.)</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificateId;

/**
 <p>The new status.</p><p><b>Note:</b> Setting the status to PENDING_TRANSFER or PENDING_ACTIVATION will result in an exception being thrown. PENDING_TRANSFER and PENDING_ACTIVATION are statuses used internally by IoT. They are not intended for developer use.</p><p><b>Note:</b> The status value REGISTER_INACTIVE is deprecated and should not be used.</p>
 */
@property (nonatomic, assign) AWSIoTCertificateStatus latestStatus;

@end

/**
 
 */
@interface AWSIoTUpdateCustomMetricRequest : AWSRequest


/**
 <p> Field represents a friendly name in the console for the custom metric, it doesn't have to be unique. Don't use this name as the metric identifier in the device metric report. Can be updated. </p>
 */
@property (nonatomic, strong) NSString * _Nullable displayName;

/**
 <p> The name of the custom metric. Cannot be updated. </p>
 */
@property (nonatomic, strong) NSString * _Nullable metricName;

@end

/**
 
 */
@interface AWSIoTUpdateCustomMetricResponse : AWSModel


/**
 <p> The creation date of the custom metric in milliseconds since epoch. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDate;

/**
 <p> A friendly name in the console for the custom metric </p>
 */
@property (nonatomic, strong) NSString * _Nullable displayName;

/**
 <p> The time the custom metric was last modified in milliseconds since epoch. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedDate;

/**
 <p> The Amazon Resource Number (ARN) of the custom metric. </p>
 */
@property (nonatomic, strong) NSString * _Nullable metricArn;

/**
 <p> The name of the custom metric. </p>
 */
@property (nonatomic, strong) NSString * _Nullable metricName;

/**
 <p> The type of the custom metric. </p><important><p>The type <code>number</code> only takes a single metric value as an input, but while submitting the metrics value in the DeviceMetrics report, it must be passed as an array with a single value.</p></important>
 */
@property (nonatomic, assign) AWSIoTCustomMetricType metricType;

@end

/**
 <p>Parameters to define a mitigation action that changes the state of the device certificate to inactive.</p>
 Required parameters: [action]
 */
@interface AWSIoTUpdateDeviceCertificateParams : AWSModel


/**
 <p>The action that you want to apply to the device certificate. The only supported value is <code>DEACTIVATE</code>.</p>
 */
@property (nonatomic, assign) AWSIoTDeviceCertificateUpdateAction action;

@end

/**
 
 */
@interface AWSIoTUpdateDimensionRequest : AWSRequest


/**
 <p>A unique identifier for the dimension. Choose something that describes the type and value to make it easy to remember what it does.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>Specifies the value or list of values for the dimension. For <code>TOPIC_FILTER</code> dimensions, this is a pattern used to match the MQTT topic (for example, "admin/#").</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable stringValues;

@end

/**
 
 */
@interface AWSIoTUpdateDimensionResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN)of the created dimension.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The date and time, in milliseconds since epoch, when the dimension was initially created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDate;

/**
 <p>The date and time, in milliseconds since epoch, when the dimension was most recently updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedDate;

/**
 <p>A unique identifier for the dimension.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The value or list of values used to scope the dimension. For example, for topic filters, this is the pattern used to match the MQTT topic name.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable stringValues;

/**
 <p>The type of the dimension.</p>
 */
@property (nonatomic, assign) AWSIoTDimensionType types;

@end

/**
 
 */
@interface AWSIoTUpdateDomainConfigurationRequest : AWSRequest


/**
 <p>An object that specifies the authorization service for a domain.</p>
 */
@property (nonatomic, strong) AWSIoTAuthorizerConfig * _Nullable authorizerConfig;

/**
 <p>The name of the domain configuration to be updated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainConfigurationName;

/**
 <p>The status to which the domain configuration should be updated.</p>
 */
@property (nonatomic, assign) AWSIoTDomainConfigurationStatus domainConfigurationStatus;

/**
 <p>Removes the authorization configuration from a domain.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable removeAuthorizerConfig;

@end

/**
 
 */
@interface AWSIoTUpdateDomainConfigurationResponse : AWSModel


/**
 <p>The ARN of the domain configuration that was updated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainConfigurationArn;

/**
 <p>The name of the domain configuration that was updated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainConfigurationName;

@end

/**
 
 */
@interface AWSIoTUpdateDynamicThingGroupRequest : AWSRequest


/**
 <p>The expected version of the dynamic thing group to update.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable expectedVersion;

/**
 <p>The dynamic thing group index to update.</p><note><p>Currently one index is supported: <code>AWS_Things</code>.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable indexName;

/**
 <p>The dynamic thing group search query string to update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable queryString;

/**
 <p>The dynamic thing group query version to update.</p><note><p>Currently one query version is supported: "2017-09-30". If not specified, the query version defaults to this value.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable queryVersion;

/**
 <p>The name of the dynamic thing group to update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingGroupName;

/**
 <p>The dynamic thing group properties to update.</p>
 */
@property (nonatomic, strong) AWSIoTThingGroupProperties * _Nullable thingGroupProperties;

@end

/**
 
 */
@interface AWSIoTUpdateDynamicThingGroupResponse : AWSModel


/**
 <p>The dynamic thing group version.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable version;

@end

/**
 
 */
@interface AWSIoTUpdateEventConfigurationsRequest : AWSRequest


/**
 <p>The new event configuration values.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSIoTConfiguration *> * _Nullable eventConfigurations;

@end

/**
 
 */
@interface AWSIoTUpdateEventConfigurationsResponse : AWSModel


@end

/**
 
 */
@interface AWSIoTUpdateFleetMetricRequest : AWSRequest


/**
 <p>The field to aggregate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable aggregationField;

/**
 <p>The type of the aggregation query.</p>
 */
@property (nonatomic, strong) AWSIoTAggregationType * _Nullable aggregationType;

/**
 <p>The description of the fleet metric.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The expected version of the fleet metric record in the registry.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable expectedVersion;

/**
 <p>The name of the index to search.</p>
 */
@property (nonatomic, strong) NSString * _Nullable indexName;

/**
 <p>The name of the fleet metric to update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable metricName;

/**
 <p>The time in seconds between fleet metric emissions. Range [60(1 min), 86400(1 day)] and must be multiple of 60.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable period;

/**
 <p>The search query string.</p>
 */
@property (nonatomic, strong) NSString * _Nullable queryString;

/**
 <p>The version of the query.</p>
 */
@property (nonatomic, strong) NSString * _Nullable queryVersion;

/**
 <p>Used to support unit transformation such as milliseconds to seconds. The unit must be supported by <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_MetricDatum.html">CW metric</a>.</p>
 */
@property (nonatomic, assign) AWSIoTFleetMetricUnit unit;

@end

/**
 
 */
@interface AWSIoTUpdateIndexingConfigurationRequest : AWSRequest


/**
 <p>Thing group indexing configuration.</p>
 */
@property (nonatomic, strong) AWSIoTThingGroupIndexingConfiguration * _Nullable thingGroupIndexingConfiguration;

/**
 <p>Thing indexing configuration.</p>
 */
@property (nonatomic, strong) AWSIoTThingIndexingConfiguration * _Nullable thingIndexingConfiguration;

@end

/**
 
 */
@interface AWSIoTUpdateIndexingConfigurationResponse : AWSModel


@end

/**
 
 */
@interface AWSIoTUpdateJobRequest : AWSRequest


/**
 <p>Allows you to create criteria to abort a job.</p>
 */
@property (nonatomic, strong) AWSIoTAbortConfig * _Nullable abortConfig;

/**
 <p>A short text description of the job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>Allows you to create the criteria to retry a job.</p>
 */
@property (nonatomic, strong) AWSIoTJobExecutionsRetryConfig * _Nullable jobExecutionsRetryConfig;

/**
 <p>Allows you to create a staged rollout of the job.</p>
 */
@property (nonatomic, strong) AWSIoTJobExecutionsRolloutConfig * _Nullable jobExecutionsRolloutConfig;

/**
 <p>The ID of the job to be updated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

/**
 <p>The namespace used to indicate that a job is a customer-managed job.</p><p>When you specify a value for this parameter, Amazon Web Services IoT Core sends jobs notifications to MQTT topics that contain the value in the following format.</p><p><code>$aws/things/<i>THING_NAME</i>/jobs/<i>JOB_ID</i>/notify-namespace-<i>NAMESPACE_ID</i>/</code></p><note><p>The <code>namespaceId</code> feature is in public preview.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable namespaceId;

/**
 <p>Configuration information for pre-signed S3 URLs.</p>
 */
@property (nonatomic, strong) AWSIoTPresignedUrlConfig * _Nullable presignedUrlConfig;

/**
 <p>Specifies the amount of time each device has to finish its execution of the job. The timer is started when the job execution status is set to <code>IN_PROGRESS</code>. If the job execution status is not set to another terminal state before the time expires, it will be automatically set to <code>TIMED_OUT</code>. </p>
 */
@property (nonatomic, strong) AWSIoTTimeoutConfig * _Nullable timeoutConfig;

@end

/**
 
 */
@interface AWSIoTUpdateMitigationActionRequest : AWSRequest


/**
 <p>The friendly name for the mitigation action. You cannot change the name by using <code>UpdateMitigationAction</code>. Instead, you must delete and recreate the mitigation action with the new name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable actionName;

/**
 <p>Defines the type of action and the parameters for that action.</p>
 */
@property (nonatomic, strong) AWSIoTMitigationActionParams * _Nullable actionParams;

/**
 <p>The ARN of the IAM role that is used to apply the mitigation action.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

@end

/**
 
 */
@interface AWSIoTUpdateMitigationActionResponse : AWSModel


/**
 <p>The ARN for the new mitigation action.</p>
 */
@property (nonatomic, strong) NSString * _Nullable actionArn;

/**
 <p>A unique identifier for the mitigation action.</p>
 */
@property (nonatomic, strong) NSString * _Nullable actionId;

@end

/**
 
 */
@interface AWSIoTUpdateProvisioningTemplateRequest : AWSRequest


/**
 <p>The ID of the default provisioning template version.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable defaultVersionId;

/**
 <p>The description of the provisioning template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>True to enable the provisioning template, otherwise false.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

/**
 <p>Updates the pre-provisioning hook template.</p>
 */
@property (nonatomic, strong) AWSIoTProvisioningHook * _Nullable preProvisioningHook;

/**
 <p>The ARN of the role associated with the provisioning template. This IoT role grants permission to provision a device.</p>
 */
@property (nonatomic, strong) NSString * _Nullable provisioningRoleArn;

/**
 <p>Removes pre-provisioning hook template.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable removePreProvisioningHook;

/**
 <p>The name of the provisioning template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateName;

@end

/**
 
 */
@interface AWSIoTUpdateProvisioningTemplateResponse : AWSModel


@end

/**
 
 */
@interface AWSIoTUpdateRoleAliasRequest : AWSRequest


/**
 <p>The number of seconds the credential will be valid.</p><p>This value must be less than or equal to the maximum session duration of the IAM role that the role alias references.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable credentialDurationSeconds;

/**
 <p>The role alias to update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleAlias;

/**
 <p>The role ARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

@end

/**
 
 */
@interface AWSIoTUpdateRoleAliasResponse : AWSModel


/**
 <p>The role alias.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleAlias;

/**
 <p>The role alias ARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleAliasArn;

@end

/**
 
 */
@interface AWSIoTUpdateScheduledAuditRequest : AWSRequest


/**
 <p>The day of the month on which the scheduled audit takes place. This can be <code>1</code> through <code>31</code> or <code>LAST</code>. This field is required if the <code>frequency</code> parameter is set to <code>MONTHLY</code>. If days 29-31 are specified, and the month does not have that many days, the audit takes place on the "LAST" day of the month.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dayOfMonth;

/**
 <p>The day of the week on which the scheduled audit takes place. This can be one of <code>SUN</code>, <code>MON</code>, <code>TUE</code>, <code>WED</code>, <code>THU</code>, <code>FRI</code>, or <code>SAT</code>. This field is required if the "frequency" parameter is set to <code>WEEKLY</code> or <code>BIWEEKLY</code>.</p>
 */
@property (nonatomic, assign) AWSIoTDayOfWeek dayOfWeek;

/**
 <p>How often the scheduled audit takes place, either <code>DAILY</code>, <code>WEEKLY</code>, <code>BIWEEKLY</code>, or <code>MONTHLY</code>. The start time of each audit is determined by the system.</p>
 */
@property (nonatomic, assign) AWSIoTAuditFrequency frequency;

/**
 <p>The name of the scheduled audit. (Max. 128 chars)</p>
 */
@property (nonatomic, strong) NSString * _Nullable scheduledAuditName;

/**
 <p>Which checks are performed during the scheduled audit. Checks must be enabled for your account. (Use <code>DescribeAccountAuditConfiguration</code> to see the list of all checks, including those that are enabled or use <code>UpdateAccountAuditConfiguration</code> to select which checks are enabled.)</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable targetCheckNames;

@end

/**
 
 */
@interface AWSIoTUpdateScheduledAuditResponse : AWSModel


/**
 <p>The ARN of the scheduled audit.</p>
 */
@property (nonatomic, strong) NSString * _Nullable scheduledAuditArn;

@end

/**
 
 */
@interface AWSIoTUpdateSecurityProfileRequest : AWSRequest


/**
 <p><i>Please use <a>UpdateSecurityProfileRequest$additionalMetricsToRetainV2</a> instead.</i></p><p>A list of metrics whose data is retained (stored). By default, data is retained for any metric used in the profile's <code>behaviors</code>, but it is also retained for any metric specified here. Can be used with custom metrics; cannot be used with dimensions.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable additionalMetricsToRetain;

/**
 <p>A list of metrics whose data is retained (stored). By default, data is retained for any metric used in the profile's behaviors, but it is also retained for any metric specified here. Can be used with custom metrics; cannot be used with dimensions.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTMetricToRetain *> * _Nullable additionalMetricsToRetainV2;

/**
 <p>Where the alerts are sent. (Alerts are always sent to the console.)</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSIoTAlertTarget *> * _Nullable alertTargets;

/**
 <p>Specifies the behaviors that, when violated by a device (thing), cause an alert.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTBehavior *> * _Nullable behaviors;

/**
 <p>If true, delete all <code>additionalMetricsToRetain</code> defined for this security profile. If any <code>additionalMetricsToRetain</code> are defined in the current invocation, an exception occurs.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable deleteAdditionalMetricsToRetain;

/**
 <p>If true, delete all <code>alertTargets</code> defined for this security profile. If any <code>alertTargets</code> are defined in the current invocation, an exception occurs.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable deleteAlertTargets;

/**
 <p>If true, delete all <code>behaviors</code> defined for this security profile. If any <code>behaviors</code> are defined in the current invocation, an exception occurs.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable deleteBehaviors;

/**
 <p>The expected version of the security profile. A new version is generated whenever the security profile is updated. If you specify a value that is different from the actual version, a <code>VersionConflictException</code> is thrown.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable expectedVersion;

/**
 <p>A description of the security profile.</p>
 */
@property (nonatomic, strong) NSString * _Nullable securityProfileDescription;

/**
 <p>The name of the security profile you want to update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable securityProfileName;

@end

/**
 
 */
@interface AWSIoTUpdateSecurityProfileResponse : AWSModel


/**
 <p><i>Please use <a>UpdateSecurityProfileResponse$additionalMetricsToRetainV2</a> instead.</i></p><p>A list of metrics whose data is retained (stored). By default, data is retained for any metric used in the security profile's <code>behaviors</code>, but it is also retained for any metric specified here.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable additionalMetricsToRetain;

/**
 <p>A list of metrics whose data is retained (stored). By default, data is retained for any metric used in the profile's behaviors, but it is also retained for any metric specified here. Can be used with custom metrics; cannot be used with dimensions.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTMetricToRetain *> * _Nullable additionalMetricsToRetainV2;

/**
 <p>Where the alerts are sent. (Alerts are always sent to the console.)</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSIoTAlertTarget *> * _Nullable alertTargets;

/**
 <p>Specifies the behaviors that, when violated by a device (thing), cause an alert.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTBehavior *> * _Nullable behaviors;

/**
 <p>The time the security profile was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDate;

/**
 <p>The time the security profile was last modified.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedDate;

/**
 <p>The ARN of the security profile that was updated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable securityProfileArn;

/**
 <p>The description of the security profile.</p>
 */
@property (nonatomic, strong) NSString * _Nullable securityProfileDescription;

/**
 <p>The name of the security profile that was updated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable securityProfileName;

/**
 <p>The updated version of the security profile.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable version;

@end

/**
 
 */
@interface AWSIoTUpdateStreamRequest : AWSRequest


/**
 <p>The description of the stream.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The files associated with the stream.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTStreamFile *> * _Nullable files;

/**
 <p>An IAM role that allows the IoT service principal assumes to access your S3 files.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 <p>The stream ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable streamId;

@end

/**
 
 */
@interface AWSIoTUpdateStreamResponse : AWSModel


/**
 <p>A description of the stream.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The stream ARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable streamArn;

/**
 <p>The stream ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable streamId;

/**
 <p>The stream version.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable streamVersion;

@end

/**
 
 */
@interface AWSIoTUpdateThingGroupRequest : AWSRequest


/**
 <p>The expected version of the thing group. If this does not match the version of the thing group being updated, the update will fail.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable expectedVersion;

/**
 <p>The thing group to update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingGroupName;

/**
 <p>The thing group properties.</p>
 */
@property (nonatomic, strong) AWSIoTThingGroupProperties * _Nullable thingGroupProperties;

@end

/**
 
 */
@interface AWSIoTUpdateThingGroupResponse : AWSModel


/**
 <p>The version of the updated thing group.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable version;

@end

/**
 
 */
@interface AWSIoTUpdateThingGroupsForThingRequest : AWSRequest


/**
 <p>Override dynamic thing groups with static thing groups when 10-group limit is reached. If a thing belongs to 10 thing groups, and one or more of those groups are dynamic thing groups, adding a thing to a static group removes the thing from the last dynamic group.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable overrideDynamicGroups;

/**
 <p>The groups to which the thing will be added.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable thingGroupsToAdd;

/**
 <p>The groups from which the thing will be removed.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable thingGroupsToRemove;

/**
 <p>The thing whose group memberships will be updated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingName;

@end

/**
 
 */
@interface AWSIoTUpdateThingGroupsForThingResponse : AWSModel


@end

/**
 <p>The input for the UpdateThing operation.</p>
 Required parameters: [thingName]
 */
@interface AWSIoTUpdateThingRequest : AWSRequest


/**
 <p>A list of thing attributes, a JSON string containing name-value pairs. For example:</p><p><code>{\"attributes\":{\"name1\":\"value2\"}}</code></p><p>This data is used to add new attributes or update existing attributes.</p>
 */
@property (nonatomic, strong) AWSIoTAttributePayload * _Nullable attributePayload;

/**
 <p>The expected version of the thing record in the registry. If the version of the record in the registry does not match the expected version specified in the request, the <code>UpdateThing</code> request is rejected with a <code>VersionConflictException</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable expectedVersion;

/**
 <p>Remove a thing type association. If <b>true</b>, the association is removed.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable removeThingType;

/**
 <p>The name of the thing to update.</p><p>You can't change a thing's name. To change a thing's name, you must create a new thing, give it the new name, and then delete the old thing.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingName;

/**
 <p>The name of the thing type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingTypeName;

@end

/**
 <p>The output from the UpdateThing operation.</p>
 */
@interface AWSIoTUpdateThingResponse : AWSModel


@end

/**
 
 */
@interface AWSIoTUpdateTopicRuleDestinationRequest : AWSRequest


/**
 <p>The ARN of the topic rule destination.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The status of the topic rule destination. Valid values are:</p><dl><dt>IN_PROGRESS</dt><dd><p>A topic rule destination was created but has not been confirmed. You can set <code>status</code> to <code>IN_PROGRESS</code> by calling <code>UpdateTopicRuleDestination</code>. Calling <code>UpdateTopicRuleDestination</code> causes a new confirmation challenge to be sent to your confirmation endpoint.</p></dd><dt>ENABLED</dt><dd><p>Confirmation was completed, and traffic to this destination is allowed. You can set <code>status</code> to <code>DISABLED</code> by calling <code>UpdateTopicRuleDestination</code>.</p></dd><dt>DISABLED</dt><dd><p>Confirmation was completed, and traffic to this destination is not allowed. You can set <code>status</code> to <code>ENABLED</code> by calling <code>UpdateTopicRuleDestination</code>.</p></dd><dt>ERROR</dt><dd><p>Confirmation could not be completed, for example if the confirmation timed out. You can call <code>GetTopicRuleDestination</code> for details about the error. You can set <code>status</code> to <code>IN_PROGRESS</code> by calling <code>UpdateTopicRuleDestination</code>. Calling <code>UpdateTopicRuleDestination</code> causes a new confirmation challenge to be sent to your confirmation endpoint.</p></dd></dl>
 */
@property (nonatomic, assign) AWSIoTTopicRuleDestinationStatus status;

@end

/**
 
 */
@interface AWSIoTUpdateTopicRuleDestinationResponse : AWSModel


@end

/**
 
 */
@interface AWSIoTValidateSecurityProfileBehaviorsRequest : AWSRequest


/**
 <p>Specifies the behaviors that, when violated by a device (thing), cause an alert.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTBehavior *> * _Nullable behaviors;

@end

/**
 
 */
@interface AWSIoTValidateSecurityProfileBehaviorsResponse : AWSModel


/**
 <p>True if the behaviors were valid.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable valid;

/**
 <p>The list of any errors found in the behaviors.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTValidationError *> * _Nullable validationErrors;

@end

/**
 <p>Information about an error found in a behavior specification.</p>
 */
@interface AWSIoTValidationError : AWSModel


/**
 <p>The description of an error found in the behaviors.</p>
 */
@property (nonatomic, strong) NSString * _Nullable errorMessage;

@end

/**
 <p>Information about a Device Defender security profile behavior violation.</p>
 */
@interface AWSIoTViolationEvent : AWSModel


/**
 <p>The behavior that was violated.</p>
 */
@property (nonatomic, strong) AWSIoTBehavior * _Nullable behavior;

/**
 <p>The value of the metric (the measurement).</p>
 */
@property (nonatomic, strong) AWSIoTMetricValue * _Nullable metricValue;

/**
 <p>The name of the security profile whose behavior was violated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable securityProfileName;

/**
 <p>The name of the thing responsible for the violation event.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingName;

/**
 <p>The verification state of the violation (detect alarm).</p>
 */
@property (nonatomic, assign) AWSIoTVerificationState verificationState;

/**
 <p>The description of the verification state of the violation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable verificationStateDescription;

/**
 <p> The details of a violation event. </p>
 */
@property (nonatomic, strong) AWSIoTViolationEventAdditionalInfo * _Nullable violationEventAdditionalInfo;

/**
 <p>The time the violation event occurred.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable violationEventTime;

/**
 <p>The type of violation event.</p>
 */
@property (nonatomic, assign) AWSIoTViolationEventType violationEventType;

/**
 <p>The ID of the violation event.</p>
 */
@property (nonatomic, strong) NSString * _Nullable violationId;

@end

/**
 <p> The details of a violation event. </p>
 */
@interface AWSIoTViolationEventAdditionalInfo : AWSModel


/**
 <p> The sensitivity of anomalous behavior evaluation. Can be <code>Low</code>, <code>Medium</code>, or <code>High</code>. </p>
 */
@property (nonatomic, assign) AWSIoTConfidenceLevel confidenceLevel;

@end

/**
 <p> Specifies the time period of which violation events occurred between. </p>
 Required parameters: [startTime, endTime]
 */
@interface AWSIoTViolationEventOccurrenceRange : AWSModel


/**
 <p> The end date and time of a time period in which violation events occurred. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable endTime;

/**
 <p> The start date and time of a time period in which violation events occurred. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable startTime;

@end

/**
 <p>The configuration information for a virtual private cloud (VPC) destination.</p>
 Required parameters: [subnetIds, vpcId, roleArn]
 */
@interface AWSIoTVpcDestinationConfiguration : AWSModel


/**
 <p>The ARN of a role that has permission to create and attach to elastic network interfaces (ENIs).</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 <p>The security groups of the VPC destination.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable securityGroups;

/**
 <p>The subnet IDs of the VPC destination.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable subnetIds;

/**
 <p>The ID of the VPC.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vpcId;

@end

/**
 <p>The properties of a virtual private cloud (VPC) destination.</p>
 */
@interface AWSIoTVpcDestinationProperties : AWSModel


/**
 <p>The ARN of a role that has permission to create and attach to elastic network interfaces (ENIs).</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 <p>The security groups of the VPC destination.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable securityGroups;

/**
 <p>The subnet IDs of the VPC destination.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable subnetIds;

/**
 <p>The ID of the VPC.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vpcId;

@end

/**
 <p>The summary of a virtual private cloud (VPC) destination.</p>
 */
@interface AWSIoTVpcDestinationSummary : AWSModel


/**
 <p>The ARN of a role that has permission to create and attach to elastic network interfaces (ENIs).</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 <p>The security groups of the VPC destination.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable securityGroups;

/**
 <p>The subnet IDs of the VPC destination.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable subnetIds;

/**
 <p>The ID of the VPC.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vpcId;

@end

NS_ASSUME_NONNULL_END
