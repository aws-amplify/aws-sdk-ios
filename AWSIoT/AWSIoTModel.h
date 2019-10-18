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

FOUNDATION_EXPORT NSString *const AWSIoTErrorDomain;

typedef NS_ENUM(NSInteger, AWSIoTErrorType) {
    AWSIoTErrorUnknown,
    AWSIoTErrorCertificateConflict,
    AWSIoTErrorCertificateState,
    AWSIoTErrorCertificateValidation,
    AWSIoTErrorConflictingResourceUpdate,
    AWSIoTErrorDeleteConflict,
    AWSIoTErrorIndexNotReady,
    AWSIoTErrorInternal,
    AWSIoTErrorInternalFailure,
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

typedef NS_ENUM(NSInteger, AWSIoTDeviceCertificateUpdateAction) {
    AWSIoTDeviceCertificateUpdateActionUnknown,
    AWSIoTDeviceCertificateUpdateActionDeactivate,
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
@class AWSIoTAlertTarget;
@class AWSIoTAllowed;
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
@class AWSIoTAuditTaskMetadata;
@class AWSIoTAuthInfo;
@class AWSIoTAuthResult;
@class AWSIoTAuthorizerDescription;
@class AWSIoTAuthorizerSummary;
@class AWSIoTAwsJobExecutionsRolloutConfig;
@class AWSIoTBehavior;
@class AWSIoTBehaviorCriteria;
@class AWSIoTBillingGroupMetadata;
@class AWSIoTBillingGroupProperties;
@class AWSIoTCACertificate;
@class AWSIoTCACertificateDescription;
@class AWSIoTCancelAuditMitigationActionsTaskRequest;
@class AWSIoTCancelAuditMitigationActionsTaskResponse;
@class AWSIoTCancelAuditTaskRequest;
@class AWSIoTCancelAuditTaskResponse;
@class AWSIoTCancelCertificateTransferRequest;
@class AWSIoTCancelJobExecutionRequest;
@class AWSIoTCancelJobRequest;
@class AWSIoTCancelJobResponse;
@class AWSIoTCertificate;
@class AWSIoTCertificateDescription;
@class AWSIoTCertificateValidity;
@class AWSIoTClearDefaultAuthorizerRequest;
@class AWSIoTClearDefaultAuthorizerResponse;
@class AWSIoTCloudwatchAlarmAction;
@class AWSIoTCloudwatchMetricAction;
@class AWSIoTCodeSigning;
@class AWSIoTCodeSigningCertificateChain;
@class AWSIoTCodeSigningSignature;
@class AWSIoTConfiguration;
@class AWSIoTCreateAuthorizerRequest;
@class AWSIoTCreateAuthorizerResponse;
@class AWSIoTCreateBillingGroupRequest;
@class AWSIoTCreateBillingGroupResponse;
@class AWSIoTCreateCertificateFromCsrRequest;
@class AWSIoTCreateCertificateFromCsrResponse;
@class AWSIoTCreateDynamicThingGroupRequest;
@class AWSIoTCreateDynamicThingGroupResponse;
@class AWSIoTCreateJobRequest;
@class AWSIoTCreateJobResponse;
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
@class AWSIoTCreateTopicRuleRequest;
@class AWSIoTCustomCodeSigning;
@class AWSIoTDeleteAccountAuditConfigurationRequest;
@class AWSIoTDeleteAccountAuditConfigurationResponse;
@class AWSIoTDeleteAuthorizerRequest;
@class AWSIoTDeleteAuthorizerResponse;
@class AWSIoTDeleteBillingGroupRequest;
@class AWSIoTDeleteBillingGroupResponse;
@class AWSIoTDeleteCACertificateRequest;
@class AWSIoTDeleteCACertificateResponse;
@class AWSIoTDeleteCertificateRequest;
@class AWSIoTDeleteDynamicThingGroupRequest;
@class AWSIoTDeleteDynamicThingGroupResponse;
@class AWSIoTDeleteJobExecutionRequest;
@class AWSIoTDeleteJobRequest;
@class AWSIoTDeleteMitigationActionRequest;
@class AWSIoTDeleteMitigationActionResponse;
@class AWSIoTDeleteOTAUpdateRequest;
@class AWSIoTDeleteOTAUpdateResponse;
@class AWSIoTDeletePolicyRequest;
@class AWSIoTDeletePolicyVersionRequest;
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
@class AWSIoTDescribeDefaultAuthorizerRequest;
@class AWSIoTDescribeDefaultAuthorizerResponse;
@class AWSIoTDescribeEndpointRequest;
@class AWSIoTDescribeEndpointResponse;
@class AWSIoTDescribeEventConfigurationsRequest;
@class AWSIoTDescribeEventConfigurationsResponse;
@class AWSIoTDescribeIndexRequest;
@class AWSIoTDescribeIndexResponse;
@class AWSIoTDescribeJobExecutionRequest;
@class AWSIoTDescribeJobExecutionResponse;
@class AWSIoTDescribeJobRequest;
@class AWSIoTDescribeJobResponse;
@class AWSIoTDescribeMitigationActionRequest;
@class AWSIoTDescribeMitigationActionResponse;
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
@class AWSIoTDisableTopicRuleRequest;
@class AWSIoTDynamoDBAction;
@class AWSIoTDynamoDBv2Action;
@class AWSIoTEffectivePolicy;
@class AWSIoTElasticsearchAction;
@class AWSIoTEnableIoTLoggingParams;
@class AWSIoTEnableTopicRuleRequest;
@class AWSIoTErrorInfo;
@class AWSIoTExplicitDeny;
@class AWSIoTExponentialRolloutRate;
@class AWSIoTFileLocation;
@class AWSIoTFirehoseAction;
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
@class AWSIoTGetPolicyRequest;
@class AWSIoTGetPolicyResponse;
@class AWSIoTGetPolicyVersionRequest;
@class AWSIoTGetPolicyVersionResponse;
@class AWSIoTGetRegistrationCodeRequest;
@class AWSIoTGetRegistrationCodeResponse;
@class AWSIoTGetStatisticsRequest;
@class AWSIoTGetStatisticsResponse;
@class AWSIoTGetTopicRuleRequest;
@class AWSIoTGetTopicRuleResponse;
@class AWSIoTGetV2LoggingOptionsRequest;
@class AWSIoTGetV2LoggingOptionsResponse;
@class AWSIoTGroupNameAndArn;
@class AWSIoTImplicitDeny;
@class AWSIoTIotAnalyticsAction;
@class AWSIoTIotEventsAction;
@class AWSIoTJob;
@class AWSIoTJobExecution;
@class AWSIoTJobExecutionStatusDetails;
@class AWSIoTJobExecutionSummary;
@class AWSIoTJobExecutionSummaryForJob;
@class AWSIoTJobExecutionSummaryForThing;
@class AWSIoTJobExecutionsRolloutConfig;
@class AWSIoTJobProcessDetails;
@class AWSIoTJobSummary;
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
@class AWSIoTListIndicesRequest;
@class AWSIoTListIndicesResponse;
@class AWSIoTListJobExecutionsForJobRequest;
@class AWSIoTListJobExecutionsForJobResponse;
@class AWSIoTListJobExecutionsForThingRequest;
@class AWSIoTListJobExecutionsForThingResponse;
@class AWSIoTListJobsRequest;
@class AWSIoTListJobsResponse;
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
@class AWSIoTListTopicRulesRequest;
@class AWSIoTListTopicRulesResponse;
@class AWSIoTListV2LoggingLevelsRequest;
@class AWSIoTListV2LoggingLevelsResponse;
@class AWSIoTListViolationEventsRequest;
@class AWSIoTListViolationEventsResponse;
@class AWSIoTLogTarget;
@class AWSIoTLogTargetConfiguration;
@class AWSIoTLoggingOptionsPayload;
@class AWSIoTMetricValue;
@class AWSIoTMitigationAction;
@class AWSIoTMitigationActionIdentifier;
@class AWSIoTMitigationActionParams;
@class AWSIoTNonCompliantResource;
@class AWSIoTOTAUpdateFile;
@class AWSIoTOTAUpdateInfo;
@class AWSIoTOTAUpdateSummary;
@class AWSIoTOutgoingCertificate;
@class AWSIoTPolicy;
@class AWSIoTPolicyVersion;
@class AWSIoTPolicyVersionIdentifier;
@class AWSIoTPresignedUrlConfig;
@class AWSIoTPublishFindingToSnsParams;
@class AWSIoTPutItemInput;
@class AWSIoTRateIncreaseCriteria;
@class AWSIoTRegisterCACertificateRequest;
@class AWSIoTRegisterCACertificateResponse;
@class AWSIoTRegisterCertificateRequest;
@class AWSIoTRegisterCertificateResponse;
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
@class AWSIoTSetDefaultAuthorizerRequest;
@class AWSIoTSetDefaultAuthorizerResponse;
@class AWSIoTSetDefaultPolicyVersionRequest;
@class AWSIoTSetLoggingOptionsRequest;
@class AWSIoTSetV2LoggingLevelRequest;
@class AWSIoTSetV2LoggingOptionsRequest;
@class AWSIoTSigningProfileParameter;
@class AWSIoTSnsAction;
@class AWSIoTSqsAction;
@class AWSIoTStartAuditMitigationActionsTaskRequest;
@class AWSIoTStartAuditMitigationActionsTaskResponse;
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
@class AWSIoTTopicRule;
@class AWSIoTTopicRuleListItem;
@class AWSIoTTopicRulePayload;
@class AWSIoTTransferCertificateRequest;
@class AWSIoTTransferCertificateResponse;
@class AWSIoTTransferData;
@class AWSIoTUntagResourceRequest;
@class AWSIoTUntagResourceResponse;
@class AWSIoTUpdateAccountAuditConfigurationRequest;
@class AWSIoTUpdateAccountAuditConfigurationResponse;
@class AWSIoTUpdateAuthorizerRequest;
@class AWSIoTUpdateAuthorizerResponse;
@class AWSIoTUpdateBillingGroupRequest;
@class AWSIoTUpdateBillingGroupResponse;
@class AWSIoTUpdateCACertificateParams;
@class AWSIoTUpdateCACertificateRequest;
@class AWSIoTUpdateCertificateRequest;
@class AWSIoTUpdateDeviceCertificateParams;
@class AWSIoTUpdateDynamicThingGroupRequest;
@class AWSIoTUpdateDynamicThingGroupResponse;
@class AWSIoTUpdateEventConfigurationsRequest;
@class AWSIoTUpdateEventConfigurationsResponse;
@class AWSIoTUpdateIndexingConfigurationRequest;
@class AWSIoTUpdateIndexingConfigurationResponse;
@class AWSIoTUpdateJobRequest;
@class AWSIoTUpdateMitigationActionRequest;
@class AWSIoTUpdateMitigationActionResponse;
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
@class AWSIoTValidateSecurityProfileBehaviorsRequest;
@class AWSIoTValidateSecurityProfileBehaviorsResponse;
@class AWSIoTValidationError;
@class AWSIoTViolationEvent;

/**
 <p>Details of abort criteria to abort the job.</p>
 Required parameters: [criteriaList]
 */
@interface AWSIoTAbortConfig : AWSModel


/**
 <p>The list of abort criteria to define rules to abort the job.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTAbortCriteria *> * _Nullable criteriaList;

@end

/**
 <p>Details of abort criteria to define rules to abort the job.</p>
 Required parameters: [failureType, action, thresholdPercentage, minNumberOfExecutedThings]
 */
@interface AWSIoTAbortCriteria : AWSModel


/**
 <p>The type of abort action to initiate a job abort.</p>
 */
@property (nonatomic, assign) AWSIoTAbortAction action;

/**
 <p>The type of job execution failure to define a rule to initiate a job abort.</p>
 */
@property (nonatomic, assign) AWSIoTJobExecutionFailureType failureType;

/**
 <p>Minimum number of executed things before evaluating an abort rule.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable minNumberOfExecutedThings;

/**
 <p>The threshold as a percentage of the total number of executed things that will initiate a job abort.</p><p>AWS IoT supports up to two digits after the decimal (for example, 10.9 and 10.99, but not 10.999).</p>
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
 <p>Write data to an Amazon Elasticsearch Service domain.</p>
 */
@property (nonatomic, strong) AWSIoTElasticsearchAction * _Nullable elasticsearch;

/**
 <p>Write to an Amazon Kinesis Firehose stream.</p>
 */
@property (nonatomic, strong) AWSIoTFirehoseAction * _Nullable firehose;

/**
 <p>Sends message data to an AWS IoT Analytics channel.</p>
 */
@property (nonatomic, strong) AWSIoTIotAnalyticsAction * _Nullable iotAnalytics;

/**
 <p>Sends an input to an AWS IoT Events detector.</p>
 */
@property (nonatomic, strong) AWSIoTIotEventsAction * _Nullable iotEvents;

/**
 <p>Write data to an Amazon Kinesis stream.</p>
 */
@property (nonatomic, strong) AWSIoTKinesisAction * _Nullable kinesis;

/**
 <p>Invoke a Lambda function.</p>
 */
@property (nonatomic, strong) AWSIoTLambdaAction * _Nullable lambda;

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

@end

/**
 <p>Information about an active Device Defender security profile behavior violation.</p>
 */
@interface AWSIoTActiveViolation : AWSModel


/**
 <p>The behavior which is being violated.</p>
 */
@property (nonatomic, strong) AWSIoTBehavior * _Nullable behavior;

/**
 <p>The time the most recent violation occurred.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastViolationTime;

/**
 <p>The value of the metric (the measurement) which caused the most recent violation.</p>
 */
@property (nonatomic, strong) AWSIoTMetricValue * _Nullable lastViolationValue;

/**
 <p>The security profile whose behavior is in violation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable securityProfileName;

/**
 <p>The name of the thing responsible for the active violation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingName;

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
 <p>The name of the billing group.</p>
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
 <p>Specifies if this mitigation action can move the things that triggered the mitigation action even if they are part of one or more dynamic things groups.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable overrideDynamicGroups;

/**
 <p>The list of groups to which you want to add the things that triggered the mitigation action. You can add a thing to a maximum of 10 groups, but you cannot add a thing to more than one group in the same hierarchy.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable thingGroupNames;

@end

/**
 <p>A structure containing the alert target ARN and the role ARN.</p>
 Required parameters: [alertTargetArn, roleArn]
 */
@interface AWSIoTAlertTarget : AWSModel


/**
 <p>The ARN of the notification target to which alerts are sent.</p>
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
 <p>The <a href="https://docs.aws.amazon.com/iot/latest/developerguide/iot-security-identity.html">identity</a> to which the policy is attached.</p>
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
 <p>The principal, such as a certificate or other credential.</p>
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
 <p>The UNIX timestamp of when the authorizer was last updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedDate;

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
 <p>Configuration for the rollout of OTA updates.</p>
 */
@interface AWSIoTAwsJobExecutionsRolloutConfig : AWSModel


/**
 <p>The maximum number of OTA update job executions started per minute.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maximumPerMinute;

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
 <p>The name you have given to the behavior.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 <p>The criteria by which the behavior is determined to be normal.</p>
 */
@interface AWSIoTBehaviorCriteria : AWSModel


/**
 <p>The operator that relates the thing measured (<code>metric</code>) to the criteria (containing a <code>value</code> or <code>statisticalThreshold</code>).</p>
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
 <p>Use this to specify the time duration over which the behavior is evaluated, for those criteria which have a time dimension (for example, <code>NUM_MESSAGES_SENT</code>). For a <code>statisticalThreshhold</code> metric comparison, measurements from all devices are accumulated over this time duration before being used to calculate percentiles, and later, measurements from an individual device are also accumulated over this time duration before being given a percentile rank.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable durationSeconds;

/**
 <p>A statistical ranking (percentile) which indicates a threshold value by which a behavior is determined to be in compliance or in violation of the behavior.</p>
 */
@property (nonatomic, strong) AWSIoTStatisticalThreshold * _Nullable statisticalThreshold;

/**
 <p>The value to be compared with the <code>metric</code>.</p>
 */
@property (nonatomic, strong) AWSIoTMetricValue * _Nullable value;

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
 <p>The ID of the AWS account that owns the certificate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ownedBy;

/**
 <p>The ID of the AWS account of the previous owner of the certificate.</p>
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
 <p>The ID of the AWSSignerJob which was created to sign the file.</p>
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
 <p>The status of the create authorizer request.</p>
 */
@property (nonatomic, assign) AWSIoTAuthorizerStatus status;

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
@interface AWSIoTCreateDynamicThingGroupRequest : AWSRequest


/**
 <p>The dynamic thing group index name.</p><note><p>Currently one index is supported: "AWS_Things".</p></note>
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
@interface AWSIoTCreateJobRequest : AWSRequest


/**
 <p>Allows you to create criteria to abort a job.</p>
 */
@property (nonatomic, strong) AWSIoTAbortConfig * _Nullable abortConfig;

/**
 <p>A short text description of the job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The job document.</p><note><p>If the job document resides in an S3 bucket, you must use a placeholder link when specifying the document.</p><p>The placeholder link is of the following form:</p><p><code>${aws:iot:s3-presigned-url:https://s3.amazonaws.com/<i>bucket</i>/<i>key</i>}</code></p><p>where <i>bucket</i> is your bucket name and <i>key</i> is the object in the bucket to which you are linking.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable document;

/**
 <p>An S3 link to the job document.</p>
 */
@property (nonatomic, strong) NSString * _Nullable documentSource;

/**
 <p>Allows you to create a staged rollout of the job.</p>
 */
@property (nonatomic, strong) AWSIoTJobExecutionsRolloutConfig * _Nullable jobExecutionsRolloutConfig;

/**
 <p>A job identifier which must be unique for your AWS account. We recommend using a UUID. Alpha-numeric characters, "-" and "_" are valid for use here.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

/**
 <p>Configuration information for pre-signed S3 URLs.</p>
 */
@property (nonatomic, strong) AWSIoTPresignedUrlConfig * _Nullable presignedUrlConfig;

/**
 <p>Metadata which can be used to manage the job.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTTag *> * _Nullable tags;

/**
 <p>Specifies whether the job will continue to run (CONTINUOUS), or will be complete after all those things specified as targets have completed the job (SNAPSHOT). If continuous, the job may also be run on a thing when a change is detected in a target. For example, a job will run on a thing when the thing is added to a target group, even after the job was completed by all things originally in the group.</p>
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
 <p>The input for the CreateKeysAndCertificate operation.</p>
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
 <p>The ID of the certificate. AWS IoT issues a default subject name for the certificate (for example, AWS IoT Certificate).</p>
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
 <p>Configuration for the rollout of OTA updates.</p>
 */
@property (nonatomic, strong) AWSIoTAwsJobExecutionsRolloutConfig * _Nullable awsJobExecutionsRolloutConfig;

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
 <p>The IAM role that allows access to the AWS IoT Jobs service.</p>
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
 <p>The targeted devices to receive OTA updates.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable targets;

@end

/**
 
 */
@interface AWSIoTCreateOTAUpdateResponse : AWSModel


/**
 <p>The AWS IoT job ARN associated with the OTA update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable awsIotJobArn;

/**
 <p>The AWS IoT job ID associated with the OTA update.</p>
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
@interface AWSIoTCreateRoleAliasRequest : AWSRequest


/**
 <p>How long (in seconds) the credentials will be valid.</p>
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
 <p>The day of the month on which the scheduled audit takes place. Can be "1" through "31" or "LAST". This field is required if the "frequency" parameter is set to "MONTHLY". If days 29-31 are specified, and the month does not have that many days, the audit takes place on the "LAST" day of the month.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dayOfMonth;

/**
 <p>The day of the week on which the scheduled audit takes place. Can be one of "SUN", "MON", "TUE", "WED", "THU", "FRI", or "SAT". This field is required if the "frequency" parameter is set to "WEEKLY" or "BIWEEKLY".</p>
 */
@property (nonatomic, assign) AWSIoTDayOfWeek dayOfWeek;

/**
 <p>How often the scheduled audit takes place. Can be one of "DAILY", "WEEKLY", "BIWEEKLY" or "MONTHLY". The start time of each audit is determined by the system.</p>
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
 <p>A list of metrics whose data is retained (stored). By default, data is retained for any metric used in the profile's <code>behaviors</code>, but it is also retained for any metric specified here.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable additionalMetricsToRetain;

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
 <p>An IAM role that allows the IoT service principal assumes to access your S3 files.</p>
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
 <p>The name of the thing to create.</p>
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
 <p>The hash algorithm used to code sign the file.</p>
 */
@property (nonatomic, strong) NSString * _Nullable hashAlgorithm;

/**
 <p>The signature for the file.</p>
 */
@property (nonatomic, strong) AWSIoTCodeSigningSignature * _Nullable signature;

/**
 <p>The signature algorithm used to code sign the file.</p>
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
 <p>Specifies if the stream associated with an OTA update should be deleted when the OTA update is deleted.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable deleteStream;

/**
 <p>Specifies if the AWS Job associated with the OTA update should be deleted with the OTA update is deleted.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable forceDeleteAWSJob;

/**
 <p>The OTA update ID to delete.</p>
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
 <p>The ARN of the role that grants permission to AWS IoT to access information about your devices, policies, certificates, and other items as required when performing an audit.</p><p>On the first call to <code>UpdateAccountAuditConfiguration</code>, this parameter is required.</p>
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
 <p>The input for the DescribeEndpoint operation.</p>
 */
@interface AWSIoTDescribeEndpointRequest : AWSRequest


/**
 <p>The endpoint type. Valid endpoint types include:</p><ul><li><p><code>iot:Data</code> - Returns a VeriSign signed data endpoint.</p></li></ul><ul><li><p><code>iot:Data-ATS</code> - Returns an ATS signed data endpoint.</p></li></ul><ul><li><p><code>iot:CredentialProvider</code> - Returns an AWS IoT credentials provider API endpoint.</p></li></ul><ul><li><p><code>iot:Jobs</code> - Returns an AWS IoT device management Jobs API endpoint.</p></li></ul>
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
 <p>Contains a value that specifies the type of indexing performed. Valid values are:</p><ul><li><p>REGISTRY – Your thing index contains only registry data.</p></li><li><p>REGISTRY_AND_SHADOW - Your thing index contains registry data and shadow data.</p></li><li><p>REGISTRY_AND_CONNECTIVITY_STATUS - Your thing index contains registry data and thing connectivity status data.</p></li><li><p>REGISTRY_AND_SHADOW_AND_CONNECTIVITY_STATUS - Your thing index contains registry data, shadow data, and thing connectivity status data.</p></li></ul>
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
 <p>The date and time when the mitigation action was added to your AWS account.</p>
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
 <p>The day of the month on which the scheduled audit takes place. Will be "1" through "31" or "LAST". If days 29-31 are specified, and the month does not have that many days, the audit takes place on the "LAST" day of the month.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dayOfMonth;

/**
 <p>The day of the week on which the scheduled audit takes place. One of "SUN", "MON", "TUE", "WED", "THU", "FRI", or "SAT".</p>
 */
@property (nonatomic, assign) AWSIoTDayOfWeek dayOfWeek;

/**
 <p>How often the scheduled audit takes place. One of "DAILY", "WEEKLY", "BIWEEKLY", or "MONTHLY". The start time of each audit is determined by the system.</p>
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
 <p>A list of metrics whose data is retained (stored). By default, data is retained for any metric used in the profile's <code>behaviors</code>, but it is also retained for any metric specified here.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable additionalMetricsToRetain;

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
 <p>The default client ID.</p>
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
 <p>The principal.</p><p>If the principal is a certificate, specify the certificate ARN. If the principal is an Amazon Cognito identity, specify the identity ID.</p>
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
 <p>Describes an action that writes data to an Amazon Elasticsearch Service domain.</p>
 Required parameters: [roleArn, endpoint, index, type, id]
 */
@interface AWSIoTElasticsearchAction : AWSModel


/**
 <p>The endpoint of your Elasticsearch domain.</p>
 */
@property (nonatomic, strong) NSString * _Nullable endpoint;

/**
 <p>The unique identifier for the document you are storing.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The Elasticsearch index where you want to store your data.</p>
 */
@property (nonatomic, strong) NSString * _Nullable index;

/**
 <p>The IAM role ARN that has access to Elasticsearch.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 <p>The type of document you are storing.</p>
 */
@property (nonatomic, strong) NSString * _Nullable types;

@end

/**
 <p>Parameters used when defining a mitigation action that enable AWS IoT logging.</p>
 Required parameters: [roleArnForLogging, logLevel]
 */
@interface AWSIoTEnableIoTLoggingParams : AWSModel


/**
 <p>Specifies the types of information to be logged.</p>
 */
@property (nonatomic, assign) AWSIoTLogLevel logLevel;

/**
 <p>The ARN of the IAM role used for logging.</p>
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
 <p>The exponential factor to increase the rate of rollout for a job.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable incrementFactor;

/**
 <p>The criteria to initiate the increase in rate of rollout for a job.</p><p>AWS IoT supports up to one digit after the decimal (for example, 1.5, but not 1.55).</p>
 */
@property (nonatomic, strong) AWSIoTRateIncreaseCriteria * _Nullable rateIncreaseCriteria;

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
 
 */
@interface AWSIoTGetEffectivePoliciesRequest : AWSRequest


/**
 <p>The Cognito identity pool ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable cognitoIdentityPoolId;

/**
 <p>The principal.</p>
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
 <p>The date the policy version was created.</p>
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
 <p>The date the policy version was last modified.</p>
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
 <p>The aggregation field name. Currently not supported.</p>
 */
@property (nonatomic, strong) NSString * _Nullable aggregationField;

/**
 <p>The name of the index to search. The default value is <code>AWS_Things</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable indexName;

/**
 <p>The query used to search. You can specify "*" for the query string to get the count of all indexed things in your AWS account.</p>
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
 <p>The IAM role ARN AWS IoT uses to write to your CloudWatch logs.</p>
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
 <p>Information that implicitly denies authorization. When policy doesn't explicitly deny or allow an action on a resource it is considered an implicit deny.</p>
 */
@interface AWSIoTImplicitDeny : AWSModel


/**
 <p>Policies that don't contain a matching allow or deny statement for the specified action on the specified resource. </p>
 */
@property (nonatomic, strong) NSArray<AWSIoTPolicy *> * _Nullable policies;

@end

/**
 <p>Sends message data to an AWS IoT Analytics channel.</p>
 */
@interface AWSIoTIotAnalyticsAction : AWSModel


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
 <p>Sends an input to an AWS IoT Events detector.</p>
 Required parameters: [inputName, roleArn]
 */
@interface AWSIoTIotEventsAction : AWSModel


/**
 <p>The name of the AWS IoT Events input.</p>
 */
@property (nonatomic, strong) NSString * _Nullable inputName;

/**
 <p>[Optional] Use this to ensure that only one input (message) with a given messageId will be processed by an AWS IoT Events detector.</p>
 */
@property (nonatomic, strong) NSString * _Nullable messageId;

/**
 <p>The ARN of the role that grants AWS IoT permission to send an input to an AWS IoT Events detector. ("Action":"iotevents:BatchPutMessage").</p>
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
 <p>Will be <code>true</code> if the job was canceled with the optional <code>force</code> parameter set to <code>true</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable forceCanceled;

/**
 <p>An ARN identifying the job with format "arn:aws:iot:region:account:job/jobId".</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobArn;

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
 <p>The time, in seconds since the epoch, when the job was last updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdatedAt;

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
 <p>Specifies whether the job will continue to run (CONTINUOUS), or will be complete after all those things specified as targets have completed the job (SNAPSHOT). If continuous, the job may also be run on a thing when a change is detected in a target. For example, a job will run on a device when the thing representing the device is added to a target group, even after the job was completed by all things originally in the group. </p>
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
 <p>Specifies whether the job will continue to run (CONTINUOUS), or will be complete after all those things specified as targets have completed the job (SNAPSHOT). If continuous, the job may also be run on a thing when a change is detected in a target. For example, a job will run on a thing when the thing is added to a target group, even after the job was completed by all things originally in the group.</p>
 */
@property (nonatomic, assign) AWSIoTTargetSelection targetSelection;

/**
 <p>The ID of the thing group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingGroupId;

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
 <p>The group or principal for which the policies will be listed.</p>
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
 <p>The beginning of the time period. Audit information is retained for a limited time (180 days). Requesting a start time prior to what is retained results in an "InvalidRequestException".</p>
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
 <p>The token to retrieve the next set of results.</p>
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
 <p>The token used to get the next set of results, or <b>null</b> if there are no additional results.</p>
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

@end

/**
 <p>The output from the ListCACertificates operation.</p>
 */
@interface AWSIoTListCACertificatesResponse : AWSModel


/**
 <p>The CA certificates registered in your AWS account.</p>
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
@interface AWSIoTListIndicesRequest : AWSRequest


/**
 <p>The maximum number of results to return at one time.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token used to get the next set of results, or null if there are no additional results.</p>
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
 <p>The token used to get the next set of results, or null if there are no additional results.</p>
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
 <p>The maximum number of results to be returned per request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

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
@interface AWSIoTListJobsRequest : AWSRequest


/**
 <p>The maximum number of results to return per request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token to retrieve the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>An optional filter that lets you search for jobs that have the specified status.</p>
 */
@property (nonatomic, assign) AWSIoTJobStatus status;

/**
 <p>Specifies whether the job will continue to run (CONTINUOUS), or will be complete after all those things specified as targets have completed the job (SNAPSHOT). If continuous, the job may also be run on a thing when a change is detected in a target. For example, a job will run on a thing when the thing is added to a target group, even after the job was completed by all things originally in the group. </p>
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
 <p>The principal.</p>
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
 <p>The token to retrieve the next set of results.</p>
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
 <p>The token used to get the next set of results, or <b>null</b> if there are no additional results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The things.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable things;

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
 <p>The maximum number of results to return at one time.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

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
 <p>The token to retrieve the next set of results.</p>
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
 <p>The token used to get the next set of results, or <b>null</b> if there are no additional results.</p>
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
 <p>The token to retrieve the next set of results.</p>
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
 <p>The token used to get the next set of results, or <b>null</b> if there are no additional results.</p>
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
 <p>The token to retrieve the next set of results.</p>
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
 <p>The token used to get the next set of results, or <b>null</b> if there are no additional results.</p>
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
 <p>The name of the thing.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingName;

@end

/**
 <p>The output from the ListThingPrincipals operation.</p>
 */
@interface AWSIoTListThingPrincipalsResponse : AWSModel


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
 <p>The token to retrieve the next set of results.</p>
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
 <p>The token used to get the next set of results, or <b>null</b> if there are no additional results.</p>
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
 <p>The token to retrieve the next set of results.</p>
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
 <p>The token used to get the next set of results, or <b>null</b> if there are no additional results.</p>
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
 <p>The token to retrieve the next set of results.</p>
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
 <p>The token for the next set of results, or <b>null</b> if there are no additional results.</p>
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
 <p>The token to retrieve the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSIoTListThingsInBillingGroupResponse : AWSModel


/**
 <p>The token used to get the next set of results, or <b>null</b> if there are no additional results.</p>
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
 <p>The token to retrieve the next set of results.</p>
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
 <p>The token used to get the next set of results, or <b>null</b> if there are no additional results.</p>
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
 <p>The token to retrieve the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The name of the thing type used to search for things.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingTypeName;

@end

/**
 <p>The output from the ListThings operation.</p>
 */
@interface AWSIoTListThingsResponse : AWSModel


/**
 <p>The token used to get the next set of results, or <b>null</b> if there are no additional results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The things.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTThingAttribute *> * _Nullable things;

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
 <p>A token used to retrieve the next value.</p>
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
 <p>A token used to retrieve the next value.</p>
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
 <p>The token used to get the next set of results, or <b>null</b> if there are no additional results.</p>
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
 <p>The token used to get the next set of results, or <b>null</b> if there are no additional results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSIoTListViolationEventsRequest : AWSRequest


/**
 <p>The end time for the alerts to be listed.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable endTime;

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
 <p>If the <code>comparisonOperator</code> calls for a set of ports, use this to specify that set to be compared with the <code>metric</code>.</p>
 */
@property (nonatomic, strong) NSArray<NSNumber *> * _Nullable ports;

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
 <p>Parameters to define a mitigation action that enables AWS IoT logging at a specified level of detail.</p>
 */
@property (nonatomic, strong) AWSIoTEnableIoTLoggingParams * _Nullable enableIoTLoggingParams;

/**
 <p>Parameters to define a mitigation action that publishes findings to Amazon SNS. You can implement your own custom actions in response to the Amazon SNS messages.</p>
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
 <p>The AWS IoT job ARN associated with the OTA update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable awsIotJobArn;

/**
 <p>The AWS IoT job ID associated with the OTA update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable awsIotJobId;

/**
 <p>Configuration for the rollout of OTA updates.</p>
 */
@property (nonatomic, strong) AWSIoTAwsJobExecutionsRolloutConfig * _Nullable awsJobExecutionsRolloutConfig;

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
 <p>The AWS account to which the transfer was made.</p>
 */
@property (nonatomic, strong) NSString * _Nullable transferredTo;

@end

/**
 <p>Describes an AWS IoT policy.</p>
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
 <p>The ARN of an IAM role that grants grants permission to download files from the S3 bucket where the job data/updates are stored. The role must also grant permission for IoT to download the files.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

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
 Required parameters: [caCertificate, verificationCertificate]
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
 <p>Information about the registration configuration.</p>
 */
@property (nonatomic, strong) AWSIoTRegistrationConfig * _Nullable registrationConfig;

/**
 <p>A boolean value that specifies if the CA certificate is set to active.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable setAsActive;

/**
 <p>The private key verification certificate.</p>
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
 <p>A boolean value that specifies if the certificate is set to active.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable setAsActive;

/**
 <p>The status of the register certificate request.</p>
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
@interface AWSIoTRegisterThingRequest : AWSRequest


/**
 <p>The parameters for provisioning a thing. See <a href="https://docs.aws.amazon.com/iot/latest/developerguide/programmatic-provisioning.html">Programmatic Provisioning</a> for more information.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable parameters;

/**
 <p>The provisioning template. See <a href="https://docs.aws.amazon.com/iot/latest/developerguide/programmatic-provisioning.html">Programmatic Provisioning</a> for more information.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateBody;

@end

/**
 
 */
@interface AWSIoTRegisterThingResponse : AWSModel


/**
 <p>.</p>
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
 <p>The Quality of Service (QoS) level to use when republishing messages.</p>
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
 <p>The version of the policy associated with the resource.</p>
 */
@property (nonatomic, strong) AWSIoTPolicyVersionIdentifier * _Nullable policyVersionIdentifier;

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
 <p>The object key.</p>
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
 <p>The token used to get the next set of results, or null if there are no additional results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

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
@interface AWSIoTSearchIndexResponse : AWSModel


/**
 <p>The token used to get the next set of results, or null if there are no additional results.</p>
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
 <p>The name you have given to the security profile.</p>
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
 <p>For an audit check, specifies which mitigation actions to apply. Those actions must be defined in your AWS account.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSArray<NSString *> *> * _Nullable auditCheckToActionsMapping;

/**
 <p>Each audit mitigation task must have a unique client request token. If you try to start a new task with the same token as a task that already exists, an exception occurs. If you omit this value, a unique client request token is generated automatically.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientRequestToken;

/**
 <p>Specifies the audit findings to which the mitigation actions are applied. You can apply them to a type of audit check, to all findings from an audit, or to a speecific set of findings.</p>
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
 <p>A statistical ranking (percentile) which indicates a threshold value by which a behavior is determined to be in compliance or in violation of the behavior.</p>
 */
@interface AWSIoTStatisticalThreshold : AWSModel


/**
 <p>The percentile which resolves to a threshold value by which compliance with a behavior is determined. Metrics are collected over the specified period (<code>durationSeconds</code>) from all reporting devices in your account and statistical ranks are calculated. Then, the measurements from a device are collected over the same period. If the accumulated measurements from the device fall above or below (<code>comparisonOperator</code>) the value associated with the percentile specified, then the device is considered to be in compliance with the behavior, otherwise a violation occurs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable statistic;

@end

/**
 <p>A map of key-value pairs for all supported statistics. Currently, only count is supported.</p>
 */
@interface AWSIoTStatistics : AWSModel


/**
 <p>The count of things that match the query.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable count;

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
 <p>An IAM role AWS IoT assumes to access your S3 files.</p>
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
 <p>The principal.</p>
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
 <p>The token returned by your custom authentication service.</p>
 */
@property (nonatomic, strong) NSString * _Nullable token;

/**
 <p>The signature made with the token and your custom authentication service's private key.</p>
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
 <p>True if the thing is connected to the AWS IoT service; false if it is not connected.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable connected;

/**
 <p>The epoch time (in milliseconds) when the thing last connected or disconnected. If the thing has been disconnected for more than a few weeks, the time value might be missing.</p>
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
 <p>Indicates whether the thing is connected to the AWS IoT service.</p>
 */
@property (nonatomic, strong) AWSIoTThingConnectivity * _Nullable connectivity;

/**
 <p>The shadow.</p>
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
 <p>Thing connectivity indexing mode. Valid values are: </p><ul><li><p>STATUS – Your thing index contains connectivity status. To enable thing connectivity indexing, thingIndexMode must not be set to OFF.</p></li><li><p>OFF - Thing connectivity status indexing is disabled.</p></li></ul>
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
 <p>The SQL statement used to query the topic. For more information, see <a href="https://docs.aws.amazon.com/iot/latest/developerguide/iot-rules.html#aws-iot-sql-reference">AWS IoT SQL Reference</a> in the <i>AWS IoT Developer Guide</i>.</p>
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
 <p>The AWS account.</p>
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
 <p>Data used to transfer a certificate to an AWS account.</p>
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
 <p>Specifies which audit checks are enabled and disabled for this account. Use <code>DescribeAccountAuditConfiguration</code> to see the list of all checks, including those that are currently enabled.</p><p>Some data collection might start immediately when certain checks are enabled. When a check is disabled, any data collected so far in relation to the check is deleted.</p><p>You cannot disable a check if it is used by any scheduled audit. You must first delete the check from the scheduled audit or delete the scheduled audit itself.</p><p>On the first call to <code>UpdateAccountAuditConfiguration</code>, this parameter is required and must specify at least one enabled check.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSIoTAuditCheckConfiguration *> * _Nullable auditCheckConfigurations;

/**
 <p>Information about the targets to which audit notifications are sent.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSIoTAuditNotificationTarget *> * _Nullable auditNotificationTargetConfigurations;

/**
 <p>The ARN of the role that grants permission to AWS IoT to access information about your devices, policies, certificates and other items as required when performing an audit.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

@end

/**
 
 */
@interface AWSIoTUpdateAccountAuditConfigurationResponse : AWSModel


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
 <p>The action that you want to apply to the CA cerrtificate. The only supported value is <code>DEACTIVATE</code>.</p>
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
 <p>The new status.</p><p><b>Note:</b> Setting the status to PENDING_TRANSFER will result in an exception being thrown. PENDING_TRANSFER is a status used internally by AWS IoT. It is not intended for developer use.</p><p><b>Note:</b> The status value REGISTER_INACTIVE is deprecated and should not be used.</p>
 */
@property (nonatomic, assign) AWSIoTCertificateStatus latestStatus;

@end

/**
 <p>Parameters to define a mitigation action that changes the state of the device certificate to inactive.</p>
 Required parameters: [action]
 */
@interface AWSIoTUpdateDeviceCertificateParams : AWSModel


/**
 <p>The action that you want to apply to the device cerrtificate. The only supported value is <code>DEACTIVATE</code>.</p>
 */
@property (nonatomic, assign) AWSIoTDeviceCertificateUpdateAction action;

@end

/**
 
 */
@interface AWSIoTUpdateDynamicThingGroupRequest : AWSRequest


/**
 <p>The expected version of the dynamic thing group to update.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable expectedVersion;

/**
 <p>The dynamic thing group index to update.</p><note><p>Currently one index is supported: 'AWS_Things'.</p></note>
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
 <p>Allows you to create a staged rollout of the job.</p>
 */
@property (nonatomic, strong) AWSIoTJobExecutionsRolloutConfig * _Nullable jobExecutionsRolloutConfig;

/**
 <p>The ID of the job to be updated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

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
 <p>The friendly name for the mitigation action. You can't change the name by using <code>UpdateMitigationAction</code>. Instead, you must delete and re-create the mitigation action with the new name.</p>
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
@interface AWSIoTUpdateRoleAliasRequest : AWSRequest


/**
 <p>The number of seconds the credential will be valid.</p>
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
 <p>The day of the month on which the scheduled audit takes place. Can be "1" through "31" or "LAST". This field is required if the "frequency" parameter is set to "MONTHLY". If days 29-31 are specified, and the month does not have that many days, the audit takes place on the "LAST" day of the month.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dayOfMonth;

/**
 <p>The day of the week on which the scheduled audit takes place. Can be one of "SUN", "MON", "TUE", "WED", "THU", "FRI", or "SAT". This field is required if the "frequency" parameter is set to "WEEKLY" or "BIWEEKLY".</p>
 */
@property (nonatomic, assign) AWSIoTDayOfWeek dayOfWeek;

/**
 <p>How often the scheduled audit takes place. Can be one of "DAILY", "WEEKLY", "BIWEEKLY", or "MONTHLY". The start time of each audit is determined by the system.</p>
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
 <p>A list of metrics whose data is retained (stored). By default, data is retained for any metric used in the profile's <code>behaviors</code>, but it is also retained for any metric specified here.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable additionalMetricsToRetain;

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
 <p>A list of metrics whose data is retained (stored). By default, data is retained for any metric used in the security profile's <code>behaviors</code>, but it is also retained for any metric specified here.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable additionalMetricsToRetain;

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
 <p>The name of the thing to update.</p>
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
 <p>The behavior which was violated.</p>
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

NS_ASSUME_NONNULL_END
