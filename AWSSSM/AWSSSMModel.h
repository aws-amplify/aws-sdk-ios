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

FOUNDATION_EXPORT NSString *const AWSSSMErrorDomain;

typedef NS_ENUM(NSInteger, AWSSSMErrorType) {
    AWSSSMErrorUnknown,
    AWSSSMErrorAlreadyExists,
    AWSSSMErrorAssociatedInstances,
    AWSSSMErrorAssociationAlreadyExists,
    AWSSSMErrorAssociationDoesNotExist,
    AWSSSMErrorAssociationExecutionDoesNotExist,
    AWSSSMErrorAssociationLimitExceeded,
    AWSSSMErrorAssociationVersionLimitExceeded,
    AWSSSMErrorAutomationDefinitionNotFound,
    AWSSSMErrorAutomationDefinitionVersionNotFound,
    AWSSSMErrorAutomationExecutionLimitExceeded,
    AWSSSMErrorAutomationExecutionNotFound,
    AWSSSMErrorAutomationStepNotFound,
    AWSSSMErrorComplianceTypeCountLimitExceeded,
    AWSSSMErrorCustomSchemaCountLimitExceeded,
    AWSSSMErrorDocumentAlreadyExists,
    AWSSSMErrorDocumentLimitExceeded,
    AWSSSMErrorDocumentPermissionLimit,
    AWSSSMErrorDocumentVersionLimitExceeded,
    AWSSSMErrorDoesNotExist,
    AWSSSMErrorDuplicateDocumentContent,
    AWSSSMErrorDuplicateDocumentVersionName,
    AWSSSMErrorDuplicateInstanceId,
    AWSSSMErrorFeatureNotAvailable,
    AWSSSMErrorHierarchyLevelLimitExceeded,
    AWSSSMErrorHierarchyTypeMismatch,
    AWSSSMErrorIdempotentParameterMismatch,
    AWSSSMErrorIncompatiblePolicy,
    AWSSSMErrorInternalServer,
    AWSSSMErrorInvalidActivation,
    AWSSSMErrorInvalidActivationId,
    AWSSSMErrorInvalidAggregator,
    AWSSSMErrorInvalidAllowedPattern,
    AWSSSMErrorInvalidAssociation,
    AWSSSMErrorInvalidAssociationVersion,
    AWSSSMErrorInvalidAutomationExecutionParameters,
    AWSSSMErrorInvalidAutomationSignal,
    AWSSSMErrorInvalidAutomationStatusUpdate,
    AWSSSMErrorInvalidCommandId,
    AWSSSMErrorInvalidDeleteInventoryParameters,
    AWSSSMErrorInvalidDeletionId,
    AWSSSMErrorInvalidDocument,
    AWSSSMErrorInvalidDocumentContent,
    AWSSSMErrorInvalidDocumentOperation,
    AWSSSMErrorInvalidDocumentSchemaVersion,
    AWSSSMErrorInvalidDocumentType,
    AWSSSMErrorInvalidDocumentVersion,
    AWSSSMErrorInvalidFilter,
    AWSSSMErrorInvalidFilterKey,
    AWSSSMErrorInvalidFilterOption,
    AWSSSMErrorInvalidFilterValue,
    AWSSSMErrorInvalidInstanceId,
    AWSSSMErrorInvalidInstanceInformationFilterValue,
    AWSSSMErrorInvalidInventoryGroup,
    AWSSSMErrorInvalidInventoryItemContext,
    AWSSSMErrorInvalidInventoryRequest,
    AWSSSMErrorInvalidItemContent,
    AWSSSMErrorInvalidKeyId,
    AWSSSMErrorInvalidNextToken,
    AWSSSMErrorInvalidNotificationConfig,
    AWSSSMErrorInvalidOption,
    AWSSSMErrorInvalidOutputFolder,
    AWSSSMErrorInvalidOutputLocation,
    AWSSSMErrorInvalidParameters,
    AWSSSMErrorInvalidPermissionType,
    AWSSSMErrorInvalidPluginName,
    AWSSSMErrorInvalidPolicyAttribute,
    AWSSSMErrorInvalidPolicyType,
    AWSSSMErrorInvalidResourceId,
    AWSSSMErrorInvalidResourceType,
    AWSSSMErrorInvalidResultAttribute,
    AWSSSMErrorInvalidRole,
    AWSSSMErrorInvalidSchedule,
    AWSSSMErrorInvalidTarget,
    AWSSSMErrorInvalidTypeName,
    AWSSSMErrorInvalidUpdate,
    AWSSSMErrorInvocationDoesNotExist,
    AWSSSMErrorItemContentMismatch,
    AWSSSMErrorItemSizeLimitExceeded,
    AWSSSMErrorMaxDocumentSizeExceeded,
    AWSSSMErrorOpsItemAlreadyExists,
    AWSSSMErrorOpsItemInvalidParameter,
    AWSSSMErrorOpsItemLimitExceeded,
    AWSSSMErrorOpsItemNotFound,
    AWSSSMErrorParameterAlreadyExists,
    AWSSSMErrorParameterLimitExceeded,
    AWSSSMErrorParameterMaxVersionLimitExceeded,
    AWSSSMErrorParameterNotFound,
    AWSSSMErrorParameterPatternMismatch,
    AWSSSMErrorParameterVersionLabelLimitExceeded,
    AWSSSMErrorParameterVersionNotFound,
    AWSSSMErrorPoliciesLimitExceeded,
    AWSSSMErrorResourceDataSyncAlreadyExists,
    AWSSSMErrorResourceDataSyncConflict,
    AWSSSMErrorResourceDataSyncCountExceeded,
    AWSSSMErrorResourceDataSyncInvalidConfiguration,
    AWSSSMErrorResourceDataSyncNotFound,
    AWSSSMErrorResourceInUse,
    AWSSSMErrorResourceLimitExceeded,
    AWSSSMErrorServiceSettingNotFound,
    AWSSSMErrorStatusUnchanged,
    AWSSSMErrorSubTypeCountLimitExceeded,
    AWSSSMErrorTargetInUse,
    AWSSSMErrorTargetNotConnected,
    AWSSSMErrorTooManyTags,
    AWSSSMErrorTooManyUpdates,
    AWSSSMErrorTotalSizeLimitExceeded,
    AWSSSMErrorUnsupportedCalendar,
    AWSSSMErrorUnsupportedFeatureRequired,
    AWSSSMErrorUnsupportedInventoryItemContext,
    AWSSSMErrorUnsupportedInventorySchemaVersion,
    AWSSSMErrorUnsupportedOperatingSystem,
    AWSSSMErrorUnsupportedParameterType,
    AWSSSMErrorUnsupportedPlatformType,
};

typedef NS_ENUM(NSInteger, AWSSSMAssociationComplianceSeverity) {
    AWSSSMAssociationComplianceSeverityUnknown,
    AWSSSMAssociationComplianceSeverityCritical,
    AWSSSMAssociationComplianceSeverityHigh,
    AWSSSMAssociationComplianceSeverityMedium,
    AWSSSMAssociationComplianceSeverityLow,
    AWSSSMAssociationComplianceSeverityUnspecified,
};

typedef NS_ENUM(NSInteger, AWSSSMAssociationExecutionFilterKey) {
    AWSSSMAssociationExecutionFilterKeyUnknown,
    AWSSSMAssociationExecutionFilterKeyExecutionId,
    AWSSSMAssociationExecutionFilterKeyStatus,
    AWSSSMAssociationExecutionFilterKeyCreatedTime,
};

typedef NS_ENUM(NSInteger, AWSSSMAssociationExecutionTargetsFilterKey) {
    AWSSSMAssociationExecutionTargetsFilterKeyUnknown,
    AWSSSMAssociationExecutionTargetsFilterKeyStatus,
    AWSSSMAssociationExecutionTargetsFilterKeyResourceId,
    AWSSSMAssociationExecutionTargetsFilterKeyResourceType,
};

typedef NS_ENUM(NSInteger, AWSSSMAssociationFilterKey) {
    AWSSSMAssociationFilterKeyUnknown,
    AWSSSMAssociationFilterKeyInstanceId,
    AWSSSMAssociationFilterKeyName,
    AWSSSMAssociationFilterKeyAssociationId,
    AWSSSMAssociationFilterKeyAssociationStatusName,
    AWSSSMAssociationFilterKeyLastExecutedBefore,
    AWSSSMAssociationFilterKeyLastExecutedAfter,
    AWSSSMAssociationFilterKeyAssociationName,
    AWSSSMAssociationFilterKeyResourceGroupName,
};

typedef NS_ENUM(NSInteger, AWSSSMAssociationFilterOperatorType) {
    AWSSSMAssociationFilterOperatorTypeUnknown,
    AWSSSMAssociationFilterOperatorTypeEqual,
    AWSSSMAssociationFilterOperatorTypeLessThan,
    AWSSSMAssociationFilterOperatorTypeGreaterThan,
};

typedef NS_ENUM(NSInteger, AWSSSMAssociationStatusName) {
    AWSSSMAssociationStatusNameUnknown,
    AWSSSMAssociationStatusNamePending,
    AWSSSMAssociationStatusNameSuccess,
    AWSSSMAssociationStatusNameFailed,
};

typedef NS_ENUM(NSInteger, AWSSSMAssociationSyncCompliance) {
    AWSSSMAssociationSyncComplianceUnknown,
    AWSSSMAssociationSyncComplianceAuto,
    AWSSSMAssociationSyncComplianceManual,
};

typedef NS_ENUM(NSInteger, AWSSSMAttachmentHashType) {
    AWSSSMAttachmentHashTypeUnknown,
    AWSSSMAttachmentHashTypeSha256,
};

typedef NS_ENUM(NSInteger, AWSSSMAttachmentsSourceKey) {
    AWSSSMAttachmentsSourceKeyUnknown,
    AWSSSMAttachmentsSourceKeySourceUrl,
    AWSSSMAttachmentsSourceKeyS3FileUrl,
    AWSSSMAttachmentsSourceKeyAttachmentReference,
};

typedef NS_ENUM(NSInteger, AWSSSMAutomationExecutionFilterKey) {
    AWSSSMAutomationExecutionFilterKeyUnknown,
    AWSSSMAutomationExecutionFilterKeyDocumentNamePrefix,
    AWSSSMAutomationExecutionFilterKeyExecutionStatus,
    AWSSSMAutomationExecutionFilterKeyExecutionId,
    AWSSSMAutomationExecutionFilterKeyParentExecutionId,
    AWSSSMAutomationExecutionFilterKeyCurrentAction,
    AWSSSMAutomationExecutionFilterKeyStartTimeBefore,
    AWSSSMAutomationExecutionFilterKeyStartTimeAfter,
    AWSSSMAutomationExecutionFilterKeyAutomationType,
    AWSSSMAutomationExecutionFilterKeyTagKey,
};

typedef NS_ENUM(NSInteger, AWSSSMAutomationExecutionStatus) {
    AWSSSMAutomationExecutionStatusUnknown,
    AWSSSMAutomationExecutionStatusPending,
    AWSSSMAutomationExecutionStatusInProgress,
    AWSSSMAutomationExecutionStatusWaiting,
    AWSSSMAutomationExecutionStatusSuccess,
    AWSSSMAutomationExecutionStatusTimedOut,
    AWSSSMAutomationExecutionStatusCancelling,
    AWSSSMAutomationExecutionStatusCancelled,
    AWSSSMAutomationExecutionStatusFailed,
};

typedef NS_ENUM(NSInteger, AWSSSMAutomationType) {
    AWSSSMAutomationTypeUnknown,
    AWSSSMAutomationTypeCrossAccount,
    AWSSSMAutomationTypeLocal,
};

typedef NS_ENUM(NSInteger, AWSSSMCalendarState) {
    AWSSSMCalendarStateUnknown,
    AWSSSMCalendarStateOpen,
    AWSSSMCalendarStateClosed,
};

typedef NS_ENUM(NSInteger, AWSSSMCommandFilterKey) {
    AWSSSMCommandFilterKeyUnknown,
    AWSSSMCommandFilterKeyInvokedAfter,
    AWSSSMCommandFilterKeyInvokedBefore,
    AWSSSMCommandFilterKeyStatus,
    AWSSSMCommandFilterKeyExecutionStage,
    AWSSSMCommandFilterKeyDocumentName,
};

typedef NS_ENUM(NSInteger, AWSSSMCommandInvocationStatus) {
    AWSSSMCommandInvocationStatusUnknown,
    AWSSSMCommandInvocationStatusPending,
    AWSSSMCommandInvocationStatusInProgress,
    AWSSSMCommandInvocationStatusDelayed,
    AWSSSMCommandInvocationStatusSuccess,
    AWSSSMCommandInvocationStatusCancelled,
    AWSSSMCommandInvocationStatusTimedOut,
    AWSSSMCommandInvocationStatusFailed,
    AWSSSMCommandInvocationStatusCancelling,
};

typedef NS_ENUM(NSInteger, AWSSSMCommandPluginStatus) {
    AWSSSMCommandPluginStatusUnknown,
    AWSSSMCommandPluginStatusPending,
    AWSSSMCommandPluginStatusInProgress,
    AWSSSMCommandPluginStatusSuccess,
    AWSSSMCommandPluginStatusTimedOut,
    AWSSSMCommandPluginStatusCancelled,
    AWSSSMCommandPluginStatusFailed,
};

typedef NS_ENUM(NSInteger, AWSSSMCommandStatus) {
    AWSSSMCommandStatusUnknown,
    AWSSSMCommandStatusPending,
    AWSSSMCommandStatusInProgress,
    AWSSSMCommandStatusSuccess,
    AWSSSMCommandStatusCancelled,
    AWSSSMCommandStatusFailed,
    AWSSSMCommandStatusTimedOut,
    AWSSSMCommandStatusCancelling,
};

typedef NS_ENUM(NSInteger, AWSSSMComplianceQueryOperatorType) {
    AWSSSMComplianceQueryOperatorTypeUnknown,
    AWSSSMComplianceQueryOperatorTypeEqual,
    AWSSSMComplianceQueryOperatorTypeNotEqual,
    AWSSSMComplianceQueryOperatorTypeBeginWith,
    AWSSSMComplianceQueryOperatorTypeLessThan,
    AWSSSMComplianceQueryOperatorTypeGreaterThan,
};

typedef NS_ENUM(NSInteger, AWSSSMComplianceSeverity) {
    AWSSSMComplianceSeverityUnknown,
    AWSSSMComplianceSeverityCritical,
    AWSSSMComplianceSeverityHigh,
    AWSSSMComplianceSeverityMedium,
    AWSSSMComplianceSeverityLow,
    AWSSSMComplianceSeverityInformational,
    AWSSSMComplianceSeverityUnspecified,
};

typedef NS_ENUM(NSInteger, AWSSSMComplianceStatus) {
    AWSSSMComplianceStatusUnknown,
    AWSSSMComplianceStatusCompliant,
    AWSSSMComplianceStatusNonCompliant,
};

typedef NS_ENUM(NSInteger, AWSSSMComplianceUploadType) {
    AWSSSMComplianceUploadTypeUnknown,
    AWSSSMComplianceUploadTypeComplete,
    AWSSSMComplianceUploadTypePartial,
};

typedef NS_ENUM(NSInteger, AWSSSMConnectionStatus) {
    AWSSSMConnectionStatusUnknown,
    AWSSSMConnectionStatusConnected,
    AWSSSMConnectionStatusNotConnected,
};

typedef NS_ENUM(NSInteger, AWSSSMDescribeActivationsFilterKeys) {
    AWSSSMDescribeActivationsFilterKeysUnknown,
    AWSSSMDescribeActivationsFilterKeysActivationIds,
    AWSSSMDescribeActivationsFilterKeysDefaultInstanceName,
    AWSSSMDescribeActivationsFilterKeysIamRole,
};

typedef NS_ENUM(NSInteger, AWSSSMDocumentFilterKey) {
    AWSSSMDocumentFilterKeyUnknown,
    AWSSSMDocumentFilterKeyName,
    AWSSSMDocumentFilterKeyOwner,
    AWSSSMDocumentFilterKeyPlatformTypes,
    AWSSSMDocumentFilterKeyDocumentType,
};

typedef NS_ENUM(NSInteger, AWSSSMDocumentFormat) {
    AWSSSMDocumentFormatUnknown,
    AWSSSMDocumentFormatYaml,
    AWSSSMDocumentFormatJson,
    AWSSSMDocumentFormatText,
};

typedef NS_ENUM(NSInteger, AWSSSMDocumentHashType) {
    AWSSSMDocumentHashTypeUnknown,
    AWSSSMDocumentHashTypeSha256,
    AWSSSMDocumentHashTypeSha1,
};

typedef NS_ENUM(NSInteger, AWSSSMDocumentParameterType) {
    AWSSSMDocumentParameterTypeUnknown,
    AWSSSMDocumentParameterTypeString,
    AWSSSMDocumentParameterTypeStringList,
};

typedef NS_ENUM(NSInteger, AWSSSMDocumentPermissionType) {
    AWSSSMDocumentPermissionTypeUnknown,
    AWSSSMDocumentPermissionTypeShare,
};

typedef NS_ENUM(NSInteger, AWSSSMDocumentStatus) {
    AWSSSMDocumentStatusUnknown,
    AWSSSMDocumentStatusCreating,
    AWSSSMDocumentStatusActive,
    AWSSSMDocumentStatusUpdating,
    AWSSSMDocumentStatusDeleting,
    AWSSSMDocumentStatusFailed,
};

typedef NS_ENUM(NSInteger, AWSSSMDocumentType) {
    AWSSSMDocumentTypeUnknown,
    AWSSSMDocumentTypeCommand,
    AWSSSMDocumentTypePolicy,
    AWSSSMDocumentTypeAutomation,
    AWSSSMDocumentTypeSession,
    AWSSSMDocumentTypePackage,
    AWSSSMDocumentTypeApplicationConfiguration,
    AWSSSMDocumentTypeApplicationConfigurationSchema,
    AWSSSMDocumentTypeDeploymentStrategy,
    AWSSSMDocumentTypeChangeCalendar,
};

typedef NS_ENUM(NSInteger, AWSSSMExecutionMode) {
    AWSSSMExecutionModeUnknown,
    AWSSSMExecutionModeAuto,
    AWSSSMExecutionModeInteractive,
};

typedef NS_ENUM(NSInteger, AWSSSMFault) {
    AWSSSMFaultUnknown,
    AWSSSMFaultClient,
    AWSSSMFaultServer,
};

typedef NS_ENUM(NSInteger, AWSSSMInstanceInformationFilterKey) {
    AWSSSMInstanceInformationFilterKeyUnknown,
    AWSSSMInstanceInformationFilterKeyInstanceIds,
    AWSSSMInstanceInformationFilterKeyAgentVersion,
    AWSSSMInstanceInformationFilterKeyPingStatus,
    AWSSSMInstanceInformationFilterKeyPlatformTypes,
    AWSSSMInstanceInformationFilterKeyActivationIds,
    AWSSSMInstanceInformationFilterKeyIamRole,
    AWSSSMInstanceInformationFilterKeyResourceType,
    AWSSSMInstanceInformationFilterKeyAssociationStatus,
};

typedef NS_ENUM(NSInteger, AWSSSMInstancePatchStateOperatorType) {
    AWSSSMInstancePatchStateOperatorTypeUnknown,
    AWSSSMInstancePatchStateOperatorTypeEqual,
    AWSSSMInstancePatchStateOperatorTypeNotEqual,
    AWSSSMInstancePatchStateOperatorTypeLessThan,
    AWSSSMInstancePatchStateOperatorTypeGreaterThan,
};

typedef NS_ENUM(NSInteger, AWSSSMInventoryAttributeDataType) {
    AWSSSMInventoryAttributeDataTypeUnknown,
    AWSSSMInventoryAttributeDataTypeString,
    AWSSSMInventoryAttributeDataTypeNumber,
};

typedef NS_ENUM(NSInteger, AWSSSMInventoryDeletionStatus) {
    AWSSSMInventoryDeletionStatusUnknown,
    AWSSSMInventoryDeletionStatusInProgress,
    AWSSSMInventoryDeletionStatusComplete,
};

typedef NS_ENUM(NSInteger, AWSSSMInventoryQueryOperatorType) {
    AWSSSMInventoryQueryOperatorTypeUnknown,
    AWSSSMInventoryQueryOperatorTypeEqual,
    AWSSSMInventoryQueryOperatorTypeNotEqual,
    AWSSSMInventoryQueryOperatorTypeBeginWith,
    AWSSSMInventoryQueryOperatorTypeLessThan,
    AWSSSMInventoryQueryOperatorTypeGreaterThan,
    AWSSSMInventoryQueryOperatorTypeExists,
};

typedef NS_ENUM(NSInteger, AWSSSMInventorySchemaDeleteOption) {
    AWSSSMInventorySchemaDeleteOptionUnknown,
    AWSSSMInventorySchemaDeleteOptionDisableSchema,
    AWSSSMInventorySchemaDeleteOptionDeleteSchema,
};

typedef NS_ENUM(NSInteger, AWSSSMLastResourceDataSyncStatus) {
    AWSSSMLastResourceDataSyncStatusUnknown,
    AWSSSMLastResourceDataSyncStatusSuccessful,
    AWSSSMLastResourceDataSyncStatusFailed,
    AWSSSMLastResourceDataSyncStatusInProgress,
};

typedef NS_ENUM(NSInteger, AWSSSMMaintenanceWindowExecutionStatus) {
    AWSSSMMaintenanceWindowExecutionStatusUnknown,
    AWSSSMMaintenanceWindowExecutionStatusPending,
    AWSSSMMaintenanceWindowExecutionStatusInProgress,
    AWSSSMMaintenanceWindowExecutionStatusSuccess,
    AWSSSMMaintenanceWindowExecutionStatusFailed,
    AWSSSMMaintenanceWindowExecutionStatusTimedOut,
    AWSSSMMaintenanceWindowExecutionStatusCancelling,
    AWSSSMMaintenanceWindowExecutionStatusCancelled,
    AWSSSMMaintenanceWindowExecutionStatusSkippedOverlapping,
};

typedef NS_ENUM(NSInteger, AWSSSMMaintenanceWindowResourceType) {
    AWSSSMMaintenanceWindowResourceTypeUnknown,
    AWSSSMMaintenanceWindowResourceTypeInstance,
    AWSSSMMaintenanceWindowResourceTypeResourceGroup,
};

typedef NS_ENUM(NSInteger, AWSSSMMaintenanceWindowTaskType) {
    AWSSSMMaintenanceWindowTaskTypeUnknown,
    AWSSSMMaintenanceWindowTaskTypeRunCommand,
    AWSSSMMaintenanceWindowTaskTypeAutomation,
    AWSSSMMaintenanceWindowTaskTypeStepFunctions,
    AWSSSMMaintenanceWindowTaskTypeLambda,
};

typedef NS_ENUM(NSInteger, AWSSSMNotificationEvent) {
    AWSSSMNotificationEventUnknown,
    AWSSSMNotificationEventAll,
    AWSSSMNotificationEventInProgress,
    AWSSSMNotificationEventSuccess,
    AWSSSMNotificationEventTimedOut,
    AWSSSMNotificationEventCancelled,
    AWSSSMNotificationEventFailed,
};

typedef NS_ENUM(NSInteger, AWSSSMNotificationType) {
    AWSSSMNotificationTypeUnknown,
    AWSSSMNotificationTypeCommand,
    AWSSSMNotificationTypeInvocation,
};

typedef NS_ENUM(NSInteger, AWSSSMOperatingSystem) {
    AWSSSMOperatingSystemUnknown,
    AWSSSMOperatingSystemWindows,
    AWSSSMOperatingSystemAmazonLinux,
    AWSSSMOperatingSystemAmazonLinux2,
    AWSSSMOperatingSystemUbuntu,
    AWSSSMOperatingSystemRedhatEnterpriseLinux,
    AWSSSMOperatingSystemSuse,
    AWSSSMOperatingSystemCentos,
    AWSSSMOperatingSystemOracleLinux,
    AWSSSMOperatingSystemDebian,
};

typedef NS_ENUM(NSInteger, AWSSSMOpsFilterOperatorType) {
    AWSSSMOpsFilterOperatorTypeUnknown,
    AWSSSMOpsFilterOperatorTypeEqual,
    AWSSSMOpsFilterOperatorTypeNotEqual,
    AWSSSMOpsFilterOperatorTypeBeginWith,
    AWSSSMOpsFilterOperatorTypeLessThan,
    AWSSSMOpsFilterOperatorTypeGreaterThan,
    AWSSSMOpsFilterOperatorTypeExists,
};

typedef NS_ENUM(NSInteger, AWSSSMOpsItemDataType) {
    AWSSSMOpsItemDataTypeUnknown,
    AWSSSMOpsItemDataTypeSearchableString,
    AWSSSMOpsItemDataTypeString,
};

typedef NS_ENUM(NSInteger, AWSSSMOpsItemFilterKey) {
    AWSSSMOpsItemFilterKeyUnknown,
    AWSSSMOpsItemFilterKeyStatus,
    AWSSSMOpsItemFilterKeyCreatedBy,
    AWSSSMOpsItemFilterKeySource,
    AWSSSMOpsItemFilterKeyPriority,
    AWSSSMOpsItemFilterKeyTitle,
    AWSSSMOpsItemFilterKeyOpsItemId,
    AWSSSMOpsItemFilterKeyCreatedTime,
    AWSSSMOpsItemFilterKeyLastModifiedTime,
    AWSSSMOpsItemFilterKeyOperationalData,
    AWSSSMOpsItemFilterKeyOperationalDataKey,
    AWSSSMOpsItemFilterKeyOperationalDataValue,
    AWSSSMOpsItemFilterKeyResourceId,
    AWSSSMOpsItemFilterKeyAutomationId,
    AWSSSMOpsItemFilterKeyCategory,
    AWSSSMOpsItemFilterKeySeverity,
};

typedef NS_ENUM(NSInteger, AWSSSMOpsItemFilterOperator) {
    AWSSSMOpsItemFilterOperatorUnknown,
    AWSSSMOpsItemFilterOperatorEqual,
    AWSSSMOpsItemFilterOperatorContains,
    AWSSSMOpsItemFilterOperatorGreaterThan,
    AWSSSMOpsItemFilterOperatorLessThan,
};

typedef NS_ENUM(NSInteger, AWSSSMOpsItemStatus) {
    AWSSSMOpsItemStatusUnknown,
    AWSSSMOpsItemStatusOpen,
    AWSSSMOpsItemStatusInProgress,
    AWSSSMOpsItemStatusResolved,
};

typedef NS_ENUM(NSInteger, AWSSSMParameterTier) {
    AWSSSMParameterTierUnknown,
    AWSSSMParameterTierStandard,
    AWSSSMParameterTierAdvanced,
    AWSSSMParameterTierIntelligentTiering,
};

typedef NS_ENUM(NSInteger, AWSSSMParameterType) {
    AWSSSMParameterTypeUnknown,
    AWSSSMParameterTypeString,
    AWSSSMParameterTypeStringList,
    AWSSSMParameterTypeSecureString,
};

typedef NS_ENUM(NSInteger, AWSSSMParametersFilterKey) {
    AWSSSMParametersFilterKeyUnknown,
    AWSSSMParametersFilterKeyName,
    AWSSSMParametersFilterKeyType,
    AWSSSMParametersFilterKeyKeyId,
};

typedef NS_ENUM(NSInteger, AWSSSMPatchAction) {
    AWSSSMPatchActionUnknown,
    AWSSSMPatchActionAllowAsDependency,
    AWSSSMPatchActionBlock,
};

typedef NS_ENUM(NSInteger, AWSSSMPatchComplianceDataState) {
    AWSSSMPatchComplianceDataStateUnknown,
    AWSSSMPatchComplianceDataStateInstalled,
    AWSSSMPatchComplianceDataStateInstalledOther,
    AWSSSMPatchComplianceDataStateInstalledPendingReboot,
    AWSSSMPatchComplianceDataStateInstalledRejected,
    AWSSSMPatchComplianceDataStateMissing,
    AWSSSMPatchComplianceDataStateNotApplicable,
    AWSSSMPatchComplianceDataStateFailed,
};

typedef NS_ENUM(NSInteger, AWSSSMPatchComplianceLevel) {
    AWSSSMPatchComplianceLevelUnknown,
    AWSSSMPatchComplianceLevelCritical,
    AWSSSMPatchComplianceLevelHigh,
    AWSSSMPatchComplianceLevelMedium,
    AWSSSMPatchComplianceLevelLow,
    AWSSSMPatchComplianceLevelInformational,
    AWSSSMPatchComplianceLevelUnspecified,
};

typedef NS_ENUM(NSInteger, AWSSSMPatchDeploymentStatus) {
    AWSSSMPatchDeploymentStatusUnknown,
    AWSSSMPatchDeploymentStatusApproved,
    AWSSSMPatchDeploymentStatusPendingApproval,
    AWSSSMPatchDeploymentStatusExplicitApproved,
    AWSSSMPatchDeploymentStatusExplicitRejected,
};

typedef NS_ENUM(NSInteger, AWSSSMPatchFilterKey) {
    AWSSSMPatchFilterKeyUnknown,
    AWSSSMPatchFilterKeyPatchSet,
    AWSSSMPatchFilterKeyProduct,
    AWSSSMPatchFilterKeyProductFamily,
    AWSSSMPatchFilterKeyClassification,
    AWSSSMPatchFilterKeyMsrcSeverity,
    AWSSSMPatchFilterKeyPatchId,
    AWSSSMPatchFilterKeySection,
    AWSSSMPatchFilterKeyPriority,
    AWSSSMPatchFilterKeySeverity,
};

typedef NS_ENUM(NSInteger, AWSSSMPatchOperationType) {
    AWSSSMPatchOperationTypeUnknown,
    AWSSSMPatchOperationTypeScan,
    AWSSSMPatchOperationTypeInstall,
};

typedef NS_ENUM(NSInteger, AWSSSMPatchProperty) {
    AWSSSMPatchPropertyUnknown,
    AWSSSMPatchPropertyProduct,
    AWSSSMPatchPropertyProductFamily,
    AWSSSMPatchPropertyClassification,
    AWSSSMPatchPropertyMsrcSeverity,
    AWSSSMPatchPropertyPriority,
    AWSSSMPatchPropertySeverity,
};

typedef NS_ENUM(NSInteger, AWSSSMPatchSet) {
    AWSSSMPatchSetUnknown,
    AWSSSMPatchSetOs,
    AWSSSMPatchSetApplication,
};

typedef NS_ENUM(NSInteger, AWSSSMPingStatus) {
    AWSSSMPingStatusUnknown,
    AWSSSMPingStatusOnline,
    AWSSSMPingStatusConnectionLost,
    AWSSSMPingStatusInactive,
};

typedef NS_ENUM(NSInteger, AWSSSMPlatformType) {
    AWSSSMPlatformTypeUnknown,
    AWSSSMPlatformTypeWindows,
    AWSSSMPlatformTypeLinux,
};

typedef NS_ENUM(NSInteger, AWSSSMRebootOption) {
    AWSSSMRebootOptionUnknown,
    AWSSSMRebootOptionRebootIfNeeded,
    AWSSSMRebootOptionNoReboot,
};

typedef NS_ENUM(NSInteger, AWSSSMResourceDataSyncS3Format) {
    AWSSSMResourceDataSyncS3FormatUnknown,
    AWSSSMResourceDataSyncS3FormatJsonSerDe,
};

typedef NS_ENUM(NSInteger, AWSSSMResourceType) {
    AWSSSMResourceTypeUnknown,
    AWSSSMResourceTypeManagedInstance,
    AWSSSMResourceTypeDocument,
    AWSSSMResourceTypeEC2Instance,
};

typedef NS_ENUM(NSInteger, AWSSSMResourceTypeForTagging) {
    AWSSSMResourceTypeForTaggingUnknown,
    AWSSSMResourceTypeForTaggingDocument,
    AWSSSMResourceTypeForTaggingManagedInstance,
    AWSSSMResourceTypeForTaggingMaintenanceWindow,
    AWSSSMResourceTypeForTaggingParameter,
    AWSSSMResourceTypeForTaggingPatchBaseline,
    AWSSSMResourceTypeForTaggingOpsItem,
};

typedef NS_ENUM(NSInteger, AWSSSMSessionFilterKey) {
    AWSSSMSessionFilterKeyUnknown,
    AWSSSMSessionFilterKeyInvokedAfter,
    AWSSSMSessionFilterKeyInvokedBefore,
    AWSSSMSessionFilterKeyTarget,
    AWSSSMSessionFilterKeyOwner,
    AWSSSMSessionFilterKeyStatus,
};

typedef NS_ENUM(NSInteger, AWSSSMSessionState) {
    AWSSSMSessionStateUnknown,
    AWSSSMSessionStateActive,
    AWSSSMSessionStateHistory,
};

typedef NS_ENUM(NSInteger, AWSSSMSessionStatus) {
    AWSSSMSessionStatusUnknown,
    AWSSSMSessionStatusConnected,
    AWSSSMSessionStatusConnecting,
    AWSSSMSessionStatusDisconnected,
    AWSSSMSessionStatusTerminated,
    AWSSSMSessionStatusTerminating,
    AWSSSMSessionStatusFailed,
};

typedef NS_ENUM(NSInteger, AWSSSMSignalType) {
    AWSSSMSignalTypeUnknown,
    AWSSSMSignalTypeApprove,
    AWSSSMSignalTypeReject,
    AWSSSMSignalTypeStartStep,
    AWSSSMSignalTypeStopStep,
    AWSSSMSignalTypeResume,
};

typedef NS_ENUM(NSInteger, AWSSSMStepExecutionFilterKey) {
    AWSSSMStepExecutionFilterKeyUnknown,
    AWSSSMStepExecutionFilterKeyStartTimeBefore,
    AWSSSMStepExecutionFilterKeyStartTimeAfter,
    AWSSSMStepExecutionFilterKeyStepExecutionStatus,
    AWSSSMStepExecutionFilterKeyStepExecutionId,
    AWSSSMStepExecutionFilterKeyStepName,
    AWSSSMStepExecutionFilterKeyAction,
};

typedef NS_ENUM(NSInteger, AWSSSMStopType) {
    AWSSSMStopTypeUnknown,
    AWSSSMStopTypeComplete,
    AWSSSMStopTypeCancel,
};

@class AWSSSMAccountSharingInfo;
@class AWSSSMActivation;
@class AWSSSMAddTagsToResourceRequest;
@class AWSSSMAddTagsToResourceResult;
@class AWSSSMAssociation;
@class AWSSSMAssociationDescription;
@class AWSSSMAssociationExecution;
@class AWSSSMAssociationExecutionFilter;
@class AWSSSMAssociationExecutionTarget;
@class AWSSSMAssociationExecutionTargetsFilter;
@class AWSSSMAssociationFilter;
@class AWSSSMAssociationOverview;
@class AWSSSMAssociationStatus;
@class AWSSSMAssociationVersionInfo;
@class AWSSSMAttachmentContent;
@class AWSSSMAttachmentInformation;
@class AWSSSMAttachmentsSource;
@class AWSSSMAutomationExecution;
@class AWSSSMAutomationExecutionFilter;
@class AWSSSMAutomationExecutionMetadata;
@class AWSSSMCancelCommandRequest;
@class AWSSSMCancelCommandResult;
@class AWSSSMCancelMaintenanceWindowExecutionRequest;
@class AWSSSMCancelMaintenanceWindowExecutionResult;
@class AWSSSMCloudWatchOutputConfig;
@class AWSSSMCommand;
@class AWSSSMCommandFilter;
@class AWSSSMCommandInvocation;
@class AWSSSMCommandPlugin;
@class AWSSSMComplianceExecutionSummary;
@class AWSSSMComplianceItem;
@class AWSSSMComplianceItemEntry;
@class AWSSSMComplianceStringFilter;
@class AWSSSMComplianceSummaryItem;
@class AWSSSMCompliantSummary;
@class AWSSSMCreateActivationRequest;
@class AWSSSMCreateActivationResult;
@class AWSSSMCreateAssociationBatchRequest;
@class AWSSSMCreateAssociationBatchRequestEntry;
@class AWSSSMCreateAssociationBatchResult;
@class AWSSSMCreateAssociationRequest;
@class AWSSSMCreateAssociationResult;
@class AWSSSMCreateDocumentRequest;
@class AWSSSMCreateDocumentResult;
@class AWSSSMCreateMaintenanceWindowRequest;
@class AWSSSMCreateMaintenanceWindowResult;
@class AWSSSMCreateOpsItemRequest;
@class AWSSSMCreateOpsItemResponse;
@class AWSSSMCreatePatchBaselineRequest;
@class AWSSSMCreatePatchBaselineResult;
@class AWSSSMCreateResourceDataSyncRequest;
@class AWSSSMCreateResourceDataSyncResult;
@class AWSSSMDeleteActivationRequest;
@class AWSSSMDeleteActivationResult;
@class AWSSSMDeleteAssociationRequest;
@class AWSSSMDeleteAssociationResult;
@class AWSSSMDeleteDocumentRequest;
@class AWSSSMDeleteDocumentResult;
@class AWSSSMDeleteInventoryRequest;
@class AWSSSMDeleteInventoryResult;
@class AWSSSMDeleteMaintenanceWindowRequest;
@class AWSSSMDeleteMaintenanceWindowResult;
@class AWSSSMDeleteParameterRequest;
@class AWSSSMDeleteParameterResult;
@class AWSSSMDeleteParametersRequest;
@class AWSSSMDeleteParametersResult;
@class AWSSSMDeletePatchBaselineRequest;
@class AWSSSMDeletePatchBaselineResult;
@class AWSSSMDeleteResourceDataSyncRequest;
@class AWSSSMDeleteResourceDataSyncResult;
@class AWSSSMDeregisterManagedInstanceRequest;
@class AWSSSMDeregisterManagedInstanceResult;
@class AWSSSMDeregisterPatchBaselineForPatchGroupRequest;
@class AWSSSMDeregisterPatchBaselineForPatchGroupResult;
@class AWSSSMDeregisterTargetFromMaintenanceWindowRequest;
@class AWSSSMDeregisterTargetFromMaintenanceWindowResult;
@class AWSSSMDeregisterTaskFromMaintenanceWindowRequest;
@class AWSSSMDeregisterTaskFromMaintenanceWindowResult;
@class AWSSSMDescribeActivationsFilter;
@class AWSSSMDescribeActivationsRequest;
@class AWSSSMDescribeActivationsResult;
@class AWSSSMDescribeAssociationExecutionTargetsRequest;
@class AWSSSMDescribeAssociationExecutionTargetsResult;
@class AWSSSMDescribeAssociationExecutionsRequest;
@class AWSSSMDescribeAssociationExecutionsResult;
@class AWSSSMDescribeAssociationRequest;
@class AWSSSMDescribeAssociationResult;
@class AWSSSMDescribeAutomationExecutionsRequest;
@class AWSSSMDescribeAutomationExecutionsResult;
@class AWSSSMDescribeAutomationStepExecutionsRequest;
@class AWSSSMDescribeAutomationStepExecutionsResult;
@class AWSSSMDescribeAvailablePatchesRequest;
@class AWSSSMDescribeAvailablePatchesResult;
@class AWSSSMDescribeDocumentPermissionRequest;
@class AWSSSMDescribeDocumentPermissionResponse;
@class AWSSSMDescribeDocumentRequest;
@class AWSSSMDescribeDocumentResult;
@class AWSSSMDescribeEffectiveInstanceAssociationsRequest;
@class AWSSSMDescribeEffectiveInstanceAssociationsResult;
@class AWSSSMDescribeEffectivePatchesForPatchBaselineRequest;
@class AWSSSMDescribeEffectivePatchesForPatchBaselineResult;
@class AWSSSMDescribeInstanceAssociationsStatusRequest;
@class AWSSSMDescribeInstanceAssociationsStatusResult;
@class AWSSSMDescribeInstanceInformationRequest;
@class AWSSSMDescribeInstanceInformationResult;
@class AWSSSMDescribeInstancePatchStatesForPatchGroupRequest;
@class AWSSSMDescribeInstancePatchStatesForPatchGroupResult;
@class AWSSSMDescribeInstancePatchStatesRequest;
@class AWSSSMDescribeInstancePatchStatesResult;
@class AWSSSMDescribeInstancePatchesRequest;
@class AWSSSMDescribeInstancePatchesResult;
@class AWSSSMDescribeInventoryDeletionsRequest;
@class AWSSSMDescribeInventoryDeletionsResult;
@class AWSSSMDescribeMaintenanceWindowExecutionTaskInvocationsRequest;
@class AWSSSMDescribeMaintenanceWindowExecutionTaskInvocationsResult;
@class AWSSSMDescribeMaintenanceWindowExecutionTasksRequest;
@class AWSSSMDescribeMaintenanceWindowExecutionTasksResult;
@class AWSSSMDescribeMaintenanceWindowExecutionsRequest;
@class AWSSSMDescribeMaintenanceWindowExecutionsResult;
@class AWSSSMDescribeMaintenanceWindowScheduleRequest;
@class AWSSSMDescribeMaintenanceWindowScheduleResult;
@class AWSSSMDescribeMaintenanceWindowTargetsRequest;
@class AWSSSMDescribeMaintenanceWindowTargetsResult;
@class AWSSSMDescribeMaintenanceWindowTasksRequest;
@class AWSSSMDescribeMaintenanceWindowTasksResult;
@class AWSSSMDescribeMaintenanceWindowsForTargetRequest;
@class AWSSSMDescribeMaintenanceWindowsForTargetResult;
@class AWSSSMDescribeMaintenanceWindowsRequest;
@class AWSSSMDescribeMaintenanceWindowsResult;
@class AWSSSMDescribeOpsItemsRequest;
@class AWSSSMDescribeOpsItemsResponse;
@class AWSSSMDescribeParametersRequest;
@class AWSSSMDescribeParametersResult;
@class AWSSSMDescribePatchBaselinesRequest;
@class AWSSSMDescribePatchBaselinesResult;
@class AWSSSMDescribePatchGroupStateRequest;
@class AWSSSMDescribePatchGroupStateResult;
@class AWSSSMDescribePatchGroupsRequest;
@class AWSSSMDescribePatchGroupsResult;
@class AWSSSMDescribePatchPropertiesRequest;
@class AWSSSMDescribePatchPropertiesResult;
@class AWSSSMDescribeSessionsRequest;
@class AWSSSMDescribeSessionsResponse;
@class AWSSSMDocumentDefaultVersionDescription;
@class AWSSSMDocumentDescription;
@class AWSSSMDocumentFilter;
@class AWSSSMDocumentIdentifier;
@class AWSSSMDocumentKeyValuesFilter;
@class AWSSSMDocumentParameter;
@class AWSSSMDocumentRequires;
@class AWSSSMDocumentVersionInfo;
@class AWSSSMEffectivePatch;
@class AWSSSMFailedCreateAssociation;
@class AWSSSMFailureDetails;
@class AWSSSMGetAutomationExecutionRequest;
@class AWSSSMGetAutomationExecutionResult;
@class AWSSSMGetCalendarStateRequest;
@class AWSSSMGetCalendarStateResponse;
@class AWSSSMGetCommandInvocationRequest;
@class AWSSSMGetCommandInvocationResult;
@class AWSSSMGetConnectionStatusRequest;
@class AWSSSMGetConnectionStatusResponse;
@class AWSSSMGetDefaultPatchBaselineRequest;
@class AWSSSMGetDefaultPatchBaselineResult;
@class AWSSSMGetDeployablePatchSnapshotForInstanceRequest;
@class AWSSSMGetDeployablePatchSnapshotForInstanceResult;
@class AWSSSMGetDocumentRequest;
@class AWSSSMGetDocumentResult;
@class AWSSSMGetInventoryRequest;
@class AWSSSMGetInventoryResult;
@class AWSSSMGetInventorySchemaRequest;
@class AWSSSMGetInventorySchemaResult;
@class AWSSSMGetMaintenanceWindowExecutionRequest;
@class AWSSSMGetMaintenanceWindowExecutionResult;
@class AWSSSMGetMaintenanceWindowExecutionTaskInvocationRequest;
@class AWSSSMGetMaintenanceWindowExecutionTaskInvocationResult;
@class AWSSSMGetMaintenanceWindowExecutionTaskRequest;
@class AWSSSMGetMaintenanceWindowExecutionTaskResult;
@class AWSSSMGetMaintenanceWindowRequest;
@class AWSSSMGetMaintenanceWindowResult;
@class AWSSSMGetMaintenanceWindowTaskRequest;
@class AWSSSMGetMaintenanceWindowTaskResult;
@class AWSSSMGetOpsItemRequest;
@class AWSSSMGetOpsItemResponse;
@class AWSSSMGetOpsSummaryRequest;
@class AWSSSMGetOpsSummaryResult;
@class AWSSSMGetParameterHistoryRequest;
@class AWSSSMGetParameterHistoryResult;
@class AWSSSMGetParameterRequest;
@class AWSSSMGetParameterResult;
@class AWSSSMGetParametersByPathRequest;
@class AWSSSMGetParametersByPathResult;
@class AWSSSMGetParametersRequest;
@class AWSSSMGetParametersResult;
@class AWSSSMGetPatchBaselineForPatchGroupRequest;
@class AWSSSMGetPatchBaselineForPatchGroupResult;
@class AWSSSMGetPatchBaselineRequest;
@class AWSSSMGetPatchBaselineResult;
@class AWSSSMGetServiceSettingRequest;
@class AWSSSMGetServiceSettingResult;
@class AWSSSMInstanceAggregatedAssociationOverview;
@class AWSSSMInstanceAssociation;
@class AWSSSMInstanceAssociationOutputLocation;
@class AWSSSMInstanceAssociationOutputUrl;
@class AWSSSMInstanceAssociationStatusInfo;
@class AWSSSMInstanceInformation;
@class AWSSSMInstanceInformationFilter;
@class AWSSSMInstanceInformationStringFilter;
@class AWSSSMInstancePatchState;
@class AWSSSMInstancePatchStateFilter;
@class AWSSSMInventoryAggregator;
@class AWSSSMInventoryDeletionStatusItem;
@class AWSSSMInventoryDeletionSummary;
@class AWSSSMInventoryDeletionSummaryItem;
@class AWSSSMInventoryFilter;
@class AWSSSMInventoryGroup;
@class AWSSSMInventoryItem;
@class AWSSSMInventoryItemAttribute;
@class AWSSSMInventoryItemSchema;
@class AWSSSMInventoryResultEntity;
@class AWSSSMInventoryResultItem;
@class AWSSSMLabelParameterVersionRequest;
@class AWSSSMLabelParameterVersionResult;
@class AWSSSMListAssociationVersionsRequest;
@class AWSSSMListAssociationVersionsResult;
@class AWSSSMListAssociationsRequest;
@class AWSSSMListAssociationsResult;
@class AWSSSMListCommandInvocationsRequest;
@class AWSSSMListCommandInvocationsResult;
@class AWSSSMListCommandsRequest;
@class AWSSSMListCommandsResult;
@class AWSSSMListComplianceItemsRequest;
@class AWSSSMListComplianceItemsResult;
@class AWSSSMListComplianceSummariesRequest;
@class AWSSSMListComplianceSummariesResult;
@class AWSSSMListDocumentVersionsRequest;
@class AWSSSMListDocumentVersionsResult;
@class AWSSSMListDocumentsRequest;
@class AWSSSMListDocumentsResult;
@class AWSSSMListInventoryEntriesRequest;
@class AWSSSMListInventoryEntriesResult;
@class AWSSSMListResourceComplianceSummariesRequest;
@class AWSSSMListResourceComplianceSummariesResult;
@class AWSSSMListResourceDataSyncRequest;
@class AWSSSMListResourceDataSyncResult;
@class AWSSSMListTagsForResourceRequest;
@class AWSSSMListTagsForResourceResult;
@class AWSSSMLoggingInfo;
@class AWSSSMMaintenanceWindowAutomationParameters;
@class AWSSSMMaintenanceWindowExecution;
@class AWSSSMMaintenanceWindowExecutionTaskIdentity;
@class AWSSSMMaintenanceWindowExecutionTaskInvocationIdentity;
@class AWSSSMMaintenanceWindowFilter;
@class AWSSSMMaintenanceWindowIdentity;
@class AWSSSMMaintenanceWindowIdentityForTarget;
@class AWSSSMMaintenanceWindowLambdaParameters;
@class AWSSSMMaintenanceWindowRunCommandParameters;
@class AWSSSMMaintenanceWindowStepFunctionsParameters;
@class AWSSSMMaintenanceWindowTarget;
@class AWSSSMMaintenanceWindowTask;
@class AWSSSMMaintenanceWindowTaskInvocationParameters;
@class AWSSSMMaintenanceWindowTaskParameterValueExpression;
@class AWSSSMModifyDocumentPermissionRequest;
@class AWSSSMModifyDocumentPermissionResponse;
@class AWSSSMNonCompliantSummary;
@class AWSSSMNotificationConfig;
@class AWSSSMOpsAggregator;
@class AWSSSMOpsEntity;
@class AWSSSMOpsEntityItem;
@class AWSSSMOpsFilter;
@class AWSSSMOpsItem;
@class AWSSSMOpsItemDataValue;
@class AWSSSMOpsItemFilter;
@class AWSSSMOpsItemNotification;
@class AWSSSMOpsItemSummary;
@class AWSSSMOpsResultAttribute;
@class AWSSSMOutputSource;
@class AWSSSMParameter;
@class AWSSSMParameterHistory;
@class AWSSSMParameterInlinePolicy;
@class AWSSSMParameterMetadata;
@class AWSSSMParameterStringFilter;
@class AWSSSMParametersFilter;
@class AWSSSMPatch;
@class AWSSSMPatchBaselineIdentity;
@class AWSSSMPatchComplianceData;
@class AWSSSMPatchFilter;
@class AWSSSMPatchFilterGroup;
@class AWSSSMPatchGroupPatchBaselineMapping;
@class AWSSSMPatchOrchestratorFilter;
@class AWSSSMPatchRule;
@class AWSSSMPatchRuleGroup;
@class AWSSSMPatchSource;
@class AWSSSMPatchStatus;
@class AWSSSMProgressCounters;
@class AWSSSMPutComplianceItemsRequest;
@class AWSSSMPutComplianceItemsResult;
@class AWSSSMPutInventoryRequest;
@class AWSSSMPutInventoryResult;
@class AWSSSMPutParameterRequest;
@class AWSSSMPutParameterResult;
@class AWSSSMRegisterDefaultPatchBaselineRequest;
@class AWSSSMRegisterDefaultPatchBaselineResult;
@class AWSSSMRegisterPatchBaselineForPatchGroupRequest;
@class AWSSSMRegisterPatchBaselineForPatchGroupResult;
@class AWSSSMRegisterTargetWithMaintenanceWindowRequest;
@class AWSSSMRegisterTargetWithMaintenanceWindowResult;
@class AWSSSMRegisterTaskWithMaintenanceWindowRequest;
@class AWSSSMRegisterTaskWithMaintenanceWindowResult;
@class AWSSSMRelatedOpsItem;
@class AWSSSMRemoveTagsFromResourceRequest;
@class AWSSSMRemoveTagsFromResourceResult;
@class AWSSSMResetServiceSettingRequest;
@class AWSSSMResetServiceSettingResult;
@class AWSSSMResolvedTargets;
@class AWSSSMResourceComplianceSummaryItem;
@class AWSSSMResourceDataSyncAwsOrganizationsSource;
@class AWSSSMResourceDataSyncDestinationDataSharing;
@class AWSSSMResourceDataSyncItem;
@class AWSSSMResourceDataSyncOrganizationalUnit;
@class AWSSSMResourceDataSyncS3Destination;
@class AWSSSMResourceDataSyncSource;
@class AWSSSMResourceDataSyncSourceWithState;
@class AWSSSMResultAttribute;
@class AWSSSMResumeSessionRequest;
@class AWSSSMResumeSessionResponse;
@class AWSSSMS3OutputLocation;
@class AWSSSMS3OutputUrl;
@class AWSSSMScheduledWindowExecution;
@class AWSSSMSendAutomationSignalRequest;
@class AWSSSMSendAutomationSignalResult;
@class AWSSSMSendCommandRequest;
@class AWSSSMSendCommandResult;
@class AWSSSMServiceSetting;
@class AWSSSMSession;
@class AWSSSMSessionFilter;
@class AWSSSMSessionManagerOutputUrl;
@class AWSSSMSeveritySummary;
@class AWSSSMStartAssociationsOnceRequest;
@class AWSSSMStartAssociationsOnceResult;
@class AWSSSMStartAutomationExecutionRequest;
@class AWSSSMStartAutomationExecutionResult;
@class AWSSSMStartSessionRequest;
@class AWSSSMStartSessionResponse;
@class AWSSSMStepExecution;
@class AWSSSMStepExecutionFilter;
@class AWSSSMStopAutomationExecutionRequest;
@class AWSSSMStopAutomationExecutionResult;
@class AWSSSMTag;
@class AWSSSMTarget;
@class AWSSSMTargetLocation;
@class AWSSSMTerminateSessionRequest;
@class AWSSSMTerminateSessionResponse;
@class AWSSSMUpdateAssociationRequest;
@class AWSSSMUpdateAssociationResult;
@class AWSSSMUpdateAssociationStatusRequest;
@class AWSSSMUpdateAssociationStatusResult;
@class AWSSSMUpdateDocumentDefaultVersionRequest;
@class AWSSSMUpdateDocumentDefaultVersionResult;
@class AWSSSMUpdateDocumentRequest;
@class AWSSSMUpdateDocumentResult;
@class AWSSSMUpdateMaintenanceWindowRequest;
@class AWSSSMUpdateMaintenanceWindowResult;
@class AWSSSMUpdateMaintenanceWindowTargetRequest;
@class AWSSSMUpdateMaintenanceWindowTargetResult;
@class AWSSSMUpdateMaintenanceWindowTaskRequest;
@class AWSSSMUpdateMaintenanceWindowTaskResult;
@class AWSSSMUpdateManagedInstanceRoleRequest;
@class AWSSSMUpdateManagedInstanceRoleResult;
@class AWSSSMUpdateOpsItemRequest;
@class AWSSSMUpdateOpsItemResponse;
@class AWSSSMUpdatePatchBaselineRequest;
@class AWSSSMUpdatePatchBaselineResult;
@class AWSSSMUpdateResourceDataSyncRequest;
@class AWSSSMUpdateResourceDataSyncResult;
@class AWSSSMUpdateServiceSettingRequest;
@class AWSSSMUpdateServiceSettingResult;

/**
 <p>Information includes the AWS account ID where the current document is shared and the version shared with that account.</p>
 */
@interface AWSSSMAccountSharingInfo : AWSModel


/**
 <p>The AWS account ID where the current document is shared.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accountId;

/**
 <p>The version of the current document shared with the account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sharedDocumentVersion;

@end

/**
 <p>An activation registers one or more on-premises servers or virtual machines (VMs) with AWS so that you can configure those servers or VMs using Run Command. A server or VM that has been registered with AWS is called a managed instance.</p>
 */
@interface AWSSSMActivation : AWSModel


/**
 <p>The ID created by Systems Manager when you submitted the activation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable activationId;

/**
 <p>The date the activation was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdDate;

/**
 <p>A name for the managed instance when it is created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable defaultInstanceName;

/**
 <p>A user defined description of the activation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The date when this activation can no longer be used to register managed instances.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable expirationDate;

/**
 <p>Whether or not the activation is expired.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable expired;

/**
 <p>The Amazon Identity and Access Management (IAM) role to assign to the managed instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable iamRole;

/**
 <p>The maximum number of managed instances that can be registered using this activation.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable registrationLimit;

/**
 <p>The number of managed instances already registered with this activation.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable registrationsCount;

/**
 <p>Tags assigned to the activation.</p>
 */
@property (nonatomic, strong) NSArray<AWSSSMTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSSSMAddTagsToResourceRequest : AWSRequest


/**
 <p>The resource ID you want to tag.</p><p>Use the ID of the resource. Here are some examples:</p><p>ManagedInstance: mi-012345abcde</p><p>MaintenanceWindow: mw-012345abcde</p><p>PatchBaseline: pb-012345abcde</p><p>For the Document and Parameter values, use the name of the resource.</p><note><p>The ManagedInstance type for this API action is only for on-premises managed instances. You must specify the name of the managed instance in the following format: mi-ID_number. For example, mi-1a2b3c4d5e6f.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable resourceId;

/**
 <p>Specifies the type of resource you are tagging.</p><note><p>The ManagedInstance type for this API action is for on-premises managed instances. You must specify the name of the managed instance in the following format: mi-ID_number. For example, mi-1a2b3c4d5e6f.</p></note>
 */
@property (nonatomic, assign) AWSSSMResourceTypeForTagging resourceType;

/**
 <p> One or more tags. The value parameter is required, but if you don't want the tag to have a value, specify the parameter with no value, and we set the value to an empty string. </p><important><p>Do not enter personally identifiable information in this field.</p></important>
 */
@property (nonatomic, strong) NSArray<AWSSSMTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSSSMAddTagsToResourceResult : AWSModel


@end

/**
 <p>Describes an association of a Systems Manager document and an instance.</p>
 */
@interface AWSSSMAssociation : AWSModel


/**
 <p>The ID created by the system when you create an association. An association is a binding between a document and a set of targets with a schedule.</p>
 */
@property (nonatomic, strong) NSString * _Nullable associationId;

/**
 <p>The association name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable associationName;

/**
 <p>The association version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable associationVersion;

/**
 <p>The version of the document used in the association.</p>
 */
@property (nonatomic, strong) NSString * _Nullable documentVersion;

/**
 <p>The ID of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The date on which the association was last run.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastExecutionDate;

/**
 <p>The name of the Systems Manager document.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>Information about the association.</p>
 */
@property (nonatomic, strong) AWSSSMAssociationOverview * _Nullable overview;

/**
 <p>A cron expression that specifies a schedule when the association runs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable scheduleExpression;

/**
 <p>The instances targeted by the request to create an association. </p>
 */
@property (nonatomic, strong) NSArray<AWSSSMTarget *> * _Nullable targets;

@end

/**
 <p>Describes the parameters for a document.</p>
 */
@interface AWSSSMAssociationDescription : AWSModel


/**
 <p>By default, when you create a new associations, the system runs it immediately after it is created and then according to the schedule you specified. Specify this option if you don't want an association to run immediately after you create it.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable applyOnlyAtCronInterval;

/**
 <p>The association ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable associationId;

/**
 <p>The association name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable associationName;

/**
 <p>The association version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable associationVersion;

/**
 <p>Specify the target for the association. This target is required for associations that use an Automation document and target resources by using rate controls.</p>
 */
@property (nonatomic, strong) NSString * _Nullable automationTargetParameterName;

/**
 <p>The severity level that is assigned to the association.</p>
 */
@property (nonatomic, assign) AWSSSMAssociationComplianceSeverity complianceSeverity;

/**
 <p>The date when the association was made.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable date;

/**
 <p>The document version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable documentVersion;

/**
 <p>The ID of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The date on which the association was last run.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastExecutionDate;

/**
 <p>The last date on which the association was successfully run.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastSuccessfulExecutionDate;

/**
 <p>The date when the association was last updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdateAssociationDate;

/**
 <p>The maximum number of targets allowed to run the association at the same time. You can specify a number, for example 10, or a percentage of the target set, for example 10%. The default value is 100%, which means all targets run the association at the same time.</p><p>If a new instance starts and attempts to run an association while Systems Manager is running MaxConcurrency associations, the association is allowed to run. During the next association interval, the new instance will process its association within the limit specified for MaxConcurrency.</p>
 */
@property (nonatomic, strong) NSString * _Nullable maxConcurrency;

/**
 <p>The number of errors that are allowed before the system stops sending requests to run the association on additional targets. You can specify either an absolute number of errors, for example 10, or a percentage of the target set, for example 10%. If you specify 3, for example, the system stops sending requests when the fourth error is received. If you specify 0, then the system stops sending requests after the first error is returned. If you run an association on 50 instances and set MaxError to 10%, then the system stops sending the request when the sixth error is received.</p><p>Executions that are already running an association when MaxErrors is reached are allowed to complete, but some of these executions may fail as well. If you need to ensure that there won't be more than max-errors failed executions, set MaxConcurrency to 1 so that executions proceed one at a time.</p>
 */
@property (nonatomic, strong) NSString * _Nullable maxErrors;

/**
 <p>The name of the Systems Manager document.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>An S3 bucket where you want to store the output details of the request.</p>
 */
@property (nonatomic, strong) AWSSSMInstanceAssociationOutputLocation * _Nullable outputLocation;

/**
 <p>Information about the association.</p>
 */
@property (nonatomic, strong) AWSSSMAssociationOverview * _Nullable overview;

/**
 <p>A description of the parameters for a document. </p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSArray<NSString *> *> * _Nullable parameters;

/**
 <p>A cron expression that specifies a schedule when the association runs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable scheduleExpression;

/**
 <p>The association status.</p>
 */
@property (nonatomic, strong) AWSSSMAssociationStatus * _Nullable status;

/**
 <p>The mode for generating association compliance. You can specify <code>AUTO</code> or <code>MANUAL</code>. In <code>AUTO</code> mode, the system uses the status of the association execution to determine the compliance status. If the association execution runs successfully, then the association is <code>COMPLIANT</code>. If the association execution doesn't run successfully, the association is <code>NON-COMPLIANT</code>.</p><p>In <code>MANUAL</code> mode, you must specify the <code>AssociationId</code> as a parameter for the <a>PutComplianceItems</a> API action. In this case, compliance data is not managed by State Manager. It is managed by your direct call to the <a>PutComplianceItems</a> API action.</p><p>By default, all associations use <code>AUTO</code> mode.</p>
 */
@property (nonatomic, assign) AWSSSMAssociationSyncCompliance syncCompliance;

/**
 <p>The instances targeted by the request. </p>
 */
@property (nonatomic, strong) NSArray<AWSSSMTarget *> * _Nullable targets;

@end

/**
 <p>Includes information about the specified association.</p>
 */
@interface AWSSSMAssociationExecution : AWSModel


/**
 <p>The association ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable associationId;

/**
 <p>The association version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable associationVersion;

/**
 <p>The time the execution started.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdTime;

/**
 <p>Detailed status information about the execution.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detailedStatus;

/**
 <p>The execution ID for the association.</p>
 */
@property (nonatomic, strong) NSString * _Nullable executionId;

/**
 <p>The date of the last execution.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastExecutionDate;

/**
 <p>An aggregate status of the resources in the execution based on the status type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceCountByStatus;

/**
 <p>The status of the association execution.</p>
 */
@property (nonatomic, strong) NSString * _Nullable status;

@end

/**
 <p>Filters used in the request.</p>
 Required parameters: [Key, Value, Type]
 */
@interface AWSSSMAssociationExecutionFilter : AWSModel


/**
 <p>The key value used in the request.</p>
 */
@property (nonatomic, assign) AWSSSMAssociationExecutionFilterKey key;

/**
 <p>The filter type specified in the request.</p>
 */
@property (nonatomic, assign) AWSSSMAssociationFilterOperatorType types;

/**
 <p>The value specified for the key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 <p>Includes information about the specified association execution.</p>
 */
@interface AWSSSMAssociationExecutionTarget : AWSModel


/**
 <p>The association ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable associationId;

/**
 <p>The association version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable associationVersion;

/**
 <p>Detailed information about the execution status.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detailedStatus;

/**
 <p>The execution ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable executionId;

/**
 <p>The date of the last execution.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastExecutionDate;

/**
 <p>The location where the association details are saved.</p>
 */
@property (nonatomic, strong) AWSSSMOutputSource * _Nullable outputSource;

/**
 <p>The resource ID, for example, the instance ID where the association ran.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceId;

/**
 <p>The resource type, for example, instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceType;

/**
 <p>The association execution status.</p>
 */
@property (nonatomic, strong) NSString * _Nullable status;

@end

/**
 <p>Filters for the association execution.</p>
 Required parameters: [Key, Value]
 */
@interface AWSSSMAssociationExecutionTargetsFilter : AWSModel


/**
 <p>The key value used in the request.</p>
 */
@property (nonatomic, assign) AWSSSMAssociationExecutionTargetsFilterKey key;

/**
 <p>The value specified for the key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 <p>Describes a filter.</p>
 Required parameters: [key, value]
 */
@interface AWSSSMAssociationFilter : AWSModel


/**
 <p>The name of the filter.</p>
 */
@property (nonatomic, assign) AWSSSMAssociationFilterKey key;

/**
 <p>The filter value.</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 <p>Information about the association.</p>
 */
@interface AWSSSMAssociationOverview : AWSModel


/**
 <p>Returns the number of targets for the association status. For example, if you created an association with two instances, and one of them was successful, this would return the count of instances by status.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSNumber *> * _Nullable associationStatusAggregatedCount;

/**
 <p>A detailed status of the association.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detailedStatus;

/**
 <p>The status of the association. Status can be: Pending, Success, or Failed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable status;

@end

/**
 <p>Describes an association status.</p>
 Required parameters: [Date, Name, Message]
 */
@interface AWSSSMAssociationStatus : AWSModel


/**
 <p>A user-defined string.</p>
 */
@property (nonatomic, strong) NSString * _Nullable additionalInfo;

/**
 <p>The date when the status changed.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable date;

/**
 <p>The reason for the status.</p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

/**
 <p>The status.</p>
 */
@property (nonatomic, assign) AWSSSMAssociationStatusName name;

@end

/**
 <p>Information about the association version.</p>
 */
@interface AWSSSMAssociationVersionInfo : AWSModel


/**
 <p>By default, when you create a new associations, the system runs it immediately after it is created and then according to the schedule you specified. Specify this option if you don't want an association to run immediately after you create it.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable applyOnlyAtCronInterval;

/**
 <p>The ID created by the system when the association was created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable associationId;

/**
 <p>The name specified for the association version when the association version was created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable associationName;

/**
 <p>The association version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable associationVersion;

/**
 <p>The severity level that is assigned to the association.</p>
 */
@property (nonatomic, assign) AWSSSMAssociationComplianceSeverity complianceSeverity;

/**
 <p>The date the association version was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdDate;

/**
 <p>The version of a Systems Manager document used when the association version was created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable documentVersion;

/**
 <p>The maximum number of targets allowed to run the association at the same time. You can specify a number, for example 10, or a percentage of the target set, for example 10%. The default value is 100%, which means all targets run the association at the same time.</p><p>If a new instance starts and attempts to run an association while Systems Manager is running MaxConcurrency associations, the association is allowed to run. During the next association interval, the new instance will process its association within the limit specified for MaxConcurrency.</p>
 */
@property (nonatomic, strong) NSString * _Nullable maxConcurrency;

/**
 <p>The number of errors that are allowed before the system stops sending requests to run the association on additional targets. You can specify either an absolute number of errors, for example 10, or a percentage of the target set, for example 10%. If you specify 3, for example, the system stops sending requests when the fourth error is received. If you specify 0, then the system stops sending requests after the first error is returned. If you run an association on 50 instances and set MaxError to 10%, then the system stops sending the request when the sixth error is received.</p><p>Executions that are already running an association when MaxErrors is reached are allowed to complete, but some of these executions may fail as well. If you need to ensure that there won't be more than max-errors failed executions, set MaxConcurrency to 1 so that executions proceed one at a time.</p>
 */
@property (nonatomic, strong) NSString * _Nullable maxErrors;

/**
 <p>The name specified when the association was created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The location in Amazon S3 specified for the association when the association version was created.</p>
 */
@property (nonatomic, strong) AWSSSMInstanceAssociationOutputLocation * _Nullable outputLocation;

/**
 <p>Parameters specified when the association version was created.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSArray<NSString *> *> * _Nullable parameters;

/**
 <p>The cron or rate schedule specified for the association when the association version was created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable scheduleExpression;

/**
 <p>The mode for generating association compliance. You can specify <code>AUTO</code> or <code>MANUAL</code>. In <code>AUTO</code> mode, the system uses the status of the association execution to determine the compliance status. If the association execution runs successfully, then the association is <code>COMPLIANT</code>. If the association execution doesn't run successfully, the association is <code>NON-COMPLIANT</code>.</p><p>In <code>MANUAL</code> mode, you must specify the <code>AssociationId</code> as a parameter for the <a>PutComplianceItems</a> API action. In this case, compliance data is not managed by State Manager. It is managed by your direct call to the <a>PutComplianceItems</a> API action.</p><p>By default, all associations use <code>AUTO</code> mode.</p>
 */
@property (nonatomic, assign) AWSSSMAssociationSyncCompliance syncCompliance;

/**
 <p>The targets specified for the association when the association version was created. </p>
 */
@property (nonatomic, strong) NSArray<AWSSSMTarget *> * _Nullable targets;

@end

/**
 <p>A structure that includes attributes that describe a document attachment.</p>
 */
@interface AWSSSMAttachmentContent : AWSModel


/**
 <p>The cryptographic hash value of the document content.</p>
 */
@property (nonatomic, strong) NSString * _Nullable hash;

/**
 <p>The hash algorithm used to calculate the hash value.</p>
 */
@property (nonatomic, assign) AWSSSMAttachmentHashType hashType;

/**
 <p>The name of an attachment.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The size of an attachment in bytes.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable size;

/**
 <p>The URL location of the attachment content.</p>
 */
@property (nonatomic, strong) NSString * _Nullable url;

@end

/**
 <p>An attribute of an attachment, such as the attachment name.</p>
 */
@interface AWSSSMAttachmentInformation : AWSModel


/**
 <p>The name of the attachment.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 <p>Identifying information about a document attachment, including the file name and a key-value pair that identifies the location of an attachment to a document.</p>
 */
@interface AWSSSMAttachmentsSource : AWSModel


/**
 <p>The key of a key-value pair that identifies the location of an attachment to a document.</p>
 */
@property (nonatomic, assign) AWSSSMAttachmentsSourceKey key;

/**
 <p>The name of the document attachment file.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The value of a key-value pair that identifies the location of an attachment to a document. The format for <b>Value</b> depends on the type of key you specify.</p><ul><li><p>For the key <i>SourceUrl</i>, the value is an S3 bucket location. For example:</p><p><code>"Values": [ "s3://my-bucket/my-folder" ]</code></p></li><li><p>For the key <i>S3FileUrl</i>, the value is a file in an S3 bucket. For example:</p><p><code>"Values": [ "s3://my-bucket/my-folder/my-file.py" ]</code></p></li><li><p>For the key <i>AttachmentReference</i>, the value is constructed from the name of another SSM document in your account, a version number of that document, and a file attached to that document version that you want to reuse. For example:</p><p><code>"Values": [ "MyOtherDocument/3/my-other-file.py" ]</code></p><p>However, if the SSM document is shared with you from another account, the full SSM document ARN must be specified instead of the document name only. For example:</p><p><code>"Values": [ "arn:aws:ssm:us-east-2:111122223333:document/OtherAccountDocument/3/their-file.py" ]</code></p></li></ul>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable values;

@end

/**
 <p>Detailed information about the current state of an individual Automation execution.</p>
 */
@interface AWSSSMAutomationExecution : AWSModel


/**
 <p>The execution ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable automationExecutionId;

/**
 <p>The execution status of the Automation.</p>
 */
@property (nonatomic, assign) AWSSSMAutomationExecutionStatus automationExecutionStatus;

/**
 <p>The action of the step that is currently running.</p>
 */
@property (nonatomic, strong) NSString * _Nullable currentAction;

/**
 <p>The name of the step that is currently running.</p>
 */
@property (nonatomic, strong) NSString * _Nullable currentStepName;

/**
 <p>The name of the Automation document used during the execution.</p>
 */
@property (nonatomic, strong) NSString * _Nullable documentName;

/**
 <p>The version of the document to use during execution.</p>
 */
@property (nonatomic, strong) NSString * _Nullable documentVersion;

/**
 <p>The Amazon Resource Name (ARN) of the user who ran the automation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable executedBy;

/**
 <p>The time the execution finished.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable executionEndTime;

/**
 <p>The time the execution started.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable executionStartTime;

/**
 <p>A message describing why an execution has failed, if the status is set to Failed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable failureMessage;

/**
 <p>The MaxConcurrency value specified by the user when the execution started.</p>
 */
@property (nonatomic, strong) NSString * _Nullable maxConcurrency;

/**
 <p>The MaxErrors value specified by the user when the execution started.</p>
 */
@property (nonatomic, strong) NSString * _Nullable maxErrors;

/**
 <p>The automation execution mode.</p>
 */
@property (nonatomic, assign) AWSSSMExecutionMode mode;

/**
 <p>The list of execution outputs as defined in the automation document.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSArray<NSString *> *> * _Nullable outputs;

/**
 <p>The key-value map of execution parameters, which were supplied when calling StartAutomationExecution.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSArray<NSString *> *> * _Nullable parameters;

/**
 <p>The AutomationExecutionId of the parent automation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable parentAutomationExecutionId;

/**
 <p>An aggregate of step execution statuses displayed in the AWS Console for a multi-Region and multi-account Automation execution.</p>
 */
@property (nonatomic, strong) AWSSSMProgressCounters * _Nullable progressCounters;

/**
 <p>A list of resolved targets in the rate control execution.</p>
 */
@property (nonatomic, strong) AWSSSMResolvedTargets * _Nullable resolvedTargets;

/**
 <p>A list of details about the current state of all steps that comprise an execution. An Automation document contains a list of steps that are run in order.</p>
 */
@property (nonatomic, strong) NSArray<AWSSSMStepExecution *> * _Nullable stepExecutions;

/**
 <p>A boolean value that indicates if the response contains the full list of the Automation step executions. If true, use the DescribeAutomationStepExecutions API action to get the full list of step executions.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable stepExecutionsTruncated;

/**
 <p>The target of the execution.</p>
 */
@property (nonatomic, strong) NSString * _Nullable target;

/**
 <p>The combination of AWS Regions and/or AWS accounts where you want to run the Automation.</p>
 */
@property (nonatomic, strong) NSArray<AWSSSMTargetLocation *> * _Nullable targetLocations;

/**
 <p>The specified key-value mapping of document parameters to target resources.</p>
 */
@property (nonatomic, strong) NSArray<NSDictionary<NSString *, NSArray<NSString *> *> *> * _Nullable targetMaps;

/**
 <p>The parameter name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable targetParameterName;

/**
 <p>The specified targets.</p>
 */
@property (nonatomic, strong) NSArray<AWSSSMTarget *> * _Nullable targets;

@end

/**
 <p>A filter used to match specific automation executions. This is used to limit the scope of Automation execution information returned.</p>
 Required parameters: [Key, Values]
 */
@interface AWSSSMAutomationExecutionFilter : AWSModel


/**
 <p>One or more keys to limit the results. Valid filter keys include the following: DocumentNamePrefix, ExecutionStatus, ExecutionId, ParentExecutionId, CurrentAction, StartTimeBefore, StartTimeAfter.</p>
 */
@property (nonatomic, assign) AWSSSMAutomationExecutionFilterKey key;

/**
 <p>The values used to limit the execution information associated with the filter's key.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable values;

@end

/**
 <p>Details about a specific Automation execution.</p>
 */
@interface AWSSSMAutomationExecutionMetadata : AWSModel


/**
 <p>The execution ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable automationExecutionId;

/**
 <p>The status of the execution.</p>
 */
@property (nonatomic, assign) AWSSSMAutomationExecutionStatus automationExecutionStatus;

/**
 <p>Use this filter with <a>DescribeAutomationExecutions</a>. Specify either Local or CrossAccount. CrossAccount is an Automation that runs in multiple AWS Regions and accounts. For more information, see <a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-automation-multiple-accounts-and-regions.html">Running Automation workflows in multiple AWS Regions and accounts</a> in the <i>AWS Systems Manager User Guide</i>. </p>
 */
@property (nonatomic, assign) AWSSSMAutomationType automationType;

/**
 <p>The action of the step that is currently running.</p>
 */
@property (nonatomic, strong) NSString * _Nullable currentAction;

/**
 <p>The name of the step that is currently running.</p>
 */
@property (nonatomic, strong) NSString * _Nullable currentStepName;

/**
 <p>The name of the Automation document used during execution.</p>
 */
@property (nonatomic, strong) NSString * _Nullable documentName;

/**
 <p>The document version used during the execution.</p>
 */
@property (nonatomic, strong) NSString * _Nullable documentVersion;

/**
 <p>The IAM role ARN of the user who ran the Automation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable executedBy;

/**
 <p>The time the execution finished. This is not populated if the execution is still in progress.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable executionEndTime;

/**
 <p>The time the execution started.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable executionStartTime;

/**
 <p>The list of execution outputs as defined in the Automation document.</p>
 */
@property (nonatomic, strong) NSString * _Nullable failureMessage;

/**
 <p>An S3 bucket where execution information is stored.</p>
 */
@property (nonatomic, strong) NSString * _Nullable logFile;

/**
 <p>The MaxConcurrency value specified by the user when starting the Automation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable maxConcurrency;

/**
 <p>The MaxErrors value specified by the user when starting the Automation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable maxErrors;

/**
 <p>The Automation execution mode.</p>
 */
@property (nonatomic, assign) AWSSSMExecutionMode mode;

/**
 <p>The list of execution outputs as defined in the Automation document.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSArray<NSString *> *> * _Nullable outputs;

/**
 <p>The ExecutionId of the parent Automation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable parentAutomationExecutionId;

/**
 <p>A list of targets that resolved during the execution.</p>
 */
@property (nonatomic, strong) AWSSSMResolvedTargets * _Nullable resolvedTargets;

/**
 <p>The list of execution outputs as defined in the Automation document.</p>
 */
@property (nonatomic, strong) NSString * _Nullable target;

/**
 <p>The specified key-value mapping of document parameters to target resources.</p>
 */
@property (nonatomic, strong) NSArray<NSDictionary<NSString *, NSArray<NSString *> *> *> * _Nullable targetMaps;

/**
 <p>The list of execution outputs as defined in the Automation document.</p>
 */
@property (nonatomic, strong) NSString * _Nullable targetParameterName;

/**
 <p>The targets defined by the user when starting the Automation.</p>
 */
@property (nonatomic, strong) NSArray<AWSSSMTarget *> * _Nullable targets;

@end

/**
 <p/>
 Required parameters: [CommandId]
 */
@interface AWSSSMCancelCommandRequest : AWSRequest


/**
 <p>The ID of the command you want to cancel.</p>
 */
@property (nonatomic, strong) NSString * _Nullable commandId;

/**
 <p>(Optional) A list of instance IDs on which you want to cancel the command. If not provided, the command is canceled on every instance on which it was requested.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable instanceIds;

@end

/**
 <p>Whether or not the command was successfully canceled. There is no guarantee that a request can be canceled.</p>
 */
@interface AWSSSMCancelCommandResult : AWSModel


@end

/**
 
 */
@interface AWSSSMCancelMaintenanceWindowExecutionRequest : AWSRequest


/**
 <p>The ID of the maintenance window execution to stop.</p>
 */
@property (nonatomic, strong) NSString * _Nullable windowExecutionId;

@end

/**
 
 */
@interface AWSSSMCancelMaintenanceWindowExecutionResult : AWSModel


/**
 <p>The ID of the maintenance window execution that has been stopped.</p>
 */
@property (nonatomic, strong) NSString * _Nullable windowExecutionId;

@end

/**
 <p>Configuration options for sending command output to CloudWatch Logs.</p>
 */
@interface AWSSSMCloudWatchOutputConfig : AWSModel


/**
 <p>The name of the CloudWatch log group where you want to send command output. If you don't specify a group name, Systems Manager automatically creates a log group for you. The log group uses the following naming format: aws/ssm/<i>SystemsManagerDocumentName</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable cloudWatchLogGroupName;

/**
 <p>Enables Systems Manager to send command output to CloudWatch Logs.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable cloudWatchOutputEnabled;

@end

/**
 <p>Describes a command request.</p>
 */
@interface AWSSSMCommand : AWSModel


/**
 <p>CloudWatch Logs information where you want Systems Manager to send the command output.</p>
 */
@property (nonatomic, strong) AWSSSMCloudWatchOutputConfig * _Nullable cloudWatchOutputConfig;

/**
 <p>A unique identifier for this command.</p>
 */
@property (nonatomic, strong) NSString * _Nullable commandId;

/**
 <p>User-specified information about the command, such as a brief description of what the command should do.</p>
 */
@property (nonatomic, strong) NSString * _Nullable comment;

/**
 <p>The number of targets for which the command invocation reached a terminal state. Terminal states include the following: Success, Failed, Execution Timed Out, Delivery Timed Out, Canceled, Terminated, or Undeliverable.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable completedCount;

/**
 <p>The number of targets for which the status is Delivery Timed Out.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable deliveryTimedOutCount;

/**
 <p>The name of the document requested for execution.</p>
 */
@property (nonatomic, strong) NSString * _Nullable documentName;

/**
 <p>The SSM document version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable documentVersion;

/**
 <p>The number of targets for which the status is Failed or Execution Timed Out.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable errorCount;

/**
 <p>If this time is reached and the command has not already started running, it will not run. Calculated based on the ExpiresAfter user input provided as part of the SendCommand API.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable expiresAfter;

/**
 <p>The instance IDs against which this command was requested.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable instanceIds;

/**
 <p>The maximum number of instances that are allowed to run the command at the same time. You can specify a number of instances, such as 10, or a percentage of instances, such as 10%. The default value is 50. For more information about how to use MaxConcurrency, see <a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/run-command.html">Running commands using Systems Manager Run Command</a> in the <i>AWS Systems Manager User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable maxConcurrency;

/**
 <p>The maximum number of errors allowed before the system stops sending the command to additional targets. You can specify a number of errors, such as 10, or a percentage or errors, such as 10%. The default value is 0. For more information about how to use MaxErrors, see <a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/run-command.html">Running commands using Systems Manager Run Command</a> in the <i>AWS Systems Manager User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable maxErrors;

/**
 <p>Configurations for sending notifications about command status changes. </p>
 */
@property (nonatomic, strong) AWSSSMNotificationConfig * _Nullable notificationConfig;

/**
 <p>The S3 bucket where the responses to the command executions should be stored. This was requested when issuing the command.</p>
 */
@property (nonatomic, strong) NSString * _Nullable outputS3BucketName;

/**
 <p>The S3 directory path inside the bucket where the responses to the command executions should be stored. This was requested when issuing the command.</p>
 */
@property (nonatomic, strong) NSString * _Nullable outputS3KeyPrefix;

/**
 <p>(Deprecated) You can no longer specify this parameter. The system ignores it. Instead, Systems Manager automatically determines the Region of the S3 bucket.</p>
 */
@property (nonatomic, strong) NSString * _Nullable outputS3Region;

/**
 <p>The parameter values to be inserted in the document when running the command.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSArray<NSString *> *> * _Nullable parameters;

/**
 <p>The date and time the command was requested.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable requestedDateTime;

/**
 <p>The IAM service role that Run Command uses to act on your behalf when sending notifications about command status changes. </p>
 */
@property (nonatomic, strong) NSString * _Nullable serviceRole;

/**
 <p>The status of the command.</p>
 */
@property (nonatomic, assign) AWSSSMCommandStatus status;

/**
 <p>A detailed status of the command execution. StatusDetails includes more information than Status because it includes states resulting from error and concurrency control parameters. StatusDetails can show different results than Status. For more information about these statuses, see <a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/monitor-commands.html">Understanding command statuses</a> in the <i>AWS Systems Manager User Guide</i>. StatusDetails can be one of the following values:</p><ul><li><p>Pending: The command has not been sent to any instances.</p></li><li><p>In Progress: The command has been sent to at least one instance but has not reached a final state on all instances.</p></li><li><p>Success: The command successfully ran on all invocations. This is a terminal state.</p></li><li><p>Delivery Timed Out: The value of MaxErrors or more command invocations shows a status of Delivery Timed Out. This is a terminal state.</p></li><li><p>Execution Timed Out: The value of MaxErrors or more command invocations shows a status of Execution Timed Out. This is a terminal state.</p></li><li><p>Failed: The value of MaxErrors or more command invocations shows a status of Failed. This is a terminal state.</p></li><li><p>Incomplete: The command was attempted on all instances and one or more invocations does not have a value of Success but not enough invocations failed for the status to be Failed. This is a terminal state.</p></li><li><p>Canceled: The command was terminated before it was completed. This is a terminal state.</p></li><li><p>Rate Exceeded: The number of instances targeted by the command exceeded the account limit for pending invocations. The system has canceled the command before running it on any instance. This is a terminal state.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable statusDetails;

/**
 <p>The number of targets for the command.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable targetCount;

/**
 <p>An array of search criteria that targets instances using a Key,Value combination that you specify. Targets is required if you don't provide one or more instance IDs in the call.</p>
 */
@property (nonatomic, strong) NSArray<AWSSSMTarget *> * _Nullable targets;

/**
 <p>The <code>TimeoutSeconds</code> value specified for a command.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable timeoutSeconds;

@end

/**
 <p>Describes a command filter.</p><note><p>An instance ID can't be specified when a command status is <code>Pending</code> because the command hasn't run on the instance yet.</p></note>
 Required parameters: [key, value]
 */
@interface AWSSSMCommandFilter : AWSModel


/**
 <p>The name of the filter.</p>
 */
@property (nonatomic, assign) AWSSSMCommandFilterKey key;

/**
 <p>The filter value. Valid values for each filter key are as follows:</p><ul><li><p><b>InvokedAfter</b>: Specify a timestamp to limit your results. For example, specify <code>2018-07-07T00:00:00Z</code> to see a list of command executions occurring July 7, 2018, and later.</p></li><li><p><b>InvokedBefore</b>: Specify a timestamp to limit your results. For example, specify <code>2018-07-07T00:00:00Z</code> to see a list of command executions from before July 7, 2018.</p></li><li><p><b>Status</b>: Specify a valid command status to see a list of all command executions with that status. Status values you can specify include:</p><ul><li><p><code>Pending</code></p></li><li><p><code>InProgress</code></p></li><li><p><code>Success</code></p></li><li><p><code>Cancelled</code></p></li><li><p><code>Failed</code></p></li><li><p><code>TimedOut</code></p></li><li><p><code>Cancelling</code></p></li></ul></li><li><p><b>DocumentName</b>: Specify name of the SSM document for which you want to see command execution results. For example, specify <code>AWS-RunPatchBaseline</code> to see command executions that used this SSM document to perform security patching operations on instances. </p></li><li><p><b>ExecutionStage</b>: Specify one of the following values:</p><ul><li><p><code>Executing</code>: Returns a list of command executions that are currently still running.</p></li><li><p><code>Complete</code>: Returns a list of command executions that have already completed. </p></li></ul></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 <p>An invocation is copy of a command sent to a specific instance. A command can apply to one or more instances. A command invocation applies to one instance. For example, if a user runs SendCommand against three instances, then a command invocation is created for each requested instance ID. A command invocation returns status and detail information about a command you ran. </p>
 */
@interface AWSSSMCommandInvocation : AWSModel


/**
 <p>CloudWatch Logs information where you want Systems Manager to send the command output.</p>
 */
@property (nonatomic, strong) AWSSSMCloudWatchOutputConfig * _Nullable cloudWatchOutputConfig;

/**
 <p>The command against which this invocation was requested.</p>
 */
@property (nonatomic, strong) NSString * _Nullable commandId;

/**
 
 */
@property (nonatomic, strong) NSArray<AWSSSMCommandPlugin *> * _Nullable commandPlugins;

/**
 <p>User-specified information about the command, such as a brief description of what the command should do.</p>
 */
@property (nonatomic, strong) NSString * _Nullable comment;

/**
 <p>The document name that was requested for execution.</p>
 */
@property (nonatomic, strong) NSString * _Nullable documentName;

/**
 <p>The SSM document version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable documentVersion;

/**
 <p>The instance ID in which this invocation was requested.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The name of the invocation target. For EC2 instances this is the value for the aws:Name tag. For on-premises instances, this is the name of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceName;

/**
 <p>Configurations for sending notifications about command status changes on a per instance basis.</p>
 */
@property (nonatomic, strong) AWSSSMNotificationConfig * _Nullable notificationConfig;

/**
 <p>The time and date the request was sent to this instance.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable requestedDateTime;

/**
 <p>The IAM service role that Run Command uses to act on your behalf when sending notifications about command status changes on a per instance basis.</p>
 */
@property (nonatomic, strong) NSString * _Nullable serviceRole;

/**
 <p>The URL to the plugin's StdErr file in Amazon S3, if the S3 bucket was defined for the parent command. For an invocation, StandardErrorUrl is populated if there is just one plugin defined for the command, and the S3 bucket was defined for the command.</p>
 */
@property (nonatomic, strong) NSString * _Nullable standardErrorUrl;

/**
 <p>The URL to the plugin's StdOut file in Amazon S3, if the S3 bucket was defined for the parent command. For an invocation, StandardOutputUrl is populated if there is just one plugin defined for the command, and the S3 bucket was defined for the command.</p>
 */
@property (nonatomic, strong) NSString * _Nullable standardOutputUrl;

/**
 <p>Whether or not the invocation succeeded, failed, or is pending.</p>
 */
@property (nonatomic, assign) AWSSSMCommandInvocationStatus status;

/**
 <p>A detailed status of the command execution for each invocation (each instance targeted by the command). StatusDetails includes more information than Status because it includes states resulting from error and concurrency control parameters. StatusDetails can show different results than Status. For more information about these statuses, see <a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/monitor-commands.html">Understanding command statuses</a> in the <i>AWS Systems Manager User Guide</i>. StatusDetails can be one of the following values:</p><ul><li><p>Pending: The command has not been sent to the instance.</p></li><li><p>In Progress: The command has been sent to the instance but has not reached a terminal state.</p></li><li><p>Success: The execution of the command or plugin was successfully completed. This is a terminal state.</p></li><li><p>Delivery Timed Out: The command was not delivered to the instance before the delivery timeout expired. Delivery timeouts do not count against the parent command's MaxErrors limit, but they do contribute to whether the parent command status is Success or Incomplete. This is a terminal state.</p></li><li><p>Execution Timed Out: Command execution started on the instance, but the execution was not complete before the execution timeout expired. Execution timeouts count against the MaxErrors limit of the parent command. This is a terminal state.</p></li><li><p>Failed: The command was not successful on the instance. For a plugin, this indicates that the result code was not zero. For a command invocation, this indicates that the result code for one or more plugins was not zero. Invocation failures count against the MaxErrors limit of the parent command. This is a terminal state.</p></li><li><p>Canceled: The command was terminated before it was completed. This is a terminal state.</p></li><li><p>Undeliverable: The command can't be delivered to the instance. The instance might not exist or might not be responding. Undeliverable invocations don't count against the parent command's MaxErrors limit and don't contribute to whether the parent command status is Success or Incomplete. This is a terminal state.</p></li><li><p>Terminated: The parent command exceeded its MaxErrors limit and subsequent command invocations were canceled by the system. This is a terminal state.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable statusDetails;

/**
 <p> Gets the trace output sent by the agent. </p>
 */
@property (nonatomic, strong) NSString * _Nullable traceOutput;

@end

/**
 <p>Describes plugin details.</p>
 */
@interface AWSSSMCommandPlugin : AWSModel


/**
 <p>The name of the plugin. Must be one of the following: aws:updateAgent, aws:domainjoin, aws:applications, aws:runPowerShellScript, aws:psmodule, aws:cloudWatch, aws:runShellScript, or aws:updateSSMAgent. </p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>Output of the plugin execution.</p>
 */
@property (nonatomic, strong) NSString * _Nullable output;

/**
 <p>The S3 bucket where the responses to the command executions should be stored. This was requested when issuing the command. For example, in the following response:</p><p> test_folder/ab19cb99-a030-46dd-9dfc-8eSAMPLEPre-Fix/i-1234567876543/awsrunShellScript </p><p>test_folder is the name of the S3 bucket;</p><p>ab19cb99-a030-46dd-9dfc-8eSAMPLEPre-Fix is the name of the S3 prefix;</p><p>i-1234567876543 is the instance ID;</p><p>awsrunShellScript is the name of the plugin.</p>
 */
@property (nonatomic, strong) NSString * _Nullable outputS3BucketName;

/**
 <p>The S3 directory path inside the bucket where the responses to the command executions should be stored. This was requested when issuing the command. For example, in the following response:</p><p> test_folder/ab19cb99-a030-46dd-9dfc-8eSAMPLEPre-Fix/i-1234567876543/awsrunShellScript </p><p>test_folder is the name of the S3 bucket;</p><p>ab19cb99-a030-46dd-9dfc-8eSAMPLEPre-Fix is the name of the S3 prefix;</p><p>i-1234567876543 is the instance ID;</p><p>awsrunShellScript is the name of the plugin.</p>
 */
@property (nonatomic, strong) NSString * _Nullable outputS3KeyPrefix;

/**
 <p>(Deprecated) You can no longer specify this parameter. The system ignores it. Instead, Systems Manager automatically determines the S3 bucket region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable outputS3Region;

/**
 <p>A numeric response code generated after running the plugin. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable responseCode;

/**
 <p>The time the plugin stopped running. Could stop prematurely if, for example, a cancel command was sent. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable responseFinishDateTime;

/**
 <p>The time the plugin started running. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable responseStartDateTime;

/**
 <p>The URL for the complete text written by the plugin to stderr. If execution is not yet complete, then this string is empty.</p>
 */
@property (nonatomic, strong) NSString * _Nullable standardErrorUrl;

/**
 <p>The URL for the complete text written by the plugin to stdout in Amazon S3. If the S3 bucket for the command was not specified, then this string is empty.</p>
 */
@property (nonatomic, strong) NSString * _Nullable standardOutputUrl;

/**
 <p>The status of this plugin. You can run a document with multiple plugins.</p>
 */
@property (nonatomic, assign) AWSSSMCommandPluginStatus status;

/**
 <p>A detailed status of the plugin execution. StatusDetails includes more information than Status because it includes states resulting from error and concurrency control parameters. StatusDetails can show different results than Status. For more information about these statuses, see <a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/monitor-commands.html">Understanding command statuses</a> in the <i>AWS Systems Manager User Guide</i>. StatusDetails can be one of the following values:</p><ul><li><p>Pending: The command has not been sent to the instance.</p></li><li><p>In Progress: The command has been sent to the instance but has not reached a terminal state.</p></li><li><p>Success: The execution of the command or plugin was successfully completed. This is a terminal state.</p></li><li><p>Delivery Timed Out: The command was not delivered to the instance before the delivery timeout expired. Delivery timeouts do not count against the parent command's MaxErrors limit, but they do contribute to whether the parent command status is Success or Incomplete. This is a terminal state.</p></li><li><p>Execution Timed Out: Command execution started on the instance, but the execution was not complete before the execution timeout expired. Execution timeouts count against the MaxErrors limit of the parent command. This is a terminal state.</p></li><li><p>Failed: The command was not successful on the instance. For a plugin, this indicates that the result code was not zero. For a command invocation, this indicates that the result code for one or more plugins was not zero. Invocation failures count against the MaxErrors limit of the parent command. This is a terminal state.</p></li><li><p>Canceled: The command was terminated before it was completed. This is a terminal state.</p></li><li><p>Undeliverable: The command can't be delivered to the instance. The instance might not exist, or it might not be responding. Undeliverable invocations don't count against the parent command's MaxErrors limit, and they don't contribute to whether the parent command status is Success or Incomplete. This is a terminal state.</p></li><li><p>Terminated: The parent command exceeded its MaxErrors limit and subsequent command invocations were canceled by the system. This is a terminal state.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable statusDetails;

@end

/**
 <p>A summary of the call execution that includes an execution ID, the type of execution (for example, <code>Command</code>), and the date/time of the execution using a datetime object that is saved in the following format: yyyy-MM-dd'T'HH:mm:ss'Z'.</p>
 Required parameters: [ExecutionTime]
 */
@interface AWSSSMComplianceExecutionSummary : AWSModel


/**
 <p>An ID created by the system when <code>PutComplianceItems</code> was called. For example, <code>CommandID</code> is a valid execution ID. You can use this ID in subsequent calls.</p>
 */
@property (nonatomic, strong) NSString * _Nullable executionId;

/**
 <p>The time the execution ran as a datetime object that is saved in the following format: yyyy-MM-dd'T'HH:mm:ss'Z'.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable executionTime;

/**
 <p>The type of execution. For example, <code>Command</code> is a valid execution type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable executionType;

@end

/**
 <p>Information about the compliance as defined by the resource type. For example, for a patch resource type, <code>Items</code> includes information about the PatchSeverity, Classification, and so on.</p>
 */
@interface AWSSSMComplianceItem : AWSModel


/**
 <p>The compliance type. For example, Association (for a State Manager association), Patch, or Custom:<code>string</code> are all valid compliance types.</p>
 */
@property (nonatomic, strong) NSString * _Nullable complianceType;

/**
 <p>A "Key": "Value" tag combination for the compliance item.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable details;

/**
 <p>A summary for the compliance item. The summary includes an execution ID, the execution type (for example, command), and the execution time.</p>
 */
@property (nonatomic, strong) AWSSSMComplianceExecutionSummary * _Nullable executionSummary;

/**
 <p>An ID for the compliance item. For example, if the compliance item is a Windows patch, the ID could be the number of the KB article; for example: KB4010320.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>An ID for the resource. For a managed instance, this is the instance ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceId;

/**
 <p>The type of resource. <code>ManagedInstance</code> is currently the only supported resource type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceType;

/**
 <p>The severity of the compliance status. Severity can be one of the following: Critical, High, Medium, Low, Informational, Unspecified.</p>
 */
@property (nonatomic, assign) AWSSSMComplianceSeverity severity;

/**
 <p>The status of the compliance item. An item is either COMPLIANT or NON_COMPLIANT.</p>
 */
@property (nonatomic, assign) AWSSSMComplianceStatus status;

/**
 <p>A title for the compliance item. For example, if the compliance item is a Windows patch, the title could be the title of the KB article for the patch; for example: Security Update for Active Directory Federation Services.</p>
 */
@property (nonatomic, strong) NSString * _Nullable title;

@end

/**
 <p>Information about a compliance item.</p>
 Required parameters: [Severity, Status]
 */
@interface AWSSSMComplianceItemEntry : AWSModel


/**
 <p>A "Key": "Value" tag combination for the compliance item.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable details;

/**
 <p>The compliance item ID. For example, if the compliance item is a Windows patch, the ID could be the number of the KB article.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The severity of the compliance status. Severity can be one of the following: Critical, High, Medium, Low, Informational, Unspecified.</p>
 */
@property (nonatomic, assign) AWSSSMComplianceSeverity severity;

/**
 <p>The status of the compliance item. An item is either COMPLIANT or NON_COMPLIANT.</p>
 */
@property (nonatomic, assign) AWSSSMComplianceStatus status;

/**
 <p>The title of the compliance item. For example, if the compliance item is a Windows patch, the title could be the title of the KB article for the patch; for example: Security Update for Active Directory Federation Services. </p>
 */
@property (nonatomic, strong) NSString * _Nullable title;

@end

/**
 <p>One or more filters. Use a filter to return a more specific list of results.</p>
 */
@interface AWSSSMComplianceStringFilter : AWSModel


/**
 <p>The name of the filter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>The type of comparison that should be performed for the value: Equal, NotEqual, BeginWith, LessThan, or GreaterThan.</p>
 */
@property (nonatomic, assign) AWSSSMComplianceQueryOperatorType types;

/**
 <p>The value for which to search.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable values;

@end

/**
 <p>A summary of compliance information by compliance type.</p>
 */
@interface AWSSSMComplianceSummaryItem : AWSModel


/**
 <p>The type of compliance item. For example, the compliance type can be Association, Patch, or Custom:string.</p>
 */
@property (nonatomic, strong) NSString * _Nullable complianceType;

/**
 <p>A list of COMPLIANT items for the specified compliance type.</p>
 */
@property (nonatomic, strong) AWSSSMCompliantSummary * _Nullable compliantSummary;

/**
 <p>A list of NON_COMPLIANT items for the specified compliance type.</p>
 */
@property (nonatomic, strong) AWSSSMNonCompliantSummary * _Nullable nonCompliantSummary;

@end

/**
 <p>A summary of resources that are compliant. The summary is organized according to the resource count for each compliance type.</p>
 */
@interface AWSSSMCompliantSummary : AWSModel


/**
 <p>The total number of resources that are compliant.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable compliantCount;

/**
 <p>A summary of the compliance severity by compliance type.</p>
 */
@property (nonatomic, strong) AWSSSMSeveritySummary * _Nullable severitySummary;

@end

/**
 
 */
@interface AWSSSMCreateActivationRequest : AWSRequest


/**
 <p>The name of the registered, managed instance as it will appear in the Systems Manager console or when you use the AWS command line tools to list Systems Manager resources.</p><important><p>Do not enter personally identifiable information in this field.</p></important>
 */
@property (nonatomic, strong) NSString * _Nullable defaultInstanceName;

/**
 <p>A user-defined description of the resource that you want to register with Systems Manager. </p><important><p>Do not enter personally identifiable information in this field.</p></important>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The date by which this activation request should expire. The default value is 24 hours.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable expirationDate;

/**
 <p>The Amazon Identity and Access Management (IAM) role that you want to assign to the managed instance. This IAM role must provide AssumeRole permissions for the Systems Manager service principal <code>ssm.amazonaws.com</code>. For more information, see <a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/sysman-service-role.html">Create an IAM service role for a hybrid environment</a> in the <i>AWS Systems Manager User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable iamRole;

/**
 <p>Specify the maximum number of managed instances you want to register. The default value is 1 instance.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable registrationLimit;

/**
 <p>Optional metadata that you assign to a resource. Tags enable you to categorize a resource in different ways, such as by purpose, owner, or environment. For example, you might want to tag an activation to identify which servers or virtual machines (VMs) in your on-premises environment you intend to activate. In this case, you could specify the following key name/value pairs:</p><ul><li><p><code>Key=OS,Value=Windows</code></p></li><li><p><code>Key=Environment,Value=Production</code></p></li></ul><important><p>When you install SSM Agent on your on-premises servers and VMs, you specify an activation ID and code. When you specify the activation ID and code, tags assigned to the activation are automatically applied to the on-premises servers or VMs.</p></important><p>You can't add tags to or delete tags from an existing activation. You can tag your on-premises servers and VMs after they connect to Systems Manager for the first time and are assigned a managed instance ID. This means they are listed in the AWS Systems Manager console with an ID that is prefixed with "mi-". For information about how to add tags to your managed instances, see <a>AddTagsToResource</a>. For information about how to remove tags from your managed instances, see <a>RemoveTagsFromResource</a>.</p>
 */
@property (nonatomic, strong) NSArray<AWSSSMTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSSSMCreateActivationResult : AWSModel


/**
 <p>The code the system generates when it processes the activation. The activation code functions like a password to validate the activation ID. </p>
 */
@property (nonatomic, strong) NSString * _Nullable activationCode;

/**
 <p>The ID number generated by the system when it processed the activation. The activation ID functions like a user name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable activationId;

@end

/**
 
 */
@interface AWSSSMCreateAssociationBatchRequest : AWSRequest


/**
 <p>One or more associations.</p>
 */
@property (nonatomic, strong) NSArray<AWSSSMCreateAssociationBatchRequestEntry *> * _Nullable entries;

@end

/**
 <p>Describes the association of a Systems Manager SSM document and an instance.</p>
 Required parameters: [Name]
 */
@interface AWSSSMCreateAssociationBatchRequestEntry : AWSModel


/**
 <p>By default, when you create a new associations, the system runs it immediately after it is created and then according to the schedule you specified. Specify this option if you don't want an association to run immediately after you create it.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable applyOnlyAtCronInterval;

/**
 <p>Specify a descriptive name for the association.</p>
 */
@property (nonatomic, strong) NSString * _Nullable associationName;

/**
 <p>Specify the target for the association. This target is required for associations that use an Automation document and target resources by using rate controls.</p>
 */
@property (nonatomic, strong) NSString * _Nullable automationTargetParameterName;

/**
 <p>The severity level to assign to the association.</p>
 */
@property (nonatomic, assign) AWSSSMAssociationComplianceSeverity complianceSeverity;

/**
 <p>The document version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable documentVersion;

/**
 <p>The ID of the instance. </p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The maximum number of targets allowed to run the association at the same time. You can specify a number, for example 10, or a percentage of the target set, for example 10%. The default value is 100%, which means all targets run the association at the same time.</p><p>If a new instance starts and attempts to run an association while Systems Manager is running MaxConcurrency associations, the association is allowed to run. During the next association interval, the new instance will process its association within the limit specified for MaxConcurrency.</p>
 */
@property (nonatomic, strong) NSString * _Nullable maxConcurrency;

/**
 <p>The number of errors that are allowed before the system stops sending requests to run the association on additional targets. You can specify either an absolute number of errors, for example 10, or a percentage of the target set, for example 10%. If you specify 3, for example, the system stops sending requests when the fourth error is received. If you specify 0, then the system stops sending requests after the first error is returned. If you run an association on 50 instances and set MaxError to 10%, then the system stops sending the request when the sixth error is received.</p><p>Executions that are already running an association when MaxErrors is reached are allowed to complete, but some of these executions may fail as well. If you need to ensure that there won't be more than max-errors failed executions, set MaxConcurrency to 1 so that executions proceed one at a time.</p>
 */
@property (nonatomic, strong) NSString * _Nullable maxErrors;

/**
 <p>The name of the SSM document that contains the configuration information for the instance. You can specify Command or Automation documents.</p><p>You can specify AWS-predefined documents, documents you created, or a document that is shared with you from another account.</p><p>For SSM documents that are shared with you from other AWS accounts, you must specify the complete SSM document ARN, in the following format:</p><p><code>arn:aws:ssm:<i>region</i>:<i>account-id</i>:document/<i>document-name</i></code></p><p>For example:</p><p><code>arn:aws:ssm:us-east-2:12345678912:document/My-Shared-Document</code></p><p>For AWS-predefined documents and SSM documents you created in your account, you only need to specify the document name. For example, <code>AWS-ApplyPatchBaseline</code> or <code>My-Document</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>An S3 bucket where you want to store the results of this request.</p>
 */
@property (nonatomic, strong) AWSSSMInstanceAssociationOutputLocation * _Nullable outputLocation;

/**
 <p>A description of the parameters for a document. </p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSArray<NSString *> *> * _Nullable parameters;

/**
 <p>A cron expression that specifies a schedule when the association runs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable scheduleExpression;

/**
 <p>The mode for generating association compliance. You can specify <code>AUTO</code> or <code>MANUAL</code>. In <code>AUTO</code> mode, the system uses the status of the association execution to determine the compliance status. If the association execution runs successfully, then the association is <code>COMPLIANT</code>. If the association execution doesn't run successfully, the association is <code>NON-COMPLIANT</code>. </p><p>In <code>MANUAL</code> mode, you must specify the <code>AssociationId</code> as a parameter for the <a>PutComplianceItems</a> API action. In this case, compliance data is not managed by State Manager. It is managed by your direct call to the <a>PutComplianceItems</a> API action.</p><p>By default, all associations use <code>AUTO</code> mode.</p>
 */
@property (nonatomic, assign) AWSSSMAssociationSyncCompliance syncCompliance;

/**
 <p>The instances targeted by the request.</p>
 */
@property (nonatomic, strong) NSArray<AWSSSMTarget *> * _Nullable targets;

@end

/**
 
 */
@interface AWSSSMCreateAssociationBatchResult : AWSModel


/**
 <p>Information about the associations that failed.</p>
 */
@property (nonatomic, strong) NSArray<AWSSSMFailedCreateAssociation *> * _Nullable failed;

/**
 <p>Information about the associations that succeeded.</p>
 */
@property (nonatomic, strong) NSArray<AWSSSMAssociationDescription *> * _Nullable successful;

@end

/**
 
 */
@interface AWSSSMCreateAssociationRequest : AWSRequest


/**
 <p>By default, when you create a new associations, the system runs it immediately after it is created and then according to the schedule you specified. Specify this option if you don't want an association to run immediately after you create it.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable applyOnlyAtCronInterval;

/**
 <p>Specify a descriptive name for the association.</p>
 */
@property (nonatomic, strong) NSString * _Nullable associationName;

/**
 <p>Specify the target for the association. This target is required for associations that use an Automation document and target resources by using rate controls.</p>
 */
@property (nonatomic, strong) NSString * _Nullable automationTargetParameterName;

/**
 <p>The severity level to assign to the association.</p>
 */
@property (nonatomic, assign) AWSSSMAssociationComplianceSeverity complianceSeverity;

/**
 <p>The document version you want to associate with the target(s). Can be a specific version or the default version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable documentVersion;

/**
 <p>The instance ID.</p><note><p><code>InstanceId</code> has been deprecated. To specify an instance ID for an association, use the <code>Targets</code> parameter. Requests that include the parameter <code>InstanceID</code> with SSM documents that use schema version 2.0 or later will fail. In addition, if you use the parameter <code>InstanceId</code>, you cannot use the parameters <code>AssociationName</code>, <code>DocumentVersion</code>, <code>MaxErrors</code>, <code>MaxConcurrency</code>, <code>OutputLocation</code>, or <code>ScheduleExpression</code>. To use these parameters, you must use the <code>Targets</code> parameter.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The maximum number of targets allowed to run the association at the same time. You can specify a number, for example 10, or a percentage of the target set, for example 10%. The default value is 100%, which means all targets run the association at the same time.</p><p>If a new instance starts and attempts to run an association while Systems Manager is running MaxConcurrency associations, the association is allowed to run. During the next association interval, the new instance will process its association within the limit specified for MaxConcurrency.</p>
 */
@property (nonatomic, strong) NSString * _Nullable maxConcurrency;

/**
 <p>The number of errors that are allowed before the system stops sending requests to run the association on additional targets. You can specify either an absolute number of errors, for example 10, or a percentage of the target set, for example 10%. If you specify 3, for example, the system stops sending requests when the fourth error is received. If you specify 0, then the system stops sending requests after the first error is returned. If you run an association on 50 instances and set MaxError to 10%, then the system stops sending the request when the sixth error is received.</p><p>Executions that are already running an association when MaxErrors is reached are allowed to complete, but some of these executions may fail as well. If you need to ensure that there won't be more than max-errors failed executions, set MaxConcurrency to 1 so that executions proceed one at a time.</p>
 */
@property (nonatomic, strong) NSString * _Nullable maxErrors;

/**
 <p>The name of the SSM document that contains the configuration information for the instance. You can specify Command or Automation documents.</p><p>You can specify AWS-predefined documents, documents you created, or a document that is shared with you from another account.</p><p>For SSM documents that are shared with you from other AWS accounts, you must specify the complete SSM document ARN, in the following format:</p><p><code>arn:<i>partition</i>:ssm:<i>region</i>:<i>account-id</i>:document/<i>document-name</i></code></p><p>For example:</p><p><code>arn:aws:ssm:us-east-2:12345678912:document/My-Shared-Document</code></p><p>For AWS-predefined documents and SSM documents you created in your account, you only need to specify the document name. For example, <code>AWS-ApplyPatchBaseline</code> or <code>My-Document</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>An S3 bucket where you want to store the output details of the request.</p>
 */
@property (nonatomic, strong) AWSSSMInstanceAssociationOutputLocation * _Nullable outputLocation;

/**
 <p>The parameters for the runtime configuration of the document.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSArray<NSString *> *> * _Nullable parameters;

/**
 <p>A cron expression when the association will be applied to the target(s).</p>
 */
@property (nonatomic, strong) NSString * _Nullable scheduleExpression;

/**
 <p>The mode for generating association compliance. You can specify <code>AUTO</code> or <code>MANUAL</code>. In <code>AUTO</code> mode, the system uses the status of the association execution to determine the compliance status. If the association execution runs successfully, then the association is <code>COMPLIANT</code>. If the association execution doesn't run successfully, the association is <code>NON-COMPLIANT</code>.</p><p>In <code>MANUAL</code> mode, you must specify the <code>AssociationId</code> as a parameter for the <a>PutComplianceItems</a> API action. In this case, compliance data is not managed by State Manager. It is managed by your direct call to the <a>PutComplianceItems</a> API action.</p><p>By default, all associations use <code>AUTO</code> mode.</p>
 */
@property (nonatomic, assign) AWSSSMAssociationSyncCompliance syncCompliance;

/**
 <p>The targets for the association. You can target instances by using tags, AWS Resource Groups, all instances in an AWS account, or individual instance IDs. For more information about choosing targets for an association, see <a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-state-manager-targets-and-rate-controls.html">Using targets and rate controls with State Manager associations</a> in the <i>AWS Systems Manager User Guide</i>.</p>
 */
@property (nonatomic, strong) NSArray<AWSSSMTarget *> * _Nullable targets;

@end

/**
 
 */
@interface AWSSSMCreateAssociationResult : AWSModel


/**
 <p>Information about the association.</p>
 */
@property (nonatomic, strong) AWSSSMAssociationDescription * _Nullable associationDescription;

@end

/**
 
 */
@interface AWSSSMCreateDocumentRequest : AWSRequest


/**
 <p>A list of key and value pairs that describe attachments to a version of a document.</p>
 */
@property (nonatomic, strong) NSArray<AWSSSMAttachmentsSource *> * _Nullable attachments;

/**
 <p>The content for the new SSM document in JSON or YAML format. We recommend storing the contents for your new document in an external JSON or YAML file and referencing the file in a command.</p><p>For examples, see the following topics in the <i>AWS Systems Manager User Guide</i>.</p><ul><li><p><a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/create-ssm-document-api.html">Create an SSM document (AWS API)</a></p></li><li><p><a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/create-ssm-document-cli.html">Create an SSM document (AWS CLI)</a></p></li><li><p><a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/create-ssm-document-api.html">Create an SSM document (API)</a></p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable content;

/**
 <p>Specify the document format for the request. The document format can be JSON, YAML, or TEXT. JSON is the default format.</p>
 */
@property (nonatomic, assign) AWSSSMDocumentFormat documentFormat;

/**
 <p>The type of document to create.</p>
 */
@property (nonatomic, assign) AWSSSMDocumentType documentType;

/**
 <p>A name for the Systems Manager document.</p><important><p>You can't use the following strings as document name prefixes. These are reserved by AWS for use as document name prefixes:</p><ul><li><p><code>aws-</code></p></li><li><p><code>amazon</code></p></li><li><p><code>amzn</code></p></li></ul></important>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>A list of SSM documents required by a document. This parameter is used exclusively by AWS AppConfig. When a user creates an AppConfig configuration in an SSM document, the user must also specify a required document for validation purposes. In this case, an <code>ApplicationConfiguration</code> document requires an <code>ApplicationConfigurationSchema</code> document for validation purposes. For more information, see <a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/appconfig.html">AWS AppConfig</a> in the <i>AWS Systems Manager User Guide</i>.</p>
 */
@property (nonatomic, strong) NSArray<AWSSSMDocumentRequires *> * _Nullable requires;

/**
 <p>Optional metadata that you assign to a resource. Tags enable you to categorize a resource in different ways, such as by purpose, owner, or environment. For example, you might want to tag an SSM document to identify the types of targets or the environment where it will run. In this case, you could specify the following key name/value pairs:</p><ul><li><p><code>Key=OS,Value=Windows</code></p></li><li><p><code>Key=Environment,Value=Production</code></p></li></ul><note><p>To add tags to an existing SSM document, use the <a>AddTagsToResource</a> action.</p></note>
 */
@property (nonatomic, strong) NSArray<AWSSSMTag *> * _Nullable tags;

/**
 <p>Specify a target type to define the kinds of resources the document can run on. For example, to run a document on EC2 instances, specify the following value: /AWS::EC2::Instance. If you specify a value of '/' the document can run on all types of resources. If you don't specify a value, the document can't run on any resources. For a list of valid resource types, see <a href="http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-template-resource-type-ref.html">AWS resource and property types reference</a> in the <i>AWS CloudFormation User Guide</i>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable targetType;

/**
 <p>An optional field specifying the version of the artifact you are creating with the document. For example, "Release 12, Update 6". This value is unique across all versions of a document, and cannot be changed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable versionName;

@end

/**
 
 */
@interface AWSSSMCreateDocumentResult : AWSModel


/**
 <p>Information about the Systems Manager document.</p>
 */
@property (nonatomic, strong) AWSSSMDocumentDescription * _Nullable documentDescription;

@end

/**
 
 */
@interface AWSSSMCreateMaintenanceWindowRequest : AWSRequest


/**
 <p>Enables a maintenance window task to run on managed instances, even if you have not registered those instances as targets. If enabled, then you must specify the unregistered instances (by instance ID) when you register a task with the maintenance window.</p><p>If you don't enable this option, then you must specify previously-registered targets when you register a task with the maintenance window.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable allowUnassociatedTargets;

/**
 <p>User-provided idempotency token.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>The number of hours before the end of the maintenance window that Systems Manager stops scheduling new tasks for execution.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable cutoff;

/**
 <p>An optional description for the maintenance window. We recommend specifying a description to help you organize your maintenance windows. </p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The duration of the maintenance window in hours.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable duration;

/**
 <p>The date and time, in ISO-8601 Extended format, for when you want the maintenance window to become inactive. EndDate allows you to set a date and time in the future when the maintenance window will no longer run.</p>
 */
@property (nonatomic, strong) NSString * _Nullable endDate;

/**
 <p>The name of the maintenance window.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The schedule of the maintenance window in the form of a cron or rate expression.</p>
 */
@property (nonatomic, strong) NSString * _Nullable schedule;

/**
 <p>The number of days to wait after the date and time specified by a CRON expression before running the maintenance window.</p><p>For example, the following cron expression schedules a maintenance window to run on the third Tuesday of every month at 11:30 PM.</p><p><code>cron(0 30 23 ? * TUE#3 *)</code></p><p>If the schedule offset is <code>2</code>, the maintenance window won't run until two days later.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable scheduleOffset;

/**
 <p>The time zone that the scheduled maintenance window executions are based on, in Internet Assigned Numbers Authority (IANA) format. For example: "America/Los_Angeles", "etc/UTC", or "Asia/Seoul". For more information, see the <a href="https://www.iana.org/time-zones">Time Zone Database</a> on the IANA website.</p>
 */
@property (nonatomic, strong) NSString * _Nullable scheduleTimezone;

/**
 <p>The date and time, in ISO-8601 Extended format, for when you want the maintenance window to become active. StartDate allows you to delay activation of the maintenance window until the specified future date.</p>
 */
@property (nonatomic, strong) NSString * _Nullable startDate;

/**
 <p>Optional metadata that you assign to a resource. Tags enable you to categorize a resource in different ways, such as by purpose, owner, or environment. For example, you might want to tag a maintenance window to identify the type of tasks it will run, the types of targets, and the environment it will run in. In this case, you could specify the following key name/value pairs:</p><ul><li><p><code>Key=TaskType,Value=AgentUpdate</code></p></li><li><p><code>Key=OS,Value=Windows</code></p></li><li><p><code>Key=Environment,Value=Production</code></p></li></ul><note><p>To add tags to an existing maintenance window, use the <a>AddTagsToResource</a> action.</p></note>
 */
@property (nonatomic, strong) NSArray<AWSSSMTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSSSMCreateMaintenanceWindowResult : AWSModel


/**
 <p>The ID of the created maintenance window.</p>
 */
@property (nonatomic, strong) NSString * _Nullable windowId;

@end

/**
 
 */
@interface AWSSSMCreateOpsItemRequest : AWSRequest


/**
 <p>Specify a category to assign to an OpsItem. </p>
 */
@property (nonatomic, strong) NSString * _Nullable category;

/**
 <p>Information about the OpsItem. </p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The Amazon Resource Name (ARN) of an SNS topic where notifications are sent when this OpsItem is edited or changed.</p>
 */
@property (nonatomic, strong) NSArray<AWSSSMOpsItemNotification *> * _Nullable notifications;

/**
 <p>Operational data is custom data that provides useful reference details about the OpsItem. For example, you can specify log files, error strings, license keys, troubleshooting tips, or other relevant data. You enter operational data as key-value pairs. The key has a maximum length of 128 characters. The value has a maximum size of 20 KB.</p><important><p>Operational data keys <i>can't</i> begin with the following: amazon, aws, amzn, ssm, /amazon, /aws, /amzn, /ssm.</p></important><p>You can choose to make the data searchable by other users in the account or you can restrict search access. Searchable data means that all users with access to the OpsItem Overview page (as provided by the <a>DescribeOpsItems</a> API action) can view and search on the specified data. Operational data that is not searchable is only viewable by users who have access to the OpsItem (as provided by the <a>GetOpsItem</a> API action).</p><p>Use the <code>/aws/resources</code> key in OperationalData to specify a related resource in the request. Use the <code>/aws/automations</code> key in OperationalData to associate an Automation runbook with the OpsItem. To view AWS CLI example commands that use these keys, see <a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter-creating-OpsItems.html#OpsCenter-manually-create-OpsItems">Creating OpsItems manually</a> in the <i>AWS Systems Manager User Guide</i>.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSSSMOpsItemDataValue *> * _Nullable operationalData;

/**
 <p>The importance of this OpsItem in relation to other OpsItems in the system.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable priority;

/**
 <p>One or more OpsItems that share something in common with the current OpsItems. For example, related OpsItems can include OpsItems with similar error messages, impacted resources, or statuses for the impacted resource.</p>
 */
@property (nonatomic, strong) NSArray<AWSSSMRelatedOpsItem *> * _Nullable relatedOpsItems;

/**
 <p>Specify a severity to assign to an OpsItem.</p>
 */
@property (nonatomic, strong) NSString * _Nullable severity;

/**
 <p>The origin of the OpsItem, such as Amazon EC2 or Systems Manager.</p><note><p>The source name can't contain the following strings: aws, amazon, and amzn. </p></note>
 */
@property (nonatomic, strong) NSString * _Nullable source;

/**
 <p>Optional metadata that you assign to a resource. You can restrict access to OpsItems by using an inline IAM policy that specifies tags. For more information, see <a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter-getting-started.html#OpsCenter-getting-started-user-permissions">Getting started with OpsCenter</a> in the <i>AWS Systems Manager User Guide</i>.</p><p>Tags use a key-value pair. For example:</p><p><code>Key=Department,Value=Finance</code></p><note><p>To add tags to an existing OpsItem, use the <a>AddTagsToResource</a> action.</p></note>
 */
@property (nonatomic, strong) NSArray<AWSSSMTag *> * _Nullable tags;

/**
 <p>A short heading that describes the nature of the OpsItem and the impacted resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable title;

@end

/**
 
 */
@interface AWSSSMCreateOpsItemResponse : AWSModel


/**
 <p>The ID of the OpsItem.</p>
 */
@property (nonatomic, strong) NSString * _Nullable opsItemId;

@end

/**
 
 */
@interface AWSSSMCreatePatchBaselineRequest : AWSRequest


/**
 <p>A set of rules used to include patches in the baseline.</p>
 */
@property (nonatomic, strong) AWSSSMPatchRuleGroup * _Nullable approvalRules;

/**
 <p>A list of explicitly approved patches for the baseline.</p><p>For information about accepted formats for lists of approved patches and rejected patches, see <a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/patch-manager-approved-rejected-package-name-formats.html">About package name formats for approved and rejected patch lists</a> in the <i>AWS Systems Manager User Guide</i>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable approvedPatches;

/**
 <p>Defines the compliance level for approved patches. This means that if an approved patch is reported as missing, this is the severity of the compliance violation. The default value is UNSPECIFIED.</p>
 */
@property (nonatomic, assign) AWSSSMPatchComplianceLevel approvedPatchesComplianceLevel;

/**
 <p>Indicates whether the list of approved patches includes non-security updates that should be applied to the instances. The default value is 'false'. Applies to Linux instances only.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable approvedPatchesEnableNonSecurity;

/**
 <p>User-provided idempotency token.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>A description of the patch baseline.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>A set of global filters used to include patches in the baseline.</p>
 */
@property (nonatomic, strong) AWSSSMPatchFilterGroup * _Nullable globalFilters;

/**
 <p>The name of the patch baseline.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>Defines the operating system the patch baseline applies to. The Default value is WINDOWS.</p>
 */
@property (nonatomic, assign) AWSSSMOperatingSystem operatingSystem;

/**
 <p>A list of explicitly rejected patches for the baseline.</p><p>For information about accepted formats for lists of approved patches and rejected patches, see <a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/patch-manager-approved-rejected-package-name-formats.html">About package name formats for approved and rejected patch lists</a> in the <i>AWS Systems Manager User Guide</i>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable rejectedPatches;

/**
 <p>The action for Patch Manager to take on patches included in the RejectedPackages list.</p><ul><li><p><b>ALLOW_AS_DEPENDENCY</b>: A package in the Rejected patches list is installed only if it is a dependency of another package. It is considered compliant with the patch baseline, and its status is reported as <i>InstalledOther</i>. This is the default action if no option is specified.</p></li><li><p><b>BLOCK</b>: Packages in the RejectedPatches list, and packages that include them as dependencies, are not installed under any circumstances. If a package was installed before it was added to the Rejected patches list, it is considered non-compliant with the patch baseline, and its status is reported as <i>InstalledRejected</i>.</p></li></ul>
 */
@property (nonatomic, assign) AWSSSMPatchAction rejectedPatchesAction;

/**
 <p>Information about the patches to use to update the instances, including target operating systems and source repositories. Applies to Linux instances only.</p>
 */
@property (nonatomic, strong) NSArray<AWSSSMPatchSource *> * _Nullable sources;

/**
 <p>Optional metadata that you assign to a resource. Tags enable you to categorize a resource in different ways, such as by purpose, owner, or environment. For example, you might want to tag a patch baseline to identify the severity level of patches it specifies and the operating system family it applies to. In this case, you could specify the following key name/value pairs:</p><ul><li><p><code>Key=PatchSeverity,Value=Critical</code></p></li><li><p><code>Key=OS,Value=Windows</code></p></li></ul><note><p>To add tags to an existing patch baseline, use the <a>AddTagsToResource</a> action.</p></note>
 */
@property (nonatomic, strong) NSArray<AWSSSMTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSSSMCreatePatchBaselineResult : AWSModel


/**
 <p>The ID of the created patch baseline.</p>
 */
@property (nonatomic, strong) NSString * _Nullable baselineId;

@end

/**
 
 */
@interface AWSSSMCreateResourceDataSyncRequest : AWSRequest


/**
 <p>Amazon S3 configuration details for the sync. This parameter is required if the <code>SyncType</code> value is SyncToDestination.</p>
 */
@property (nonatomic, strong) AWSSSMResourceDataSyncS3Destination * _Nullable s3Destination;

/**
 <p>A name for the configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable syncName;

/**
 <p>Specify information about the data sources to synchronize. This parameter is required if the <code>SyncType</code> value is SyncFromSource.</p>
 */
@property (nonatomic, strong) AWSSSMResourceDataSyncSource * _Nullable syncSource;

/**
 <p>Specify <code>SyncToDestination</code> to create a resource data sync that synchronizes data to an S3 bucket for Inventory. If you specify <code>SyncToDestination</code>, you must provide a value for <code>S3Destination</code>. Specify <code>SyncFromSource</code> to synchronize data from a single account and multiple Regions, or multiple AWS accounts and Regions, as listed in AWS Organizations for Explorer. If you specify <code>SyncFromSource</code>, you must provide a value for <code>SyncSource</code>. The default value is <code>SyncToDestination</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable syncType;

@end

/**
 
 */
@interface AWSSSMCreateResourceDataSyncResult : AWSModel


@end

/**
 
 */
@interface AWSSSMDeleteActivationRequest : AWSRequest


/**
 <p>The ID of the activation that you want to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable activationId;

@end

/**
 
 */
@interface AWSSSMDeleteActivationResult : AWSModel


@end

/**
 
 */
@interface AWSSSMDeleteAssociationRequest : AWSRequest


/**
 <p>The association ID that you want to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable associationId;

/**
 <p>The ID of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The name of the Systems Manager document.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSSSMDeleteAssociationResult : AWSModel


@end

/**
 
 */
@interface AWSSSMDeleteDocumentRequest : AWSRequest


/**
 <p>The version of the document that you want to delete. If not provided, all versions of the document are deleted.</p>
 */
@property (nonatomic, strong) NSString * _Nullable documentVersion;

/**
 <p>Some SSM document types require that you specify a <code>Force</code> flag before you can delete the document. For example, you must specify a <code>Force</code> flag to delete a document of type <code>ApplicationConfigurationSchema</code>. You can restrict access to the <code>Force</code> flag in an AWS Identity and Access Management (IAM) policy.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable force;

/**
 <p>The name of the document.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The version name of the document that you want to delete. If not provided, all versions of the document are deleted.</p>
 */
@property (nonatomic, strong) NSString * _Nullable versionName;

@end

/**
 
 */
@interface AWSSSMDeleteDocumentResult : AWSModel


@end

/**
 
 */
@interface AWSSSMDeleteInventoryRequest : AWSRequest


/**
 <p>User-provided idempotency token.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>Use this option to view a summary of the deletion request without deleting any data or the data type. This option is useful when you only want to understand what will be deleted. Once you validate that the data to be deleted is what you intend to delete, you can run the same command without specifying the <code>DryRun</code> option.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>Use the <code>SchemaDeleteOption</code> to delete a custom inventory type (schema). If you don't choose this option, the system only deletes existing inventory data associated with the custom inventory type. Choose one of the following options:</p><p>DisableSchema: If you choose this option, the system ignores all inventory data for the specified version, and any earlier versions. To enable this schema again, you must call the <code>PutInventory</code> action for a version greater than the disabled version.</p><p>DeleteSchema: This option deletes the specified custom type from the Inventory service. You can recreate the schema later, if you want.</p>
 */
@property (nonatomic, assign) AWSSSMInventorySchemaDeleteOption schemaDeleteOption;

/**
 <p>The name of the custom inventory type for which you want to delete either all previously collected data or the inventory type itself. </p>
 */
@property (nonatomic, strong) NSString * _Nullable typeName;

@end

/**
 
 */
@interface AWSSSMDeleteInventoryResult : AWSModel


/**
 <p>Every <code>DeleteInventory</code> action is assigned a unique ID. This option returns a unique ID. You can use this ID to query the status of a delete operation. This option is useful for ensuring that a delete operation has completed before you begin other actions. </p>
 */
@property (nonatomic, strong) NSString * _Nullable deletionId;

/**
 <p>A summary of the delete operation. For more information about this summary, see <a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/sysman-inventory-custom.html#sysman-inventory-delete-summary">Deleting custom inventory</a> in the <i>AWS Systems Manager User Guide</i>.</p>
 */
@property (nonatomic, strong) AWSSSMInventoryDeletionSummary * _Nullable deletionSummary;

/**
 <p>The name of the inventory data type specified in the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable typeName;

@end

/**
 
 */
@interface AWSSSMDeleteMaintenanceWindowRequest : AWSRequest


/**
 <p>The ID of the maintenance window to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable windowId;

@end

/**
 
 */
@interface AWSSSMDeleteMaintenanceWindowResult : AWSModel


/**
 <p>The ID of the deleted maintenance window.</p>
 */
@property (nonatomic, strong) NSString * _Nullable windowId;

@end

/**
 
 */
@interface AWSSSMDeleteParameterRequest : AWSRequest


/**
 <p>The name of the parameter to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSSSMDeleteParameterResult : AWSModel


@end

/**
 
 */
@interface AWSSSMDeleteParametersRequest : AWSRequest


/**
 <p>The names of the parameters to delete.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable names;

@end

/**
 
 */
@interface AWSSSMDeleteParametersResult : AWSModel


/**
 <p>The names of the deleted parameters.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable deletedParameters;

/**
 <p>The names of parameters that weren't deleted because the parameters are not valid.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable invalidParameters;

@end

/**
 
 */
@interface AWSSSMDeletePatchBaselineRequest : AWSRequest


/**
 <p>The ID of the patch baseline to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable baselineId;

@end

/**
 
 */
@interface AWSSSMDeletePatchBaselineResult : AWSModel


/**
 <p>The ID of the deleted patch baseline.</p>
 */
@property (nonatomic, strong) NSString * _Nullable baselineId;

@end

/**
 
 */
@interface AWSSSMDeleteResourceDataSyncRequest : AWSRequest


/**
 <p>The name of the configuration to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable syncName;

/**
 <p>Specify the type of resource data sync to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable syncType;

@end

/**
 
 */
@interface AWSSSMDeleteResourceDataSyncResult : AWSModel


@end

/**
 
 */
@interface AWSSSMDeregisterManagedInstanceRequest : AWSRequest


/**
 <p>The ID assigned to the managed instance when you registered it using the activation process. </p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

@end

/**
 
 */
@interface AWSSSMDeregisterManagedInstanceResult : AWSModel


@end

/**
 
 */
@interface AWSSSMDeregisterPatchBaselineForPatchGroupRequest : AWSRequest


/**
 <p>The ID of the patch baseline to deregister the patch group from.</p>
 */
@property (nonatomic, strong) NSString * _Nullable baselineId;

/**
 <p>The name of the patch group that should be deregistered from the patch baseline.</p>
 */
@property (nonatomic, strong) NSString * _Nullable patchGroup;

@end

/**
 
 */
@interface AWSSSMDeregisterPatchBaselineForPatchGroupResult : AWSModel


/**
 <p>The ID of the patch baseline the patch group was deregistered from.</p>
 */
@property (nonatomic, strong) NSString * _Nullable baselineId;

/**
 <p>The name of the patch group deregistered from the patch baseline.</p>
 */
@property (nonatomic, strong) NSString * _Nullable patchGroup;

@end

/**
 
 */
@interface AWSSSMDeregisterTargetFromMaintenanceWindowRequest : AWSRequest


/**
 <p>The system checks if the target is being referenced by a task. If the target is being referenced, the system returns an error and does not deregister the target from the maintenance window.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable safe;

/**
 <p>The ID of the maintenance window the target should be removed from.</p>
 */
@property (nonatomic, strong) NSString * _Nullable windowId;

/**
 <p>The ID of the target definition to remove.</p>
 */
@property (nonatomic, strong) NSString * _Nullable windowTargetId;

@end

/**
 
 */
@interface AWSSSMDeregisterTargetFromMaintenanceWindowResult : AWSModel


/**
 <p>The ID of the maintenance window the target was removed from.</p>
 */
@property (nonatomic, strong) NSString * _Nullable windowId;

/**
 <p>The ID of the removed target definition.</p>
 */
@property (nonatomic, strong) NSString * _Nullable windowTargetId;

@end

/**
 
 */
@interface AWSSSMDeregisterTaskFromMaintenanceWindowRequest : AWSRequest


/**
 <p>The ID of the maintenance window the task should be removed from.</p>
 */
@property (nonatomic, strong) NSString * _Nullable windowId;

/**
 <p>The ID of the task to remove from the maintenance window.</p>
 */
@property (nonatomic, strong) NSString * _Nullable windowTaskId;

@end

/**
 
 */
@interface AWSSSMDeregisterTaskFromMaintenanceWindowResult : AWSModel


/**
 <p>The ID of the maintenance window the task was removed from.</p>
 */
@property (nonatomic, strong) NSString * _Nullable windowId;

/**
 <p>The ID of the task removed from the maintenance window.</p>
 */
@property (nonatomic, strong) NSString * _Nullable windowTaskId;

@end

/**
 <p>Filter for the DescribeActivation API.</p>
 */
@interface AWSSSMDescribeActivationsFilter : AWSModel


/**
 <p>The name of the filter.</p>
 */
@property (nonatomic, assign) AWSSSMDescribeActivationsFilterKeys filterKey;

/**
 <p>The filter values.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable filterValues;

@end

/**
 
 */
@interface AWSSSMDescribeActivationsRequest : AWSRequest


/**
 <p>A filter to view information about your activations.</p>
 */
@property (nonatomic, strong) NSArray<AWSSSMDescribeActivationsFilter *> * _Nullable filters;

/**
 <p>The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>A token to start the list. Use this token to get the next set of results. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSSSMDescribeActivationsResult : AWSModel


/**
 <p>A list of activations for your AWS account.</p>
 */
@property (nonatomic, strong) NSArray<AWSSSMActivation *> * _Nullable activationList;

/**
 <p>The token for the next set of items to return. Use this token to get the next set of results. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSSSMDescribeAssociationExecutionTargetsRequest : AWSRequest


/**
 <p>The association ID that includes the execution for which you want to view details.</p>
 */
@property (nonatomic, strong) NSString * _Nullable associationId;

/**
 <p>The execution ID for which you want to view details.</p>
 */
@property (nonatomic, strong) NSString * _Nullable executionId;

/**
 <p>Filters for the request. You can specify the following filters and values.</p><p>Status (EQUAL)</p><p>ResourceId (EQUAL)</p><p>ResourceType (EQUAL)</p>
 */
@property (nonatomic, strong) NSArray<AWSSSMAssociationExecutionTargetsFilter *> * _Nullable filters;

/**
 <p>The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>A token to start the list. Use this token to get the next set of results. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSSSMDescribeAssociationExecutionTargetsResult : AWSModel


/**
 <p>Information about the execution.</p>
 */
@property (nonatomic, strong) NSArray<AWSSSMAssociationExecutionTarget *> * _Nullable associationExecutionTargets;

/**
 <p>The token for the next set of items to return. Use this token to get the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSSSMDescribeAssociationExecutionsRequest : AWSRequest


/**
 <p>The association ID for which you want to view execution history details.</p>
 */
@property (nonatomic, strong) NSString * _Nullable associationId;

/**
 <p>Filters for the request. You can specify the following filters and values.</p><p>ExecutionId (EQUAL)</p><p>Status (EQUAL)</p><p>CreatedTime (EQUAL, GREATER_THAN, LESS_THAN)</p>
 */
@property (nonatomic, strong) NSArray<AWSSSMAssociationExecutionFilter *> * _Nullable filters;

/**
 <p>The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>A token to start the list. Use this token to get the next set of results. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSSSMDescribeAssociationExecutionsResult : AWSModel


/**
 <p>A list of the executions for the specified association ID.</p>
 */
@property (nonatomic, strong) NSArray<AWSSSMAssociationExecution *> * _Nullable associationExecutions;

/**
 <p>The token for the next set of items to return. Use this token to get the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSSSMDescribeAssociationRequest : AWSRequest


/**
 <p>The association ID for which you want information.</p>
 */
@property (nonatomic, strong) NSString * _Nullable associationId;

/**
 <p>Specify the association version to retrieve. To view the latest version, either specify <code>$LATEST</code> for this parameter, or omit this parameter. To view a list of all associations for an instance, use <a>ListAssociations</a>. To get a list of versions for a specific association, use <a>ListAssociationVersions</a>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable associationVersion;

/**
 <p>The instance ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The name of the Systems Manager document.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSSSMDescribeAssociationResult : AWSModel


/**
 <p>Information about the association.</p>
 */
@property (nonatomic, strong) AWSSSMAssociationDescription * _Nullable associationDescription;

@end

/**
 
 */
@interface AWSSSMDescribeAutomationExecutionsRequest : AWSRequest


/**
 <p>Filters used to limit the scope of executions that are requested.</p>
 */
@property (nonatomic, strong) NSArray<AWSSSMAutomationExecutionFilter *> * _Nullable filters;

/**
 <p>The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token for the next set of items to return. (You received this token from a previous call.)</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSSSMDescribeAutomationExecutionsResult : AWSModel


/**
 <p>The list of details about each automation execution which has occurred which matches the filter specification, if any.</p>
 */
@property (nonatomic, strong) NSArray<AWSSSMAutomationExecutionMetadata *> * _Nullable automationExecutionMetadataList;

/**
 <p>The token to use when requesting the next set of items. If there are no additional items to return, the string is empty.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSSSMDescribeAutomationStepExecutionsRequest : AWSRequest


/**
 <p>The Automation execution ID for which you want step execution descriptions.</p>
 */
@property (nonatomic, strong) NSString * _Nullable automationExecutionId;

/**
 <p>One or more filters to limit the number of step executions returned by the request.</p>
 */
@property (nonatomic, strong) NSArray<AWSSSMStepExecutionFilter *> * _Nullable filters;

/**
 <p>The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token for the next set of items to return. (You received this token from a previous call.)</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>A boolean that indicates whether to list step executions in reverse order by start time. The default value is false.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable reverseOrder;

@end

/**
 
 */
@interface AWSSSMDescribeAutomationStepExecutionsResult : AWSModel


/**
 <p>The token to use when requesting the next set of items. If there are no additional items to return, the string is empty.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>A list of details about the current state of all steps that make up an execution.</p>
 */
@property (nonatomic, strong) NSArray<AWSSSMStepExecution *> * _Nullable stepExecutions;

@end

/**
 
 */
@interface AWSSSMDescribeAvailablePatchesRequest : AWSRequest


/**
 <p>Filters used to scope down the returned patches.</p>
 */
@property (nonatomic, strong) NSArray<AWSSSMPatchOrchestratorFilter *> * _Nullable filters;

/**
 <p>The maximum number of patches to return (per page).</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token for the next set of items to return. (You received this token from a previous call.)</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSSSMDescribeAvailablePatchesResult : AWSModel


/**
 <p>The token to use when requesting the next set of items. If there are no additional items to return, the string is empty.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>An array of patches. Each entry in the array is a patch structure.</p>
 */
@property (nonatomic, strong) NSArray<AWSSSMPatch *> * _Nullable patches;

@end

/**
 
 */
@interface AWSSSMDescribeDocumentPermissionRequest : AWSRequest


/**
 <p>The name of the document for which you are the owner.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The permission type for the document. The permission type can be <i>Share</i>.</p>
 */
@property (nonatomic, assign) AWSSSMDocumentPermissionType permissionType;

@end

/**
 
 */
@interface AWSSSMDescribeDocumentPermissionResponse : AWSModel


/**
 <p>The account IDs that have permission to use this document. The ID can be either an AWS account or <i>All</i>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable accountIds;

/**
 <p>A list of AWS accounts where the current document is shared and the version shared with each account.</p>
 */
@property (nonatomic, strong) NSArray<AWSSSMAccountSharingInfo *> * _Nullable accountSharingInfoList;

@end

/**
 
 */
@interface AWSSSMDescribeDocumentRequest : AWSRequest


/**
 <p>The document version for which you want information. Can be a specific version or the default version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable documentVersion;

/**
 <p>The name of the Systems Manager document.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>An optional field specifying the version of the artifact associated with the document. For example, "Release 12, Update 6". This value is unique across all versions of a document, and cannot be changed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable versionName;

@end

/**
 
 */
@interface AWSSSMDescribeDocumentResult : AWSModel


/**
 <p>Information about the Systems Manager document.</p>
 */
@property (nonatomic, strong) AWSSSMDocumentDescription * _Nullable document;

@end

/**
 
 */
@interface AWSSSMDescribeEffectiveInstanceAssociationsRequest : AWSRequest


/**
 <p>The instance ID for which you want to view all associations.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token for the next set of items to return. (You received this token from a previous call.)</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSSSMDescribeEffectiveInstanceAssociationsResult : AWSModel


/**
 <p>The associations for the requested instance.</p>
 */
@property (nonatomic, strong) NSArray<AWSSSMInstanceAssociation *> * _Nullable associations;

/**
 <p>The token to use when requesting the next set of items. If there are no additional items to return, the string is empty.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSSSMDescribeEffectivePatchesForPatchBaselineRequest : AWSRequest


/**
 <p>The ID of the patch baseline to retrieve the effective patches for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable baselineId;

/**
 <p>The maximum number of patches to return (per page).</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token for the next set of items to return. (You received this token from a previous call.)</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSSSMDescribeEffectivePatchesForPatchBaselineResult : AWSModel


/**
 <p>An array of patches and patch status.</p>
 */
@property (nonatomic, strong) NSArray<AWSSSMEffectivePatch *> * _Nullable effectivePatches;

/**
 <p>The token to use when requesting the next set of items. If there are no additional items to return, the string is empty.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSSSMDescribeInstanceAssociationsStatusRequest : AWSRequest


/**
 <p>The instance IDs for which you want association status information.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token for the next set of items to return. (You received this token from a previous call.)</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSSSMDescribeInstanceAssociationsStatusResult : AWSModel


/**
 <p>Status information about the association.</p>
 */
@property (nonatomic, strong) NSArray<AWSSSMInstanceAssociationStatusInfo *> * _Nullable instanceAssociationStatusInfos;

/**
 <p>The token to use when requesting the next set of items. If there are no additional items to return, the string is empty.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSSSMDescribeInstanceInformationRequest : AWSRequest


/**
 <p>One or more filters. Use a filter to return a more specific list of instances. You can filter based on tags applied to EC2 instances. Use this <code>Filters</code> data type instead of <code>InstanceInformationFilterList</code>, which is deprecated.</p>
 */
@property (nonatomic, strong) NSArray<AWSSSMInstanceInformationStringFilter *> * _Nullable filters;

/**
 <p>This is a legacy method. We recommend that you don't use this method. Instead, use the <code>Filters</code> data type. <code>Filters</code> enables you to return instance information by filtering based on tags applied to managed instances.</p><note><p>Attempting to use <code>InstanceInformationFilterList</code> and <code>Filters</code> leads to an exception error. </p></note>
 */
@property (nonatomic, strong) NSArray<AWSSSMInstanceInformationFilter *> * _Nullable instanceInformationFilterList;

/**
 <p>The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token for the next set of items to return. (You received this token from a previous call.)</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSSSMDescribeInstanceInformationResult : AWSModel


/**
 <p>The instance information list.</p>
 */
@property (nonatomic, strong) NSArray<AWSSSMInstanceInformation *> * _Nullable instanceInformationList;

/**
 <p>The token to use when requesting the next set of items. If there are no additional items to return, the string is empty. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSSSMDescribeInstancePatchStatesForPatchGroupRequest : AWSRequest


/**
 <p>Each entry in the array is a structure containing:</p><p>Key (string between 1 and 200 characters)</p><p> Values (array containing a single string)</p><p> Type (string "Equal", "NotEqual", "LessThan", "GreaterThan")</p>
 */
@property (nonatomic, strong) NSArray<AWSSSMInstancePatchStateFilter *> * _Nullable filters;

/**
 <p>The maximum number of patches to return (per page).</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token for the next set of items to return. (You received this token from a previous call.)</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The name of the patch group for which the patch state information should be retrieved.</p>
 */
@property (nonatomic, strong) NSString * _Nullable patchGroup;

@end

/**
 
 */
@interface AWSSSMDescribeInstancePatchStatesForPatchGroupResult : AWSModel


/**
 <p>The high-level patch state for the requested instances. </p>
 */
@property (nonatomic, strong) NSArray<AWSSSMInstancePatchState *> * _Nullable instancePatchStates;

/**
 <p>The token to use when requesting the next set of items. If there are no additional items to return, the string is empty.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSSSMDescribeInstancePatchStatesRequest : AWSRequest


/**
 <p>The ID of the instance whose patch state information should be retrieved.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable instanceIds;

/**
 <p>The maximum number of instances to return (per page).</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token for the next set of items to return. (You received this token from a previous call.)</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSSSMDescribeInstancePatchStatesResult : AWSModel


/**
 <p>The high-level patch state for the requested instances.</p>
 */
@property (nonatomic, strong) NSArray<AWSSSMInstancePatchState *> * _Nullable instancePatchStates;

/**
 <p>The token to use when requesting the next set of items. If there are no additional items to return, the string is empty.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSSSMDescribeInstancePatchesRequest : AWSRequest


/**
 <p>An array of structures. Each entry in the array is a structure containing a Key, Value combination. Valid values for Key are <code>Classification</code> | <code>KBId</code> | <code>Severity</code> | <code>State</code>.</p>
 */
@property (nonatomic, strong) NSArray<AWSSSMPatchOrchestratorFilter *> * _Nullable filters;

/**
 <p>The ID of the instance whose patch state information should be retrieved.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The maximum number of patches to return (per page).</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token for the next set of items to return. (You received this token from a previous call.)</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSSSMDescribeInstancePatchesResult : AWSModel


/**
 <p>The token to use when requesting the next set of items. If there are no additional items to return, the string is empty.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>Each entry in the array is a structure containing:</p><p>Title (string)</p><p>KBId (string)</p><p>Classification (string)</p><p>Severity (string)</p><p>State (string, such as "INSTALLED" or "FAILED")</p><p>InstalledTime (DateTime)</p><p>InstalledBy (string)</p>
 */
@property (nonatomic, strong) NSArray<AWSSSMPatchComplianceData *> * _Nullable patches;

@end

/**
 
 */
@interface AWSSSMDescribeInventoryDeletionsRequest : AWSRequest


/**
 <p>Specify the delete inventory ID for which you want information. This ID was returned by the <code>DeleteInventory</code> action.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deletionId;

/**
 <p>The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>A token to start the list. Use this token to get the next set of results. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSSSMDescribeInventoryDeletionsResult : AWSModel


/**
 <p>A list of status items for deleted inventory.</p>
 */
@property (nonatomic, strong) NSArray<AWSSSMInventoryDeletionStatusItem *> * _Nullable inventoryDeletions;

/**
 <p>The token for the next set of items to return. Use this token to get the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSSSMDescribeMaintenanceWindowExecutionTaskInvocationsRequest : AWSRequest


/**
 <p>Optional filters used to scope down the returned task invocations. The supported filter key is STATUS with the corresponding values PENDING, IN_PROGRESS, SUCCESS, FAILED, TIMED_OUT, CANCELLING, and CANCELLED.</p>
 */
@property (nonatomic, strong) NSArray<AWSSSMMaintenanceWindowFilter *> * _Nullable filters;

/**
 <p>The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token for the next set of items to return. (You received this token from a previous call.)</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The ID of the specific task in the maintenance window task that should be retrieved.</p>
 */
@property (nonatomic, strong) NSString * _Nullable taskId;

/**
 <p>The ID of the maintenance window execution the task is part of.</p>
 */
@property (nonatomic, strong) NSString * _Nullable windowExecutionId;

@end

/**
 
 */
@interface AWSSSMDescribeMaintenanceWindowExecutionTaskInvocationsResult : AWSModel


/**
 <p>The token to use when requesting the next set of items. If there are no additional items to return, the string is empty.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>Information about the task invocation results per invocation.</p>
 */
@property (nonatomic, strong) NSArray<AWSSSMMaintenanceWindowExecutionTaskInvocationIdentity *> * _Nullable windowExecutionTaskInvocationIdentities;

@end

/**
 
 */
@interface AWSSSMDescribeMaintenanceWindowExecutionTasksRequest : AWSRequest


/**
 <p>Optional filters used to scope down the returned tasks. The supported filter key is STATUS with the corresponding values PENDING, IN_PROGRESS, SUCCESS, FAILED, TIMED_OUT, CANCELLING, and CANCELLED. </p>
 */
@property (nonatomic, strong) NSArray<AWSSSMMaintenanceWindowFilter *> * _Nullable filters;

/**
 <p>The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token for the next set of items to return. (You received this token from a previous call.)</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The ID of the maintenance window execution whose task executions should be retrieved.</p>
 */
@property (nonatomic, strong) NSString * _Nullable windowExecutionId;

@end

/**
 
 */
@interface AWSSSMDescribeMaintenanceWindowExecutionTasksResult : AWSModel


/**
 <p>The token to use when requesting the next set of items. If there are no additional items to return, the string is empty.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>Information about the task executions.</p>
 */
@property (nonatomic, strong) NSArray<AWSSSMMaintenanceWindowExecutionTaskIdentity *> * _Nullable windowExecutionTaskIdentities;

@end

/**
 
 */
@interface AWSSSMDescribeMaintenanceWindowExecutionsRequest : AWSRequest


/**
 <p>Each entry in the array is a structure containing:</p><p>Key (string, between 1 and 128 characters)</p><p>Values (array of strings, each string is between 1 and 256 characters)</p><p>The supported Keys are ExecutedBefore and ExecutedAfter with the value being a date/time string such as 2016-11-04T05:00:00Z.</p>
 */
@property (nonatomic, strong) NSArray<AWSSSMMaintenanceWindowFilter *> * _Nullable filters;

/**
 <p>The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token for the next set of items to return. (You received this token from a previous call.)</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The ID of the maintenance window whose executions should be retrieved.</p>
 */
@property (nonatomic, strong) NSString * _Nullable windowId;

@end

/**
 
 */
@interface AWSSSMDescribeMaintenanceWindowExecutionsResult : AWSModel


/**
 <p>The token to use when requesting the next set of items. If there are no additional items to return, the string is empty.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>Information about the maintenance window executions.</p>
 */
@property (nonatomic, strong) NSArray<AWSSSMMaintenanceWindowExecution *> * _Nullable windowExecutions;

@end

/**
 
 */
@interface AWSSSMDescribeMaintenanceWindowScheduleRequest : AWSRequest


/**
 <p>Filters used to limit the range of results. For example, you can limit maintenance window executions to only those scheduled before or after a certain date and time.</p>
 */
@property (nonatomic, strong) NSArray<AWSSSMPatchOrchestratorFilter *> * _Nullable filters;

/**
 <p>The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token for the next set of items to return. (You received this token from a previous call.)</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The type of resource you want to retrieve information about. For example, "INSTANCE".</p>
 */
@property (nonatomic, assign) AWSSSMMaintenanceWindowResourceType resourceType;

/**
 <p>The instance ID or key/value pair to retrieve information about.</p>
 */
@property (nonatomic, strong) NSArray<AWSSSMTarget *> * _Nullable targets;

/**
 <p>The ID of the maintenance window to retrieve information about.</p>
 */
@property (nonatomic, strong) NSString * _Nullable windowId;

@end

/**
 
 */
@interface AWSSSMDescribeMaintenanceWindowScheduleResult : AWSModel


/**
 <p>The token for the next set of items to return. (You use this token in the next call.)</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>Information about maintenance window executions scheduled for the specified time range.</p>
 */
@property (nonatomic, strong) NSArray<AWSSSMScheduledWindowExecution *> * _Nullable scheduledWindowExecutions;

@end

/**
 
 */
@interface AWSSSMDescribeMaintenanceWindowTargetsRequest : AWSRequest


/**
 <p>Optional filters that can be used to narrow down the scope of the returned window targets. The supported filter keys are Type, WindowTargetId and OwnerInformation.</p>
 */
@property (nonatomic, strong) NSArray<AWSSSMMaintenanceWindowFilter *> * _Nullable filters;

/**
 <p>The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token for the next set of items to return. (You received this token from a previous call.)</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The ID of the maintenance window whose targets should be retrieved.</p>
 */
@property (nonatomic, strong) NSString * _Nullable windowId;

@end

/**
 
 */
@interface AWSSSMDescribeMaintenanceWindowTargetsResult : AWSModel


/**
 <p>The token to use when requesting the next set of items. If there are no additional items to return, the string is empty.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>Information about the targets in the maintenance window.</p>
 */
@property (nonatomic, strong) NSArray<AWSSSMMaintenanceWindowTarget *> * _Nullable targets;

@end

/**
 
 */
@interface AWSSSMDescribeMaintenanceWindowTasksRequest : AWSRequest


/**
 <p>Optional filters used to narrow down the scope of the returned tasks. The supported filter keys are WindowTaskId, TaskArn, Priority, and TaskType.</p>
 */
@property (nonatomic, strong) NSArray<AWSSSMMaintenanceWindowFilter *> * _Nullable filters;

/**
 <p>The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token for the next set of items to return. (You received this token from a previous call.)</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The ID of the maintenance window whose tasks should be retrieved.</p>
 */
@property (nonatomic, strong) NSString * _Nullable windowId;

@end

/**
 
 */
@interface AWSSSMDescribeMaintenanceWindowTasksResult : AWSModel


/**
 <p>The token to use when requesting the next set of items. If there are no additional items to return, the string is empty.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>Information about the tasks in the maintenance window.</p>
 */
@property (nonatomic, strong) NSArray<AWSSSMMaintenanceWindowTask *> * _Nullable tasks;

@end

/**
 
 */
@interface AWSSSMDescribeMaintenanceWindowsForTargetRequest : AWSRequest


/**
 <p>The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token for the next set of items to return. (You received this token from a previous call.)</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The type of resource you want to retrieve information about. For example, "INSTANCE".</p>
 */
@property (nonatomic, assign) AWSSSMMaintenanceWindowResourceType resourceType;

/**
 <p>The instance ID or key/value pair to retrieve information about.</p>
 */
@property (nonatomic, strong) NSArray<AWSSSMTarget *> * _Nullable targets;

@end

/**
 
 */
@interface AWSSSMDescribeMaintenanceWindowsForTargetResult : AWSModel


/**
 <p>The token for the next set of items to return. (You use this token in the next call.)</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>Information about the maintenance window targets and tasks an instance is associated with.</p>
 */
@property (nonatomic, strong) NSArray<AWSSSMMaintenanceWindowIdentityForTarget *> * _Nullable windowIdentities;

@end

/**
 
 */
@interface AWSSSMDescribeMaintenanceWindowsRequest : AWSRequest


/**
 <p>Optional filters used to narrow down the scope of the returned maintenance windows. Supported filter keys are <b>Name</b> and <b>Enabled</b>.</p>
 */
@property (nonatomic, strong) NSArray<AWSSSMMaintenanceWindowFilter *> * _Nullable filters;

/**
 <p>The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token for the next set of items to return. (You received this token from a previous call.)</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSSSMDescribeMaintenanceWindowsResult : AWSModel


/**
 <p>The token to use when requesting the next set of items. If there are no additional items to return, the string is empty.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>Information about the maintenance windows.</p>
 */
@property (nonatomic, strong) NSArray<AWSSSMMaintenanceWindowIdentity *> * _Nullable windowIdentities;

@end

/**
 
 */
@interface AWSSSMDescribeOpsItemsRequest : AWSRequest


/**
 <p>The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>A token to start the list. Use this token to get the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>One or more filters to limit the response.</p><ul><li><p>Key: CreatedTime</p><p>Operations: GreaterThan, LessThan</p></li><li><p>Key: LastModifiedBy</p><p>Operations: Contains, Equals</p></li><li><p>Key: LastModifiedTime</p><p>Operations: GreaterThan, LessThan</p></li><li><p>Key: Priority</p><p>Operations: Equals</p></li><li><p>Key: Source</p><p>Operations: Contains, Equals</p></li><li><p>Key: Status</p><p>Operations: Equals</p></li><li><p>Key: Title</p><p>Operations: Contains</p></li><li><p>Key: OperationalData*</p><p>Operations: Equals</p></li><li><p>Key: OperationalDataKey</p><p>Operations: Equals</p></li><li><p>Key: OperationalDataValue</p><p>Operations: Equals, Contains</p></li><li><p>Key: OpsItemId</p><p>Operations: Equals</p></li><li><p>Key: ResourceId</p><p>Operations: Contains</p></li><li><p>Key: AutomationId</p><p>Operations: Equals</p></li></ul><p>*If you filter the response by using the OperationalData operator, specify a key-value pair by using the following JSON format: {"key":"key_name","value":"a_value"}</p>
 */
@property (nonatomic, strong) NSArray<AWSSSMOpsItemFilter *> * _Nullable opsItemFilters;

@end

/**
 
 */
@interface AWSSSMDescribeOpsItemsResponse : AWSModel


/**
 <p>The token for the next set of items to return. Use this token to get the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>A list of OpsItems.</p>
 */
@property (nonatomic, strong) NSArray<AWSSSMOpsItemSummary *> * _Nullable opsItemSummaries;

@end

/**
 
 */
@interface AWSSSMDescribeParametersRequest : AWSRequest


/**
 <p>This data type is deprecated. Instead, use <code>ParameterFilters</code>.</p>
 */
@property (nonatomic, strong) NSArray<AWSSSMParametersFilter *> * _Nullable filters;

/**
 <p>The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token for the next set of items to return. (You received this token from a previous call.)</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>Filters to limit the request results.</p>
 */
@property (nonatomic, strong) NSArray<AWSSSMParameterStringFilter *> * _Nullable parameterFilters;

@end

/**
 
 */
@interface AWSSSMDescribeParametersResult : AWSModel


/**
 <p>The token to use when requesting the next set of items.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>Parameters returned by the request.</p>
 */
@property (nonatomic, strong) NSArray<AWSSSMParameterMetadata *> * _Nullable parameters;

@end

/**
 
 */
@interface AWSSSMDescribePatchBaselinesRequest : AWSRequest


/**
 <p>Each element in the array is a structure containing: </p><p>Key: (string, "NAME_PREFIX" or "OWNER")</p><p>Value: (array of strings, exactly 1 entry, between 1 and 255 characters)</p>
 */
@property (nonatomic, strong) NSArray<AWSSSMPatchOrchestratorFilter *> * _Nullable filters;

/**
 <p>The maximum number of patch baselines to return (per page).</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token for the next set of items to return. (You received this token from a previous call.)</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSSSMDescribePatchBaselinesResult : AWSModel


/**
 <p>An array of PatchBaselineIdentity elements.</p>
 */
@property (nonatomic, strong) NSArray<AWSSSMPatchBaselineIdentity *> * _Nullable baselineIdentities;

/**
 <p>The token to use when requesting the next set of items. If there are no additional items to return, the string is empty.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSSSMDescribePatchGroupStateRequest : AWSRequest


/**
 <p>The name of the patch group whose patch snapshot should be retrieved.</p>
 */
@property (nonatomic, strong) NSString * _Nullable patchGroup;

@end

/**
 
 */
@interface AWSSSMDescribePatchGroupStateResult : AWSModel


/**
 <p>The number of instances in the patch group.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable instances;

/**
 <p>The number of instances with patches from the patch baseline that failed to install.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable instancesWithFailedPatches;

/**
 <p>The number of instances with patches installed that aren't defined in the patch baseline.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable instancesWithInstalledOtherPatches;

/**
 <p>The number of instances with installed patches.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable instancesWithInstalledPatches;

/**
 <p>The number of instances with patches installed by Patch Manager that have not been rebooted after the patch installation. The status of these instances is NON_COMPLIANT.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable instancesWithInstalledPendingRebootPatches;

/**
 <p>The number of instances with patches installed that are specified in a RejectedPatches list. Patches with a status of <i>INSTALLED_REJECTED</i> were typically installed before they were added to a RejectedPatches list.</p><note><p>If ALLOW_AS_DEPENDENCY is the specified option for RejectedPatchesAction, the value of InstancesWithInstalledRejectedPatches will always be 0 (zero).</p></note>
 */
@property (nonatomic, strong) NSNumber * _Nullable instancesWithInstalledRejectedPatches;

/**
 <p>The number of instances with missing patches from the patch baseline.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable instancesWithMissingPatches;

/**
 <p>The number of instances with patches that aren't applicable.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable instancesWithNotApplicablePatches;

/**
 <p>The number of instances with <code>NotApplicable</code> patches beyond the supported limit, which are not reported by name to Systems Manager Inventory.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable instancesWithUnreportedNotApplicablePatches;

@end

/**
 
 */
@interface AWSSSMDescribePatchGroupsRequest : AWSRequest


/**
 <p>One or more filters. Use a filter to return a more specific list of results.</p><p>For <code>DescribePatchGroups</code>,valid filter keys include the following:</p><ul><li><p><code>NAME_PREFIX</code>: The name of the patch group. Wildcards (*) are accepted.</p></li><li><p><code>OPERATING_SYSTEM</code>: The supported operating system type to return results for. For valid operating system values, see <a>GetDefaultPatchBaselineRequest$OperatingSystem</a> in <a>CreatePatchBaseline</a>.</p><p>Examples:</p><ul><li><p><code>--filters Key=NAME_PREFIX,Values=MyPatchGroup*</code></p></li><li><p><code>--filters Key=OPERATING_SYSTEM,Values=AMAZON_LINUX_2</code></p></li></ul></li></ul>
 */
@property (nonatomic, strong) NSArray<AWSSSMPatchOrchestratorFilter *> * _Nullable filters;

/**
 <p>The maximum number of patch groups to return (per page).</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token for the next set of items to return. (You received this token from a previous call.)</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSSSMDescribePatchGroupsResult : AWSModel


/**
 <p>Each entry in the array contains:</p><p>PatchGroup: string (between 1 and 256 characters, Regex: ^([\p{L}\p{Z}\p{N}_.:/=+\-@]*)$)</p><p>PatchBaselineIdentity: A PatchBaselineIdentity element. </p>
 */
@property (nonatomic, strong) NSArray<AWSSSMPatchGroupPatchBaselineMapping *> * _Nullable mappings;

/**
 <p>The token to use when requesting the next set of items. If there are no additional items to return, the string is empty.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSSSMDescribePatchPropertiesRequest : AWSRequest


/**
 <p>The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token for the next set of items to return. (You received this token from a previous call.)</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The operating system type for which to list patches.</p>
 */
@property (nonatomic, assign) AWSSSMOperatingSystem operatingSystem;

/**
 <p>Indicates whether to list patches for the Windows operating system or for Microsoft applications. Not applicable for Linux operating systems.</p>
 */
@property (nonatomic, assign) AWSSSMPatchSet patchSet;

/**
 <p>The patch property for which you want to view patch details. </p>
 */
@property (nonatomic, assign) AWSSSMPatchProperty property;

@end

/**
 
 */
@interface AWSSSMDescribePatchPropertiesResult : AWSModel


/**
 <p>The token for the next set of items to return. (You use this token in the next call.)</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>A list of the properties for patches matching the filter request parameters.</p>
 */
@property (nonatomic, strong) NSArray<NSDictionary<NSString *, NSString *> *> * _Nullable properties;

@end

/**
 
 */
@interface AWSSSMDescribeSessionsRequest : AWSRequest


/**
 <p>One or more filters to limit the type of sessions returned by the request.</p>
 */
@property (nonatomic, strong) NSArray<AWSSSMSessionFilter *> * _Nullable filters;

/**
 <p>The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token for the next set of items to return. (You received this token from a previous call.)</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The session status to retrieve a list of sessions for. For example, "Active".</p>
 */
@property (nonatomic, assign) AWSSSMSessionState state;

@end

/**
 
 */
@interface AWSSSMDescribeSessionsResponse : AWSModel


/**
 <p>The token for the next set of items to return. (You received this token from a previous call.)</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>A list of sessions meeting the request parameters.</p>
 */
@property (nonatomic, strong) NSArray<AWSSSMSession *> * _Nullable sessions;

@end

/**
 <p>A default version of a document.</p>
 */
@interface AWSSSMDocumentDefaultVersionDescription : AWSModel


/**
 <p>The default version of the document.</p>
 */
@property (nonatomic, strong) NSString * _Nullable defaultVersion;

/**
 <p>The default version of the artifact associated with the document.</p>
 */
@property (nonatomic, strong) NSString * _Nullable defaultVersionName;

/**
 <p>The name of the document.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 <p>Describes a Systems Manager document. </p>
 */
@interface AWSSSMDocumentDescription : AWSModel


/**
 <p>Details about the document attachments, including names, locations, sizes, and so on.</p>
 */
@property (nonatomic, strong) NSArray<AWSSSMAttachmentInformation *> * _Nullable attachmentsInformation;

/**
 <p>The date when the document was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdDate;

/**
 <p>The default version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable defaultVersion;

/**
 <p>A description of the document. </p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The document format, either JSON or YAML.</p>
 */
@property (nonatomic, assign) AWSSSMDocumentFormat documentFormat;

/**
 <p>The type of document.</p>
 */
@property (nonatomic, assign) AWSSSMDocumentType documentType;

/**
 <p>The document version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable documentVersion;

/**
 <p>The Sha256 or Sha1 hash created by the system when the document was created. </p><note><p>Sha1 hashes have been deprecated.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable hash;

/**
 <p>The hash type of the document. Valid values include <code>Sha256</code> or <code>Sha1</code>.</p><note><p>Sha1 hashes have been deprecated.</p></note>
 */
@property (nonatomic, assign) AWSSSMDocumentHashType hashType;

/**
 <p>The latest version of the document.</p>
 */
@property (nonatomic, strong) NSString * _Nullable latestVersion;

/**
 <p>The name of the Systems Manager document.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The AWS user account that created the document.</p>
 */
@property (nonatomic, strong) NSString * _Nullable owner;

/**
 <p>A description of the parameters for a document.</p>
 */
@property (nonatomic, strong) NSArray<AWSSSMDocumentParameter *> * _Nullable parameters;

/**
 <p>The list of OS platforms compatible with this Systems Manager document. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable platformTypes;

/**
 <p>A list of SSM documents required by a document. For example, an <code>ApplicationConfiguration</code> document requires an <code>ApplicationConfigurationSchema</code> document.</p>
 */
@property (nonatomic, strong) NSArray<AWSSSMDocumentRequires *> * _Nullable requires;

/**
 <p>The schema version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable schemaVersion;

/**
 <p>The SHA1 hash of the document, which you can use for verification.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sha1;

/**
 <p>The status of the Systems Manager document.</p>
 */
@property (nonatomic, assign) AWSSSMDocumentStatus status;

/**
 <p>A message returned by AWS Systems Manager that explains the <code>Status</code> value. For example, a <code>Failed</code> status might be explained by the <code>StatusInformation</code> message, "The specified S3 bucket does not exist. Verify that the URL of the S3 bucket is correct."</p>
 */
@property (nonatomic, strong) NSString * _Nullable statusInformation;

/**
 <p>The tags, or metadata, that have been applied to the document.</p>
 */
@property (nonatomic, strong) NSArray<AWSSSMTag *> * _Nullable tags;

/**
 <p>The target type which defines the kinds of resources the document can run on. For example, /AWS::EC2::Instance. For a list of valid resource types, see <a href="http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-template-resource-type-ref.html">AWS resource and property types reference</a> in the <i>AWS CloudFormation User Guide</i>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable targetType;

/**
 <p>The version of the artifact associated with the document.</p>
 */
@property (nonatomic, strong) NSString * _Nullable versionName;

@end

/**
 <p>This data type is deprecated. Instead, use <a>DocumentKeyValuesFilter</a>.</p>
 Required parameters: [key, value]
 */
@interface AWSSSMDocumentFilter : AWSModel


/**
 <p>The name of the filter.</p>
 */
@property (nonatomic, assign) AWSSSMDocumentFilterKey key;

/**
 <p>The value of the filter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 <p>Describes the name of a Systems Manager document.</p>
 */
@interface AWSSSMDocumentIdentifier : AWSModel


/**
 <p>The document format, either JSON or YAML.</p>
 */
@property (nonatomic, assign) AWSSSMDocumentFormat documentFormat;

/**
 <p>The document type.</p>
 */
@property (nonatomic, assign) AWSSSMDocumentType documentType;

/**
 <p>The document version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable documentVersion;

/**
 <p>The name of the Systems Manager document.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The AWS user account that created the document.</p>
 */
@property (nonatomic, strong) NSString * _Nullable owner;

/**
 <p>The operating system platform. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable platformTypes;

/**
 <p>A list of SSM documents required by a document. For example, an <code>ApplicationConfiguration</code> document requires an <code>ApplicationConfigurationSchema</code> document.</p>
 */
@property (nonatomic, strong) NSArray<AWSSSMDocumentRequires *> * _Nullable requires;

/**
 <p>The schema version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable schemaVersion;

/**
 <p>The tags, or metadata, that have been applied to the document.</p>
 */
@property (nonatomic, strong) NSArray<AWSSSMTag *> * _Nullable tags;

/**
 <p>The target type which defines the kinds of resources the document can run on. For example, /AWS::EC2::Instance. For a list of valid resource types, see <a href="http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-template-resource-type-ref.html">AWS resource and property types reference</a> in the <i>AWS CloudFormation User Guide</i>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable targetType;

/**
 <p>An optional field specifying the version of the artifact associated with the document. For example, "Release 12, Update 6". This value is unique across all versions of a document, and cannot be changed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable versionName;

@end

/**
 <p>One or more filters. Use a filter to return a more specific list of documents.</p><p>For keys, you can specify one or more tags that have been applied to a document. </p><p>Other valid values include <code>Owner</code>, <code>Name</code>, <code>PlatformTypes</code>, <code>DocumentType</code>, and <code>TargetType</code>.</p><p>Note that only one Owner can be specified in a request. For example: <code>Key=Owner,Values=Self</code>.</p><p>If you use Name as a key, you can use a name prefix to return a list of documents. For example, in the AWS CLI, to return a list of all documents that begin with <code>Te</code>, run the following command:</p><p><code>aws ssm list-documents --filters Key=Name,Values=Te</code></p><p>If you specify more than two keys, only documents that are identified by all the tags are returned in the results. If you specify more than two values for a key, documents that are identified by any of the values are returned in the results.</p><p>To specify a custom key and value pair, use the format <code>Key=tag:tagName,Values=valueName</code>.</p><p>For example, if you created a Key called region and are using the AWS CLI to call the <code>list-documents</code> command: </p><p><code>aws ssm list-documents --filters Key=tag:region,Values=east,west Key=Owner,Values=Self</code></p>
 */
@interface AWSSSMDocumentKeyValuesFilter : AWSModel


/**
 <p>The name of the filter key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>The value for the filter key.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable values;

@end

/**
 <p>Parameters specified in a System Manager document that run on the server when the command is run. </p>
 */
@interface AWSSSMDocumentParameter : AWSModel


/**
 <p>If specified, the default values for the parameters. Parameters without a default value are required. Parameters with a default value are optional.</p>
 */
@property (nonatomic, strong) NSString * _Nullable defaultValue;

/**
 <p>A description of what the parameter does, how to use it, the default value, and whether or not the parameter is optional.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The name of the parameter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The type of parameter. The type can be either String or StringList.</p>
 */
@property (nonatomic, assign) AWSSSMDocumentParameterType types;

@end

/**
 <p>An SSM document required by the current document.</p>
 Required parameters: [Name]
 */
@interface AWSSSMDocumentRequires : AWSModel


/**
 <p>The name of the required SSM document. The name can be an Amazon Resource Name (ARN).</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The document version required by the current document.</p>
 */
@property (nonatomic, strong) NSString * _Nullable version;

@end

/**
 <p>Version information about the document.</p>
 */
@interface AWSSSMDocumentVersionInfo : AWSModel


/**
 <p>The date the document was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdDate;

/**
 <p>The document format, either JSON or YAML.</p>
 */
@property (nonatomic, assign) AWSSSMDocumentFormat documentFormat;

/**
 <p>The document version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable documentVersion;

/**
 <p>An identifier for the default version of the document.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isDefaultVersion;

/**
 <p>The document name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The status of the Systems Manager document, such as <code>Creating</code>, <code>Active</code>, <code>Failed</code>, and <code>Deleting</code>.</p>
 */
@property (nonatomic, assign) AWSSSMDocumentStatus status;

/**
 <p>A message returned by AWS Systems Manager that explains the <code>Status</code> value. For example, a <code>Failed</code> status might be explained by the <code>StatusInformation</code> message, "The specified S3 bucket does not exist. Verify that the URL of the S3 bucket is correct."</p>
 */
@property (nonatomic, strong) NSString * _Nullable statusInformation;

/**
 <p>The version of the artifact associated with the document. For example, "Release 12, Update 6". This value is unique across all versions of a document, and cannot be changed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable versionName;

@end

/**
 <p>The EffectivePatch structure defines metadata about a patch along with the approval state of the patch in a particular patch baseline. The approval state includes information about whether the patch is currently approved, due to be approved by a rule, explicitly approved, or explicitly rejected and the date the patch was or will be approved.</p>
 */
@interface AWSSSMEffectivePatch : AWSModel


/**
 <p>Provides metadata for a patch, including information such as the KB ID, severity, classification and a URL for where more information can be obtained about the patch.</p>
 */
@property (nonatomic, strong) AWSSSMPatch * _Nullable patch;

/**
 <p>The status of the patch in a patch baseline. This includes information about whether the patch is currently approved, due to be approved by a rule, explicitly approved, or explicitly rejected and the date the patch was or will be approved.</p>
 */
@property (nonatomic, strong) AWSSSMPatchStatus * _Nullable patchStatus;

@end

/**
 <p>Describes a failed association.</p>
 */
@interface AWSSSMFailedCreateAssociation : AWSModel


/**
 <p>The association.</p>
 */
@property (nonatomic, strong) AWSSSMCreateAssociationBatchRequestEntry * _Nullable entry;

/**
 <p>The source of the failure.</p>
 */
@property (nonatomic, assign) AWSSSMFault fault;

/**
 <p>A description of the failure.</p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

@end

/**
 <p>Information about an Automation failure.</p>
 */
@interface AWSSSMFailureDetails : AWSModel


/**
 <p>Detailed information about the Automation step failure.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSArray<NSString *> *> * _Nullable details;

/**
 <p>The stage of the Automation execution when the failure occurred. The stages include the following: InputValidation, PreVerification, Invocation, PostVerification.</p>
 */
@property (nonatomic, strong) NSString * _Nullable failureStage;

/**
 <p>The type of Automation failure. Failure types include the following: Action, Permission, Throttling, Verification, Internal.</p>
 */
@property (nonatomic, strong) NSString * _Nullable failureType;

@end

/**
 
 */
@interface AWSSSMGetAutomationExecutionRequest : AWSRequest


/**
 <p>The unique identifier for an existing automation execution to examine. The execution ID is returned by StartAutomationExecution when the execution of an Automation document is initiated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable automationExecutionId;

@end

/**
 
 */
@interface AWSSSMGetAutomationExecutionResult : AWSModel


/**
 <p>Detailed information about the current state of an automation execution.</p>
 */
@property (nonatomic, strong) AWSSSMAutomationExecution * _Nullable automationExecution;

@end

/**
 
 */
@interface AWSSSMGetCalendarStateRequest : AWSRequest


/**
 <p>(Optional) The specific time for which you want to get calendar state information, in <a href="https://en.wikipedia.org/wiki/ISO_8601">ISO 8601</a> format. If you do not add <code>AtTime</code>, the current time is assumed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable atTime;

/**
 <p>The names or Amazon Resource Names (ARNs) of the Systems Manager documents that represent the calendar entries for which you want to get the state.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable calendarNames;

@end

/**
 
 */
@interface AWSSSMGetCalendarStateResponse : AWSModel


/**
 <p>The time, as an <a href="https://en.wikipedia.org/wiki/ISO_8601">ISO 8601</a> string, that you specified in your command. If you did not specify a time, <code>GetCalendarState</code> uses the current time.</p>
 */
@property (nonatomic, strong) NSString * _Nullable atTime;

/**
 <p>The time, as an <a href="https://en.wikipedia.org/wiki/ISO_8601">ISO 8601</a> string, that the calendar state will change. If the current calendar state is <code>OPEN</code>, <code>NextTransitionTime</code> indicates when the calendar state changes to <code>CLOSED</code>, and vice-versa.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextTransitionTime;

/**
 <p>The state of the calendar. An <code>OPEN</code> calendar indicates that actions are allowed to proceed, and a <code>CLOSED</code> calendar indicates that actions are not allowed to proceed.</p>
 */
@property (nonatomic, assign) AWSSSMCalendarState state;

@end

/**
 
 */
@interface AWSSSMGetCommandInvocationRequest : AWSRequest


/**
 <p>(Required) The parent command ID of the invocation plugin.</p>
 */
@property (nonatomic, strong) NSString * _Nullable commandId;

/**
 <p>(Required) The ID of the managed instance targeted by the command. A managed instance can be an EC2 instance or an instance in your hybrid environment that is configured for Systems Manager.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>(Optional) The name of the plugin for which you want detailed results. If the document contains only one plugin, the name can be omitted and the details will be returned.</p><p>Plugin names are also referred to as step names in Systems Manager documents.</p>
 */
@property (nonatomic, strong) NSString * _Nullable pluginName;

@end

/**
 
 */
@interface AWSSSMGetCommandInvocationResult : AWSModel


/**
 <p>CloudWatch Logs information where Systems Manager sent the command output.</p>
 */
@property (nonatomic, strong) AWSSSMCloudWatchOutputConfig * _Nullable cloudWatchOutputConfig;

/**
 <p>The parent command ID of the invocation plugin.</p>
 */
@property (nonatomic, strong) NSString * _Nullable commandId;

/**
 <p>The comment text for the command.</p>
 */
@property (nonatomic, strong) NSString * _Nullable comment;

/**
 <p>The name of the document that was run. For example, AWS-RunShellScript.</p>
 */
@property (nonatomic, strong) NSString * _Nullable documentName;

/**
 <p>The SSM document version used in the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable documentVersion;

/**
 <p>Duration since ExecutionStartDateTime.</p>
 */
@property (nonatomic, strong) NSString * _Nullable executionElapsedTime;

/**
 <p>The date and time the plugin was finished running. Date and time are written in ISO 8601 format. For example, June 7, 2017 is represented as 2017-06-7. The following sample AWS CLI command uses the <code>InvokedAfter</code> filter.</p><p><code>aws ssm list-commands --filters key=InvokedAfter,value=2017-06-07T00:00:00Z</code></p><p>If the plugin has not started to run, the string is empty.</p>
 */
@property (nonatomic, strong) NSString * _Nullable executionEndDateTime;

/**
 <p>The date and time the plugin started running. Date and time are written in ISO 8601 format. For example, June 7, 2017 is represented as 2017-06-7. The following sample AWS CLI command uses the <code>InvokedBefore</code> filter.</p><p><code>aws ssm list-commands --filters key=InvokedBefore,value=2017-06-07T00:00:00Z</code></p><p>If the plugin has not started to run, the string is empty.</p>
 */
@property (nonatomic, strong) NSString * _Nullable executionStartDateTime;

/**
 <p>The ID of the managed instance targeted by the command. A managed instance can be an EC2 instance or an instance in your hybrid environment that is configured for Systems Manager.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The name of the plugin for which you want detailed results. For example, aws:RunShellScript is a plugin.</p>
 */
@property (nonatomic, strong) NSString * _Nullable pluginName;

/**
 <p>The error level response code for the plugin script. If the response code is -1, then the command has not started running on the instance, or it was not received by the instance.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable responseCode;

/**
 <p>The first 8,000 characters written by the plugin to stderr. If the command has not finished running, then this string is empty.</p>
 */
@property (nonatomic, strong) NSString * _Nullable standardErrorContent;

/**
 <p>The URL for the complete text written by the plugin to stderr. If the command has not finished running, then this string is empty.</p>
 */
@property (nonatomic, strong) NSString * _Nullable standardErrorUrl;

/**
 <p>The first 24,000 characters written by the plugin to stdout. If the command has not finished running, if ExecutionStatus is neither Succeeded nor Failed, then this string is empty.</p>
 */
@property (nonatomic, strong) NSString * _Nullable standardOutputContent;

/**
 <p>The URL for the complete text written by the plugin to stdout in Amazon S3. If an S3 bucket was not specified, then this string is empty.</p>
 */
@property (nonatomic, strong) NSString * _Nullable standardOutputUrl;

/**
 <p>The status of this invocation plugin. This status can be different than StatusDetails.</p>
 */
@property (nonatomic, assign) AWSSSMCommandInvocationStatus status;

/**
 <p>A detailed status of the command execution for an invocation. StatusDetails includes more information than Status because it includes states resulting from error and concurrency control parameters. StatusDetails can show different results than Status. For more information about these statuses, see <a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/monitor-commands.html">Understanding command statuses</a> in the <i>AWS Systems Manager User Guide</i>. StatusDetails can be one of the following values:</p><ul><li><p>Pending: The command has not been sent to the instance.</p></li><li><p>In Progress: The command has been sent to the instance but has not reached a terminal state.</p></li><li><p>Delayed: The system attempted to send the command to the target, but the target was not available. The instance might not be available because of network issues, because the instance was stopped, or for similar reasons. The system will try to send the command again.</p></li><li><p>Success: The command or plugin ran successfully. This is a terminal state.</p></li><li><p>Delivery Timed Out: The command was not delivered to the instance before the delivery timeout expired. Delivery timeouts do not count against the parent command's MaxErrors limit, but they do contribute to whether the parent command status is Success or Incomplete. This is a terminal state.</p></li><li><p>Execution Timed Out: The command started to run on the instance, but the execution was not complete before the timeout expired. Execution timeouts count against the MaxErrors limit of the parent command. This is a terminal state.</p></li><li><p>Failed: The command wasn't run successfully on the instance. For a plugin, this indicates that the result code was not zero. For a command invocation, this indicates that the result code for one or more plugins was not zero. Invocation failures count against the MaxErrors limit of the parent command. This is a terminal state.</p></li><li><p>Canceled: The command was terminated before it was completed. This is a terminal state.</p></li><li><p>Undeliverable: The command can't be delivered to the instance. The instance might not exist or might not be responding. Undeliverable invocations don't count against the parent command's MaxErrors limit and don't contribute to whether the parent command status is Success or Incomplete. This is a terminal state.</p></li><li><p>Terminated: The parent command exceeded its MaxErrors limit and subsequent command invocations were canceled by the system. This is a terminal state.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable statusDetails;

@end

/**
 
 */
@interface AWSSSMGetConnectionStatusRequest : AWSRequest


/**
 <p>The ID of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable target;

@end

/**
 
 */
@interface AWSSSMGetConnectionStatusResponse : AWSModel


/**
 <p>The status of the connection to the instance. For example, 'Connected' or 'Not Connected'.</p>
 */
@property (nonatomic, assign) AWSSSMConnectionStatus status;

/**
 <p>The ID of the instance to check connection status. </p>
 */
@property (nonatomic, strong) NSString * _Nullable target;

@end

/**
 
 */
@interface AWSSSMGetDefaultPatchBaselineRequest : AWSRequest


/**
 <p>Returns the default patch baseline for the specified operating system.</p>
 */
@property (nonatomic, assign) AWSSSMOperatingSystem operatingSystem;

@end

/**
 
 */
@interface AWSSSMGetDefaultPatchBaselineResult : AWSModel


/**
 <p>The ID of the default patch baseline.</p>
 */
@property (nonatomic, strong) NSString * _Nullable baselineId;

/**
 <p>The operating system for the returned patch baseline. </p>
 */
@property (nonatomic, assign) AWSSSMOperatingSystem operatingSystem;

@end

/**
 
 */
@interface AWSSSMGetDeployablePatchSnapshotForInstanceRequest : AWSRequest


/**
 <p>The ID of the instance for which the appropriate patch snapshot should be retrieved.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The user-defined snapshot ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable snapshotId;

@end

/**
 
 */
@interface AWSSSMGetDeployablePatchSnapshotForInstanceResult : AWSModel


/**
 <p>The ID of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>Returns the specific operating system (for example Windows Server 2012 or Amazon Linux 2015.09) on the instance for the specified patch snapshot.</p>
 */
@property (nonatomic, strong) NSString * _Nullable product;

/**
 <p>A pre-signed Amazon S3 URL that can be used to download the patch snapshot.</p>
 */
@property (nonatomic, strong) NSString * _Nullable snapshotDownloadUrl;

/**
 <p>The user-defined snapshot ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable snapshotId;

@end

/**
 
 */
@interface AWSSSMGetDocumentRequest : AWSRequest


/**
 <p>Returns the document in the specified format. The document format can be either JSON or YAML. JSON is the default format.</p>
 */
@property (nonatomic, assign) AWSSSMDocumentFormat documentFormat;

/**
 <p>The document version for which you want information.</p>
 */
@property (nonatomic, strong) NSString * _Nullable documentVersion;

/**
 <p>The name of the Systems Manager document.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>An optional field specifying the version of the artifact associated with the document. For example, "Release 12, Update 6". This value is unique across all versions of a document and can't be changed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable versionName;

@end

/**
 
 */
@interface AWSSSMGetDocumentResult : AWSModel


/**
 <p>A description of the document attachments, including names, locations, sizes, and so on.</p>
 */
@property (nonatomic, strong) NSArray<AWSSSMAttachmentContent *> * _Nullable attachmentsContent;

/**
 <p>The contents of the Systems Manager document.</p>
 */
@property (nonatomic, strong) NSString * _Nullable content;

/**
 <p>The document format, either JSON or YAML.</p>
 */
@property (nonatomic, assign) AWSSSMDocumentFormat documentFormat;

/**
 <p>The document type.</p>
 */
@property (nonatomic, assign) AWSSSMDocumentType documentType;

/**
 <p>The document version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable documentVersion;

/**
 <p>The name of the Systems Manager document.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>A list of SSM documents required by a document. For example, an <code>ApplicationConfiguration</code> document requires an <code>ApplicationConfigurationSchema</code> document.</p>
 */
@property (nonatomic, strong) NSArray<AWSSSMDocumentRequires *> * _Nullable requires;

/**
 <p>The status of the Systems Manager document, such as <code>Creating</code>, <code>Active</code>, <code>Updating</code>, <code>Failed</code>, and <code>Deleting</code>.</p>
 */
@property (nonatomic, assign) AWSSSMDocumentStatus status;

/**
 <p>A message returned by AWS Systems Manager that explains the <code>Status</code> value. For example, a <code>Failed</code> status might be explained by the <code>StatusInformation</code> message, "The specified S3 bucket does not exist. Verify that the URL of the S3 bucket is correct."</p>
 */
@property (nonatomic, strong) NSString * _Nullable statusInformation;

/**
 <p>The version of the artifact associated with the document. For example, "Release 12, Update 6". This value is unique across all versions of a document, and cannot be changed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable versionName;

@end

/**
 
 */
@interface AWSSSMGetInventoryRequest : AWSRequest


/**
 <p>Returns counts of inventory types based on one or more expressions. For example, if you aggregate by using an expression that uses the <code>AWS:InstanceInformation.PlatformType</code> type, you can see a count of how many Windows and Linux instances exist in your inventoried fleet.</p>
 */
@property (nonatomic, strong) NSArray<AWSSSMInventoryAggregator *> * _Nullable aggregators;

/**
 <p>One or more filters. Use a filter to return a more specific list of results.</p>
 */
@property (nonatomic, strong) NSArray<AWSSSMInventoryFilter *> * _Nullable filters;

/**
 <p>The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token for the next set of items to return. (You received this token from a previous call.)</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The list of inventory item types to return.</p>
 */
@property (nonatomic, strong) NSArray<AWSSSMResultAttribute *> * _Nullable resultAttributes;

@end

/**
 
 */
@interface AWSSSMGetInventoryResult : AWSModel


/**
 <p>Collection of inventory entities such as a collection of instance inventory. </p>
 */
@property (nonatomic, strong) NSArray<AWSSSMInventoryResultEntity *> * _Nullable entities;

/**
 <p>The token to use when requesting the next set of items. If there are no additional items to return, the string is empty.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSSSMGetInventorySchemaRequest : AWSRequest


/**
 <p>Returns inventory schemas that support aggregation. For example, this call returns the <code>AWS:InstanceInformation</code> type, because it supports aggregation based on the <code>PlatformName</code>, <code>PlatformType</code>, and <code>PlatformVersion</code> attributes.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable aggregator;

/**
 <p>The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token for the next set of items to return. (You received this token from a previous call.)</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>Returns the sub-type schema for a specified inventory type.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable subType;

/**
 <p>The type of inventory item to return.</p>
 */
@property (nonatomic, strong) NSString * _Nullable typeName;

@end

/**
 
 */
@interface AWSSSMGetInventorySchemaResult : AWSModel


/**
 <p>The token to use when requesting the next set of items. If there are no additional items to return, the string is empty.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>Inventory schemas returned by the request.</p>
 */
@property (nonatomic, strong) NSArray<AWSSSMInventoryItemSchema *> * _Nullable schemas;

@end

/**
 
 */
@interface AWSSSMGetMaintenanceWindowExecutionRequest : AWSRequest


/**
 <p>The ID of the maintenance window execution that includes the task.</p>
 */
@property (nonatomic, strong) NSString * _Nullable windowExecutionId;

@end

/**
 
 */
@interface AWSSSMGetMaintenanceWindowExecutionResult : AWSModel


/**
 <p>The time the maintenance window finished running.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable endTime;

/**
 <p>The time the maintenance window started running.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable startTime;

/**
 <p>The status of the maintenance window execution.</p>
 */
@property (nonatomic, assign) AWSSSMMaintenanceWindowExecutionStatus status;

/**
 <p>The details explaining the Status. Only available for certain status values.</p>
 */
@property (nonatomic, strong) NSString * _Nullable statusDetails;

/**
 <p>The ID of the task executions from the maintenance window execution.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable taskIds;

/**
 <p>The ID of the maintenance window execution.</p>
 */
@property (nonatomic, strong) NSString * _Nullable windowExecutionId;

@end

/**
 
 */
@interface AWSSSMGetMaintenanceWindowExecutionTaskInvocationRequest : AWSRequest


/**
 <p>The invocation ID to retrieve.</p>
 */
@property (nonatomic, strong) NSString * _Nullable invocationId;

/**
 <p>The ID of the specific task in the maintenance window task that should be retrieved. </p>
 */
@property (nonatomic, strong) NSString * _Nullable taskId;

/**
 <p>The ID of the maintenance window execution for which the task is a part.</p>
 */
@property (nonatomic, strong) NSString * _Nullable windowExecutionId;

@end

/**
 
 */
@interface AWSSSMGetMaintenanceWindowExecutionTaskInvocationResult : AWSModel


/**
 <p>The time that the task finished running on the target.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable endTime;

/**
 <p>The execution ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable executionId;

/**
 <p>The invocation ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable invocationId;

/**
 <p>User-provided value to be included in any CloudWatch events raised while running tasks for these targets in this maintenance window. </p>
 */
@property (nonatomic, strong) NSString * _Nullable ownerInformation;

/**
 <p>The parameters used at the time that the task ran.</p>
 */
@property (nonatomic, strong) NSString * _Nullable parameters;

/**
 <p>The time that the task started running on the target.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable startTime;

/**
 <p>The task status for an invocation.</p>
 */
@property (nonatomic, assign) AWSSSMMaintenanceWindowExecutionStatus status;

/**
 <p>The details explaining the status. Details are only available for certain status values.</p>
 */
@property (nonatomic, strong) NSString * _Nullable statusDetails;

/**
 <p>The task execution ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable taskExecutionId;

/**
 <p>Retrieves the task type for a maintenance window. Task types include the following: LAMBDA, STEP_FUNCTIONS, AUTOMATION, RUN_COMMAND.</p>
 */
@property (nonatomic, assign) AWSSSMMaintenanceWindowTaskType taskType;

/**
 <p>The maintenance window execution ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable windowExecutionId;

/**
 <p>The maintenance window target ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable windowTargetId;

@end

/**
 
 */
@interface AWSSSMGetMaintenanceWindowExecutionTaskRequest : AWSRequest


/**
 <p>The ID of the specific task execution in the maintenance window task that should be retrieved.</p>
 */
@property (nonatomic, strong) NSString * _Nullable taskId;

/**
 <p>The ID of the maintenance window execution that includes the task.</p>
 */
@property (nonatomic, strong) NSString * _Nullable windowExecutionId;

@end

/**
 
 */
@interface AWSSSMGetMaintenanceWindowExecutionTaskResult : AWSModel


/**
 <p>The time the task execution completed.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable endTime;

/**
 <p>The defined maximum number of task executions that could be run in parallel.</p>
 */
@property (nonatomic, strong) NSString * _Nullable maxConcurrency;

/**
 <p>The defined maximum number of task execution errors allowed before scheduling of the task execution would have been stopped.</p>
 */
@property (nonatomic, strong) NSString * _Nullable maxErrors;

/**
 <p>The priority of the task.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable priority;

/**
 <p>The role that was assumed when running the task.</p>
 */
@property (nonatomic, strong) NSString * _Nullable serviceRole;

/**
 <p>The time the task execution started.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable startTime;

/**
 <p>The status of the task.</p>
 */
@property (nonatomic, assign) AWSSSMMaintenanceWindowExecutionStatus status;

/**
 <p>The details explaining the Status. Only available for certain status values.</p>
 */
@property (nonatomic, strong) NSString * _Nullable statusDetails;

/**
 <p>The ARN of the task that ran.</p>
 */
@property (nonatomic, strong) NSString * _Nullable taskArn;

/**
 <p>The ID of the specific task execution in the maintenance window task that was retrieved.</p>
 */
@property (nonatomic, strong) NSString * _Nullable taskExecutionId;

/**
 <p>The parameters passed to the task when it was run.</p><note><p><code>TaskParameters</code> has been deprecated. To specify parameters to pass to a task when it runs, instead use the <code>Parameters</code> option in the <code>TaskInvocationParameters</code> structure. For information about how Systems Manager handles these options for the supported maintenance window task types, see <a>MaintenanceWindowTaskInvocationParameters</a>.</p></note><p>The map has the following format:</p><p>Key: string, between 1 and 255 characters</p><p>Value: an array of strings, each string is between 1 and 255 characters</p>
 */
@property (nonatomic, strong) NSArray<NSDictionary<NSString *, AWSSSMMaintenanceWindowTaskParameterValueExpression *> *> * _Nullable taskParameters;

/**
 <p>The type of task that was run.</p>
 */
@property (nonatomic, assign) AWSSSMMaintenanceWindowTaskType types;

/**
 <p>The ID of the maintenance window execution that includes the task.</p>
 */
@property (nonatomic, strong) NSString * _Nullable windowExecutionId;

@end

/**
 
 */
@interface AWSSSMGetMaintenanceWindowRequest : AWSRequest


/**
 <p>The ID of the maintenance window for which you want to retrieve information.</p>
 */
@property (nonatomic, strong) NSString * _Nullable windowId;

@end

/**
 
 */
@interface AWSSSMGetMaintenanceWindowResult : AWSModel


/**
 <p>Whether targets must be registered with the maintenance window before tasks can be defined for those targets.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable allowUnassociatedTargets;

/**
 <p>The date the maintenance window was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdDate;

/**
 <p>The number of hours before the end of the maintenance window that Systems Manager stops scheduling new tasks for execution.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable cutoff;

/**
 <p>The description of the maintenance window.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The duration of the maintenance window in hours.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable duration;

/**
 <p>Indicates whether the maintenance window is enabled.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

/**
 <p>The date and time, in ISO-8601 Extended format, for when the maintenance window is scheduled to become inactive. The maintenance window will not run after this specified time.</p>
 */
@property (nonatomic, strong) NSString * _Nullable endDate;

/**
 <p>The date the maintenance window was last modified.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable modifiedDate;

/**
 <p>The name of the maintenance window.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The next time the maintenance window will actually run, taking into account any specified times for the maintenance window to become active or inactive.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextExecutionTime;

/**
 <p>The schedule of the maintenance window in the form of a cron or rate expression.</p>
 */
@property (nonatomic, strong) NSString * _Nullable schedule;

/**
 <p>The number of days to wait to run a maintenance window after the scheduled CRON expression date and time.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable scheduleOffset;

/**
 <p>The time zone that the scheduled maintenance window executions are based on, in Internet Assigned Numbers Authority (IANA) format. For example: "America/Los_Angeles", "etc/UTC", or "Asia/Seoul". For more information, see the <a href="https://www.iana.org/time-zones">Time Zone Database</a> on the IANA website.</p>
 */
@property (nonatomic, strong) NSString * _Nullable scheduleTimezone;

/**
 <p>The date and time, in ISO-8601 Extended format, for when the maintenance window is scheduled to become active. The maintenance window will not run before this specified time.</p>
 */
@property (nonatomic, strong) NSString * _Nullable startDate;

/**
 <p>The ID of the created maintenance window.</p>
 */
@property (nonatomic, strong) NSString * _Nullable windowId;

@end

/**
 
 */
@interface AWSSSMGetMaintenanceWindowTaskRequest : AWSRequest


/**
 <p>The maintenance window ID that includes the task to retrieve.</p>
 */
@property (nonatomic, strong) NSString * _Nullable windowId;

/**
 <p>The maintenance window task ID to retrieve.</p>
 */
@property (nonatomic, strong) NSString * _Nullable windowTaskId;

@end

/**
 
 */
@interface AWSSSMGetMaintenanceWindowTaskResult : AWSModel


/**
 <p>The retrieved task description.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The location in Amazon S3 where the task results are logged.</p><note><p><code>LoggingInfo</code> has been deprecated. To specify an S3 bucket to contain logs, instead use the <code>OutputS3BucketName</code> and <code>OutputS3KeyPrefix</code> options in the <code>TaskInvocationParameters</code> structure. For information about how Systems Manager handles these options for the supported maintenance window task types, see <a>MaintenanceWindowTaskInvocationParameters</a>.</p></note>
 */
@property (nonatomic, strong) AWSSSMLoggingInfo * _Nullable loggingInfo;

/**
 <p>The maximum number of targets allowed to run this task in parallel.</p>
 */
@property (nonatomic, strong) NSString * _Nullable maxConcurrency;

/**
 <p>The maximum number of errors allowed before the task stops being scheduled.</p>
 */
@property (nonatomic, strong) NSString * _Nullable maxErrors;

/**
 <p>The retrieved task name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The priority of the task when it runs. The lower the number, the higher the priority. Tasks that have the same priority are scheduled in parallel.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable priority;

/**
 <p>The ARN of the IAM service role to use to publish Amazon Simple Notification Service (Amazon SNS) notifications for maintenance window Run Command tasks.</p>
 */
@property (nonatomic, strong) NSString * _Nullable serviceRoleArn;

/**
 <p>The targets where the task should run.</p>
 */
@property (nonatomic, strong) NSArray<AWSSSMTarget *> * _Nullable targets;

/**
 <p>The resource that the task used during execution. For RUN_COMMAND and AUTOMATION task types, the TaskArn is the Systems Manager Document name/ARN. For LAMBDA tasks, the value is the function name/ARN. For STEP_FUNCTIONS tasks, the value is the state machine ARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable taskArn;

/**
 <p>The parameters to pass to the task when it runs.</p>
 */
@property (nonatomic, strong) AWSSSMMaintenanceWindowTaskInvocationParameters * _Nullable taskInvocationParameters;

/**
 <p>The parameters to pass to the task when it runs.</p><note><p><code>TaskParameters</code> has been deprecated. To specify parameters to pass to a task when it runs, instead use the <code>Parameters</code> option in the <code>TaskInvocationParameters</code> structure. For information about how Systems Manager handles these options for the supported maintenance window task types, see <a>MaintenanceWindowTaskInvocationParameters</a>.</p></note>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSSSMMaintenanceWindowTaskParameterValueExpression *> * _Nullable taskParameters;

/**
 <p>The type of task to run.</p>
 */
@property (nonatomic, assign) AWSSSMMaintenanceWindowTaskType taskType;

/**
 <p>The retrieved maintenance window ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable windowId;

/**
 <p>The retrieved maintenance window task ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable windowTaskId;

@end

/**
 
 */
@interface AWSSSMGetOpsItemRequest : AWSRequest


/**
 <p>The ID of the OpsItem that you want to get.</p>
 */
@property (nonatomic, strong) NSString * _Nullable opsItemId;

@end

/**
 
 */
@interface AWSSSMGetOpsItemResponse : AWSModel


/**
 <p>The OpsItem.</p>
 */
@property (nonatomic, strong) AWSSSMOpsItem * _Nullable opsItem;

@end

/**
 
 */
@interface AWSSSMGetOpsSummaryRequest : AWSRequest


/**
 <p>Optional aggregators that return counts of OpsItems based on one or more expressions.</p>
 */
@property (nonatomic, strong) NSArray<AWSSSMOpsAggregator *> * _Nullable aggregators;

/**
 <p>Optional filters used to scope down the returned OpsItems. </p>
 */
@property (nonatomic, strong) NSArray<AWSSSMOpsFilter *> * _Nullable filters;

/**
 <p>The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>A token to start the list. Use this token to get the next set of results. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The OpsItem data type to return.</p>
 */
@property (nonatomic, strong) NSArray<AWSSSMOpsResultAttribute *> * _Nullable resultAttributes;

/**
 <p>Specify the name of a resource data sync to get.</p>
 */
@property (nonatomic, strong) NSString * _Nullable syncName;

@end

/**
 
 */
@interface AWSSSMGetOpsSummaryResult : AWSModel


/**
 <p>The list of aggregated and filtered OpsItems.</p>
 */
@property (nonatomic, strong) NSArray<AWSSSMOpsEntity *> * _Nullable entities;

/**
 <p>The token for the next set of items to return. Use this token to get the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSSSMGetParameterHistoryRequest : AWSRequest


/**
 <p>The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The name of a parameter you want to query.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The token for the next set of items to return. (You received this token from a previous call.)</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>Return decrypted values for secure string parameters. This flag is ignored for String and StringList parameter types.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable withDecryption;

@end

/**
 
 */
@interface AWSSSMGetParameterHistoryResult : AWSModel


/**
 <p>The token to use when requesting the next set of items. If there are no additional items to return, the string is empty.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>A list of parameters returned by the request.</p>
 */
@property (nonatomic, strong) NSArray<AWSSSMParameterHistory *> * _Nullable parameters;

@end

/**
 
 */
@interface AWSSSMGetParameterRequest : AWSRequest


/**
 <p>The name of the parameter you want to query.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>Return decrypted values for secure string parameters. This flag is ignored for String and StringList parameter types.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable withDecryption;

@end

/**
 
 */
@interface AWSSSMGetParameterResult : AWSModel


/**
 <p>Information about a parameter.</p>
 */
@property (nonatomic, strong) AWSSSMParameter * _Nullable parameter;

@end

/**
 
 */
@interface AWSSSMGetParametersByPathRequest : AWSRequest


/**
 <p>The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>A token to start the list. Use this token to get the next set of results. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>Filters to limit the request results.</p>
 */
@property (nonatomic, strong) NSArray<AWSSSMParameterStringFilter *> * _Nullable parameterFilters;

/**
 <p>The hierarchy for the parameter. Hierarchies start with a forward slash (/) and end with the parameter name. A parameter name hierarchy can have a maximum of 15 levels. Here is an example of a hierarchy: <code>/Finance/Prod/IAD/WinServ2016/license33</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable path;

/**
 <p>Retrieve all parameters within a hierarchy.</p><important><p>If a user has access to a path, then the user can access all levels of that path. For example, if a user has permission to access path <code>/a</code>, then the user can also access <code>/a/b</code>. Even if a user has explicitly been denied access in IAM for parameter <code>/a/b</code>, they can still call the GetParametersByPath API action recursively for <code>/a</code> and view <code>/a/b</code>.</p></important>
 */
@property (nonatomic, strong) NSNumber * _Nullable recursive;

/**
 <p>Retrieve all parameters in a hierarchy with their value decrypted.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable withDecryption;

@end

/**
 
 */
@interface AWSSSMGetParametersByPathResult : AWSModel


/**
 <p>The token for the next set of items to return. Use this token to get the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>A list of parameters found in the specified hierarchy.</p>
 */
@property (nonatomic, strong) NSArray<AWSSSMParameter *> * _Nullable parameters;

@end

/**
 
 */
@interface AWSSSMGetParametersRequest : AWSRequest


/**
 <p>Names of the parameters for which you want to query information.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable names;

/**
 <p>Return decrypted secure string value. Return decrypted values for secure string parameters. This flag is ignored for String and StringList parameter types.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable withDecryption;

@end

/**
 
 */
@interface AWSSSMGetParametersResult : AWSModel


/**
 <p>A list of parameters that are not formatted correctly or do not run during an execution.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable invalidParameters;

/**
 <p>A list of details for a parameter.</p>
 */
@property (nonatomic, strong) NSArray<AWSSSMParameter *> * _Nullable parameters;

@end

/**
 
 */
@interface AWSSSMGetPatchBaselineForPatchGroupRequest : AWSRequest


/**
 <p>Returns he operating system rule specified for patch groups using the patch baseline.</p>
 */
@property (nonatomic, assign) AWSSSMOperatingSystem operatingSystem;

/**
 <p>The name of the patch group whose patch baseline should be retrieved.</p>
 */
@property (nonatomic, strong) NSString * _Nullable patchGroup;

@end

/**
 
 */
@interface AWSSSMGetPatchBaselineForPatchGroupResult : AWSModel


/**
 <p>The ID of the patch baseline that should be used for the patch group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable baselineId;

/**
 <p>The operating system rule specified for patch groups using the patch baseline.</p>
 */
@property (nonatomic, assign) AWSSSMOperatingSystem operatingSystem;

/**
 <p>The name of the patch group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable patchGroup;

@end

/**
 
 */
@interface AWSSSMGetPatchBaselineRequest : AWSRequest


/**
 <p>The ID of the patch baseline to retrieve.</p>
 */
@property (nonatomic, strong) NSString * _Nullable baselineId;

@end

/**
 
 */
@interface AWSSSMGetPatchBaselineResult : AWSModel


/**
 <p>A set of rules used to include patches in the baseline.</p>
 */
@property (nonatomic, strong) AWSSSMPatchRuleGroup * _Nullable approvalRules;

/**
 <p>A list of explicitly approved patches for the baseline.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable approvedPatches;

/**
 <p>Returns the specified compliance severity level for approved patches in the patch baseline.</p>
 */
@property (nonatomic, assign) AWSSSMPatchComplianceLevel approvedPatchesComplianceLevel;

/**
 <p>Indicates whether the list of approved patches includes non-security updates that should be applied to the instances. The default value is 'false'. Applies to Linux instances only.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable approvedPatchesEnableNonSecurity;

/**
 <p>The ID of the retrieved patch baseline.</p>
 */
@property (nonatomic, strong) NSString * _Nullable baselineId;

/**
 <p>The date the patch baseline was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdDate;

/**
 <p>A description of the patch baseline.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>A set of global filters used to exclude patches from the baseline.</p>
 */
@property (nonatomic, strong) AWSSSMPatchFilterGroup * _Nullable globalFilters;

/**
 <p>The date the patch baseline was last modified.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable modifiedDate;

/**
 <p>The name of the patch baseline.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>Returns the operating system specified for the patch baseline.</p>
 */
@property (nonatomic, assign) AWSSSMOperatingSystem operatingSystem;

/**
 <p>Patch groups included in the patch baseline.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable patchGroups;

/**
 <p>A list of explicitly rejected patches for the baseline.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable rejectedPatches;

/**
 <p>The action specified to take on patches included in the RejectedPatches list. A patch can be allowed only if it is a dependency of another package, or blocked entirely along with packages that include it as a dependency.</p>
 */
@property (nonatomic, assign) AWSSSMPatchAction rejectedPatchesAction;

/**
 <p>Information about the patches to use to update the instances, including target operating systems and source repositories. Applies to Linux instances only.</p>
 */
@property (nonatomic, strong) NSArray<AWSSSMPatchSource *> * _Nullable sources;

@end

/**
 <p>The request body of the GetServiceSetting API action.</p>
 Required parameters: [SettingId]
 */
@interface AWSSSMGetServiceSettingRequest : AWSRequest


/**
 <p>The ID of the service setting to get. The setting ID can be <code>/ssm/parameter-store/default-parameter-tier</code>, <code>/ssm/parameter-store/high-throughput-enabled</code>, or <code>/ssm/managed-instance/activation-tier</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable settingId;

@end

/**
 <p>The query result body of the GetServiceSetting API action.</p>
 */
@interface AWSSSMGetServiceSettingResult : AWSModel


/**
 <p>The query result of the current service setting.</p>
 */
@property (nonatomic, strong) AWSSSMServiceSetting * _Nullable serviceSetting;

@end

/**
 <p>Status information about the aggregated associations.</p>
 */
@interface AWSSSMInstanceAggregatedAssociationOverview : AWSModel


/**
 <p>Detailed status information about the aggregated associations.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detailedStatus;

/**
 <p>The number of associations for the instance(s).</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSNumber *> * _Nullable instanceAssociationStatusAggregatedCount;

@end

/**
 <p>One or more association documents on the instance. </p>
 */
@interface AWSSSMInstanceAssociation : AWSModel


/**
 <p>The association ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable associationId;

/**
 <p>Version information for the association on the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable associationVersion;

/**
 <p>The content of the association document for the instance(s).</p>
 */
@property (nonatomic, strong) NSString * _Nullable content;

/**
 <p>The instance ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

@end

/**
 <p>An S3 bucket where you want to store the results of this request.</p>
 */
@interface AWSSSMInstanceAssociationOutputLocation : AWSModel


/**
 <p>An S3 bucket where you want to store the results of this request.</p>
 */
@property (nonatomic, strong) AWSSSMS3OutputLocation * _Nullable s3Location;

@end

/**
 <p>The URL of S3 bucket where you want to store the results of this request.</p>
 */
@interface AWSSSMInstanceAssociationOutputUrl : AWSModel


/**
 <p>The URL of S3 bucket where you want to store the results of this request.</p>
 */
@property (nonatomic, strong) AWSSSMS3OutputUrl * _Nullable s3OutputUrl;

@end

/**
 <p>Status information about the instance association.</p>
 */
@interface AWSSSMInstanceAssociationStatusInfo : AWSModel


/**
 <p>The association ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable associationId;

/**
 <p>The name of the association applied to the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable associationName;

/**
 <p>The version of the association applied to the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable associationVersion;

/**
 <p>Detailed status information about the instance association.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detailedStatus;

/**
 <p>The association document versions.</p>
 */
@property (nonatomic, strong) NSString * _Nullable documentVersion;

/**
 <p>An error code returned by the request to create the association.</p>
 */
@property (nonatomic, strong) NSString * _Nullable errorCode;

/**
 <p>The date the instance association ran. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable executionDate;

/**
 <p>Summary information about association execution.</p>
 */
@property (nonatomic, strong) NSString * _Nullable executionSummary;

/**
 <p>The instance ID where the association was created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The name of the association.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>A URL for an S3 bucket where you want to store the results of this request.</p>
 */
@property (nonatomic, strong) AWSSSMInstanceAssociationOutputUrl * _Nullable outputUrl;

/**
 <p>Status information about the instance association.</p>
 */
@property (nonatomic, strong) NSString * _Nullable status;

@end

/**
 <p>Describes a filter for a specific list of instances. </p>
 */
@interface AWSSSMInstanceInformation : AWSModel


/**
 <p>The activation ID created by Systems Manager when the server or VM was registered.</p>
 */
@property (nonatomic, strong) NSString * _Nullable activationId;

/**
 <p>The version of SSM Agent running on your Linux instance. </p>
 */
@property (nonatomic, strong) NSString * _Nullable agentVersion;

/**
 <p>Information about the association.</p>
 */
@property (nonatomic, strong) AWSSSMInstanceAggregatedAssociationOverview * _Nullable associationOverview;

/**
 <p>The status of the association.</p>
 */
@property (nonatomic, strong) NSString * _Nullable associationStatus;

/**
 <p>The fully qualified host name of the managed instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable computerName;

/**
 <p>The IP address of the managed instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable IPAddress;

/**
 <p>The Amazon Identity and Access Management (IAM) role assigned to the on-premises Systems Manager managed instance. This call does not return the IAM role for EC2 instances. To retrieve the IAM role for an EC2 instance, use the Amazon EC2 <code>DescribeInstances</code> action. For information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_DescribeInstances.html">DescribeInstances</a> in the <i>Amazon EC2 API Reference</i> or <a href="http://docs.aws.amazon.com/cli/latest/reference/ec2/describe-instances.html">describe-instances</a> in the <i>AWS CLI Command Reference</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable iamRole;

/**
 <p>The instance ID. </p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>Indicates whether the latest version of SSM Agent is running on your Linux Managed Instance. This field does not indicate whether or not the latest version is installed on Windows managed instances, because some older versions of Windows Server use the EC2Config service to process SSM requests.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isLatestVersion;

/**
 <p>The date the association was last run.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastAssociationExecutionDate;

/**
 <p>The date and time when agent last pinged Systems Manager service. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastPingDateTime;

/**
 <p>The last date the association was successfully run.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastSuccessfulAssociationExecutionDate;

/**
 <p>The name assigned to an on-premises server or virtual machine (VM) when it is activated as a Systems Manager managed instance. The name is specified as the <code>DefaultInstanceName</code> property using the <a>CreateActivation</a> command. It is applied to the managed instance by specifying the Activation Code and Activation ID when you install SSM Agent on the instance, as explained in <a href="http://docs.aws.amazon.com/systems-manager/latest/userguide/sysman-install-managed-linux.html">Install SSM Agent for a hybrid environment (Linux)</a> and <a href="http://docs.aws.amazon.com/systems-manager/latest/userguide/sysman-install-managed-win.html">Install SSM Agent for a hybrid environment (Windows)</a>. To retrieve the Name tag of an EC2 instance, use the Amazon EC2 <code>DescribeInstances</code> action. For information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_DescribeInstances.html">DescribeInstances</a> in the <i>Amazon EC2 API Reference</i> or <a href="http://docs.aws.amazon.com/cli/latest/reference/ec2/describe-instances.html">describe-instances</a> in the <i>AWS CLI Command Reference</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>Connection status of SSM Agent. </p>
 */
@property (nonatomic, assign) AWSSSMPingStatus pingStatus;

/**
 <p>The name of the operating system platform running on your instance. </p>
 */
@property (nonatomic, strong) NSString * _Nullable platformName;

/**
 <p>The operating system platform type. </p>
 */
@property (nonatomic, assign) AWSSSMPlatformType platformType;

/**
 <p>The version of the OS platform running on your instance. </p>
 */
@property (nonatomic, strong) NSString * _Nullable platformVersion;

/**
 <p>The date the server or VM was registered with AWS as a managed instance.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable registrationDate;

/**
 <p>The type of instance. Instances are either EC2 instances or managed instances. </p>
 */
@property (nonatomic, assign) AWSSSMResourceType resourceType;

@end

/**
 <p>Describes a filter for a specific list of instances. You can filter instances information by using tags. You specify tags by using a key-value mapping.</p><p>Use this action instead of the <a>DescribeInstanceInformationRequest$InstanceInformationFilterList</a> method. The <code>InstanceInformationFilterList</code> method is a legacy method and does not support tags. </p>
 Required parameters: [key, valueSet]
 */
@interface AWSSSMInstanceInformationFilter : AWSModel


/**
 <p>The name of the filter. </p>
 */
@property (nonatomic, assign) AWSSSMInstanceInformationFilterKey key;

/**
 <p>The filter values.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable valueSet;

@end

/**
 <p>The filters to describe or get information about your managed instances.</p>
 Required parameters: [Key, Values]
 */
@interface AWSSSMInstanceInformationStringFilter : AWSModel


/**
 <p>The filter key name to describe your instances. For example:</p><p>"InstanceIds"|"AgentVersion"|"PingStatus"|"PlatformTypes"|"ActivationIds"|"IamRole"|"ResourceType"|"AssociationStatus"|"Tag Key"</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>The filter values.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable values;

@end

/**
 <p>Defines the high-level patch compliance state for a managed instance, providing information about the number of installed, missing, not applicable, and failed patches along with metadata about the operation when this information was gathered for the instance.</p>
 Required parameters: [InstanceId, PatchGroup, BaselineId, OperationStartTime, OperationEndTime, Operation]
 */
@interface AWSSSMInstancePatchState : AWSModel


/**
 <p>The ID of the patch baseline used to patch the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable baselineId;

/**
 <p>The number of patches from the patch baseline that were attempted to be installed during the last patching operation, but failed to install.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable failedCount;

/**
 <p>An https URL or an Amazon S3 path-style URL to a list of patches to be installed. This patch installation list, which you maintain in an S3 bucket in YAML format and specify in the SSM document <code>AWS-RunPatchBaseline</code>, overrides the patches specified by the default patch baseline.</p><p>For more information about the <code>InstallOverrideList</code> parameter, see <a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/patch-manager-about-aws-runpatchbaseline.html">About the SSM document AWS-RunPatchBaseline</a> in the <i>AWS Systems Manager User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable installOverrideList;

/**
 <p>The number of patches from the patch baseline that are installed on the instance.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable installedCount;

/**
 <p>The number of patches not specified in the patch baseline that are installed on the instance.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable installedOtherCount;

/**
 <p>The number of patches installed by Patch Manager since the last time the instance was rebooted.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable installedPendingRebootCount;

/**
 <p>The number of instances with patches installed that are specified in a RejectedPatches list. Patches with a status of <i>InstalledRejected</i> were typically installed before they were added to a RejectedPatches list.</p><note><p>If ALLOW_AS_DEPENDENCY is the specified option for RejectedPatchesAction, the value of InstalledRejectedCount will always be 0 (zero).</p></note>
 */
@property (nonatomic, strong) NSNumber * _Nullable installedRejectedCount;

/**
 <p>The ID of the managed instance the high-level patch compliance information was collected for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The time of the last attempt to patch the instance with <code>NoReboot</code> specified as the reboot option.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastNoRebootInstallOperationTime;

/**
 <p>The number of patches from the patch baseline that are applicable for the instance but aren't currently installed.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable missingCount;

/**
 <p>The number of patches from the patch baseline that aren't applicable for the instance and therefore aren't installed on the instance. This number may be truncated if the list of patch names is very large. The number of patches beyond this limit are reported in <code>UnreportedNotApplicableCount</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable notApplicableCount;

/**
 <p>The type of patching operation that was performed: SCAN (assess patch compliance state) or INSTALL (install missing patches).</p>
 */
@property (nonatomic, assign) AWSSSMPatchOperationType operation;

/**
 <p>The time the most recent patching operation completed on the instance.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable operationEndTime;

/**
 <p>The time the most recent patching operation was started on the instance.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable operationStartTime;

/**
 <p>Placeholder information. This field will always be empty in the current release of the service.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ownerInformation;

/**
 <p>The name of the patch group the managed instance belongs to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable patchGroup;

/**
 <p>Indicates the reboot option specified in the patch baseline.</p><note><p>Reboot options apply to <code>Install</code> operations only. Reboots are not attempted for Patch Manager <code>Scan</code> operations.</p></note><ul><li><p><b>RebootIfNeeded</b>: Patch Manager tries to reboot the instance if it installed any patches, or if any patches are detected with a status of <code>InstalledPendingReboot</code>.</p></li><li><p><b>NoReboot</b>: Patch Manager attempts to install missing packages without trying to reboot the system. Patches installed with this option are assigned a status of <code>InstalledPendingReboot</code>. These patches might not be in effect until a reboot is performed.</p></li></ul>
 */
@property (nonatomic, assign) AWSSSMRebootOption rebootOption;

/**
 <p>The ID of the patch baseline snapshot used during the patching operation when this compliance data was collected.</p>
 */
@property (nonatomic, strong) NSString * _Nullable snapshotId;

/**
 <p>The number of patches beyond the supported limit of <code>NotApplicableCount</code> that are not reported by name to Systems Manager Inventory.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable unreportedNotApplicableCount;

@end

/**
 <p>Defines a filter used in DescribeInstancePatchStatesForPatchGroup used to scope down the information returned by the API.</p>
 Required parameters: [Key, Values, Type]
 */
@interface AWSSSMInstancePatchStateFilter : AWSModel


/**
 <p>The key for the filter. Supported values are FailedCount, InstalledCount, InstalledOtherCount, MissingCount and NotApplicableCount.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>The type of comparison that should be performed for the value: Equal, NotEqual, LessThan or GreaterThan.</p>
 */
@property (nonatomic, assign) AWSSSMInstancePatchStateOperatorType types;

/**
 <p>The value for the filter, must be an integer greater than or equal to 0.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable values;

@end

/**
 <p>Specifies the inventory type and attribute for the aggregation execution.</p>
 */
@interface AWSSSMInventoryAggregator : AWSModel


/**
 <p>Nested aggregators to further refine aggregation for an inventory type.</p>
 */
@property (nonatomic, strong) NSArray<AWSSSMInventoryAggregator *> * _Nullable aggregators;

/**
 <p>The inventory type and attribute name for aggregation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable expression;

/**
 <p>A user-defined set of one or more filters on which to aggregate inventory data. Groups return a count of resources that match and don't match the specified criteria.</p>
 */
@property (nonatomic, strong) NSArray<AWSSSMInventoryGroup *> * _Nullable groups;

@end

/**
 <p>Status information returned by the <code>DeleteInventory</code> action.</p>
 */
@interface AWSSSMInventoryDeletionStatusItem : AWSModel


/**
 <p>The deletion ID returned by the <code>DeleteInventory</code> action.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deletionId;

/**
 <p>The UTC timestamp when the delete operation started.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable deletionStartTime;

/**
 <p>Information about the delete operation. For more information about this summary, see <a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/sysman-inventory-custom.html#sysman-inventory-delete">Understanding the delete inventory summary</a> in the <i>AWS Systems Manager User Guide</i>.</p>
 */
@property (nonatomic, strong) AWSSSMInventoryDeletionSummary * _Nullable deletionSummary;

/**
 <p>The status of the operation. Possible values are InProgress and Complete.</p>
 */
@property (nonatomic, assign) AWSSSMInventoryDeletionStatus lastStatus;

/**
 <p>Information about the status.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lastStatusMessage;

/**
 <p>The UTC timestamp of when the last status report.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastStatusUpdateTime;

/**
 <p>The name of the inventory data type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable typeName;

@end

/**
 <p>Information about the delete operation.</p>
 */
@interface AWSSSMInventoryDeletionSummary : AWSModel


/**
 <p>Remaining number of items to delete.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable remainingCount;

/**
 <p>A list of counts and versions for deleted items.</p>
 */
@property (nonatomic, strong) NSArray<AWSSSMInventoryDeletionSummaryItem *> * _Nullable summaryItems;

/**
 <p>The total number of items to delete. This count does not change during the delete operation.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable totalCount;

@end

/**
 <p>Either a count, remaining count, or a version number in a delete inventory summary.</p>
 */
@interface AWSSSMInventoryDeletionSummaryItem : AWSModel


/**
 <p>A count of the number of deleted items.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable count;

/**
 <p>The remaining number of items to delete.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable remainingCount;

/**
 <p>The inventory type version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable version;

@end

/**
 <p>One or more filters. Use a filter to return a more specific list of results.</p>
 Required parameters: [Key, Values]
 */
@interface AWSSSMInventoryFilter : AWSModel


/**
 <p>The name of the filter key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>The type of filter.</p><note><p>The <code>Exists</code> filter must be used with aggregators. For more information, see <a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/sysman-inventory-aggregate.html">Aggregating inventory data</a> in the <i>AWS Systems Manager User Guide</i>.</p></note>
 */
@property (nonatomic, assign) AWSSSMInventoryQueryOperatorType types;

/**
 <p>Inventory filter values. Example: inventory filter where instance IDs are specified as values Key=AWS:InstanceInformation.InstanceId,Values= i-a12b3c4d5e6g, i-1a2b3c4d5e6,Type=Equal </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable values;

@end

/**
 <p>A user-defined set of one or more filters on which to aggregate inventory data. Groups return a count of resources that match and don't match the specified criteria.</p>
 Required parameters: [Name, Filters]
 */
@interface AWSSSMInventoryGroup : AWSModel


/**
 <p>Filters define the criteria for the group. The <code>matchingCount</code> field displays the number of resources that match the criteria. The <code>notMatchingCount</code> field displays the number of resources that don't match the criteria. </p>
 */
@property (nonatomic, strong) NSArray<AWSSSMInventoryFilter *> * _Nullable filters;

/**
 <p>The name of the group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 <p>Information collected from managed instances based on your inventory policy document</p>
 Required parameters: [TypeName, SchemaVersion, CaptureTime]
 */
@interface AWSSSMInventoryItem : AWSModel


/**
 <p>The time the inventory information was collected.</p>
 */
@property (nonatomic, strong) NSString * _Nullable captureTime;

/**
 <p>The inventory data of the inventory type.</p>
 */
@property (nonatomic, strong) NSArray<NSDictionary<NSString *, NSString *> *> * _Nullable content;

/**
 <p>MD5 hash of the inventory item type contents. The content hash is used to determine whether to update inventory information. The PutInventory API does not update the inventory item type contents if the MD5 hash has not changed since last update. </p>
 */
@property (nonatomic, strong) NSString * _Nullable contentHash;

/**
 <p>A map of associated properties for a specified inventory type. For example, with this attribute, you can specify the <code>ExecutionId</code>, <code>ExecutionType</code>, <code>ComplianceType</code> properties of the <code>AWS:ComplianceItem</code> type.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable context;

/**
 <p>The schema version for the inventory item.</p>
 */
@property (nonatomic, strong) NSString * _Nullable schemaVersion;

/**
 <p>The name of the inventory type. Default inventory item type names start with AWS. Custom inventory type names will start with Custom. Default inventory item types include the following: AWS:AWSComponent, AWS:Application, AWS:InstanceInformation, AWS:Network, and AWS:WindowsUpdate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable typeName;

@end

/**
 <p>Attributes are the entries within the inventory item content. It contains name and value.</p>
 Required parameters: [Name, DataType]
 */
@interface AWSSSMInventoryItemAttribute : AWSModel


/**
 <p>The data type of the inventory item attribute. </p>
 */
@property (nonatomic, assign) AWSSSMInventoryAttributeDataType dataType;

/**
 <p>Name of the inventory item attribute.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 <p>The inventory item schema definition. Users can use this to compose inventory query filters.</p>
 Required parameters: [TypeName, Attributes]
 */
@interface AWSSSMInventoryItemSchema : AWSModel


/**
 <p>The schema attributes for inventory. This contains data type and attribute name.</p>
 */
@property (nonatomic, strong) NSArray<AWSSSMInventoryItemAttribute *> * _Nullable attributes;

/**
 <p>The alias name of the inventory type. The alias name is used for display purposes.</p>
 */
@property (nonatomic, strong) NSString * _Nullable displayName;

/**
 <p>The name of the inventory type. Default inventory item type names start with AWS. Custom inventory type names will start with Custom. Default inventory item types include the following: AWS:AWSComponent, AWS:Application, AWS:InstanceInformation, AWS:Network, and AWS:WindowsUpdate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable typeName;

/**
 <p>The schema version for the inventory item.</p>
 */
@property (nonatomic, strong) NSString * _Nullable version;

@end

/**
 <p>Inventory query results.</p>
 */
@interface AWSSSMInventoryResultEntity : AWSModel


/**
 <p>The data section in the inventory result entity JSON.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSSSMInventoryResultItem *> * _Nullable data;

/**
 <p>ID of the inventory result entity. For example, for managed instance inventory the result will be the managed instance ID. For EC2 instance inventory, the result will be the instance ID. </p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

@end

/**
 <p>The inventory result item.</p>
 Required parameters: [TypeName, SchemaVersion, Content]
 */
@interface AWSSSMInventoryResultItem : AWSModel


/**
 <p>The time inventory item data was captured.</p>
 */
@property (nonatomic, strong) NSString * _Nullable captureTime;

/**
 <p>Contains all the inventory data of the item type. Results include attribute names and values. </p>
 */
@property (nonatomic, strong) NSArray<NSDictionary<NSString *, NSString *> *> * _Nullable content;

/**
 <p>MD5 hash of the inventory item type contents. The content hash is used to determine whether to update inventory information. The PutInventory API does not update the inventory item type contents if the MD5 hash has not changed since last update. </p>
 */
@property (nonatomic, strong) NSString * _Nullable contentHash;

/**
 <p>The schema version for the inventory result item/</p>
 */
@property (nonatomic, strong) NSString * _Nullable schemaVersion;

/**
 <p>The name of the inventory result item type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable typeName;

@end

/**
 
 */
@interface AWSSSMLabelParameterVersionRequest : AWSRequest


/**
 <p>One or more labels to attach to the specified parameter version.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable labels;

/**
 <p>The parameter name on which you want to attach one or more labels.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The specific version of the parameter on which you want to attach one or more labels. If no version is specified, the system attaches the label to the latest version.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable parameterVersion;

@end

/**
 
 */
@interface AWSSSMLabelParameterVersionResult : AWSModel


/**
 <p>The label does not meet the requirements. For information about parameter label requirements, see <a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/sysman-paramstore-labels.html">Labeling parameters</a> in the <i>AWS Systems Manager User Guide</i>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable invalidLabels;

/**
 <p>The version of the parameter that has been labeled.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable parameterVersion;

@end

/**
 
 */
@interface AWSSSMListAssociationVersionsRequest : AWSRequest


/**
 <p>The association ID for which you want to view all versions.</p>
 */
@property (nonatomic, strong) NSString * _Nullable associationId;

/**
 <p>The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>A token to start the list. Use this token to get the next set of results. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSSSMListAssociationVersionsResult : AWSModel


/**
 <p>Information about all versions of the association for the specified association ID.</p>
 */
@property (nonatomic, strong) NSArray<AWSSSMAssociationVersionInfo *> * _Nullable associationVersions;

/**
 <p>The token for the next set of items to return. Use this token to get the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSSSMListAssociationsRequest : AWSRequest


/**
 <p>One or more filters. Use a filter to return a more specific list of results.</p>
 */
@property (nonatomic, strong) NSArray<AWSSSMAssociationFilter *> * _Nullable associationFilterList;

/**
 <p>The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token for the next set of items to return. (You received this token from a previous call.)</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSSSMListAssociationsResult : AWSModel


/**
 <p>The associations.</p>
 */
@property (nonatomic, strong) NSArray<AWSSSMAssociation *> * _Nullable associations;

/**
 <p>The token to use when requesting the next set of items. If there are no additional items to return, the string is empty.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSSSMListCommandInvocationsRequest : AWSRequest


/**
 <p>(Optional) The invocations for a specific command ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable commandId;

/**
 <p>(Optional) If set this returns the response of the command executions and any command output. By default this is set to False. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable details;

/**
 <p>(Optional) One or more filters. Use a filter to return a more specific list of results.</p>
 */
@property (nonatomic, strong) NSArray<AWSSSMCommandFilter *> * _Nullable filters;

/**
 <p>(Optional) The command execution details for a specific instance ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>(Optional) The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>(Optional) The token for the next set of items to return. (You received this token from a previous call.)</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSSSMListCommandInvocationsResult : AWSModel


/**
 <p>(Optional) A list of all invocations. </p>
 */
@property (nonatomic, strong) NSArray<AWSSSMCommandInvocation *> * _Nullable commandInvocations;

/**
 <p>(Optional) The token for the next set of items to return. (You received this token from a previous call.)</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSSSMListCommandsRequest : AWSRequest


/**
 <p>(Optional) If provided, lists only the specified command.</p>
 */
@property (nonatomic, strong) NSString * _Nullable commandId;

/**
 <p>(Optional) One or more filters. Use a filter to return a more specific list of results. </p>
 */
@property (nonatomic, strong) NSArray<AWSSSMCommandFilter *> * _Nullable filters;

/**
 <p>(Optional) Lists commands issued against this instance ID.</p><note><p>You can't specify an instance ID in the same command that you specify <code>Status</code> = <code>Pending</code>. This is because the command has not reached the instance yet.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>(Optional) The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>(Optional) The token for the next set of items to return. (You received this token from a previous call.)</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSSSMListCommandsResult : AWSModel


/**
 <p>(Optional) The list of commands requested by the user. </p>
 */
@property (nonatomic, strong) NSArray<AWSSSMCommand *> * _Nullable commands;

/**
 <p>(Optional) The token for the next set of items to return. (You received this token from a previous call.)</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSSSMListComplianceItemsRequest : AWSRequest


/**
 <p>One or more compliance filters. Use a filter to return a more specific list of results.</p>
 */
@property (nonatomic, strong) NSArray<AWSSSMComplianceStringFilter *> * _Nullable filters;

/**
 <p>The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>A token to start the list. Use this token to get the next set of results. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The ID for the resources from which to get compliance information. Currently, you can only specify one resource ID.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable resourceIds;

/**
 <p>The type of resource from which to get compliance information. Currently, the only supported resource type is <code>ManagedInstance</code>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable resourceTypes;

@end

/**
 
 */
@interface AWSSSMListComplianceItemsResult : AWSModel


/**
 <p>A list of compliance information for the specified resource ID. </p>
 */
@property (nonatomic, strong) NSArray<AWSSSMComplianceItem *> * _Nullable complianceItems;

/**
 <p>The token for the next set of items to return. Use this token to get the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSSSMListComplianceSummariesRequest : AWSRequest


/**
 <p>One or more compliance or inventory filters. Use a filter to return a more specific list of results.</p>
 */
@property (nonatomic, strong) NSArray<AWSSSMComplianceStringFilter *> * _Nullable filters;

/**
 <p>The maximum number of items to return for this call. Currently, you can specify null or 50. The call also returns a token that you can specify in a subsequent call to get the next set of results.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>A token to start the list. Use this token to get the next set of results. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSSSMListComplianceSummariesResult : AWSModel


/**
 <p>A list of compliant and non-compliant summary counts based on compliance types. For example, this call returns State Manager associations, patches, or custom compliance types according to the filter criteria that you specified.</p>
 */
@property (nonatomic, strong) NSArray<AWSSSMComplianceSummaryItem *> * _Nullable complianceSummaryItems;

/**
 <p>The token for the next set of items to return. Use this token to get the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSSSMListDocumentVersionsRequest : AWSRequest


/**
 <p>The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The name of the document. You can specify an Amazon Resource Name (ARN).</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The token for the next set of items to return. (You received this token from a previous call.)</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSSSMListDocumentVersionsResult : AWSModel


/**
 <p>The document versions.</p>
 */
@property (nonatomic, strong) NSArray<AWSSSMDocumentVersionInfo *> * _Nullable documentVersions;

/**
 <p>The token to use when requesting the next set of items. If there are no additional items to return, the string is empty.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSSSMListDocumentsRequest : AWSRequest


/**
 <p>This data type is deprecated. Instead, use <code>Filters</code>.</p>
 */
@property (nonatomic, strong) NSArray<AWSSSMDocumentFilter *> * _Nullable documentFilterList;

/**
 <p>One or more DocumentKeyValuesFilter objects. Use a filter to return a more specific list of results. For keys, you can specify one or more key-value pair tags that have been applied to a document. Other valid keys include <code>Owner</code>, <code>Name</code>, <code>PlatformTypes</code>, <code>DocumentType</code>, and <code>TargetType</code>. For example, to return documents you own use <code>Key=Owner,Values=Self</code>. To specify a custom key-value pair, use the format <code>Key=tag:tagName,Values=valueName</code>.</p>
 */
@property (nonatomic, strong) NSArray<AWSSSMDocumentKeyValuesFilter *> * _Nullable filters;

/**
 <p>The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token for the next set of items to return. (You received this token from a previous call.)</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSSSMListDocumentsResult : AWSModel


/**
 <p>The names of the Systems Manager documents.</p>
 */
@property (nonatomic, strong) NSArray<AWSSSMDocumentIdentifier *> * _Nullable documentIdentifiers;

/**
 <p>The token to use when requesting the next set of items. If there are no additional items to return, the string is empty.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSSSMListInventoryEntriesRequest : AWSRequest


/**
 <p>One or more filters. Use a filter to return a more specific list of results.</p>
 */
@property (nonatomic, strong) NSArray<AWSSSMInventoryFilter *> * _Nullable filters;

/**
 <p>The instance ID for which you want inventory information.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token for the next set of items to return. (You received this token from a previous call.)</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The type of inventory item for which you want information.</p>
 */
@property (nonatomic, strong) NSString * _Nullable typeName;

@end

/**
 
 */
@interface AWSSSMListInventoryEntriesResult : AWSModel


/**
 <p>The time that inventory information was collected for the instance(s).</p>
 */
@property (nonatomic, strong) NSString * _Nullable captureTime;

/**
 <p>A list of inventory items on the instance(s).</p>
 */
@property (nonatomic, strong) NSArray<NSDictionary<NSString *, NSString *> *> * _Nullable entries;

/**
 <p>The instance ID targeted by the request to query inventory information.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The token to use when requesting the next set of items. If there are no additional items to return, the string is empty.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The inventory schema version used by the instance(s).</p>
 */
@property (nonatomic, strong) NSString * _Nullable schemaVersion;

/**
 <p>The type of inventory item returned by the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable typeName;

@end

/**
 
 */
@interface AWSSSMListResourceComplianceSummariesRequest : AWSRequest


/**
 <p>One or more filters. Use a filter to return a more specific list of results.</p>
 */
@property (nonatomic, strong) NSArray<AWSSSMComplianceStringFilter *> * _Nullable filters;

/**
 <p>The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>A token to start the list. Use this token to get the next set of results. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSSSMListResourceComplianceSummariesResult : AWSModel


/**
 <p>The token for the next set of items to return. Use this token to get the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>A summary count for specified or targeted managed instances. Summary count includes information about compliant and non-compliant State Manager associations, patch status, or custom items according to the filter criteria that you specify. </p>
 */
@property (nonatomic, strong) NSArray<AWSSSMResourceComplianceSummaryItem *> * _Nullable resourceComplianceSummaryItems;

@end

/**
 
 */
@interface AWSSSMListResourceDataSyncRequest : AWSRequest


/**
 <p>The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>A token to start the list. Use this token to get the next set of results. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>View a list of resource data syncs according to the sync type. Specify <code>SyncToDestination</code> to view resource data syncs that synchronize data to an Amazon S3 buckets. Specify <code>SyncFromSource</code> to view resource data syncs from AWS Organizations or from multiple AWS Regions. </p>
 */
@property (nonatomic, strong) NSString * _Nullable syncType;

@end

/**
 
 */
@interface AWSSSMListResourceDataSyncResult : AWSModel


/**
 <p>The token for the next set of items to return. Use this token to get the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>A list of your current Resource Data Sync configurations and their statuses.</p>
 */
@property (nonatomic, strong) NSArray<AWSSSMResourceDataSyncItem *> * _Nullable resourceDataSyncItems;

@end

/**
 
 */
@interface AWSSSMListTagsForResourceRequest : AWSRequest


/**
 <p>The resource ID for which you want to see a list of tags.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceId;

/**
 <p>Returns a list of tags for a specific resource type.</p>
 */
@property (nonatomic, assign) AWSSSMResourceTypeForTagging resourceType;

@end

/**
 
 */
@interface AWSSSMListTagsForResourceResult : AWSModel


/**
 <p>A list of tags.</p>
 */
@property (nonatomic, strong) NSArray<AWSSSMTag *> * _Nullable tagList;

@end

/**
 <p>Information about an S3 bucket to write instance-level logs to.</p><note><p><code>LoggingInfo</code> has been deprecated. To specify an S3 bucket to contain logs, instead use the <code>OutputS3BucketName</code> and <code>OutputS3KeyPrefix</code> options in the <code>TaskInvocationParameters</code> structure. For information about how Systems Manager handles these options for the supported maintenance window task types, see <a>MaintenanceWindowTaskInvocationParameters</a>.</p></note>
 Required parameters: [S3BucketName, S3Region]
 */
@interface AWSSSMLoggingInfo : AWSModel


/**
 <p>The name of an S3 bucket where execution logs are stored .</p>
 */
@property (nonatomic, strong) NSString * _Nullable s3BucketName;

/**
 <p>(Optional) The S3 bucket subfolder. </p>
 */
@property (nonatomic, strong) NSString * _Nullable s3KeyPrefix;

/**
 <p>The Region where the S3 bucket is located.</p>
 */
@property (nonatomic, strong) NSString * _Nullable s3Region;

@end

/**
 <p>The parameters for an AUTOMATION task type.</p>
 */
@interface AWSSSMMaintenanceWindowAutomationParameters : AWSModel


/**
 <p>The version of an Automation document to use during task execution.</p>
 */
@property (nonatomic, strong) NSString * _Nullable documentVersion;

/**
 <p>The parameters for the AUTOMATION task.</p><p>For information about specifying and updating task parameters, see <a>RegisterTaskWithMaintenanceWindow</a> and <a>UpdateMaintenanceWindowTask</a>.</p><note><p><code>LoggingInfo</code> has been deprecated. To specify an S3 bucket to contain logs, instead use the <code>OutputS3BucketName</code> and <code>OutputS3KeyPrefix</code> options in the <code>TaskInvocationParameters</code> structure. For information about how Systems Manager handles these options for the supported maintenance window task types, see <a>MaintenanceWindowTaskInvocationParameters</a>.</p><p><code>TaskParameters</code> has been deprecated. To specify parameters to pass to a task when it runs, instead use the <code>Parameters</code> option in the <code>TaskInvocationParameters</code> structure. For information about how Systems Manager handles these options for the supported maintenance window task types, see <a>MaintenanceWindowTaskInvocationParameters</a>.</p><p>For AUTOMATION task types, Systems Manager ignores any values specified for these parameters.</p></note>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSArray<NSString *> *> * _Nullable parameters;

@end

/**
 <p>Describes the information about an execution of a maintenance window. </p>
 */
@interface AWSSSMMaintenanceWindowExecution : AWSModel


/**
 <p>The time the execution finished.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable endTime;

/**
 <p>The time the execution started.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable startTime;

/**
 <p>The status of the execution.</p>
 */
@property (nonatomic, assign) AWSSSMMaintenanceWindowExecutionStatus status;

/**
 <p>The details explaining the Status. Only available for certain status values.</p>
 */
@property (nonatomic, strong) NSString * _Nullable statusDetails;

/**
 <p>The ID of the maintenance window execution.</p>
 */
@property (nonatomic, strong) NSString * _Nullable windowExecutionId;

/**
 <p>The ID of the maintenance window.</p>
 */
@property (nonatomic, strong) NSString * _Nullable windowId;

@end

/**
 <p>Information about a task execution performed as part of a maintenance window execution.</p>
 */
@interface AWSSSMMaintenanceWindowExecutionTaskIdentity : AWSModel


/**
 <p>The time the task execution finished.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable endTime;

/**
 <p>The time the task execution started.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable startTime;

/**
 <p>The status of the task execution.</p>
 */
@property (nonatomic, assign) AWSSSMMaintenanceWindowExecutionStatus status;

/**
 <p>The details explaining the status of the task execution. Only available for certain status values.</p>
 */
@property (nonatomic, strong) NSString * _Nullable statusDetails;

/**
 <p>The ARN of the task that ran.</p>
 */
@property (nonatomic, strong) NSString * _Nullable taskArn;

/**
 <p>The ID of the specific task execution in the maintenance window execution.</p>
 */
@property (nonatomic, strong) NSString * _Nullable taskExecutionId;

/**
 <p>The type of task that ran.</p>
 */
@property (nonatomic, assign) AWSSSMMaintenanceWindowTaskType taskType;

/**
 <p>The ID of the maintenance window execution that ran the task.</p>
 */
@property (nonatomic, strong) NSString * _Nullable windowExecutionId;

@end

/**
 <p>Describes the information about a task invocation for a particular target as part of a task execution performed as part of a maintenance window execution.</p>
 */
@interface AWSSSMMaintenanceWindowExecutionTaskInvocationIdentity : AWSModel


/**
 <p>The time the invocation finished.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable endTime;

/**
 <p>The ID of the action performed in the service that actually handled the task invocation. If the task type is RUN_COMMAND, this value is the command ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable executionId;

/**
 <p>The ID of the task invocation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable invocationId;

/**
 <p>User-provided value that was specified when the target was registered with the maintenance window. This was also included in any CloudWatch events raised during the task invocation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ownerInformation;

/**
 <p>The parameters that were provided for the invocation when it was run.</p>
 */
@property (nonatomic, strong) NSString * _Nullable parameters;

/**
 <p>The time the invocation started.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable startTime;

/**
 <p>The status of the task invocation.</p>
 */
@property (nonatomic, assign) AWSSSMMaintenanceWindowExecutionStatus status;

/**
 <p>The details explaining the status of the task invocation. Only available for certain Status values. </p>
 */
@property (nonatomic, strong) NSString * _Nullable statusDetails;

/**
 <p>The ID of the specific task execution in the maintenance window execution.</p>
 */
@property (nonatomic, strong) NSString * _Nullable taskExecutionId;

/**
 <p>The task type.</p>
 */
@property (nonatomic, assign) AWSSSMMaintenanceWindowTaskType taskType;

/**
 <p>The ID of the maintenance window execution that ran the task.</p>
 */
@property (nonatomic, strong) NSString * _Nullable windowExecutionId;

/**
 <p>The ID of the target definition in this maintenance window the invocation was performed for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable windowTargetId;

@end

/**
 <p>Filter used in the request. Supported filter keys are Name and Enabled.</p>
 */
@interface AWSSSMMaintenanceWindowFilter : AWSModel


/**
 <p>The name of the filter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>The filter values.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable values;

@end

/**
 <p>Information about the maintenance window.</p>
 */
@interface AWSSSMMaintenanceWindowIdentity : AWSModel


/**
 <p>The number of hours before the end of the maintenance window that Systems Manager stops scheduling new tasks for execution.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable cutoff;

/**
 <p>A description of the maintenance window.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The duration of the maintenance window in hours.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable duration;

/**
 <p>Indicates whether the maintenance window is enabled.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

/**
 <p>The date and time, in ISO-8601 Extended format, for when the maintenance window is scheduled to become inactive.</p>
 */
@property (nonatomic, strong) NSString * _Nullable endDate;

/**
 <p>The name of the maintenance window.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The next time the maintenance window will actually run, taking into account any specified times for the maintenance window to become active or inactive.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextExecutionTime;

/**
 <p>The schedule of the maintenance window in the form of a cron or rate expression.</p>
 */
@property (nonatomic, strong) NSString * _Nullable schedule;

/**
 <p>The number of days to wait to run a maintenance window after the scheduled CRON expression date and time.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable scheduleOffset;

/**
 <p>The time zone that the scheduled maintenance window executions are based on, in Internet Assigned Numbers Authority (IANA) format.</p>
 */
@property (nonatomic, strong) NSString * _Nullable scheduleTimezone;

/**
 <p>The date and time, in ISO-8601 Extended format, for when the maintenance window is scheduled to become active.</p>
 */
@property (nonatomic, strong) NSString * _Nullable startDate;

/**
 <p>The ID of the maintenance window.</p>
 */
@property (nonatomic, strong) NSString * _Nullable windowId;

@end

/**
 <p>The maintenance window to which the specified target belongs.</p>
 */
@interface AWSSSMMaintenanceWindowIdentityForTarget : AWSModel


/**
 <p>The name of the maintenance window.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The ID of the maintenance window.</p>
 */
@property (nonatomic, strong) NSString * _Nullable windowId;

@end

/**
 <p>The parameters for a LAMBDA task type.</p><p>For information about specifying and updating task parameters, see <a>RegisterTaskWithMaintenanceWindow</a> and <a>UpdateMaintenanceWindowTask</a>.</p><note><p><code>LoggingInfo</code> has been deprecated. To specify an S3 bucket to contain logs, instead use the <code>OutputS3BucketName</code> and <code>OutputS3KeyPrefix</code> options in the <code>TaskInvocationParameters</code> structure. For information about how Systems Manager handles these options for the supported maintenance window task types, see <a>MaintenanceWindowTaskInvocationParameters</a>.</p><p><code>TaskParameters</code> has been deprecated. To specify parameters to pass to a task when it runs, instead use the <code>Parameters</code> option in the <code>TaskInvocationParameters</code> structure. For information about how Systems Manager handles these options for the supported maintenance window task types, see <a>MaintenanceWindowTaskInvocationParameters</a>.</p><p>For Lambda tasks, Systems Manager ignores any values specified for TaskParameters and LoggingInfo.</p></note>
 */
@interface AWSSSMMaintenanceWindowLambdaParameters : AWSModel


/**
 <p>Pass client-specific information to the Lambda function that you are invoking. You can then process the client information in your Lambda function as you choose through the context variable.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientContext;

/**
 <p>JSON to provide to your Lambda function as input.</p>
 */
@property (nonatomic, strong) NSData * _Nullable payload;

/**
 <p>(Optional) Specify a Lambda function version or alias name. If you specify a function version, the action uses the qualified function ARN to invoke a specific Lambda function. If you specify an alias name, the action uses the alias ARN to invoke the Lambda function version to which the alias points.</p>
 */
@property (nonatomic, strong) NSString * _Nullable qualifier;

@end

/**
 <p>The parameters for a RUN_COMMAND task type.</p><p>For information about specifying and updating task parameters, see <a>RegisterTaskWithMaintenanceWindow</a> and <a>UpdateMaintenanceWindowTask</a>.</p><note><p><code>LoggingInfo</code> has been deprecated. To specify an S3 bucket to contain logs, instead use the <code>OutputS3BucketName</code> and <code>OutputS3KeyPrefix</code> options in the <code>TaskInvocationParameters</code> structure. For information about how Systems Manager handles these options for the supported maintenance window task types, see <a>MaintenanceWindowTaskInvocationParameters</a>.</p><p><code>TaskParameters</code> has been deprecated. To specify parameters to pass to a task when it runs, instead use the <code>Parameters</code> option in the <code>TaskInvocationParameters</code> structure. For information about how Systems Manager handles these options for the supported maintenance window task types, see <a>MaintenanceWindowTaskInvocationParameters</a>.</p><p>For Run Command tasks, Systems Manager uses specified values for <code>TaskParameters</code> and <code>LoggingInfo</code> only if no values are specified for <code>TaskInvocationParameters</code>. </p></note>
 */
@interface AWSSSMMaintenanceWindowRunCommandParameters : AWSModel


/**
 <p>Configuration options for sending command output to CloudWatch Logs.</p>
 */
@property (nonatomic, strong) AWSSSMCloudWatchOutputConfig * _Nullable cloudWatchOutputConfig;

/**
 <p>Information about the commands to run.</p>
 */
@property (nonatomic, strong) NSString * _Nullable comment;

/**
 <p>The SHA-256 or SHA-1 hash created by the system when the document was created. SHA-1 hashes have been deprecated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable documentHash;

/**
 <p>SHA-256 or SHA-1. SHA-1 hashes have been deprecated.</p>
 */
@property (nonatomic, assign) AWSSSMDocumentHashType documentHashType;

/**
 <p>The SSM document version to use in the request. You can specify $DEFAULT, $LATEST, or a specific version number. If you run commands by using the AWS CLI, then you must escape the first two options by using a backslash. If you specify a version number, then you don't need to use the backslash. For example:</p><p>--document-version "\$DEFAULT"</p><p>--document-version "\$LATEST"</p><p>--document-version "3"</p>
 */
@property (nonatomic, strong) NSString * _Nullable documentVersion;

/**
 <p>Configurations for sending notifications about command status changes on a per-instance basis.</p>
 */
@property (nonatomic, strong) AWSSSMNotificationConfig * _Nullable notificationConfig;

/**
 <p>The name of the S3 bucket.</p>
 */
@property (nonatomic, strong) NSString * _Nullable outputS3BucketName;

/**
 <p>The S3 bucket subfolder.</p>
 */
@property (nonatomic, strong) NSString * _Nullable outputS3KeyPrefix;

/**
 <p>The parameters for the RUN_COMMAND task execution.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSArray<NSString *> *> * _Nullable parameters;

/**
 <p>The ARN of the IAM service role to use to publish Amazon Simple Notification Service (Amazon SNS) notifications for maintenance window Run Command tasks.</p>
 */
@property (nonatomic, strong) NSString * _Nullable serviceRoleArn;

/**
 <p>If this time is reached and the command has not already started running, it doesn't run.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable timeoutSeconds;

@end

/**
 <p>The parameters for a STEP_FUNCTIONS task.</p><p>For information about specifying and updating task parameters, see <a>RegisterTaskWithMaintenanceWindow</a> and <a>UpdateMaintenanceWindowTask</a>.</p><note><p><code>LoggingInfo</code> has been deprecated. To specify an S3 bucket to contain logs, instead use the <code>OutputS3BucketName</code> and <code>OutputS3KeyPrefix</code> options in the <code>TaskInvocationParameters</code> structure. For information about how Systems Manager handles these options for the supported maintenance window task types, see <a>MaintenanceWindowTaskInvocationParameters</a>.</p><p><code>TaskParameters</code> has been deprecated. To specify parameters to pass to a task when it runs, instead use the <code>Parameters</code> option in the <code>TaskInvocationParameters</code> structure. For information about how Systems Manager handles these options for the supported maintenance window task types, see <a>MaintenanceWindowTaskInvocationParameters</a>.</p><p>For Step Functions tasks, Systems Manager ignores any values specified for <code>TaskParameters</code> and <code>LoggingInfo</code>.</p></note>
 */
@interface AWSSSMMaintenanceWindowStepFunctionsParameters : AWSModel


/**
 <p>The inputs for the STEP_FUNCTIONS task.</p>
 */
@property (nonatomic, strong) NSString * _Nullable input;

/**
 <p>The name of the STEP_FUNCTIONS task.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 <p>The target registered with the maintenance window.</p>
 */
@interface AWSSSMMaintenanceWindowTarget : AWSModel


/**
 <p>A description for the target.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The name for the maintenance window target.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>A user-provided value that will be included in any CloudWatch events that are raised while running tasks for these targets in this maintenance window.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ownerInformation;

/**
 <p>The type of target that is being registered with the maintenance window.</p>
 */
@property (nonatomic, assign) AWSSSMMaintenanceWindowResourceType resourceType;

/**
 <p>The targets, either instances or tags.</p><p>Specify instances using the following format:</p><p><code>Key=instanceids,Values=&lt;instanceid1&gt;,&lt;instanceid2&gt;</code></p><p>Tags are specified using the following format:</p><p><code>Key=&lt;tag name&gt;,Values=&lt;tag value&gt;</code>.</p>
 */
@property (nonatomic, strong) NSArray<AWSSSMTarget *> * _Nullable targets;

/**
 <p>The ID of the maintenance window to register the target with.</p>
 */
@property (nonatomic, strong) NSString * _Nullable windowId;

/**
 <p>The ID of the target.</p>
 */
@property (nonatomic, strong) NSString * _Nullable windowTargetId;

@end

/**
 <p>Information about a task defined for a maintenance window.</p>
 */
@interface AWSSSMMaintenanceWindowTask : AWSModel


/**
 <p>A description of the task.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>Information about an S3 bucket to write task-level logs to.</p><note><p><code>LoggingInfo</code> has been deprecated. To specify an S3 bucket to contain logs, instead use the <code>OutputS3BucketName</code> and <code>OutputS3KeyPrefix</code> options in the <code>TaskInvocationParameters</code> structure. For information about how Systems Manager handles these options for the supported maintenance window task types, see <a>MaintenanceWindowTaskInvocationParameters</a>.</p></note>
 */
@property (nonatomic, strong) AWSSSMLoggingInfo * _Nullable loggingInfo;

/**
 <p>The maximum number of targets this task can be run for, in parallel.</p>
 */
@property (nonatomic, strong) NSString * _Nullable maxConcurrency;

/**
 <p>The maximum number of errors allowed before this task stops being scheduled.</p>
 */
@property (nonatomic, strong) NSString * _Nullable maxErrors;

/**
 <p>The task name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The priority of the task in the maintenance window. The lower the number, the higher the priority. Tasks that have the same priority are scheduled in parallel.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable priority;

/**
 <p>The ARN of the IAM service role to use to publish Amazon Simple Notification Service (Amazon SNS) notifications for maintenance window Run Command tasks.</p>
 */
@property (nonatomic, strong) NSString * _Nullable serviceRoleArn;

/**
 <p>The targets (either instances or tags). Instances are specified using Key=instanceids,Values=&lt;instanceid1&gt;,&lt;instanceid2&gt;. Tags are specified using Key=&lt;tag name&gt;,Values=&lt;tag value&gt;.</p>
 */
@property (nonatomic, strong) NSArray<AWSSSMTarget *> * _Nullable targets;

/**
 <p>The resource that the task uses during execution. For RUN_COMMAND and AUTOMATION task types, <code>TaskArn</code> is the Systems Manager document name or ARN. For LAMBDA tasks, it's the function name or ARN. For STEP_FUNCTIONS tasks, it's the state machine ARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable taskArn;

/**
 <p>The parameters that should be passed to the task when it is run.</p><note><p><code>TaskParameters</code> has been deprecated. To specify parameters to pass to a task when it runs, instead use the <code>Parameters</code> option in the <code>TaskInvocationParameters</code> structure. For information about how Systems Manager handles these options for the supported maintenance window task types, see <a>MaintenanceWindowTaskInvocationParameters</a>.</p></note>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSSSMMaintenanceWindowTaskParameterValueExpression *> * _Nullable taskParameters;

/**
 <p>The type of task. The type can be one of the following: RUN_COMMAND, AUTOMATION, LAMBDA, or STEP_FUNCTIONS.</p>
 */
@property (nonatomic, assign) AWSSSMMaintenanceWindowTaskType types;

/**
 <p>The ID of the maintenance window where the task is registered.</p>
 */
@property (nonatomic, strong) NSString * _Nullable windowId;

/**
 <p>The task ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable windowTaskId;

@end

/**
 <p>The parameters for task execution.</p>
 */
@interface AWSSSMMaintenanceWindowTaskInvocationParameters : AWSModel


/**
 <p>The parameters for an AUTOMATION task type.</p>
 */
@property (nonatomic, strong) AWSSSMMaintenanceWindowAutomationParameters * _Nullable automation;

/**
 <p>The parameters for a LAMBDA task type.</p>
 */
@property (nonatomic, strong) AWSSSMMaintenanceWindowLambdaParameters * _Nullable lambda;

/**
 <p>The parameters for a RUN_COMMAND task type.</p>
 */
@property (nonatomic, strong) AWSSSMMaintenanceWindowRunCommandParameters * _Nullable runCommand;

/**
 <p>The parameters for a STEP_FUNCTIONS task type.</p>
 */
@property (nonatomic, strong) AWSSSMMaintenanceWindowStepFunctionsParameters * _Nullable stepFunctions;

@end

/**
 <p>Defines the values for a task parameter.</p>
 */
@interface AWSSSMMaintenanceWindowTaskParameterValueExpression : AWSModel


/**
 <p>This field contains an array of 0 or more strings, each 1 to 255 characters in length.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable values;

@end

/**
 
 */
@interface AWSSSMModifyDocumentPermissionRequest : AWSRequest


/**
 <p>The AWS user accounts that should have access to the document. The account IDs can either be a group of account IDs or <i>All</i>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable accountIdsToAdd;

/**
 <p>The AWS user accounts that should no longer have access to the document. The AWS user account can either be a group of account IDs or <i>All</i>. This action has a higher priority than <i>AccountIdsToAdd</i>. If you specify an account ID to add and the same ID to remove, the system removes access to the document.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable accountIdsToRemove;

/**
 <p>The name of the document that you want to share.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The permission type for the document. The permission type can be <i>Share</i>.</p>
 */
@property (nonatomic, assign) AWSSSMDocumentPermissionType permissionType;

/**
 <p>(Optional) The version of the document to share. If it's not specified, the system choose the <code>Default</code> version to share.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sharedDocumentVersion;

@end

/**
 
 */
@interface AWSSSMModifyDocumentPermissionResponse : AWSModel


@end

/**
 <p>A summary of resources that are not compliant. The summary is organized according to resource type.</p>
 */
@interface AWSSSMNonCompliantSummary : AWSModel


/**
 <p>The total number of compliance items that are not compliant.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable nonCompliantCount;

/**
 <p>A summary of the non-compliance severity by compliance type</p>
 */
@property (nonatomic, strong) AWSSSMSeveritySummary * _Nullable severitySummary;

@end

/**
 <p>Configurations for sending notifications.</p>
 */
@interface AWSSSMNotificationConfig : AWSModel


/**
 <p>An Amazon Resource Name (ARN) for an Amazon Simple Notification Service (Amazon SNS) topic. Run Command pushes notifications about command status changes to this topic.</p>
 */
@property (nonatomic, strong) NSString * _Nullable notificationArn;

/**
 <p>The different events for which you can receive notifications. These events include the following: All (events), InProgress, Success, TimedOut, Cancelled, Failed. To learn more about these events, see <a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/monitoring-sns-notifications.html">Monitoring Systems Manager status changes using Amazon SNS notifications</a> in the <i>AWS Systems Manager User Guide</i>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable notificationEvents;

/**
 <p>Command: Receive notification when the status of a command changes. Invocation: For commands sent to multiple instances, receive notification on a per-instance basis when the status of a command changes. </p>
 */
@property (nonatomic, assign) AWSSSMNotificationType notificationType;

@end

/**
 <p>One or more aggregators for viewing counts of OpsItems using different dimensions such as <code>Source</code>, <code>CreatedTime</code>, or <code>Source and CreatedTime</code>, to name a few.</p>
 */
@interface AWSSSMOpsAggregator : AWSModel


/**
 <p>Either a Range or Count aggregator for limiting an OpsItem summary.</p>
 */
@property (nonatomic, strong) NSString * _Nullable aggregatorType;

/**
 <p>A nested aggregator for viewing counts of OpsItems.</p>
 */
@property (nonatomic, strong) NSArray<AWSSSMOpsAggregator *> * _Nullable aggregators;

/**
 <p>The name of an OpsItem attribute on which to limit the count of OpsItems.</p>
 */
@property (nonatomic, strong) NSString * _Nullable attributeName;

/**
 <p>The aggregator filters.</p>
 */
@property (nonatomic, strong) NSArray<AWSSSMOpsFilter *> * _Nullable filters;

/**
 <p>The data type name to use for viewing counts of OpsItems.</p>
 */
@property (nonatomic, strong) NSString * _Nullable typeName;

/**
 <p>The aggregator value.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable values;

@end

/**
 <p>The result of the query.</p>
 */
@interface AWSSSMOpsEntity : AWSModel


/**
 <p>The data returned by the query.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSSSMOpsEntityItem *> * _Nullable data;

/**
 <p>The query ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

@end

/**
 <p>The OpsItem summaries result item.</p>
 */
@interface AWSSSMOpsEntityItem : AWSModel


/**
 <p>The time OpsItem data was captured.</p>
 */
@property (nonatomic, strong) NSString * _Nullable captureTime;

/**
 <p>The detailed data content for an OpsItem summaries result item.</p>
 */
@property (nonatomic, strong) NSArray<NSDictionary<NSString *, NSString *> *> * _Nullable content;

@end

/**
 <p>A filter for viewing OpsItem summaries.</p>
 Required parameters: [Key, Values]
 */
@interface AWSSSMOpsFilter : AWSModel


/**
 <p>The name of the filter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>The type of filter.</p>
 */
@property (nonatomic, assign) AWSSSMOpsFilterOperatorType types;

/**
 <p>The filter value.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable values;

@end

/**
 <p>Operations engineers and IT professionals use OpsCenter to view, investigate, and remediate operational issues impacting the performance and health of their AWS resources. For more information, see <a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter.html">AWS Systems Manager OpsCenter</a> in the <i>AWS Systems Manager User Guide</i>. </p>
 */
@interface AWSSSMOpsItem : AWSModel


/**
 <p>An OpsItem category. Category options include: Availability, Cost, Performance, Recovery, Security.</p>
 */
@property (nonatomic, strong) NSString * _Nullable category;

/**
 <p>The ARN of the AWS account that created the OpsItem.</p>
 */
@property (nonatomic, strong) NSString * _Nullable createdBy;

/**
 <p>The date and time the OpsItem was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdTime;

/**
 <p>The OpsItem description.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The ARN of the AWS account that last updated the OpsItem.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lastModifiedBy;

/**
 <p>The date and time the OpsItem was last updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedTime;

/**
 <p>The Amazon Resource Name (ARN) of an SNS topic where notifications are sent when this OpsItem is edited or changed.</p>
 */
@property (nonatomic, strong) NSArray<AWSSSMOpsItemNotification *> * _Nullable notifications;

/**
 <p>Operational data is custom data that provides useful reference details about the OpsItem. For example, you can specify log files, error strings, license keys, troubleshooting tips, or other relevant data. You enter operational data as key-value pairs. The key has a maximum length of 128 characters. The value has a maximum size of 20 KB.</p><important><p>Operational data keys <i>can't</i> begin with the following: amazon, aws, amzn, ssm, /amazon, /aws, /amzn, /ssm.</p></important><p>You can choose to make the data searchable by other users in the account or you can restrict search access. Searchable data means that all users with access to the OpsItem Overview page (as provided by the <a>DescribeOpsItems</a> API action) can view and search on the specified data. Operational data that is not searchable is only viewable by users who have access to the OpsItem (as provided by the <a>GetOpsItem</a> API action).</p><p>Use the <code>/aws/resources</code> key in OperationalData to specify a related resource in the request. Use the <code>/aws/automations</code> key in OperationalData to associate an Automation runbook with the OpsItem. To view AWS CLI example commands that use these keys, see <a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter-creating-OpsItems.html#OpsCenter-manually-create-OpsItems">Creating OpsItems manually</a> in the <i>AWS Systems Manager User Guide</i>.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSSSMOpsItemDataValue *> * _Nullable operationalData;

/**
 <p>The ID of the OpsItem.</p>
 */
@property (nonatomic, strong) NSString * _Nullable opsItemId;

/**
 <p>The importance of this OpsItem in relation to other OpsItems in the system.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable priority;

/**
 <p>One or more OpsItems that share something in common with the current OpsItem. For example, related OpsItems can include OpsItems with similar error messages, impacted resources, or statuses for the impacted resource.</p>
 */
@property (nonatomic, strong) NSArray<AWSSSMRelatedOpsItem *> * _Nullable relatedOpsItems;

/**
 <p>The severity of the OpsItem. Severity options range from 1 to 4.</p>
 */
@property (nonatomic, strong) NSString * _Nullable severity;

/**
 <p>The origin of the OpsItem, such as Amazon EC2 or Systems Manager. The impacted resource is a subset of source.</p>
 */
@property (nonatomic, strong) NSString * _Nullable source;

/**
 <p>The OpsItem status. Status can be <code>Open</code>, <code>In Progress</code>, or <code>Resolved</code>. For more information, see <a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter-working-with-OpsItems-editing-details.html">Editing OpsItem details</a> in the <i>AWS Systems Manager User Guide</i>.</p>
 */
@property (nonatomic, assign) AWSSSMOpsItemStatus status;

/**
 <p>A short heading that describes the nature of the OpsItem and the impacted resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable title;

/**
 <p>The version of this OpsItem. Each time the OpsItem is edited the version number increments by one.</p>
 */
@property (nonatomic, strong) NSString * _Nullable version;

@end

/**
 <p>An object that defines the value of the key and its type in the OperationalData map.</p>
 */
@interface AWSSSMOpsItemDataValue : AWSModel


/**
 <p>The type of key-value pair. Valid types include <code>SearchableString</code> and <code>String</code>.</p>
 */
@property (nonatomic, assign) AWSSSMOpsItemDataType types;

/**
 <p>The value of the OperationalData key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 <p>Describes an OpsItem filter.</p>
 Required parameters: [Key, Values, Operator]
 */
@interface AWSSSMOpsItemFilter : AWSModel


/**
 <p>The name of the filter.</p>
 */
@property (nonatomic, assign) AWSSSMOpsItemFilterKey key;

/**
 <p>The operator used by the filter call.</p>
 */
@property (nonatomic, assign) AWSSSMOpsItemFilterOperator operator;

/**
 <p>The filter value.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable values;

@end

/**
 <p>A notification about the OpsItem.</p>
 */
@interface AWSSSMOpsItemNotification : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of an SNS topic where notifications are sent when this OpsItem is edited or changed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

@end

/**
 <p>A count of OpsItems.</p>
 */
@interface AWSSSMOpsItemSummary : AWSModel


/**
 <p>A list of OpsItems by category.</p>
 */
@property (nonatomic, strong) NSString * _Nullable category;

/**
 <p>The Amazon Resource Name (ARN) of the IAM entity that created the OpsItem.</p>
 */
@property (nonatomic, strong) NSString * _Nullable createdBy;

/**
 <p>The date and time the OpsItem was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdTime;

/**
 <p>The Amazon Resource Name (ARN) of the IAM entity that created the OpsItem.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lastModifiedBy;

/**
 <p>The date and time the OpsItem was last updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedTime;

/**
 <p>Operational data is custom data that provides useful reference details about the OpsItem. </p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSSSMOpsItemDataValue *> * _Nullable operationalData;

/**
 <p>The ID of the OpsItem.</p>
 */
@property (nonatomic, strong) NSString * _Nullable opsItemId;

/**
 <p>The importance of this OpsItem in relation to other OpsItems in the system.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable priority;

/**
 <p>A list of OpsItems by severity.</p>
 */
@property (nonatomic, strong) NSString * _Nullable severity;

/**
 <p>The impacted AWS resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable source;

/**
 <p>The OpsItem status. Status can be <code>Open</code>, <code>In Progress</code>, or <code>Resolved</code>.</p>
 */
@property (nonatomic, assign) AWSSSMOpsItemStatus status;

/**
 <p>A short heading that describes the nature of the OpsItem and the impacted resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable title;

@end

/**
 <p>The OpsItem data type to return.</p>
 Required parameters: [TypeName]
 */
@interface AWSSSMOpsResultAttribute : AWSModel


/**
 <p>Name of the data type. Valid value: AWS:OpsItem, AWS:EC2InstanceInformation, AWS:OpsItemTrendline, or AWS:ComplianceSummary.</p>
 */
@property (nonatomic, strong) NSString * _Nullable typeName;

@end

/**
 <p>Information about the source where the association execution details are stored.</p>
 */
@interface AWSSSMOutputSource : AWSModel


/**
 <p>The ID of the output source, for example the URL of an S3 bucket.</p>
 */
@property (nonatomic, strong) NSString * _Nullable outputSourceId;

/**
 <p>The type of source where the association execution details are stored, for example, Amazon S3.</p>
 */
@property (nonatomic, strong) NSString * _Nullable outputSourceType;

@end

/**
 <p>An Systems Manager parameter in Parameter Store.</p>
 */
@interface AWSSSMParameter : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the parameter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ARN;

/**
 <p>The data type of the parameter, such as <code>text</code> or <code>aws:ec2:image</code>. The default is <code>text</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataType;

/**
 <p>Date the parameter was last changed or updated and the parameter version was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedDate;

/**
 <p>The name of the parameter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>Either the version number or the label used to retrieve the parameter value. Specify selectors by using one of the following formats:</p><p>parameter_name:version</p><p>parameter_name:label</p>
 */
@property (nonatomic, strong) NSString * _Nullable selector;

/**
 <p>Applies to parameters that reference information in other AWS services. SourceResult is the raw result or response from the source.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceResult;

/**
 <p>The type of parameter. Valid values include the following: <code>String</code>, <code>StringList</code>, and <code>SecureString</code>.</p>
 */
@property (nonatomic, assign) AWSSSMParameterType types;

/**
 <p>The parameter value.</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

/**
 <p>The parameter version.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable version;

@end

/**
 <p>Information about parameter usage.</p>
 */
@interface AWSSSMParameterHistory : AWSModel


/**
 <p>Parameter names can include the following letters and symbols.</p><p>a-zA-Z0-9_.-</p>
 */
@property (nonatomic, strong) NSString * _Nullable allowedPattern;

/**
 <p>The data type of the parameter, such as <code>text</code> or <code>aws:ec2:image</code>. The default is <code>text</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataType;

/**
 <p>Information about the parameter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The ID of the query key used for this parameter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable keyId;

/**
 <p>Labels assigned to the parameter version.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable labels;

/**
 <p>Date the parameter was last changed or updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedDate;

/**
 <p>Amazon Resource Name (ARN) of the AWS user who last changed the parameter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lastModifiedUser;

/**
 <p>The name of the parameter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>Information about the policies assigned to a parameter.</p><p><a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/parameter-store-policies.html">Assigning parameter policies</a> in the <i>AWS Systems Manager User Guide</i>.</p>
 */
@property (nonatomic, strong) NSArray<AWSSSMParameterInlinePolicy *> * _Nullable policies;

/**
 <p>The parameter tier.</p>
 */
@property (nonatomic, assign) AWSSSMParameterTier tier;

/**
 <p>The type of parameter used.</p>
 */
@property (nonatomic, assign) AWSSSMParameterType types;

/**
 <p>The parameter value.</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

/**
 <p>The parameter version.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable version;

@end

/**
 <p>One or more policies assigned to a parameter.</p>
 */
@interface AWSSSMParameterInlinePolicy : AWSModel


/**
 <p>The status of the policy. Policies report the following statuses: Pending (the policy has not been enforced or applied yet), Finished (the policy was applied), Failed (the policy was not applied), or InProgress (the policy is being applied now). </p>
 */
@property (nonatomic, strong) NSString * _Nullable policyStatus;

/**
 <p>The JSON text of the policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyText;

/**
 <p>The type of policy. Parameter Store supports the following policy types: Expiration, ExpirationNotification, and NoChangeNotification. </p>
 */
@property (nonatomic, strong) NSString * _Nullable policyType;

@end

/**
 <p>Metadata includes information like the ARN of the last user and the date/time the parameter was last used.</p>
 */
@interface AWSSSMParameterMetadata : AWSModel


/**
 <p>A parameter name can include only the following letters and symbols.</p><p>a-zA-Z0-9_.-</p>
 */
@property (nonatomic, strong) NSString * _Nullable allowedPattern;

/**
 <p>The data type of the parameter, such as <code>text</code> or <code>aws:ec2:image</code>. The default is <code>text</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataType;

/**
 <p>Description of the parameter actions.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The ID of the query key used for this parameter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable keyId;

/**
 <p>Date the parameter was last changed or updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedDate;

/**
 <p>Amazon Resource Name (ARN) of the AWS user who last changed the parameter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lastModifiedUser;

/**
 <p>The parameter name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>A list of policies associated with a parameter.</p>
 */
@property (nonatomic, strong) NSArray<AWSSSMParameterInlinePolicy *> * _Nullable policies;

/**
 <p>The parameter tier.</p>
 */
@property (nonatomic, assign) AWSSSMParameterTier tier;

/**
 <p>The type of parameter. Valid parameter types include the following: <code>String</code>, <code>StringList</code>, and <code>SecureString</code>.</p>
 */
@property (nonatomic, assign) AWSSSMParameterType types;

/**
 <p>The parameter version.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable version;

@end

/**
 <p>One or more filters. Use a filter to return a more specific list of results.</p><important><p>The <code>ParameterStringFilter</code> object is used by the <a>DescribeParameters</a> and <a>GetParametersByPath</a> API actions. However, not all of the pattern values listed for <code>Key</code> can be used with both actions.</p><p>For <code>DescribeActions</code>, all of the listed patterns are valid, with the exception of <code>Label</code>.</p><p>For <code>GetParametersByPath</code>, the following patterns listed for <code>Key</code> are not valid: <code>Name</code>, <code>Path</code>, and <code>Tier</code>.</p><p>For examples of CLI commands demonstrating valid parameter filter constructions, see <a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/parameter-search.html">Searching for Systems Manager parameters</a> in the <i>AWS Systems Manager User Guide</i>.</p></important>
 Required parameters: [Key]
 */
@interface AWSSSMParameterStringFilter : AWSModel


/**
 <p>The name of the filter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>For all filters used with <a>DescribeParameters</a>, valid options include <code>Equals</code> and <code>BeginsWith</code>. The <code>Name</code> filter additionally supports the <code>Contains</code> option. (Exception: For filters using the key <code>Path</code>, valid options include <code>Recursive</code> and <code>OneLevel</code>.)</p><p>For filters used with <a>GetParametersByPath</a>, valid options include <code>Equals</code> and <code>BeginsWith</code>. (Exception: For filters using the key <code>Label</code>, the only valid option is <code>Equals</code>.)</p>
 */
@property (nonatomic, strong) NSString * _Nullable option;

/**
 <p>The value you want to search for.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable values;

@end

/**
 <p>This data type is deprecated. Instead, use <a>ParameterStringFilter</a>.</p>
 Required parameters: [Key, Values]
 */
@interface AWSSSMParametersFilter : AWSModel


/**
 <p>The name of the filter.</p>
 */
@property (nonatomic, assign) AWSSSMParametersFilterKey key;

/**
 <p>The filter values.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable values;

@end

/**
 <p>Represents metadata about a patch.</p>
 */
@interface AWSSSMPatch : AWSModel


/**
 <p>The classification of the patch (for example, SecurityUpdates, Updates, CriticalUpdates).</p>
 */
@property (nonatomic, strong) NSString * _Nullable classification;

/**
 <p>The URL where more information can be obtained about the patch.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contentUrl;

/**
 <p>The description of the patch.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The ID of the patch (this is different than the Microsoft Knowledge Base ID).</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The Microsoft Knowledge Base ID of the patch.</p>
 */
@property (nonatomic, strong) NSString * _Nullable kbNumber;

/**
 <p>The language of the patch if it's language-specific.</p>
 */
@property (nonatomic, strong) NSString * _Nullable language;

/**
 <p>The ID of the MSRC bulletin the patch is related to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable msrcNumber;

/**
 <p>The severity of the patch (for example Critical, Important, Moderate).</p>
 */
@property (nonatomic, strong) NSString * _Nullable msrcSeverity;

/**
 <p>The specific product the patch is applicable for (for example, WindowsServer2016).</p>
 */
@property (nonatomic, strong) NSString * _Nullable product;

/**
 <p>The product family the patch is applicable for (for example, Windows).</p>
 */
@property (nonatomic, strong) NSString * _Nullable productFamily;

/**
 <p>The date the patch was released.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable releaseDate;

/**
 <p>The title of the patch.</p>
 */
@property (nonatomic, strong) NSString * _Nullable title;

/**
 <p>The name of the vendor providing the patch.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vendor;

@end

/**
 <p>Defines the basic information about a patch baseline.</p>
 */
@interface AWSSSMPatchBaselineIdentity : AWSModel


/**
 <p>The description of the patch baseline.</p>
 */
@property (nonatomic, strong) NSString * _Nullable baselineDescription;

/**
 <p>The ID of the patch baseline.</p>
 */
@property (nonatomic, strong) NSString * _Nullable baselineId;

/**
 <p>The name of the patch baseline.</p>
 */
@property (nonatomic, strong) NSString * _Nullable baselineName;

/**
 <p>Whether this is the default baseline. Note that Systems Manager supports creating multiple default patch baselines. For example, you can create a default patch baseline for each operating system.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable defaultBaseline;

/**
 <p>Defines the operating system the patch baseline applies to. The Default value is WINDOWS. </p>
 */
@property (nonatomic, assign) AWSSSMOperatingSystem operatingSystem;

@end

/**
 <p>Information about the state of a patch on a particular instance as it relates to the patch baseline used to patch the instance.</p>
 Required parameters: [Title, KBId, Classification, Severity, State, InstalledTime]
 */
@interface AWSSSMPatchComplianceData : AWSModel


/**
 <p>The classification of the patch (for example, SecurityUpdates, Updates, CriticalUpdates).</p>
 */
@property (nonatomic, strong) NSString * _Nullable classification;

/**
 <p>The date/time the patch was installed on the instance. Note that not all operating systems provide this level of information.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable installedTime;

/**
 <p>The operating system-specific ID of the patch.</p>
 */
@property (nonatomic, strong) NSString * _Nullable KBId;

/**
 <p>The severity of the patch (for example, Critical, Important, Moderate).</p>
 */
@property (nonatomic, strong) NSString * _Nullable severity;

/**
 <p>The state of the patch on the instance, such as INSTALLED or FAILED.</p><p>For descriptions of each patch state, see <a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/sysman-compliance-about.html#sysman-compliance-monitor-patch">About patch compliance</a> in the <i>AWS Systems Manager User Guide</i>.</p>
 */
@property (nonatomic, assign) AWSSSMPatchComplianceDataState state;

/**
 <p>The title of the patch.</p>
 */
@property (nonatomic, strong) NSString * _Nullable title;

@end

/**
 <p> Defines which patches should be included in a patch baseline.</p><p>A patch filter consists of a key and a set of values. The filter key is a patch property. For example, the available filter keys for WINDOWS are PATCH_SET, PRODUCT, PRODUCT_FAMILY, CLASSIFICATION, and MSRC_SEVERITY. The filter values define a matching criterion for the patch property indicated by the key. For example, if the filter key is PRODUCT and the filter values are ["Office 2013", "Office 2016"], then the filter accepts all patches where product name is either "Office 2013" or "Office 2016". The filter values can be exact values for the patch property given as a key, or a wildcard (*), which matches all values.</p><p>You can view lists of valid values for the patch properties by running the <code>DescribePatchProperties</code> command. For information about which patch properties can be used with each major operating system, see <a>DescribePatchProperties</a>.</p>
 Required parameters: [Key, Values]
 */
@interface AWSSSMPatchFilter : AWSModel


/**
 <p>The key for the filter.</p><p>Run the <a>DescribePatchProperties</a> command to view lists of valid keys for each operating system type.</p>
 */
@property (nonatomic, assign) AWSSSMPatchFilterKey key;

/**
 <p>The value for the filter key.</p><p>Run the <a>DescribePatchProperties</a> command to view lists of valid values for each key based on operating system type.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable values;

@end

/**
 <p>A set of patch filters, typically used for approval rules.</p>
 Required parameters: [PatchFilters]
 */
@interface AWSSSMPatchFilterGroup : AWSModel


/**
 <p>The set of patch filters that make up the group.</p>
 */
@property (nonatomic, strong) NSArray<AWSSSMPatchFilter *> * _Nullable patchFilters;

@end

/**
 <p>The mapping between a patch group and the patch baseline the patch group is registered with.</p>
 */
@interface AWSSSMPatchGroupPatchBaselineMapping : AWSModel


/**
 <p>The patch baseline the patch group is registered with.</p>
 */
@property (nonatomic, strong) AWSSSMPatchBaselineIdentity * _Nullable baselineIdentity;

/**
 <p>The name of the patch group registered with the patch baseline.</p>
 */
@property (nonatomic, strong) NSString * _Nullable patchGroup;

@end

/**
 <p>Defines a filter used in Patch Manager APIs.</p>
 */
@interface AWSSSMPatchOrchestratorFilter : AWSModel


/**
 <p>The key for the filter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>The value for the filter.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable values;

@end

/**
 <p>Defines an approval rule for a patch baseline.</p>
 Required parameters: [PatchFilterGroup]
 */
@interface AWSSSMPatchRule : AWSModel


/**
 <p>The number of days after the release date of each patch matched by the rule that the patch is marked as approved in the patch baseline. For example, a value of <code>7</code> means that patches are approved seven days after they are released. Not supported on Ubuntu Server.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable approveAfterDays;

/**
 <p>The cutoff date for auto approval of released patches. Any patches released on or before this date are installed automatically. Not supported on Ubuntu Server.</p><p>Enter dates in the format <code>YYYY-MM-DD</code>. For example, <code>2020-12-31</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable approveUntilDate;

/**
 <p>A compliance severity level for all approved patches in a patch baseline.</p>
 */
@property (nonatomic, assign) AWSSSMPatchComplianceLevel complianceLevel;

/**
 <p>For instances identified by the approval rule filters, enables a patch baseline to apply non-security updates available in the specified repository. The default value is 'false'. Applies to Linux instances only.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enableNonSecurity;

/**
 <p>The patch filter group that defines the criteria for the rule.</p>
 */
@property (nonatomic, strong) AWSSSMPatchFilterGroup * _Nullable patchFilterGroup;

@end

/**
 <p>A set of rules defining the approval rules for a patch baseline.</p>
 Required parameters: [PatchRules]
 */
@interface AWSSSMPatchRuleGroup : AWSModel


/**
 <p>The rules that make up the rule group.</p>
 */
@property (nonatomic, strong) NSArray<AWSSSMPatchRule *> * _Nullable patchRules;

@end

/**
 <p>Information about the patches to use to update the instances, including target operating systems and source repository. Applies to Linux instances only.</p>
 Required parameters: [Name, Products, Configuration]
 */
@interface AWSSSMPatchSource : AWSModel


/**
 <p>The value of the yum repo configuration. For example:</p><p><code>[main]</code></p><p><code>cachedir=/var/cache/yum/$basesearch$releasever</code></p><p><code>keepcache=0</code></p><p><code>debuglevel=2</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable configuration;

/**
 <p>The name specified to identify the patch source.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The specific operating system versions a patch repository applies to, such as "Ubuntu16.04", "AmazonLinux2016.09", "RedhatEnterpriseLinux7.2" or "Suse12.7". For lists of supported product values, see <a>PatchFilter</a>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable products;

@end

/**
 <p>Information about the approval status of a patch.</p>
 */
@interface AWSSSMPatchStatus : AWSModel


/**
 <p>The date the patch was approved (or will be approved if the status is PENDING_APPROVAL).</p>
 */
@property (nonatomic, strong) NSDate * _Nullable approvalDate;

/**
 <p>The compliance severity level for a patch.</p>
 */
@property (nonatomic, assign) AWSSSMPatchComplianceLevel complianceLevel;

/**
 <p>The approval status of a patch (APPROVED, PENDING_APPROVAL, EXPLICIT_APPROVED, EXPLICIT_REJECTED).</p>
 */
@property (nonatomic, assign) AWSSSMPatchDeploymentStatus deploymentStatus;

@end

/**
 <p>An aggregate of step execution statuses displayed in the AWS Console for a multi-Region and multi-account Automation execution.</p>
 */
@interface AWSSSMProgressCounters : AWSModel


/**
 <p>The total number of steps that the system cancelled in all specified AWS Regions and accounts for the current Automation execution.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable cancelledSteps;

/**
 <p>The total number of steps that failed to run in all specified AWS Regions and accounts for the current Automation execution.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable failedSteps;

/**
 <p>The total number of steps that successfully completed in all specified AWS Regions and accounts for the current Automation execution.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable successSteps;

/**
 <p>The total number of steps that timed out in all specified AWS Regions and accounts for the current Automation execution.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable timedOutSteps;

/**
 <p>The total number of steps run in all specified AWS Regions and accounts for the current Automation execution.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable totalSteps;

@end

/**
 
 */
@interface AWSSSMPutComplianceItemsRequest : AWSRequest


/**
 <p>Specify the compliance type. For example, specify Association (for a State Manager association), Patch, or Custom:<code>string</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable complianceType;

/**
 <p>A summary of the call execution that includes an execution ID, the type of execution (for example, <code>Command</code>), and the date/time of the execution using a datetime object that is saved in the following format: yyyy-MM-dd'T'HH:mm:ss'Z'.</p>
 */
@property (nonatomic, strong) AWSSSMComplianceExecutionSummary * _Nullable executionSummary;

/**
 <p>MD5 or SHA-256 content hash. The content hash is used to determine if existing information should be overwritten or ignored. If the content hashes match, the request to put compliance information is ignored.</p>
 */
@property (nonatomic, strong) NSString * _Nullable itemContentHash;

/**
 <p>Information about the compliance as defined by the resource type. For example, for a patch compliance type, <code>Items</code> includes information about the PatchSeverity, Classification, and so on.</p>
 */
@property (nonatomic, strong) NSArray<AWSSSMComplianceItemEntry *> * _Nullable items;

/**
 <p>Specify an ID for this resource. For a managed instance, this is the instance ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceId;

/**
 <p>Specify the type of resource. <code>ManagedInstance</code> is currently the only supported resource type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceType;

/**
 <p>The mode for uploading compliance items. You can specify <code>COMPLETE</code> or <code>PARTIAL</code>. In <code>COMPLETE</code> mode, the system overwrites all existing compliance information for the resource. You must provide a full list of compliance items each time you send the request.</p><p>In <code>PARTIAL</code> mode, the system overwrites compliance information for a specific association. The association must be configured with <code>SyncCompliance</code> set to <code>MANUAL</code>. By default, all requests use <code>COMPLETE</code> mode.</p><note><p>This attribute is only valid for association compliance.</p></note>
 */
@property (nonatomic, assign) AWSSSMComplianceUploadType uploadType;

@end

/**
 
 */
@interface AWSSSMPutComplianceItemsResult : AWSModel


@end

/**
 
 */
@interface AWSSSMPutInventoryRequest : AWSRequest


/**
 <p>An instance ID where you want to add or update inventory items.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The inventory items that you want to add or update on instances.</p>
 */
@property (nonatomic, strong) NSArray<AWSSSMInventoryItem *> * _Nullable items;

@end

/**
 
 */
@interface AWSSSMPutInventoryResult : AWSModel


/**
 <p>Information about the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

@end

/**
 
 */
@interface AWSSSMPutParameterRequest : AWSRequest


/**
 <p>A regular expression used to validate the parameter value. For example, for String types with values restricted to numbers, you can specify the following: AllowedPattern=^\d+$ </p>
 */
@property (nonatomic, strong) NSString * _Nullable allowedPattern;

/**
 <p>The data type for a <code>String</code> parameter. Supported data types include plain text and Amazon Machine Image IDs.</p><p><b>The following data type values are supported.</b></p><ul><li><p><code>text</code></p></li><li><p><code>aws:ec2:image</code></p></li></ul><p>When you create a <code>String</code> parameter and specify <code>aws:ec2:image</code>, Systems Manager validates the parameter value is in the required format, such as <code>ami-12345abcdeEXAMPLE</code>, and that the specified AMI is available in your AWS account. For more information, see <a href="http://docs.aws.amazon.com/systems-manager/latest/userguide/parameter-store-ec2-aliases.html">Native parameter support for Amazon Machine Image IDs</a> in the <i>AWS Systems Manager User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataType;

/**
 <p>Information about the parameter that you want to add to the system. Optional but recommended.</p><important><p>Do not enter personally identifiable information in this field.</p></important>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The KMS Key ID that you want to use to encrypt a parameter. Either the default AWS Key Management Service (AWS KMS) key automatically assigned to your AWS account or a custom key. Required for parameters that use the <code>SecureString</code> data type.</p><p>If you don't specify a key ID, the system uses the default key associated with your AWS account.</p><ul><li><p>To use your default AWS KMS key, choose the <code>SecureString</code> data type, and do <i>not</i> specify the <code>Key ID</code> when you create the parameter. The system automatically populates <code>Key ID</code> with your default KMS key.</p></li><li><p>To use a custom KMS key, choose the <code>SecureString</code> data type with the <code>Key ID</code> parameter.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable keyId;

/**
 <p>The fully qualified name of the parameter that you want to add to the system. The fully qualified name includes the complete hierarchy of the parameter path and name. For parameters in a hierarchy, you must include a leading forward slash character (/) when you create or reference a parameter. For example: <code>/Dev/DBServer/MySQL/db-string13</code></p><p>Naming Constraints:</p><ul><li><p>Parameter names are case sensitive.</p></li><li><p>A parameter name must be unique within an AWS Region</p></li><li><p>A parameter name can't be prefixed with "aws" or "ssm" (case-insensitive).</p></li><li><p>Parameter names can include only the following symbols and letters: <code>a-zA-Z0-9_.-/</code></p></li><li><p>A parameter name can't include spaces.</p></li><li><p>Parameter hierarchies are limited to a maximum depth of fifteen levels.</p></li></ul><p>For additional information about valid values for parameter names, see <a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/sysman-parameter-name-constraints.html">About requirements and constraints for parameter names</a> in the <i>AWS Systems Manager User Guide</i>.</p><note><p>The maximum length constraint listed below includes capacity for additional system attributes that are not part of the name. The maximum length for a parameter name, including the full length of the parameter ARN, is 1011 characters. For example, the length of the following parameter name is 65 characters, not 20 characters:</p><p><code>arn:aws:ssm:us-east-2:111122223333:parameter/ExampleParameterName</code></p></note>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>Overwrite an existing parameter. If not specified, will default to "false".</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable overwrite;

/**
 <p>One or more policies to apply to a parameter. This action takes a JSON array. Parameter Store supports the following policy types:</p><p>Expiration: This policy deletes the parameter after it expires. When you create the policy, you specify the expiration date. You can update the expiration date and time by updating the policy. Updating the <i>parameter</i> does not affect the expiration date and time. When the expiration time is reached, Parameter Store deletes the parameter.</p><p>ExpirationNotification: This policy triggers an event in Amazon CloudWatch Events that notifies you about the expiration. By using this policy, you can receive notification before or after the expiration time is reached, in units of days or hours.</p><p>NoChangeNotification: This policy triggers a CloudWatch event if a parameter has not been modified for a specified period of time. This policy type is useful when, for example, a secret needs to be changed within a period of time, but it has not been changed.</p><p>All existing policies are preserved until you send new policies or an empty policy. For more information about parameter policies, see <a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/parameter-store-policies.html">Assigning parameter policies</a>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable policies;

/**
 <p>Optional metadata that you assign to a resource. Tags enable you to categorize a resource in different ways, such as by purpose, owner, or environment. For example, you might want to tag a Systems Manager parameter to identify the type of resource to which it applies, the environment, or the type of configuration data referenced by the parameter. In this case, you could specify the following key name/value pairs:</p><ul><li><p><code>Key=Resource,Value=S3bucket</code></p></li><li><p><code>Key=OS,Value=Windows</code></p></li><li><p><code>Key=ParameterType,Value=LicenseKey</code></p></li></ul><note><p>To add tags to an existing Systems Manager parameter, use the <a>AddTagsToResource</a> action.</p></note>
 */
@property (nonatomic, strong) NSArray<AWSSSMTag *> * _Nullable tags;

/**
 <p>The parameter tier to assign to a parameter.</p><p>Parameter Store offers a standard tier and an advanced tier for parameters. Standard parameters have a content size limit of 4 KB and can't be configured to use parameter policies. You can create a maximum of 10,000 standard parameters for each Region in an AWS account. Standard parameters are offered at no additional cost. </p><p>Advanced parameters have a content size limit of 8 KB and can be configured to use parameter policies. You can create a maximum of 100,000 advanced parameters for each Region in an AWS account. Advanced parameters incur a charge. For more information, see <a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/parameter-store-advanced-parameters.html">Standard and advanced parameter tiers</a> in the <i>AWS Systems Manager User Guide</i>.</p><p>You can change a standard parameter to an advanced parameter any time. But you can't revert an advanced parameter to a standard parameter. Reverting an advanced parameter to a standard parameter would result in data loss because the system would truncate the size of the parameter from 8 KB to 4 KB. Reverting would also remove any policies attached to the parameter. Lastly, advanced parameters use a different form of encryption than standard parameters. </p><p>If you no longer need an advanced parameter, or if you no longer want to incur charges for an advanced parameter, you must delete it and recreate it as a new standard parameter. </p><p><b>Using the Default Tier Configuration</b></p><p>In <code>PutParameter</code> requests, you can specify the tier to create the parameter in. Whenever you specify a tier in the request, Parameter Store creates or updates the parameter according to that request. However, if you do not specify a tier in a request, Parameter Store assigns the tier based on the current Parameter Store default tier configuration.</p><p>The default tier when you begin using Parameter Store is the standard-parameter tier. If you use the advanced-parameter tier, you can specify one of the following as the default:</p><ul><li><p><b>Advanced</b>: With this option, Parameter Store evaluates all requests as advanced parameters. </p></li><li><p><b>Intelligent-Tiering</b>: With this option, Parameter Store evaluates each request to determine if the parameter is standard or advanced. </p><p>If the request doesn't include any options that require an advanced parameter, the parameter is created in the standard-parameter tier. If one or more options requiring an advanced parameter are included in the request, Parameter Store create a parameter in the advanced-parameter tier.</p><p>This approach helps control your parameter-related costs by always creating standard parameters unless an advanced parameter is necessary. </p></li></ul><p>Options that require an advanced parameter include the following:</p><ul><li><p>The content size of the parameter is more than 4 KB.</p></li><li><p>The parameter uses a parameter policy.</p></li><li><p>More than 10,000 parameters already exist in your AWS account in the current Region.</p></li></ul><p>For more information about configuring the default tier option, see <a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/ps-default-tier.html">Specifying a default parameter tier</a> in the <i>AWS Systems Manager User Guide</i>.</p>
 */
@property (nonatomic, assign) AWSSSMParameterTier tier;

/**
 <p>The type of parameter that you want to add to the system.</p><note><p><code>SecureString</code> is not currently supported for AWS CloudFormation templates or in the China Regions.</p></note><p>Items in a <code>StringList</code> must be separated by a comma (,). You can't use other punctuation or special character to escape items in the list. If you have a parameter value that requires a comma, then use the <code>String</code> data type.</p><important><p>Specifying a parameter type is not required when updating a parameter. You must specify a parameter type when creating a parameter.</p></important>
 */
@property (nonatomic, assign) AWSSSMParameterType types;

/**
 <p>The parameter value that you want to add to the system. Standard parameters have a value limit of 4 KB. Advanced parameters have a value limit of 8 KB.</p><note><p>Parameters can't be referenced or nested in the values of other parameters. You can't include <code>{{}}</code> or <code>{{ssm:<i>parameter-name</i>}}</code> in a parameter value.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 
 */
@interface AWSSSMPutParameterResult : AWSModel


/**
 <p>The tier assigned to the parameter.</p>
 */
@property (nonatomic, assign) AWSSSMParameterTier tier;

/**
 <p>The new version number of a parameter. If you edit a parameter value, Parameter Store automatically creates a new version and assigns this new version a unique ID. You can reference a parameter version ID in API actions or in Systems Manager documents (SSM documents). By default, if you don't specify a specific version, the system returns the latest parameter value when a parameter is called.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable version;

@end

/**
 
 */
@interface AWSSSMRegisterDefaultPatchBaselineRequest : AWSRequest


/**
 <p>The ID of the patch baseline that should be the default patch baseline.</p>
 */
@property (nonatomic, strong) NSString * _Nullable baselineId;

@end

/**
 
 */
@interface AWSSSMRegisterDefaultPatchBaselineResult : AWSModel


/**
 <p>The ID of the default patch baseline.</p>
 */
@property (nonatomic, strong) NSString * _Nullable baselineId;

@end

/**
 
 */
@interface AWSSSMRegisterPatchBaselineForPatchGroupRequest : AWSRequest


/**
 <p>The ID of the patch baseline to register the patch group with.</p>
 */
@property (nonatomic, strong) NSString * _Nullable baselineId;

/**
 <p>The name of the patch group that should be registered with the patch baseline.</p>
 */
@property (nonatomic, strong) NSString * _Nullable patchGroup;

@end

/**
 
 */
@interface AWSSSMRegisterPatchBaselineForPatchGroupResult : AWSModel


/**
 <p>The ID of the patch baseline the patch group was registered with.</p>
 */
@property (nonatomic, strong) NSString * _Nullable baselineId;

/**
 <p>The name of the patch group registered with the patch baseline.</p>
 */
@property (nonatomic, strong) NSString * _Nullable patchGroup;

@end

/**
 
 */
@interface AWSSSMRegisterTargetWithMaintenanceWindowRequest : AWSRequest


/**
 <p>User-provided idempotency token.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>An optional description for the target.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>An optional name for the target.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>User-provided value that will be included in any CloudWatch events raised while running tasks for these targets in this maintenance window.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ownerInformation;

/**
 <p>The type of target being registered with the maintenance window.</p>
 */
@property (nonatomic, assign) AWSSSMMaintenanceWindowResourceType resourceType;

/**
 <p>The targets to register with the maintenance window. In other words, the instances to run commands on when the maintenance window runs.</p><p>You can specify targets using instance IDs, resource group names, or tags that have been applied to instances.</p><p><b>Example 1</b>: Specify instance IDs</p><p><code>Key=InstanceIds,Values=<i>instance-id-1</i>,<i>instance-id-2</i>,<i>instance-id-3</i></code></p><p><b>Example 2</b>: Use tag key-pairs applied to instances</p><p><code>Key=tag:<i>my-tag-key</i>,Values=<i>my-tag-value-1</i>,<i>my-tag-value-2</i></code></p><p><b>Example 3</b>: Use tag-keys applied to instances</p><p><code>Key=tag-key,Values=<i>my-tag-key-1</i>,<i>my-tag-key-2</i></code></p><p><b>Example 4</b>: Use resource group names</p><p><code>Key=resource-groups:Name,Values=<i>resource-group-name</i></code></p><p><b>Example 5</b>: Use filters for resource group types</p><p><code>Key=resource-groups:ResourceTypeFilters,Values=<i>resource-type-1</i>,<i>resource-type-2</i></code></p><note><p>For <code>Key=resource-groups:ResourceTypeFilters</code>, specify resource types in the following format</p><p><code>Key=resource-groups:ResourceTypeFilters,Values=<i>AWS::EC2::INSTANCE</i>,<i>AWS::EC2::VPC</i></code></p></note><p>For more information about these examples formats, including the best use case for each one, see <a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/mw-cli-tutorial-targets-examples.html">Examples: Register targets with a maintenance window</a> in the <i>AWS Systems Manager User Guide</i>.</p>
 */
@property (nonatomic, strong) NSArray<AWSSSMTarget *> * _Nullable targets;

/**
 <p>The ID of the maintenance window the target should be registered with.</p>
 */
@property (nonatomic, strong) NSString * _Nullable windowId;

@end

/**
 
 */
@interface AWSSSMRegisterTargetWithMaintenanceWindowResult : AWSModel


/**
 <p>The ID of the target definition in this maintenance window.</p>
 */
@property (nonatomic, strong) NSString * _Nullable windowTargetId;

@end

/**
 
 */
@interface AWSSSMRegisterTaskWithMaintenanceWindowRequest : AWSRequest


/**
 <p>User-provided idempotency token.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>An optional description for the task.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>A structure containing information about an S3 bucket to write instance-level logs to. </p><note><p><code>LoggingInfo</code> has been deprecated. To specify an S3 bucket to contain logs, instead use the <code>OutputS3BucketName</code> and <code>OutputS3KeyPrefix</code> options in the <code>TaskInvocationParameters</code> structure. For information about how Systems Manager handles these options for the supported maintenance window task types, see <a>MaintenanceWindowTaskInvocationParameters</a>.</p></note>
 */
@property (nonatomic, strong) AWSSSMLoggingInfo * _Nullable loggingInfo;

/**
 <p>The maximum number of targets this task can be run for in parallel.</p>
 */
@property (nonatomic, strong) NSString * _Nullable maxConcurrency;

/**
 <p>The maximum number of errors allowed before this task stops being scheduled.</p>
 */
@property (nonatomic, strong) NSString * _Nullable maxErrors;

/**
 <p>An optional name for the task.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The priority of the task in the maintenance window, the lower the number the higher the priority. Tasks in a maintenance window are scheduled in priority order with tasks that have the same priority scheduled in parallel.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable priority;

/**
 <p>The ARN of the IAM service role for Systems Manager to assume when running a maintenance window task. If you do not specify a service role ARN, Systems Manager uses your account's service-linked role. If no service-linked role for Systems Manager exists in your account, it is created when you run <code>RegisterTaskWithMaintenanceWindow</code>.</p><p>For more information, see the following topics in the in the <i>AWS Systems Manager User Guide</i>:</p><ul><li><p><a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/using-service-linked-roles.html#slr-permissions">Using service-linked roles for Systems Manager</a></p></li><li><p><a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/sysman-maintenance-permissions.html#maintenance-window-tasks-service-role">Should I use a service-linked role or a custom service role to run maintenance window tasks? </a></p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable serviceRoleArn;

/**
 <p>The targets (either instances or maintenance window targets).</p><p>Specify instances using the following format: </p><p><code>Key=InstanceIds,Values=&lt;instance-id-1&gt;,&lt;instance-id-2&gt;</code></p><p>Specify maintenance window targets using the following format:</p><p><code>Key=WindowTargetIds;,Values=&lt;window-target-id-1&gt;,&lt;window-target-id-2&gt;</code></p>
 */
@property (nonatomic, strong) NSArray<AWSSSMTarget *> * _Nullable targets;

/**
 <p>The ARN of the task to run.</p>
 */
@property (nonatomic, strong) NSString * _Nullable taskArn;

/**
 <p>The parameters that the task should use during execution. Populate only the fields that match the task type. All other fields should be empty. </p>
 */
@property (nonatomic, strong) AWSSSMMaintenanceWindowTaskInvocationParameters * _Nullable taskInvocationParameters;

/**
 <p>The parameters that should be passed to the task when it is run.</p><note><p><code>TaskParameters</code> has been deprecated. To specify parameters to pass to a task when it runs, instead use the <code>Parameters</code> option in the <code>TaskInvocationParameters</code> structure. For information about how Systems Manager handles these options for the supported maintenance window task types, see <a>MaintenanceWindowTaskInvocationParameters</a>.</p></note>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSSSMMaintenanceWindowTaskParameterValueExpression *> * _Nullable taskParameters;

/**
 <p>The type of task being registered.</p>
 */
@property (nonatomic, assign) AWSSSMMaintenanceWindowTaskType taskType;

/**
 <p>The ID of the maintenance window the task should be added to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable windowId;

@end

/**
 
 */
@interface AWSSSMRegisterTaskWithMaintenanceWindowResult : AWSModel


/**
 <p>The ID of the task in the maintenance window.</p>
 */
@property (nonatomic, strong) NSString * _Nullable windowTaskId;

@end

/**
 <p>An OpsItems that shares something in common with the current OpsItem. For example, related OpsItems can include OpsItems with similar error messages, impacted resources, or statuses for the impacted resource.</p>
 Required parameters: [OpsItemId]
 */
@interface AWSSSMRelatedOpsItem : AWSModel


/**
 <p>The ID of an OpsItem related to the current OpsItem.</p>
 */
@property (nonatomic, strong) NSString * _Nullable opsItemId;

@end

/**
 
 */
@interface AWSSSMRemoveTagsFromResourceRequest : AWSRequest


/**
 <p>The ID of the resource from which you want to remove tags. For example:</p><p>ManagedInstance: mi-012345abcde</p><p>MaintenanceWindow: mw-012345abcde</p><p>PatchBaseline: pb-012345abcde</p><p>For the Document and Parameter values, use the name of the resource.</p><note><p>The ManagedInstance type for this API action is only for on-premises managed instances. Specify the name of the managed instance in the following format: mi-ID_number. For example, mi-1a2b3c4d5e6f.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable resourceId;

/**
 <p>The type of resource from which you want to remove a tag.</p><note><p>The ManagedInstance type for this API action is only for on-premises managed instances. Specify the name of the managed instance in the following format: mi-ID_number. For example, mi-1a2b3c4d5e6f.</p></note>
 */
@property (nonatomic, assign) AWSSSMResourceTypeForTagging resourceType;

/**
 <p>Tag keys that you want to remove from the specified resource.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable tagKeys;

@end

/**
 
 */
@interface AWSSSMRemoveTagsFromResourceResult : AWSModel


@end

/**
 <p>The request body of the ResetServiceSetting API action.</p>
 Required parameters: [SettingId]
 */
@interface AWSSSMResetServiceSettingRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the service setting to reset. The setting ID can be <code>/ssm/parameter-store/default-parameter-tier</code>, <code>/ssm/parameter-store/high-throughput-enabled</code>, or <code>/ssm/managed-instance/activation-tier</code>. For example, <code>arn:aws:ssm:us-east-1:111122223333:servicesetting/ssm/parameter-store/high-throughput-enabled</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable settingId;

@end

/**
 <p>The result body of the ResetServiceSetting API action.</p>
 */
@interface AWSSSMResetServiceSettingResult : AWSModel


/**
 <p>The current, effective service setting after calling the ResetServiceSetting API action.</p>
 */
@property (nonatomic, strong) AWSSSMServiceSetting * _Nullable serviceSetting;

@end

/**
 <p>Information about targets that resolved during the Automation execution.</p>
 */
@interface AWSSSMResolvedTargets : AWSModel


/**
 <p>A list of parameter values sent to targets that resolved during the Automation execution.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable parameterValues;

/**
 <p>A boolean value indicating whether the resolved target list is truncated.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable truncated;

@end

/**
 <p>Compliance summary information for a specific resource. </p>
 */
@interface AWSSSMResourceComplianceSummaryItem : AWSModel


/**
 <p>The compliance type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable complianceType;

/**
 <p>A list of items that are compliant for the resource.</p>
 */
@property (nonatomic, strong) AWSSSMCompliantSummary * _Nullable compliantSummary;

/**
 <p>Information about the execution.</p>
 */
@property (nonatomic, strong) AWSSSMComplianceExecutionSummary * _Nullable executionSummary;

/**
 <p>A list of items that aren't compliant for the resource.</p>
 */
@property (nonatomic, strong) AWSSSMNonCompliantSummary * _Nullable nonCompliantSummary;

/**
 <p>The highest severity item found for the resource. The resource is compliant for this item.</p>
 */
@property (nonatomic, assign) AWSSSMComplianceSeverity overallSeverity;

/**
 <p>The resource ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceId;

/**
 <p>The resource type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceType;

/**
 <p>The compliance status for the resource.</p>
 */
@property (nonatomic, assign) AWSSSMComplianceStatus status;

@end

/**
 <p>Information about the AwsOrganizationsSource resource data sync source. A sync source of this type can synchronize data from AWS Organizations or, if an AWS Organization is not present, from multiple AWS Regions.</p>
 Required parameters: [OrganizationSourceType]
 */
@interface AWSSSMResourceDataSyncAwsOrganizationsSource : AWSModel


/**
 <p>If an AWS Organization is present, this is either <code>OrganizationalUnits</code> or <code>EntireOrganization</code>. For <code>OrganizationalUnits</code>, the data is aggregated from a set of organization units. For <code>EntireOrganization</code>, the data is aggregated from the entire AWS Organization. </p>
 */
@property (nonatomic, strong) NSString * _Nullable organizationSourceType;

/**
 <p>The AWS Organizations organization units included in the sync.</p>
 */
@property (nonatomic, strong) NSArray<AWSSSMResourceDataSyncOrganizationalUnit *> * _Nullable organizationalUnits;

@end

/**
 <p>Synchronize Systems Manager Inventory data from multiple AWS accounts defined in AWS Organizations to a centralized S3 bucket. Data is synchronized to individual key prefixes in the central bucket. Each key prefix represents a different AWS account ID.</p>
 */
@interface AWSSSMResourceDataSyncDestinationDataSharing : AWSModel


/**
 <p>The sharing data type. Only <code>Organization</code> is supported.</p>
 */
@property (nonatomic, strong) NSString * _Nullable destinationDataSharingType;

@end

/**
 <p>Information about a Resource Data Sync configuration, including its current status and last successful sync.</p>
 */
@interface AWSSSMResourceDataSyncItem : AWSModel


/**
 <p>The status reported by the last sync.</p>
 */
@property (nonatomic, assign) AWSSSMLastResourceDataSyncStatus lastStatus;

/**
 <p>The last time the sync operations returned a status of <code>SUCCESSFUL</code> (UTC).</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastSuccessfulSyncTime;

/**
 <p>The status message details reported by the last sync.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lastSyncStatusMessage;

/**
 <p>The last time the configuration attempted to sync (UTC).</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastSyncTime;

/**
 <p>Configuration information for the target S3 bucket.</p>
 */
@property (nonatomic, strong) AWSSSMResourceDataSyncS3Destination * _Nullable s3Destination;

/**
 <p>The date and time the configuration was created (UTC).</p>
 */
@property (nonatomic, strong) NSDate * _Nullable syncCreatedTime;

/**
 <p>The date and time the resource data sync was changed. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable syncLastModifiedTime;

/**
 <p>The name of the Resource Data Sync.</p>
 */
@property (nonatomic, strong) NSString * _Nullable syncName;

/**
 <p>Information about the source where the data was synchronized. </p>
 */
@property (nonatomic, strong) AWSSSMResourceDataSyncSourceWithState * _Nullable syncSource;

/**
 <p>The type of resource data sync. If <code>SyncType</code> is <code>SyncToDestination</code>, then the resource data sync synchronizes data to an S3 bucket. If the <code>SyncType</code> is <code>SyncFromSource</code> then the resource data sync synchronizes data from AWS Organizations or from multiple AWS Regions.</p>
 */
@property (nonatomic, strong) NSString * _Nullable syncType;

@end

/**
 <p>The AWS Organizations organizational unit data source for the sync.</p>
 */
@interface AWSSSMResourceDataSyncOrganizationalUnit : AWSModel


/**
 <p>The AWS Organization unit ID data source for the sync.</p>
 */
@property (nonatomic, strong) NSString * _Nullable organizationalUnitId;

@end

/**
 <p>Information about the target S3 bucket for the Resource Data Sync.</p>
 Required parameters: [BucketName, SyncFormat, Region]
 */
@interface AWSSSMResourceDataSyncS3Destination : AWSModel


/**
 <p>The ARN of an encryption key for a destination in Amazon S3. Must belong to the same Region as the destination S3 bucket.</p>
 */
@property (nonatomic, strong) NSString * _Nullable AWSKMSKeyARN;

/**
 <p>The name of the S3 bucket where the aggregated data is stored.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucketName;

/**
 <p>Enables destination data sharing. By default, this field is <code>null</code>.</p>
 */
@property (nonatomic, strong) AWSSSMResourceDataSyncDestinationDataSharing * _Nullable destinationDataSharing;

/**
 <p>An Amazon S3 prefix for the bucket.</p>
 */
@property (nonatomic, strong) NSString * _Nullable prefix;

/**
 <p>The AWS Region with the S3 bucket targeted by the Resource Data Sync.</p>
 */
@property (nonatomic, strong) NSString * _Nullable region;

/**
 <p>A supported sync format. The following format is currently supported: JsonSerDe</p>
 */
@property (nonatomic, assign) AWSSSMResourceDataSyncS3Format syncFormat;

@end

/**
 <p>Information about the source of the data included in the resource data sync.</p>
 Required parameters: [SourceType, SourceRegions]
 */
@interface AWSSSMResourceDataSyncSource : AWSModel


/**
 <p>Information about the AwsOrganizationsSource resource data sync source. A sync source of this type can synchronize data from AWS Organizations.</p>
 */
@property (nonatomic, strong) AWSSSMResourceDataSyncAwsOrganizationsSource * _Nullable awsOrganizationsSource;

/**
 <p>Whether to automatically synchronize and aggregate data from new AWS Regions when those Regions come online.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable includeFutureRegions;

/**
 <p>The <code>SyncSource</code> AWS Regions included in the resource data sync.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable sourceRegions;

/**
 <p>The type of data source for the resource data sync. <code>SourceType</code> is either <code>AwsOrganizations</code> (if an organization is present in AWS Organizations) or <code>singleAccountMultiRegions</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceType;

@end

/**
 <p>The data type name for including resource data sync state. There are four sync states:</p><p><code>OrganizationNotExists</code> (Your organization doesn't exist)</p><p><code>NoPermissions</code> (The system can't locate the service-linked role. This role is automatically created when a user creates a resource data sync in Explorer.)</p><p><code>InvalidOrganizationalUnit</code> (You specified or selected an invalid unit in the resource data sync configuration.)</p><p><code>TrustedAccessDisabled</code> (You disabled Systems Manager access in the organization in AWS Organizations.)</p>
 */
@interface AWSSSMResourceDataSyncSourceWithState : AWSModel


/**
 <p>The field name in <code>SyncSource</code> for the <code>ResourceDataSyncAwsOrganizationsSource</code> type.</p>
 */
@property (nonatomic, strong) AWSSSMResourceDataSyncAwsOrganizationsSource * _Nullable awsOrganizationsSource;

/**
 <p>Whether to automatically synchronize and aggregate data from new AWS Regions when those Regions come online.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable includeFutureRegions;

/**
 <p>The <code>SyncSource</code> AWS Regions included in the resource data sync.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable sourceRegions;

/**
 <p>The type of data source for the resource data sync. <code>SourceType</code> is either <code>AwsOrganizations</code> (if an organization is present in AWS Organizations) or <code>singleAccountMultiRegions</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceType;

/**
 <p>The data type name for including resource data sync state. There are four sync states:</p><p><code>OrganizationNotExists</code>: Your organization doesn't exist.</p><p><code>NoPermissions</code>: The system can't locate the service-linked role. This role is automatically created when a user creates a resource data sync in Explorer.</p><p><code>InvalidOrganizationalUnit</code>: You specified or selected an invalid unit in the resource data sync configuration.</p><p><code>TrustedAccessDisabled</code>: You disabled Systems Manager access in the organization in AWS Organizations.</p>
 */
@property (nonatomic, strong) NSString * _Nullable state;

@end

/**
 <p>The inventory item result attribute.</p>
 Required parameters: [TypeName]
 */
@interface AWSSSMResultAttribute : AWSModel


/**
 <p>Name of the inventory item type. Valid value: AWS:InstanceInformation. Default Value: AWS:InstanceInformation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable typeName;

@end

/**
 
 */
@interface AWSSSMResumeSessionRequest : AWSRequest


/**
 <p>The ID of the disconnected session to resume.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sessionId;

@end

/**
 
 */
@interface AWSSSMResumeSessionResponse : AWSModel


/**
 <p>The ID of the session.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sessionId;

/**
 <p>A URL back to SSM Agent on the instance that the Session Manager client uses to send commands and receive output from the instance. Format: <code>wss://ssmmessages.<b>region</b>.amazonaws.com/v1/data-channel/<b>session-id</b>?stream=(input|output)</code>.</p><p><b>region</b> represents the Region identifier for an AWS Region supported by AWS Systems Manager, such as <code>us-east-2</code> for the US East (Ohio) Region. For a list of supported <b>region</b> values, see the <b>Region</b> column in <a href="http://docs.aws.amazon.com/general/latest/gr/ssm.html#ssm_region">Systems Manager service endpoints</a> in the <i>AWS General Reference</i>.</p><p><b>session-id</b> represents the ID of a Session Manager session, such as <code>1a2b3c4dEXAMPLE</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable streamUrl;

/**
 <p>An encrypted token value containing session and caller information. Used to authenticate the connection to the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tokenValue;

@end

/**
 <p>An S3 bucket where you want to store the results of this request.</p>
 */
@interface AWSSSMS3OutputLocation : AWSModel


/**
 <p>The name of the S3 bucket.</p>
 */
@property (nonatomic, strong) NSString * _Nullable outputS3BucketName;

/**
 <p>The S3 bucket subfolder.</p>
 */
@property (nonatomic, strong) NSString * _Nullable outputS3KeyPrefix;

/**
 <p>(Deprecated) You can no longer specify this parameter. The system ignores it. Instead, Systems Manager automatically determines the Region of the S3 bucket.</p>
 */
@property (nonatomic, strong) NSString * _Nullable outputS3Region;

@end

/**
 <p>A URL for the S3 bucket where you want to store the results of this request.</p>
 */
@interface AWSSSMS3OutputUrl : AWSModel


/**
 <p>A URL for an S3 bucket where you want to store the results of this request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable outputUrl;

@end

/**
 <p>Information about a scheduled execution for a maintenance window.</p>
 */
@interface AWSSSMScheduledWindowExecution : AWSModel


/**
 <p>The time, in ISO-8601 Extended format, that the maintenance window is scheduled to be run.</p>
 */
@property (nonatomic, strong) NSString * _Nullable executionTime;

/**
 <p>The name of the maintenance window to be run.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The ID of the maintenance window to be run.</p>
 */
@property (nonatomic, strong) NSString * _Nullable windowId;

@end

/**
 
 */
@interface AWSSSMSendAutomationSignalRequest : AWSRequest


/**
 <p>The unique identifier for an existing Automation execution that you want to send the signal to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable automationExecutionId;

/**
 <p>The data sent with the signal. The data schema depends on the type of signal used in the request.</p><p>For <code>Approve</code> and <code>Reject</code> signal types, the payload is an optional comment that you can send with the signal type. For example:</p><p><code>Comment="Looks good"</code></p><p>For <code>StartStep</code> and <code>Resume</code> signal types, you must send the name of the Automation step to start or resume as the payload. For example:</p><p><code>StepName="step1"</code></p><p>For the <code>StopStep</code> signal type, you must send the step execution ID as the payload. For example:</p><p><code>StepExecutionId="97fff367-fc5a-4299-aed8-0123456789ab"</code></p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSArray<NSString *> *> * _Nullable payload;

/**
 <p>The type of signal to send to an Automation execution. </p>
 */
@property (nonatomic, assign) AWSSSMSignalType signalType;

@end

/**
 
 */
@interface AWSSSMSendAutomationSignalResult : AWSModel


@end

/**
 
 */
@interface AWSSSMSendCommandRequest : AWSRequest


/**
 <p>Enables Systems Manager to send Run Command output to Amazon CloudWatch Logs. </p>
 */
@property (nonatomic, strong) AWSSSMCloudWatchOutputConfig * _Nullable cloudWatchOutputConfig;

/**
 <p>User-specified information about the command, such as a brief description of what the command should do.</p>
 */
@property (nonatomic, strong) NSString * _Nullable comment;

/**
 <p>The Sha256 or Sha1 hash created by the system when the document was created. </p><note><p>Sha1 hashes have been deprecated.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable documentHash;

/**
 <p>Sha256 or Sha1.</p><note><p>Sha1 hashes have been deprecated.</p></note>
 */
@property (nonatomic, assign) AWSSSMDocumentHashType documentHashType;

/**
 <p>Required. The name of the Systems Manager document to run. This can be a public document or a custom document.</p>
 */
@property (nonatomic, strong) NSString * _Nullable documentName;

/**
 <p>The SSM document version to use in the request. You can specify $DEFAULT, $LATEST, or a specific version number. If you run commands by using the AWS CLI, then you must escape the first two options by using a backslash. If you specify a version number, then you don't need to use the backslash. For example:</p><p>--document-version "\$DEFAULT"</p><p>--document-version "\$LATEST"</p><p>--document-version "3"</p>
 */
@property (nonatomic, strong) NSString * _Nullable documentVersion;

/**
 <p>The IDs of the instances where the command should run. Specifying instance IDs is most useful when you are targeting a limited number of instances, though you can specify up to 50 IDs.</p><p>To target a larger number of instances, or if you prefer not to list individual instance IDs, we recommend using the <code>Targets</code> option instead. Using <code>Targets</code>, which accepts tag key-value pairs to identify the instances to send commands to, you can a send command to tens, hundreds, or thousands of instances at once.</p><p>For more information about how to use targets, see <a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/send-commands-multiple.html">Using targets and rate controls to send commands to a fleet</a> in the <i>AWS Systems Manager User Guide</i>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable instanceIds;

/**
 <p>(Optional) The maximum number of instances that are allowed to run the command at the same time. You can specify a number such as 10 or a percentage such as 10%. The default value is 50. For more information about how to use MaxConcurrency, see <a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/send-commands-multiple.html#send-commands-velocity">Using concurrency controls</a> in the <i>AWS Systems Manager User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable maxConcurrency;

/**
 <p>The maximum number of errors allowed without the command failing. When the command fails one more time beyond the value of MaxErrors, the systems stops sending the command to additional targets. You can specify a number like 10 or a percentage like 10%. The default value is 0. For more information about how to use MaxErrors, see <a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/send-commands-multiple.html#send-commands-maxerrors">Using error controls</a> in the <i>AWS Systems Manager User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable maxErrors;

/**
 <p>Configurations for sending notifications.</p>
 */
@property (nonatomic, strong) AWSSSMNotificationConfig * _Nullable notificationConfig;

/**
 <p>The name of the S3 bucket where command execution responses should be stored.</p>
 */
@property (nonatomic, strong) NSString * _Nullable outputS3BucketName;

/**
 <p>The directory structure within the S3 bucket where the responses should be stored.</p>
 */
@property (nonatomic, strong) NSString * _Nullable outputS3KeyPrefix;

/**
 <p>(Deprecated) You can no longer specify this parameter. The system ignores it. Instead, Systems Manager automatically determines the Region of the S3 bucket.</p>
 */
@property (nonatomic, strong) NSString * _Nullable outputS3Region;

/**
 <p>The required and optional parameters specified in the document being run.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSArray<NSString *> *> * _Nullable parameters;

/**
 <p>The ARN of the IAM service role to use to publish Amazon Simple Notification Service (Amazon SNS) notifications for Run Command commands.</p>
 */
@property (nonatomic, strong) NSString * _Nullable serviceRoleArn;

/**
 <p>An array of search criteria that targets instances using a <code>Key,Value</code> combination that you specify. Specifying targets is most useful when you want to send a command to a large number of instances at once. Using <code>Targets</code>, which accepts tag key-value pairs to identify instances, you can send a command to tens, hundreds, or thousands of instances at once.</p><p>To send a command to a smaller number of instances, you can use the <code>InstanceIds</code> option instead.</p><p>For more information about how to use targets, see <a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/send-commands-multiple.html">Sending commands to a fleet</a> in the <i>AWS Systems Manager User Guide</i>.</p>
 */
@property (nonatomic, strong) NSArray<AWSSSMTarget *> * _Nullable targets;

/**
 <p>If this time is reached and the command has not already started running, it will not run.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable timeoutSeconds;

@end

/**
 
 */
@interface AWSSSMSendCommandResult : AWSModel


/**
 <p>The request as it was received by Systems Manager. Also provides the command ID which can be used future references to this request.</p>
 */
@property (nonatomic, strong) AWSSSMCommand * _Nullable command;

@end

/**
 <p>The service setting data structure.</p><p><code>ServiceSetting</code> is an account-level setting for an AWS service. This setting defines how a user interacts with or uses a service or a feature of a service. For example, if an AWS service charges money to the account based on feature or service usage, then the AWS service team might create a default setting of "false". This means the user can't use this feature unless they change the setting to "true" and intentionally opt in for a paid feature.</p><p>Services map a <code>SettingId</code> object to a setting value. AWS services teams define the default value for a <code>SettingId</code>. You can't create a new <code>SettingId</code>, but you can overwrite the default value if you have the <code>ssm:UpdateServiceSetting</code> permission for the setting. Use the <a>UpdateServiceSetting</a> API action to change the default setting. Or, use the <a>ResetServiceSetting</a> to change the value back to the original value defined by the AWS service team.</p>
 */
@interface AWSSSMServiceSetting : AWSModel


/**
 <p>The ARN of the service setting.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ARN;

/**
 <p>The last time the service setting was modified.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedDate;

/**
 <p>The ARN of the last modified user. This field is populated only if the setting value was overwritten.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lastModifiedUser;

/**
 <p>The ID of the service setting.</p>
 */
@property (nonatomic, strong) NSString * _Nullable settingId;

/**
 <p>The value of the service setting.</p>
 */
@property (nonatomic, strong) NSString * _Nullable settingValue;

/**
 <p>The status of the service setting. The value can be Default, Customized or PendingUpdate.</p><ul><li><p>Default: The current setting uses a default value provisioned by the AWS service team.</p></li><li><p>Customized: The current setting use a custom value specified by the customer.</p></li><li><p>PendingUpdate: The current setting uses a default or custom value, but a setting change request is pending approval.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable status;

@end

/**
 <p>Information about a Session Manager connection to an instance.</p>
 */
@interface AWSSSMSession : AWSModel


/**
 <p>Reserved for future use.</p>
 */
@property (nonatomic, strong) NSString * _Nullable details;

/**
 <p>The name of the Session Manager SSM document used to define the parameters and plugin settings for the session. For example, <code>SSM-SessionManagerRunShell</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable documentName;

/**
 <p>The date and time, in ISO-8601 Extended format, when the session was terminated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable endDate;

/**
 <p>Reserved for future use.</p>
 */
@property (nonatomic, strong) AWSSSMSessionManagerOutputUrl * _Nullable outputUrl;

/**
 <p>The ID of the AWS user account that started the session.</p>
 */
@property (nonatomic, strong) NSString * _Nullable owner;

/**
 <p>The ID of the session.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sessionId;

/**
 <p>The date and time, in ISO-8601 Extended format, when the session began.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable startDate;

/**
 <p>The status of the session. For example, "Connected" or "Terminated".</p>
 */
@property (nonatomic, assign) AWSSSMSessionStatus status;

/**
 <p>The instance that the Session Manager session connected to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable target;

@end

/**
 <p>Describes a filter for Session Manager information.</p>
 Required parameters: [key, value]
 */
@interface AWSSSMSessionFilter : AWSModel


/**
 <p>The name of the filter.</p>
 */
@property (nonatomic, assign) AWSSSMSessionFilterKey key;

/**
 <p>The filter value. Valid values for each filter key are as follows:</p><ul><li><p>InvokedAfter: Specify a timestamp to limit your results. For example, specify 2018-08-29T00:00:00Z to see sessions that started August 29, 2018, and later.</p></li><li><p>InvokedBefore: Specify a timestamp to limit your results. For example, specify 2018-08-29T00:00:00Z to see sessions that started before August 29, 2018.</p></li><li><p>Target: Specify an instance to which session connections have been made.</p></li><li><p>Owner: Specify an AWS user account to see a list of sessions started by that user.</p></li><li><p>Status: Specify a valid session status to see a list of all sessions with that status. Status values you can specify include:</p><ul><li><p>Connected</p></li><li><p>Connecting</p></li><li><p>Disconnected</p></li><li><p>Terminated</p></li><li><p>Terminating</p></li><li><p>Failed</p></li></ul></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 <p>Reserved for future use.</p>
 */
@interface AWSSSMSessionManagerOutputUrl : AWSModel


/**
 <p>Reserved for future use.</p>
 */
@property (nonatomic, strong) NSString * _Nullable cloudWatchOutputUrl;

/**
 <p>Reserved for future use.</p>
 */
@property (nonatomic, strong) NSString * _Nullable s3OutputUrl;

@end

/**
 <p>The number of managed instances found for each patch severity level defined in the request filter.</p>
 */
@interface AWSSSMSeveritySummary : AWSModel


/**
 <p>The total number of resources or compliance items that have a severity level of critical. Critical severity is determined by the organization that published the compliance items.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable criticalCount;

/**
 <p>The total number of resources or compliance items that have a severity level of high. High severity is determined by the organization that published the compliance items.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable highCount;

/**
 <p>The total number of resources or compliance items that have a severity level of informational. Informational severity is determined by the organization that published the compliance items.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable informationalCount;

/**
 <p>The total number of resources or compliance items that have a severity level of low. Low severity is determined by the organization that published the compliance items.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable lowCount;

/**
 <p>The total number of resources or compliance items that have a severity level of medium. Medium severity is determined by the organization that published the compliance items.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable mediumCount;

/**
 <p>The total number of resources or compliance items that have a severity level of unspecified. Unspecified severity is determined by the organization that published the compliance items.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable unspecifiedCount;

@end

/**
 
 */
@interface AWSSSMStartAssociationsOnceRequest : AWSRequest


/**
 <p>The association IDs that you want to run immediately and only one time.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable associationIds;

@end

/**
 
 */
@interface AWSSSMStartAssociationsOnceResult : AWSModel


@end

/**
 
 */
@interface AWSSSMStartAutomationExecutionRequest : AWSRequest


/**
 <p>User-provided idempotency token. The token must be unique, is case insensitive, enforces the UUID format, and can't be reused.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>The name of the Automation document to use for this execution.</p>
 */
@property (nonatomic, strong) NSString * _Nullable documentName;

/**
 <p>The version of the Automation document to use for this execution.</p>
 */
@property (nonatomic, strong) NSString * _Nullable documentVersion;

/**
 <p>The maximum number of targets allowed to run this task in parallel. You can specify a number, such as 10, or a percentage, such as 10%. The default value is 10.</p>
 */
@property (nonatomic, strong) NSString * _Nullable maxConcurrency;

/**
 <p>The number of errors that are allowed before the system stops running the automation on additional targets. You can specify either an absolute number of errors, for example 10, or a percentage of the target set, for example 10%. If you specify 3, for example, the system stops running the automation when the fourth error is received. If you specify 0, then the system stops running the automation on additional targets after the first error result is returned. If you run an automation on 50 resources and set max-errors to 10%, then the system stops running the automation on additional targets when the sixth error is received.</p><p>Executions that are already running an automation when max-errors is reached are allowed to complete, but some of these executions may fail as well. If you need to ensure that there won't be more than max-errors failed executions, set max-concurrency to 1 so the executions proceed one at a time.</p>
 */
@property (nonatomic, strong) NSString * _Nullable maxErrors;

/**
 <p>The execution mode of the automation. Valid modes include the following: Auto and Interactive. The default mode is Auto.</p>
 */
@property (nonatomic, assign) AWSSSMExecutionMode mode;

/**
 <p>A key-value map of execution parameters, which match the declared parameters in the Automation document.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSArray<NSString *> *> * _Nullable parameters;

/**
 <p>Optional metadata that you assign to a resource. You can specify a maximum of five tags for an automation. Tags enable you to categorize a resource in different ways, such as by purpose, owner, or environment. For example, you might want to tag an automation to identify an environment or operating system. In this case, you could specify the following key name/value pairs:</p><ul><li><p><code>Key=environment,Value=test</code></p></li><li><p><code>Key=OS,Value=Windows</code></p></li></ul><note><p>To add tags to an existing patch baseline, use the <a>AddTagsToResource</a> action.</p></note>
 */
@property (nonatomic, strong) NSArray<AWSSSMTag *> * _Nullable tags;

/**
 <p>A location is a combination of AWS Regions and/or AWS accounts where you want to run the Automation. Use this action to start an Automation in multiple Regions and multiple accounts. For more information, see <a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-automation-multiple-accounts-and-regions.html">Running Automation workflows in multiple AWS Regions and accounts</a> in the <i>AWS Systems Manager User Guide</i>. </p>
 */
@property (nonatomic, strong) NSArray<AWSSSMTargetLocation *> * _Nullable targetLocations;

/**
 <p>A key-value mapping of document parameters to target resources. Both Targets and TargetMaps cannot be specified together.</p>
 */
@property (nonatomic, strong) NSArray<NSDictionary<NSString *, NSArray<NSString *> *> *> * _Nullable targetMaps;

/**
 <p>The name of the parameter used as the target resource for the rate-controlled execution. Required if you specify targets.</p>
 */
@property (nonatomic, strong) NSString * _Nullable targetParameterName;

/**
 <p>A key-value mapping to target resources. Required if you specify TargetParameterName.</p>
 */
@property (nonatomic, strong) NSArray<AWSSSMTarget *> * _Nullable targets;

@end

/**
 
 */
@interface AWSSSMStartAutomationExecutionResult : AWSModel


/**
 <p>The unique ID of a newly scheduled automation execution.</p>
 */
@property (nonatomic, strong) NSString * _Nullable automationExecutionId;

@end

/**
 
 */
@interface AWSSSMStartSessionRequest : AWSRequest


/**
 <p>The name of the SSM document to define the parameters and plugin settings for the session. For example, <code>SSM-SessionManagerRunShell</code>. You can call the <a>GetDocument</a> API to verify the document exists before attempting to start a session. If no document name is provided, a shell to the instance is launched by default.</p>
 */
@property (nonatomic, strong) NSString * _Nullable documentName;

/**
 <p>Reserved for future use.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSArray<NSString *> *> * _Nullable parameters;

/**
 <p>The instance to connect to for the session.</p>
 */
@property (nonatomic, strong) NSString * _Nullable target;

@end

/**
 
 */
@interface AWSSSMStartSessionResponse : AWSModel


/**
 <p>The ID of the session.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sessionId;

/**
 <p>A URL back to SSM Agent on the instance that the Session Manager client uses to send commands and receive output from the instance. Format: <code>wss://ssmmessages.<b>region</b>.amazonaws.com/v1/data-channel/<b>session-id</b>?stream=(input|output)</code></p><p><b>region</b> represents the Region identifier for an AWS Region supported by AWS Systems Manager, such as <code>us-east-2</code> for the US East (Ohio) Region. For a list of supported <b>region</b> values, see the <b>Region</b> column in <a href="http://docs.aws.amazon.com/general/latest/gr/ssm.html#ssm_region">Systems Manager service endpoints</a> in the <i>AWS General Reference</i>.</p><p><b>session-id</b> represents the ID of a Session Manager session, such as <code>1a2b3c4dEXAMPLE</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable streamUrl;

/**
 <p>An encrypted token value containing session and caller information. Used to authenticate the connection to the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tokenValue;

@end

/**
 <p>Detailed information about an the execution state of an Automation step.</p>
 */
@interface AWSSSMStepExecution : AWSModel


/**
 <p>The action this step performs. The action determines the behavior of the step.</p>
 */
@property (nonatomic, strong) NSString * _Nullable action;

/**
 <p>If a step has finished execution, this contains the time the execution ended. If the step has not yet concluded, this field is not populated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable executionEndTime;

/**
 <p>If a step has begun execution, this contains the time the step started. If the step is in Pending status, this field is not populated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable executionStartTime;

/**
 <p>Information about the Automation failure.</p>
 */
@property (nonatomic, strong) AWSSSMFailureDetails * _Nullable failureDetails;

/**
 <p>If a step failed, this message explains why the execution failed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable failureMessage;

/**
 <p>Fully-resolved values passed into the step before execution.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable inputs;

/**
 <p>The flag which can be used to help decide whether the failure of current step leads to the Automation failure.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isCritical;

/**
 <p>The flag which can be used to end automation no matter whether the step succeeds or fails.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isEnd;

/**
 <p>The maximum number of tries to run the action of the step. The default value is 1.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxAttempts;

/**
 <p>The next step after the step succeeds.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextStep;

/**
 <p>The action to take if the step fails. The default value is Abort.</p>
 */
@property (nonatomic, strong) NSString * _Nullable onFailure;

/**
 <p>Returned values from the execution of the step.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSArray<NSString *> *> * _Nullable outputs;

/**
 <p>A user-specified list of parameters to override when running a step.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSArray<NSString *> *> * _Nullable overriddenParameters;

/**
 <p>A message associated with the response code for an execution.</p>
 */
@property (nonatomic, strong) NSString * _Nullable response;

/**
 <p>The response code returned by the execution of the step.</p>
 */
@property (nonatomic, strong) NSString * _Nullable responseCode;

/**
 <p>The unique ID of a step execution.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stepExecutionId;

/**
 <p>The name of this execution step.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stepName;

/**
 <p>The execution status for this step.</p>
 */
@property (nonatomic, assign) AWSSSMAutomationExecutionStatus stepStatus;

/**
 <p>The combination of AWS Regions and accounts targeted by the current Automation execution.</p>
 */
@property (nonatomic, strong) AWSSSMTargetLocation * _Nullable targetLocation;

/**
 <p>The targets for the step execution.</p>
 */
@property (nonatomic, strong) NSArray<AWSSSMTarget *> * _Nullable targets;

/**
 <p>The timeout seconds of the step.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable timeoutSeconds;

/**
 <p>Strategies used when step fails, we support Continue and Abort. Abort will fail the automation when the step fails. Continue will ignore the failure of current step and allow automation to run the next step. With conditional branching, we add step:stepName to support the automation to go to another specific step.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable validNextSteps;

@end

/**
 <p>A filter to limit the amount of step execution information returned by the call.</p>
 Required parameters: [Key, Values]
 */
@interface AWSSSMStepExecutionFilter : AWSModel


/**
 <p>One or more keys to limit the results. Valid filter keys include the following: StepName, Action, StepExecutionId, StepExecutionStatus, StartTimeBefore, StartTimeAfter.</p>
 */
@property (nonatomic, assign) AWSSSMStepExecutionFilterKey key;

/**
 <p>The values of the filter key.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable values;

@end

/**
 
 */
@interface AWSSSMStopAutomationExecutionRequest : AWSRequest


/**
 <p>The execution ID of the Automation to stop.</p>
 */
@property (nonatomic, strong) NSString * _Nullable automationExecutionId;

/**
 <p>The stop request type. Valid types include the following: Cancel and Complete. The default type is Cancel.</p>
 */
@property (nonatomic, assign) AWSSSMStopType types;

@end

/**
 
 */
@interface AWSSSMStopAutomationExecutionResult : AWSModel


@end

/**
 <p>Metadata that you assign to your AWS resources. Tags enable you to categorize your resources in different ways, for example, by purpose, owner, or environment. In Systems Manager, you can apply tags to documents, managed instances, maintenance windows, Parameter Store parameters, and patch baselines.</p>
 Required parameters: [Key, Value]
 */
@interface AWSSSMTag : AWSModel


/**
 <p>The name of the tag.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>The value of the tag.</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 <p>An array of search criteria that targets instances using a Key,Value combination that you specify. </p><p>Supported formats include the following.</p><ul><li><p><code>Key=InstanceIds,Values=<i>instance-id-1</i>,<i>instance-id-2</i>,<i>instance-id-3</i></code></p></li><li><p><code>Key=tag:<i>my-tag-key</i>,Values=<i>my-tag-value-1</i>,<i>my-tag-value-2</i></code></p></li><li><p><code>Key=tag-key,Values=<i>my-tag-key-1</i>,<i>my-tag-key-2</i></code></p></li><li><p><b>Run Command and Maintenance window targets only</b>: <code>Key=resource-groups:Name,Values=<i>resource-group-name</i></code></p></li><li><p><b>Maintenance window targets only</b>: <code>Key=resource-groups:ResourceTypeFilters,Values=<i>resource-type-1</i>,<i>resource-type-2</i></code></p></li><li><p><b>Automation targets only</b>: <code>Key=ResourceGroup;Values=<i>resource-group-name</i></code></p></li></ul><p>For example:</p><ul><li><p><code>Key=InstanceIds,Values=i-02573cafcfEXAMPLE,i-0471e04240EXAMPLE,i-07782c72faEXAMPLE</code></p></li><li><p><code>Key=tag:CostCenter,Values=CostCenter1,CostCenter2,CostCenter3</code></p></li><li><p><code>Key=tag-key,Values=Name,Instance-Type,CostCenter</code></p></li><li><p><b>Run Command and Maintenance window targets only</b>: <code>Key=resource-groups:Name,Values=ProductionResourceGroup</code></p><p>This example demonstrates how to target all resources in the resource group <b>ProductionResourceGroup</b> in your maintenance window.</p></li><li><p><b>Maintenance window targets only</b>: <code>Key=resource-groups:ResourceTypeFilters,Values=<i>AWS::EC2::INSTANCE</i>,<i>AWS::EC2::VPC</i></code></p><p>This example demonstrates how to target only EC2 instances and VPCs in your maintenance window.</p></li><li><p><b>Automation targets only</b>: <code>Key=ResourceGroup,Values=MyResourceGroup</code></p></li><li><p><b>State Manager association targets only</b>: <code>Key=InstanceIds,Values=<i>*</i></code></p><p>This example demonstrates how to target all managed instances in the AWS Region where the association was created.</p></li></ul><p>For more information about how to send commands that target instances using <code>Key,Value</code> parameters, see <a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/send-commands-multiple.html#send-commands-targeting">Targeting multiple instances</a> in the <i>AWS Systems Manager User Guide</i>.</p>
 */
@interface AWSSSMTarget : AWSModel


/**
 <p>User-defined criteria for sending commands that target instances that meet the criteria.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>User-defined criteria that maps to <code>Key</code>. For example, if you specified <code>tag:ServerRole</code>, you could specify <code>value:WebServer</code> to run a command on instances that include EC2 tags of <code>ServerRole,WebServer</code>. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable values;

@end

/**
 <p>The combination of AWS Regions and accounts targeted by the current Automation execution.</p>
 */
@interface AWSSSMTargetLocation : AWSModel


/**
 <p>The AWS accounts targeted by the current Automation execution.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable accounts;

/**
 <p>The Automation execution role used by the currently running Automation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable executionRoleName;

/**
 <p>The AWS Regions targeted by the current Automation execution.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable regions;

/**
 <p>The maximum number of AWS accounts and AWS regions allowed to run the Automation concurrently </p>
 */
@property (nonatomic, strong) NSString * _Nullable targetLocationMaxConcurrency;

/**
 <p>The maximum number of errors allowed before the system stops queueing additional Automation executions for the currently running Automation. </p>
 */
@property (nonatomic, strong) NSString * _Nullable targetLocationMaxErrors;

@end

/**
 
 */
@interface AWSSSMTerminateSessionRequest : AWSRequest


/**
 <p>The ID of the session to terminate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sessionId;

@end

/**
 
 */
@interface AWSSSMTerminateSessionResponse : AWSModel


/**
 <p>The ID of the session that has been terminated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sessionId;

@end

/**
 
 */
@interface AWSSSMUpdateAssociationRequest : AWSRequest


/**
 <p>By default, when you update an association, the system runs it immediately after it is updated and then according to the schedule you specified. Specify this option if you don't want an association to run immediately after you update it.</p><p>Also, if you specified this option when you created the association, you can reset it. To do so, specify the <code>no-apply-only-at-cron-interval</code> parameter when you update the association from the command line. This parameter forces the association to run immediately after updating it and according to the interval specified.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable applyOnlyAtCronInterval;

/**
 <p>The ID of the association you want to update. </p>
 */
@property (nonatomic, strong) NSString * _Nullable associationId;

/**
 <p>The name of the association that you want to update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable associationName;

/**
 <p>This parameter is provided for concurrency control purposes. You must specify the latest association version in the service. If you want to ensure that this request succeeds, either specify <code>$LATEST</code>, or omit this parameter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable associationVersion;

/**
 <p>Specify the target for the association. This target is required for associations that use an Automation document and target resources by using rate controls.</p>
 */
@property (nonatomic, strong) NSString * _Nullable automationTargetParameterName;

/**
 <p>The severity level to assign to the association.</p>
 */
@property (nonatomic, assign) AWSSSMAssociationComplianceSeverity complianceSeverity;

/**
 <p>The document version you want update for the association. </p>
 */
@property (nonatomic, strong) NSString * _Nullable documentVersion;

/**
 <p>The maximum number of targets allowed to run the association at the same time. You can specify a number, for example 10, or a percentage of the target set, for example 10%. The default value is 100%, which means all targets run the association at the same time.</p><p>If a new instance starts and attempts to run an association while Systems Manager is running MaxConcurrency associations, the association is allowed to run. During the next association interval, the new instance will process its association within the limit specified for MaxConcurrency.</p>
 */
@property (nonatomic, strong) NSString * _Nullable maxConcurrency;

/**
 <p>The number of errors that are allowed before the system stops sending requests to run the association on additional targets. You can specify either an absolute number of errors, for example 10, or a percentage of the target set, for example 10%. If you specify 3, for example, the system stops sending requests when the fourth error is received. If you specify 0, then the system stops sending requests after the first error is returned. If you run an association on 50 instances and set MaxError to 10%, then the system stops sending the request when the sixth error is received.</p><p>Executions that are already running an association when MaxErrors is reached are allowed to complete, but some of these executions may fail as well. If you need to ensure that there won't be more than max-errors failed executions, set MaxConcurrency to 1 so that executions proceed one at a time.</p>
 */
@property (nonatomic, strong) NSString * _Nullable maxErrors;

/**
 <p>The name of the SSM document that contains the configuration information for the instance. You can specify Command or Automation documents.</p><p>You can specify AWS-predefined documents, documents you created, or a document that is shared with you from another account.</p><p>For SSM documents that are shared with you from other AWS accounts, you must specify the complete SSM document ARN, in the following format:</p><p><code>arn:aws:ssm:<i>region</i>:<i>account-id</i>:document/<i>document-name</i></code></p><p>For example:</p><p><code>arn:aws:ssm:us-east-2:12345678912:document/My-Shared-Document</code></p><p>For AWS-predefined documents and SSM documents you created in your account, you only need to specify the document name. For example, <code>AWS-ApplyPatchBaseline</code> or <code>My-Document</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>An S3 bucket where you want to store the results of this request.</p>
 */
@property (nonatomic, strong) AWSSSMInstanceAssociationOutputLocation * _Nullable outputLocation;

/**
 <p>The parameters you want to update for the association. If you create a parameter using Parameter Store, you can reference the parameter using {{ssm:parameter-name}}</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSArray<NSString *> *> * _Nullable parameters;

/**
 <p>The cron expression used to schedule the association that you want to update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable scheduleExpression;

/**
 <p>The mode for generating association compliance. You can specify <code>AUTO</code> or <code>MANUAL</code>. In <code>AUTO</code> mode, the system uses the status of the association execution to determine the compliance status. If the association execution runs successfully, then the association is <code>COMPLIANT</code>. If the association execution doesn't run successfully, the association is <code>NON-COMPLIANT</code>.</p><p>In <code>MANUAL</code> mode, you must specify the <code>AssociationId</code> as a parameter for the <a>PutComplianceItems</a> API action. In this case, compliance data is not managed by State Manager. It is managed by your direct call to the <a>PutComplianceItems</a> API action.</p><p>By default, all associations use <code>AUTO</code> mode.</p>
 */
@property (nonatomic, assign) AWSSSMAssociationSyncCompliance syncCompliance;

/**
 <p>The targets of the association.</p>
 */
@property (nonatomic, strong) NSArray<AWSSSMTarget *> * _Nullable targets;

@end

/**
 
 */
@interface AWSSSMUpdateAssociationResult : AWSModel


/**
 <p>The description of the association that was updated.</p>
 */
@property (nonatomic, strong) AWSSSMAssociationDescription * _Nullable associationDescription;

@end

/**
 
 */
@interface AWSSSMUpdateAssociationStatusRequest : AWSRequest


/**
 <p>The association status.</p>
 */
@property (nonatomic, strong) AWSSSMAssociationStatus * _Nullable associationStatus;

/**
 <p>The ID of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The name of the Systems Manager document.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSSSMUpdateAssociationStatusResult : AWSModel


/**
 <p>Information about the association.</p>
 */
@property (nonatomic, strong) AWSSSMAssociationDescription * _Nullable associationDescription;

@end

/**
 
 */
@interface AWSSSMUpdateDocumentDefaultVersionRequest : AWSRequest


/**
 <p>The version of a custom document that you want to set as the default version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable documentVersion;

/**
 <p>The name of a custom document that you want to set as the default version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSSSMUpdateDocumentDefaultVersionResult : AWSModel


/**
 <p>The description of a custom document that you want to set as the default version.</p>
 */
@property (nonatomic, strong) AWSSSMDocumentDefaultVersionDescription * _Nullable detail;

@end

/**
 
 */
@interface AWSSSMUpdateDocumentRequest : AWSRequest


/**
 <p>A list of key and value pairs that describe attachments to a version of a document.</p>
 */
@property (nonatomic, strong) NSArray<AWSSSMAttachmentsSource *> * _Nullable attachments;

/**
 <p>A valid JSON or YAML string.</p>
 */
@property (nonatomic, strong) NSString * _Nullable content;

/**
 <p>Specify the document format for the new document version. Systems Manager supports JSON and YAML documents. JSON is the default format.</p>
 */
@property (nonatomic, assign) AWSSSMDocumentFormat documentFormat;

/**
 <p>(Required) The latest version of the document that you want to update. The latest document version can be specified using the $LATEST variable or by the version number. Updating a previous version of a document is not supported.</p>
 */
@property (nonatomic, strong) NSString * _Nullable documentVersion;

/**
 <p>The name of the document that you want to update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>Specify a new target type for the document.</p>
 */
@property (nonatomic, strong) NSString * _Nullable targetType;

/**
 <p>An optional field specifying the version of the artifact you are updating with the document. For example, "Release 12, Update 6". This value is unique across all versions of a document, and cannot be changed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable versionName;

@end

/**
 
 */
@interface AWSSSMUpdateDocumentResult : AWSModel


/**
 <p>A description of the document that was updated.</p>
 */
@property (nonatomic, strong) AWSSSMDocumentDescription * _Nullable documentDescription;

@end

/**
 
 */
@interface AWSSSMUpdateMaintenanceWindowRequest : AWSRequest


/**
 <p>Whether targets must be registered with the maintenance window before tasks can be defined for those targets.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable allowUnassociatedTargets;

/**
 <p>The number of hours before the end of the maintenance window that Systems Manager stops scheduling new tasks for execution.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable cutoff;

/**
 <p>An optional description for the update request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The duration of the maintenance window in hours.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable duration;

/**
 <p>Whether the maintenance window is enabled.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

/**
 <p>The date and time, in ISO-8601 Extended format, for when you want the maintenance window to become inactive. EndDate allows you to set a date and time in the future when the maintenance window will no longer run.</p>
 */
@property (nonatomic, strong) NSString * _Nullable endDate;

/**
 <p>The name of the maintenance window.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>If True, then all fields that are required by the CreateMaintenanceWindow action are also required for this API request. Optional fields that are not specified are set to null. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable replace;

/**
 <p>The schedule of the maintenance window in the form of a cron or rate expression.</p>
 */
@property (nonatomic, strong) NSString * _Nullable schedule;

/**
 <p>The number of days to wait after the date and time specified by a CRON expression before running the maintenance window.</p><p>For example, the following cron expression schedules a maintenance window to run the third Tuesday of every month at 11:30 PM.</p><p><code>cron(0 30 23 ? * TUE#3 *)</code></p><p>If the schedule offset is <code>2</code>, the maintenance window won't run until two days later.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable scheduleOffset;

/**
 <p>The time zone that the scheduled maintenance window executions are based on, in Internet Assigned Numbers Authority (IANA) format. For example: "America/Los_Angeles", "etc/UTC", or "Asia/Seoul". For more information, see the <a href="https://www.iana.org/time-zones">Time Zone Database</a> on the IANA website.</p>
 */
@property (nonatomic, strong) NSString * _Nullable scheduleTimezone;

/**
 <p>The time zone that the scheduled maintenance window executions are based on, in Internet Assigned Numbers Authority (IANA) format. For example: "America/Los_Angeles", "etc/UTC", or "Asia/Seoul". For more information, see the <a href="https://www.iana.org/time-zones">Time Zone Database</a> on the IANA website.</p>
 */
@property (nonatomic, strong) NSString * _Nullable startDate;

/**
 <p>The ID of the maintenance window to update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable windowId;

@end

/**
 
 */
@interface AWSSSMUpdateMaintenanceWindowResult : AWSModel


/**
 <p>Whether targets must be registered with the maintenance window before tasks can be defined for those targets.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable allowUnassociatedTargets;

/**
 <p>The number of hours before the end of the maintenance window that Systems Manager stops scheduling new tasks for execution.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable cutoff;

/**
 <p>An optional description of the update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The duration of the maintenance window in hours.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable duration;

/**
 <p>Whether the maintenance window is enabled.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

/**
 <p>The date and time, in ISO-8601 Extended format, for when the maintenance window is scheduled to become inactive. The maintenance window will not run after this specified time.</p>
 */
@property (nonatomic, strong) NSString * _Nullable endDate;

/**
 <p>The name of the maintenance window.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The schedule of the maintenance window in the form of a cron or rate expression.</p>
 */
@property (nonatomic, strong) NSString * _Nullable schedule;

/**
 <p>The number of days to wait to run a maintenance window after the scheduled CRON expression date and time.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable scheduleOffset;

/**
 <p>The time zone that the scheduled maintenance window executions are based on, in Internet Assigned Numbers Authority (IANA) format. For example: "America/Los_Angeles", "etc/UTC", or "Asia/Seoul". For more information, see the <a href="https://www.iana.org/time-zones">Time Zone Database</a> on the IANA website.</p>
 */
@property (nonatomic, strong) NSString * _Nullable scheduleTimezone;

/**
 <p>The date and time, in ISO-8601 Extended format, for when the maintenance window is scheduled to become active. The maintenance window will not run before this specified time.</p>
 */
@property (nonatomic, strong) NSString * _Nullable startDate;

/**
 <p>The ID of the created maintenance window.</p>
 */
@property (nonatomic, strong) NSString * _Nullable windowId;

@end

/**
 
 */
@interface AWSSSMUpdateMaintenanceWindowTargetRequest : AWSRequest


/**
 <p>An optional description for the update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>A name for the update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>User-provided value that will be included in any CloudWatch events raised while running tasks for these targets in this maintenance window.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ownerInformation;

/**
 <p>If True, then all fields that are required by the RegisterTargetWithMaintenanceWindow action are also required for this API request. Optional fields that are not specified are set to null.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable replace;

/**
 <p>The targets to add or replace.</p>
 */
@property (nonatomic, strong) NSArray<AWSSSMTarget *> * _Nullable targets;

/**
 <p>The maintenance window ID with which to modify the target.</p>
 */
@property (nonatomic, strong) NSString * _Nullable windowId;

/**
 <p>The target ID to modify.</p>
 */
@property (nonatomic, strong) NSString * _Nullable windowTargetId;

@end

/**
 
 */
@interface AWSSSMUpdateMaintenanceWindowTargetResult : AWSModel


/**
 <p>The updated description.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The updated name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The updated owner.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ownerInformation;

/**
 <p>The updated targets.</p>
 */
@property (nonatomic, strong) NSArray<AWSSSMTarget *> * _Nullable targets;

/**
 <p>The maintenance window ID specified in the update request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable windowId;

/**
 <p>The target ID specified in the update request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable windowTargetId;

@end

/**
 
 */
@interface AWSSSMUpdateMaintenanceWindowTaskRequest : AWSRequest


/**
 <p>The new task description to specify.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The new logging location in Amazon S3 to specify.</p><note><p><code>LoggingInfo</code> has been deprecated. To specify an S3 bucket to contain logs, instead use the <code>OutputS3BucketName</code> and <code>OutputS3KeyPrefix</code> options in the <code>TaskInvocationParameters</code> structure. For information about how Systems Manager handles these options for the supported maintenance window task types, see <a>MaintenanceWindowTaskInvocationParameters</a>.</p></note>
 */
@property (nonatomic, strong) AWSSSMLoggingInfo * _Nullable loggingInfo;

/**
 <p>The new <code>MaxConcurrency</code> value you want to specify. <code>MaxConcurrency</code> is the number of targets that are allowed to run this task in parallel.</p>
 */
@property (nonatomic, strong) NSString * _Nullable maxConcurrency;

/**
 <p>The new <code>MaxErrors</code> value to specify. <code>MaxErrors</code> is the maximum number of errors that are allowed before the task stops being scheduled.</p>
 */
@property (nonatomic, strong) NSString * _Nullable maxErrors;

/**
 <p>The new task name to specify.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The new task priority to specify. The lower the number, the higher the priority. Tasks that have the same priority are scheduled in parallel.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable priority;

/**
 <p>If True, then all fields that are required by the RegisterTaskWithMaintenanceWndow action are also required for this API request. Optional fields that are not specified are set to null.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable replace;

/**
 <p>The ARN of the IAM service role for Systems Manager to assume when running a maintenance window task. If you do not specify a service role ARN, Systems Manager uses your account's service-linked role. If no service-linked role for Systems Manager exists in your account, it is created when you run <code>RegisterTaskWithMaintenanceWindow</code>.</p><p>For more information, see the following topics in the in the <i>AWS Systems Manager User Guide</i>:</p><ul><li><p><a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/using-service-linked-roles.html#slr-permissions">Using service-linked roles for Systems Manager</a></p></li><li><p><a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/sysman-maintenance-permissions.html#maintenance-window-tasks-service-role">Should I use a service-linked role or a custom service role to run maintenance window tasks? </a></p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable serviceRoleArn;

/**
 <p>The targets (either instances or tags) to modify. Instances are specified using Key=instanceids,Values=instanceID_1,instanceID_2. Tags are specified using Key=tag_name,Values=tag_value. </p>
 */
@property (nonatomic, strong) NSArray<AWSSSMTarget *> * _Nullable targets;

/**
 <p>The task ARN to modify.</p>
 */
@property (nonatomic, strong) NSString * _Nullable taskArn;

/**
 <p>The parameters that the task should use during execution. Populate only the fields that match the task type. All other fields should be empty.</p>
 */
@property (nonatomic, strong) AWSSSMMaintenanceWindowTaskInvocationParameters * _Nullable taskInvocationParameters;

/**
 <p>The parameters to modify.</p><note><p><code>TaskParameters</code> has been deprecated. To specify parameters to pass to a task when it runs, instead use the <code>Parameters</code> option in the <code>TaskInvocationParameters</code> structure. For information about how Systems Manager handles these options for the supported maintenance window task types, see <a>MaintenanceWindowTaskInvocationParameters</a>.</p></note><p>The map has the following format:</p><p>Key: string, between 1 and 255 characters</p><p>Value: an array of strings, each string is between 1 and 255 characters</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSSSMMaintenanceWindowTaskParameterValueExpression *> * _Nullable taskParameters;

/**
 <p>The maintenance window ID that contains the task to modify.</p>
 */
@property (nonatomic, strong) NSString * _Nullable windowId;

/**
 <p>The task ID to modify.</p>
 */
@property (nonatomic, strong) NSString * _Nullable windowTaskId;

@end

/**
 
 */
@interface AWSSSMUpdateMaintenanceWindowTaskResult : AWSModel


/**
 <p>The updated task description.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The updated logging information in Amazon S3.</p><note><p><code>LoggingInfo</code> has been deprecated. To specify an S3 bucket to contain logs, instead use the <code>OutputS3BucketName</code> and <code>OutputS3KeyPrefix</code> options in the <code>TaskInvocationParameters</code> structure. For information about how Systems Manager handles these options for the supported maintenance window task types, see <a>MaintenanceWindowTaskInvocationParameters</a>.</p></note>
 */
@property (nonatomic, strong) AWSSSMLoggingInfo * _Nullable loggingInfo;

/**
 <p>The updated MaxConcurrency value.</p>
 */
@property (nonatomic, strong) NSString * _Nullable maxConcurrency;

/**
 <p>The updated MaxErrors value.</p>
 */
@property (nonatomic, strong) NSString * _Nullable maxErrors;

/**
 <p>The updated task name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The updated priority value.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable priority;

/**
 <p>The ARN of the IAM service role to use to publish Amazon Simple Notification Service (Amazon SNS) notifications for maintenance window Run Command tasks.</p>
 */
@property (nonatomic, strong) NSString * _Nullable serviceRoleArn;

/**
 <p>The updated target values.</p>
 */
@property (nonatomic, strong) NSArray<AWSSSMTarget *> * _Nullable targets;

/**
 <p>The updated task ARN value.</p>
 */
@property (nonatomic, strong) NSString * _Nullable taskArn;

/**
 <p>The updated parameter values.</p>
 */
@property (nonatomic, strong) AWSSSMMaintenanceWindowTaskInvocationParameters * _Nullable taskInvocationParameters;

/**
 <p>The updated parameter values.</p><note><p><code>TaskParameters</code> has been deprecated. To specify parameters to pass to a task when it runs, instead use the <code>Parameters</code> option in the <code>TaskInvocationParameters</code> structure. For information about how Systems Manager handles these options for the supported maintenance window task types, see <a>MaintenanceWindowTaskInvocationParameters</a>.</p></note>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSSSMMaintenanceWindowTaskParameterValueExpression *> * _Nullable taskParameters;

/**
 <p>The ID of the maintenance window that was updated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable windowId;

/**
 <p>The task ID of the maintenance window that was updated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable windowTaskId;

@end

/**
 
 */
@interface AWSSSMUpdateManagedInstanceRoleRequest : AWSRequest


/**
 <p>The IAM role you want to assign or change.</p>
 */
@property (nonatomic, strong) NSString * _Nullable iamRole;

/**
 <p>The ID of the managed instance where you want to update the role.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

@end

/**
 
 */
@interface AWSSSMUpdateManagedInstanceRoleResult : AWSModel


@end

/**
 
 */
@interface AWSSSMUpdateOpsItemRequest : AWSRequest


/**
 <p>Specify a new category for an OpsItem.</p>
 */
@property (nonatomic, strong) NSString * _Nullable category;

/**
 <p>Update the information about the OpsItem. Provide enough information so that users reading this OpsItem for the first time understand the issue. </p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The Amazon Resource Name (ARN) of an SNS topic where notifications are sent when this OpsItem is edited or changed.</p>
 */
@property (nonatomic, strong) NSArray<AWSSSMOpsItemNotification *> * _Nullable notifications;

/**
 <p>Add new keys or edit existing key-value pairs of the OperationalData map in the OpsItem object.</p><p>Operational data is custom data that provides useful reference details about the OpsItem. For example, you can specify log files, error strings, license keys, troubleshooting tips, or other relevant data. You enter operational data as key-value pairs. The key has a maximum length of 128 characters. The value has a maximum size of 20 KB.</p><important><p>Operational data keys <i>can't</i> begin with the following: amazon, aws, amzn, ssm, /amazon, /aws, /amzn, /ssm.</p></important><p>You can choose to make the data searchable by other users in the account or you can restrict search access. Searchable data means that all users with access to the OpsItem Overview page (as provided by the <a>DescribeOpsItems</a> API action) can view and search on the specified data. Operational data that is not searchable is only viewable by users who have access to the OpsItem (as provided by the <a>GetOpsItem</a> API action).</p><p>Use the <code>/aws/resources</code> key in OperationalData to specify a related resource in the request. Use the <code>/aws/automations</code> key in OperationalData to associate an Automation runbook with the OpsItem. To view AWS CLI example commands that use these keys, see <a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter-creating-OpsItems.html#OpsCenter-manually-create-OpsItems">Creating OpsItems manually</a> in the <i>AWS Systems Manager User Guide</i>.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSSSMOpsItemDataValue *> * _Nullable operationalData;

/**
 <p>Keys that you want to remove from the OperationalData map.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable operationalDataToDelete;

/**
 <p>The ID of the OpsItem.</p>
 */
@property (nonatomic, strong) NSString * _Nullable opsItemId;

/**
 <p>The importance of this OpsItem in relation to other OpsItems in the system.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable priority;

/**
 <p>One or more OpsItems that share something in common with the current OpsItems. For example, related OpsItems can include OpsItems with similar error messages, impacted resources, or statuses for the impacted resource.</p>
 */
@property (nonatomic, strong) NSArray<AWSSSMRelatedOpsItem *> * _Nullable relatedOpsItems;

/**
 <p>Specify a new severity for an OpsItem.</p>
 */
@property (nonatomic, strong) NSString * _Nullable severity;

/**
 <p>The OpsItem status. Status can be <code>Open</code>, <code>In Progress</code>, or <code>Resolved</code>. For more information, see <a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter-working-with-OpsItems.html#OpsCenter-working-with-OpsItems-editing-details">Editing OpsItem details</a> in the <i>AWS Systems Manager User Guide</i>.</p>
 */
@property (nonatomic, assign) AWSSSMOpsItemStatus status;

/**
 <p>A short heading that describes the nature of the OpsItem and the impacted resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable title;

@end

/**
 
 */
@interface AWSSSMUpdateOpsItemResponse : AWSModel


@end

/**
 
 */
@interface AWSSSMUpdatePatchBaselineRequest : AWSRequest


/**
 <p>A set of rules used to include patches in the baseline.</p>
 */
@property (nonatomic, strong) AWSSSMPatchRuleGroup * _Nullable approvalRules;

/**
 <p>A list of explicitly approved patches for the baseline.</p><p>For information about accepted formats for lists of approved patches and rejected patches, see <a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/patch-manager-approved-rejected-package-name-formats.html">About package name formats for approved and rejected patch lists</a> in the <i>AWS Systems Manager User Guide</i>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable approvedPatches;

/**
 <p>Assigns a new compliance severity level to an existing patch baseline.</p>
 */
@property (nonatomic, assign) AWSSSMPatchComplianceLevel approvedPatchesComplianceLevel;

/**
 <p>Indicates whether the list of approved patches includes non-security updates that should be applied to the instances. The default value is 'false'. Applies to Linux instances only.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable approvedPatchesEnableNonSecurity;

/**
 <p>The ID of the patch baseline to update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable baselineId;

/**
 <p>A description of the patch baseline.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>A set of global filters used to include patches in the baseline.</p>
 */
@property (nonatomic, strong) AWSSSMPatchFilterGroup * _Nullable globalFilters;

/**
 <p>The name of the patch baseline.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>A list of explicitly rejected patches for the baseline.</p><p>For information about accepted formats for lists of approved patches and rejected patches, see <a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/patch-manager-approved-rejected-package-name-formats.html">About package name formats for approved and rejected patch lists</a> in the <i>AWS Systems Manager User Guide</i>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable rejectedPatches;

/**
 <p>The action for Patch Manager to take on patches included in the RejectedPackages list.</p><ul><li><p><b>ALLOW_AS_DEPENDENCY</b>: A package in the Rejected patches list is installed only if it is a dependency of another package. It is considered compliant with the patch baseline, and its status is reported as <i>InstalledOther</i>. This is the default action if no option is specified.</p></li><li><p><b>BLOCK</b>: Packages in the RejectedPatches list, and packages that include them as dependencies, are not installed under any circumstances. If a package was installed before it was added to the Rejected patches list, it is considered non-compliant with the patch baseline, and its status is reported as <i>InstalledRejected</i>.</p></li></ul>
 */
@property (nonatomic, assign) AWSSSMPatchAction rejectedPatchesAction;

/**
 <p>If True, then all fields that are required by the CreatePatchBaseline action are also required for this API request. Optional fields that are not specified are set to null.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable replace;

/**
 <p>Information about the patches to use to update the instances, including target operating systems and source repositories. Applies to Linux instances only.</p>
 */
@property (nonatomic, strong) NSArray<AWSSSMPatchSource *> * _Nullable sources;

@end

/**
 
 */
@interface AWSSSMUpdatePatchBaselineResult : AWSModel


/**
 <p>A set of rules used to include patches in the baseline.</p>
 */
@property (nonatomic, strong) AWSSSMPatchRuleGroup * _Nullable approvalRules;

/**
 <p>A list of explicitly approved patches for the baseline.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable approvedPatches;

/**
 <p>The compliance severity level assigned to the patch baseline after the update completed.</p>
 */
@property (nonatomic, assign) AWSSSMPatchComplianceLevel approvedPatchesComplianceLevel;

/**
 <p>Indicates whether the list of approved patches includes non-security updates that should be applied to the instances. The default value is 'false'. Applies to Linux instances only.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable approvedPatchesEnableNonSecurity;

/**
 <p>The ID of the deleted patch baseline.</p>
 */
@property (nonatomic, strong) NSString * _Nullable baselineId;

/**
 <p>The date when the patch baseline was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdDate;

/**
 <p>A description of the Patch Baseline.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>A set of global filters used to exclude patches from the baseline.</p>
 */
@property (nonatomic, strong) AWSSSMPatchFilterGroup * _Nullable globalFilters;

/**
 <p>The date when the patch baseline was last modified.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable modifiedDate;

/**
 <p>The name of the patch baseline.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The operating system rule used by the updated patch baseline.</p>
 */
@property (nonatomic, assign) AWSSSMOperatingSystem operatingSystem;

/**
 <p>A list of explicitly rejected patches for the baseline.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable rejectedPatches;

/**
 <p>The action specified to take on patches included in the RejectedPatches list. A patch can be allowed only if it is a dependency of another package, or blocked entirely along with packages that include it as a dependency.</p>
 */
@property (nonatomic, assign) AWSSSMPatchAction rejectedPatchesAction;

/**
 <p>Information about the patches to use to update the instances, including target operating systems and source repositories. Applies to Linux instances only.</p>
 */
@property (nonatomic, strong) NSArray<AWSSSMPatchSource *> * _Nullable sources;

@end

/**
 
 */
@interface AWSSSMUpdateResourceDataSyncRequest : AWSRequest


/**
 <p>The name of the resource data sync you want to update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable syncName;

/**
 <p>Specify information about the data sources to synchronize.</p>
 */
@property (nonatomic, strong) AWSSSMResourceDataSyncSource * _Nullable syncSource;

/**
 <p>The type of resource data sync. The supported <code>SyncType</code> is SyncFromSource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable syncType;

@end

/**
 
 */
@interface AWSSSMUpdateResourceDataSyncResult : AWSModel


@end

/**
 <p>The request body of the UpdateServiceSetting API action.</p>
 Required parameters: [SettingId, SettingValue]
 */
@interface AWSSSMUpdateServiceSettingRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the service setting to reset. For example, <code>arn:aws:ssm:us-east-1:111122223333:servicesetting/ssm/parameter-store/high-throughput-enabled</code>. The setting ID can be one of the following.</p><ul><li><p><code>/ssm/parameter-store/default-parameter-tier</code></p></li><li><p><code>/ssm/parameter-store/high-throughput-enabled</code></p></li><li><p><code>/ssm/managed-instance/activation-tier</code></p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable settingId;

/**
 <p>The new value to specify for the service setting. For the <code>/ssm/parameter-store/default-parameter-tier</code> setting ID, the setting value can be one of the following.</p><ul><li><p>Standard</p></li><li><p>Advanced</p></li><li><p>Intelligent-Tiering</p></li></ul><p>For the <code>/ssm/parameter-store/high-throughput-enabled</code>, and <code>/ssm/managed-instance/activation-tier</code> setting IDs, the setting value can be true or false.</p>
 */
@property (nonatomic, strong) NSString * _Nullable settingValue;

@end

/**
 <p>The result body of the UpdateServiceSetting API action.</p>
 */
@interface AWSSSMUpdateServiceSettingResult : AWSModel


@end

NS_ASSUME_NONNULL_END
